Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A13D0BB4D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 01:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BGN/wG5mPauv/lMeMUM0L+kgPwg/L3mUNouI7PoR+w=; b=bWGOCKdLO7t1B08lpPORlPgnbp
	tO12BkgxO3Rqiqj6fshHnWj3otWqAwnBGKIMmj/nkjf7l55r2x6Il8xM/tPKDlLwGdJUzTGrq7Oia
	N++5mBXtpzKBy4Q4e7K6Piy+oWGZMRAd3jVytPTk21eutpgRVllfVErX6aJ8r30T9ueuhZBTOsCyd
	M827Qyb5nop022QbL5LhErADc3gWdxIE5zwDu6x7zmLj3WttoFcXdT20O+8xYW6yGfZpHPdO6dIpK
	iP+GGf+D0utbS/q3i3tqpv8TV9zj/s7CmC71udXYVnXBqcyfbOrdwwliKvjX/IreabQUkjW1kVIVP
	d9U+zy6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3n1N-0000000GSnx-2eOU;
	Thu, 24 Oct 2024 01:52:17 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3mzp-0000000GSft-3YQU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 01:50:43 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2e2e23f2931so345032a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 18:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729734640; x=1730339440; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3BGN/wG5mPauv/lMeMUM0L+kgPwg/L3mUNouI7PoR+w=;
        b=hKo59y7evUFtmXFu1oj/8OOLroD6K8An75A66JQpIRjbyJbDrVZsRpfDvS3oDr0ag7
         7/69rINFilB01s+4HamjQZrSacKf6LnXHyQTqw2INfxBaBv8IgjnREP9Xx32h4lxVN1y
         pWUo7Q5tq1Y+k6rJ1JxQhdt88R2Dk+dPSfJoEoQOeSn4GFJE5hWQG0QqRuDhPRXxZOQo
         0WZfYZsJciLJ4jYlve+praWLcznc7VCm8CusLFTAQSXzq0kHYlJ5RfNJrdMvFgVtVcA+
         tl1dfsgrwH9UUw7wYczeCVz/2JfZaODFdlZ/F5alwJGKNthNRouoapGfe9rt0ksJgbx1
         i04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729734640; x=1730339440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3BGN/wG5mPauv/lMeMUM0L+kgPwg/L3mUNouI7PoR+w=;
        b=WqCN+0ZRSwTVJldxvtJEHuZIKOPAcZgLRU7Ks6NyDsCY4x5y83RGfwI8+H2+aapY9v
         zQkc7nvdsPPMp3W1AvysV4UDDIL+K1CufNLympjUtUJmd3P8HIkldvJAZTs2ecxkOAU8
         0soKm7zJEVQ5QGe1TOITyOQ4faeVinkAJTFtp6NWPOIaaETqKyOwqWviyMdpLr7qKpD9
         2ThX4YU8izEOIarilncxW7A62DHJA62gr5kAo7uAHsmMznDOmDu2Wx9RgYofBJX1+QNo
         GI/8FtS8yNJBMoyy/ZojazorijgRKKStM5Pw1YDU4NJe2H8zKJXQOFWcbiaargdhIEIe
         Zk1w==
X-Forwarded-Encrypted: i=1; AJvYcCXuIFrMBERVe2CqwLa0UPNBMrcwC+y6jh+RpkBzl+taVSFgTR3qVXqEr29OTjCd7B79jSrZsAiNiHBQT2wfCQUa@lists.infradead.org
X-Gm-Message-State: AOJu0YwYpCZpPQWXkUU+Hzd4x+v5G9BamOJdEGZ1TaBIEhpjlfOL6JxA
	OF+4Ve4SzDpWfnZ3DPUeihzuXms/PFbmuoz1w/0MiWhKUXOwbKy3
X-Google-Smtp-Source: AGHT+IFzf+/5m94efCTT5fJp3X8/qjsyvdbonIYb2YgutuSqnskEo4jYjgWg+CZKCmEbgIhIH1sObg==
X-Received: by 2002:a17:90a:8c08:b0:2e2:d181:6809 with SMTP id 98e67ed59e1d1-2e76b70b2d4mr5006884a91.39.1729734640447;
        Wed, 23 Oct 2024 18:50:40 -0700 (PDT)
Received: from [172.19.1.42] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e534efesm184312a91.33.2024.10.23.18.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 18:50:40 -0700 (PDT)
Message-ID: <c32fee1b-3961-4cf1-92fd-14b17a0caf40@gmail.com>
Date: Thu, 24 Oct 2024 09:50:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
To: Sean Young <sean@mess.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, cwweng@nuvoton.com
References: <20241023111841.158049-1-cwweng.linux@gmail.com>
 <20241023111841.158049-3-cwweng.linux@gmail.com>
 <1087f21b-d56b-4ab0-bb56-96096c23f0d8@linaro.org>
 <Zxj8C46QeSt3sboN@gofer.mess.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <Zxj8C46QeSt3sboN@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_185041_912328_04D4232F 
X-CRM114-Status: GOOD (  10.23  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Sean,

Thank you for your reply.


On 2024/10/23 下午 09:37, Sean Young wrote:
> On Wed, Oct 23, 2024 at 02:02:14PM +0200, Krzysztof Kozlowski wrote:
>> On 23/10/2024 13:18, Chi-Wen Weng wrote:
>>> This commit adds a generic PWM framework driver for Nuvoton MA35D1
>>> PWM controller.
>>>
>>> Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Reviewed-by: Sean Young <sean@mess.org>
>>> Reviewed-by: "Uwe Kleine-Konig" <ukleinek@kernel.org>
>> NAK.
>>
>> Stop adding fake tags.
> I never sent a Reviewed-by either.
>
> Please re-send without those tags.
>
>
> Sean
Sorry. I will re-send without those tags.

Thanks.
Chi-Wen Weng



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FE7D0BB4C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 01:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uiJxTc/Px6OxDE7VwWmByvD/Jg1LJ6kQk2LZwhNTe48=; b=vyVrEAXQaXXtpLoVKU92BcPKl2
	fNT1gflqOZAXlsXnL+9HSWWl+nKIrhuR/4coCWqFv9T2N8cQvEpQDAC/9G1TRAFZyn1D0HpNvWgBp
	dcfFQTcgfuSxJBCyE9c+gZETqolbbZ+Xay8UUoQIhd16arcXpkVH1dmW52bZfZfWdIHQaEItwSKCs
	3NOyYU94tCFWthsWR2TcpNRUpOZY8TupiNBC8GV5tKPhPZKKdELTE17rHNroIRCyNzFvIA3SwAh+4
	9iP8+PRM9mNZl4wc+WijKydNwCXHTk1bpLQ968Z3tewnLbUZmY16Dg9PZxn0R4BWXBJeAGnE7g5wp
	+j8pvbfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3muY-0000000GSGn-1asA;
	Thu, 24 Oct 2024 01:45:14 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3mt0-0000000GS90-3lGE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 01:43:40 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e2c6bc4840so337939a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 18:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729734218; x=1730339018; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uiJxTc/Px6OxDE7VwWmByvD/Jg1LJ6kQk2LZwhNTe48=;
        b=fGAEjlIaNqAqI7qsCUnt1PX6BNADGthsFvnG9/RRkmABKTyMm/5HOQOqexi+R3fAck
         2scYIz2CZ1XhAmlxgH2xpQQg3yWY+9jxGPfPniO5fVd629gZXy1iyo8uJSXmb6nnWQI+
         ozGlc4OBuluPTeRIR28nUaHHOnOg3orbl4eP6KhTGDzY1fh1R+C+lnsIprzhS2w94Wct
         RXOz2EJPt25oHV5efcN5ZzQCMUdVjAMuTzwyvJNJoU3BoSoKZZkpJAxo2rjORYtJHMik
         hiWkuO/PYaWiMSYRWO6vCUT+60eUru8YTCMLqZeJjF/XgUr+Ze+0rmdymBMW8TRRFQij
         LeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729734218; x=1730339018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uiJxTc/Px6OxDE7VwWmByvD/Jg1LJ6kQk2LZwhNTe48=;
        b=MKKiXtE4LviVc8XgYpzgEe2yN/hsuShA8HbFeswzRXBcDJiR16Xr1n/wg/NUTwqTo1
         eXUYxIH+spWvLkdxN/cJBzItJZ3n8E52m/Y/tt9TeJev6CkHVEM01FQafmhLTuOJxehl
         V1YM3DJJGYEDNnQTLdUZ24Q4+1wB6X5wkVqakpXN3GsXV4Ks7K5Phu0JC3Bgx4k3ljqK
         8QU8OKbCN4TejXNIeB/4w7WAq6d+9Iq9kZLUIa5DRj1nJLJN/7aWGb7bYrnkUdlQ8ene
         ExOnVUhucCz6/f90K1kys0seZWYMQJIu1c2tT5FuRZav/pHncgQlpQCBHWH6pmbJd2Mp
         wQzg==
X-Gm-Message-State: AOJu0YyTRRVuKxFyPi3iF3zo7WFVJB8Z78KXABjb2hkqRaF/Up8B1pE5
	TEaKFIN6xQU0bi5s6IC2D91dq97VvuPgMqHh2Zc5YAhFtuMZSzXo
X-Google-Smtp-Source: AGHT+IF5IFwQmeo36Myq+rqWB1r2VH+1fK3KEPPTGP8CBe2t6JWt7y/eFWA1OKHXVbzhnx+sn2bUzw==
X-Received: by 2002:a05:6a21:2d8b:b0:1d9:3957:8c24 with SMTP id adf61e73a8af0-1d978b39ee6mr4657695637.21.1729734217802;
        Wed, 23 Oct 2024 18:43:37 -0700 (PDT)
Received: from [172.19.1.42] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1407f55sm6950187b3a.203.2024.10.23.18.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 18:43:37 -0700 (PDT)
Message-ID: <c92fe27f-67e0-4c5c-a3f1-b4cdd0eb0b5a@gmail.com>
Date: Thu, 24 Oct 2024 09:43:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: nuvoton: Add MA35D1 pwm
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 cwweng@nuvoton.com
References: <20241023111841.158049-1-cwweng.linux@gmail.com>
 <20241023111841.158049-2-cwweng.linux@gmail.com>
 <e0e4c2c9-7333-435e-88a9-129764092157@linaro.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <e0e4c2c9-7333-435e-88a9-129764092157@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_184338_959341_81294F7B 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

Hi Krzysztof,

Thank you for your reply.

On 2024/10/23 下午 08:02, Krzysztof Kozlowski wrote:
> On 23/10/2024 13:18, Chi-Wen Weng wrote:
>> Add dt-bindings for Nuvoton MA35D1 SoC PWM controller.
>>
>> Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Really? Where?

I'm very sorry I misunderstood the meaning of "Reviewed-by".

I will resend patch v2.

>
> Best regards,
> Krzysztof

Thanks.

Chi-Wen Weng




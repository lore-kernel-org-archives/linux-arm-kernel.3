Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A291EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 20:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y80nSXH6gqqrmRGM3IsXoDQwjoa1+dDg8jnx+cu1UCA=; b=hmXiihsbNKSdXwPIfcrOBL3REg
	95L6Fd83UKjH4oTRHmmfcnI/biL/HHeHp27THJdiUZU+D1bsHpgNpi5wl1AkerVbr/TBKhKb4e8hS
	whMF/FEACvENlbbih8JgYk/VKFvmHrUy33eUYTIgApcpZVsJbbHX5nq+KinkVIAYeDe5RIK1aJ/DU
	yeONTnmjz2DBSL0z9z2XPVTliv+ZA7FSuiGO4IUdcSL++WeFGsqYH2Ckm63sLh1qqDV0dY2tfLuAj
	u44Ac/NDoa0+GIYvGhqfov9IqaecsrRR34sj1L81tahtekG+HK3/Jgz/7ewFnmadUw+0aRF2OIGZ1
	iA5YKcpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tspMM-0000000CSQc-2leK;
	Thu, 13 Mar 2025 20:40:54 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tspKh-0000000CSIu-1LoN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 20:39:12 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso264187166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 13:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741898349; x=1742503149; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y80nSXH6gqqrmRGM3IsXoDQwjoa1+dDg8jnx+cu1UCA=;
        b=iBZOWROec755wz++2XSm3ofJoctowC2cVuBn9WWREhgR11k/rJnFxHEmALAu5SJlkv
         hfJMQuhNW34dZDqegIp6rsk+qyFz8zb78p/ojs5WCe700BZXv/kFlVHbVOxk74RS/5Q5
         lDcavgpJSMIg+4bMR4ftJCdvYfhMXTU6ZHSg5IFrnU7REmYDrIUaATHDXGmnOoIQoD9y
         ugVY6J9BTzahxchqetHB1lKdraPC4PB3mCLhaQW3osWWd5Lz8RbdPVFzW1g9bf3ZRwiQ
         iThNUxL+b5JA1MFcYGuT/3VoewjjeaLlrP2uX1itzLxzC40odbHlMkTPvpBgSZzZ58uZ
         96RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741898349; x=1742503149;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y80nSXH6gqqrmRGM3IsXoDQwjoa1+dDg8jnx+cu1UCA=;
        b=V8OZTwjQ0j3QJeW8F0WBjYdc9QVQhyaVFWroq0WwLjlkSV2u6M8KmAnQBx0RHy8Xuu
         xPBZl2iedD9I8qfHjuOSr/PXZEkllTSdLzc/2LsQEnMCmDoNtDRGZyNiOF2UMOOekLz4
         Sx0j6jI0pjODMojkNSlU6e7WIAyl83uu3Pa+gciB8W8maBxW3aXDzxkVkTOmfCz/ehNl
         rWE/hFVCssU0gx9lVu2dPnPK1FjMnlggB3CAWDJPvq0+1sn90z+n1pP3v4TJ44ZuMjFG
         cKMGmFk38kCW9hFf25G9EXymTtE+dEYKlSoNGBSbSD/8eA+WHBufE45PaiOdOvnXk+ag
         f+7w==
X-Forwarded-Encrypted: i=1; AJvYcCVP9xl/tV5Zcsx4pVgbZokqg7C03YTLjYaE4I/F1EuWDH5NdjN6OEOSZSx+n85kOXlKIjyvAPv8C1DbLXOQAs29@lists.infradead.org
X-Gm-Message-State: AOJu0YwOjC4iR7ekytW3Gs4RESX8QxczeD/pAZgfWGS8tkIqDJcs0OOW
	ygLtc/I4ayLkeZDzBQEy9ngho3NocVzuGlLBIZ6KN//au3Ljx0hT
X-Gm-Gg: ASbGncsr4mhlBkLtGvLuY3u/ISX5EZDBJam9KO9zEP7KAyFw/4rfW1NsTeT6qnQcaT/
	QKXV5YgZVAQJq5To7kJjy/OdvR8AWkx+2z7nYblRMVVv9T3OdP/xhIFF4aCY+dg52alpdquHwyr
	s1kJaB4aFPBTz5GPrLCs40OfCEALSc4ihAELa2on5GefJhBnPyoDNNo/ZOAH+qFEXBCNzpWo/iu
	sHNI9qHpgtF2qBVdUkijhVJqMuu5abQUw2AaXrDF1+zlQaFEV0wiLWSPMZiW6fKeDTqVU0nz/OS
	gV2395/k4Prwn/k7f9YqKuvXEthygxfMOYNA4e8F6Wyq3MPOmB2AUX1EyuJ92FFv5HdvAZV7051
	mPXPs1/xEaH80KHobP0b00g==
X-Google-Smtp-Source: AGHT+IGgXzCvFKIwuNzp9fqTkDSNxicFmg1nWVCw8cSfyB1nRxtqRIguRpztRQZovtRqtEoojZxR6A==
X-Received: by 2002:a17:906:a297:b0:ac3:14e1:27a5 with SMTP id a640c23a62f3a-ac314e128d6mr343436266b.1.1741898349044;
        Thu, 13 Mar 2025 13:39:09 -0700 (PDT)
Received: from [192.168.50.244] (83.11.221.132.ipv4.supernova.orange.pl. [83.11.221.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a489c9sm122016566b.152.2025.03.13.13.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 13:39:08 -0700 (PDT)
Message-ID: <f363c1ce-8612-476e-a5d5-c3cb358bf50a@gmail.com>
Date: Thu, 13 Mar 2025 21:39:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] mfd: bcm590xx: Add PMU ID/revision parsing
 function
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
 <20250304-bcm59054-v6-6-ae8302358443@gmail.com>
 <20250313132036.GB3616286@google.com>
 <ef190ba8-a5c7-4a1a-90e6-2610de00e4ed@sirena.org.uk>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <ef190ba8-a5c7-4a1a-90e6-2610de00e4ed@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_133911_367343_6E6A2B5F 
X-CRM114-Status: GOOD (  13.19  )
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

On 13.03.2025 14:25, Mark Brown wrote:
> On Thu, Mar 13, 2025 at 01:20:36PM +0000, Lee Jones wrote:
>> On Tue, 04 Mar 2025, Artur Weber wrote:
> 
>>> +	if (id != bcm590xx->pmu_id) {
>>> +		dev_err(bcm590xx->dev,
>>> +			"Incorrect ID for %s: expected %x, got %x. Check your DT compatible.\n",
>>
>> Isn't it more likely that the H/W this is being executed on is
>> unsupported?  If so, say that instead.
> 
> Given that the compatibles are device specific the driver shouldn't be
> binding if the device is unsupported.

Yes, the intention here is just to make sure that the DT compatible and
hardware ID match. Unsupported hardware would not have a DT compatible.

Best regards
Artur


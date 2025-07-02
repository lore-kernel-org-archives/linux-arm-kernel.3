Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B446C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iF2pwmDnVnBgNlC3R2Sp9Qq8gNWHcSlx8oSPJnFeIBg=; b=ZiwMTHDZVlz9vmYCgf5dTv9UFC
	3OfZjWf+GQs2HdIRXYuEyFRKGLRl1opJAZWCqpEepzFRdiP9adXL+wGXVsENJOUSUye2ckR4wseDB
	wRC9mBOSfXVuUMR8lxRskehCk+WoLeTNC6b7YJF5TV38w/QB7WK0GLUdFdZS68bQIsGTWlxnoDmNn
	uau1zjOniKqfhIgH0QA4uXx5FokcSUY6j5ViJCdhhq0OVeEVCDD0YDkAkFsab5+eInV8Zw0sZEbq9
	xBICGiHuHgM0BiF3buKFSY65iLxT9qktGDLaL0V+4+rXpVZaPAAFDSP1OQ17iPvhUUbUWRoAfSiXm
	BwHuEjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX217-00000009F8q-1xq9;
	Wed, 02 Jul 2025 18:17:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1yk-00000009Ekd-0q8x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:14:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-453749aef9eso28254345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 11:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751480080; x=1752084880; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iF2pwmDnVnBgNlC3R2Sp9Qq8gNWHcSlx8oSPJnFeIBg=;
        b=BB5cE8jyB7PcoIRyFEZXnmfKJDtuPkXvU2qx3A8pS0i7ZZDCo848oJRJD01uXpugZQ
         Offd3IDPMVw6vOZdlrQO4wghw4YeYPM68Nts7DPUFq5qqMO8R3mQApRhRNKMTCse2q2o
         UwNoVOQ6uC+IAh4Ap22l86ofFwu/TihxBWnIK1x53pix2okP8iI8NoPfNMPLNiz4XaJo
         O2VaEjzB+eWq5QB1tfAWTFUh6vLOFDI8shFZtNEOfwJ8zpxyOOJzLLd9RA6oGD8EQ/UD
         GDGw4/6AC8KC6fdDaYdNpUAD6wcOA2OUxtF24rbwlJ/oU4WS+T6b0+Wkq+EK8Z9l0BzY
         46gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751480080; x=1752084880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iF2pwmDnVnBgNlC3R2Sp9Qq8gNWHcSlx8oSPJnFeIBg=;
        b=f1cd9M0O4wYEfFgY4rrwYUO2OgsX/bUmVQ+ltrUVXdSMQuBPJAid1lwV2QjTGsddIh
         GBsS7q2uMOZefC2kVFN1eCT4vCHJHWemSDI90KR1LnxjaKEGA9N4hlBbwKeWlm3juIZB
         Eg2Q2uqpHnrr+Ga4Ig6KOnkDHOcPKklB/0hB9tk2LsiTJxy2f8x4B3yGPjpblQH8MG62
         OD//JJoQBRYhAN8TDYGeKfgxEX6sXtJbJW20v+mXyBGdHG8BsH5PnWcatTsGLQgdbz0z
         YOVMI1FSCUdn6RDW71UahFPl/XiBnIhIlvZgkA5SNb0krebsTeGFmnxyFL1JrA4r5XzE
         sq6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzT/uLASldNZf4s5glLc6q4zW5j6UmIJfpRZv2WAk8pzMVi0/HrTyqGeJnjc1kimoqiQX1rvtHaoXqCQyupYfc@lists.infradead.org
X-Gm-Message-State: AOJu0YzjfOTr5ETr6V5h3hCirySmIH9BB91xrrMRMKGfJKemNfPWqj81
	D+nmKc8MgGrIV7PvH5hz1+sGSXJs0MJVFMNrwPnnTl8uzY31SNmdDBxwk4gA7t2em20=
X-Gm-Gg: ASbGncviSEbhBMGuobKj8Fxycq+Bynkfj/wHWzWZT2yVKCz6WW6VveIWOFN/EhRaeIt
	HNVvdgG+/57TbtCQH/k7qPk7eaQGOO/bDAQUx++KAhheXMoeHh4I62l+ojXaBVoYSobdLIn4pmg
	Upi4wEHKh4TSTConVL+VsXfpRB81z1eEn272vJwEdmSRXHT+1P0qniS8v5OEE0i7GvYG7zTbVAP
	TrKVePoIwWKVn4V4Zpi7lbJPPsknH/+JAXQUSDvccUdLD4ryMJ7Q+S6ZAzON5SoxUshaNSc7sMG
	FxP42usCqv9hnGwVmit6u+NF60KOSfoU1LukxTKtzYV/+4eItZvvoxJd8EBIxjo7uoMhXZqpDIa
	8nogZr3MdYQVx3WE66XSgB6YtS4i0JKZvCQ==
X-Google-Smtp-Source: AGHT+IEJVH+W+cvPNVB9masQuVIjw1/4pd1uCDTCuFbsfIezp0x+6PzwSC9D9AUHrQ5rPRHOy4i8Fg==
X-Received: by 2002:a05:600c:4e05:b0:450:d00d:588b with SMTP id 5b1f17b1804b1-454a9c93836mr7813825e9.9.1751480080374;
        Wed, 02 Jul 2025 11:14:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e50:3860:9dba:9a50:1cc3:93af? ([2a01:e0a:e50:3860:9dba:9a50:1cc3:93af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9989328sm4674325e9.18.2025.07.02.11.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 11:14:39 -0700 (PDT)
Message-ID: <d5a03f2c-21a2-4cd6-acfe-9142f51a8655@baylibre.com>
Date: Wed, 2 Jul 2025 20:14:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nishanth Menon <nm@ti.com>, linux@ew.tq-group.com
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
 <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
 <e0773f0e-8d2f-4918-aaad-aab6345fdb81@baylibre.com>
 <9042d63de85f7ae8bf73760e9d2d7652c18a738c.camel@ew.tq-group.com>
Content-Language: fr
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <9042d63de85f7ae8bf73760e9d2d7652c18a738c.camel@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_111442_309681_49D68BEA 
X-CRM114-Status: GOOD (  27.88  )
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

Hi,

+ Vignesh who was lost in email list , sorry for that

Le 02/07/2025 à 09:25, Matthias Schiffer a écrit :
> On Tue, 2025-07-01 at 20:57 +0200, Guillaume La Roque wrote:
>>
>> Le 01/07/2025 à 16:36, Matthias Schiffer a écrit :
>>> On Mon, 2025-05-19 at 10:20 +0200, Guillaume La Roque wrote:
>>>>
>>>> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
>>>> select on ARCH_K3 are not needed anymore.
>>>> Select MAILBOX by default is not needed anymore[3],
>>>> PM_GENERIC_DOMAIN if PM was enabled by default so not needed.
>>>
>>> Hi,
>>
>> Hi,
>>
>>>
>>> what selects PM_GENERIC_DOMAIN in your configuration? linux-next fails to boot
>>> on our AM62x-based TQMa62xx if I don't (partially) revert this patch - I have
>>> not found a way to enable PM_GENERIC_DOMAIN and TI_SCI_PM_DOMAINS without
>>> enabling other unneeded features to pull it in.
>>>
>> With master branch if i apply this patch and i do make ARCH=arm64
>> defconfig and check in .config  both TI_SCI_PM_DOMAINS and
>> PM_GENERIC_DOMAINS are enabled.
>> with linux-next it's same. i don't really understand link with  PM part
>> in this patch and boot issue on your SOM.
>>
>> I probably misunderstand something.
>>
>>
>> what is your problem exactly ?
>>
>> if you can share log or link to jobs
> 
> 
> Hi Guillaume,
> 
> with arm64_defconfig, this problem doesn't occur, as other CONFIG_ARCH_* symbols
> also have "select PM_GENERIC_DOMAINS" (with or without "if PM").
> 
> We are using a smaller config specific to our K3-based SOMs however. I have
> attached a defconfig that shows the problem - if you use this as the base for
> .config on linux-next, there is no way to enable TI_SCI_PM_DOMAINS, as nothing
> selects PM_GENERIC_DOMAINS.
> 
> So unless I'm missing some other configuration that would actually be useful on
> the K3 platform and that would pull in PM_GENERIC_DOMAINS, I think that part
> needs to be reverted. I can send a patch to that effect later.
> 
not sure good patch was to enable PM_GENERIC_DOMAINS on ARCH_K3 but it's 
a deps on TI_SCI_PM_DOMAINS so perhaps do a select in PM_GENERIC_DOMAINS 
Kconfig instead of a depends on should be a better solution .

Nishanth and vignesh what do you prefer for this issue ?


thanks
Guillaume

> Best,
> Matthias
> 
> 
>>
>> Regards
>> Guillaume
>>
>>> Best,
>>> Matthias
>>>
>>>
>>>>
>>>> Remove it and give possibility to enable this driver in modules.
>>>>
>>>> [1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
>>>> [2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
>>>> [3] https://lore.kernel.org/all/20250507135213.g6li6ufp3cosxoys@stinging/
>>>>
>>>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>>>> ---
>>>> Changes in v2:
>>>> - Remove some other config after comment from Nishanth.
>>>> - Link to v1: https://lore.kernel.org/r/20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com
>>>> ---
>>>>    arch/arm64/Kconfig.platforms | 4 ----
>>>>    1 file changed, 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>>>> index 8b76821f190f..bf9e3d76b4c0 100644
>>>> --- a/arch/arm64/Kconfig.platforms
>>>> +++ b/arch/arm64/Kconfig.platforms
>>>> @@ -135,11 +135,7 @@ config ARCH_SPARX5
>>>>    
>>>>    config ARCH_K3
>>>>    	bool "Texas Instruments Inc. K3 multicore SoC architecture"
>>>> -	select PM_GENERIC_DOMAINS if PM
>>>> -	select MAILBOX
>>>>    	select SOC_TI
>>>> -	select TI_MESSAGE_MANAGER
>>>> -	select TI_SCI_PROTOCOL
>>>>    	select TI_K3_SOCINFO
>>>>    	help
>>>>    	  This enables support for Texas Instruments' K3 multicore SoC
>>>>
>>>> ---
>>>> base-commit: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
>>>> change-id: 20250504-kconfig-68f139fbf337
>>>>
>>>> Best regards,
>>>
>>
> 



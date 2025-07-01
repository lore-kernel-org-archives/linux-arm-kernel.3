Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02685C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 21:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OnXkb5Xk0A16V2ni6PtoSDVdWoQW1678+k13MiKScA=; b=atoLahCgERpZimqZZliYS0kqGP
	CJSEJheTNrolsh1of11mRwFryV5EZYuJv/VKv0QOuQ5TGYM6eC3nKb6dH2mgQ4aXs7yOGqg2wppvU
	GuI5e/b0ZuGnXa0TJeSvpI99bNU2brS/Zh0nFa9CPSQ5hMm3FUNZa4muNrR7Pdnz0kxIUiWe3CZhO
	DpPkKa/i0+GbnzTIAOGQqHF3fRSB+A6pk+x+2VENqqbxKbsdmW1ZPVLRu4mkIoSVVQItK6p6vqYlw
	O5ZwwMtbdIb8pgHtLfnR82x5i5r9ZAZTCVlT098d8GojXNtPRpqi5yj7dNTzc08/K4BxT7bCbwm56
	9trEK7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWiCO-00000006e8o-1ymr;
	Tue, 01 Jul 2025 21:07:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgB5-00000006P3y-0PZV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 18:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/OnXkb5Xk0A16V2ni6PtoSDVdWoQW1678+k13MiKScA=; b=H4GpxP0erP88tacKQCkQjkI1RL
	nkqeCtpbir5bxuhNG6NOuCFVmbL2yq8ebAEuVsq2rSZ4CSScXjtnZRtY/9WM3+Y62E33u+/NfkTqR
	zAtFXD8CY+Sn8YzGFNU0IixfLNMqkj7AfkNxqM0+BOe2Pe/ThDuNG8jPNdjb+CxkDaWbzFUXIAedu
	LSO1EA3s5ER9wtEB2kS1oQoIOv7kqjDeX3QQ9SHEn1SQa1pAc2zFSRSGM4sJugTgEqd8V3viTHFjf
	aWh7PmnYNpVEnityqCLad4OpHwMlUf47LG7Xi0E2fupQ/G2mspM7fAuwGauwDtg6P/cDD3dcAu1HV
	U4TnEqPQ==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgB1-0000000791B-2ESR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 18:57:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a4f379662cso3075672f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 11:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751396273; x=1752001073; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/OnXkb5Xk0A16V2ni6PtoSDVdWoQW1678+k13MiKScA=;
        b=vb6h/P9Dti0IQUaCyk9Fk/AkuxWpd+pXXdADJGlCZ/p97e1S/8meBKjTcZX+rKzfrT
         Yjq/j+f0exXRXJZoDWsa9/xFPThCUPXwLiMY0SfhiBUJfYDUvXzqvp6b4RiP5iZWxBBn
         zSmnsZqMEseXJzHZ60Ia9j2nNEzViVeO0gUmsbWHyxmHQuBSbvQF3qu1SpTsdYx0zJUj
         Hisxi2p8mg1lJO58jYk6FkAduzZ1EFVGlGOrSU332HvlkxoXUzubsdhYQnsLXn0JvbZ1
         g/1s0/bqysVPWSZxLdMEyx3HhSC9uX0udCOOhr6ugku/TPmkSl0uq+xlyPGMgCq7498P
         pIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751396273; x=1752001073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/OnXkb5Xk0A16V2ni6PtoSDVdWoQW1678+k13MiKScA=;
        b=imZVU9HztsoEV6k+VYnGgzgV1kvVp3yS68ZAp1Np68Cve5NhpSD/dPocfPs1y5sCQF
         YlWsHaGr06umnYlifzav8VkeaxlKoA6HvxnhXPsUWH4mYzNBrmTq78prj5C5FrEiHkJg
         l8KVg5Eb6rryG2cC05fLrQMzDH6n21BS3uWChPhphQn9F/G5eglsbI3xMfFsZth4xfIq
         kOvdyxO10X3i7kPtafRq+G8fwvA2z7PR6xWBcLhn5e9P+3Vb5yCiiui8mKWdRhLner9Y
         L8UhK2o9x3W80+r91ubIOxgXMh1F13UlkhKBIdKGeULQVC6jvUvL0Q7PmlDIWmAp9y1p
         7o4A==
X-Forwarded-Encrypted: i=1; AJvYcCV/4X1ZkGbXIJatgrYuQzNt7Qcn+aXQJEFbUhnI2b+YN7rg9V9xk8Ijxzktgbrn7seKc8376CpHVsVSQ+4wD6gq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2vJJsmEk38Ch5Wan/W7/NTfDQfBZpZVpURMj2X8lWsyUvzEmH
	+yLgGvUrLRwDfKmUSFVX83oBPhfQHHKgpyYMedZUSd7LwruS8hj3Gh/Cw1W00s+BTEzDlwhXHCJ
	0BRfjgK8=
X-Gm-Gg: ASbGncsAWmfebLLBH2TLB3CMG+ByYziiOJi3grCQN09siBzrGQ3RPmBfXtl/ahGZkBe
	Jcghk6AVmDSkMDW9IO7yZ12NFIUNMGKFhV5S8stLekofPJ6rzMxh7rXapdsmvr3n3kvlryFcKWi
	67+g2D2valH2922BCfqjzuZ7agNwbgy41JUTbHxlNDWtwo8/8LoNMIAUIvx0xWTVaDpOn2lT5kN
	VHC0xJ6qZ4EVsAMCIkJ4deO2NSKojTRoXENZz1QPNFM9lBSsR970bvaq2AAkZTxsFJ8VgwecixK
	U1jJfH4ay7i0pTo7nae7KqKK9ObU+xPpbllq76M4u8QeEL9bzScviuR2mB9yX6RvnscFWsWAn69
	/0ijNIVm3GoMUw9ovYCx44rJZ1kO/C0k=
X-Google-Smtp-Source: AGHT+IG417ZWU7rctrUCSCtMeXYKqD6ggMKJuzWIMQooXOk1KUkGBbzbIcqMGsVv01VYeq1mnM/67Q==
X-Received: by 2002:adf:9cc5:0:b0:3a4:cb4f:ac2a with SMTP id ffacd0b85a97d-3a8f482c161mr14623720f8f.21.1751396273005;
        Tue, 01 Jul 2025 11:57:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e50:3860:3714:f5bf:56c8:9f3? ([2a01:e0a:e50:3860:3714:f5bf:56c8:9f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c523sm203068035e9.6.2025.07.01.11.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 11:57:52 -0700 (PDT)
Message-ID: <e0773f0e-8d2f-4918-aaad-aab6345fdb81@baylibre.com>
Date: Tue, 1 Jul 2025 20:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nishanth Menon <nm@ti.com>, linux@ew.tq-group.com
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
 <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
Content-Language: en-US
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_195755_758684_C14FAE81 
X-CRM114-Status: GOOD (  18.53  )
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

Le 01/07/2025 à 16:36, Matthias Schiffer a écrit :
> On Mon, 2025-05-19 at 10:20 +0200, Guillaume La Roque wrote:
>>
>> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
>> select on ARCH_K3 are not needed anymore.
>> Select MAILBOX by default is not needed anymore[3],
>> PM_GENERIC_DOMAIN if PM was enabled by default so not needed.
> 
> Hi,

Hi,

> 
> what selects PM_GENERIC_DOMAIN in your configuration? linux-next fails to boot
> on our AM62x-based TQMa62xx if I don't (partially) revert this patch - I have
> not found a way to enable PM_GENERIC_DOMAIN and TI_SCI_PM_DOMAINS without
> enabling other unneeded features to pull it in.
> 
With master branch if i apply this patch and i do make ARCH=arm64 
defconfig and check in .config  both TI_SCI_PM_DOMAINS and 
PM_GENERIC_DOMAINS are enabled.
with linux-next it's same. i don't really understand link with  PM part 
in this patch and boot issue on your SOM.

I probably misunderstand something.


what is your problem exactly ?

if you can share log or link to jobs

Regards
Guillaume

> Best,
> Matthias
> 
> 
>>
>> Remove it and give possibility to enable this driver in modules.
>>
>> [1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
>> [2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
>> [3] https://lore.kernel.org/all/20250507135213.g6li6ufp3cosxoys@stinging/
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>> Changes in v2:
>> - Remove some other config after comment from Nishanth.
>> - Link to v1: https://lore.kernel.org/r/20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com
>> ---
>>   arch/arm64/Kconfig.platforms | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 8b76821f190f..bf9e3d76b4c0 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -135,11 +135,7 @@ config ARCH_SPARX5
>>   
>>   config ARCH_K3
>>   	bool "Texas Instruments Inc. K3 multicore SoC architecture"
>> -	select PM_GENERIC_DOMAINS if PM
>> -	select MAILBOX
>>   	select SOC_TI
>> -	select TI_MESSAGE_MANAGER
>> -	select TI_SCI_PROTOCOL
>>   	select TI_K3_SOCINFO
>>   	help
>>   	  This enables support for Texas Instruments' K3 multicore SoC
>>
>> ---
>> base-commit: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
>> change-id: 20250504-kconfig-68f139fbf337
>>
>> Best regards,
> 



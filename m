Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA83CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44Qa1LQ6eICE2navxqvBq6MbiOP9jzE+4MSaCPYPCfE=; b=c+t7rcc/fuh55tmP7+Xe88C04y
	B7gr2XHv0dn+wn0+MyITCCWyqpWydbFI5aj4ZS3C1D1qeAaJGVXGyHmuQp+9KPYb5GO45LcgFBhlt
	oaj/VoqG7iN7Ltt+RRTj1J9vyzafCMHbhL2oOnDY8WfsOZK6KJmzZmjaC2x+75eR76aq8YC+a78At
	jRipcIEVCH++a+yDz6I4UjEsGln6ZbQ47yj+ZVgkyMagAP1Kb/wawjpUHk2mJBZUwJfcvRACKEwGQ
	lnNf9hxSGqNFzG//4CzZDesmABQ1kCphyy3cdtuI0BMJUpj1VrOyYKmvcFqJOHIVhlr01MOYEymNp
	ywR8GomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjnP-000000071Zw-3WZw;
	Mon, 19 Oct 2026 09:36:43 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjnO-000000071ZN-0Lph
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:36:43 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48df54150dfso1382306f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 02:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402600; x=1793007400; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44Qa1LQ6eICE2navxqvBq6MbiOP9jzE+4MSaCPYPCfE=;
        b=ssL5ydlUdKwUmI0X2TuHlP9MiVIMY30iXspR+gw6qhzbI0xZ59u42A4/DIstjE8mLS
         wfCjK/SEnacIqmMfCAyfGu1FtbLdJOkG+1tR+MMM9ftaXs9AKaHGcLbWkhL/pTAVq7wZ
         OckKCQJUwVHYtu6piW5w2bf+SNAe7l84WjYHUG8ONjZwpbpum5/ByLA8rV4WPtw+oJ60
         83Dua5wZEKAsHCv3R/kJLRCJcmyvTcRHbeA0Rbo/ijdeYf8lws96GsEcSFC6oOy1nTV6
         Ka1xjmnFXjaU04HHzbwNbZT4fS2zek+h5wC1jNjCfb9ouenmn5q2uLhYcATyTSK4Wgma
         xSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402600; x=1793007400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44Qa1LQ6eICE2navxqvBq6MbiOP9jzE+4MSaCPYPCfE=;
        b=1dEpciQOAcJcYkSxQe2F1ev8RmMXTQx5r4uBCqgbrJ1HIdEMLV7NOMLIFB41U/H6ru
         BdaVHnZBvNyY8nEMDzfgogeweTAphtORPMJHQlpvOw/RlJU6pKHGeRNbGaChIl3yNPAj
         NT/HPMGgIMEtPmzDNmgiqUnOc4UKLKmymM8nbE7MWphEVoOO56DlWLZoit9UoOI6adw4
         /i36TJnXSC1stx/efDSimi7jpJxjpwdTPUWWEj08l8X9AkI0N5XTVD93feuQfzDG7JdZ
         roGcqtW4NgLuCcQCxlIRjSC1awSqaRJ6qoAelJtz4YejhcP7+965pM56WvPaWTu1YE/Z
         lOwQ==
X-Forwarded-Encrypted: i=1; AKwUvByVLCpAzhRbQH9fEv8JJK+6piPGk0SxrfLRS3q33wW71wk8ELzzyBcwCjC8fvLNiftatVV5Vdl5pE2kQbep7fTY@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1NguNXD200jBRNUYnC0Y23i96qLSR13kg7m0aU69UcjTmEs+H
	anbBQq6e6XNhbVxFhx5K9i4AI5smz389jhp95Gy4D8T8Q4daaqpw0oeEPmpEAQWOue4=
X-Gm-Gg: AYBFou1SV9pHy2v2CZyav3Laz8wb1PgzaLXTFayM3AT2PJljuj4yVT/V+AKKyVn6xQO
	A01R3ZXfZxtIXk1wNVGAPViVduCyrgEmARrJgFpIWnzC2hDYupQLYg/lDGWwzOGmcFCb1BhzQUE
	bF6B1xTO8trmMLqGDWqcAZ4NPw1f63PyS/6leMjTrYwQ6yw1Oup8455jwokM/Q+U6msc9Zm1CgE
	byEmt9Kxgk193zbMFHP65XqyQzM1s7ezu9UjzaoCOvBRK5eDfkuwCGgJsacJUPd0/MvODckL89e
	UhnlK/m0zlTttSbW4q2WXWJzUfS6Y10BWCNCUwTao/8cLM1SJYoD9OqPpw0a4VzzQLjiEzf/FjW
	FwxMxV2xdjenOZOOU0JR043dPRFTdY9JvAKwLj+5Waynq9ZQpsoGFfIxnPrTMTdZkDK17VLCl+o
	aiMC/nu9s/MW6LIc2JBBW877hocugJedrPjWyNtckJIR5T1Lip1PrEnwHcWVwJwBgCJJ1pUlIDu
	i2XHSADXw7hXXDoruFuW1vX9YIKxGieEm6n3hDq764ULaRC4Q==
X-Received: by 2002:a05:600c:3b23:b0:4a1:cd83:b240 with SMTP id 5b1f17b1804b1-4a1d75ab20bmr188477405e9.1.1792402600230;
        Mon, 19 Oct 2026 02:36:40 -0700 (PDT)
Received: from ?IPV6:2a0a:ef40:eb0:c501:2c4e:44f:2449:8978? ([2a0a:ef40:eb0:c501:2c4e:44f:2449:8978])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm24062449f8f.27.2026.10.19.02.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:36:38 -0700 (PDT)
Message-ID: <8a8313f1-d525-45d3-9044-b5f7a00b256d@linaro.org>
Date: Mon, 19 Oct 2026 10:36:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] ARM: dts: omap: dm816x: Update USB node
To: Andreas Kemnade <andreas@kemnade.info>,
 Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christopher Obbard <chris.obbard@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-6-b4ce30217028@linaro.org>
 <20261017083957.7c2696f5@kemnade.info>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <20261017083957.7c2696f5@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_023642_177041_D638F32E 
X-CRM114-Status: GOOD (  18.15  )
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

On 17/10/2026 07:39, Andreas Kemnade wrote:
> On Fri, 16 Oct 2026 16:41:21 +0200
> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
> 
>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>
>> USB node was not working correctly with DMA enabled as the supporting
>> code had been updated without updating this SoC's device tree. Bring the
>> device tree more up to date so that it works with DMA enabled.
>>
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>   arch/arm/boot/dts/ti/omap/dm816x.dtsi | 41 +++++++++++++++++++++--------------
>>   1 file changed, 25 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>> index 7f3ef3a00ab8..5be9efc60785 100644
>> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>> @@ -574,18 +574,27 @@ uart3: serial@48024000 {
>>   		};
>>   
>>   		/* NOTE: USB needs a transceiver driver for phys to work */
>> -		usb: usb_otg_hs@47401000 {
>> -			compatible = "ti,am33xx-usb";
>> -			reg = <0x47401000 0x400000>;
>> -			ranges;
>> +		usb: target-module@47400000 {
>> +			compatible = "ti,sysc-omap4", "ti,sysc";
>> +			ti,hwmods = "usb_otg_hs";
> 
> Why do we still need this? It is depcrecated.
> 
> Regards,
> Andreas

Without that line we get the following on boot and USB does not work

[    0.110148] omap_hwmod: usb_otg_hs: no dt node
[    0.110163] ------------[ cut here ]------------
[    0.110169] WARNING: arch/arm/mach-omap2/omap_hwmod.c:2332 at 
_init+0x1a4/0x4c4, CPU#0: swapper/0/1
[    0.110198] omap_hwmod: usb_otg_hs: doesn't have mpu register target base
[    0.110204] Modules linked in:
[    0.110221] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
7.3.0-rc7-g8e3242ad06d4 #11 VOLUNTARY
[    0.110235] Hardware name: Generic ti816x (Flattened Device Tree)
[    0.110242] Call trace:
[    0.110254]  unwind_backtrace from show_stack+0x10/0x14
[    0.110284]  show_stack from dump_stack_lvl+0x54/0x68
[    0.110307]  dump_stack_lvl from __warn+0x8c/0x194
[    0.110331]  __warn from warn_slowpath_fmt+0x1a8/0x1b8
[    0.110350]  warn_slowpath_fmt from _init+0x1a4/0x4c4
[    0.110367]  _init from omap_hwmod_for_each+0x30/0x5c
[    0.110393]  omap_hwmod_for_each from __omap_hwmod_setup_all+0x34/0xf8
[    0.110412]  __omap_hwmod_setup_all from do_one_initcall+0x54/0x2a4
[    0.110431]  do_one_initcall from kernel_init_freeable+0x208/0x2bc
[    0.110453]  kernel_init_freeable from kernel_init+0x18/0x134
[    0.110471]  kernel_init from ret_from_fork+0x14/0x28
[    0.110484] Exception stack(0xdf009fb0 to 0xdf009ff8)
[    0.110496] 9fa0:                                     00000000 
00000000 00000000 00000000
[    0.110507] 9fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.110516] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    0.110611] ---[ end trace 0000000000000000 ]---

Andrew


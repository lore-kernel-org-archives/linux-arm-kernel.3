Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52188C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfIIhN61OmpJAg95pfveNaV+liLi2NycTn3RfRjueFs=; b=ryJGXoOaq94kLkU+20+YK64hRA
	JukRVDOJe2PLIP9W389bb/rgqS9dKWOGCLygm3/57ku03M2gKMT9Uogui+qdcYdfKjuvmf0MBzLmZ
	XRwYjdEJ8ftoLE9iSHhGrDQbJ5/XkFKMoXmO/LW0XLEtxB73CD6oMJsi5cM7rLIAfqI82KU/kNQWo
	AGp80NyTNYdz0vSFepBwMYAEFdezWyWu3APUzLuu/cAiBOGWAbWtj/bE+LUPVZZAn4mwOKt8GDTSo
	Cjwq+ia+Z7HlS4Z+s4jbm29SJjMrJTAkKuQVZl0cI2mZKQRqi9u9+PUxiB6uL2Ecf9c1NmCt+I1FS
	/TXpPV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopNJ-00000006KTE-1BSs;
	Tue, 28 Jul 2026 21:30:09 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopNG-00000006KRT-2i1Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:30:08 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-497d3e4460aso1351723b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785274205; x=1785879005; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfIIhN61OmpJAg95pfveNaV+liLi2NycTn3RfRjueFs=;
        b=Hkabtnj++dINXgUL8J6Jo+nGIgRpTQcUZt+90Dn2fp0r/J8rPm+Q/v7UwGIcKh/yQV
         D6wQFtDuIMmm6UjPuITyDn/gIShk6hO58BPryhzJejpuk97g+Hm22wKf+X9+48v/T4Ec
         Lh2bftomsk7zow+yOZCP4jW5vfq7qDBsR7JuA2NqsJigKWvxCmQR2xKXdToUCH6k/Z0h
         TORfbtOnyWOfWTbuZvDaIC8QRP0exzV/Nlk/pDyIDC+jNa/6IV+UC+C+BxO7FruA2q2A
         a1PDBR5C1ZIL29inlh7xezbk5YTFtHyqcufjIGJ0KxV19WhAA518joEhi3D4ZlhUN3Rw
         0BnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785274205; x=1785879005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfIIhN61OmpJAg95pfveNaV+liLi2NycTn3RfRjueFs=;
        b=dFuIKlcoGY9pNllIi8MCLIe2vjr37FSd9+/w6wYpCFF+7523j2SdEkr7XCV54C9KJL
         Lnj73ytEjltX3bPqkUkdP3tb9XXH7ara029BXbFjSkshEyyfqAzyGqOoj+9EkbnmlEpv
         tdlXQ1g1dDP79dlkQ+vfAN/UlyGWDZexUpvQd1nwNw9bgM7yyxf8OD+r4BKnwbPr03k9
         pUF7jrr/XNp+F7xC4quuHhtNPyay4B4Lss3XkBPB/rtlkDTEyISJwseb3DNuhcMkr0ld
         NBMbFMh1Nz4ZCXu0xRjFoTtiOlcxwAqktXQOQD5Tt8eYQYKYlqCxCyGW5uZtdlTxa+Ta
         s3rA==
X-Forwarded-Encrypted: i=1; AHgh+Rqg4A+RNE7ngpXREEcJJU5oJz6yO22eG6a+gJpPfeGgVelWEy0Vx/z/3/qvuFxi0js6nA9C0ShBBndvFhfE9j+u@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtm9lKeu3gy4h9truxwXHN/lMtXPJ6oLbb2dIeKtbFDrpm3JhN
	mxDQb4HricNVpzkrWGS5ispGPcFi1zM7Yn1Fi+YFgnm34EyQgvGroirZQcC//b6aIMQMTha8pcO
	qp2S1
X-Gm-Gg: AR+sD13u2t+Eb4GMUmSZd8+9uipWnCl/w2V6+B7808ANFd3TiOGHmsF40L7PTuIDpaB
	n8NKCELSrcEkn3y/tR40ngqISv0gCkeSKB8j58Sjtwkfw07XPgTf3CmJzpiKjIgGPQ7PbgBrfwr
	+MZG9KAN4LHpJJ2PuP+3n3t/QEziGWerZydUWEPvKdzmUVRekZ5S7x7Jd+kltLewDGcUipRlOw+
	G7FIscC/G3bS84p8bmjuvVSUw3By946Bfaoin2jtCdl1ltP7mTxwe9SPrBIz3HsUDLfWTLJZCHf
	Y0osqqjbJclmJh03kNHvRhgKkYP2XDsqmo422T76fDfEm8n8QJrywTRIKdO9l55hHkvbK7aiAYc
	byt47UuIAFZcATIT1UkK0HXAa89GBVNS/x849Z2PsyD+CC6NYwcMzS5IoQq4Mkko1ymc2FtZpsT
	xrFlO48/AQ5XlYkmvvfRErKV2rHT9a8VWxfe1I/pYEzDH3zKyssBADGPfEjDInanOrdXBwL+j9C
	Bso4RWpmpcerR2oO3luIUjxvR+qy0xd9KhsYQVUzzzJ1QiKmg==
X-Received: by 2002:a05:6808:e82:b0:4a4:c95a:38d1 with SMTP id 5614622812f47-4ad5b794abdmr2108852b6e.4.1785274205564;
        Tue, 28 Jul 2026 14:30:05 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3096:ee5f:6f57:afe1? ([2600:8803:e7e4:500:3096:ee5f:6f57:afe1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ed2bc54sm235967b6e.5.2026.07.28.14.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 14:30:04 -0700 (PDT)
Message-ID: <df107a87-b63d-4818-82bb-3488f4d461f3@baylibre.com>
Date: Tue, 28 Jul 2026 16:30:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am67a-beagley-ai: Add gpio ranges
To: sashiko-reviews@lists.linux.dev, Tony Lindgren <tony@atomide.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Robert Nelson <robertcnelson@gmail.com>
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
 <20260728-arm-dts-beagleyai-gpio-info-v1-1-783ec90d54da@baylibre.com>
 <20260728195706.3D5C41F00A3A@smtp.kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260728195706.3D5C41F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_143006_699290_0AB5D61D 
X-CRM114-Status: GOOD (  24.35  )
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

Hi Tony,

Mostly a question for you since you are the pinctrl-single dt-bindings
maintainer.


On 7/28/26 2:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Adding `pinctrl-single,gpio-range` on K3 platforms causes dynamic GPIO requests to silently overwrite the entire pad configuration register, destroying previously applied board-specific settings like pull-ups and drive strengths.
> --
> 
> --- Patch [1]: [PATCH 1/2] arm64: dts: ti: k3-am67a-beagley-ai: Add gpio ranges ---
> commit c5d1a1cd5d0bb91d0c680ae90328952c44500103
> Author: David Lechner (TI) <dlechner@baylibre.com>
> 
> arm64: dts: ti: k3-am67a-beagley-ai: Add gpio ranges
> 
> Add pinctrl-single,gpio-range properties to the BeagleY-AI .dts so that
> GPIOs get the correct pin mux when requested.
> 
>> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
>> index 5255e04b9ac76..599d576f694f6 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
>> @@ -149,6 +149,19 @@ led-1 {
>>  };
>>  
>>  &main_pmx0 {
>> +	pinctrl-single,gpio-range =
>> +		<&main_pmx0_range 0 32 PIN_GPIO_RANGE_IOPAD>,
>> +		<&main_pmx0_range 33 38 PIN_GPIO_RANGE_IOPAD>,
> 
> [Severity: High]
> Does adding pinctrl-single,gpio-range here cause dynamic GPIO requests to
> silently overwrite the entire pad configuration register?
> 
> On K3 platforms, the pinctrl-single,function-mask is typically <0xffffffff>,

Is pinctrl-single,function-mask supposed to just contain the mask for the
mux bits (function) rather than all config bits?

The DT binding description is vague:

	Mask of the allowed register bits

Does it mean all bits in the register even not related to function or all
bits related only to function?

Looking at the code, it seems like it should just be the mux bits (function)
since pinctrl-single,function-mask is stored in pcs->fmask and pcs->fmask is
only used by pcs_set_mux() and pcs_request_gpio().


> meaning the pad electrical properties and mux mode share the same register.
> When a GPIO in these ranges is requested via gpiod_get(), the gpiolib path
> calls the pinctrl driver's pcs_request_gpio().
> 
> Since the function mask is 0xffffffff, pcs_request_gpio() will execute:
> 
>     data &= ~pcs->fmask;
>     data |= frange->gpiofunc;
> 
> Could this completely erase any previously applied board-specific settings
> like pull-ups or drive strengths from a device's pinctrl-0 property, and
> replace them with PIN_GPIO_RANGE_IOPAD (which includes PULL_DISABLE)?
> 
> [ ... ]
> 
>> @@ -267,6 +280,15 @@ &main_uart0 {
>>  };
>>  
>>  &mcu_pmx0 {
>> +	pinctrl-single,gpio-range =
>> +		<&mcu_pmx_range 0 21 PIN_GPIO_RANGE_IOPAD>,
>> +		<&mcu_pmx_range 23 1 PIN_GPIO_RANGE_IOPAD>,
> 
> [Severity: High]
> Will this have the same pad configuration overwrite issue for the MCU domain
> GPIOs when requested?
> 

So in order for pinctrl-single,gpio-range to actually work correctly, we would
need to make this fix first.

---
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index f130c7cb998d..cae21cf92ca7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -280,7 +280,7 @@ main_pmx0: pinctrl@f4000 {
 		reg = <0x00 0xf4000 0x00 0x2b0>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
-		pinctrl-single,function-mask = <0xffffffff>;
+		pinctrl-single,function-mask = <0xf>;
 		bootph-all;
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
index 5288c959f3c1..1aa73526bba4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
@@ -11,7 +11,7 @@ mcu_pmx0: pinctrl@4084000 {
 		reg = <0x00 0x04084000 0x00 0x88>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
-		pinctrl-single,function-mask = <0xffffffff>;
+		pinctrl-single,function-mask = <0xf>;
 		bootph-all;
 	};
---

And then we would want this change as well...

---
diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index 4491898d8294..29e401f16bc9 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -112,7 +112,7 @@
 #define PIN_WKUP_EN			(WKUP_ENABLE | WKUP_ON_EDGE)
 
 /* Default mux configuration for gpio-ranges to use with pinctrl */
-#define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
+#define PIN_GPIO_RANGE_IOPAD	(7)
 
 #define AM62AX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
 #define AM62AX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
---


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350EEC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 14:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DKH120hIelNwj0rSdHKDYtGkboMj1pgTCFw2K5/B9U=; b=ZmyxzbkFPpFF4BbHXWaFR5hMLn
	2IPIz4qQ/Uwrf//RpJtjaUD4ApEzQ8zkNsxBc8MkRMymLY1dGa16z6ScgHIzE8otLi7+5bgAC26Co
	h2lgo93grUP7GItW6srQelZUg8ZHZPKczEmewv3X8IwafpfLyTpaNtgCXaN06O3bexk2lmwazBjtR
	Pr6eeT+uarwzYcCCEk7zPsixe0HvdU4FvZXIKOOBe2nL8ImMrfPvHiUH5f9GtSbqYnOZYhKeGn9qM
	aj+Coz4LxB/hfXJh5YyiQjE6O4oJEAy/9nHDEo2QD9pyJZESUJNL9a6q/j8LhBjorzTvsoK5etq6m
	SMzKxfrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ9zR-00000002Y1o-3zNW;
	Sat, 18 Jan 2025 14:39:57 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ9y9-00000002XsT-3NIA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 14:38:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4361c705434so20548085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 06:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737211115; x=1737815915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8DKH120hIelNwj0rSdHKDYtGkboMj1pgTCFw2K5/B9U=;
        b=jHbBQokPofGbNjotuklBNeWVLldoIjXxUQWXEiiGBHpQgtk0M45lw/f03TRhdIJEbR
         6SrhVMY7FZxaQQqgK6FRFubIG6kglXCFNL8yS1i0Jk5VZgfI3Z2ef3JG5TUe8+fa3Zd6
         g/TP8qBeij632KtwO+bizntUQg6NO5akoutwCxI2DUwlC9uLNvz8twQzOBWgZpVyfLUs
         inB0+PVus4rz1qroMz9kNPWa5bOkGuyro0wd8x+0x0dbDMuywTROWmWlUT/p/t2pmTnF
         QOit4FYaC79eKOceP9A+JorT402N+1qHq0YmKQDSy+QG1M6mwI2XGpb+Wa6vmpAXu+9k
         7fAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737211115; x=1737815915;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DKH120hIelNwj0rSdHKDYtGkboMj1pgTCFw2K5/B9U=;
        b=H4rucTgYL1SydJlDge1YYxf8N+q1oF1ERFT3Ndr2g9VSvldVSBn3abqpplMebrotAD
         a67svoiRZSe+YSoXYsn3cLBFU5QiRTW8sCJkCM8H5BE+ZArQwxVosau0G+UrJ3Tl9UI6
         cclGO9z23SmYyiEDYXlfoSVLxSHJGUfeQeX4PnnzANG6fwG+pHtnDtd2YtFBQwAyVEHP
         xYUTZEEKjyFbU1823/LSVovW8qjoQvT0tgRXYIb9hMaC+KyLPtZ8aHmvzCFW+3+cgXAx
         OOGDw3DQf57Qkd7z3uSG8MZ+ATOyS0HVQ1eNrrQM4a9w5xQCT8AdSnMS7exYAEMTm4Q+
         iPzA==
X-Forwarded-Encrypted: i=1; AJvYcCVrsNhYp/vSXGTWXc0kXbMLaIqriWT4TUSsE3ls285/S8TFmJNv9opw11ZSBCXEf5FHtTzWqGXyo9SjyEsL9mLU@lists.infradead.org
X-Gm-Message-State: AOJu0YxCK9axhrOkUbanR2O0VKRqMBh4bAg3y+NN6enh3JEXZII/EvQv
	PHoum9SeOSe6G3Twd+CpkKjUQ+T8UCLOO50kB5sDcere4I7xw0lzgzwn+cSjQ+A=
X-Gm-Gg: ASbGnctP5Zh/10zDL7DhX40z7i5H/LQaCjwrqzfFn3HBobYYS8yFy8W/BzYerOtalCo
	dSHn4tvgFWNsHOr2FgJCrjxtOh5WbsUC9CT/EKoO+PzJ1DUES56N1fxXByn7Lkhx7uisd1JNnRv
	xaayoLljNOCrcD8ok4dLkE+FpgZBk9LfwPFE+dVhXVqC/1kfTdu6v98DKZw91ZFaq3H42ex2Y3A
	20rzpFS0iI4PK7XsMTjkVqx6nyMHYf4BwwNlZlQ724BcZWpHLGw0Yg0SqkfWbAPtvSgDXSlM7//
	2A==
X-Google-Smtp-Source: AGHT+IFsJ3fdDCkUOB2Vev0Ey4B0aW+LUFAbHeIOXX3oCb5jfpBSdolr5fI/Pzhd7a/wQiVhk1QHQg==
X-Received: by 2002:a05:600c:3b94:b0:434:9934:575 with SMTP id 5b1f17b1804b1-438913e02f8mr77090705e9.16.1737211115420;
        Sat, 18 Jan 2025 06:38:35 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3214fc9sm5250124f8f.6.2025.01.18.06.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jan 2025 06:38:34 -0800 (PST)
Message-ID: <1c92e4ad-3aef-4eec-8f90-989884262415@tuxon.dev>
Date: Sat, 18 Jan 2025 16:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: at91-sam9x75_curiosity: Add PMIC
 suspend voltage configuration
To: Andrei Simion <andrei.simion@microchip.com>, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250113071710.40821-1-andrei.simion@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250113071710.40821-1-andrei.simion@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_063838_008271_00F6587F 
X-CRM114-Status: GOOD (  21.50  )
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

Hi, Andrei,

On 13.01.2025 09:17, Andrei Simion wrote:
> Add missing essential configuration for the PMIC rails, which is necessary
> for proper low-power mode operation. This patch adds the required settings
> to ensure that the regulators behave correctly during Suspend-to-RAM and
> Standby states. Otherwise, after resuming, it receives: "No configuration"
> message.
> 
> Our driver implements the set_suspend_voltage and set_suspend_mode
> callbacks, which require the `regulator-suspend-microvolt` property to be
> specified in the device tree for each regulator node. This property defines
> the voltage level that the regulator should maintain during suspend mode.
> 
> Additionally, according to the datasheet, some regulators need to be turned
> on or off during suspend mode. This patch addresses these requirements by
> adding the `regulator-on-in-suspend` and `regulator-off-in-suspend`
> properties where appropriate.
> 
> Fixes: 371a47c9a58a ("ARM: dts: microchip: sam9x75_curiosity: add sam9x75 curiosity board")
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
>  .../dts/microchip/at91-sam9x75_curiosity.dts   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
> index 1a6a909a5043..5514ad10cda5 100644
> --- a/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
> @@ -110,10 +110,12 @@ vdd_3v3: VDD_IO {
>  
>  				regulator-state-standby {
>  					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
>  					regulator-mode = <4>;
>  				};
>  
>  				regulator-state-mem {
> +					regulator-off-in-suspend;
>  					regulator-mode = <4>;
>  				};
>  			};
> @@ -128,11 +130,13 @@ vddioddr: VDD_DDR {
>  
>  				regulator-state-standby {
>  					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1350000>;
>  					regulator-mode = <4>;
>  				};
>  
>  				regulator-state-mem {
>  					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1350000>;
>  					regulator-mode = <4>;
>  				};
>  			};
> @@ -147,10 +151,12 @@ vddcore: VDD_CORE {
>  
>  				regulator-state-standby {
>  					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1150000>;
>  					regulator-mode = <4>;
>  				};
>  
>  				regulator-state-mem {
> +					regulator-off-in-suspend;

Is this correct? In the upstream kernel the SAM9X7 supports only standby
and ULP0 (see sam9x7_pm_init()). I don't think it is correct to turn off
the CPU while in ULP0.

Moreover, AFAICT, the MCP16502 will not transition out of active state
according to the FIGURE 4-2: Finite State Machine (FSM) States Diagram for
MCP16502AC from [1] and the schematics from Figure 3-6. Power Management
Integrated Circuit described in [2]. The LPM, HPM are tied to the ground
and SHDN is currently controlled (in the upstream kernel) only for backup
and self-refresh mode (see at91_backup_mode). Am I wrong?

Thank you,
Claudiu

[1]
https://ww1.microchip.com/downloads/aemDocuments/documents/APID/ProductDocuments/DataSheets/MCP16502-Data-Sheet-DS20006275.pdf
[2]
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/UserGuides/SAM9X75-Curiosity-User-Guide-DS60001859.pdf

>  					regulator-mode = <4>;
>  				};
>  			};
> @@ -166,10 +172,12 @@ dcdc4: VDD_OTHER {
>  
>  				regulator-state-standby {
>  					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1150000>;
>  					regulator-mode = <4>;
>  				};
>  
>  				regulator-state-mem {
> +					regulator-off-in-suspend;
>  					regulator-mode = <4>;
>  				};
>  			};
> @@ -182,6 +190,11 @@ vldo1: LDO1 {
>  
>  				regulator-state-standby {
>  					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
>  				};
>  			};
>  
> @@ -192,6 +205,11 @@ vldo2: LDO2 {
>  
>  				regulator-state-standby {
>  					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
>  				};
>  			};
>  		};
> 
> base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc



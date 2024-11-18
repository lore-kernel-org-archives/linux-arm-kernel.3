Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A787BD49221
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 14:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5g0SDxq/NK6cMbSW02p9WJnfU+yS5PFEVoK2tgPY/Q=; b=LoNcngYjOf01ltT4EFgzZcWANq
	ad6m+ygDmRhrt2ICIs9jlgqjRluUxGylOgaNtDt5wxjnlATHC+6lkUd8Mk6TYSxV1VDV7jaH7fARW
	9+fNp9nwV7Snf6aBHyj3fF5xXH+IbuIivY1vp6MBh3KixsDrPN6LsxJ/+68+pkuQWskqG+U08OlL5
	SGvNI0bqtLsPJP+s6iO4nh2d4Ix+mWgW1QOgpzGz+LTx46WOhviDhAkIjo4Jm19BZeWOGWqkcCeNb
	AhcsVxhTsb+l9JMO0uRtycO+KNoByqTTMxCz7M8vqisB/TlBkaxySxmQ+jDmiXfV3hrEKi2PwrCR6
	DFGR+15Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD2J4-00000009gvB-1Msf;
	Mon, 18 Nov 2024 14:00:46 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD2FV-00000009gUi-3Bqy;
	Mon, 18 Nov 2024 13:57:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-382325b0508so1536678f8f.3;
        Mon, 18 Nov 2024 05:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731938223; x=1732543023; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y5g0SDxq/NK6cMbSW02p9WJnfU+yS5PFEVoK2tgPY/Q=;
        b=FNATB1pWpUP0NV46ms6kb80X9g9RHn+/ngbhSJ9aW1l//JZTkYVBr1yGISa2Tn9jYL
         8zQeBKG06FIl/A3PEDN+B9EvLVY92UoT58QhQsBtosQmEs9wYU3oF/un2nW8xeVn9H9w
         QS7cD7cSqcSLCuxrFZu0kgZCzAbTU7FTTzP32qw16+Pz2RniR1S4TrmaOYx+BP8ZzbcC
         KlnHXwUlkWueAtbxSG2CSEybIf3/N1NSgxEfFMeDe8x5TkSwIBbxyx9+1wSSvR+x9JuO
         RZfNPa8TrXUNw+o+g7g95vqIqWYoDVC63Ras6OhOXimQWVpK+i3oqViDwuyuJ1nQ2+ot
         GX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731938223; x=1732543023;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5g0SDxq/NK6cMbSW02p9WJnfU+yS5PFEVoK2tgPY/Q=;
        b=n+n9Ih52gyRIAvQSQ1SE/Rhgiu7c34Tt6aLxmVyRSWDBNF5/YJJmjsxInIKBeGGiuE
         7G7Ki98LyBCxXVyLaMu3aHD5D9gRE30oG/Si+s6tSmsem+V5uxc3IBvmhEYKBzr0bg0S
         Gw1eiZcSn4FcFJTV+w6hxA3x98dFxZoRhNkSmNTcUrTAssjC6Du3YagxYWzWS8/fDIso
         WQmULgR67GSS0hnmmfT01rdifRQLKi1mgeEc6g4q9f/MQaJHhV1I4bcBVAPxs5qJ4Ewl
         Ll9HWCf/fP+xDVUQ+tSN6ConUzCwouK9pj0jrGs+QUlzJQbHNn9KCMryRa1jiBmnPVtJ
         2RNw==
X-Forwarded-Encrypted: i=1; AJvYcCVWrL0MgQB4LfSk+ypMtcL4+M+D5e4FI244IiiLtI0xN/4hSkSKtJyhr0b1XnbB4+fYlWWcMRK1dIEsFjbAU10p@lists.infradead.org, AJvYcCXCmj/jeromYbqdafsgOmgKsX4fjIcDEOqNedwnCPV5LsZfFI6bD4MB34QlieWbadvkd86uKrnNgsTW8hRcVCs=@lists.infradead.org
X-Gm-Message-State: AOJu0YziJHVbB4EITAc1Sc4CvDmGdCNCRQlMud7jtaHQv32DgSOe5RpC
	HQEplf0XYADSQUBaECLlFYjkBxAfeZFIwA770RON6X+OLQ6N0rSB
X-Google-Smtp-Source: AGHT+IF94nbHwzjCLpDarWT5yfUcXTqkaO1krUW7QphggrRZZYmFNp3AV0Tm25ZBZzhDuW3XljIjSA==
X-Received: by 2002:a5d:6489:0:b0:382:4b5c:418c with SMTP id ffacd0b85a97d-3824b5c4381mr515794f8f.55.1731938223123;
        Mon, 18 Nov 2024 05:57:03 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382456ba017sm3895573f8f.97.2024.11.18.05.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 05:57:02 -0800 (PST)
Message-ID: <673b47ae.df0a0220.2187ad.bc2a@mx.google.com>
X-Google-Original-Message-ID: <ZztHqr6wdb2nmFke@Ansuel-XPS.>
Date: Mon, 18 Nov 2024 14:56:58 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v10] pwm: airoha: Add support for EN7581 SoC
References: <20241103-en7581-pinctrl-v10-1-1990fb6996a0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103-en7581-pinctrl-v10-1-1990fb6996a0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_055705_799653_ED7AB5F8 
X-CRM114-Status: GOOD (  28.15  )
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

On Sun, Nov 03, 2024 at 10:04:04PM +0100, Lorenzo Bianconi wrote:
> From: Benjamin Larsson <benjamin.larsson@genexis.eu>
> 
> Introduce driver for PWM module available on EN7581 SoC.
> 
> Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Introduce airoha-mfd driver in order to load pinctrl and pwm drivers for
> EN7581 SoC. airoha-mfd is needed since both pinctrl and pwm drivers
> needs to access the same memory block (gpio memory region) to configure
> {gio,irq}_chip and pwm functionalities respectively, so model them as
> childs of a parent mfd driver.
> Current EN7581 pinctrl driver supports the following functionalities:
> - pin multiplexing via chip_scu syscon
> - pin pull-up, pull-down, open-drain, current strength,
>   {input,output}_enable, output_{low,high} via chip_scu syscon
> - gpio controller
> - irq controller
> ---
> Changes in v10:
> - repost just patch 6/6 (pwm driver) since patches {1/6-5/6} have been
>   already applied in linux-pinctrl tree
> - pwm: introduce AIROHA_PWM_FIELD_GET and AIROHA_PWM_FIELD_SET macros to
>   get/set field with non-const mask
> - pwm: simplify airoha_pwm_get_generator() to report unused generator
>   and remove double lookup
> - pwm: remove device_node pointer in airoha_pwm struct since this is
>   write-only field
> - pwm: cosmetics
> - Link to v9: https://lore.kernel.org/r/20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org
> 
> Changes in v9:
> - pwm: remove unused properties
> - Link to v8: https://lore.kernel.org/r/20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org
> 
> Changes in v8:
> - pwm: add missing properties documentation
> - Link to v7: https://lore.kernel.org/r/20241016-en7581-pinctrl-v7-0-4ff611f263a7@kernel.org
> 
> Changes in v7:
> - pinctrl: cosmetics
> - pinctrl: fix compilation warning
> - Link to v6: https://lore.kernel.org/r/20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org
> 
> Changes in v6:
> - pwm: rely on regmap APIs
> - pwm: introduce compatible string
> - pinctrl: introduce compatible string
> - remove airoha-mfd driver
> - add airoha,en7581-pinctrl binding
> - add airoha,en7581-pwm binding
> - update airoha,en7581-gpio-sysctl binding
> - Link to v5: https://lore.kernel.org/r/20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org
> 
> Changes in v5:
> - use spin_lock in airoha_pinctrl_rmw instead of a mutex since it can run
>   in interrupt context
> - remove unused includes in pinctrl driver
> - since the irq_chip is immutable, allocate the gpio_irq_chip struct
>   statically in pinctrl driver
> - rely on regmap APIs in pinctrl driver but keep the spin_lock local to the
>   driver
> - rely on guard/guard_scope APIs in pinctrl driver
> - improve naming convention pinctrl driver
> - introduce airoha_pinconf_set_pin_value utility routine
> - Link to v4: https://lore.kernel.org/r/20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org
> 
> Changes in v4:
> - add 'Limitation' description in pwm driver
> - fix comments in pwm driver
> - rely on mfd->base __iomem pointer in pwm driver, modify register
>   offsets according to it and get rid of sgpio_cfg, flash_cfg and
>   cycle_cfg pointers
> - simplify register utility routines in pwm driver
> - use 'generator' instead of 'waveform' suffix for pwm routines
> - fix possible overflow calculating duty cycle in pwm driver
> - do not modify pwm state in free callback in pwm driver
> - cap the maximum period in pwm driver
> - do not allow inverse polarity in pwm driver
> - do not set of_xlate callback in the pwm driver and allow the stack to
>   do it
> - fix MAINTAINERS file for airoha pinctrl driver
> - fix undefined reference to __ffsdi2 in pinctrl driver
> - simplify airoha,en7581-gpio-sysctl.yam binding
> - Link to v3: https://lore.kernel.org/r/20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org
> 
> Changes in v3:
> - introduce airoha-mfd driver
> - add pwm driver to the same series
> - model pinctrl and pwm drivers as childs of a parent mfd driver.
> - access chip-scu memory region in pinctrl driver via syscon
> - introduce a single airoha,en7581-gpio-sysctl.yaml binding and get rid
>   of dedicated bindings for pinctrl and pwm
> - add airoha,en7581-chip-scu.yaml binding do the series
> - Link to v2: https://lore.kernel.org/r/20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org
> 
> Changes in v2:
> - Fix compilation errors
> - Collapse some register mappings for gpio and irq controllers
> - update dt-bindings according to new register mapping
> - fix some dt-bindings errors
> - Link to v1: https://lore.kernel.org/all/cover.1723392444.git.lorenzo@kernel.org/

Hi Uwe,

since you gave revision for v9, any news with this? Is everything good
now? It's sad if this last piece doesn't get through after all this
efforts with the previous series :(

-- 
	Ansuel


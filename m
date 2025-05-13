Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9D8C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEU9Mo6/UKsuuLc31/10/BvFN8LdhjlBi5jmqi672+k=; b=BS6xntVbdVdDAVbIDVF4MAiBnc
	woxAm/UfXY1RfBK42Jy9TYgu/vdEH4qDEeAbf2lok8M22U77uuDuXtT3yf5SnYYthP4g+mLUJq3wO
	hhirLg7ItOUnU4Fsy492PYQlWkPKtSQ0XVpUGfktxyu+0epxwGoXJWhObwUWv55eFH0fJFf0fG2F+
	iGHlYaTwwS8+QYYezWELdZvr2kp84zSiVlozwI2k+PuIrEIgNEAHy7Pp/b3JS5obR9qc4G5HYSeS5
	byOHkYi+Lkq5hTV5IbKbzN8QLu0oQDFyWSmz7WmyHo0Ogl4ccO/+Yzui+rsb1pVReoK5+NqEE4L1a
	tvPlBLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEq6F-0000000CY3T-05vw;
	Tue, 13 May 2025 13:55:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpry-0000000CW1d-0Nid
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:40:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so41710405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747143628; x=1747748428; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xEU9Mo6/UKsuuLc31/10/BvFN8LdhjlBi5jmqi672+k=;
        b=LWrBBXnK2OLwS0+ugceC7HKqTDXgd+vir/cHqUPAaiIn0v7XRzgxzKBHL37AFSzLd6
         qCgx7xlqu/sKnPMo27LAvAMUm5frb+RoeH5AS6xvZFuyt/mOKg4hc4b/l9YO2oBWh0kz
         TWMMa67X4mNcE6lV5UH7tOOKISJs5hXpklE8knSVn7KSvxwPVnwfsQmRS//s2ZONnzKy
         2s5tYMIMXscE6RehJfe9qk0/psRO3oQhorC5tFDrgE0I4J9eH4JWkFMcR+Hg/ODvU2KM
         Sv/lf6P3O8cYY+9KXqC5HROKbKt7PSxMn96PDtChZ1d6E11Kf1p17hJMxVMNUJyQKDbV
         GFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143628; x=1747748428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEU9Mo6/UKsuuLc31/10/BvFN8LdhjlBi5jmqi672+k=;
        b=whSZ/Y/oDIcEMuANbnuhV10AbvGM3LqRXaPYnRQ9MT1qZ8xBZp4BCaNChHQv7+QR7Z
         EI9wvsENpA3ZFCg0NTyG2FZP426jewTPXJSGa+yQEUzSfMvt91dAjgDX7nrE2XiT4J+P
         qObqRg+o1FkflGJFO0+d6YxcEPYytbI4mUhkahQ80E11XI9BOFN0pQI1Vv4zzCroLK8L
         9OhYr/lj8w+RunqfJ32nHqHxniZhuqs3PKHOvwfcHbbSejccKKgnjbN5ISr76yAEET1z
         3ZRpQHFC50m0Ts3aLxPg9gVJCaZu4VKFMoInlc2tBs8EvB8L+gNE6fYirXGKgBuQjImz
         /UUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp/iid/SAGGWeWy8ovR+UKD8F6HPk0jRFre82CAiTCBqBla3IAdhvYne6W2oLdrbCLuuYY5Dd559YoqPL/Nbgn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+zpqtoiae1F52GS03enuR3X45n71QA8Yqr2QuCNG80/VnSo5a
	8mWMbPGm0O5oEseRJKLAeWp6xUGRR2Bg+8JtmE1abO1p/Qq56likxF34X79CNq4=
X-Gm-Gg: ASbGncstB5OV3GqiCOiTdqn31X0aZggFQ2oVghEVlw6/sVe3x6eqJTA5rDErgGE0y2P
	StsU0P8W8cclsYtfeReOUohJDPXvg7e2d+RoZWtbbTC4L8xagOKCaz32u+sdIy6POpxnKsXHYI4
	QlW1K7ia/+IynGCVp+cKirk/8bFLmogvHDXQ2l8y3JZ9qkGiP/7gN8fBkhg+VykjLd3LRtR/UgB
	/9EgNooZTYc/BOnd9Ejyw9BfPKaiAKLsBitOzpjwuseTzO880SAPODLUGufDA9+Dnj2IX+ZsnLE
	rfMR24u8f63ZdUm9kkUkSKSQZuj8tFGjqTVKjmpHMv1AQ7OsBpGMtXPpuNOkNYBWerWOv1C2Bp5
	QOFc+eIoCry7pmQ==
X-Google-Smtp-Source: AGHT+IEfBwQJXAJ0BaJ2PDlgayikP86FW2WlI8LpQoXcFz5Q+W2Tz3IsJRQQT5R4meXuclvg4ooRLQ==
X-Received: by 2002:a05:600c:b85:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-442d6ddd22emr128512155e9.33.1747143628084;
        Tue, 13 May 2025 06:40:28 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7dd5sm209294255e9.35.2025.05.13.06.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:40:27 -0700 (PDT)
Date: Tue, 13 May 2025 15:40:25 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clocksource/drivers/timer-vt8500: Add watchdog
 functionality
Message-ID: <aCNLyYtxmqqklBN8@mai.linaro.org>
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
 <20250507-vt8500-timer-updates-v2-3-65e5d1b0855e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507-vt8500-timer-updates-v2-3-65e5d1b0855e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_064030_138860_0DCFA0BF 
X-CRM114-Status: GOOD (  23.38  )
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

On Wed, May 07, 2025 at 10:58:32AM +0400, Alexey Charkov wrote:
> VIA/WonderMedia system timer IP can generate a watchdog reset when its
> clocksource counter matches the value in the match register 0 and
> watchdog function is enabled. For this to work, obvously the clock event
> device must use a different match register (1~3) and respective interrupt.
> 
> Check if at least two interrupts are provided by the device tree, then use
> match register 1 for system clock events and match register 0 for watchdog
> respectively.

This code falls under the watchdog umbrella not in the clocksource. It
is better to find a way to make the timer and the watchdog separated.

The timer-gxp.c is dynamically allocating a watchdog platform device
with the shared pointer to the timer counter. IMO, it is a good
example to split this up.

> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  drivers/clocksource/Kconfig        | 11 +++++++
>  drivers/clocksource/timer-vt8500.c | 61 ++++++++++++++++++++++++++++++++++----
>  2 files changed, 67 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 487c8525996724fbf9c6e9726dabb478d86513b9..8f5e41ff23386d9ecb46b38603dae485db71cfc7 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -181,6 +181,17 @@ config VT8500_TIMER
>  	help
>  	  Enables support for the VT8500 driver.
>  
> +config VT8500_TIMER_WATCHDOG
> +	bool "Enable VT8500 watchdog functionality"
> +	depends on VT8500_TIMER
> +	depends on WATCHDOG && WATCHDOG_CORE=y

if WATCHDOG_CORE=y then WATCHDOG=y because the first one can be
enabled only if the second one is enabled.

[ ... ]

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


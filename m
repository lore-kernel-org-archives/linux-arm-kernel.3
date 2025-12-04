Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB57D216B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3Ml0jWCuH/33LJ6xOAJUPn9vl8+nWQjtPcrbdX2QrE=; b=0GL8UHPP72x//DYEqfrluG/dDH
	2Wd85IPvFPD9IAdToX7jpvkw+YvZdu8UzhrDnIWpiLEEnZxfarEJloNa360H+6EwmGQLEjZ5W7OHn
	gboRxC4a3J4eaOAHkfDNcVIikdK8deL0N6r5MjmGR2cwdcCoDqrnA5MsCPRdh9Ykn+YwGkcgQcPUy
	J82Vf468K68i5yAIn7WcwUHIsOqGDIO35DTvb+JXgazESru0hOZm0pJXVPQN43qhxfpFYGL9a/35L
	TBAap5PT7vyns/M8Wlw8zP33ky6PWu04wk90h/E9BtQWgfVeesJrs4K43Fe0XP7mSvFWZXMenA4tS
	HPkg3OqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCME-00000008IbX-2WhI;
	Thu, 04 Dec 2025 16:39:06 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCMB-00000008Iae-3RQZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 16:39:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso15485065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 08:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764866342; x=1765471142; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+3Ml0jWCuH/33LJ6xOAJUPn9vl8+nWQjtPcrbdX2QrE=;
        b=hoEeTsOeK6MWiw6x5pZdhkiYayHdAHHjZHZfFqDTtKuVKNICcUqddxww22Ixkr/2Ge
         GeJY/MOty300R4GiNGDL/Fxz5qm67quZLYKj5YKxRhrHDQqhm7IrrAg2Td7NpHa89I6H
         4hC9Qbq1p3YrcLUFQCPnXmDDuK4CVugK4MHEkbERKLUabe4awfw0j5/9Sbz4aB4xc7mI
         Vt7mFxLFv5pKxVO/lvuViXmt/hpUe2O/321hp78yNPovcBIPxU2eiJhFFaPhrHtVCGyI
         uy5vWVHwLwsihEHt1URWiBcROyLslyb7MMAQEZA0ZKTQNBTx0mADrTHj4IWLNHNRpVd2
         FVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764866342; x=1765471142;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3Ml0jWCuH/33LJ6xOAJUPn9vl8+nWQjtPcrbdX2QrE=;
        b=Mi+lh/aMoTJOVYGx8rG4Ttm4os4VO+2G2MEoTzOYjyw6nCyFXJ3PKA0DNIG5vko+Ts
         A0INKkxJzkz9kmZ6FZiKU/KUG7RnE5Kpv14oOBfDubN7qccgXMMLhBbOS1eb3Yc7lfgd
         EcP5ZuVwvO/Gok3/KJALABFthuAAtGD42ekdnOaYtvfeXRrd9bZSmrAY4tVJ0y+Wq8tr
         v1PMlFfZA9H8CZq8tC4qXGkUl3Hds1Id2A3Lk0azPdA5zNmBoyuZ9x+1hGJetdPx3YSE
         fPwtiL9nDp6LpQt+6w/ZbnvlIm3b7stMsBvS3icz8T3key86t38TWDEZ3gmYnwN2uI1p
         qFNA==
X-Gm-Message-State: AOJu0YwloTnBqLEfKnE4OfkrkNiH+OACIP4gUjyzG53Vi/oJz+aglgrW
	vpOz+lmItYMat2cvMVBNMBOdnvVHR3H+t6p0VRZZ2WrY6i8C90c4y6CW
X-Gm-Gg: ASbGncvzVHMYMJkMILPp4QKzM0stzPsH3U6IfMpObvynkRSnVqVsqs3dAbsrWJRO/fm
	0VshAfu94IXUpLw7FKZTny71pFfPFk8/vGkVF2ZAzZ4gXQ+Yh5yA65+5R7rCfCSfcm5L49hrlv/
	oLSon8TNimox40RUVSu6QkGwIzEDqz5BT6XQCjts6c4IXNqG+HOUqM3+JM7xLw2t511M3yYb4Gu
	Sb2hCTIOlAfXJAoZJ0GsrvtAzCWtu9HgM0gSVea+Rcp9wWgJWtl2WfnNzZQ1uOiAXSuIA34qddO
	KLTBIPQJ+nNeGBBYhNidF/I5ofCfWG7kgBjdH3Su/iPeN+hENJnuCWhrw7LZ1exsz7bz5aSWpvR
	nQCDVnIFCm0FPx3hUISflQ4exnGfknEfBZY1xzikLOrh3dXQFCPZY5W49gbGpj0N9MM1Irt+iIP
	PAYgvjjR8kbFuTjAj/RY1BT6BnzUngcMx2UnXgbxeRC88yTcqYx17bm58xqVHMPmwQB5j3KfZXa
	GjNPA==
X-Google-Smtp-Source: AGHT+IFsyy5YStgxmY5AXM0tdH84tJ569HxdiHRQT0I3Oz0EaQQxZDq00b76OtLTDgynIknFJ4swPA==
X-Received: by 2002:a05:600c:4710:b0:46e:1fb7:a1b3 with SMTP id 5b1f17b1804b1-4792af3d16fmr63824975e9.23.1764866341710;
        Thu, 04 Dec 2025 08:39:01 -0800 (PST)
Received: from dell.localnet (2a01-114f-4013-18c0-0000-0000-0000-0540.ea.ipv6.supernova.orange.pl. [2a01:114f:4013:18c0::540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4793092c039sm39198205e9.5.2025.12.04.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:39:01 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 david@ixit.cz
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, linux-sound@vger.kernel.org,
 David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] ALSA: Do not build obsolete API
Date: Thu, 04 Dec 2025 17:38:59 +0100
Message-ID: <1939135.tdWV9SEqCh@dell>
In-Reply-To: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
References: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2244374.irdbgypaU6";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_083903_931297_D40A8CEE 
X-CRM114-Status: GOOD (  19.91  )
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

--nextPart2244374.irdbgypaU6
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ALSA: Do not build obsolete API
Date: Thu, 04 Dec 2025 17:38:59 +0100
Message-ID: <1939135.tdWV9SEqCh@dell>
In-Reply-To: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
References: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
MIME-Version: 1.0

On Wednesday, 3 December 2025 23:34:10 CET David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> ALSA 0.9.0-rc3 is from 2002, 23 years old.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Maybe I could drop also the code and Kconfig option?
> 
> David
> ---
>  arch/arm/configs/am200epdkit_defconfig    | 1 -
>  arch/arm/configs/lpc32xx_defconfig        | 1 -
>  arch/arm/configs/omap1_defconfig          | 1 -

For omap1:

Reviewed-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>


>  arch/arm/configs/tegra_defconfig          | 1 -
>  arch/mips/configs/gcw0_defconfig          | 1 -
>  arch/mips/configs/loongson1_defconfig     | 1 -
>  arch/mips/configs/qi_lb60_defconfig       | 1 -
>  arch/mips/configs/rbtx49xx_defconfig      | 1 -
>  arch/mips/configs/rs90_defconfig          | 1 -
>  arch/powerpc/configs/85xx-hw.config       | 1 -
>  arch/powerpc/configs/86xx-hw.config       | 1 -
>  arch/powerpc/configs/mpc5200_defconfig    | 1 -
>  arch/powerpc/configs/ppc6xx_defconfig     | 1 -
>  arch/sh/configs/edosk7760_defconfig       | 1 -
>  arch/sh/configs/se7724_defconfig          | 1 -
>  arch/sh/configs/sh7785lcr_32bit_defconfig | 1 -
>  sound/core/Kconfig                        | 2 +-
>  17 files changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
> index 134a559aba3dd..2367b1685c1cf 100644
> --- a/arch/arm/configs/am200epdkit_defconfig
> +++ b/arch/arm/configs/am200epdkit_defconfig
> @@ -68,7 +68,6 @@ CONFIG_SOUND=m
>  CONFIG_SND=m
>  CONFIG_SND_MIXER_OSS=m
>  CONFIG_SND_PCM_OSS=m
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_PXA2XX_AC97=m
>  CONFIG_USB_GADGET=y
> diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
> index 2bddb0924a8c0..b9e2e603cd95e 100644
> --- a/arch/arm/configs/lpc32xx_defconfig
> +++ b/arch/arm/configs/lpc32xx_defconfig
> @@ -113,7 +113,6 @@ CONFIG_LOGO=y
>  # CONFIG_LOGO_LINUX_VGA16 is not set
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_DEBUG=y
>  CONFIG_SND_DEBUG_VERBOSE=y
> diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
> index dee820474f444..df88763fc7c3d 100644
> --- a/arch/arm/configs/omap1_defconfig
> +++ b/arch/arm/configs/omap1_defconfig
> @@ -148,7 +148,6 @@ CONFIG_SOUND=y
>  CONFIG_SND=y
>  CONFIG_SND_MIXER_OSS=y
>  CONFIG_SND_PCM_OSS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_DUMMY=y
>  CONFIG_SND_USB_AUDIO=y
> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
> index ce70ff07c978a..68aedaf92667a 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -219,7 +219,6 @@ CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
>  CONFIG_LOGO=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_DRIVERS is not set
>  CONFIG_SND_HDA_TEGRA=y
>  CONFIG_SND_HDA_INPUT_BEEP=y
> diff --git a/arch/mips/configs/gcw0_defconfig b/arch/mips/configs/gcw0_defconfig
> index fda9971bdd8d9..adb9fd62ddb0d 100644
> --- a/arch/mips/configs/gcw0_defconfig
> +++ b/arch/mips/configs/gcw0_defconfig
> @@ -79,7 +79,6 @@ CONFIG_LOGO=y
>  # CONFIG_LOGO_LINUX_VGA16 is not set
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_PROC_FS is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_SPI is not set
> diff --git a/arch/mips/configs/loongson1_defconfig b/arch/mips/configs/loongson1_defconfig
> index 02d29110f7024..1d9781ff96986 100644
> --- a/arch/mips/configs/loongson1_defconfig
> +++ b/arch/mips/configs/loongson1_defconfig
> @@ -119,7 +119,6 @@ CONFIG_WATCHDOG_SYSFS=y
>  CONFIG_LOONGSON1_WDT=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_MIPS is not set
>  # CONFIG_SND_USB is not set
> diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
> index 5f5b0254d75e7..a1bb0792f6eb1 100644
> --- a/arch/mips/configs/qi_lb60_defconfig
> +++ b/arch/mips/configs/qi_lb60_defconfig
> @@ -81,7 +81,6 @@ CONFIG_LOGO=y
>  # CONFIG_LOGO_LINUX_CLUT224 is not set
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_SPI is not set
> diff --git a/arch/mips/configs/rbtx49xx_defconfig b/arch/mips/configs/rbtx49xx_defconfig
> index 03a7bbe28a532..49c709d663beb 100644
> --- a/arch/mips/configs/rbtx49xx_defconfig
> +++ b/arch/mips/configs/rbtx49xx_defconfig
> @@ -53,7 +53,6 @@ CONFIG_TXX9_WDT=m
>  # CONFIG_VGA_ARB is not set
>  CONFIG_SOUND=m
>  CONFIG_SND=m
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_PCI is not set
> diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
> index a53dd66e9b864..8382d535e6dc1 100644
> --- a/arch/mips/configs/rs90_defconfig
> +++ b/arch/mips/configs/rs90_defconfig
> @@ -105,7 +105,6 @@ CONFIG_LOGO=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
>  # CONFIG_SND_PCM_TIMER is not set
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_PROC_FS is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_MIPS is not set
> diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
> index 8aff832173977..2b19c20a9a2c4 100644
> --- a/arch/powerpc/configs/85xx-hw.config
> +++ b/arch/powerpc/configs/85xx-hw.config
> @@ -117,7 +117,6 @@ CONFIG_SND_INTEL8X0=y
>  CONFIG_SND_POWERPC_SOC=y
>  # CONFIG_SND_PPC is not set
>  CONFIG_SND_SOC=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_USB is not set
>  CONFIG_SND=y
>  CONFIG_SOUND=y
> diff --git a/arch/powerpc/configs/86xx-hw.config b/arch/powerpc/configs/86xx-hw.config
> index e7bd265fae5a4..07f30ab881e59 100644
> --- a/arch/powerpc/configs/86xx-hw.config
> +++ b/arch/powerpc/configs/86xx-hw.config
> @@ -80,7 +80,6 @@ CONFIG_SERIO_LIBPS2=y
>  CONFIG_SND_INTEL8X0=y
>  CONFIG_SND_MIXER_OSS=y
>  CONFIG_SND_PCM_OSS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  CONFIG_SND=y
>  CONFIG_SOUND=y
>  CONFIG_ULI526X=y
> diff --git a/arch/powerpc/configs/mpc5200_defconfig b/arch/powerpc/configs/mpc5200_defconfig
> index c0fe5e76604a0..617650cea56a9 100644
> --- a/arch/powerpc/configs/mpc5200_defconfig
> +++ b/arch/powerpc/configs/mpc5200_defconfig
> @@ -75,7 +75,6 @@ CONFIG_FB_SM501=m
>  CONFIG_LOGO=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_PCI is not set
>  # CONFIG_SND_PPC is not set
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
> index b082c1fae13c9..787d707f64a42 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -726,7 +726,6 @@ CONFIG_SND_OSSEMUL=y
>  CONFIG_SND_MIXER_OSS=m
>  CONFIG_SND_PCM_OSS=m
>  CONFIG_SND_DYNAMIC_MINORS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  CONFIG_SND_VERBOSE_PRINTK=y
>  CONFIG_SND_DEBUG=y
>  CONFIG_SND_DEBUG_VERBOSE=y
> diff --git a/arch/sh/configs/edosk7760_defconfig b/arch/sh/configs/edosk7760_defconfig
> index abeae220606a3..905fac1072845 100644
> --- a/arch/sh/configs/edosk7760_defconfig
> +++ b/arch/sh/configs/edosk7760_defconfig
> @@ -79,7 +79,6 @@ CONFIG_FB_TILEBLITTING=y
>  CONFIG_FB_SH_MOBILE_LCDC=m
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_VERBOSE_PRINTK=y
>  CONFIG_SND_SOC=y
> diff --git a/arch/sh/configs/se7724_defconfig b/arch/sh/configs/se7724_defconfig
> index 9e3a54936f76f..8ca46d704c8ba 100644
> --- a/arch/sh/configs/se7724_defconfig
> +++ b/arch/sh/configs/se7724_defconfig
> @@ -83,7 +83,6 @@ CONFIG_LOGO=y
>  # CONFIG_LOGO_SUPERH_VGA16 is not set
>  CONFIG_SOUND=y
>  CONFIG_SND=m
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_SPI is not set
>  # CONFIG_SND_SUPERH is not set
> diff --git a/arch/sh/configs/sh7785lcr_32bit_defconfig b/arch/sh/configs/sh7785lcr_32bit_defconfig
> index eb63aa61b0465..5468cc53cddb4 100644
> --- a/arch/sh/configs/sh7785lcr_32bit_defconfig
> +++ b/arch/sh/configs/sh7785lcr_32bit_defconfig
> @@ -93,7 +93,6 @@ CONFIG_SND_PCM_OSS=y
>  CONFIG_SND_SEQUENCER_OSS=y
>  CONFIG_SND_HRTIMER=y
>  CONFIG_SND_DYNAMIC_MINORS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_VERBOSE_PRINTK=y
>  CONFIG_SND_DEBUG=y
> diff --git a/sound/core/Kconfig b/sound/core/Kconfig
> index 48db44fa56feb..4e7bc370ffd7f 100644
> --- a/sound/core/Kconfig
> +++ b/sound/core/Kconfig
> @@ -155,7 +155,7 @@ config SND_MAX_CARDS
>  
>  config SND_SUPPORT_OLD_API
>  	bool "Support old ALSA API"
> -	default y
> +	default n
>  	help
>  	  Say Y here to support the obsolete ALSA PCM API (ver.0.9.0 rc3
>  	  or older).
> 
> ---
> base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
> change-id: 20251203-old-alsa-fa2c2cb038e1
> 
> Best regards,
> 


--nextPart2244374.irdbgypaU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmkxuSMACgkQ2WqSnlts
jBoEqQf/Sjc0qt+Drex1cQ2k/z80kq9/GzHrmnzgVxa+5a/fQpOUSV9mjQ8dXZT1
MWYxTSIbMYegarGZ7hbByLrhKbbV04MghXJ5m+sAhdDrN6QAJp5BaVu5Ols6Z5xH
MOUch2VVP88w08L9IBrwqJNFyBNxM5O4hpgEWCoO0CccbgAmtg+M3yJfxLqpz//Y
pBXwt0bdY/fKicChMpUmrsSFda0rnItv56Mp17YoibFbVxRCKSnfOLDiE4qaIAae
L09ouH5JZ3U9AxOel2JETxGJiWxv5iDWTrsKFdKt6LCYQ/zOsCerakNM8PSxlsUo
hOPg0Wrf2HhofRo0M2unRvM7bCbPpA==
=HYXo
-----END PGP SIGNATURE-----

--nextPart2244374.irdbgypaU6--





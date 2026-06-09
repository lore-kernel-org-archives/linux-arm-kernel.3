Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE59CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 06:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CErMmgwjtyGkijbinQXt+E+wyTwr3hFPBwtSrU4ri/Q=; b=Gk21NHlen0VELLBoXqkd7N2wFN
	PFv1GPfTIU13fBaieApTuKm4J9kMdTB7yvonx/noaPm3rOQZU4HqewMv++NphtxAVQFc79WEhqdqY
	oVBPGaQBeOd+Vb1JlRzIr23JyrqHmFGM58mDNq4ToJb5VozveQxdFyInN+sFM/AnyvSGxqizpkAga
	mPxlcXoZpURSz5nLsXuhtzFjk811C3qBXTwnlWiEmfa6qYczVqeOpZcHqo51OHMeFz4VqjN242sZg
	aaIJM/DIaYIP0wGfqxj12pr8psInxOZ2/wpV52himRDuw+wNmcZAgn3urQt/NYvTI+dGOPKERNf07
	SqnxI84w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqPj-00000004viD-2plF;
	Tue, 09 Jun 2026 06:58:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqPh-00000004vhN-0Vsk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 06:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780988294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CErMmgwjtyGkijbinQXt+E+wyTwr3hFPBwtSrU4ri/Q=;
	b=KgWTIDmfu9FbEQMcuJ3hB2gwK0Tvx54wlRg+apYepPzGuT6d7U3+S0ybY4WAYgLhzYa9yX
	EPM6m3bMA7GVH3YDTIbAPA8xatXn3BcadHsEAJCM2d3hJdQTsdbDNWx/2YiZxNSzjmzwH/
	6a9WjeO3cNGn0mEI4Gx602X7AxYH7LM=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-ct58l8Q2OKuc6ihk3DvNww-1; Tue, 09 Jun 2026 02:58:13 -0400
X-MC-Unique: ct58l8Q2OKuc6ihk3DvNww-1
X-Mimecast-MFC-AGG-ID: ct58l8Q2OKuc6ihk3DvNww_1780988292
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-39659dea96eso3283931fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 23:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780988292; x=1781593092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CErMmgwjtyGkijbinQXt+E+wyTwr3hFPBwtSrU4ri/Q=;
        b=B8CQaMxtKDYlNZPXvGWI9NJgk6C3oJZ7tjWRjx7FgvRMEvNJzaK1DZELvTHTsWL1Qg
         ST8Xy4e80Lub+1dDwCgNhpMqEKF4RQ8CMoygRgxSE/vO8tP93w7yAIjikRik4sPkxVme
         a2WVGYt4PwrTFUi/nvoL29ceuJExdGxmDWCk2PuJYjcfetxXgUTcdZ6gN3ezklOvkRH4
         lqjjA6y8VnvOgESy7TxRZO5C5HSm63ABg/wPNRiWYVJMDf63d+5QbccKYghurUjKQDER
         CCK17SmLVsCRQuxJDpT1TEfgMB63fQqicgdvfjJdw3SBLTC5XVLHxFBRi7RWqfDkqJ4A
         aYLg==
X-Forwarded-Encrypted: i=1; AFNElJ/VdwSBbHDA7TTiD1nZSOnOHngjclka/3/+s4rE8FnalGrBF3zewsjSH9DEsg4Fgmc3SjQH2p1rHmX/ZZtPv448@lists.infradead.org
X-Gm-Message-State: AOJu0YwLtDqSX2NOnpTbGYmv6FpqXXv0JlYoIVHs87XOPW7ANI5VGVUZ
	iL9NjLkJ52FBMw8T+3RHv/tzuvkbhp88MyeG3O2ShU12csREDa/QiYF3Hr1I2yS/RbXqzyBKsv8
	5SBVFiqyDEYvelsEZsG1diWxqaVAugOGgdpO8oBt19ax/rdwzJE7jovri2jfD61KiiOGmP/DwY0
	m6lfq/id3syG1IdeaLP+uviMpP197bwGMyslFnipqYh//Hqp+2W6o=
X-Gm-Gg: Acq92OHUr0qTEWw37zWox9ysDJGQRPPsvdd7ZyW9bUSFwRpF1b5p5JpBCQMPBtoGGJV
	hRErDlTv4MRoQGm53TjuM6LMBXY8pDCzmyOWuOQDc2PRtBWh6iFyZc0Y9HdfXylFMDXGLim8cN9
	1Aru3vLHoBf/RLk/8NTO5c8wMmQpjvfXJ42Y2JwYsCzyTg/Qp4G9bIFNfSHMe1/S5Fvk2DaPkUo
	XJaGnK4BR0MWwZP
X-Received: by 2002:a05:651c:b22:b0:396:7280:1e5e with SMTP id 38308e7fff4ca-396d05b0e5amr22977601fa.0.1780988291642;
        Mon, 08 Jun 2026 23:58:11 -0700 (PDT)
X-Received: by 2002:a05:651c:b22:b0:396:7280:1e5e with SMTP id
 38308e7fff4ca-396d05b0e5amr22977501fa.0.1780988291073; Mon, 08 Jun 2026
 23:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat.com>
In-Reply-To: <20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 9 Jun 2026 08:57:59 +0200
X-Gm-Features: AVVi8CcxoAX6rnYlSTy8BOa9cf_aoNVALY7D0WD4kPNY6cpfFhuFnoxfIF3bvHw
Message-ID: <CALE0LRtJemHQj7o8iV1GaWJLVfTse6fp-TFvodC=AeWov6s39w@mail.gmail.com>
Subject: Re: [PATCH v3] clocksource: move NXP timer selection to drivers/clocksource
To: Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YWjQEqwmDOTG8CrVmAZlaJ8aK3YqWzy46d4fEWpD-HA_1780988292
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_235817_231362_FC821B51 
X-CRM114-Status: GOOD (  29.16  )
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

Hi all,

On Thu, May 14, 2026 at 1:14=E2=80=AFPM Enric Balletbo i Serra
<eballetbo@kernel.org> wrote:
>
> From: Enric Balletbo i Serra <eballetb@redhat.com>
>
> The Kconfig logic for selecting the scheduler clocksource on
> NXP Vybrid (VF610) uses a `choice` block restricted to 32-bit ARM. This
> prevents 64-bit architectures, such as the NXP S32 family, from enabling
> the NXP Periodic Interrupt Timer (PIT) driver (CONFIG_NXP_PIT_TIMER).
>
> Relocate the NXP clocksource selection from arch/arm/mach-imx/Kconfig to
> drivers/clocksource/Kconfig. This allows the configuration to be shared
> across different architectures.
>
> Update the selection to include support for ARCH_S32 and add a "None"
> option restricted to ARCH_S32, since Vybrid lacks the ARM Architected
> Timer. The Vybrid Global Timer option is restricted to ARCH_MULTI_V7
> SOC_VF610 platforms to prevent it from being visible on Cortex-M4 builds,
> which lack the ARM Global Timer hardware.
>
> Fixes: bee33f22d7c3 ("clocksource/drivers/nxp-pit: Add NXP Automotive s32=
g2 / s32g3 support")
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>

Now that Frank [1] has created a merge request for Linux 7.1-rc1 and
the request includes

      arm64: dts: s32g: add PIT support for s32g2 and s32g3

If this patch is ok, would it make sense to pick that patch?
Otherwise, we won't be able to select the PIT timer for aarch64 only
builds.

Thanks.,
  Enric

[1] From: Frank.Li@nxp.com

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
tags/imx-dt64-7.2

for you to fetch changes up to c10cfc952215644956284a42fa7b7860dfbcb5f5:



> ---
> Changes in v3:
> - Restrict VF_TIMER_NONE to ARCH_S32 to prevent selecting it on Vybrid
>   platforms which lack the ARM Architected Timer
> - Link to v2: https://lore.kernel.org/r/20260513-fix-nxp-timer-v2-1-533b9=
9c57b67@redhat.com
>
> Changes in v2:
> - Fix VF_USE_ARM_GLOBAL_TIMER dependency: use ARCH_MULTI_V7 instead of
>   ARM to prevent the option from being visible on Cortex-M4 builds
>   (Sashiko AI review)
> - Link to v1: https://lore.kernel.org/r/20260302-fix-nxp-timer-v1-1-af4bc=
62d4ffa@redhat.com
> ---
>  arch/arm/mach-imx/Kconfig   | 21 ---------------------
>  drivers/clocksource/Kconfig | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+), 21 deletions(-)
>
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index 6ea1bd55acf8..a361840d7a04 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -227,27 +227,6 @@ config SOC_VF610
>         help
>           This enables support for Freescale Vybrid VF610 processor.
>
> -choice
> -       prompt "Clocksource for scheduler clock"
> -       depends on SOC_VF610
> -       default VF_USE_ARM_GLOBAL_TIMER
> -
> -       config VF_USE_ARM_GLOBAL_TIMER
> -               bool "Use ARM Global Timer"
> -               depends on ARCH_MULTI_V7
> -               select ARM_GLOBAL_TIMER
> -               select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> -               help
> -                 Use the ARM Global Timer as clocksource
> -
> -       config VF_USE_PIT_TIMER
> -               bool "Use PIT timer"
> -               select NXP_PIT_TIMER
> -               help
> -                 Use SoC Periodic Interrupt Timer (PIT) as clocksource
> -
> -endchoice
> -
>  endif
>
>  endif
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index d1a33a231a44..d9c76dd443f8 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -793,4 +793,35 @@ config RTK_SYSTIMER
>           this option only when building for a Realtek platform or for co=
mpilation
>           testing.
>
> +choice
> +       prompt "NXP clocksource for scheduler clock"
> +       depends on SOC_VF610 || ARCH_S32
> +       # Default to Global Timer for Vybrid (32-bit)
> +       default VF_USE_ARM_GLOBAL_TIMER if SOC_VF610
> +       # Default to None for S32 (64-bit)
> +       default VF_TIMER_NONE if ARCH_S32
> +
> +       config VF_USE_ARM_GLOBAL_TIMER
> +               bool "Use NXP Vybrid Global Timer"
> +               depends on ARCH_MULTI_V7 && SOC_VF610
> +               select ARM_GLOBAL_TIMER
> +               select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> +               help
> +                 Use the NXP Vybrid Global Timer as clocksource.
> +
> +       config VF_USE_PIT_TIMER
> +               bool "Use NXP PIT timer"
> +               select NXP_PIT_TIMER
> +               help
> +                 Use NXP Periodic Interrupt Timer (PIT) as clocksource.
> +
> +       config VF_TIMER_NONE
> +               bool "None (Use standard Arch Timer)"
> +               depends on ARCH_S32
> +               help
> +                 Do not use any specific NXP timer driver. Use the stand=
ard
> +                 ARM Architected Timer instead.
> +
> +endchoice
> +
>  endmenu
>
> ---
> base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
> change-id: 20260302-fix-nxp-timer-9cb1fbd7afcd
>
> Best regards,
> --
> Enric Balletbo i Serra <eballetb@redhat.com>
>



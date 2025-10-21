Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6F9CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 21:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMiBejLPKhYPEtqA8D8Oln6QNM1cO/EDknKj+TQbAkw=; b=KdH6ht0d95PLcABJvb9ANY1tQA
	Bo/sLuZdBIn41rsEyH9pFWosOy67KTvG6832pQDCLIu3GHoDS55oTR7GnZxKwNpQ8/ZVu+ogkzzpj
	GrKZYKgmcCW8I3CviMEqPtFBQRpp/gIecxjqoILK2fi0mYZKu91QMgUllkcmWHmtISFSuOhJWKvcb
	V5cChgkNnfvo1ZvoeEhrzwGHCNZtT1HGp4Koi4RhiUEQs8Dl2njISEyqex4BeEjfbHnJ1Ah1Yb8NH
	R/urNN2GE36PUgD9jEEPJPlAz2Fqu9PE5BHDFCB07aZjmmd7c+QlU8NmuGMs+FZ8H98mEWayJFlfI
	+m9IF3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJW9-00000000frs-2kM0;
	Tue, 21 Oct 2025 21:03:41 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJW7-00000000frS-09IS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 21:03:40 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-651cda151f0so2519849eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 14:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761080618; x=1761685418; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tMiBejLPKhYPEtqA8D8Oln6QNM1cO/EDknKj+TQbAkw=;
        b=ZHQiUK7BllPq+2jhk/y+3f7Q94Dgf7gD9qJK9OHhYjoagbAcPyQUDvLmeJeuxVELgv
         DNTaX6v/I+LgYIl5S2jAJVe3t6VZoCUXPGFS/WGVRW36H4G67BI2QCeR7vGIckzJ7D9+
         YvwGtRF7vIWf4DZc2Nu+6HboDacUKJSrNaRpd6taOoSvETBOct4QIjUH9iwZWIgnUnlh
         EqJgwvIAVglOxetnNJj4oS+JuVa92Bu51lanu3PHYdYDyW7T9YV9XTwm7dBrDqZWHbb9
         4VwLcyQAhosj7Tz0MNU6+E2zpiRtkoNW2lW48Tq2rBol+tpQlAHGYWVqb8rna0e11WSu
         +9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761080618; x=1761685418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMiBejLPKhYPEtqA8D8Oln6QNM1cO/EDknKj+TQbAkw=;
        b=jrUirwBZucwLvaCchEWhl4Z4JD2TAJ2L2PqIFe/MMMPZxLQPoWtphEIGZIF6ux3GYz
         SIgGqZSx9ELe7aOd/Q8nFld5/RN81/FiWok4HrAPZySbGsnBRE6tazq2Hyl93doxz2QF
         Mvh2XE+nvZpC1xbBqX1qdzhhBY6cWSgLnF0NoAwdxkMupbuoIF+lbedQSB7veDiFXxaF
         uIeo3wp4+AZOr0sPQCvbP0BOnBw7IVwDiJ33DuU3pBk2SM7mtj0yVBZOy46cr3RpYVdO
         dD9TiDt9u7wlV+q/tA2Dr2DQKaSTQBCdM+jPE1TJrzoGLQ9FryWpi7ToS9FO+4ayd4jb
         fcsg==
X-Forwarded-Encrypted: i=1; AJvYcCUpKRW7Jd0A9y3crqlrGtyKKm3esHeruoVx2WXri/crVvCsD4p8hw5MtHYZ7DH1IVpv6IMbFbPqeSND1/dKe47p@lists.infradead.org
X-Gm-Message-State: AOJu0YwIvIyLsiTSrGSauXo5jz/4vVVfwGOveISS8zvzsUFMBlfWfgJE
	ilWdzXpAPeO3q3Qm05kcUc6ZAtBxSuTllrS1L9oHcgW8Ureegp+U/HSGRcLv086Ai7oND7XwOmo
	uTL4igrl0GO/Ff9Jtdkcwqy4dUTDRpcaZoJUFZKXFSw==
X-Gm-Gg: ASbGnctL8gPcfIsybpADK05IhxNMwgEXc86JABl9T3fIjy5H/xV5KDrT9SU4v5fKlw3
	aFQ7FBog2030X6GXTONz45HPyzB+9zqnLlKM4ADO3cIbek1G8U/FdrAxECE/tRizda5OtTgGg8M
	btUv/uY73LM7nPi3q+7vAo9pSGDwyBhB9O3tozKagOfPAC4IMfxAHewImvHrJOyla9lPu1jnZUO
	wqT8oDN3zEJonn+ran9Zgp6qQu4tq0ZcN0ijY4lR8vETIr4OqqeyBbV9HoyjT584yZLbUp2kxcs
	nVTzyDM=
X-Google-Smtp-Source: AGHT+IGhhxXOWUhypLR513EstnVpxP2n9PBtNjWPgYEhC5md6NPI4NHWrGoHnBDHjXCimVbmmxclmA3LGRFQCjGw+oI=
X-Received: by 2002:a05:6820:201:b0:64e:8106:bb91 with SMTP id
 006d021491bc7-651c7e6c8c2mr7330485eaf.8.1761080617763; Tue, 21 Oct 2025
 14:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-8-72851ee00300@linaro.org> <4383c2fb-5267-4b7b-90e9-6046c2686912@kernel.org>
In-Reply-To: <4383c2fb-5267-4b7b-90e9-6046c2686912@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 21 Oct 2025 22:03:26 +0100
X-Gm-Features: AS18NWDGDGo3ssrAJMIVVsew6HYnxHA2tTZVJevoKlj0HODQs8C9nRRKXRt97mU
Message-ID: <CADrjBPov=7t876dqpTS71j_xNFOrJv7_Ym7abYVLzjypoOYKng@mail.gmail.com>
Subject: Re: [PATCH 8/9] clk: samsung: gs101: Enable auto_clock_gate mode for
 each gs101 CMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_140339_269570_ED9E00AD 
X-CRM114-Status: GOOD (  32.48  )
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

Hi Krzysztof,

Thanks for the review feedback.

On Tue, 21 Oct 2025 at 20:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/10/2025 22:51, Peter Griffin wrote:
> > Enable auto clock mode, and define the additional fields which are used
> > when this mode is enabled.
> >
> > /sys/kernel/debug/clk/clk_summary now reports approximately 308 running
> > clocks and 298 disabled clocks. Prior to this commit 586 clocks were
> > running and 17 disabled. To ensure compatability with older DTs the
>
> Typo

Will fix.

>
> > resource size is checked and an error issued if the DT needs updating.
>
> I fail to see how you keek it compatible. See further.
>
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/clk/samsung/clk-gs101.c | 80 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >
> > diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
> > index 70b26db9b95ad0b376d23f637c7683fbc8c8c600..baf41ae6c9e2480cb83531acf7eae190c6aff819 100644
> > --- a/drivers/clk/samsung/clk-gs101.c
> > +++ b/drivers/clk/samsung/clk-gs101.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/clk-provider.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/of.h>
> > +#include <linux/of_address.h>
> >  #include <linux/platform_device.h>
> >
> >  #include <dt-bindings/clock/google,gs101.h>
> > @@ -17,6 +18,8 @@
> >  #include "clk-exynos-arm64.h"
> >  #include "clk-pll.h"
> >
> > +int check_cmu_res_size(struct device_node *np);
> > +
> >  /* NOTE: Must be equal to the last clock ID increased by one */
> >  #define CLKS_NR_TOP  (CLK_GOUT_CMU_TPU_UART + 1)
> >  #define CLKS_NR_APM  (CLK_APM_PLL_DIV16_APM + 1)
> > @@ -26,6 +29,10 @@
> >  #define CLKS_NR_PERIC0       (CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
> >  #define CLKS_NR_PERIC1       (CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
> >
> > +#define GS101_GATE_DBG_OFFSET 0x4000
> > +#define GS101_DRCG_EN_OFFSET  0x104
> > +#define GS101_MEMCLK_OFFSET   0x108
> > +
> >  /* ---- CMU_TOP ------------------------------------------------------------- */
> >
> >  /* Register Offset definitions for CMU_TOP (0x1e080000) */
> > @@ -1433,6 +1440,9 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
> >       .nr_clk_ids             = CLKS_NR_TOP,
> >       .clk_regs               = cmu_top_clk_regs,
> >       .nr_clk_regs            = ARRAY_SIZE(cmu_top_clk_regs),
> > +     .auto_clock_gate        = true,
> > +     .gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> > +     .option_offset          = CMU_CMU_TOP_CONTROLLER_OPTION,
> >  };
> >
> >  static void __init gs101_cmu_top_init(struct device_node *np)
> > @@ -1900,6 +1910,11 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
> >            CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
> >  };
> >
> > +static const unsigned long dcrg_memclk_sysreg[] __initconst = {
> > +     GS101_DRCG_EN_OFFSET,
> > +     GS101_MEMCLK_OFFSET,
> > +};
> > +
> >  static const struct samsung_cmu_info apm_cmu_info __initconst = {
> >       .mux_clks               = apm_mux_clks,
> >       .nr_mux_clks            = ARRAY_SIZE(apm_mux_clks),
> > @@ -1912,6 +1927,12 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
> >       .nr_clk_ids             = CLKS_NR_APM,
> >       .clk_regs               = apm_clk_regs,
> >       .nr_clk_regs            = ARRAY_SIZE(apm_clk_regs),
> > +     .sysreg_clk_regs        = dcrg_memclk_sysreg,
> > +     .nr_sysreg_clk_regs     = ARRAY_SIZE(dcrg_memclk_sysreg),
> > +     .auto_clock_gate        = true,
> > +     .gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> > +     .drcg_offset            = GS101_DRCG_EN_OFFSET,
> > +     .memclk_offset          = GS101_MEMCLK_OFFSET,
> >  };
> >
> >  /* ---- CMU_HSI0 ------------------------------------------------------------ */
> > @@ -2375,7 +2396,14 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
> >       .nr_clk_ids             = CLKS_NR_HSI0,
> >       .clk_regs               = hsi0_clk_regs,
> >       .nr_clk_regs            = ARRAY_SIZE(hsi0_clk_regs),
> > +     .sysreg_clk_regs        = dcrg_memclk_sysreg,
> > +     .nr_sysreg_clk_regs     = ARRAY_SIZE(dcrg_memclk_sysreg),
> >       .clk_name               = "bus",
> > +     .auto_clock_gate        = true,
> > +     .gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> > +     .option_offset          = HSI0_CMU_HSI0_CONTROLLER_OPTION,
> > +     .drcg_offset            = GS101_DRCG_EN_OFFSET,
> > +     .memclk_offset          = GS101_MEMCLK_OFFSET,
> >  };
> >
> >  /* ---- CMU_HSI2 ------------------------------------------------------------ */
> > @@ -2863,7 +2891,14 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
> >       .nr_clk_ids             = CLKS_NR_HSI2,
> >       .clk_regs               = cmu_hsi2_clk_regs,
> >       .nr_clk_regs            = ARRAY_SIZE(cmu_hsi2_clk_regs),
> > +     .sysreg_clk_regs        = dcrg_memclk_sysreg,
> > +     .nr_sysreg_clk_regs     = ARRAY_SIZE(dcrg_memclk_sysreg),
> >       .clk_name               = "bus",
> > +     .auto_clock_gate        = true,
> > +     .gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> > +     .option_offset          = HSI2_CMU_HSI2_CONTROLLER_OPTION,
> > +     .drcg_offset            = GS101_DRCG_EN_OFFSET,
> > +     .memclk_offset          = GS101_MEMCLK_OFFSET,
> >  };
> >
> >  /* ---- CMU_MISC ------------------------------------------------------------ */
> > @@ -3423,11 +3458,37 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
> >       .nr_clk_ids             = CLKS_NR_MISC,
> >       .clk_regs               = misc_clk_regs,
> >       .nr_clk_regs            = ARRAY_SIZE(misc_clk_regs),
> > +     .sysreg_clk_regs        = dcrg_memclk_sysreg,
> > +     .nr_sysreg_clk_regs     = ARRAY_SIZE(dcrg_memclk_sysreg),
> >       .clk_name               = "bus",
> > +     .auto_clock_gate        = true,
> > +     .gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> > +     .option_offset          = MISC_CMU_MISC_CONTROLLER_OPTION,
> > +     .drcg_offset            = GS101_DRCG_EN_OFFSET,
> > +     .memclk_offset          = GS101_MEMCLK_OFFSET,
> >  };
> >
> > +/* for old DT compatbility with incorrect CMU size*/
> > +int check_cmu_res_size(struct device_node *np)
> > +{
> > +     struct resource res;
> > +     resource_size_t size;
> > +
> > +     if (of_address_to_resource(np, 0, &res))
> > +             return -ENODEV;
> > +
> > +     size = resource_size(&res);
> > +     if (size != 0x10000) {
> > +             pr_warn("%pOF: resource to small. Please update your DT\n", np);
> > +             return -ENODEV;
> > +     }
> > +     return 0;
> > +}
> > +
> >  static void __init gs101_cmu_misc_init(struct device_node *np)
> >  {
> > +     if (check_cmu_res_size(np))
> > +             return;
>
> You will not register CMU on old DTB.

By "compatible" I meant the driver detects an old DTB with an
incorrect reg size and issues an error message on the console to
update your DT (as opposed to crashing trying to access a register
that hasn't been mapped).

Is it enough to re-word the commit message to make it clearer what will happen?

An alternative might be to try registering all the gates in manual
mode, but that seems like it would add more complexity for not much
benefit. It would also require that clk_ignore_unused kernel parameter
to have been passed (as manual clock mode has never worked without it)
and whilst it might boot today I imagine it would bitrot fast as
additional CMUs are added (and thus probably crash in a much more
obscure way).

Peter


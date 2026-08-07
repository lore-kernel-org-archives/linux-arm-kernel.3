Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A0CC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yi6S+LhgjcgA9+XOyVFjsUkTbWiytoaZWeD42xfjOIs=; b=fcLNUkN51s5aT0ye0+8Wc9OqeV
	dkUJXjKhkZqCKOfLau4gdGR7lZzZBpXpIA1OUonK4/2+WBcrYIuVygnp+VANBRXTuAgji6KdGQoON
	mG0B7Z+lvtJW7t0xt5mHRriz14OwuIGu4ychCBwmjiC/ZZEKmu4K4aBYpeVAYMXbOjfmXHHmZg4N+
	gbLreFgScnWYeChkOLfgWkF0cIxJELe6q7KtA5KbgtZYhCVA2vp0vIz5hXHAGn+T3BnavuQiGSkDg
	WwXWbgKFoVse0Bvu6sx3J2knzfq3F/q3beOrE3cipTPHIQ4XfUnBPvEn/GbfbS/ilyaEIzf1wLcTp
	ZMhtaZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNa4-00000008R6h-1Otj;
	Fri, 07 Aug 2026 16:38:00 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNa1-00000008R66-2zr9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:37:59 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a8d251so4941491a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786120675; cv=none;
        d=google.com; s=arc-20260327;
        b=fJ3yaz/gvrRPviMhcQSkPgR929GMdlfb5u+uG+42A2YYmYlSQoeGNwR9Tx5EFnfaH5
         jDcYy6z2GlhG1SXlZuDrNFQMKIGx6bqBNfvfJEmYcGJxaf+/u/dQ0U6zvgDHKMcAjFYH
         cAvfOVfHUlLSKpI7Wc0I6xzvVu6ikg3c36Y3exV3bTXt8bZW2RpJ4DMrJABWySHxMvHB
         rf+VZaQICJWQLs3KNmFjTH0SXcaYSH5z5t++6QUqYMcd8YJMrU9qrfDkm841fPEfESwb
         W2pdwCjFd02khpvJ4usyKvG4iJl5CPItfG0ZjC0QpP2QWJfDdrFAeWOu0V1jetspKldF
         Fymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yi6S+LhgjcgA9+XOyVFjsUkTbWiytoaZWeD42xfjOIs=;
        fh=1XekQZLH64UXi5HZAMs6aH8cxVuK25/iW5+k8ud+GuE=;
        b=lsr3IPCPbqNqdUyIOS9nLBH6IN6ULwlw0sMjFHYxWPtgaCzbaUlZxRaRUzfMlUg4Fi
         9qbGNE/oHdsEm1ZdGu4UVvcSmS05RO9OaM+GM6zpixuE7sRBof12LVy+2VwXik5JubFr
         qDBJTnW1hbdQmLHlfMK3/LMrjuswTG9jxM0M64gqN570zSBHwDsjvYTVj+9gidL88H6P
         fT2lMutCsBrkfqtWhH5LXrfTTkww7mNLJzOHg01InDjO+HVrvX69WxK4gETjfcRVwL5+
         gzXer6yC/j99THBAyW8J87cv7OGuYKqQzOV/ACWZGit1z+402oGXmBuXpwESagzaz00E
         7p+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786120675; x=1786725475; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yi6S+LhgjcgA9+XOyVFjsUkTbWiytoaZWeD42xfjOIs=;
        b=riLRaTiYLbjYhOGQ3P0tsNBe5N4eKMMw7hYCdl6dyLXw5/ji/8i6et0/ZKbNhM2vqs
         q9GSwByN16GU37Y2rNS9KR2g/3Hzl1sP4q+DC5Kuif9fs3sM47O7+XtBZAJuJ4cRcqah
         JvnV3LYvEge2+tgqXl2bctDnlt8jcXNkLBiKRZK80Q3PcCnVb+SmRRzKFBQ2Kaq8Iprn
         QOVpa0VjgQ6cx/nWWhpISNPcXbp/RwA/vg+zTShVKLY7ufu9IgLyZSpg8JMB/UUUl+JQ
         N2iTJgBJ9bqwIPGdrzz5BtPbePHJ6f7mRpfDpqwm7e6+FFmWjcNg4sX9uF8K6XpxVVdL
         aeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120675; x=1786725475;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yi6S+LhgjcgA9+XOyVFjsUkTbWiytoaZWeD42xfjOIs=;
        b=IP4/pC8GmGMn7Y3eqmSSj2vC4yWvSZ+9wzO6z/vILw3UNFust4LlFOVaa0DtzvnJIF
         7euEz1j6Jio9sYp2UI013C9Fo79N2XVgqFrWzfW8kGQVBzQa0LCvEfMGu3aXyw6NY5T2
         HLdNpVU2YuJG5QpffF7WMJwN7ThYITOVh+8fTvBIj/JBa4VV8tFr1peuf8gZjtYleJAj
         tG7RT6TvgRqVWrUgfz5ZEsFlOY7oMHJl/qLrm15LR+9iX2bq6fFp8iszqODk3qHsdtH4
         pY5SntRM1lYvthFAicoWzZ1x9QX0KLAQFh2koAYG+wu7DWFCj9IXKgfcXJOboMcT5J/+
         XUkw==
X-Forwarded-Encrypted: i=1; AHgh+RqCe2/vh2ZfTaGTZBVc5VlaiKpkXlPGJKfPkZ9epcbcmKB4+8G8cPWprMVTsn/VYaSVRjHgHrFLkxoBBCakf6Q3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6t24XaK1Lk+5PQ7ICtqDSli2qFMD6TbfvBQV7jNqImRwlJQIi
	sJKhbNyGSIrlDovks+6WfaNQiBl0uX05gbjkZfzTC8ZHIEk0vVfrI99C/gCAVCxJURn0wjeAO6D
	PnHWvjsXlO1MHWYNrIknsLv4qaKWaSqdCPzPx7OHJ7TSK+FPNadnNpP1+wg==
X-Gm-Gg: AR+sD11yO5GD0W14deFVHGmSp8MjeTfxsCAsRDYtOsdnUnrrpLp4JkuSuaSXTDjoFGd
	G0quEHwXZy+FmHLrpeyF8BkewtsKkP766Lov2WNmxVGZLO5L3l02VRfJ3KXWfTbnpGV3PZaP4Ij
	F86XyVOHNRfD8wx+atZzZU9DUk2v3SYAQQeVbKFVsTjQMXMP4ri2ZeieAFUpo5iNTxIfgKcdL9h
	10kKIMvKKfvmjKA619Y239KnieGHOFEuOJ35gXI+iyb8u5XNh6ixN+O9HjPvlNq8jVjOsbw8YWd
	kjNmlB9z5zH3/s7XbQnKB1GDvi23PwFnwm1XoWlNXlV7aTOeUH87vx6hwwNLb+HFBYhyLfbuCYH
	5cyyoypmZK3z0HQ==
X-Received: by 2002:a05:6402:52cb:b0:6a1:b4ff:b755 with SMTP id
 4fb4d7f45d1cf-6a1b4ffc544mr5248788a12.5.1786120675288; Fri, 07 Aug 2026
 09:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a@epcas5p1.samsung.com>
 <20260728121111.2077860-1-raghav.s@samsung.com> <20260728121111.2077860-4-raghav.s@samsung.com>
In-Reply-To: <20260728121111.2077860-4-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 7 Aug 2026 17:37:42 +0100
X-Gm-Features: AUfX_mzWb0mS1p3X663f5ZFYdlb3fzqWWtfaTaduhwXCltjHvOuaujfltkwZGPY
Message-ID: <CADrjBPrBMea9kmYG-=0w=gA6xZYk1+1uFNvjqJUeNXeRaxaHZA@mail.gmail.com>
Subject: Re: [PATCH 03/13] clk: samsung: exynos8855: add block top and peric
 clock support
To: "raghav.s" <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, is.gandhi@samsung.com, 
	ts.amit@samsung.com, pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_093757_993677_444879CB 
X-CRM114-Status: GOOD (  22.19  )
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

Hi Raghav,

Thanks for your patch, it's great to see more Exynos SoC support being
upstreamed.

On Tue, 28 Jul 2026 at 12:52, raghav.s <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_TOP & CMU_PERIC, these provide clocks for TOP & PERIC
>
> Signed-off-by: raghav.s <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/Makefile         |   1 +
>  drivers/clk/samsung/clk-exynos8855.c | 420 +++++++++++++++++++++++++++
>  2 files changed, 421 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos8855.c
>
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index b3c4ef4e0dbf..29a11f5de121 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK) += clk-exynos8895.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos990.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynosautov9.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynosautov920.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos8855.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-gs101.o
>  obj-$(CONFIG_EXYNOS_ACPM_CLK)          += clk-acpm.o
>  obj-$(CONFIG_S3C64XX_COMMON_CLK)       += clk-s3c64xx.o
> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
> new file mode 100644
> index 000000000000..93528f0077a4
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos8855.c
> @@ -0,0 +1,420 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Samsung Electronics Co., Ltd.
> + * Author: Raghav Sharma <raghav.s@samsung.com>
> + *
> + * Common Clock Framework support for Exynos 8855 SoC.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/samsung,exynos8855.h>
> +
> +#include "clk.h"
> +#include "clk-exynos-arm64.h"
> +
> +/* NOTE: Must be equal to the last clock ID increased by one */
> +#define CLKS_NR_TOP                     (FOUT_MMC_PLL_DIV2 + 1)
> +#define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC_IPCLKPORT_PCLK + 1)
> +
> +/* ---- CMU_TOP --------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_TOP (0x13900000) */
> +/* PLL */
> +#define PLL_LOCKTIME_PLL_SHARED0                            0x8
> +#define PLL_LOCKTIME_PLL_SHARED1                            0x10
> +#define PLL_LOCKTIME_PLL_SHARED2                            0x18
> +#define PLL_LOCKTIME_PLL_MMC                                 0x20
> +#define PLL_LOCKTIME_PLL_SHARED3                            0x28
> +#define PLL_LOCKTIME_PLL_SHARED4                            0x38
> +#define PLL_CON0_PLL_MMC                                    0x1c0
> +#define PLL_CON3_PLL_MMC                                    0x1cc
> +#define PLL_CON0_PLL_SHARED0                                0x100
> +#define PLL_CON3_PLL_SHARED0                                0x10c
> +#define PLL_CON0_PLL_SHARED1                                0x140
> +#define PLL_CON3_PLL_SHARED1                                0x14c
> +#define PLL_CON0_PLL_SHARED2                                0x180
> +#define PLL_CON3_PLL_SHARED2                                0x18c
> +#define PLL_CON0_PLL_SHARED3                                0x200
> +#define PLL_CON3_PLL_SHARED3                                0x20c
> +#define PLL_CON0_PLL_SHARED4                                0x280
> +#define PLL_CON3_PLL_SHARED4                                0x28c
> +
> +/* MUX */
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_NOC                 0x1078
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_MMC_CARD            0x107c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_IP                  0x1080
> +
> +/* DIV */
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_NOC                 0x1878
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_MMC_CARD            0x187c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_IP                  0x1880
> +
> +static const unsigned long top_clk_regs[] __initconst = {
> +       PLL_LOCKTIME_PLL_MMC,
> +       PLL_LOCKTIME_PLL_SHARED0,
> +       PLL_LOCKTIME_PLL_SHARED1,
> +       PLL_LOCKTIME_PLL_SHARED2,
> +       PLL_LOCKTIME_PLL_SHARED3,
> +       PLL_LOCKTIME_PLL_SHARED4,
> +       PLL_CON0_PLL_MMC,
> +       PLL_CON3_PLL_MMC,
> +       PLL_CON0_PLL_SHARED0,
> +       PLL_CON3_PLL_SHARED0,
> +       PLL_CON0_PLL_SHARED1,
> +       PLL_CON3_PLL_SHARED1,
> +       PLL_CON0_PLL_SHARED2,
> +       PLL_CON3_PLL_SHARED2,
> +       PLL_CON0_PLL_SHARED3,
> +       PLL_CON3_PLL_SHARED3,
> +       PLL_CON0_PLL_SHARED4,
> +       PLL_CON3_PLL_SHARED4,
> +       CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_NOC,
> +       CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_MMC_CARD,
> +       CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_IP,
> +       CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_NOC,
> +       CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_MMC_CARD,
> +       CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_IP,
> +};

You are missing many registers for the CMU from the top_clk_regs array
and only exposing the registers for the gates/mux/div etc you are
exposing to CCF. When the CMU's power domain is turned off/on (maybe
not for top, but for peric and others) the suspend/resume callbacks
won't restore the state for any of the missing registers. In such a
senario the system will likely hang because all the gates/divs/mux etc
that aren't exposed to CCF will rely on the CMU being in automatic
mode from the bootloader.

In the next version please add all the CMU registers so that state
isn't lost during suspend/resume (this applies to the other CMUs being
added as well).

> +
> +static const struct samsung_pll_clock top_pll_clks[] __initconst = {
> +       PLL(pll_4313, FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
> +           PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0, NULL),
> +       PLL(pll_4313, FOUT_SHARED1_PLL, "fout_shared1_pll", "oscclk",
> +           PLL_LOCKTIME_PLL_SHARED1, PLL_CON3_PLL_SHARED1, NULL),
> +       PLL(pll_4313, FOUT_SHARED2_PLL, "fout_shared2_pll", "oscclk",
> +           PLL_LOCKTIME_PLL_SHARED2, PLL_CON3_PLL_SHARED2, NULL),
> +       PLL(pll_4313, FOUT_SHARED3_PLL, "fout_shared3_pll", "oscclk",
> +           PLL_LOCKTIME_PLL_SHARED3, PLL_CON3_PLL_SHARED3, NULL),
> +       PLL(pll_4313, FOUT_SHARED4_PLL, "fout_shared4_pll", "oscclk",
> +           PLL_LOCKTIME_PLL_SHARED4, PLL_CON3_PLL_SHARED4, NULL),
> +       PLL(pll_4313, FOUT_MMC_PLL, "fout_mmc_pll", "oscclk",
> +           PLL_LOCKTIME_PLL_MMC, PLL_CON3_PLL_MMC, NULL),
> +};
> +
> +/* List of parent clocks for Muxes in CMU_TOP */
> +PNAME(mout_shared0_pll_p) = { "oscclk", "fout_shared0_pll" };
> +PNAME(mout_shared1_pll_p) = { "oscclk", "fout_shared1_pll" };
> +PNAME(mout_shared2_pll_p) = { "oscclk", "fout_shared2_pll" };
> +PNAME(mout_shared3_pll_p) = { "oscclk", "fout_shared3_pll" };
> +PNAME(mout_shared4_pll_p) = { "oscclk", "fout_shared4_pll" };
> +PNAME(mout_mmc_pll_p) = { "oscclk", "fout_mmc_pll" };
> +
> +PNAME(mout_clkcmu_peric_noc_p)            = { "dout_shared0_div2", "dout_shared0_div3",
> +                                               "dout_shared1_div2", "dout_shared1_div3",
> +                                               "dout_shared2_div2", "dout_shared2_div3",
> +                                               "fout_mmc_pll_div2", "dout_shared3_div3"};
> +PNAME(mout_clkcmu_peric_mmc_card_p)       = { "oscclk", "dout_shared0_div2",
> +                                               "fout_mmc_pll_div1", "dout_shared1_div2",
> +                                               "dout_shared2_div2", "dout_shared2_div3",
> +                                               "dout_shared3_div2", "dout_shared3_div3"};
> +PNAME(mout_clkcmu_peric_ip_p)            = { "dout_shared0_div4", "dout_shared1_div4"};
> +
> +static const struct samsung_mux_clock top_mux_clks[] __initconst = {
> +       MUX(MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_p,
> +           PLL_CON0_PLL_SHARED0, 4, 1),
> +       MUX(MOUT_SHARED1_PLL, "mout_shared1_pll", mout_shared1_pll_p,
> +           PLL_CON0_PLL_SHARED1, 4, 1),
> +       MUX(MOUT_SHARED2_PLL, "mout_shared2_pll", mout_shared2_pll_p,
> +           PLL_CON0_PLL_SHARED2, 4, 1),
> +       MUX(MOUT_SHARED3_PLL, "mout_shared3_pll", mout_shared3_pll_p,
> +           PLL_CON0_PLL_SHARED3, 4, 1),
> +       MUX(MOUT_SHARED4_PLL, "mout_shared4_pll", mout_shared4_pll_p,
> +           PLL_CON0_PLL_SHARED4, 4, 1),
> +       MUX(MOUT_MMC_PLL, "mout_mmc_pll", mout_mmc_pll_p,
> +           PLL_CON0_PLL_MMC, 4, 1),
> +       MUX(CLKCMU_MOUT_PERIC_NOC, "mout_clkcmu_peric_noc",
> +           mout_clkcmu_peric_noc_p, CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_NOC, 0, 3),
> +       MUX(CLKCMU_MOUT_PERIC_MMC_CARD, "mout_clkcmu_peric_mmc_card",
> +           mout_clkcmu_peric_mmc_card_p, CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_MMC_CARD, 0, 3),
> +       MUX(CLKCMU_MOUT_PERIC_IP, "mout_clkcmu_peric_ip",
> +           mout_clkcmu_peric_ip_p, CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_IP, 0, 1),
> +};
> +
> +static const struct samsung_div_clock top_div_clks[] __initconst = {
> +       DIV(CLKCMU_DOUT_PERIC_NOC, "dout_clkcmu_peric_noc",
> +           "mout_clkcmu_peric_noc", CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_NOC,
> +           0, 4),
> +       DIV(CLKCMU_DOUT_PERIC_MMC_CARD, "dout_clkcmu_peric_mmc_card",
> +           "mout_clkcmu_peric_mmc_card", CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_MMC_CARD,
> +           0, 10),
> +       DIV(CLKCMU_DOUT_PERIC_IP, "dout_clkcmu_peric_ip",
> +           "mout_clkcmu_peric_ip", CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_IP,
> +           0, 4),
> +
> +};
> +
> +static const struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initconst = {
> +       FFACTOR(DOUT_SHARED0_DIV1, "dout_shared0_div1",
> +               "mout_shared0_pll", 1, 1, 0),
> +       FFACTOR(DOUT_SHARED0_DIV2, "dout_shared0_div2",
> +               "mout_shared0_pll", 1, 2, 0),
> +       FFACTOR(DOUT_SHARED0_DIV3, "dout_shared0_div3",
> +               "mout_shared0_pll", 1, 3, 0),
> +       FFACTOR(DOUT_SHARED0_DIV4, "dout_shared0_div4",
> +               "mout_shared0_pll", 1, 4, 0),
> +       FFACTOR(DOUT_SHARED1_DIV1, "dout_shared1_div1",
> +               "mout_shared1_pll", 1, 1, 0),
> +       FFACTOR(DOUT_SHARED1_DIV2, "dout_shared1_div2",
> +               "mout_shared1_pll", 1, 2, 0),
> +       FFACTOR(DOUT_SHARED1_DIV3, "dout_shared1_div3",
> +               "mout_shared1_pll", 1, 3, 0),
> +       FFACTOR(DOUT_SHARED1_DIV4, "dout_shared1_div4",
> +               "mout_shared1_pll", 1, 4, 0),
> +       FFACTOR(DOUT_SHARED2_DIV1, "dout_shared2_div1",
> +               "mout_shared2_pll", 1, 1, 0),
> +       FFACTOR(DOUT_SHARED2_DIV2, "dout_shared2_div2",
> +               "mout_shared2_pll", 1, 2, 0),
> +       FFACTOR(DOUT_SHARED2_DIV3, "dout_shared2_div3",
> +               "mout_shared2_pll", 1, 3, 0),
> +       FFACTOR(DOUT_SHARED2_DIV4, "dout_shared2_div4",
> +               "mout_shared2_pll", 1, 4, 0),
> +       FFACTOR(DOUT_SHARED3_DIV1, "dout_shared3_div1",
> +               "mout_shared3_pll", 1, 1, 0),
> +       FFACTOR(DOUT_SHARED3_DIV2, "dout_shared3_div2",
> +               "mout_shared3_pll", 1, 2, 0),
> +       FFACTOR(DOUT_SHARED3_DIV3, "dout_shared3_div3",
> +               "mout_shared3_pll", 1, 3, 0),
> +       FFACTOR(DOUT_SHARED3_DIV4, "dout_shared3_div4",
> +               "mout_shared3_pll", 1, 4, 0),
> +       FFACTOR(DOUT_SHARED4_DIV1, "dout_shared4_div1",
> +               "mout_shared4_pll", 1, 1, 0),
> +       FFACTOR(DOUT_SHARED4_DIV2, "dout_shared4_div2",
> +               "mout_shared4_pll", 1, 2, 0),
> +       FFACTOR(DOUT_SHARED4_DIV3, "dout_shared4_div3",
> +               "mout_shared4_pll", 1, 3, 0),
> +       FFACTOR(DOUT_SHARED4_DIV4, "dout_shared4_div4",
> +               "mout_shared4_pll", 1, 4, 0),
> +       FFACTOR(FOUT_MMC_PLL_DIV1, "fout_mmc_pll_div1",
> +               "mout_mmc_pll", 1, 1, 0),
> +       FFACTOR(FOUT_MMC_PLL_DIV2, "fout_mmc_pll_div2",
> +               "mout_mmc_pll", 1, 2, 0),
> +
> +};
> +
> +static const struct samsung_cmu_info top_cmu_info __initconst = {
> +       .pll_clks               = top_pll_clks,
> +       .nr_pll_clks            = ARRAY_SIZE(top_pll_clks),
> +       .mux_clks               = top_mux_clks,
> +       .nr_mux_clks            = ARRAY_SIZE(top_mux_clks),
> +       .div_clks               = top_div_clks,
> +       .nr_div_clks            = ARRAY_SIZE(top_div_clks),
> +       .fixed_factor_clks      = top_fixed_factor_clks,
> +       .nr_fixed_factor_clks   = ARRAY_SIZE(top_fixed_factor_clks),
> +       .nr_clk_ids             = CLKS_NR_TOP,
> +       .clk_regs               = top_clk_regs,
> +       .nr_clk_regs            = ARRAY_SIZE(top_clk_regs),
> +};
> +
> +static void __init exynos8855_cmu_top_init(struct device_node *np)
> +{
> +       exynos_arm64_register_cmu(NULL, np, &top_cmu_info);
> +}
> +
> +/* Register CMU_TOP early, as it's a dependency for other early domains */
> +CLK_OF_DECLARE(exynos8855_cmu_top, "samsung,exynos8855-cmu-top",
> +              exynos8855_cmu_top_init);
> +
> +/* ---- CMU_PERIC --------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_PERIC (0x15400000) */
> +#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_IP_USER            0x600
> +#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_MMC_CARD_USER      0x610
> +#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_NOC_USER           0x620
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_I2C                    0x1000
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_UART_DBG               0x1004
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI00                  0x1008
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI01                  0x100c
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI02                  0x1010
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI03                  0x1014
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI04                  0x1018
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI09_USI_OIS          0x101c
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI10_USI_OIS          0x1020
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_NOCP                   0x1800
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_UART_DBG               0x1804
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI00_USI              0x1808
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI01_USI              0x180c
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI02_USI              0x1810
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI03_USI              0x1814
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI04_USI              0x1818
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI09_USI_OIS          0x181c
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI10_USI_OIS          0x1820
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI_I2C                0x1824
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_CMU_PERIC_IPCLKPORT_PCLK    0x2004
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_SYSREG_PERIC_IPCLKPORT_PCLK 0x2060
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_UART_DBG_IPCLKPORT_PCLK     0x2064
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_USI00_USI_IPCLKPORT_PCLK    0x206c
> +
> +static const unsigned long peric_clk_regs[] __initconst = {
> +       CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_IP_USER,
> +       CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_MMC_CARD_USER,
> +       CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_NOC_USER,
> +       CMU_PERIC_CLK_CON_MUX_CLK_PERIC_I2C,
> +       CMU_PERIC_CLK_CON_MUX_CLK_PERIC_UART_DBG,
> +       CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI00,
> +       CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI01,
> +       CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI02,
> +       CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI03,
> +       CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI04,
> +       CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI09_USI_OIS,
> +       CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI10_USI_OIS,
> +       CMU_PERIC_CLK_CON_DIV_CLK_PERIC_NOCP,
> +       CMU_PERIC_CLK_CON_DIV_CLK_PERIC_UART_DBG,
> +       CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI00_USI,
> +       CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI01_USI,
> +       CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI02_USI,
> +       CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI03_USI,
> +       CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI04_USI,
> +       CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI09_USI_OIS,
> +       CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI10_USI_OIS,
> +       CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI_I2C,
> +       CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_CMU_PERIC_IPCLKPORT_PCLK,
> +       CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_SYSREG_PERIC_IPCLKPORT_PCLK,
> +       CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_UART_DBG_IPCLKPORT_PCLK,
> +       CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_USI00_USI_IPCLKPORT_PCLK,
> +};
> +
> +/* List of parent clocks for Muxes in CMU_PERIC */
> +PNAME(mout_clkcmu_peric_ip_user_p) = { "oscclk", "dout_clkcmu_peric_ip" };
> +PNAME(mout_clkcmu_peric_mmc_card_user_p) = { "oscclk", "dout_clkcmu_peric_mmc_card" };
> +PNAME(mout_clkcmu_peric_noc_user_p) = { "oscclk", "dout_clkcmu_peric_noc" };
> +PNAME(mout_clkcmu_peric_i2c_p) = { "oscclk", "mout_clkcmu_peric_ip_user" };
> +PNAME(mout_clkcmu_peric_uart_dbg_p) = { "oscclk", "mout_clkcmu_peric_ip_user" };
> +PNAME(mout_clkcmu_peric_usi0n_p) = { "oscclk", "mout_clkcmu_peric_ip_user" };
> +PNAME(mout_clkcmu_peric_usi09_usi_ois_p) = { "oscclk", "mout_clkcmu_peric_ip_user" };
> +PNAME(mout_clkcmu_peric_usi10_usi_ois_p) = { "oscclk", "mout_clkcmu_peric_ip_user" };
> +
> +static const struct samsung_mux_clock peric_mux_clks[] __initconst = {
> +       MUX(CLK_MOUT_PERIC_IP_USER, "mout_clkcmu_peric_ip_user",
> +           mout_clkcmu_peric_ip_user_p, CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_IP_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIC_MMC_CARD_USER, "mout_clkcmu_peric_mmc_card_user",
> +           mout_clkcmu_peric_mmc_card_user_p, CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_MMC_CARD_USER,
> +               4, 1),
> +       MUX(CLK_MOUT_PERIC_NOC_USER, "mout_clkcmu_peric_noc_user",
> +           mout_clkcmu_peric_noc_user_p, CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_NOC_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIC_I2C, "mout_clkcmu_peric_i2c",
> +           mout_clkcmu_peric_i2c_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_I2C, 0, 1),
> +       MUX(CLK_MOUT_PERIC_UART_DBG, "mout_clkcmu_peric_uart_dbg",
> +           mout_clkcmu_peric_uart_dbg_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_UART_DBG, 0, 1),
> +       MUX(CLK_MOUT_PERIC_USI00, "mout_clkcmu_peric_usi00",
> +           mout_clkcmu_peric_usi0n_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI00, 0, 1),
> +       MUX(CLK_MOUT_PERIC_USI01, "mout_clkcmu_peric_usi01",
> +           mout_clkcmu_peric_usi0n_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI01, 0, 1),
> +       MUX(CLK_MOUT_PERIC_USI02, "mout_clkcmu_peric_usi02",
> +           mout_clkcmu_peric_usi0n_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI02, 0, 1),
> +       MUX(CLK_MOUT_PERIC_USI03, "mout_clkcmu_peric_usi03",
> +           mout_clkcmu_peric_usi0n_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI03, 0, 1),
> +       MUX(CLK_MOUT_PERIC_USI04, "mout_clkcmu_peric_usi04",
> +           mout_clkcmu_peric_usi0n_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI04, 0, 1),
> +       MUX(CLK_MOUT_PERIC_USI09_USI_OIS, "mout_clkcmu_peric_usi09_usi_ois",
> +           mout_clkcmu_peric_usi09_usi_ois_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI09_USI_OIS, 0, 1),
> +       MUX(CLK_MOUT_PERIC_USI10_USI_OIS, "mout_clkcmu_peric_usi10_usi_ois",
> +           mout_clkcmu_peric_usi10_usi_ois_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI10_USI_OIS, 0, 1),
> +};
> +
> +static const struct samsung_div_clock peric_div_clks[] __initconst = {
> +       DIV(CLK_DOUT_PERIC_NOCP, "dout_clkcmu_peric_nocp",
> +           "mout_clkcmu_peric_noc_user", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_NOCP,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIC_UART_DBG, "dout_clkcmu_peric_uart_dbg",
> +           "mout_clkcmu_peric_uart_dbg", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_UART_DBG,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIC_USI00_USI, "dout_clkcmu_peric_usi00_usi",
> +           "mout_clkcmu_peric_usi00", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI00_USI,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIC_USI01_USI, "dout_clkcmu_peric_usi01_usi",
> +           "mout_clkcmu_peric_usi01", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI01_USI,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIC_USI02_USI, "dout_clkcmu_peric_usi02_usi",
> +           "mout_clkcmu_peric_usi02", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI02_USI,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIC_USI03_USI, "dout_clkcmu_peric_usi03_usi",
> +           "mout_clkcmu_peric_usi03", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI03_USI,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIC_USI04_USI, "dout_clkcmu_peric_usi04_usi",
> +           "mout_clkcmu_peric_usi04", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI04_USI,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIC_USI09_USI_OIS, "dout_clkcmu_peric_usi09_usi_ois",
> +           "mout_clkcmu_peric_usi09_usi_ois", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI09_USI_OIS,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIC_USI10_USI_OIS, "dout_clkcmu_peric_usi10_usi_ois",
> +           "mout_clkcmu_peric_usi10_usi_ois", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI10_USI_OIS,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIC_USI_I2C, "dout_clkcmu_peric_usi_i2c",
> +           "mout_clkcmu_peric_i2c", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI_I2C,
> +           0, 4),
> +};
> +
> +static const struct samsung_gate_clock peric_gate_clks[] __initconst = {
> +       /* System will hang if this critical clock is gated */
> +       GATE(CLK_GOUT_CMU_PERIC_IPCLKPORT_PCLK, "gout_cmu_peric_ipclkport_pclk",
> +            "dout_clkcmu_peric_nocp",
> +            CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_CMU_PERIC_IPCLKPORT_PCLK,
> +            21, CLK_IS_CRITICAL, 0),

Rather than use manual clock gating in the Linux driver, add have to
add CLK_IS_CRITICAL / CLK_IGNORE_UNUSED flags, I would suggest putting
the CMU in automatic mode from the beginning. Support for automatic
clock gating was recently added for gs101 in
https://lore.kernel.org/lkml/20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org/
so it should be straightforward to do. I noticed another SoC clock
driver was posted recently that had it enabled as well. The advantage
is you then don't need to boot with clk_ignore_unused kernel command
line, and all the unused clocks in the system will be automatically
gated, saving power. Additionally with the CMU in auto mode, it is
then also easier to expose all the gates to CCF (as you don't need to
worry about experimenting with CLK_IS_CRITICAL / CLK_IGNORE_UNUSED
flags). Also when you dump /sys/kernel/debug/clk/clk_summary you get a
complete view of the clock tree of the SoC.

> +       GATE(CLK_GOUT_SYSREG_PERIC_IPCLKPORT_PCLK, "gout_sysreg_peric_ipclkport_pclk",
> +            "dout_clkcmu_peric_nocp",
> +            CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_SYSREG_PERIC_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       /* System will hang if this critical clock is gated */
> +       GATE(CLK_GOUT_UART_DBG_PERIC_IPCLKPORT_PCLK, "gout_uart_dbg_peric_ipclkport_pclk",
> +            "dout_clkcmu_peric_uart_dbg",
> +            CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_UART_DBG_IPCLKPORT_PCLK,
> +            21, CLK_IS_CRITICAL, 0),

For gs101 we used a name mangling scheme for the Linux clock names
which removed some of the repetitive strings like _IPCLKPORT from the
Linux clock name string. The intention was to keep the register offset
macro matching the datasheet, but the Linux clock name could be
mangled to be more human readable.

I suggest for exynos8855 you follow the same clock name mangling
strategy, so we keep some consistency for the clock names on newer
Exynos SoCs. So far we haven't encountered any clashes by doing this.
The clock name mangling strategy is mentioned in clk-gs101 (I pasted
relevant bit below)

/*
 * Register name to clock name mangling strategy used in this file
 *
 * Replace PLL_CON0_PLL            with CLK_MOUT_PLL and mout_pll
 * Replace CLK_CON_MUX_MUX_CLKCMU  with CLK_MOUT_CMU and mout_cmu
 * Replace CLK_CON_DIV_CLKCMU      with CLK_DOUT_CMU and dout_cmu
 * Replace CLK_CON_DIV_DIV_CLKCMU  with CLK_DOUT_CMU and dout_cmu
 * Replace CLK_CON_GAT_CLKCMU      with CLK_GOUT_CMU and gout_cmu
 * Replace CLK_CON_GAT_GATE_CLKCMU with CLK_GOUT_CMU and gout_cmu
 *
 * For gates remove _UID _BLK _IPCLKPORT and _RSTNSYNC
 */

Also IIRC some of the gs101 commits contain the regex's used which may
be useful.

Thanks,

Peter


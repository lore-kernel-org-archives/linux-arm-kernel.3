Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2957AC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85KSTws32WPyRCiZC1/0LybeFCEGGOzS0CRvJprKyoI=; b=yRyI6pte4lXwA3N5QUu/63eD8r
	YmoxfR4V3TCArDP2RxR5j9XDHxp4j+Hv4R2+o/SnI71uaDb3cPzRWP3jvvgRSE5Pzt3xf5h7IDS/K
	WviUMQke5Xzks72mc+D0d9EG8EtRg3x9CXHFWGwtpCQ+P5uEu4AbfvDUXEnKqb/cB5/E3Y87e3Mxi
	KkveWadhCqg5DmBS3z/vhkoVHtB3zfl+F9lV7GdDy/RrcPCwUyYV9/h7yyTimysPn4xJQzSfDP02C
	HjMDiEfTQ9DuGEFOJlbQI/LU7fJ28U58z6lnCoZB35rHHc5QK5sxm5rlMWHaGaJqUzfSrKsduwmG9
	mFF45SSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLBh-0000000HFUZ-1Zu1;
	Thu, 16 Jul 2026 12:27:37 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLBe-0000000HFTA-0xRw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:27:36 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47640541585so3226531f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784204852; cv=none;
        d=google.com; s=arc-20260327;
        b=FQokqw1/zwskwBtNQeC9P2Apa65RL4IDqMzBq5iZZA01+Tat8xtEHafMVexsNTPGi9
         F6f8jBxB8vrYb9CcakDAuM/6+Axu94GPriHwTJ20gnVS8FldSt9C6eX+Es05nyKJVOTX
         tGBnW0+ApUmQZDvIsNUvZSY3VNsfg4xSDEw+ihlsPk7HB2xoxXOjcfUdK3vw4teH/AtK
         lb1eZTPU/zYakidArnp7cJ2bI82+lOz0ze1jpbb5fME7p/YGAuz7/fBSgl0LUYADh/pd
         ygxibFKK/9L9M1geEVzQgG5YczmbF0ZyKaN9tdIQkRDwEwTFUpUxPm/xn1fqjI+tUNpZ
         Lksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=85KSTws32WPyRCiZC1/0LybeFCEGGOzS0CRvJprKyoI=;
        fh=Ka0iCvoRU/xv/nV7ilvOtHuABEQOPEYOyCeaWmL/NT8=;
        b=hVjTjjtbZrC+eFViuzuAYeZcAYEsIJDt6Rj+CvrYkpdLsYvI5AC4RxfYkSoYVZhSGj
         eynEdXMoqXcLr+QQX8bxbjygG+yhWD7w+PPT6Hy36du4+x94nS5mv5iVGknffpeb5UUQ
         jOBTfdWNtqgjNu4/o+7s0BYBf+AYHaAoF/x65koUyjBJk+RnLuD5/3ZFKRoo1JYd0ZvS
         Pr0J4e+VYHrX/D3e2p3O7dciyiEd1k+4odj5+kBwrftPXriFsDjNUUeYaFmJr0hijqVz
         m5URdGWnqhXGUx+UTwkpifLdl8Qi0pKHAmhiEponez6TV0uizcxsSQtEdK7EGJaQ6GbW
         CI5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784204852; x=1784809652; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=85KSTws32WPyRCiZC1/0LybeFCEGGOzS0CRvJprKyoI=;
        b=PAw7p8Pa49rVH1GG6UzkbrxlxJA3tuAmvYwzt7yjDHNWPYsrzuNXyN6/N1oUoXLx+D
         NizVJXxPs6ncWe8zEMDSB9IeQaWOZF+wy9es98wikygZ4e3Lwd2PNWQNgZUUbxAcGrx1
         AXr8K3pOunHlLY+hMY0zpcAwXWEtOXEx9UcaMHSxvuOkWTak/J/8sK5JdltJ/ipQWo97
         kpJY0Qm2Kp9AxuO6Ay5OasoXwjsCbS2uFVGMH8graxC5Lo1d57XhN2SL3e4m3wnUUQx4
         xweCfFl+GxwvdU5rsm7aa4ijmG0AZ/N7Y/2E3LMR7CMj89oXCtOghRJYWN4rBz6eHP6j
         12oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784204852; x=1784809652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85KSTws32WPyRCiZC1/0LybeFCEGGOzS0CRvJprKyoI=;
        b=JTfelnCCR7rn/oRNbCdz7AhQKDDp3UHTwx4FFp9SGlmfB4FZaGBLWvxJ115Y3xzNZh
         zZXHo6BCcOou2UEAzkg3jnhPNFcMes7GVi9qNGvnYh9yeUw0r99c1VUEu4/YEt48z1Nv
         AY4qGOrA7iHatWjZpDpliRWCEn7ihHZ+UTX2u2f5FZmvD0x5HY8b/8+Y6/KjUGfVAp0u
         7OQMGZsELvVnc+V9yyEgtvsrg0p/HeUj2f5REWKdQhwyRtcUsc54SlrZEdjChT9HbzUQ
         KXR9BH/p34L4hc8wsABzCD69wv3BLgIrHhEumPY8vPyXBxTP3jhV7rLFT0Q8IfhjfgIa
         aFbw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7RfYq2U8RYPAIujul1nXlL12Na9JtZ85I0sOsOdIgUNbKm7UuRct/8Slo7sGYcR2Qxaa7oeXmx/SsEX4YAcKr@lists.infradead.org
X-Gm-Message-State: AOJu0YzaANBhaSfjnK2typJtQTzy3uXQQvgH3YVG30KUIPtANioLS+sh
	BySnoM9yyFH9ZySONLmnbSOEG6w3Ou49/0OZoRP8+YZaoRRtjNkOV7C5Eu0mTVhY3v4LsG9lGgf
	bLfUbqrCBOhHB1eB/9xXGmeS7NPjbUCs=
X-Gm-Gg: AfdE7cmjYaV54B8bB4K/v0lFJU0WC9Rw8xPI6o4Fyjrmdjqay6EX4bQd79oKtZL3oib
	DsvcDeAbdpzMrsReeO2307G8UY/+aVa3OJ7ddpIBjqpbvB14aIN2bMqXxxX8iaFG4IxK72md0+7
	KuryUzZ0EaPWLY24TVxEcXBR9D6ZMa4bv7dzhWgzwVbgu56YwY2KW73cDVow1RqzqdlkhhMcaC3
	U8uzV6FU0Vrv8TB/UkjVs+2q6CC6d8NizPINtpE+fmdbV9Io+AgKqWd4TbqXA==
X-Received: by 2002:a05:6000:2911:b0:47f:2baf:5e2b with SMTP id
 ffacd0b85a97d-47f4fc99a4fmr8133433f8f.1.1784204852159; Thu, 16 Jul 2026
 05:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com> <20260612-hdptx-clk-fixes-v4-1-ce5e1d456cda@collabora.com>
In-Reply-To: <20260612-hdptx-clk-fixes-v4-1-ce5e1d456cda@collabora.com>
From: Andy Yan <andyshrk@gmail.com>
Date: Thu, 16 Jul 2026 20:27:19 +0800
X-Gm-Features: AUfX_mzgo6LqHodBqk8XKfq4lJF2iVLX6VlVzaraq-ul6MEoybhP2jiUNkg_Mig
Message-ID: <CANbgqAR=ECWEHv2X85nOASmm=r91ipO=r=8ufrrXFYLxxKCaFg@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] phy: rockchip: samsung-hdptx: Fix rate
 recalculation for high bpc
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, 
	Simon Wright <simon@symple.nz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_052734_325955_0E9F29CA 
X-CRM114-Status: GOOD (  19.57  )
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

Hello=EF=BC=8C
Cristian Ciocaltea <cristian.ciocaltea@collabora.com> =E4=BA=8E2026=E5=B9=
=B46=E6=9C=8812=E6=97=A5=E5=91=A8=E4=BA=94 07:45=E5=86=99=E9=81=93=EF=BC=9A
>
> The PHY PLL can be programmed by an external component, e.g. the
> bootloader, just before the recalc_rate() callback is invoked during
> devm_clk_hw_register() in the probe path.
>
> Therefore rk_hdptx_phy_clk_recalc_rate() finds the PLL enabled and
> attempts to compute the clock rate, while making use of the bpc value
> from the HDMI PHY configuration, which always defaults to 8 because
> phy_configure() was not run at that point.  As a consequence, the
> (re)calculated rate is incorrect when the actual bpc was higher than 8.
>
> Do not rely on any of the hdmi_cfg members when computing the clock rate
> and, instead, read the required input data (i.e. bpc), directly from the
> hardware registers.
>
> Fixes: 3481fc04d969 ("phy: rockchip: samsung-hdptx: Compute clk rate from=
 PLL config")
> Tested-by: Thomas Niederpr=C3=BCm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

   Reviewed-by=EF=BC=9AAndy Yan <andyshrk@gmail.com>

Thanks
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/=
phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 2d973bc37f07..710603afff86 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -2168,7 +2168,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(=
struct rk_hdptx_phy *hdptx)
>         struct lcpll_config lcpll_hw;
>         struct ropll_config ropll_hw;
>         u64 fout, sdm;
> -       u32 mode, val;
> +       u32 mode, bpc, val;
>         int ret, i;
>
>         ret =3D regmap_read(hdptx->regmap, CMN_REG(0008), &mode);
> @@ -2266,6 +2266,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(=
struct rk_hdptx_phy *hdptx)
>         if (ret)
>                 return 0;
>         ropll_hw.pms_sdiv =3D ((val & PLL_PCG_POSTDIV_SEL_MASK) >> 4) + 1=
;
> +       bpc =3D (FIELD_GET(PLL_PCG_CLK_SEL_MASK, val) << 1) + 8;
>
>         fout =3D PLL_REF_CLK * ropll_hw.pms_mdiv;
>         if (ropll_hw.sdm_en) {
> @@ -2280,7 +2281,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(=
struct rk_hdptx_phy *hdptx)
>                         fout =3D fout + sdm;
>         }
>
> -       return div_u64(fout * 2, ropll_hw.pms_sdiv * 10);
> +       return DIV_ROUND_CLOSEST_ULL(fout * 2 * 8, ropll_hw.pms_sdiv * 10=
 * bpc);
>  }
>
>  static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
> @@ -2288,19 +2289,13 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate=
(struct clk_hw *hw,
>  {
>         struct rk_hdptx_phy *hdptx =3D to_rk_hdptx_phy(hw);
>         u32 status;
> -       u64 rate;
>         int ret;
>
>         ret =3D regmap_read(hdptx->grf, GRF_HDPTX_CON0, &status);
>         if (ret || !(status & HDPTX_I_PLL_EN))
>                 return 0;
>
> -       rate =3D rk_hdptx_phy_clk_calc_rate_from_pll_cfg(hdptx);
> -
> -       if (hdptx->hdmi_cfg.mode =3D=3D PHY_HDMI_MODE_FRL)
> -               return rate;
> -
> -       return DIV_ROUND_CLOSEST_ULL(rate * 8, hdptx->hdmi_cfg.bpc);
> +       return rk_hdptx_phy_clk_calc_rate_from_pll_cfg(hdptx);
>  }
>
>  static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
>
> --
> 2.54.0
>
>


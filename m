Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807F1C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JaDvPEYA7TsBoq4Mvy5LHxwsmJqm2nsItn8pPo4zA4=; b=b0KaxKm7iywfYpAy9Ii/blvcv7
	Ty53J4OBivTJ4o2UEylMxDhWPgLkpbV448IkkfF5VgNGkkxl7mxjBkbwTAYCTWDpsIpcO1OqDA92j
	O5SkPhGZI/AeLUW8EDWcATutRNrQOBtXJc8Fa52C2C+z7vXI26xwo09JXtfhgIsqw8b9ia9YcQ25F
	6Udbmub/8zfBNDUkgBnKRmqN0Q3E6uEMsMFvoZs6p1hLiKjfmJbpD+46FzMCf8g0uXxxn+uGHkQtR
	XdxG+mOeb9T3sZB8EmabNCFLV85/tOQx1DECu0VpcskMajcH1Y662/OD1yxgfHaXZBElzOVmLPna/
	Rr0FugJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trDof-00000000M4L-1pXQ;
	Sun, 09 Mar 2025 10:23:29 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trDiu-00000000LI5-3INN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 10:17:34 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e637edaa652so537789276.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 03:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741515452; x=1742120252; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8JaDvPEYA7TsBoq4Mvy5LHxwsmJqm2nsItn8pPo4zA4=;
        b=qzoLsnszAAWm1mTDZVzPvyCYBDp9REJuoR6CH9F4eqLpN6lp9rekP456XVddyQ9o3G
         8BDV+nyAJqw6EdM8GoSKgZUrj51A8S8CfWFKevBiU6I1H/LP52yz/Wb1stz6lOmCbAPo
         8kUEAqGo5i1gIzxG5ylYMcbCp3sIwAPYuXpR6Zs47DFDFlBgSvf3IdhSzBPqcYTU5g8W
         8ow5Y5eKy/L/qTybNEOVsaZRiTJDlHSoxWjHRZPPI8P0YH7VWJZE4EftNMxooPVXnjME
         KqOfpOPOLF4N9RV6soXxmFrY3ZMN/H+Yh6IY03rxZighYUXvpl5QvCMm/d6DIXPU2KYA
         CNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741515452; x=1742120252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JaDvPEYA7TsBoq4Mvy5LHxwsmJqm2nsItn8pPo4zA4=;
        b=TAMbYDSj9y/749LiE/kSZ6UbMWf7Rh/WtNO33HGMerOEEHte0SmS8/31EJfw4WOOLG
         6z8J8iF7y6x5nryt0kUCyM2Xtig2jwCseeYQOb+J3zosGA4eQuPRle5R/ipOW8oERyz1
         VAPdS5c492N+5ZiPVDQTJdb86XSckWJFICSbKRsULy7/hWYo2bhrDAB6e1gTrSBLX60a
         G50/fOxiYrvIYpKIJ4FnJxtETyOXQ3uzn1xk7RjaW0bUqd6XNJHd9J+C9/3mpLEE6CCT
         MwvsAnFXd9bBNQiBuXuNzGYiV6EkBCy11930NBgCo4tuS8nVHf4HLupMoqDehWqS8kgy
         L1bg==
X-Forwarded-Encrypted: i=1; AJvYcCXKK9GRtps0hDsbS819U1WA82wY2K1yiMVu89Lsfj1cQevY1qQZSfcp+Jm7C1waKTfuhFacOGLkUeZ6oGUup4Rg@lists.infradead.org
X-Gm-Message-State: AOJu0YynrxXzVuNfxoKmzwocNyR5Rb7fV43FoBishLfGXd8uf7cAnUBu
	d9yW5cQUHf5y/JI8+nag+NJ7BxqAnZRBQNxn2nCD26JlkhLX5XL8j+O+pP4nu240BcMm99fN8De
	2QAvbm4nbcCsEhdHnbg/l744NNF+kSmtLd0q8BA==
X-Gm-Gg: ASbGncvtP09ff97fXg6W/KsAZyozpJjzrdFnPPWtGDSJF9k63KgRolQKr9xDZqsEdw1
	c9XSEHPRGLIyMOgqsbRqrTxI+XcLVx/JSff63CvN8u35N79F4wSllwrOHhIaIeopGXqrLmvk06d
	1EnqbRJGC0/WV94oJ3mNvcja/WPAkugnBPt73HMX6F
X-Google-Smtp-Source: AGHT+IHe7by2CtDo/zYM/bVl9N1w6brZFhEu1GZHMwI4eVFbfmB5bsavCuak/ilh158w600F1u3l9qq49HjU7FT//ug=
X-Received: by 2002:a05:6902:3307:b0:e5a:e604:78df with SMTP id
 3f1490d57ef6-e635c163099mr10795936276.17.1741515451706; Sun, 09 Mar 2025
 03:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com> <20250308-phy-sam-hdptx-bpc-v5-11-35087287f9d1@collabora.com>
In-Reply-To: <20250308-phy-sam-hdptx-bpc-v5-11-35087287f9d1@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Mar 2025 12:17:20 +0200
X-Gm-Features: AQ5f1JqGJhorT77dlo7Va-OtaHUZt5CEPT4HFc2cqRMt2nt7DncmKSCeyefi4a8
Message-ID: <CAA8EJpqzZaRoQ5mDeKUHpNhYsegC=V6c2SQpKaQn4FYhozQn1A@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] phy: rockchip: samsung-hdptx: Optimize internal
 rate handling
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_031732_832105_577E5F04 
X-CRM114-Status: GOOD (  26.97  )
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

On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Drop the rate parameter from a bunch of internal helpers and, instead,
> make better use of the newly introduced ->hdmi_cfg.tmds_char_rate driver
> data.
>
> Additionally, rename the rather ambiguous ->rate member of struct
> rk_hdptx_phy to ->hw_rate and ensure rk_hdptx_ropll_tmds_cmn_config()

Would it be better to name it tmds_char_rate?

> updates it only after all the other operations have been successful.

Please don't mix refactoring / renames and the actual code changes.

>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 59 ++++++++++++-----------
>  1 file changed, 30 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index a62c634f5254e742088515c3b21c05f95acbaded..98f831c3704f5cd65dcf29a4f0a12862a4aa0482 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -401,7 +401,7 @@ struct rk_hdptx_phy {
>
>         /* clk provider */
>         struct clk_hw hw;
> -       unsigned long rate;
> +       unsigned long hw_rate;
>         bool restrict_rate_change;
>
>         atomic_t usage_count;
> @@ -968,33 +968,34 @@ static bool rk_hdptx_phy_clk_pll_calc(unsigned long rate,
>         return true;
>  }
>
> -static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
> -                                         unsigned long rate)
> +static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
>  {
>         const struct ropll_config *cfg = NULL;
>         struct ropll_config rc = {0};
> -       int i;
> +       int ret, i;
>
> -       hdptx->rate = rate;
> +       if (!hdptx->hdmi_cfg.tmds_char_rate)
> +               return 0;
>
>         for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
> -               if (rate == ropll_tmds_cfg[i].rate) {
> +               if (hdptx->hdmi_cfg.tmds_char_rate == ropll_tmds_cfg[i].rate) {
>                         cfg = &ropll_tmds_cfg[i];
>                         break;
>                 }
>
>         if (!cfg) {
> -               if (rk_hdptx_phy_clk_pll_calc(rate, &rc)) {
> -                       cfg = &rc;
> -               } else {
> -                       dev_err(hdptx->dev, "%s cannot find pll cfg\n", __func__);
> +               if (!rk_hdptx_phy_clk_pll_calc(hdptx->hdmi_cfg.tmds_char_rate, &rc)) {
> +                       dev_err(hdptx->dev, "%s cannot find pll cfg for rate=%llu\n",
> +                               __func__, hdptx->hdmi_cfg.tmds_char_rate);
>                         return -EINVAL;
>                 }
> +
> +               cfg = &rc;
>         }
>
> -       dev_dbg(hdptx->dev, "%s rate=%lu mdiv=%u sdiv=%u sdm_en=%u k_sign=%u k=%u lc=%u\n",
> -               __func__, rate, cfg->pms_mdiv, cfg->pms_sdiv + 1, cfg->sdm_en,
> -               cfg->sdm_num_sign, cfg->sdm_num, cfg->sdm_deno);
> +       dev_dbg(hdptx->dev, "%s rate=%llu mdiv=%u sdiv=%u sdm_en=%u k_sign=%u k=%u lc=%u\n",
> +               __func__, hdptx->hdmi_cfg.tmds_char_rate, cfg->pms_mdiv, cfg->pms_sdiv + 1,
> +               cfg->sdm_en, cfg->sdm_num_sign, cfg->sdm_num, cfg->sdm_deno);
>
>         rk_hdptx_pre_power_up(hdptx);
>
> @@ -1030,17 +1031,20 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
>         regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN_MASK,
>                            FIELD_PREP(PLL_PCG_CLK_EN_MASK, 0x1));
>
> -       return rk_hdptx_post_enable_pll(hdptx);
> +       ret = rk_hdptx_post_enable_pll(hdptx);
> +       if (!ret)
> +               hdptx->hw_rate = hdptx->hdmi_cfg.tmds_char_rate;
> +
> +       return ret;
>  }
>
> -static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx,
> -                                          unsigned long rate)
> +static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx)
>  {
>         rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_common_sb_init_seq);
>
>         regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
>
> -       if (rate > HDMI14_MAX_RATE) {
> +       if (hdptx->hdmi_cfg.tmds_char_rate > HDMI14_MAX_RATE) {
>                 /* For 1/40 bitrate clk */
>                 rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lntop_highbr_seq);
>         } else {
> @@ -1092,8 +1096,7 @@ static void rk_hdptx_dp_reset(struct rk_hdptx_phy *hdptx)
>                      HDPTX_I_BGR_EN << 16 | FIELD_PREP(HDPTX_I_BGR_EN, 0x0));
>  }
>
> -static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx,
> -                                    unsigned long rate)
> +static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx)
>  {
>         enum phy_mode mode = phy_get_mode(hdptx->phy);
>         u32 status;
> @@ -1112,11 +1115,9 @@ static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx,
>         if (mode == PHY_MODE_DP) {
>                 rk_hdptx_dp_reset(hdptx);
>         } else {
> -               if (rate) {
> -                       ret = rk_hdptx_ropll_tmds_cmn_config(hdptx, rate);
> -                       if (ret)
> -                               goto dec_usage;
> -               }
> +               ret = rk_hdptx_ropll_tmds_cmn_config(hdptx);
> +               if (ret)
> +                       goto dec_usage;
>         }
>
>         return 0;
> @@ -1429,7 +1430,7 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>                 dev_dbg(hdptx->dev, "%s rate=%llu\n", __func__, hdptx->hdmi_cfg.tmds_char_rate);
>         }
>
> -       ret = rk_hdptx_phy_consumer_get(hdptx, hdptx->hdmi_cfg.tmds_char_rate);
> +       ret = rk_hdptx_phy_consumer_get(hdptx);
>         if (ret)
>                 return ret;
>
> @@ -1460,7 +1461,7 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>                 regmap_write(hdptx->grf, GRF_HDPTX_CON0,
>                              HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
>
> -               ret = rk_hdptx_ropll_tmds_mode_config(hdptx, hdptx->hdmi_cfg.tmds_char_rate);
> +               ret = rk_hdptx_ropll_tmds_mode_config(hdptx);
>                 if (ret)
>                         rk_hdptx_phy_consumer_put(hdptx, true);
>         }
> @@ -1828,7 +1829,7 @@ static int rk_hdptx_phy_clk_prepare(struct clk_hw *hw)
>  {
>         struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
>
> -       return rk_hdptx_phy_consumer_get(hdptx, hdptx->rate);
> +       return rk_hdptx_phy_consumer_get(hdptx);
>  }
>
>  static void rk_hdptx_phy_clk_unprepare(struct clk_hw *hw)
> @@ -1843,7 +1844,7 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
>  {
>         struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
>
> -       return hdptx->rate;
> +       return hdptx->hw_rate;
>  }
>
>  static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> @@ -1895,7 +1896,7 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>          * while the latter being executed only once, i.e. when clock remains
>          * in the prepared state during rate changes.
>          */
> -       return rk_hdptx_ropll_tmds_cmn_config(hdptx, rate);
> +       return rk_hdptx_ropll_tmds_cmn_config(hdptx);
>  }
>
>  static const struct clk_ops hdptx_phy_clk_ops = {
>
> --
> 2.48.1
>


-- 
With best wishes
Dmitry


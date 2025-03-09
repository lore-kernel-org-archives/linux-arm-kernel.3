Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DFCC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMh3NDuLrSGAoXMlAYmObZJYcnKtSuzU7ys7GAZPNb4=; b=IJQ4W7Mn2qPrUxK3oSahBI9xxt
	qX+KCkr7WCRWug47b8yQckbiFTG7jqkbbWw6f9Y6jNs/fIUVQutPKGuNTk+1TkJiTwMilQDCI75eH
	JBHrO4078aN73f17oMoXTm96hfIwfVr8kZVkI+v0L/52RWPb5ilNKOraZo1t7FdicrXyKhi2LvJrz
	vbSkSqI6jEVzEaewpJJG0XUqZjndQSRCematIwaazM8RYmjWj71p5ONohfLucZcztr2UGpPt8CqzS
	LY/1KgOOHrRVv+1Gb1anpwBz4fgg0FtZe4eKYTJS4bywb3S+vK4O8TB02+OTTWJJ5oVJxuHWgcqbV
	KDKhY6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCvZ-00000000HPx-1TTT;
	Sun, 09 Mar 2025 09:26:33 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCsA-00000000H1g-21bz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 09:23:03 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e609cff9927so2103587276.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 01:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741512181; x=1742116981; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iMh3NDuLrSGAoXMlAYmObZJYcnKtSuzU7ys7GAZPNb4=;
        b=vHn/gaeBN//dmnUCpG3FEikob512z/WpJTdXL9MvxFWK51LBxmcbV0IhXgRzVFwsQL
         deCMBytuhS2For2X0DMReu/i5E4MegOoiNVx1B0NieCZEnDcWax7Ytw8mEh7mhtY2lhJ
         oY0g8rE6W43zSPjDmn0eAwkhVXiDmaIObyybsaKPPmJK8Z9vl3ajzRvULhnnMuFPXWUi
         MUOdwJj1qCS4fcPAEu4SPf0BULOHQ+DKpD5x1myGoCu3ae7X96hQIyDq4JRv0lcVhJxf
         G2g2e6qynZ30WgjazFWMjCr/Tiibm9T6h7+IX2wxaQUu1vyhUthIEPj8o70RFHoHUs+S
         yqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741512181; x=1742116981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMh3NDuLrSGAoXMlAYmObZJYcnKtSuzU7ys7GAZPNb4=;
        b=vww2owavSRh6uhRGFUE9o7WWIQ3p5dDegXreiIlC14EMevpc2JnSdm64Jg2Rlxdfp4
         MqXoejzRrC1CnmnDDxgcPL+yT7QJ4FhL+cGAg7IGRBAgWqotl07r4hwZYefzgjud8m0U
         hDGCHsyPQqieAt04HDTTUif7MvOquEFWFE414pMOARFeLp17lAUgCkpsguiRlrYoNWN2
         zSBkV5Nd2Ab986K6ySPOX8xCABoWjwQVrbcDNjzft9tKTW7XopqPdZxSP8akrlRh+mck
         acsfDzf0PBcbyCxR2s9uTKdn59gRlnrFznkW+LGQ+o6U519NwNUmxa4Nj2ljupGjRyFE
         G/BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSHVhhtQlLkWVmp/AEdkJJ6G6XULEJCgCrPSVEoFE4vxh7d4+N8L8qPvtxR87hG09t77hZzbtekAKUYRLbEU/P@lists.infradead.org
X-Gm-Message-State: AOJu0YzM/k+ms+W4urEcUq1xDBJ9KR0Pkrd6hkF6ERV4w4gEw51LaSuO
	nsSMEvLbZ2yo8WTUNBH8RzplJP/EWa5kT2+7gia6Z42OtccGeMvbOaL7xxUNw0wjRrda1MiJkrO
	YOP8vlTGT/mBuBWnkEjsIqzKjmQa1aBtOITx2CQ==
X-Gm-Gg: ASbGnctCLppskLHYRA4wXjuYBXRVoDWOy1jBMwgJ//wa4BRCovT9P27u3a7Z4w/1tRX
	SCJTy40YZ9StcPzXjfWu5eqXCabu3fpr5iT4uOsUyYcZB7hBR1OpjLsy0kFZipbuqNbhx/HhK+0
	lBaEm4fyRKWX7rfhWiMAHy5cIDGo3UOJFr1Q4ejIrVo7kqGHdkVCk=
X-Google-Smtp-Source: AGHT+IGwSjssMypxWMqlAgIxRqvqFw5zCtjXcKaNH8uFEv6oSpbLLZZrkI9ebpcft3vvy7bHOrWbWh76EUn4+31AvMw=
X-Received: by 2002:a05:6902:2702:b0:e5a:e897:2846 with SMTP id
 3f1490d57ef6-e635c13dc87mr11588234276.16.1741512181600; Sun, 09 Mar 2025
 01:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com> <20250308-phy-sam-hdptx-bpc-v5-7-35087287f9d1@collabora.com>
In-Reply-To: <20250308-phy-sam-hdptx-bpc-v5-7-35087287f9d1@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Mar 2025 11:22:50 +0200
X-Gm-Features: AQ5f1JoAeZL47fdNQ51_XRbhIwKgmeJzZ78g4SD2gNds-cV7TO45RQfFMkCcCBs
Message-ID: <CAA8EJpoQbvFbNXQ2RB1qY2gHnwZaU-PT-DMLnZkrxkqs2wkXqQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] phy: rockchip: samsung-hdptx: Avoid Hz<->hHz
 unit conversion overhead
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_012302_528876_FE934FDA 
X-CRM114-Status: GOOD (  18.12  )
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
> The ropll_tmds_cfg table used to identify the configuration params for
> the supported rates expects the search key, i.e. bit_rate member of
> struct ropll_config, to be provided in hHz rather than Hz (1 hHz = 100
> Hz).  This requires multiple conversions between these units being
> performed at runtime.
>
> Improve implementation clarity and efficiency by consistently using the
> Hz unit throughout driver's internal data structures and functions.
> Also rename the rather misleading struct member.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 79 +++++++++++------------
>  1 file changed, 39 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 2bf525514c1991a1299265d12e1e85f66333c604..e58a01bdb3ce82d66acdcb02c06de2816288b574 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -330,7 +330,7 @@ enum dp_link_rate {
>  };
>
>  struct ropll_config {
> -       u32 bit_rate;
> +       u32 rate;

unsigned long long, please, to match the tmds_char_rate type.

>         u8 pms_mdiv;
>         u8 pms_mdiv_afc;
>         u8 pms_pdiv;
> @@ -410,45 +410,45 @@ struct rk_hdptx_phy {
>  };
>
>  static const struct ropll_config ropll_tmds_cfg[] = {
> -       { 5940000, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> +       { 594000000, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,

Use ULL suffix

>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 3712500, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> +       { 371250000, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 2970000, 124, 124, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> +       { 297000000, 124, 124, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 1620000, 135, 135, 1, 1, 3, 1, 1, 0, 1, 1, 1, 1, 4, 0, 3, 5, 5, 0x10,
> +       { 162000000, 135, 135, 1, 1, 3, 1, 1, 0, 1, 1, 1, 1, 4, 0, 3, 5, 5, 0x10,
>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 1856250, 155, 155, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> +       { 185625000, 155, 155, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 1540000, 193, 193, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 193, 1, 32, 2, 1,
> +       { 154000000, 193, 193, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 193, 1, 32, 2, 1,
>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 1485000, 0x7b, 0x7b, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 4, 0, 3, 5, 5,
> +       { 148500000, 0x7b, 0x7b, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 4, 0, 3, 5, 5,
>           0x10, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 1462500, 122, 122, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 244, 1, 16, 2, 1, 1,
> +       { 146250000, 122, 122, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 244, 1, 16, 2, 1, 1,
>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 1190000, 149, 149, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 149, 1, 16, 2, 1, 1,
> +       { 119000000, 149, 149, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 149, 1, 16, 2, 1, 1,
>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 1065000, 89, 89, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 89, 1, 16, 1, 0, 1,
> +       { 106500000, 89, 89, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 89, 1, 16, 1, 0, 1,
>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 1080000, 135, 135, 1, 1, 5, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
> +       { 108000000, 135, 135, 1, 1, 5, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
>           0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 855000, 214, 214, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 214, 1, 16, 2, 1,
> +       { 85500000, 214, 214, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 214, 1, 16, 2, 1,
>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 835000, 105, 105, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 42, 1, 16, 1, 0,
> +       { 83500000, 105, 105, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 42, 1, 16, 1, 0,
>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 928125, 155, 155, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> +       { 92812500, 155, 155, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 742500, 124, 124, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> +       { 74250000, 124, 124, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 650000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
> +       { 65000000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 337500, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
> +       { 33750000, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
>           1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 400000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
> +       { 40000000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
>           0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 270000, 0x5a, 0x5a, 1, 1, 0xf, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
> +       { 27000000, 0x5a, 0x5a, 1, 1, 0xf, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
>           0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 251750, 84, 84, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 168, 1, 16, 4, 1, 1,
> +       { 25175000, 84, 84, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 168, 1, 16, 4, 1, 1,
>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>  };
>
> @@ -894,10 +894,10 @@ static void rk_hdptx_phy_disable(struct rk_hdptx_phy *hdptx)
>         regmap_write(hdptx->grf, GRF_HDPTX_CON0, val);
>  }
>
> -static bool rk_hdptx_phy_clk_pll_calc(unsigned int data_rate,
> +static bool rk_hdptx_phy_clk_pll_calc(unsigned long rate,

here and further, unsigned long long
Also, is it tmds_char_rate?

>                                       struct ropll_config *cfg)
>  {
> -       const unsigned int fout = data_rate / 2, fref = 24000;
> +       const unsigned int fout = rate / 200, fref = 24000;
>         unsigned long k = 0, lc, k_sub, lc_sub;
>         unsigned int fvco, sdc;
>         u32 mdiv, sdiv, n = 8;

-- 
With best wishes
Dmitry


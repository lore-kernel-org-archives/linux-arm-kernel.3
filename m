Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756CDC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 23:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NorJPaAWMRgfUr5xe1GpsIw0IDjSs1x/V3X7c0koEtI=; b=vconim/MscqjdKNjZZPurtBnPV
	xlLYeg8Xg1yGYKTz/qkrzaTzBgHHmS/f52Q49lFQCl1W6DO0PLxlq+2aFxbWLhdY1NOoaiWr2mD4/
	5fnPw2edUXhqKM2H5eo6kIBlcy2J2xABdysZJB3UlMi7Tp/VnBoPQJwcjuV3CiS3R7KfFBX7FUbq6
	GKohLhNGSB4DR9lHf/rkQ2wD1mG7cgK/mm9c65qUTMa1aQyC8xNw/BPl5AqzqSS00dCs++/THkK2R
	VH2b0nYzbnLpChtDOOSvbyNf66Jej31T6C4fQIQXQB++W3cFNCicd9P2TLsSjKBlhUSZk1FpjVyr1
	Fph7JexQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmLa3-0000000BylP-3KaT;
	Sun, 23 Feb 2025 23:40:15 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmLYa-0000000Byd3-11e2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 23:38:45 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6ef7c9e9592so30272437b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 15:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740353922; x=1740958722; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NorJPaAWMRgfUr5xe1GpsIw0IDjSs1x/V3X7c0koEtI=;
        b=dEkvN+WicwY3b6HZjnSy6qbsX22AMgYRrpZE5Si5OVHz6a7ZY1JagpQT139Cqlfi6g
         mz1FUjdqd7xHwkCJccVCAa7vgzv8Jh8JNW5DF6bGAatvYR0OmUO3ZqeoGDbPWq/8LAf+
         SURNvaGWSl4DzKed4k/APHf8ya+yKMwqHnPkLd9U+IUgNHOD6671xaEwznhY8do0VDqy
         Rtu2lJjMaouDi1Rk8KTkHlnjMlGo3D/l4HHxUs1/fii1I3qU4OtQTVWZqgvx0ia0HQPQ
         Hj1GOMA+72z9n9ppsvE9FOU1t21FpZNOs91RD3/a93Yw8Ym5h4FdZ6sGz3Fi4MBSLdVm
         t1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740353922; x=1740958722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NorJPaAWMRgfUr5xe1GpsIw0IDjSs1x/V3X7c0koEtI=;
        b=twPYdZ6maI1i1Qude3PoZvBACZVxsiDwWkvDjILQR7ONyqDGWGw2b9mhcWHMgQxqpy
         N0sUzFAOUa40/4eDEaKjPKwkeXm3vDCUrIJT70EzVHG1xi58NjBV75TwWs5xkJvZAoVZ
         ZOJ8456exGVPr3RonDdIo35mFjXvMPVr2LJ0+sbduIJEpn91FWOVBBVDB4GDd25owWtS
         j7LmhQZdbeYwJ1jMAOiBT1oZDk2a6jb4xlYDaugous+1ZMyDD96VL2fz0SlHfEpANZ7s
         1PsLQcDHRtPDdylQeh0hHAT2xBzkE4+630X3o91/5ZulFm84TvWoA39aYUqME0GI1p00
         WDZA==
X-Forwarded-Encrypted: i=1; AJvYcCWUhhyR/i+XsMItPblMmnnqqiq6nPHzFfhJsvjd4/gw+zFlPvF2M0LzVTMI6mc0c//Lz5uEy7nKHnHgI3NgcrdW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9iZtt1S/7h2EcMF5tDj0LxGxD0B/gUtLe4HE+Y0PvIAwS9xJa
	tmitF6ZQ8ACPTU7WThGyD1HdkwF6avSPg9qaIoeKjIJx7wSeTEDNDauTEf51YqvkJttEVpxxdNa
	3pBlbNZkbQvZ+Ch9Y0/W8ZlrkvJVB1cGooXo2Qw==
X-Gm-Gg: ASbGncsUE5bUsx8D0a5u9GccKiiTct8uWVioW0uh5fMo5a37ZIoeIixG2x2LyQnvbsg
	XsFhe7DbQp6i00vQ9qt52/gXfxmiLpwKUVu+Auzln1b2AYVjX5ZM15abnX5S4mA0sKb9S4O4GPi
	ZT2oGckvBrZeDIRXG1YsmPBalqEfVyKG3mDLo2Nus=
X-Google-Smtp-Source: AGHT+IGFegxU0/BAO58BmfLqgVu14539PaOFZp3Jh6MOJGQnzwNm3VyUN+k9CDauRsvVnXt6ZCaaCQFePUkkFp0b59E=
X-Received: by 2002:a05:690c:25c5:b0:6f9:7d7d:a725 with SMTP id
 00721157ae682-6fbcc3ad1abmr98769257b3.33.1740353920862; Sun, 23 Feb 2025
 15:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20250223-phy-sam-hdptx-bpc-v3-0-66a5c8e68327@collabora.com> <20250223-phy-sam-hdptx-bpc-v3-5-66a5c8e68327@collabora.com>
In-Reply-To: <20250223-phy-sam-hdptx-bpc-v3-5-66a5c8e68327@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Feb 2025 01:38:30 +0200
X-Gm-Features: AWEUYZmTHJ2dAKAOg_4O6EdrI6McHGH1cJfHE45231CZ1NkDjfb9qIrmX-8DI0c
Message-ID: <CAA8EJppjRFWXXYSp=SKPKBV-ceO7gu3n37k-5eUeYG_x6rOmsg@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] phy: rockchip: samsung-hdptx: Setup TMDS char rate
 via phy_configure_opts_hdmi
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_153844_298775_5858C225 
X-CRM114-Status: GOOD (  26.83  )
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

On Sun, 23 Feb 2025 at 13:02, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> The current workaround to setup the TMDS character rate relies on the
> unconventional usage of phy_set_bus_width().
>
> Make use of the recently introduced HDMI PHY configuration API for this
> purpose.  The workaround will be dropped as soon as the switch has been
> completed on both ends.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 37 +++++++++++++++++------
>  1 file changed, 27 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index f9b5c96d6c789e435657e224032d35b5a6950945..dd91a7272e246b2133112effdb080a847fd15abe 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -402,6 +402,9 @@ struct rk_hdptx_phy {
>         int nr_clks;
>         struct reset_control_bulk_data rsts[RST_MAX];
>
> +       /* PHY config opts */
> +       unsigned long tmds_char_rate;

It's easier to embed struct phy_configure_opts_hdmi here, in the end
you  add bpc here in one of the next patches.

> +
>         /* clk provider */
>         struct clk_hw hw;
>         unsigned long rate;
> @@ -1413,19 +1416,21 @@ static int rk_hdptx_dp_aux_init(struct rk_hdptx_phy *hdptx)
>  static int rk_hdptx_phy_power_on(struct phy *phy)
>  {
>         struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
> -       int bus_width = phy_get_bus_width(hdptx->phy);
> +       unsigned int rate = hdptx->tmds_char_rate / 100;
>         enum phy_mode mode = phy_get_mode(phy);
>         int ret, lane;
>
> -       /*
> -        * FIXME: Temporary workaround to pass pixel_clk_rate
> -        * from the HDMI bridge driver until phy_configure_opts_hdmi
> -        * becomes available in the PHY API.
> -        */
> -       unsigned int rate = bus_width & 0xfffffff;
> +       if (rate == 0) {
> +               /*
> +                * FIXME: Temporary workaround to setup TMDS char rate
> +                * from the RK HDMI bridge driver.
> +                * Will be removed as soon the switch to the HDMI PHY
> +                * configuration API has been completed on both ends.
> +                */
> +               rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
> +       }
>
> -       dev_dbg(hdptx->dev, "%s bus_width=%x rate=%u\n",
> -               __func__, bus_width, rate);
> +       dev_dbg(hdptx->dev, "%s rate=%u\n", __func__, rate);
>
>         ret = rk_hdptx_phy_consumer_get(hdptx, rate);
>         if (ret)
> @@ -1734,8 +1739,10 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
>         enum phy_mode mode = phy_get_mode(phy);
>         int ret;
>
> -       if (mode != PHY_MODE_DP)
> +       if (mode != PHY_MODE_DP) {
> +               hdptx->tmds_char_rate = opts->hdmi.tmds_char_rate;
>                 return 0;
> +       }
>
>         ret = rk_hdptx_phy_verify_config(hdptx, &opts->dp);
>         if (ret) {
> @@ -1830,6 +1837,16 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  {
>         struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
>
> +       /*
> +        * The TMDS char rate set via phy_configure(), if any, has
> +        * precedence over the rate provided via clk_set_rate().

I think this is not so nice. It makes CCF desync from the actual rate
programmed into the hardware. Maybe you can make the clock r/o?

> +        */
> +       if (hdptx->tmds_char_rate && hdptx->tmds_char_rate != rate) {
> +               dev_dbg(hdptx->dev, "Replaced clk_set_rate=%lu with tmds_char_rate=%lu\n",
> +                       rate, hdptx->tmds_char_rate);
> +               rate = hdptx->tmds_char_rate;
> +       }
> +
>         return rk_hdptx_ropll_tmds_cmn_config(hdptx, rate / 100);
>  }
>
>
> --
> 2.48.1
>


--
With best wishes
Dmitry


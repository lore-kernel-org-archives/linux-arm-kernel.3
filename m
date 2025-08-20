Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B08CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvWROpBEvhI9Tv+9ZqwNAydOJR1yKRjRd1nUvFdCDw=; b=w3wFpTrgGMwSUQB83f2m1Uavzt
	ZB/x/0rrG1GdhsUWbbrleUXdYbYuxG5HyS701A2he3I4rnqCE6By9QmRGe7epdAJR3XEu3FiCWXrF
	t8w+YVMO//OqMCzbGrr3iKf71PYM76AIIoBvd427kZPoRCpcni+yaxbzWZS2TM4qwa1fjWA6jG7dH
	ubDdSUmqSAMsE1y4x90rxxwNGEBE/Y3vgpnOXtATe0vPz1ZcTmDF6Vns8SWe5k2Of5q4jtsE7rChv
	2fuuIM69e/lN2DqfsJf50AqXK6FQvhgQHXsmJVUGgb3hqCy7SSkMCt7WtiYGjYWPzI0P/z8i/7p34
	te8phHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopm6-0000000EuDP-0Lq1;
	Wed, 20 Aug 2025 20:51:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolgp-0000000EOpt-0hxM;
	Wed, 20 Aug 2025 16:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 953CC601D7;
	Wed, 20 Aug 2025 16:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF51C4CEE7;
	Wed, 20 Aug 2025 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755707370;
	bh=Qzu3sAyj5y1ZHEYtAgX6Nl+Q7wQ4tl5rXdQK2r2hq9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbgkpQOOkJMnf7YOfm3L+2WNCbvN5KEBLTDdwMgR39opZMxwb3V5MK73vcbQHirnK
	 WevPSToBA1Z2Bd1BJLSfJUjYuaTPfwrbFLBngxvVkBwusojgB7i28p0pf2CAjQGOTI
	 OWGI4RYaIQWxIe4yHc/B2L9MU3Oc48+TlxaqVGOJ28GF/EveSvbMI88t5jJUz/4gdL
	 nf1y1c9dXmjFaPj6ZVW4UfP4MnM2Kun7XmhFDsJkrQBpw2OmE8LzrNOto2vNhkkKLu
	 UZiKOWNEGnG9LzNAeH6ukYhQHtK47/+VD6Z4TrSDqQmwMgcGIcapZ+oEPd9Sevi3CG
	 OMAOYwUjQ3ETg==
Date: Wed, 20 Aug 2025 21:59:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
Message-ID: <aKX35U4jX55W3W61@vaman>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
 <20250810-phy-clk-round-rate-v2-2-9162470bb9f2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-phy-clk-round-rate-v2-2-9162470bb9f2@redhat.com>
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

On 10-08-25, 18:45, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> @@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
>  	usleep_range(80, 100);
>  }
>  
> -static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> -				    unsigned long *parent_rate)
> +static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
> +				       struct clk_rate_request *req)
>  {
> -	return rate;
> +	return 0;

This does not sound correct to me? should this not check the requested
rate?

>  }
>  
>  static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -170,7 +170,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
>  	.prepare = mtk_hdmi_pll_prepare,
>  	.unprepare = mtk_hdmi_pll_unprepare,
>  	.set_rate = mtk_hdmi_pll_set_rate,
> -	.round_rate = mtk_hdmi_pll_round_rate,
> +	.determine_rate = mtk_hdmi_pll_determine_rate,
>  	.recalc_rate = mtk_hdmi_pll_recalc_rate,
>  };
>  
> 
> -- 
> 2.50.1

-- 
~Vinod


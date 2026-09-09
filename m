Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AC4C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9ytG7kb5dbrGiKhe0oxqCTTvFC6jYjdhibOnVV1Go8=; b=eowucBP9NvkBStykPGX9Uk0Xh7
	rbzs0eqieVpmV4PzEpeNuzYydSb4UZIVh/rEhmo+1q8Zms3IuEY98px2TanPe5901WNBTM9AE7rUF
	bwONH42jBlC59j0KaB4P/VWqu+Vv7ioWxaYoe/lGYIH+wYJUjH/yiAGi80Q5xsqARFnplpmGAQDbk
	bP05i+GuyzIxT/dZLo7HcLLl9Hi/fVWE3rOxvKI3i5jfMnKzFXpf8kW2CcTsiRhviALBp000nyZep
	KioNDBbkkZqoDO1sVy0F7wRa3MfwLgv9/TZMr+tkjQHd4wVQZf79+A8rq4NbiDbBTfK95DM/ddX3V
	9iyvHOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jsh-0000000C5VZ-1z2C;
	Wed, 09 Sep 2026 15:06:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jsg-0000000C5VM-2I7L;
	Wed, 09 Sep 2026 15:06:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A55B26020C;
	Wed,  9 Sep 2026 15:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3D81F00A3A;
	Wed,  9 Sep 2026 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966392;
	bh=E9ytG7kb5dbrGiKhe0oxqCTTvFC6jYjdhibOnVV1Go8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mQ8HP/RaMQKuI/HcIUaifGof6tg3xWV3kT6LI8eYb9rgbpsVWzV+ByXU0riskHILH
	 i0JmeE6OALfZX8nSlHLj3RT5ls0hI/TW0WkTL7/grJm0KzHlKvABBvZlGU9NKbXRQi
	 AKpwJXKS2VMOXoeUdMgfSQwVPg7wyMfjHnv4RQYP8tuY1y9LTvmb/iNrGa+cDvMeVh
	 WlidRBgitZb7XcL/ODNZi9TqIoC5WWTzvN62bsZwe2rcG4qUsETYMI9E0ITvSOPhYc
	 MJP0B5yuO6qm/JyAD8dBlT1mETJEfIRbjxpVnD93WpIpLh8HojMepFQPLK0RpbXtlM
	 nJtyhY/CYFlow==
Date: Wed, 9 Sep 2026 17:06:23 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, p.zabel@pengutronix.de, 
	chunkuang.hu@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	matthias.bgg@gmail.com, granquet@baylibre.com, justin.yeh@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH 2/2] phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit
 ratio setting
Message-ID: <5bmxa4pcwkiemubwfjun3dti4szu66gnxe6yw2pudq3wplpc23@inyswc2bdlhw>
References: <20260701121936.19407-1-angelogioacchino.delregno@collabora.com>
 <20260701121936.19407-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701121936.19407-3-angelogioacchino.delregno@collabora.com>
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

On Wed, Jul 01, 2026 at 02:19:36PM +0200, AngeloGioacchino Del Regno wrote:
> The comment in the mtk_phy_tmds_clk_ratio() function clearly and
> correctly explains that the TMDS ratio has to be 1/10 for data
> rates under 3.4Gbps, and 1/40 over that.
> 
> Unfortunately though, the TXC_DIV register setting was wrong, as
> in value 3 means to divide by 8 and, in order to achieve the in
> spec 1/40 (tmds) data rate, this has to divide by 4 instead!
> In order to achieve the correct 1/40 (tmds) data rate, this has

This statement is cut-off!

> 
> Add definitions for the TXC_DIV register values clearly explaining
> the meanings (DIV2, DIV4, DIV8), and program the correct, DIV 4,
> value to the register in mtk_phy_tmds_clk_ratio().
> 
> This fixes out of spec clocking and, with this change, SoCs using
> the MT8195 class HDMI PHYs can now successfully be configured to
> output 3840x2160@60Hz over HDMI.
> 
> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

With above comment addressed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்


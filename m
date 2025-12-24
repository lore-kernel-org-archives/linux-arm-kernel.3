Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D7EE74ADE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 07:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ppye8HYjBmEPrdZNIzeH74t/GToJKaCPXTBOK93LMeI=; b=RPJZnXImMCYRGMzMnIXVZEW6E2
	Q+0DD97tZ3KXLkpUqbmaAnINZD/AYEeTv5/mVgFty5gR81TsiM9gyrEh6XZSp1XpOHYiS8U+QvG4Q
	k1Axuyai4ezBR+cfuTZMqkLfSaaPyTBhJpxE3vX+9N1oQcsyWAYIr7nwkmkRuahUstzaCY92ktm6v
	UFMuXgd18pewW8WlOeZpGpdKJu5binFfN2FEGKzKBMzUJO85ccJ3AmMUP7MxfhLhJBR9ztjBrpvYs
	MguqkEusk3wtiE9Lrr0q7T9dqsTxvEXgxYAs1hbDN5jBQEGGjVavIgXq5xtehoVhFH2wibEUdfXT1
	mXs+JzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYJMa-0000000GY0A-2OpI;
	Wed, 24 Dec 2025 07:32:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYJMY-0000000GXzp-2TvQ;
	Wed, 24 Dec 2025 07:32:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97B9860151;
	Wed, 24 Dec 2025 07:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE239C4CEFB;
	Wed, 24 Dec 2025 07:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766561569;
	bh=w5e9TnrVP5ABegEPA7dNb4tZYj1u9bTP/vBnZ/hS2tY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hf1E8ILlRZDpG0ZPukbun9DVqpea0FkRG2ChgsNG6vJJBC/qZAY3i5nFfeheALSMK
	 IDNhzn7UIoC5XgGSVEH7yG0Atxm8YwHRK/yI0HFaOKxrbe3JLB5p34lUm9hVaBOi3O
	 ZBy0HMOjSekxO45JZlZRDyYMFDB3rkLlbLShcQJzeGOiTWtgUdgkz60UsKhnRLq0Gp
	 dkcloG7u9WNzoPep08Fg9yyLTwED9YFtErdQcV1H/6QiTCsN2EbJ9rCEezAAS6xlpf
	 l0ttNUllE7L4749pz57ZD8GkevkZPlkZEu/Tmo4OnwYFZ17FF3P/9PxIg+RY+rp4ba
	 YaTgX2NXFfA3w==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
Subject: Re: [PATCH v3 0/9] phy: convert from clk round_rate() to
 determine_rate()
Message-Id: <176656156358.817806.16966474957670370356.b4-ty@kernel.org>
Date: Wed, 24 Dec 2025 13:02:43 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Fri, 12 Dec 2025 08:16:18 +0900, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the phy subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Changes since v2:
> - Patch 8 (phy-rockchip-samsung-hdptx): fixed merge conflict so this now
>   applies against next-20251211. Cristian / Heiko: I kept your
>   Reviewed-by since structurally the code is still the same as before.
> - Link to v2: https://lore.kernel.org/r/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com
> 
> [...]

Applied, thanks!

[1/9] phy: freescale: phy-fsl-samsung-hdmi: convert from round_rate() to determine_rate()
      commit: efc389fa00d1b93df8f95974c4f8c11da63671da
[2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from round_rate() to determine_rate()
      commit: ebed08490d667141085ed873309aec5806dbb3a9
[3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert from round_rate() to determine_rate()
      commit: be4267241c196745e1f649afb7d232fe4440073a
[4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert from round_rate() to determine_rate()
      commit: 7a4ce5a9b674654ab04961a9ea03d15d71edb2a9
[5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert from round_rate() to determine_rate()
      commit: 8e6bb53203d5c0a0cbc4f5cd90d8b2c6f20818ba
[6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert from round_rate() to determine_rate()
      commit: 0484168a352f0f75a82d9917df4b23f5466726b7
[7/9] phy: rockchip: phy-rockchip-inno-hdmi: convert from round_rate() to determine_rate()
      commit: 2f7870297ae073b0fd6e1f875a9b84c5de0dea00
[8/9] phy: rockchip: phy-rockchip-samsung-hdptx: convert from round_rate() to determine_rate()
      commit: 3d4ffdfcf108e73b7c5bf07e0358d0fe8fac28d4
[9/9] phy: ti: phy-j721e-wiz: convert from round_rate() to determine_rate()
      commit: 27287e3b52b5954b73203d32ee76ffd5f53f5074

Best regards,
-- 
~Vinod




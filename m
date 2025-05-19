Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0753EC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 21:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbZyNy60AG+bFaAqmr0yh2auwJm4njPkSBqBc2hz4UU=; b=EtafU4mpHTkE9f/EDCWpda21vW
	o5ItBfrDALqqZ6mN/aRCo4DdV+yhfhL3NmoG8AOehmtQRuQsUl6bjsGeO0slSWbWL9KtzGJWrodWg
	3jTHeVP3641EQ0vgBd1plOsg5KtmJmMMNEuY3EiFmKu0/Jc5gEvBfsdVwtHhSWfYlXsLuuT16RBfT
	5N7JZ0POAamGED3ftsri81QX7NP2+46QoMiEv2IyeWQMe5pxTwXhnGnzWnmuXwr2urCe3OsTdVqwS
	ggAB23x5frL1EmPWj4ofAOFvOvBnFA4FDvEP4riup55Rw0KTADSUv40Qq84jYRs2JEqVa8owhCOJt
	68UMuoDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7xv-0000000AWeb-2en9;
	Mon, 19 May 2025 21:24:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7vn-0000000AVqt-0ePa;
	Mon, 19 May 2025 21:21:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C100629E7;
	Mon, 19 May 2025 21:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0D2C4CEEB;
	Mon, 19 May 2025 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747689713;
	bh=LfKgBqTTScbLaiJqyKNCt7VK1YfWHS/A9Ldo7X3cW8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SUAHtZMwI/VCF73YO+p6zauBAiqt9pV5v5wNGaHCj1yY/xJJ63SuX2yntmbL47aiS
	 MzZNOUbfHTlUKcikt8phH7ardFj3bf7ABwUu1ymFfqjCdEevRzFrdlGJ7kUYIogTLV
	 k7C9eGYfX0xF8iMqqiQnNiNHMo8ncM74vSRAIyZIKWIbtNyfq0aQArmzIclzc+T5Y6
	 N3hQHeRCFjZ5JIba0AdKEdEeE+NKNvA2hav9DlJmUFwfYCJLRNwOEi25LcbhrFHzYP
	 zTgqTtgYSHT+ogHKLb4JJFxUizdsgX32UAN8ahiIUDvcQfA1ITQgywbqQJP/eW47R9
	 dQjRmLaLFPWHw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Algea Cao <algea.cao@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	kishon@ti.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 14/23] phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output 50.25MHz error
Date: Mon, 19 May 2025 17:21:21 -0400
Message-Id: <20250519212131.1985647-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519212131.1985647-1-sashal@kernel.org>
References: <20250519212131.1985647-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.7
Content-Transfer-Encoding: 8bit
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

From: Algea Cao <algea.cao@rock-chips.com>

[ Upstream commit f9475055b11c0c70979bd1667a76b2ebae638eb7 ]

When using HDMI PLL frequency division coefficient at 50.25MHz
that is calculated by rk_hdptx_phy_clk_pll_calc(), it fails to
get PHY LANE lock. Although the calculated values are within the
allowable range of PHY PLL configuration.

In order to fix the PHY LANE lock error and provide the expected
50.25MHz output, manually compute the required PHY PLL frequency
division coefficient and add it to ropll_tmds_cfg configuration
table.

Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Link: https://lore.kernel.org/r/20250427095124.3354439-1-algea.cao@rock-chips.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 2fb4f297fda3d..88d265220e2c4 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -325,6 +325,8 @@ static const struct ropll_config ropll_tmds_cfg[] = {
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
 	{ 650000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
+	{ 502500, 84, 84, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 11, 1, 4, 5,
+	  4, 11, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
 	{ 337500, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
 	  1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
 	{ 400000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
-- 
2.39.5



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C16C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvpTtj4EuGPU0Q9Fl+S2GkoBhWzlkW0KFN8dPWuUIRY=; b=ZweffeyFM12E6YX2mcIpYQ3abF
	QTizDToHxwIv8eElCqjB/fzWR/2TTGhVJHAik+aJeSr5RMlYW6/5qSstwsElmqj16/hLI9Tp5TBuk
	I45cXNh1k+dEoz8nZ+Qa7NTlUbZjCRhdgqdk2NT7y89yjVFso7L2g22ohtzSWvADJECxYj9s/Npki
	XR0ORAYFWwZ5UhuUSKLY2lZd/DOdcg09Gl9wdeWO1fuo3GbswIhHOr+7BGeZIP6HnUL8XnTyvc4lI
	cq3CQKv/aJIyusMYVmDScQV53bwpZoUS01dH6pYJM03fVNLcRqdnU5PNKJOoQc/NjtaMm+1pkjIlj
	oOamWGog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEng-00000006Uc8-1Fsw;
	Tue, 08 Jul 2025 20:20:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZE82-00000006MAi-2qzw;
	Tue, 08 Jul 2025 19:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752003441;
	bh=+erTwrLAUAZ2OsDl2bkXkrwnk4JpthhQCZF8qikCfo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ph0J5lb58BZKDnah1X9pNHZcabTHk+EwvqIKCARjcKyhFI8esQ4Ummsy3erLqvLPP
	 cSV5GbvvnCPMfkCcJzveqn7BY4uga8EZwN0/JO6T3Oki4FFLIkfnzbUQ9+alxfqz7T
	 i+QY6YAnDA62YNH97ROBm9k5m16zlslFHHk8l44Lu02XVWskxFR5RseDGmmoIJaPsB
	 P/UGj7My5M6V4teGLlph7tmgSF9K04lndrBtmAxkAeZSX1YalBDqO4DtEUgdRTnGzz
	 X8W3ID9XVBbhteAOsIJn0PZwXYEBM+CpjkaGliRtPf2ei6UVvxDOlIo/oo5g2SEYx+
	 0FzkarYZiEBMw==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 0B6F017E04AA;
	Tue,  8 Jul 2025 21:37:21 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 08 Jul 2025 22:35:45 +0300
Subject: [PATCH 04/12] phy: rockchip: samsung-hdptx: Use usleep_range()
 instead of udelay()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-phy-hdptx-frl-v1-4-cfe096e224f4@collabora.com>
References: <20250708-phy-hdptx-frl-v1-0-cfe096e224f4@collabora.com>
In-Reply-To: <20250708-phy-hdptx-frl-v1-0-cfe096e224f4@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_123722_864506_77A07848 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

rk_hdptx_dp_reset() is allowed to sleep, hence replace the busy waiting
with usleep_range(), to allow other threads to run.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 2dd70f0cd8de34aad957d4d146366e5521cd897e..6f12ac54abc1e1f0d67226899bb2c394e71a99cf 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1074,7 +1074,7 @@ static void rk_hdptx_dp_reset(struct rk_hdptx_phy *hdptx)
 	reset_control_assert(hdptx->rsts[RST_INIT].rstc);
 
 	reset_control_assert(hdptx->rsts[RST_APB].rstc);
-	udelay(10);
+	usleep_range(10, 15);
 	reset_control_deassert(hdptx->rsts[RST_APB].rstc);
 
 	regmap_update_bits(hdptx->regmap, LANE_REG(0301),

-- 
2.50.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451B1C5CFD9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 08:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2+6wZstg8U33tm54g8i/oF/dUsVX2ie+24q9Bn6w//g=; b=IkW5zO0jSZye7vaaBCV99FpxLR
	f2sAQJzUmxrwi053KcDHsuUXiW8A65eF56QsnPoW7TaEOXBuZ5PG68PARtL8k5Mb/Ub8mjNIWxr/W
	U9gPC7xeXn0ifemYpLQAE2zajuwwVbau/skld1/lEUveuHPVU6oaOt6Ydl+/nL0mXB82u5OyM0qaQ
	W+8BatlP7ZksAIywq8/zdZn1L/X/D3qlykVRaLoX4Twkw3xGc0aTLrkh4gQ59kNSTLW5PC2lNIaCS
	mKdpb2RZF3YOdg+5H/5K5x6gnf88n/P+A90hl7Mx6+cLmm1yirVx0FsJrhORI5yBdihl0vwLwlY/B
	aHHcOixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthZB-0000000DZkX-063R;
	Tue, 11 Aug 2026 08:10:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthZ8-0000000DZjm-35Sh;
	Tue, 11 Aug 2026 08:10:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FFD24081C;
	Tue, 11 Aug 2026 08:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0548FC2BCC7;
	Tue, 11 Aug 2026 08:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786435830;
	bh=tSdXxSArn7IbenIVBMGRTaWfj6BMz2f9MqrXBEtHgwc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Kp0JwN/Nuv6smsdkaJCH9aXnuSIrMwT/7GG2g1/a6WKH/IvoW9qxSdgvPiHizTHkr
	 ngQgfbmdvGiuaZaRdgG3yP4347PA+L9aHafqOKSokhUgBOoeiMiCq/q5YoxoNYwTKW
	 t21NPZ6HlbQjmLJPw8P+k3rrm3mX6Y/rhBh2Q0X85azN3TiWCwbtA5miLIKDEH9pmh
	 o7i2B0MXj6j7t4EVCZKdXwgvSDsxqPcTzbHbCnLMlId59JNKpVjEkMqQ+1IJrQQEP7
	 Y8/8AT+Rttl3o/ehF/BzEbBR9w3gJYnWCmWdAxdfFifDx3djBI/R6RToAXiUO3ret8
	 WJlvuT53WZq5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C81C5CFC1;
	Tue, 11 Aug 2026 08:10:29 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Tue, 11 Aug 2026 16:10:22 +0800
Subject: [PATCH] phy: rockchip-samsung-dcphy: fix out-of-range max_register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-dcphy-maxreg-v1-v1-1-aa63f6a63a64@gmail.com>
X-B4-Tracking: v=1; b=H4sIAO3YemoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0ND3ZTkgoxK3dzEiqLUdN0yQ11zk0RLS0sTk+Q0UyMloK6CotS0zAq
 widGxtbUAuNUpvmEAAAA=
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786435829; l=2208;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=qv+04pxhwLXk8iXSSS/x/7Q7kow98bcT2dkV1hHRCgE=;
 b=qPMHHnolquLwGtQkH83g6tkOLMluIQXScxSMyabXwKUys0ySRfFH3x7IazxR8A1svJxuiZgRQ
 8Yf65P8a2Y0B0W9UXGpqIzVRgnxJ04M/eQKnfOOB5KihTSXT4RDQNIp
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
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
Reply-To: jason98166@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jason Yang <jason98166@gmail.com>

The PHY register block is 64KB, so with a register stride of 4 the
last accessible register sits at offset 0xfffc. max_register names
0x10000, one register past the end of the mapping: dumping the
registers through the regmap debugfs interface reads beyond the
ioremapped region and oopses on the unmapped page. The oops fires
with the regmap lock held, so later PHY operations deadlock.

Fixes: b2a1a2ae7818 ("phy: rockchip: Add Samsung MIPI D-/C-PHY driver")
Cc: stable@vger.kernel.org
Signed-off-by: Jason Yang <jason98166@gmail.com>
Assisted-by: Claude:claude-opus-5
---
Observed on an RK3588 board (v7.2-rc4): reading the debugfs
registers file for this PHY faults deterministically at offset
0x10000 (translation fault in regmap_mmio_read32le), and every
later PHY operation then blocks on the leaked lock. With
max_register corrected the dump walks 0x0000-0xfffc and completes,
and the PHY keeps working afterwards.

Growing the mapping is not an option: the TRM address map lists
each MIPI CD PHY as a 64KB block and the second PHY starts at the
next 64KB boundary, so offset 0x10000 of one PHY is register zero
of the other.

The same mistake was fixed the same way in c7d436a6c1a2
("dmaengine: xilinx: xdma: Fix regmap max_register").

This is independent of the D-PHY receiver series for the same
driver and applies in either order.
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index cbd780556da8..18f5f582d1d7 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1526,7 +1526,7 @@ static const struct regmap_config samsung_mipi_dcphy_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.max_register = 0x10000,
+	.max_register = 0xfffc,
 };
 
 static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,

---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260811-dcphy-maxreg-v1-74a99944cf52

Best regards,
-- 
Jason Yang <jason98166@gmail.com>




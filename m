Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3E4EDF170
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKCUIC6yucfA4Qlk4vJzVhUFelItDmwvJOCRC74MCWM=; b=x10sfBrznk3u7YQ20Ou+Uanwqw
	RJiaSeVXf+ukIPuamLekr3ImR66TUSCwfXVxZW89phcEeo0+llcJxscO+noI5OVGckBl91ai6mfwY
	z3qXr8AKgop+3LTRvjP6ikdpeZpRk83xELjcRsmcBVTJc7vZxHls8uER0BGQQF9uZDN3M5Qmno2n2
	VW8HHO2Nox2fYDq85GpY1Z3AG7BwDoYIVK3OQy3zo5uFOsGH7Fja3Q2tbPWi+609bVy3bvyeoBXi4
	HWXCEDpdPUUqXEO3LNjRdnffThSOXqfPjX2VLNBvPPT7NEwn7Fu/wVxoja0bSuFEhjtevZiv9Cw+R
	HFl9n+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKh-00000003YWi-0Xhz;
	Fri, 13 Feb 2026 14:39:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKU-00000003YLT-4C1b;
	Fri, 13 Feb 2026 14:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770993571;
	bh=7erG1vSntiZYfDvD9BPxDXJhjGY+cucRfQBaEqe1HlY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XbtZ3mpMj0al+Y6ZnDssTMaPqGQwayBfzApX8nZ52HKOSOPbwB8106sFYPsF8Ysg9
	 vfVrnJYZEl0UIsu+BbBFCIJkt9BqlQ+ZnrsU/RhZzmVQnmNMQ2w7+NUPOxNosHVb+a
	 A3EqHFoQCFenki7FygUy5kVklGkxy9Gndo13T+UGv3cxVfrsb3YH2p8f2aFZ3n3Ikv
	 t2F9rhCC8z10JlwST9Kfuu+v5Ma/uSmvoA/ztHVW7t+hm7GL7c8OdgTJqCPvNBRg+t
	 iZMkBNU2vDKt563mGVlOycGHhrUNfXhdPdKewO3XNCgY8OBVxWD1IVpRh+h7IF8vND
	 2vuH9HfXvNAVg==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0236017E35CB;
	Fri, 13 Feb 2026 15:39:30 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A48A7480028; Fri, 13 Feb 2026 15:39:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Feb 2026 15:39:26 +0100
Subject: [PATCH v2 3/9] phy: rockchip: usbdp: Amend SSC modulation
 deviation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-rockchip-usbdp-cleanup-v2-3-b67ec225f96e@collabora.com>
References: <20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com>
In-Reply-To: <20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DmJGqquNgLK3sA4UZxU1kvwePYoRCEplGjQQLTvjtuw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPN6L8/zsXW7i/yR2pli5WYUthugEfmpOo0
 LBVJviVHxKvOokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpjzeiAAoJENju1/PI
 O/qavpkQAIxF+tT2W+HaPs5A98sDF2ZKHNsRow2BaJxdrhZtaRMXHNnMMWZpDz8Jrxs1bnS+eoI
 KEOQVI4nv2uaS927aY5Lxfw4HKodj//3qQs9cvogTH32Uad/Rh45JZ0bb3eTOQIpahSZuzMeT54
 jh0n1k9zwtm8lfIwEcKE1Xm9betrsxSsWGW6S8K5awBJqu/03276GXXKNOTGafU+9Ctq1kuUwge
 fgVKRnRuQodmm/XtToCCV9+mAkUZDtEq8YBrtOxVozHLGXIp5IwQtSZ+eqx4oQlU0YIc+7NR2jp
 seVSoxfUzYhZbyTFkvsjQtiUpO/euLYzOYJrWJqGXrd2fCRVHyzn1rwZpcN5P2JRf+omAeB5TKj
 lqzTDrcOGY1RLm2PWgO4n+QCV7Gnhpym0Mi5hLOUjioHK6JxmYfc/lfm3iaucnaH9G64eDNlKfP
 ZlkLvOLJ9DkfOG2SSIejirqXIayu/EMz9qSNwUeh3mg/sVoMeYMIK62Do7PJKztrDm5WZ2t3IPt
 c3jTTGfAKraWD9A7CFftCDqtzDbnzwbxhUsXehamKFeLx5A1XVPr/xUsKg1Lul5FVCqamDpQidO
 Q59YCEse31kzqfuntdF283vG+yDgccQuuaQ9yPPe2x/80lChip3/X5EzCSgebEBrzZzmO1ZmXKt
 IVp4sgiGPBVMcme4sLuQwHQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063935_220009_609E46FE 
X-CRM114-Status: UNSURE (   9.76  )
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

From: Frank Wang <frank.wang@rock-chips.com>

Move SSC modulation deviation into private config of clock

 - 24M: 0x00d4[5:0] = 0x30
 - 26M: 0x00d4[5:0] = 0x33

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
[Taken over from rockchip's kernel tree; register 0x00d4 is not
described in the TRM]
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 98562a888b42..1f686844c337 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -350,7 +350,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_cfg[] = {
 	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
 	{0x1a44, 0xd0}, {0x1a48, 0x01},
 	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
-	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
+	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
+	{0x00d4, 0x30}
 };
 
 static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
@@ -377,7 +378,7 @@ static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
 	{0x0c30, 0x0e}, {0x0c48, 0x06},
 	{0x1c30, 0x0e}, {0x1c48, 0x06},
 	{0x028c, 0x18}, {0x0af0, 0x00},
-	{0x1af0, 0x00}
+	{0x1af0, 0x00}, {0x00d4, 0x33}
 };
 
 static const struct reg_sequence rk_udphy_init_sequence[] = {
@@ -412,8 +413,7 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x00d4, 0x30},
-	{0x0024, 0x6e},
+	{0x20d4, 0x08}, {0x0024, 0x6e}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.51.0



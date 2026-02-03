Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E16E87857
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoyZEuwU9AmRU8Za8vRnkHPuZCXGHRBBhfUkWoZOiio=; b=fZ7dOEd7tSbbTOSPdkBVcpzsez
	dvOrfBcKpTNMh+B1fdJXIa0VkDhFKGQ1OgSjCozzP9WIKpUZC10o2oOb3jcI6QX0p0n/Fo34OsIt4
	hWmQw54rei7sG27OJHq9+dlbJTYRUErmLDHfsBY1mZFRinBSmbkEorqX3RCPe/20jNTqVj6+GI5ch
	h4rro4ODDPCR7Wg9z5r2ifQ6qqDjBXiaGAjDLmjFcA0qVTxoP8qIyqph8ESfgUk6pNTISgwW99TiL
	aLlToqZ/VmuWb7EIfRzgMORrauBAktmZgHcll+w+lO5B+WoH7V4zH2rL5BusOTXuoxcqZJaLMKgBI
	y0QreIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLr-00000007AyQ-3wlN;
	Tue, 03 Feb 2026 18:42:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLn-00000007Ary-3Epi;
	Tue, 03 Feb 2026 18:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770144126;
	bh=BLWs61GCfo1s83BYplKIk5R6XzcPP/MZOpccHPKGpKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TmLiUMq0xWsF0E9+PlQjpTeSBVcfz2AR/Z5G2scYYALnGwZWRbF3NDCkmvXkTvkDo
	 QlSp4nIxoxlhdjpGLAw5yJrUcnoXB4UYvydpbn5NfTzvLtijbGNVEmvLsxnfzUlbD6
	 2aFzva97+X2xEpUx80XYuBf6HwWRqd7+yeJGdogyNBWL6mAtmdDfBQjE+MdDYJ0qvi
	 ZgnFuPTj0anBcf1/8YyNEnskJ44VY3QmWlsGBUDDvjkzszOeruNFeTKgyt4oEj848H
	 SC1phQ19TgdcdA4HfZG27kYTUBcWt1djSrqmcuKa2EAR6nDJjsI0DrxrLIZyVzcEIJ
	 wN3QKevK6qHhg==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5C2817E14F2;
	Tue,  3 Feb 2026 19:42:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 50CAC48002B; Tue, 03 Feb 2026 19:42:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 19:41:32 +0100
Subject: [PATCH 6/7] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-usbdp-cleanup-v1-6-16a6f92ed176@collabora.com>
References: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
In-Reply-To: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=BLWs61GCfo1s83BYplKIk5R6XzcPP/MZOpccHPKGpKE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCQX3MUc2X1aPba3TUi9akL8o1eyn++X8TZ
 sB4R0CPwVLu/YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgkF9AAoJENju1/PI
 O/qaSc0QAJ2khlQq0jpo1gYronwaW4JYd4EpzVPJ4b+2HnQkpKvbgjABBbm/zmh61n8+aPvCh+i
 PfmE9NY8o1/PIOy2Cy0P3qoa/ZBkvMpGVWP0AZBCaX1SRJH9HBVgKEXzbPIoVUJQbGWNwTrH/SP
 iC1R1jDQzWWhlfMR2hYLbigEIYDpjmG8G2lf6ceNOG95OvQggazuOWJSXRwVIqnfg68tdmRchxX
 8JfCZbtx3AKW7KZpeD3ijJI0UzTS9e6aBwExKcWhhyPgY0TrfDpLEGTZEuq8XCBnVlGohgvBnFw
 XV7SzzAcV7CxcDUJWMsl7g+Ci5/IuMr7oaCKNpxHZ3yBqmDoXQcu6MQWhBtksleN29zgN4pFNod
 RX60BISHWIQdQsiZHbYT7bGDiEM/MK7rdiYmEFw5U7PjnNLadeZRbXpjq/EtrsgO7+y6QLY0NHG
 sscrrCrx3uX0n7pGgyS1c3FO4wpYlqVsDB9km7JcYxcGhSoMd9RAQ6sqOSV5uWBJ3zR362xOPuC
 78Esf8oCc1IjD/lqjPxOeAckwJtpknHfdzsx9vKXQq8tDkuMiiSob9Stj0PuJind045uKz/IXAQ
 nxhsJ4SATg4+q5+uyKFGFJUudEmRhtM1qEdhgIl9gvVxJOfHlFdlRRtnxGC4IraS3/T31NVAbwq
 5JlUeO/0ljMMcvLt5OfsoQQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_104211_975876_261F8C83 
X-CRM114-Status: GOOD (  11.30  )
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

Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
with the existing helper macro.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 4388105dd8ce..9291f56120f1 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -75,7 +76,6 @@
 #define TRSV_LN2_MON_RX_CDR_DONE_OFFSET		0x1b84	/* trsv_reg06E1 */
 #define TRSV_LN2_MON_RX_CDR_LOCK_DONE		BIT(0)
 
-#define BIT_WRITEABLE_SHIFT			16
 #define PHY_AUX_DP_DATA_POL_NORMAL		0
 #define PHY_AUX_DP_DATA_POL_INVERT		1
 #define PHY_LANE_MUX_USB			0
@@ -104,8 +104,8 @@ struct rk_udphy_grf_reg {
 #define _RK_UDPHY_GEN_GRF_REG(offset, mask, disable, enable) \
 {\
 	offset, \
-	FIELD_PREP_CONST(mask, disable) | (mask << BIT_WRITEABLE_SHIFT), \
-	FIELD_PREP_CONST(mask, enable) | (mask << BIT_WRITEABLE_SHIFT), \
+	FIELD_PREP_WM16_CONST(mask, disable), \
+	FIELD_PREP_WM16_CONST(mask, enable), \
 }
 
 #define RK_UDPHY_GEN_GRF_REG(offset, bitend, bitstart, disable, enable) \

-- 
2.51.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F33CDE009
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 19:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tP0HC30qs4ih6AvYmoh8JUmvnmXcZQTh8ijGXT9HV+I=; b=4AUR4FNZk92MaMwSHXfbeVF1Ls
	eNTzy1uD5CTTWkqu1xUhesq5c5lVMnKIiOOl+r5F2pvMV/6TnKZvEWA1XEF1Fz5nlaiX9tjsNJ8CJ
	k70KXoHqeNg7J3W9+SRjkeX7aDFs210YaR/wdDCGgGE2ulRSJfVKeXINMBX8a9ep9YHfbCB7fTIwc
	uxrjRGbkOUuDUAHdT9mipPy8111Wvi1JuvSrfh+88p+WGJP1891ps4v9G/qSMuonQPL33INVEPer5
	yOMJRjOws6w5MWmJ9iXfPcv7dS5ByN8T36AH9eSCIJ1DrD1jP6zwzzk2SKJauO3RDNaXUVq5T8Rng
	+YV3CZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco4c-00000009bIV-0RGA;
	Thu, 25 Jun 2026 17:41:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3M-00000009Za6-0jwE;
	Thu, 25 Jun 2026 17:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=jL6EGfVAkl39iYFqWeesiDXL+z+JZr8ncJYla5iaccY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cmpsjloB85Bq/5X4nbXsu7zRlA2VUu5hke9W0vob2a+Nw4GNc9YrCi8SJVCvSu1Aq
	 uKheUSKwFawlFWS41ieBA8iTao3190ZhxgxD9bKDQfiylQipykttTMXZZkK1t3rajM
	 teJKWyK6i0bu8lVy6YZBAVIuHbWoB320SIKLwlqw4YJWe7ITWBpGmR84jMQUWONGMM
	 6EfqELQ/X2Tb40Ncy3vYiFB7ynhnV4Y69mLM/iZPwFMNB73t3rZzmhslPjkHjJp/AN
	 BufPLii76vEKSLmayEkELV4gn6+3Bn9rUgIYxgn5kAF6+2yTBrxhZuAUBtMED5d1Xe
	 D2dQPCcWUUNBQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 479B017E15D0;
	Thu, 25 Jun 2026 19:39:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1EEE748006B; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:53 +0200
Subject: [PATCH v7 26/27] phy: rockchip: usbdp: Add some extra debug
 messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-26-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jL6EGfVAkl39iYFqWeesiDXL+z+JZr8ncJYla5iaccY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9tPjAkqsm1AOaQV/ET9R5n/YEkXwQQ3B
 5+gw/DC2CBos4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaN5AP+gLP9xPzRMsDnaWPseA0gnHs4Pyigl08euTQwg6BFFY2rHG871VT9Od2nmQaq7+aEwG
 JUcBVIS137GkHEeDU+5S4RE+ylhKmcCsmUE8+s12Tn/ieIKMRsqXrLeVLHi+IINS3ccfu0x4iDO
 7N+ph7YO+c09QSWqEPQcNNc5qXDzNp5NiN59QGlTG6MReBBMMP3+vvCbv2R2zkmU0CSMXjU0CxJ
 aT8OdmZVB4b4BYCDt30HsLF9snI16dtUPtXkNcQzfj83Gcx1fJR+9tTT4Q2gYGOwBNOxYdJ7yLv
 LV/O4UnCR8zsoUljwb4GUjYfgqXAmkgd2AlUto0EhGm4MfZFPprZq0HZbxPQSIHz5nyOUTs0EXy
 Hq1S3rPD1ddL/6OUhS0XCnO2LQkp9XB/JENgBvmelkIFpIOjah0aPr8apX7x6HBVBQhVRSLdFpo
 /T+ICwgnf1Q1K/sr60DaeGnPfDNcdG9Z/3CUeFQa3vXreMVssRkWC4J1W0/tDwnkQqYtYFG+Cdj
 gkCCjSZYY+vnvMrR5nGxSKH0TFaub6BFfexfVMrIElM13XUgYBdP7gSRHYDbO3+gzV9yx9jyg1P
 u+Nq7lbOPoFF4vKKhe82xEkUVkGuEN6PvWN2GJhngu/mivhLILkexK1/sQMIa99FtoaRylySXpi
 43QZXTEhNo2UUSqTJbgA0Xw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103952_416874_2DF97286 
X-CRM114-Status: GOOD (  10.10  )
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

It's useful to log PHY reinit to ease debugging issues around
USB-C hotplugging.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fc788f2bf5fb..8c5d6b8595e2 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -24,6 +24,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/string_choices.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
@@ -494,6 +495,8 @@ static void rk_udphy_u3_port_disable(struct rk_udphy *udphy, u8 disable)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	const struct rk_udphy_grf_reg *preg;
 
+	dev_dbg(udphy->dev, "USB3 port %s\n", str_on_off(!disable));
+
 	preg = udphy->id ? &cfg->grfcfg.usb3otg1_cfg : &cfg->grfcfg.usb3otg0_cfg;
 	rk_udphy_grfreg_write(udphy->usbgrf, preg, disable);
 }
@@ -787,6 +790,10 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 
+	dev_dbg(udphy->dev, "(re-)init PHY with USB=%s and DP=%s\n",
+		str_enabled_disabled(udphy->mode & UDPHY_MODE_USB),
+		str_enabled_disabled(udphy->mode & UDPHY_MODE_DP));
+
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
@@ -857,6 +864,8 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 {
 	int ret;
 
+	dev_dbg(udphy->dev, "enable PHY\n");
+
 	ret = clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
 	if (ret) {
 		dev_err(udphy->dev, "failed to enable clk\n");
@@ -875,6 +884,7 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 
 static void rk_udphy_disable(struct rk_udphy *udphy)
 {
+	dev_dbg(udphy->dev, "disable PHY\n");
 	clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
 	rk_udphy_reset_assert_all(udphy);
 }

-- 
2.53.0



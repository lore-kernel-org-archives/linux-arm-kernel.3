Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34480C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XjvrR6q3G+2JmmkCKiYy4LR76MiqgTrB4foZPd0p2Zg=; b=trC9/c7DT8rEkH/n74/Hf7vk/T
	CBaVdOmHiORDd9qiRgUZOXKa1qEnDYlmgYSmlEavi8Lgf2gGfd7DGNPsAO3wC1CuBmYKg1uSLAl4p
	1lY/vRmgAPtxsOD2sMRdpHuC3+lHR05bfrc+aWTh5vcUI2kCHSYsjCzuPzQnyihNdHOeU353Xk2id
	NnKt09fD3IodbMO7Myo0ddevBNmGFDhmI3zQBgiypXHzkdCOnnmWqUcSfrziDc0xAeCL+tTAGsLm0
	uTIJnksBMmVgTEVllVU8+xRxvmTNoKo1UkoosGO26Fr9uhBCGdEHg9Crciah6EzRz0TOYqyybUmAl
	zK6DigMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BeY-0000000BLL5-3Rak;
	Thu, 17 Sep 2026 12:55:50 +0000
Received: from m16.mail.126.com ([220.197.31.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BeV-0000000BLKK-2bzr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Xj
	vrR6q3G+2JmmkCKiYy4LR76MiqgTrB4foZPd0p2Zg=; b=UpCd+nEFMsKK4Opo4v
	hfoPaKkZ2gCgDaMK1q704AZyxZV110Dc+WrViDOlgo5OrLSxt4hoMrCW8e7G9Jkm
	mbKPn8MoAGuPGuf+LTNjO4sYD+u9IZxTI5RIlulwxL9qY9NKoIW8FcOJhzUbZ4OW
	G7PzNXdJS/A4C0QFw94Ew309U=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDn_8Qj46tqab0kBg--.26898S2;
	Thu, 17 Sep 2026 20:54:59 +0800 (CST)
From: Linkui Xiao <xiaolinkui@126.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linkui Xiao <xiaolinkui@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH net] net: stmmac: request the MDIO reset GPIO only once
Date: Thu, 17 Sep 2026 20:54:57 +0800
Message-Id: <20260917125457.1353718-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn_8Qj46tqab0kBg--.26898S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFW8XFyfWr1ruFWUCry8Zrb_yoWrJr45p3
	y7Zay5Ar1kJr4xXw4kJw48ZF98Aay3tr4UGw1I93yS9F4UtrWYvryaqFy5ZFy7KryUuFya
	qr4Uu3WDu3WvyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UYiiDUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlQOGXWqr4yNcaQAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_055548_036685_0B30F1A9 
X-CRM114-Status: GOOD (  17.36  )
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

From: Linkui Xiao <xiaolinkui@kylinos.cn>

stmmac_mdio_reset() calls devm_gpiod_get_optional() every time it runs.
A GPIO line can only be requested once per consumer, so from the second
call on gpiod_request_commit() returns -EBUSY. devm_gpiod_get_optional()
only turns -ENOENT into NULL, hence the error is passed straight back
and stmmac_mdio_reset() bails out before pulsing "snps,reset" and before
running the STE101P MDC workaround.

The first call, made by mdiobus_register(), succeeds, so the failure is
only visible later on: every resume that does not use WoL goes through
stmmac_resume() -> stmmac_mdio_reset() and returns without resetting the
PHY. Boards needing a hard PHY reset after power down then come back
with a dead or badly negotiated link, and nothing reports it because
both callers ignore the return value.

The descriptor used to be cached in stmmac_mdio_bus_data::reset_gpio so
that it was requested exactly once. Commit ae26c1c6cb9b ("stmmac: fix
PHY reset during resume") relies on that cache to reuse the line on
every call. Dropping the cache removed the protection without replacing
it and reintroduced the very bug it had been fixed for.

Cache the descriptor in struct stmmac_priv instead and only look it up
while it is still unknown. It is devm-managed against the platform
device, so it stays valid for the whole lifetime of the driver.

Fixes: 7e770b252a62 ("net: stmmac: drop the reset GPIO from struct stmmac_mdio_bus_data")
Cc: stable@vger.kernel.org
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 20 ++++++++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 7582fca63741..986fb43db45f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -25,6 +25,7 @@
 #include <net/xdp.h>
 #include <uapi/linux/bpf.h>
 
+struct gpio_desc;
 struct stmmac_pcs;
 
 struct stmmac_resources {
@@ -287,6 +288,7 @@ struct stmmac_priv {
 
 	unsigned int pause_time;
 	struct mii_bus *mii;
+	struct gpio_desc *mdio_reset_gpio;
 
 	struct stmmac_pcs *integrated_pcs;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index afe98ff5bdcb..5f99d7db39f7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -389,11 +389,21 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 		struct gpio_desc *reset_gpio;
 		u32 delays[3] = { 0, 0, 0 };
 
-		reset_gpio = devm_gpiod_get_optional(priv->device,
-						     "snps,reset",
-						     GPIOD_OUT_LOW);
-		if (IS_ERR(reset_gpio))
-			return PTR_ERR(reset_gpio);
+		/* Request the reset line only once and reuse the descriptor
+		 * afterwards. A second request of the very same line makes
+		 * gpiolib fail with -EBUSY, which devm_gpiod_get_optional()
+		 * passes through because it only filters out -ENOENT. The
+		 * reset would then abort early and leave the PHY un-reset.
+		 */
+		if (!priv->mdio_reset_gpio) {
+			priv->mdio_reset_gpio =
+				devm_gpiod_get_optional(priv->device,
+							"snps,reset",
+							GPIOD_OUT_LOW);
+			if (IS_ERR(priv->mdio_reset_gpio))
+				return PTR_ERR(priv->mdio_reset_gpio);
+		}
+		reset_gpio = priv->mdio_reset_gpio;
 
 		device_property_read_u32_array(priv->device,
 					       "snps,reset-delays-us",
-- 
2.25.1



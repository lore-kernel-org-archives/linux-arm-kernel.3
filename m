Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09465105D98D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVPIQsgXNzDIVzZb7L4g65zcVReNq7T7sAr8ZW6erb4=; b=1vgpaQZEIzLDfa/11TW8maC6o5
	Z0Qi+bXCauhYQYZxBacjmSQ4ISKlTPrFI2lHXmGYGy3Ti1IAZgB0aSsURfxuTjsFczfbDuZiaLpS0
	KANRX+J4XlOAq6viNoPevoCSe2vlwyrS9Rwdg96V3jdQ4cQtfPaofdYpNudKp28YvQJExVg0wGczd
	RQ6xdLpK3FS3/5JKsccSniVLR0GPAc3dfAcX6R38/+F2xibL0mEs1Gk3fb58U2JNUEfpd8rTaWmL9
	WobB4QZLnlzSA9zM+7t3FdaO5mqMwcNXzBPS0CJ6Ve2BkDE5gilItAprnqmju8eRfFTfAIPCGOXJp
	c3BxcNMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPBt-00000008bbW-3l3b;
	Wed, 08 Apr 2026 09:27:17 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPBr-00000008bYf-0u9k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MVPIQsgXNzDIVzZb7L4g65zcVReNq7T7sAr8ZW6erb4=; b=lSwyiH4lcPtm2ZaH5eI5HlAO4j
	8x582wyp8D0+XiaTrgjbVdhKPS+I/aI+ellLhqKBMuvKPmvbc3c6hM1NhY24L6yar8Pt+dRR8zHl6
	DaP4FdBByBXZIeCuNvJrt42X/X7xnJ+WVslyhAPHWFn8F3KSJLoSY+pu8WsREw2koXVAVHpZSghyh
	ukm5CKPeWhfpMelT7osVZEuTeImtypXKdaQ4BYtJ/qnc/wR21WAFR9QqisQU20CUDd6dcjBb2liJ6
	TfLo3byg3vwDEkDR+A9P/TrHsxtOxfJmr3m7zqld2YjCnkL/eXG3uXvTg0jOGBaYV02YDgfxsbN3J
	d6R3eC9Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39662 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1wAPBN-0000000022o-13aq;
	Wed, 08 Apr 2026 10:26:45 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1wAPBM-0000000F7jo-1DIY;
	Wed, 08 Apr 2026 10:26:44 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH RFC net-next 01/10] net: stmmac: rename min_id to min_snpsver
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1wAPBM-0000000F7jo-1DIY@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:26:44 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_022715_253884_A69181BB 
X-CRM114-Status: GOOD (  12.96  )
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

min_id is the minimum Synopsys IP version that the hwif entry will
match. Name it min_snpsver so that it's clear which part of the
version ID it is related to.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 511b0fd5e834..3774af66db48 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -110,7 +110,7 @@ int stmmac_reset(struct stmmac_priv *priv)
 
 static const struct stmmac_hwif_entry {
 	enum dwmac_core_type core_type;
-	u32 min_id;
+	u32 min_snpsver;
 	u32 dev_id;
 	const struct stmmac_regs_off regs;
 	const void *desc;
@@ -129,7 +129,7 @@ static const struct stmmac_hwif_entry {
 	/* NOTE: New HW versions shall go to the end of this table */
 	{
 		.core_type = DWMAC_CORE_MAC100,
-		.min_id = 0,
+		.min_snpsver = 0,
 		.regs = {
 			.ptp_off = PTP_GMAC3_X_OFFSET,
 			.mmc_off = MMC_GMAC3_X_OFFSET,
@@ -146,7 +146,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = stmmac_dwmac1_quirks,
 	}, {
 		.core_type = DWMAC_CORE_GMAC,
-		.min_id = 0,
+		.min_snpsver = 0,
 		.regs = {
 			.ptp_off = PTP_GMAC3_X_OFFSET,
 			.mmc_off = MMC_GMAC3_X_OFFSET,
@@ -163,7 +163,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = stmmac_dwmac1_quirks,
 	}, {
 		.core_type = DWMAC_CORE_GMAC4,
-		.min_id = 0,
+		.min_snpsver = 0,
 		.regs = {
 			.ptp_off = PTP_GMAC4_OFFSET,
 			.mmc_off = MMC_GMAC4_OFFSET,
@@ -183,7 +183,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = stmmac_dwmac4_quirks,
 	}, {
 		.core_type = DWMAC_CORE_GMAC4,
-		.min_id = DWMAC_CORE_4_00,
+		.min_snpsver = DWMAC_CORE_4_00,
 		.regs = {
 			.ptp_off = PTP_GMAC4_OFFSET,
 			.mmc_off = MMC_GMAC4_OFFSET,
@@ -204,7 +204,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = NULL,
 	}, {
 		.core_type = DWMAC_CORE_GMAC4,
-		.min_id = DWMAC_CORE_4_10,
+		.min_snpsver = DWMAC_CORE_4_10,
 		.regs = {
 			.ptp_off = PTP_GMAC4_OFFSET,
 			.mmc_off = MMC_GMAC4_OFFSET,
@@ -225,7 +225,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = NULL,
 	}, {
 		.core_type = DWMAC_CORE_GMAC4,
-		.min_id = DWMAC_CORE_5_10,
+		.min_snpsver = DWMAC_CORE_5_10,
 		.regs = {
 			.ptp_off = PTP_GMAC4_OFFSET,
 			.mmc_off = MMC_GMAC4_OFFSET,
@@ -246,7 +246,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = NULL,
 	}, {
 		.core_type = DWMAC_CORE_XGMAC,
-		.min_id = DWXGMAC_CORE_2_10,
+		.min_snpsver = DWXGMAC_CORE_2_10,
 		.dev_id = DWXGMAC_ID,
 		.regs = {
 			.ptp_off = PTP_XGMAC_OFFSET,
@@ -268,7 +268,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = NULL,
 	}, {
 		.core_type = DWMAC_CORE_XGMAC,
-		.min_id = DWXLGMAC_CORE_2_00,
+		.min_snpsver = DWXLGMAC_CORE_2_00,
 		.dev_id = DWXLGMAC_ID,
 		.regs = {
 			.ptp_off = PTP_XGMAC_OFFSET,
@@ -302,7 +302,7 @@ stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 dev_id)
 		if (core_type != entry->core_type)
 			continue;
 		/* Use synopsys_id var because some setups can override this */
-		if (snpsver < entry->min_id)
+		if (snpsver < entry->min_snpsver)
 			continue;
 		if (core_type == DWMAC_CORE_XGMAC &&
 		    dev_id != entry->dev_id)
-- 
2.47.3



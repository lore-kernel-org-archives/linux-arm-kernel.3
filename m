Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C9ECCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 00:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thLpG7fs2ihD+ToFoNCiunRlF5bc6gkGMjFRZXn8QW8=; b=ANELTx56n2akv4+DiOgNwzVowG
	RstZhYy/umGUoehpZxbTfHg/jEXHewnrNn9qQank9XWDz1jqFzlwaUoLP4YL89yfgX20THRUX0ukJ
	RL3DJHcYCHpuG2kYaB1/Vg4mska+dhugqWKwOGPrga56DLV/QNZU+ky/5WLCz5W5KoQhYqqj6AOUp
	Si7pFFH7Yy0SZ8MeQP0iq1DRr0ivT1/Ke0sh0ivgaVBvySKCzII0COtty+sEt4Ha4l2pWDoSwmszA
	kySD5BXongMRMZetua5Rx2O3/SM+Xx1EMogySH+t4a6IdGPeKK6cfbKJmhwwL1pDfZw4xYas2ExTl
	2IiADwOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtfL-0000000GpQr-0ZF8;
	Wed, 29 Oct 2025 00:03:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtfD-0000000GpLD-2LcK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 00:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=thLpG7fs2ihD+ToFoNCiunRlF5bc6gkGMjFRZXn8QW8=; b=hwG5/lej+RLBb0WH/WtAVdrPlL
	+AG7J0+Ab6qAdIbf8nNos1pMlyZUTXRdm0CpJsZ7t1DSF3UWBv4SlbNDn/C3Zp2NJMdTjKqr1pOMm
	uB/zAb42K6Ytr9CPsfylGzqVE/jkA46yZ5qeilvCsokPAw837WnW5qzjKKdU4kc+GE1A7yZCsJ2XW
	N5nKM9bB2Bs9LfU3ou04TUShQYnsXcTfuasFgkw/Kaz9atcsgMN7s2L4Wg/s437EInJt3s7zJjmO2
	J6Tg03zlHYoQn213gpCUI0cKMjLJ8uMXVI8FNE6SslgboYXQa0Dt/XhsALk27bzhxZKoWMUlM54Bs
	Vg7gMKQQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56198 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vDtf7-000000003hx-2XQC;
	Wed, 29 Oct 2025 00:03:37 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vDtf6-0000000CCCL-1cQA;
	Wed, 29 Oct 2025 00:03:36 +0000
In-Reply-To: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
References: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH net-next v3 6/8] net: stmmac: provide function to lookup hwif
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vDtf6-0000000CCCL-1cQA@rmk-PC.armlinux.org.uk>
Date: Wed, 29 Oct 2025 00:03:36 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_170343_604602_4666DAF6 
X-CRM114-Status: GOOD (  13.37  )
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

Provide a function to lookup the hwif entry given the core type,
Synopsys version, and device ID (used for XGMAC cores).

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 40 +++++++++++++++-------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 26cc1bc758bf..892cef79c4d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -299,6 +299,30 @@ static const struct stmmac_hwif_entry {
 	},
 };
 
+static const struct stmmac_hwif_entry *
+stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 dev_id)
+{
+	const struct stmmac_hwif_entry *entry;
+	int i;
+
+	for (i = ARRAY_SIZE(stmmac_hw) - 1; i >= 0; i--) {
+		entry = &stmmac_hw[i];
+
+		if (core_type != entry->core_type)
+			continue;
+		/* Use synopsys_id var because some setups can override this */
+		if (snpsver < entry->min_id)
+			continue;
+		if (core_type == DWMAC_CORE_XGMAC &&
+		    (dev_id ^ entry->dev_id))
+			continue;
+
+		return entry;
+	}
+
+	return NULL;
+}
+
 int stmmac_hwif_init(struct stmmac_priv *priv)
 {
 	enum dwmac_core_type core_type = priv->plat->core_type;
@@ -306,7 +330,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 	struct stmmac_version version;
 	struct mac_device_info *mac;
 	bool needs_setup = true;
-	int i, ret;
+	int ret;
 
 	stmmac_get_version(priv, &version);
 
@@ -339,18 +363,10 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 	spin_lock_init(&mac->irq_ctrl_lock);
 
 	/* Fallback to generic HW */
-	for (i = ARRAY_SIZE(stmmac_hw) - 1; i >= 0; i--) {
-		entry = &stmmac_hw[i];
-
-		if (core_type != entry->core_type)
-			continue;
-		/* Use synopsys_id var because some setups can override this */
-		if (priv->synopsys_id < entry->min_id)
-			continue;
-		if (core_type == DWMAC_CORE_XGMAC &&
-		    (version.dev_id ^ entry->dev_id))
-			continue;
 
+	/* Use synopsys_id var because some setups can override this */
+	entry = stmmac_hwif_find(core_type, priv->synopsys_id, version.dev_id);
+	if (entry) {
 		/* Only use generic HW helpers if needed */
 		mac->desc = mac->desc ? : entry->desc;
 		mac->dma = mac->dma ? : entry->dma;
-- 
2.47.3



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B030FC9EF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZByVWOPK5ttZJFgRSm0Ifxd/gEF6TSQDdAxyvu8aiQ=; b=FUDuwXddvAYJ7oyeEWSf1Lgp/3
	mUnau/jLOGfSwixH0HwmEXWv2yZj1o1p3M737C19QH7nU94sU3etGjHdGUVVmNaveIfRy9au1WFJW
	PHe6wnfzqR8s5+8QeM2ctDaEbnvmtU5ytHbzf9wuKrji+KHTDD1DZ+W4SbAE8cBj3HVGsQUVW5qsd
	aWs3Pwy0cWlH9hBnmGCqgdFGm9Vws4VzDHCs6DKqJUdhzhEgxCUSAe0wMY5ZUfVDIaLBMnW9TiZuW
	yWhZH+xAeBqSTKJhcIRNqxdmDUijd7ipyJ0fNThxh8tshDT9WMnlIu340LgOgYfCIG5ipeZiQEhw4
	+7elU84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypHl-000000057HQ-1Egj;
	Sat, 07 Mar 2026 10:53:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypHj-000000057GR-1MXX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 10:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eZByVWOPK5ttZJFgRSm0Ifxd/gEF6TSQDdAxyvu8aiQ=; b=PAJGbZzB0YYtWulTCT7vwtolYD
	qGVLnWWhzgd+uf5R92VO5h/SSIC1q1wYcIw7Yy7zbYlwJZEZrXdNN3sulnyUJA78NqrOSKKT+wJxt
	S/6dA0MEqaLnDp0BcpmOpFcIfaZRr35dK51eZ1WZ8UnTt2Wy0PDhBrsxa8ojuEviAOF8B8IpydRGM
	nXww/9+GiZVg/aJKw5sCQeuUvIfHFJ6yv9+H57Jeax/9nNXEzTck6FppJ3+AfKW/4mb6pd6wUZ5qH
	7x0xzFEKFFDiDZFeph0SVzpZe1RzLGZqnjHcmrdwb5ztPpMZ5XcAJOuaiPw5cEgPeWe/aefvdDJqP
	HNBDKC9Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34482 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vypHd-00000000258-0hEc;
	Sat, 07 Mar 2026 10:53:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vypHc-0000000CSbl-1X6v;
	Sat, 07 Mar 2026 10:53:20 +0000
In-Reply-To: <aawDiK7DjcSXSs1X@shell.armlinux.org.uk>
References: <aawDiK7DjcSXSs1X@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/2] net: stmmac: ptp: remove redundant
 priv->pps[].available
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vypHc-0000000CSbl-1X6v@rmk-PC.armlinux.org.uk>
Date: Sat, 07 Mar 2026 10:53:20 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_025327_366721_F3F6CB80 
X-CRM114-Status: GOOD (  13.33  )
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

priv->pps[].available is set in stmmac_ptp_register() for all PPS
outputs reported by hardware up to STMMAC_PPS_MAX.

Since we now set priv->ptp_clock_ops.n_per_out to the number of PPS
outputs that both the hardware and driver can support to prevent
array overflow in stmmac_enable(), this makes priv->pps[].available
redundant. Remove this struct member.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c        | 2 --
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 2 --
 drivers/net/ethernet/stmicro/stmmac/stmmac.h        | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c    | 4 ----
 4 files changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index 1c431b918719..f1bb981cab7c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -525,8 +525,6 @@ int dwmac5_flex_pps_config(void __iomem *ioaddr, int index,
 	u32 val = readl(ioaddr + MAC_PPS_CONTROL);
 	u64 period;
 
-	if (!cfg->available)
-		return -EINVAL;
 	if (tnsec & TRGTBUSY0)
 		return -EBUSY;
 	if (!sub_second_inc || !systime_flags)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 915e7c2ab11f..efa76b147f9e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1162,8 +1162,6 @@ static int dwxgmac2_flex_pps_config(void __iomem *ioaddr, int index,
 	u32 val = readl(ioaddr + XGMAC_PPS_CONTROL);
 	u64 period;
 
-	if (!cfg->available)
-		return -EINVAL;
 	if (tnsec & XGMAC_TRGTBUSY0)
 		return -EBUSY;
 	if (!sub_second_inc || !systime_flags)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 1fe96cd24b4f..335e60439b42 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -181,7 +181,6 @@ struct stmmac_tc_entry {
 
 #define STMMAC_PPS_MAX		4
 struct stmmac_pps_cfg {
-	bool available;
 	struct timespec64 start;
 	struct timespec64 period;
 };
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 654d04f8c373..960249960004 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -336,7 +336,6 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 {
 	unsigned int pps_out_num = priv->dma_cap.pps_out_num;
 	unsigned int n_ext_ts;
-	int i;
 
 	if (pps_out_num > STMMAC_PPS_MAX) {
 		dev_warn(priv->device,
@@ -345,9 +344,6 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 		pps_out_num = STMMAC_PPS_MAX;
 	}
 
-	for (i = 0; i < pps_out_num; i++)
-		priv->pps[i].available = true;
-
 	/* Calculate the clock domain crossing (CDC) error if necessary */
 	priv->plat->cdc_error_adj = 0;
 	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
-- 
2.47.3



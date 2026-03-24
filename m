Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F69F54AAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6xJ9yI11IH59FTamt7w666fDdhb1//KWizsOFlXyj8=; b=RIBvH9JcBOD83cQvDSAzhlYoSE
	aChaLoJRTi86Vuh2b9DrIo/fKa5GlHovjHBjXLWRt30Y2ri61FYJxKKSmVJWWSlNzvdMqY/HUl4y8
	WaPnODy9gCLQ7WTz6bjsmBnxBqhbx+9xum67ciX+QIjQZlk3bb2SSmSAkZganedV8ad+cwedBHv5N
	hKB2miSEL4lKvjNDUKk47PCoIdNeFhlsIX0MvueHtLIxgmiJwNVws9w4oCwHJCdNeZeq78+mPUHuO
	Ri6rO09Zxudmu+wR/2eR2m2b6B20aECO14/nO77N5GYZc3MQb9t6cV2ULHG4huCeCi6zPPOhUuKA6
	vHb1fjJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51YX-00000001VKg-2msh;
	Tue, 24 Mar 2026 13:12:25 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51YU-00000001VEF-2av8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z6xJ9yI11IH59FTamt7w666fDdhb1//KWizsOFlXyj8=; b=bUBWfjeSJ6ql2P/Rwk1nvGovuk
	iOfOr6uBY5/gRDDwVencrE9g7yGvlk9Ib9mVB8vx8NK8tNsr2yRL4vz2o+Jz4reOL65rcxdqsxxsM
	q9lQBGXyIo3Ou3db0ahXn+AW4ieHueeh2tlcBlsDQ3AoGzlsPnE8TOiMRKOqRwHeppSQ8IYzTwpSK
	/JfI4sztRrljFmNe40evE8At9v4yYgbXTlv2jyNkWnRoSvt6H7WCgk1qGRxOir08fVRperY0PLeJm
	5Mi07B17Aj6Jm6aFdrh3IsUafyINFvbbwhx0B5HhKl70CyUChoWlWSc8Jb3FWj7kRsiCfHXIecu9Z
	Ev+DOX0A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43354 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51Y9-0000000023t-21JK;
	Tue, 24 Mar 2026 13:12:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51Y7-0000000DwVn-468D;
	Tue, 24 Mar 2026 13:12:00 +0000
In-Reply-To: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 06/15] net: stmmac: qcom-ethqos: move 1G vs 100M/10M
 RGMII settings
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w51Y7-0000000DwVn-468D@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:11:59 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_061222_661735_D2B022DB 
X-CRM114-Status: UNSURE (   9.54  )
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

Move RGMII_CONFIG_BYPASS_TX_ID_EN, RGMII_CONFIG_POS_NEG_DATA_SEL and
RGMII_CONFIG_PROG_SWAP. There are two states for these: one group for
1G, and the logical inversion for 100M and 10M. Move this out of the
switch into an if-else clause.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3540471ff272..87af44dcef5a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -404,14 +404,24 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
-	switch (speed) {
-	case SPEED_1000:
+	if (speed == SPEED_1000) {
 		rgmii_clrmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_setmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_setmask(ethqos, RGMII_CONFIG_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG);
+	} else {
+		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP,
+			      RGMII_IO_MACRO_CONFIG);
+	}
+
+	switch (speed) {
+	case SPEED_1000:
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      RGMII_IO_MACRO_CONFIG2);
 
@@ -443,12 +453,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_100:
-		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
-			      RGMII_IO_MACRO_CONFIG);
-		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
-			      RGMII_IO_MACRO_CONFIG);
-		rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP,
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
@@ -479,12 +483,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_10:
-		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
-			      RGMII_IO_MACRO_CONFIG);
-		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
-			      RGMII_IO_MACRO_CONFIG);
-		rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP,
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-- 
2.47.3



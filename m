Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107C4CF31AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I74Dh3fe1nd1qM9odpuS+mcbUWvWRMt3SuKencBCa0w=; b=croQqclmF602AQ6f1re6MMp71F
	tbzgKQ2CDLH9AYaosnk4g3BpcK7CcBq/wEjt/rH+OtKfFxV0AsqWSNnTf6h1mF6xrHzllPM5bcvdI
	ARYUyNz5FLZ3cqq2kKbVh9OVeRllIy/yABlsFe71iJjk3S6QE4dHqhp9vO79XsqChWCuR10c9W5Zd
	ih5VjoTnuj6PtwqA5Mu9RC6gwz9cOP90SVAVTVRIqV853Pxx403lTJke4fb9e9c3fa5IvNF8YFkWX
	Q4HQJlreP8tkB98hhEdIDjNVRzd8svaSYsWS84XMldCrQiFxToxYJfv4mOy0cKw28jWJROx0JH2Zt
	cT4epQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgSW-000000032ES-3EDv;
	Wed, 19 Nov 2025 11:34:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgST-000000032DI-48BM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I74Dh3fe1nd1qM9odpuS+mcbUWvWRMt3SuKencBCa0w=; b=aBGn3dnyRWKUQsVsq8cgzBeNAM
	LzQ8h0WnJwgNsE0QQX/qDmi4SAyfrBuxbrUe7TVqlUfgfUXmJiF9AOPWsCcmXg6E3h5XzteYaEHl2
	Fq7+bOKFMdyAq7L30xh0upBFF2IMDlMlWkW1VmgfsimXXnrN68k9/IQ6GI2QibcSBvFkhoyLBFUbR
	oxogmRslMjBAd68hFXg6lp5tAqVu6umIkimqqJVEhtrjl1icmQVojDSZpsNJUWaY8bT4KqcBXjH8T
	74AOvvlXLGpptVH2tmtI2PNFoVX99PuylvJb76anO+lmTcKuzfLmu1sgefAvzGa70d1iGOEo7EXqU
	6KomSkWw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44952 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLgSP-000000004b8-3ELF;
	Wed, 19 Nov 2025 11:34:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLgSO-0000000FMrF-3uB1;
	Wed, 19 Nov 2025 11:34:40 +0000
In-Reply-To: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 1/3] net: stmmac: qcom-ethqos: use u32 for rgmii
 read/write/update
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLgSO-0000000FMrF-3uB1@rmk-PC.armlinux.org.uk>
Date: Wed, 19 Nov 2025 11:34:40 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_033446_053283_46F5B632 
X-CRM114-Status: GOOD (  14.57  )
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

readl() returns a u32, and writel() takes a "u32" for the value. These
are used in rgmii_readl()() and rgmii_writel(), but the value and
return are "int". As these are 32-bit register values which are not
signed, use "u32".

These changes do not cause generated code changes.

Update rgmii_updatel() to use u32 for mask and val. Changing "mask"
to "u32" also does not cause generated code changes. However, changing
"val" causes the generated assembly to be re-ordered for aarch64.

Update the temporary variables used with the rgmii functions to use
u32.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1a616a71c36a..ae3cf163005b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -116,21 +116,21 @@ struct qcom_ethqos {
 	bool needs_sgmii_loopback;
 };
 
-static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
+static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
 {
 	return readl(ethqos->rgmii_base + offset);
 }
 
-static void rgmii_writel(struct qcom_ethqos *ethqos,
-			 int value, unsigned int offset)
+static void rgmii_writel(struct qcom_ethqos *ethqos, u32 value,
+			 unsigned int offset)
 {
 	writel(value, ethqos->rgmii_base + offset);
 }
 
-static void rgmii_updatel(struct qcom_ethqos *ethqos,
-			  int mask, int val, unsigned int offset)
+static void rgmii_updatel(struct qcom_ethqos *ethqos, u32 mask, u32 val,
+			  unsigned int offset)
 {
-	unsigned int temp;
+	u32 temp;
 
 	temp = rgmii_readl(ethqos, offset);
 	temp = (temp & ~(mask)) | val;
@@ -300,8 +300,8 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	unsigned int val;
 	int retry = 1000;
+	u32 val;
 
 	/* Set CDR_EN */
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_CDR_EN,
@@ -535,7 +535,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	volatile unsigned int dll_lock;
+	volatile u32 dll_lock;
 	unsigned int i, retry = 1000;
 
 	/* Reset to POR values and enable clk */
-- 
2.47.3



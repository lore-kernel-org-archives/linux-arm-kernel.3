Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE62D44167
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 15:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuMLDL06E5GqiUm1b26TVZCkb889kICn7kfexa2t/6Y=; b=QqOyL/Ui1Fgr3CDh3+RJnWUi2g
	oN/k0iE/W03wkytTrok3tPT7wR1GsAnHwKHnAm5pSG+aiN/vKh2dVwRmrhrDAtC67CM8usGR6YRj5
	aB1rugaHiL83exC4yV8iDp7tGgttc9U343HmgTH/DFxrPb6VFF0PikcCgf1M5UNzwweBmzEd4fsiS
	B/cJLl9EO8aPGxHV03A52cc/inCgCeI5hfIkNGuUzlykHvFe1XmX/YAOQTQDM5qTolR53cj6S4Xkj
	o6gg3zyK5u341+egpvBTkxfz6JKsrAnf9ajEZ8Ru8CvHB1DaD/K1SunfcgkxZHQJGFJdK0w9/TO+j
	bO7uJqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPoj-0000000Cmsf-2hql;
	Tue, 19 Nov 2024 15:07:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPj0-0000000ClLD-1eft
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 15:01:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 03B15A42B49;
	Tue, 19 Nov 2024 14:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C4EFC4CED2;
	Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732028464;
	bh=IosRVsOhXaWuKtna+S7TTj7J8IIDP2TBXfqtgenJkPY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rHmW8pyzYESo0w1Bh0OvU2MjWhCyLjMvDfeLfvzyQteYRnJSV7OwbQUwfrh0iiJDc
	 BnV8vzJEAabyNT7Q9lAzrjSMaZepbOzslZ3a8KcbwFs3s9IdjjAjZe4kADrV5qVUPj
	 cZ5EQurVs5mDOVHCL7kJJBEl021RRganQhLXMo0TsriMR7zZW21nhVvoXIBdIYJro4
	 meyaK5vxsErcdbE4RyA76Azg3ld6aNV9oHt472Dh8rBWlkbVDqE9PpFA9ChNhiZ/ih
	 JG+C2BmrgMHyV7llKWR2JsNl+7Py6nqhN7KHQaMk1zImgnDmOwqr45mrf83qB8SHHa
	 bImfoWAJ22amg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE76D44167;
	Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Tue, 19 Nov 2024 16:00:08 +0100
Subject: [PATCH v5 02/16] net: driver: stmmac: Extend CSR calc support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-upstream_s32cc_gmac-v5-2-7dcc90fcffef@oss.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732028461; l=2225;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=50kRIgWTZi5wCMka5I1DSABnnyKmmvDBzkE8UY/BAAc=;
 b=pMklRc3dp+NTaxkgKq7mLlrrefkInnF9GNFsD5SvbHHqshUcFJtH3UvED4kFZ69nTWOQHBVTX
 uKHpEoqqbP9BHh40hpxQr935ovrjlsPOE4NcZG8dF3iTKl9fX4IenzL
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_070106_572531_A2973185 
X-CRM114-Status: GOOD (  12.36  )
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Add support for CSR clock range up to 800 MHz.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 include/linux/stmmac.h                            | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 684489156dce..e364cf99d1ff 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -257,6 +257,8 @@ struct stmmac_safety_stats {
 #define CSR_F_150M	150000000
 #define CSR_F_250M	250000000
 #define CSR_F_300M	300000000
+#define CSR_F_500M	500000000
+#define CSR_F_800M	800000000
 
 #define	MAC_CSR_H_FRQ_MASK	0x20
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7bf275f127c9..85fa75fa6abe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -324,6 +324,10 @@ static void stmmac_clk_csr_set(struct stmmac_priv *priv)
 			priv->clk_csr = STMMAC_CSR_150_250M;
 		else if ((clk_rate >= CSR_F_250M) && (clk_rate <= CSR_F_300M))
 			priv->clk_csr = STMMAC_CSR_250_300M;
+		else if ((clk_rate >= CSR_F_300M) && (clk_rate < CSR_F_500M))
+			priv->clk_csr = STMMAC_CSR_300_500M;
+		else if ((clk_rate >= CSR_F_500M) && (clk_rate < CSR_F_800M))
+			priv->clk_csr = STMMAC_CSR_500_800M;
 	}
 
 	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 75cbfb576358..865d0fe26f98 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -34,6 +34,8 @@
 #define	STMMAC_CSR_35_60M	0x3	/* MDC = clk_scr_i/26 */
 #define	STMMAC_CSR_150_250M	0x4	/* MDC = clk_scr_i/102 */
 #define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_scr_i/124 */
+#define	STMMAC_CSR_300_500M	0x6	/* MDC = clk_scr_i/204 */
+#define	STMMAC_CSR_500_800M	0x7	/* MDC = clk_scr_i/324 */
 
 /* MTL algorithms identifiers */
 #define MTL_TX_ALGORITHM_WRR	0x0

-- 
2.47.0




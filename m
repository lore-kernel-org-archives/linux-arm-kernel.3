Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF675CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTBdThVFEpNHi2dU+mAd4gM1WT8C3kXv+HJ2zJ9hpyU=; b=gHLtb5BC4NTF7XgctRITP8JoKl
	JNrfGhUOxpVkNg80/TVJba3eLC6yA2yZLZVC83OIpfsEqOqUuvPrJiU5Vqng/kCh09GXkSOrX3G7C
	M1W/DcjBGOBzBjg9iNQUsOggrqSCX2EJ/jDLNosHK+HCGWrOCbRXsbA/SzjXyHLauOiO+njayDVMj
	qTzMZvtR58NXeiPp/ggNMph2f5XMNEnthd709J8NiuAWUhArCX9W8/aMVCfwaWoUJTz1/ukO+TZN7
	EoqYBPBcPpuzRI6vKfkRy+A62TR6NKuuXBYzT/01v8PrdCEr6QLiRBPd0SolLgZWM06fvI/ZVimFg
	o9MU6mJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTZ2-0000000EDVy-0vFt;
	Mon, 11 May 2026 16:33:04 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTYy-0000000EDUZ-3Y8B;
	Mon, 11 May 2026 16:33:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/Kz8WW1lEdyIEOOExm+aBBz2xRhfthrKn5ioKV3qlHcN1P2HSuhfjvQaOXZXbZHK4FferXuRSk/xKeqRm9qz+yHC9XVUWksdxPQC3bG3WWjELd+R4STg1jsMr0B3DDIaB4k3oQwriiEenPXsAxpNQAFTTYW7TMpbOXOTgLv1/RXapPezABphgjH/kL8rFuS0EKziQjYYabarvbuocvFctnyHZ/jqIP7a9qbmYtcy7RANm0k8OaDhXT7+m0Dj1SKy4gfgkSKgANpkxEgIQqgjkE5n+xVi2TfjZ8wyNdtHIASJKSEZWjB2Jo6m4x1svb2kVaYoBqcKhvG8NBqn1CE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTBdThVFEpNHi2dU+mAd4gM1WT8C3kXv+HJ2zJ9hpyU=;
 b=qqyDqk/dbB6Uawcy0tF/4KKJ5A8oYtMAlCPtZffKuC1Jph4kSN+3VTNrt34K/iKUFo0H1gu2K2NREYWu2aH0UeBbA0KQOrqZxE1dFfu82WYJZ+eWAqv8o6lkBZU+q1tQl5THh0MoNz2r7xCAK4sssbFHZKCCBH4Zz+rY8FLso/e4BxAi77+XWGxd6caELGN3r226k6UnDbXpOiHNYG5zS0uor+7zN+4eXFVCF68hrewBGFFiruyvbq8Y9w4c6NRxdXiRop2h+CA7PtzMrhWhwVhEGFAK6NgdcaxxbqMWoGKhEG5VGwWlOcEgrFh4r5PGis3qUOwnfC91B0tTGBBDmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTBdThVFEpNHi2dU+mAd4gM1WT8C3kXv+HJ2zJ9hpyU=;
 b=bU7jpOHqlth+ZMeKUGjpdlX2XGBFAKyQByXbjZDVizNSWryf8JRwhhBB0VxRlNL6EE9W+SJ1ULsykdSYDKAE/nrb/e0BfcOzqP1jUMRrBRcRZCbdjnkIot7vqrF3whbX+mbPwEGF0yQcWHjCxhFJeyRA2aJMRgwhICvi7u3osGY=
Received: from BL1PR13CA0010.namprd13.prod.outlook.com (2603:10b6:208:256::15)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 16:32:52 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::ad) by BL1PR13CA0010.outlook.office365.com
 (2603:10b6:208:256::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Mon, 11
 May 2026 16:32:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 16:32:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 11:32:27 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 11:32:24 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Nava kishore Manne
	<nava.kishore.manne@amd.com>, <stable@vger.kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 3/3] phy: zynqmp: keep SERDES scrambler and 8b/10b enabled for USB
Date: Mon, 11 May 2026 22:01:35 +0530
Message-ID: <20260511163135.2924642-4-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260511163135.2924642-1-radhey.shyam.pandey@amd.com>
References: <20260511163135.2924642-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|MN2PR12MB4334:EE_
X-MS-Office365-Filtering-Correlation-Id: 512d3fbb-8984-42a7-7e7e-08deaf7af2e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|22082099003|11063799003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: 4049EorZND+0+1JCmB5nO8Rq+nJD8DpDgBNUsAtGbPTe9YacBrGJczMH2upUvGJih8SBZNoyToaDEFFGGWAO/B5Cs8oxyqQbdkfF+zusd77BNVePhmH+bJhbg4eTjE4esf/8JfQRGKnly8hOmCfpx2TfG6qVM02JFQ5HKp3VrNyp4trcL/GtOYiRtfvSAGgcQZwxO7J/oIbobAoE/g07XjObsqyAKEcsD2PyKOq9XKy+syUQaRPXvejJIhOR54+kVbqhQemnCf68VNSTPdmzcCh/PM38TSDSMbbsDI1+oIGH5L3qOgP60uqoeaYJ4Lk9rj19zE+fjT414BaUiMYMaekFsGM+ggSkOHEF7siWScI95Fxx8j3cxSpEpe4GtE2SSzqsw+Ne4AUoo/kmKsTv9fKTN/dFkU9k0zPIrmu+ixe7axps5cVyPaAO53fsAAtU7V33t9N0ahd71nHCprTq0FVIQ0gHlYmM1t3Re+ZMEVuH5cpzXsDoVp8MNPUxcUOEyagpnKzy4KsC1rsjXVUtQ5bsLErCtlZ4vjFBnoTmxP9AHjQIwQ8X9LYHjzpZQwE5SKfRqJOZ4AeAW4eFzUOLNs95vNY0O+CIHCsZnsRhlH7kRVw6Ot9Z6IAKjUPX/kiSGvChivvfPGXVGk4mwRrk1l+hAf0TVGWUcTo/bTBzTpqPUbd+iup1P3vsVLJhEo7lbBoAO4RIka3thR+WWSCIwgJ5nqz+n3jXuC0rGlws1eQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(11063799003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /KlCj3WsU7w9EgVVg3K61imYNjRnMrOWh4OgnndL+6GOCtxSxTNbxzNtvwN3RaJRIIUlSKs2ddWLsFTdSmxsnKD1+jGlRRuPz7xR6d6bb082WBw9vAequWW6ez3Y4iRnOQOAiL1pp65CiOmgPIVBUmHv7Nge6JhWPPV75ITxiusXFGUkeGKuwiBwVTNiz1g/qSP1/a2BgoTaiHPPxvajn/lUXTppkKX93G4oruGdxILfHuMyw9EPATBC8a2IN0N7oWjK+82NQQQ9dscxja2upZSFu1XIEv6mVlUsjKKZkLh5iS6YUB5PaIQEsaH0XyvUkXEIXCO11M7bLTNK2UOHYNYHDYKkG/C5YfhkNVgzQHBzEeKmv8qMXQnLRvOdH1CixqUZ08rCFCDOm5nn/zVUu28PTqtyO8zZDJNv3KAfW4i5Xr+wQMlBNKILkkVeNApW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 16:32:52.8516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 512d3fbb-8984-42a7-7e7e-08deaf7af2e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_093300_890090_4D577E41 
X-CRM114-Status: GOOD (  12.60  )
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

From: Nava kishore Manne <nava.kishore.manne@amd.com>

USB Gen1 requires scrambling and 8b/10b encoding to be performed in the
physical layer. Do not bypass PHY-side scrambler or encoder/decoder for
USB operation, as mandated by the USB 3.x specification.

Scrambler and 8b/10b bypass remain restricted to SATA and SGMII
modes, where encoding is handled in the controller.

Fixes: 4a33bea00314 ("phy: zynqmp: Add PHY driver for the Xilinx ZynqMP Gigabit Transceiver")
Cc: stable@vger.kernel.org
Signed-off-by: Nava kishore Manne <nava.kishore.manne@amd.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/phy/xilinx/phy-zynqmp.c | 39 ++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
index 6c56c4df8523..087fe402e4e2 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -502,15 +502,30 @@ static void xpsgtr_lane_set_protocol(struct xpsgtr_phy *gtr_phy)
 	}
 }
 
-/* Bypass (de)scrambler and 8b/10b decoder and encoder. */
-static void xpsgtr_bypass_scrambler_8b10b(struct xpsgtr_phy *gtr_phy)
+/**
+ * xpsgtr_bypass_scrambler_8b10b - Configure scrambler/encoder behavior
+ * @gtr_phy: pointer to lane context
+ * @bypass: true to enable scrambler/encoder bypass (SATA/SGMII),
+ *          false to disable scrambler/encoder bypass (USB3)
+ *
+ * Uses RMW to preserve reserved and unrelated register fields.
+ */
+static void xpsgtr_bypass_scrambler_8b10b(struct xpsgtr_phy *gtr_phy,
+					  bool bypass)
 {
-	xpsgtr_clr_set_phy(gtr_phy, L0_TM_DIG_6,
-			   L0_TM_DIS_DESCRAMBLE_DECODER,
-			   L0_TM_DIS_DESCRAMBLE_DECODER);
-	xpsgtr_clr_set_phy(gtr_phy, L0_TX_DIG_61,
-			   L0_TM_DISABLE_SCRAMBLE_ENCODER,
-			   L0_TM_DISABLE_SCRAMBLE_ENCODER);
+	if (bypass) {
+		xpsgtr_clr_set_phy(gtr_phy, L0_TM_DIG_6,
+				   L0_TM_DIS_DESCRAMBLE_DECODER,
+				   L0_TM_DIS_DESCRAMBLE_DECODER);
+		xpsgtr_clr_set_phy(gtr_phy, L0_TX_DIG_61,
+				   L0_TM_DISABLE_SCRAMBLE_ENCODER,
+				   L0_TM_DISABLE_SCRAMBLE_ENCODER);
+	} else {
+		xpsgtr_clr_set_phy(gtr_phy, L0_TM_DIG_6,
+				   L0_TM_DIS_DESCRAMBLE_DECODER, 0);
+		xpsgtr_clr_set_phy(gtr_phy, L0_TX_DIG_61,
+				   L0_TM_DISABLE_SCRAMBLE_ENCODER, 0);
+	}
 }
 
 /* DP-specific initialization. */
@@ -531,7 +546,7 @@ static void xpsgtr_phy_init_sata(struct xpsgtr_phy *gtr_phy)
 {
 	struct xpsgtr_dev *gtr_dev = gtr_phy->dev;
 
-	xpsgtr_bypass_scrambler_8b10b(gtr_phy);
+	xpsgtr_bypass_scrambler_8b10b(gtr_phy, true);
 
 	writel(gtr_phy->lane, gtr_dev->siou + SATA_CONTROL_OFFSET);
 }
@@ -547,7 +562,7 @@ static void xpsgtr_phy_init_sgmii(struct xpsgtr_phy *gtr_phy)
 	xpsgtr_clr_set(gtr_dev, TX_PROT_BUS_WIDTH, mask, val);
 	xpsgtr_clr_set(gtr_dev, RX_PROT_BUS_WIDTH, mask, val);
 
-	xpsgtr_bypass_scrambler_8b10b(gtr_phy);
+	xpsgtr_bypass_scrambler_8b10b(gtr_phy, true);
 }
 
 /* Configure TX de-emphasis and margining for DP. */
@@ -707,6 +722,10 @@ static int xpsgtr_phy_init(struct phy *phy)
 	case ICM_PROTOCOL_SGMII:
 		xpsgtr_phy_init_sgmii(gtr_phy);
 		break;
+
+	case ICM_PROTOCOL_USB:
+		xpsgtr_bypass_scrambler_8b10b(gtr_phy, false);
+		break;
 	}
 
 out:
-- 
2.44.4



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD66CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgi+A/ZIfv7/qbiGk9UAv8jE3kQb4C8q8+nRTgbh1Q8=; b=U867auPJJ9LvzyY6ed2uJNI6YC
	mfn+27XiwpKsIYGGOkCwq7YF2TB9XqXkTT6llRKJhC0rPBVeeS0MaRv7qAKrMVltBcuxCAtHpX7MN
	ypJkXdIJiXCu4EOvvuJ0VydOhB/ZG2wmfLDBHaKqXGlsuF2nj8LpLcyvOY2vTuev6CO4KPybAZFD5
	mr0w+dWggzNOHsLusgwjZ8zgS3lSSAfqLQAKorqfb/HF6LwAlh0h65u8ZywE8ZZ4CNyWWcFnH/n/y
	+Oqu5sTRDtscay8p8nH/K3EzskZ2YFl3oDyIXo1ODko7sCzVsjB+VPgZEs0cO/crKbmtMpkv5m2Sy
	EDWk6RUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcvy-000000010hD-1ybD;
	Wed, 06 May 2026 14:09:06 +0000
Received: from mail-westusazon11012007.outbound.protection.outlook.com ([52.101.43.7] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcvx-000000010fz-0EpJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:09:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2OfVGcFqI1b39a6TB/jUzOy9XNlpPPBBSjEtGA+FWih/8Xdn8juiXdmagnhpSA8rRjQT4tkczm5kmt5qLeSgc5whTqYGULatJThaHxZ9bMTY/7OqJMdUmWuhQuArOgPKS33k8l/qr4TfVnIUoKCzYtgnU1yOUWaYZqyL7TiSlRC9v4/4KntuQJvf45ykz9wQ9DyCjepbjNuhy8dpzQqbCDl1dJg6ZI66oPP6brDpj2vrBDbUPK/PeNcxC3SXbLIPt9EQtSJ+7GHGf8cgLMIfhT0WAZ4lmKU6alCx6wTmM30/eywGFwL+htwSVSvl3zfK9+24jpI23HJFVsOU/MlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgi+A/ZIfv7/qbiGk9UAv8jE3kQb4C8q8+nRTgbh1Q8=;
 b=gNX7RtVZ+H7qJKpyZTHE5U1sKipIo9ZwTyPoRHJqq040w3Wc0dKibSlWq2iFqkyrHxFM9428odEoYBUyxlosXxn/XwwzbCvNz9lrG9RF/Bvre7QRYKRFePZrviFxRnhmBJ5S9zoVzkNQEP8n8fw0pMfCFhuWeDOYoYVMTNxbXEgsvBqvrgjdkGGc1Pj16xkpdN7nL18HHMZ9IV+68avtkn+zPpMchR6ahfAb4V/MXu/i0RCFpMYfNxOJ+ExMJohmhAguoQ/yVpuP+xlJHfKhqfq9BvrWjaZXZghCjvqAfh1ayY4Ly3IuMBSo2tOSqj1r6bB7nSebxBXN7cahtzP3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgi+A/ZIfv7/qbiGk9UAv8jE3kQb4C8q8+nRTgbh1Q8=;
 b=p1+BbqXOBn4IowyXfhK8nVD+LmaLgOhbL2+PBcJMBTOkAkBwxsAsIzRb2nRMFWfMFTetCbfLyGaZVCqEFIBF7mvlU3Wh2YJ/FClldYZUHOlmwjLdEnWfrGoyPyc3on2ezqbjdpHt8CfDkluScT+uJ6qztHRzw3AsABvWF9CxEM4=
Received: from CH2PR19CA0001.namprd19.prod.outlook.com (2603:10b6:610:4d::11)
 by DS7PR10MB5119.namprd10.prod.outlook.com (2603:10b6:5:297::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:08:53 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::2) by CH2PR19CA0001.outlook.office365.com
 (2603:10b6:610:4d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 14:08:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 14:08:51 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:08:45 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 6 May
 2026 09:08:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 09:08:45 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E8IWo1221395;
	Wed, 6 May 2026 09:08:39 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <josua@solid-run.com>,
	<w.egorov@phytec.de>, <matthias.schiffer@ew.tq-group.com>,
	<d.haller@phytec.de>, <francesco.dolcini@toradex.com>,
	<joao.goncalves@toradex.com>, <emanuele.ghidoli@toradex.com>,
	<ernest.vanhoecke@toradex.com>, <rogerq@kernel.org>, <eballetb@redhat.com>,
	<robertcnelson@gmail.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<luis.parga@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 03/13] arm64: dts: ti: k3-am642-sk: fix USB clocking for compliance
Date: Wed, 6 May 2026 19:39:35 +0530
Message-ID: <20260506141040.1368918-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260506141040.1368918-1-s-vadapalli@ti.com>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|DS7PR10MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: 962ef1d2-3032-4566-de43-08deab79000b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rBSVhIcb/dFuFgaLSHDkzY7Lia7eEUZ1ExeH8oc6kcqPUcK7cRQX5SuIK8ile5ocU74e0pMDKn2YufOOLqlJBSTHDpuAG1t8xNDAl1eNsr09aJCRSEr/d3h9DChEWGgiFnbhkJ51shJYSaRArUbveAi7C1qw8m30/VH08S61nV59YACuq6qLiIkjjl54eSGEVdK3fBfa0v3HRR0D6RZP69G7jCgwNe6pG6bnWIdKgYZ+k0dc9KSY8QbDHvaBAUtZDCvTrmdjPrCwUWelp8EVD2dT1G8K38TbNB3sSyhucxPS6lIw+y1a9ly/VUxn9WQDsB1Jfm+qV9Gs1NWL7ODJ1EnrOmztMO1Jw8qyCeY4LT460Fs9ofTY1J5WIQJBkGH8s0IRSwcyUlM1phEGXnq+oU5L8JfCogDyFyhZTSjBGUHBjlSp+owcF63pDk7khjNST4UOVshSnkBkB1Eiob9yes0T+RF+TJOqhoVMK+kkKj9v+7m8eOhkJxI8YmcaE2bhm/rXjqZKqWGFIzRJQzHxOPp58+c47e5w7wO3xNhh90edy3Mx64nqD/7kSPhn3DsIUdEO1WD/bqSRPrBsKQVBdF3C+z08DTETrwmhaYTkA9KJ5K8AXIqLT6GNEDRirfSjvhtJDsrFi1nJWKnPnpmGt+aDSFoa2tsugJsJooJ/cO0s+PQiCf5Lefq/HJKu5IFkM8/sUsYjO4DmOWoA9dGiZTlAS5f7BWR1keqiz6JOgm5bVqzSo4D/rBiP7Fa3dxLW5LOdssm13jBnYbl51Mt9VWBaZjuo31J8Hi13SdsME6M=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: X1Jcy+4Yu9DgV5TcOvBjAeVaNG5rr8jqL818qBIF1OgeBrZ7mxCqlu93zrDR1UCRdiGCL82TQBd0y3P68DWAGSQk318BMbTpM4A4TX75bXe2DEp7v90ppcrL+OiIfFPRDi+boywEZqJcvFFaUi50S1FGe4HyVc7+cDOJu7hFIk0ChuWkY04PiS6XqikI+c3TxSFLIF49O1SffLCSYcs3R4yIHPg1nwyrOpez6mXB1rxIHLUJXEf2hNGLLjHy1wUn+ip86XSLgBY7Xs6/9Rdg+DImLAdWVXTsSkLtvFzpbTRVaNtegTkTakgDLOzX5Y5Zhha7xmjVOmxbWsLYqOMYgNQJDn/zk4BZbKw4YzMnSFZ1QyZyfXw9jv6nciczUUNNNzqpreneprDSp25DbVXogslqUtCS371vQ1TfHypGEs5GDD+ZSgR2GMndBkLsXD82
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:08:51.2412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 962ef1d2-3032-4566-de43-08deab79000b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_070905_106328_B8F92B2B 
X-CRM114-Status: GOOD (  10.25  )
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

From: Luis Parga <luis.parga@ti.com>

According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
the USB 3.2 Specification, SSC should be enabled by default. This protects
against EMI violations. Hence, enable internal SSC for USB SuperSpeed.

Fixes: 4e8aa4e3559a ("arm64: dts: ti: k3-am642-sk: Enable USB Super-Speed HOST port")
Cc: <stable@vger.kernel.org>
Signed-off-by: Luis Parga <luis.parga@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1:
https://lore.kernel.org/r/20260505110631.1144200-4-s-vadapalli@ti.com/
No changes since v1.

 arch/arm64/boot/dts/ti/k3-am642-sk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index d28a38c87f32..9f63fea5e6a4 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -463,6 +463,11 @@ &serdes_refclk {
 
 &serdes_wiz0 {
 	bootph-all;
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
 };
 
 &serdes0 {
@@ -473,6 +478,7 @@ serdes0_usb_link: phy@0 {
 		cdns,num-lanes = <1>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz0 1>;
 	};
 };
-- 
2.51.1



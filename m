Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E10CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAS/7N4fJDHODS/vx7PoqgDWoC1FJbkAr4cnk1ytWzM=; b=06nNY1ag56EpckTOWR4ZytPbso
	gwJyCEbr4U2WFBQhZq757UyKNmNCIjnx4frfokiFwhINiIk3mvoKchaIQ6DoI0XEmE8zI0OcI3mIK
	tfiY1AWKKN2qAgPkD8pG/+tDblbi9BXe7Kb4Wnfx/xkyETApM/g5VKRWNIgY8zl4vLQkpgd1SdDe6
	JHbYsHMyv+5bKWDp3QfA42bxhnJShKnHEX5T1KLQPTd57lW+v+20sF+64qayxRkPH1omJxL1n4eHx
	QYq7/CbmuiBydTLX3QMonk+j67m8sdhkzqG5WfMUL3g+Z1hNokdGaCpA33PJAbHudwAG2Fl6Rx7zo
	VdJgGvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDax-0000000Fzz4-1ec1;
	Tue, 05 May 2026 11:05:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDav-0000000FzxC-3VCC
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 11:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rAS/7N4fJDHODS/vx7PoqgDWoC1FJbkAr4cnk1ytWzM=; b=AUPvQrC3ScyGSW1CU371grxqC9
	3ZHE+ND/eFKMcjWczgm9W3NTMump50xy2lyfG0U41wkhMVeqDSITtjDWyxFLVfSpSPlRP+yonkogn
	5zqchY4NBrKZZtWWglBWaZcr6SL25x/J1Yqrq1nYl/qNyJtJ/I5rDaTQCtiheheB8s6hEdlc2wqyV
	VBp4uTChex9QH7xRo30eVjEcgbvJ8h9cNu7DANo+bAjLUWwlP+O2Ma0xWTx/RrpepWq4tGb2gxRUE
	nXBxg20zsI3GDaTc568jANAS10mkTlX63M/lOFmmOpvOfg99cAc9XmTKpVbMjS1JKIEoQxUEoaL8Z
	b3G8l1WQ==;
Received: from mail-eastusazon11011040.outbound.protection.outlook.com ([52.101.52.40] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDas-0000000DJ4S-2n8k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:05:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDNRKZvlRJy+oYbm+c0J6Mqy/QCUjV8Xnxm79hrbIrxtaXhzhyeRrSQUQhAACYX0Bf8kawEVrpPZqkAz5tqzkVU72zTOuYIBdIENBXu9QN6TxfmsZMGm89zp96f7JUWmscic6jlUgN4j/iLv2KfQAGByQ0xDGJ3E41OIPcpKsNl6x5ZFndX8ELOKx99J8CB4tg/6YfzqJHPJESV6rn+FcbTu8UbFMwSuxlJf+rqlgLuDkxgxUb0VZU5IfFjSUucCAJVlxgiyX2HzCcl+L/Js6mWsQphyPKc0gQbJ0iIfAQZjbk/MtoX7oBVRCOrqhQKZS97R2y8GzWh96eRGqxuXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAS/7N4fJDHODS/vx7PoqgDWoC1FJbkAr4cnk1ytWzM=;
 b=L4EqaL6waeMuhkLp8XUciFa928uD0nKlnLIzmTrJtLSidhNIkdHiieR3x7ymOYqWj94dbXOZidQTgJpDV6lqM7v2cP0pZGnbeQcoUP5M+XY0oj/feW4DOZa7v96E0LtvZVmPVaFbDvSBLw/6r2Ck4tYNgI/2IYSNH71gDHKpnWv+cJZkr9DDFlZpxE8OMHcmnDI/7ZJAu2VjUH/a7HOAgylKRz6I81/vw5D9XJdqXud0VjILtor2qD7gJBxdUxT6V+48/J9Eowmb8QnDHkWIcm/obite8YDCjsVJQVlmzqKC29V+pta96T+O5Hkf5BRjCPJUlsKsXB3Ln/unVRqTVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAS/7N4fJDHODS/vx7PoqgDWoC1FJbkAr4cnk1ytWzM=;
 b=FmOBOmaQrqDjnm8cDcnxmhbEZbyTo6ni1L1/V3LfymCnrK1ai9CBvMMLS5TEvjJajECVphMqDcfCiCLzvrotsJFKn6eycP9XooRMsq2ZHuCqrjQB/zXgNedC8PqC/vS3xtseyt6NCvDAMquNAWl7Tu4axoAHy4uviL7GnIBshdE=
Received: from SJ0PR03CA0084.namprd03.prod.outlook.com (2603:10b6:a03:331::29)
 by MW5PR10MB5808.namprd10.prod.outlook.com (2603:10b6:303:19b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 11:05:33 +0000
Received: from CO1PEPF00012E62.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::4e) by SJ0PR03CA0084.outlook.office365.com
 (2603:10b6:a03:331::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 11:05:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E62.mail.protection.outlook.com (10.167.249.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:05:32 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:05:31 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:05:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:05:31 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645B49hA2831834;
	Tue, 5 May 2026 06:05:25 -0500
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
Subject: [PATCH 11/13] arm64: dts: ti: k3-j721e-sk: fix USB clocking for compliance
Date: Tue, 5 May 2026 16:36:12 +0530
Message-ID: <20260505110631.1144200-12-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260505110631.1144200-1-s-vadapalli@ti.com>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E62:EE_|MW5PR10MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: efe40486-d95b-4d32-e932-08deaa9639d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|7416014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: nIMBSsaulneiP+zpq3m/w3m0n+zP8dwqTahiBwoE3Dq2xw9SqKfTrf5joiBt73oHnJcw1ONb2Xa2K/oEgvNMmEWlD27IasNlb5Rhxns7Q3XINe2LooDridEhrbq1Y9GCsXlKXcpeLQUuvhH617NW9t13geLSw+tpjoPNOLVy4lAL7ieuBmsCZ+xQ7Um/3HHeNqmIytTgrDwdLepIjDNlxTwLokISxoryNG0pzzDXcRI+ZXC8PqmzDMcMZ0nbDKM6lQ+JKDRxdIkWiFmfk22KrslSLblzq2MBkRgl/K1vlCXEfwuqR+Piyjv130520vheMs/q0sAOfL42t6859L0LMC+6tInF78Foj1IatYsDkVmxkPxJ70OVpRlQSgNvLyBfcwa8w4qifLHLKYJUb0765W6qic/0svoQ04GcELBY6s6C+gM+V/a0+rE5vvZRwCBQioFRDhDbpusVyQ2c4R2iiTfRiktnKvkn92PQsf88WbZ34agTHAmVvUt0WuitS/efkCCkynTaosklBO4HlvCVkN1ajoFmvi5Ds+fhqBlR04wMIILk5jOwcrVQARA6lhWVdA9hVn0dnVYFYI1jHcN8ZOYBMja70FvE6fNYsDwGbT+4foTdvAAwlLHDINYNCHEF179LcV0701xhGPxeO07DunmHCE8sPIyP3c21YNS6dNswa3y5pqaViZqXwqBw+zRoscDwmlPPbiR49a4C3gV3qLiM3LSbBhnIB2NLgUnpF5DyycSQ1YIGzdnoSlCNFIA9qXegTVcXex1yIqz5/+0FYg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(7416014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kgrPZslZoQQbFdBKyF+6yza5zT2UvDd6VvA3gzeT+W9Ym64Pefjp+bycZVee4RXWG34A0fOfDymi5mzwqLJJ+1vbhpAfqYShwqE9Hx0rorqQ4oSkl0IVvbcd5qr4B0XndB5viiD4sIIAdyj+b/K239RoE5d2FYAObkAFZqlU263gL8++8gbOqR+kFA5d3szUcxkqR7quPLP3f1P8ZrS458cmLzjO0YikhDIcbUmyDF0KZ+LueHnyHrpaa3GTADtCsibzgkRvaAEjSWzjfzpQEMlNYCrey3/3pi6gEzBs5xFU4HbgdcNyoQgWf0sLVFNLgWjvFu0NbZha+piS9phvVBmp9wzgiIHvNLa8SZz04oK0rssY0sVwoPlVbw+Tsv3Nu+0HGy/A2A0I4frgUC96zN8m9GAJ7We5Rfz0d+3Wk1p+TPu+sCptlxYZLOUxcBt4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:05:32.4311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efe40486-d95b-4d32-e932-08deaa9639d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E62.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5808
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_120538_915043_D2D45440 
X-CRM114-Status: GOOD (  10.16  )
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

According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
the USB 3.2 Specification, SSC should be enabled by default. This protects
against EMI violations. Hence, enable internal SSC for USB SuperSpeed.

Fixes: 1bfda92a3a36 ("arm64: dts: ti: Add support for J721E SK")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index 689ba2ff81f7..79927a34edff 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -960,6 +960,11 @@ &serdes_ln_ctrl {
 &serdes_wiz3 {
 	typec-dir-gpios = <&main_gpio1 3 GPIO_ACTIVE_HIGH>;
 	typec-dir-debounce-ms = <700>;	/* TUSB321, tCCB_DEFAULT 133 ms */
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
 };
 
 &serdes3 {
@@ -968,6 +973,7 @@ serdes3_usb_link: phy@0 {
 		cdns,num-lanes = <2>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz3 1>, <&serdes_wiz3 2>;
 		bootph-all;
 	};
@@ -1006,12 +1012,21 @@ &usb0 {
 	bootph-all;
 };
 
+&serdes_wiz2 {
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
+};
+
 &serdes2 {
 	serdes2_usb_link: phy@1 {
 		reg = <1>;
 		cdns,num-lanes = <1>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz2 2>;
 	};
 };
-- 
2.51.1



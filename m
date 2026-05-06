Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BE5CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7q5FfcBquAbpn0Skn6M2dz1guTCo+KACRS40hrls7Mk=; b=N8U//8vd5sp/Uv8wTbpCSL1sey
	WH/jdcNgk9GNMXdM8X+7VUNv4n1KZiDWbLyCSpuPTjDuPWOI5vo2/2NNbFGttGGyuYyE0s9mukeg/
	bqD8lZqmJPNCLRKIUAX7KNxdI6Naw3uVgySBMX34lAglbEE5u+kKGHP4tGzSay4QCqS3kwIcy2sCd
	6h5fuZ+QerhWAuFz+ayRld/HaTZjsYMYKwCM8lMfjI1z4afMAMbzvyYlUJPk6Bm0HTtjQyM4Fug/D
	7wNv8NupqDSKzszBubxrHJycaH46WFeElOPheNu8GGRuUETDA2vvRYLz5YqHSTEr3Bh9lXnGfxSMV
	CKMTZLUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcwp-000000011OC-3M4X;
	Wed, 06 May 2026 14:09:59 +0000
Received: from mail-westusazon11010042.outbound.protection.outlook.com ([52.101.85.42] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcwl-000000011IN-41Y8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:09:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f85NTaNjT1x1EHdDxm/Kcq8YF9/b/db4emgfj8K3wk/W4roGSiOSOFXT1RnKr8DD79qImMpkAupg7Y0Nn0maoADkIqTRtGMLrm9k2wmHMjUsXlHsWl0jKSHiFD3fwEDi/eyy6UUPMumJ6eXNP+ScQPOtBU1Th4oYr0r6hM+fYS8586hzaX00lnvT0AOfV1riw0Fi8bjGXAZmedZ4kUYh8EjZXTtWpmBesJxQ0bXhhFx5PyLSlyDVVFRDikRtPvciR3/HYNNP6UEHPhuOUXcjbmzIE7LyNs0b25n6OlwJuCULOKXwdSY1eYM5XehKGfMbjXVzYcBoFiPkZM9+UbcHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7q5FfcBquAbpn0Skn6M2dz1guTCo+KACRS40hrls7Mk=;
 b=iqNVEbCIC9xWMC4coMisJpxf6rVbxJwbUJtB/lqCcB3ijsR5tbp5QI40KZEeNWhw2OTu0S0m67+2S+8efuyHpGuFMMymTJcYtb24/khf2DE582Pynu78f5MNwy0KMpXZqPuDsXlCaCz+2ytmjqBA2aCa2EURAC8e7D16/BVUXhoJSZBHHFRf2U2hMB6ScevIrCwPO3E1CTlYas45zjxWB0DJo/Uv/INZt6AaYqadldt1Ja2VW1Hdj+s35CxPCgxXb14/yrIXpi5aKRiVhalf46PuzmCICHXaxhRPq2FuiGFXXkoK5NuONhKlt2d6O//MaoVakybHI7DPjehmFeG/3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7q5FfcBquAbpn0Skn6M2dz1guTCo+KACRS40hrls7Mk=;
 b=Ommu7FV2RSmZGbbWmaGCVY6xJ7hwW0SrF/tzqzKR+kkQTLFPKYyC5G/SM9350ayStPGItUbSxyHXMOQ4ZpoSmkoqDrZY6WgbJmI+y3AdsyXYUdOb0/i8RtfJO+3nTVCSDz9nDr1m1D4evUsEtbqwupgvbFDom+fQjkP2wHsQ1Mo=
Received: from MN2PR06CA0004.namprd06.prod.outlook.com (2603:10b6:208:23d::9)
 by CO6PR10MB5634.namprd10.prod.outlook.com (2603:10b6:303:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:09:48 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::9c) by MN2PR06CA0004.outlook.office365.com
 (2603:10b6:208:23d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Wed,
 6 May 2026 14:09:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 14:09:48 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:09:46 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:09:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 09:09:46 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E8IWx1221395;
	Wed, 6 May 2026 09:09:39 -0500
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
Subject: [PATCH v2 12/13] arm64: dts: ti: k3-j722s-evm: fix USB clocking for compliance
Date: Wed, 6 May 2026 19:39:44 +0530
Message-ID: <20260506141040.1368918-13-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260506141040.1368918-1-s-vadapalli@ti.com>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|CO6PR10MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b09fc91-7899-4a30-5d4a-08deab792241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3/MlHogOa3rb+k8hXg5kvBQ2vGsMuB6BCYm/Aoo9rCRToneKkC4XOuYUCm57fg0u+9mUCexyFloYL1+P+FXyuA3mXR6T4bAYVJzRgd8BOFqr1OLJ3dp+qhhXk3efhXuFK3pLqChBDROIgKjjLmI9kBqRHFR2Pdk1UIi7v2Z/aH2shlxDogX9iK2gJhjLLWwcGPUZd5RiljpyC5doD2MRTvzeBkLm6eon+oQk9Wa7nsOKcOZjjIUR+z35dUO4bSfdlNwsapIC5mikc8YDI/5+mL/II6R71pgCaU6kVjaJcknNlJIARZ6ypvliI7cW3kcQ7by0g64Em6yGeWkFnBvHsLcmqpmkdWnBNHj3YQwcxhwh+J6XY4gA4EZFV6fScWeBWcfkhVKkeyvRWBHDwi2O2U+VOXja2jrzd+mbTs99UCaf61119BRWT4B+ENmw8PsKUCoUwjFlS3wtoGjkz+4SXJSIBHSAUzDtOYYwDFAycSRXiOeU8bU13QfNhdX0AuOf5dPcXV28usTfyYjf+/mX8aY5j8+VRFS7BCko8hHiJwvj0VLf23af6ztm7xqeLfTtwn85+W+lMu+ZvIBqY87mOOSwEDftmC9J2kQ0CSvKr0Gj9YkBbIkI9rKRQmF3O0a2WBNBliUPP0xeH3rjB5pjPDhVUOo4Ki94m5QLNqJA0lz/FjTAZaauXpQnu1y7w7U4K78LDWwmnPq9jTDTa6IfafLsoaawM41nnQjSce/iEm4eqKZmbW96fsRvSYniLdVxHORSYmn4H+pXZ5+/NWh6MZ+Z+Xnfv/105J08w9goX48=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wLgA169g6K7aM2+saa9AwgwH+A1wJol0h/K5/UMIYv/1rYitemiu+1LtqMK6mb0RV+IJX5/ZsphqpiZyJfcU12IqGV16oe/hpUY1c5NmDtzAm3PM9FUcBix9gIf9JHmtpGhpzgdOZ193hI6Vl0yzTFlSrM1CRcZjyVM7QPGUDHcDAzfgilKUDK66N++SELgv1jBLRKWxGtUbY8tJuyM5T1IGnGlm8JSN7b1u2t75QNB8FJNTsQ/5wId1krZ4+yWDlMVfzRXoR8K4o7HJrp2ufmJflOKja8g5YJygQR2FHyddNH679lO98erXIxHpR1hQiazNaIoTdFR9YOXcDym0XQKFqQp6mH0tsWyL4pF/UnWMMMn8iThlLmsbAUAOdKmOjLn2OloW2JYrYwox1t5rN3SwC3tIackMPQRThQCMPbc3dYQ9DVdzCnzigJWenowx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:09:48.6141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b09fc91-7899-4a30-5d4a-08deab792241
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5634
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_070956_005168_B7540D4B 
X-CRM114-Status: GOOD (  10.71  )
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

Fixes: 485705df5d5f ("arm64: dts: ti: k3-j722s: Enable PCIe and USB support on J722S-EVM")
Cc: <stable@vger.kernel.org>
Signed-off-by: Luis Parga <luis.parga@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1:
https://lore.kernel.org/r/20260505110631.1144200-13-s-vadapalli@ti.com/
Changes since v1:
- Reordered properties in serdes_wiz0 node to place status at the end.

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index e66330c71593..06b83e94da67 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -745,6 +745,11 @@ &serdes_ln_ctrl {
 };
 
 &serdes_wiz0 {
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
 	status = "okay";
 };
 
@@ -754,6 +759,7 @@ serdes0_usb_link: phy@0 {
 		cdns,num-lanes = <1>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz0 1>;
 	};
 };
-- 
2.51.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F78FCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bru7QyETpYteO61QzFQf6j79fnz66cXKOZVtfyD5B04=; b=vaiCBbjPeqgCG1zgKwWBjrHTwE
	SnQYje2zm+7DFylr5KUl1j5mlK4egrwvEQz0UQq1GmgvUdSgaD4liVL9EwIwKVUnG31+2P9e7CbAi
	Ytcc/4jR9EKuWaohiiY+4ekNanq28tiQQEpFPbOfg7AY91rz/ZuTDV9wbplT0AMRU3ucWRx2uIsI0
	gB3xqwiEMdA5dJjxwCPWTd5hIfAzft9gNgPyZsgr9qlrwToHNqg5jwwiz2xAVUYGfZW4voHg+3UPd
	KH+sg6hqP3PIixT/M3lYARKZhPtcxVomW95oWMHWolySaBjWDmMST+TYC3CIkntp+HK/rn+yr6Y+6
	AQ2qH7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcwm-000000011Kr-2crZ;
	Wed, 06 May 2026 14:09:56 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcwl-000000011IS-2JvK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:09:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1kbDGONeBpjv1M0SIKe0tFLgL/X9TU01Vlra2vBTAFjk3XP5cRF40rSPxShcrSmlvfU5t7PoQcBATjJAJ6/aHGf3ffIcArG44gsN1c02mIir+fZ12w3tXJuxIVByk2yw4QRy5nSsd/e09LmuSlLUxj9+wDWkOamq9nH6RQTcYj4VSXCX+5t504cNiR349dzFdR4n6urWtXsiZk8kE6QvgtRSYhS8nRKi0oHWGNTCBLj08eS855vnOOrPSXKhSzyXkLtDX5UxUbK+eAG3FO6xfjixLim4KVzKG+vv46GWVqc+nTEBW7gEGEFjj0scyxbugZjZFZ+aDIazh+oMWVtiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bru7QyETpYteO61QzFQf6j79fnz66cXKOZVtfyD5B04=;
 b=HqkGGcR3Z+rVb250MUFaHJPvAG9QdTfEDmrxSm0ehUa4d48UWN1Q9eGNzkknMxBDxNt9+udzH+HxB/ilXnHsDtTI8nTEjy5E2H5e7sOrugcbU+FRs4tYhG05jV8RpXshSFw21Fr4mqp29fMJ8SAmCQmNKtbeUjSsbeAteqzJ5TTrYVwVRdu0y9cSmTzzEpJ+I23WM2Ads+A1Rlb1DQIdvmyEChdGkOBoZeJh6ZwjitR/aABF0ZOp9006K/qEvG1+jXJ4JyCGDr7vJwhD2VN5ADlBp2ZUkwNGMqKDVz7BckkgpGzf9OV/JA/xm+qEWcTTUpYWLjQ8QRXl4BRwAwBMIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bru7QyETpYteO61QzFQf6j79fnz66cXKOZVtfyD5B04=;
 b=RFWi0doaJI1gze+rRslEbH6vjXLvKZAU2nsIliXCMQIeGgBOllQjQRfYgvE77OcleqAe+y2j5x5S8EkesrcyT/7AT7/ePFKNzzHaNxVLjx7sBCJd6ir7ptG4JqH1YiNuOG+yR/MAmFYLst90x91dBAXzYICbjmFic1IbFTC+NeA=
Received: from CH0PR03CA0445.namprd03.prod.outlook.com (2603:10b6:610:10e::31)
 by CH3PR10MB7120.namprd10.prod.outlook.com (2603:10b6:610:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:09:51 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::5f) by CH0PR03CA0445.outlook.office365.com
 (2603:10b6:610:10e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 14:09:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 14:09:50 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:09:39 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 6 May
 2026 09:09:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 6 May 2026 09:09:39 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E8IWw1221395;
	Wed, 6 May 2026 09:09:33 -0500
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
Subject: [PATCH v2 11/13] arm64: dts: ti: k3-j721e-sk: fix USB clocking for compliance
Date: Wed, 6 May 2026 19:39:43 +0530
Message-ID: <20260506141040.1368918-12-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260506141040.1368918-1-s-vadapalli@ti.com>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|CH3PR10MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ede316-3c6c-4ec4-689f-08deab79233a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700016|376014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3y/GvZEiPYciJNtY0Pg/70MCt4wEYyERb77IeFYb+HRp0VFiwoCEmV10rUk4Dsbdm97QlauTrnvnv74OqncCojkqMKWsV5Ur75QutYjvYdM/4bJB2xN15ZqUB6t4Ul33fsPSJDEy3XgzA9Kg09gTApykx4Y2ake+jvkQkFW4D3C2H8+3UMX5geA0IuLL64/PJl3tJJJHXHHLIopphDFYRzrsvfkjTCx9Tzrr913VchHP3LPMDVEuy069Tqnbzs1/WOeoguhDlKF/2hcIfxeiwkEP341fpRHnUP4xc/c6+xXbBoAP8kPgUTUZk+MC4tISxpoXaDAbsPnraVmiWWcoFR5EDCFbxj2NUU3emkQPL6aotEF4h0fRFY7htRtl5iM/jz4zQEcQcbF+qXuWS9Hr5+OkxHlVEtV243FYKRX0VU2VRO/TGTvAQcdEQGn6ZyFQh67FQXlsIUbY5B6MFKt869sSu58FFJxi/wKhQ7V6TJd3QOhTSWZArstq2yqqqNFgRkYJfvxyS3enEe71bNubFzhyNH0HeEoEViH9PRSiAtyr8u7bNjdCJFzvoBpycB9Xy3iaXpPcjMQAe1t+7WUW71rqz6q9RJTpGRjEktMeircC9ZBBHg+oltdipfdew0LQTRzichQfrpRelFBGtneQYqYOTOCHD7zIVd7n7yJGm+/WHFufKmX28jo145goaIwHUnidpQLoHyPdHof5QENz1P+rYWEbMSwrYXL+8lACcAFCD1vN0RgLVjsjFlzYT9TqSD0hEe9xQlJVh9AkaUEmTKoZ/HXhrmfw3VZrUSWTgiY=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700016)(376014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: m1tKJZ00XVNB/KkcEMGv7TCCcgUoKo0yKCm8Slf1UPUH5Sbff5zUk8Zi4BPJ1Byxm+Dzm9svaZb0I5WJewqUcnh+mANW8aYd/mvEAWOsjkUvLjax7LmLXye1JXN3dEIlbVlZJ59WmVnXNtJp6qTO8Uz2zqa6Jh66FmpwKhIYP5+kC69r3bNkcF1clWTJkVJBq+tuZnuLmfNBwZNAXmYpafrUlN7UdsC5amOLJXBANY8YGgE9VtyizBtl4Y6ejGYaSHPsI9FInCm+mG96OXuzzlzFyTLaFVRS0VXPjW6dEvFZgdItnrwmFQ96W40WCvGvnNQEFSOOx01zjKqQA7sFO//pvUlSYXkszfBptT6Ik6ON/Bl1ohf9+wRUJJDaa4Lwj904krmZh/KzIp/i3Z7qgvdIbYyN5bk0bdr5VVptcjTy1nOaevpy7UVJ51AJEHC6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:09:50.2556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ede316-3c6c-4ec4-689f-08deab79233a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_070955_599167_6C30938A 
X-CRM114-Status: GOOD (  10.48  )
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

v1:
https://lore.kernel.org/r/20260505110631.1144200-12-s-vadapalli@ti.com/
No changes since v1.

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



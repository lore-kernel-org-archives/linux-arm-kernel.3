Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14361CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWozuSNoBYNGqYNb7nuN60SO2/wcA30byhgF1MhZWIE=; b=b9OdC019rVPtIadflQhZATnpwj
	Xx820B6Gw9ApiM6CqBxbnLAXBmqpiJd81KEtbAjKvg81Pu+a7kMgWm12+vQDclCjbmHFfVmzgU1kn
	HMBD+Rg6ys1QhdgumAkJSGx1ZKLdwGoBe/jU3etvFfvUNdGfAX1ZNehCKFwzGgdSCoNg2Nt4p4xUV
	VAo+d0FILHzbihLb6LlUMbFbq13kKI7DsCxC4elan4An2zkpMRponTbgv1XyY5iTbsHVFyiNlE6tM
	qK0y+BFXm2FrcMqKFSLFSteGFgC4OPRDa3FgJR8MO5IcZ5/A42SrvRAn/zt2RPySM4/fu+G17Q7XS
	F4oeu8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcwI-000000010xP-0Iq6;
	Wed, 06 May 2026 14:09:26 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcwH-000000010vh-1Ye4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:09:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L66W2xGDznf7N17IB0FrcPe4x4GXmnTubvOpeTQXA7ddAyKnSQankF2M3Z0crMvY1gfRVoPSos+rKd0odAQv9dGTRCrSPKXgFwi9F5DM83zOGgela1FuyXs32Th619Tk97RXeKDF7fXMChyGtCUi5e4XH7wW5gBn+cwdA1oCMjNQ0t5VdP+Tg5+bsBazCFF9icuTxk0AqvzUwix3td8R3tuESGHaTWwE8YFNgqFdKryBMByGEZIxYexjBD0SLz0T0h3+jb2caczbXHie0+iDXjeTQL6B2xxAqR25Mqp6PdhXmzu4uoMcpaAi6JG4HqA7uI8ab4xtIC3Z0EywVpUtjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWozuSNoBYNGqYNb7nuN60SO2/wcA30byhgF1MhZWIE=;
 b=igvwLmAYEOa+/CrSTJJ41GK+Y87rrVQfF6CCAihyFUKRogG5e0cyKfIeyNpvi40MvXayFLobHU8cpHL1ySxqnFq05S5njR803g8fACLJbrEf1+7+yyIa0C2yLDzqolWYmDRxE3/q97Qug9A75mPo4RiIoGjHUcPHZAoA7TasJWgRGdBmIfMO8fw6lANUmA1/wEG0TbCqudes89fjqNIdhaEtUj+dkMI56RIhHi7VEu9uqZ0bMMSKomP6xY/er+cGzQyEDQPzmnSYoqMfnrtPaCF+qE6gi+1JRAtYp6gKg9JaMBPU7mJhZy8MPxQHirVzm/rEPBdKXKP7FbJ2/Wj0aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWozuSNoBYNGqYNb7nuN60SO2/wcA30byhgF1MhZWIE=;
 b=RsLvsWcxCPysQpCd371MSIQIUknK5dk6VjBtUYOehfUiLNlZ3LsCzLMrcVBBE9LBkSgLtrA9IRWR/+sBeGzrkn+b/UjUSCHZoSwwj+5376DM0BBU9lhvSBptautr1as3yykYcvrMWyHchu9T/bCI8xXtWEgBR7jEWw1wWRQjdF8=
Received: from MN2PR15CA0013.namprd15.prod.outlook.com (2603:10b6:208:1b4::26)
 by IA0PR10MB7304.namprd10.prod.outlook.com (2603:10b6:208:40e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:09:20 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:208:1b4:cafe::2c) by MN2PR15CA0013.outlook.office365.com
 (2603:10b6:208:1b4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 14:09:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 14:09:20 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:09:19 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 6 May
 2026 09:09:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 6 May 2026 09:09:19 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E8IWt1221395;
	Wed, 6 May 2026 09:09:13 -0500
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
Subject: [PATCH v2 08/13] arm64: dts: ti: k3-am69-sk: fix USB clocking for compliance
Date: Wed, 6 May 2026 19:39:40 +0530
Message-ID: <20260506141040.1368918-9-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260506141040.1368918-1-s-vadapalli@ti.com>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|IA0PR10MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ea6063-0e51-4312-e73f-08deab791154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|82310400026|376014|36860700016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: SZ5FU25dUV98uWVsNreCUjjeEaIak0jFgm9yFaMUZ2J9sclaXGWB4dvEeWk20iXK0thA1KytLriVwW+dXqU9DPRMOmQ0bEPyBxI/KkHbtibpT+WgH3yiCXCbGrSiT3H0pPeOyCjlmjW+wNLSAzZ1EkYJ7TPb/RYK2mtwCUlj404jwXv2FLmt5Y3xav7r9WAAaayOVhCgLG+fkOt4gCUmvztF2beV3BOFE/ZTEaFVhQoRLKxfBn8OayoiM1EPpLpqgWqJuzE51AgNLSzqWVTEdv6LT8ZjtN3pPimRDu4u/u8lw8VEVJZ/+psKzVfQ55/TlK+pjjyhh/CRTUqv08N3aAh56s2PgeSTruW5XGdU6JVRvppIcGWN82doCxRxHcv/QPLH6dX5YQAfL4QpfhTN34PP3nbLbEdavZbHlGmePdqMQWh42H2TFh+7NEZ+0nQFOvszjPUoyxn+WHesXVBk7o0dPwz2Y7kZKxbl7McgNrcFri/8xfdTEsDX65auIzawRCMNTHByVdt32V3fG0RMUKLCdzrD5Yt+fx2sa7BZI3QOikAzfEX30fFAaRqfU5Z+Z0oZlN9K/tuuqsww4Xhut9OHRCOuH6Q3xrUOMSOIFxnWvR19k5+q0w0vjAyPKtwDD5Y8nvoNYDmWEEf4NamL/56v2eUge4t+DwlU0oUJWreRdPVDPg9qwcUuvob+MND1zOkF5lXdaSQvB6+rXmZwcIkm0JlhK0FTcj/oUb/xJcwa+LZGp52vl4fGAx4WLqxrjJ4X9AYBu48ZHnWMdj6/bSaCrIv9mfGmy+b+KHrKAiE=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(376014)(36860700016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HURvuSvQOsCLkceOdAmSV7cxLjaptnV1Q2EUnvS1TBNpT6q68USPET4I6i3LTTIZx/xtvu6nAzedHaxkO2dfCHCw/Zck/71MeyPmPMeKkUAAkwvIMYNj9UrVZEFsr9o7dO4BGtOUl2wiKRJVPYmiwcY51lbIwOGiuMJF2RYLVSsv2qqJukvDEh+cMt7hqjtGRJX7CqwDSoTyDkq2jimLn1CaB9bMpjn3wGAM8siS/KVncYXulq+Q0InIguGDCnVmjRauQHdRGajxjYoEYs7sWDlReAui2sd6E9LM1Rc8+mKVma6taSo5kdKTIVNPSeKnfX9TYK5DX75v2V6O/ZIE0/mODp8Uo8b/hc5n1ftflDR27MvH85eCjhTmcaA5AouVzixo2scmSx21unyLJzGKtg2uiQDMfJqO7puY9ZSfQC/O6aDIvAkxeYcGIMeWXFli
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:09:20.2073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ea6063-0e51-4312-e73f-08deab791154
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_070925_413205_E3A34748 
X-CRM114-Status: GOOD (  10.34  )
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

Fixes: ff7b5e93f16a ("arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1:
https://lore.kernel.org/r/20260505110631.1144200-9-s-vadapalli@ti.com/
Changes since v1:
- Reordered properties in serdes_wiz0 node to place status at the end.

 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index e56772a334c5..afd809104d1b 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -970,6 +970,11 @@ &serdes_ln_ctrl {
 };
 
 &serdes_wiz0 {
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
 	status = "okay";
 };
 
@@ -997,6 +1002,7 @@ serdes0_usb_link: phy@3 {
 		cdns,num-lanes = <1>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz0 4>;
 	};
 };
-- 
2.51.1



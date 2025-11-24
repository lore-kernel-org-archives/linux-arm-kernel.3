Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D743CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Arf4TuWwdYlq66XHK8aGU6VoXhMxSWnRd9DxcTHaqOc=; b=K4YvJ3wKURLfFCn1KpvhH3u73C
	AMr5EdoEXaGfa3IhjukOo6bACUTIu9OcIqQFSPk+ZawdgRMuEPS1a0SpLk9PO51pI9lbyRXrFEXfD
	RGWbdxQazKBMP017dtex4YR7AUOom3AMvKKEy7FbiKZ5TuB8CYNo8DcnofnLYzVHFQdFazE50cYBQ
	LXTCU6BSaN1FezMoi1m3gLz5FR5CKT3YQxaLpwH9gfnOfk2n8pAo4z1TUgMOK7SV3fTdmSn1UwIgw
	mpBJ5+DAsYDRy7zqYZp+lt8hQKy1vpoLeT3gEJ/PqltGpuU/8HRWhNi+P4AjZBwe0ABwQEtf2IZGl
	aydvsoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZ4u-0000000By6L-1d9Z;
	Mon, 24 Nov 2025 16:06:12 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZ4r-0000000By5z-0arx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:06:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZH1JGfeolN2EPy10EVr/8l+LuFCj3GbEjlokzs8UoAbYJfQgp8WM9m5eU+dVOP20OSDG68C9ANDYi8NosDyRP+3eiF7YIKc7raXvSRuukDvpLZSY5DyN3rtcra+rtRMNb4zdgsNMqrW7UfXeuC270qsvQjLvVvo6PHZ2V0O02xqpW47unvONpXMERYfFjEF098smGZ5qpCPj/GXL1bZ3WrSkjCmKKsJvFhiZ/sKYfGqwZ0HpzFciiLGb5QGSMem2Legp3z3WgN5lETlf5zgb0WCqg2voYTTplAMaTh1FQ0A7hXIEB+lIaSpkdjgZjBm52hPVUYsrgGfmpSh5gFlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Arf4TuWwdYlq66XHK8aGU6VoXhMxSWnRd9DxcTHaqOc=;
 b=oRvm6LHBD1s49NZ4Ou/jmoet75VwvsJIDLeNCphomwDw2aygcIVchUe4Q49SJSWFz/wxLvPxQtF6xPz630+pSZPlpl58BBU0ZRNZLJrg/kEkedAsw7+F3MmHmHj5lIgocD4Z16Pia3RwyZTQL0Yzstil7Qs/KIUjDDMFb99rmhYCIsaAExYiH0FQZ4//d5ozPLiHfo5eJy0ugwEJStjP0xtFs1Je8Zr0d1HUAo+4B+53Odk6BGfgSr9KVZXUBt6XmvYDQrrj+FTbY5EDQk2ml8+JYqG4FA+2ZpGOUXG8CIxGS7AYsA2mnNrze8AImcVkyYVVbFj6L9K3J2TbKgNNxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Arf4TuWwdYlq66XHK8aGU6VoXhMxSWnRd9DxcTHaqOc=;
 b=anyNumSgtqRIVjOmuXKavb+NaXkjzsnZMCqNOk4zg4Kvx0hmmf/bqMHbyXo2yzrNANI1N9VFcnousUgcG6Wc1uzxVDXN3CuQgkhOPJPw8q7HzCVt0JKJXhYcS296eC32BuIThgKXm4dLbMVH3ip0lvD3jzQWyT54Pqt7AjNvKIF93FUcC34l/Is9OSZLvU6t15QrLk82GcSY8XhU3SnOqdwp6YttNjNs3puezaYLKHCtS85f6PlZ6Y0li23fFtskEKvd+oPpyHlkYL5wIgW7Nu7fJgy6tSMhlDsTeuyLkKT67WNnq8lcXMgSBaH08vgyRiA3GloeLglkRTmvepk3Kg==
Received: from AS9PR06CA0753.eurprd06.prod.outlook.com (2603:10a6:20b:484::9)
 by DB9P195MB2992.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:5fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 16:06:02 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:20b:484:cafe::b5) by AS9PR06CA0753.outlook.office365.com
 (2603:10a6:20b:484::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 16:05:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 16:06:02 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 24 Nov
 2025 17:06:01 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH] arm64: dts: ti: k3-am62(a)-phycore-som: Mark phy_gmii_sel with bootph-all
Date: Mon, 24 Nov 2025 17:05:48 +0100
Message-ID: <20251124160548.2273931-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000195:EE_|DB9P195MB2992:EE_
X-MS-Office365-Filtering-Correlation-Id: 036c79d0-4ba3-49ec-f309-08de2b735d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WZ+q3w9SQFFfHh4FZe+WbUZkP9S2xO4iZInTq7kTjKZP7Khi3vgBxJpoy1qC?=
 =?us-ascii?Q?keRSCzgQIrYBx7NneQOVNDXTtPGOXasoC892A/xPCb53T7troU+HYLRxzh7A?=
 =?us-ascii?Q?xWPA6QvJHWcLUNe0ghjccZZFCyADbvWsGXKRz4czb78D+ca4whkxJKTIA1F7?=
 =?us-ascii?Q?/te/t2niNnguAd+jnc0t6VExZZKHXiG6kybC/0NhkeXuFfm7hTdPltB4VdHv?=
 =?us-ascii?Q?CM7wSfuLuYSNEeVEDTAOmrhN9Z2wDDQ2xHYp8+HwLwit67mP6pbIYkGRi1Jj?=
 =?us-ascii?Q?D7FIMuB8A+jxoJHQmL1gIOsrlEBCb0gm0p1ZGohvYVi9/jHPiuYbdf+a0PDJ?=
 =?us-ascii?Q?/4xUWxEbvut1g//jBmywC16E24xNP8ec1s6TisXtNmwwYKcTLUiY8WN+JsH5?=
 =?us-ascii?Q?bq5wGEt4wJbrDuD5oUuIegEvxsTdd6ltzuB+vU6mvy9yHRtPOJyHeA9LhECS?=
 =?us-ascii?Q?t20f2EKX3z4vB9U+0SM/5vRw/wh6ZP9LLdR6DgbX0GJpTwk4zpZ588sYhUH/?=
 =?us-ascii?Q?OloNWA1j71plybYBa8Rje9+90NsgBvf57TCgupHROGvR17ZIRjLqn+q/tfhR?=
 =?us-ascii?Q?h8+XAyMQY3ing58+Q21fBCwfVvTeFNpzjym88ffx+BcJTSU6BFSfELG0D9nA?=
 =?us-ascii?Q?gUWPsxg0JawWNE8SgfNgvrbiichA1Qmf5liJHtfsK0tdEf5UY4DOr/M6OVT1?=
 =?us-ascii?Q?ZFLxtrrpGQPgGDs5fM8oo0xGJM7w8hfBDJCsY9MviyHVXk5/tUIVqhG9COJe?=
 =?us-ascii?Q?tkolygG8Onv2BBZ5pNX16x1qUTyrm+9GdWu8R57TvN9akR75MdWtvo4mPTsa?=
 =?us-ascii?Q?bHVzrdYnq8y1zRLPAT0kxzVnHjmivvIkGI0thqRdGCphJAIcshtqynR3Hb4g?=
 =?us-ascii?Q?m5uzwm4IuVdHe/8pakYl3Qm9celXs1kpfGgHqKHQeU0LGTHIuNKt7RAVzxfK?=
 =?us-ascii?Q?dod8DFDUViInTB3Aaq+AprC5wkyL8vLPxhD/hi1OBnIeVEy9llv4w8K2Bcoq?=
 =?us-ascii?Q?ufHRrMtgggLhbvTNsl8UUQg1zmdTJWojXLd9EAX5EY4qCw4HQznDfUBm2wn0?=
 =?us-ascii?Q?Pp5OWdm8jL0SAR+v4ikOCskvBhG2UDHn4fBpAt8Ci4p7WoxKBlJ6BGZRgoOI?=
 =?us-ascii?Q?04qIMeuBHpjNvPc152xYMvwlVI4Q+r4wIvEdlIC24fTK3Aa1+odXOcuww3CI?=
 =?us-ascii?Q?BWaNijLWdRk4Pa+ollnOL7mejIX7tWy3jVlNREFNsMKoK8tBv7LqGrkylklC?=
 =?us-ascii?Q?zHfu27M1kRDyR3hjFnu40aty+JVzL4uqQLSTdstIlM1+PSUORD7NBQ/+QwuQ?=
 =?us-ascii?Q?EnvXW18GlhbObyc7ih8p5ryqwP/oPkiXtLdaPaAe/cxrG9pVaMBfwI+LmjBu?=
 =?us-ascii?Q?LLTztfj3ODKn1Ee7Ro8t90Nhur+najYtADLffDIeZqCZ3IGUfccCM9jvLIpx?=
 =?us-ascii?Q?KP4i05GcPhcJEevfIW7HxJZlkRen/0jBLax9mfJFyzNMH8N8UQ7Fwks63djx?=
 =?us-ascii?Q?QLSVO1CuVQrbaGDjBqQjAultv6TfQN70o2YtONYEOIFMj1xd06o1y6KceMw/?=
 =?us-ascii?Q?GtYINe4uLjgEe1dJKno=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 16:06:02.0008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 036c79d0-4ba3-49ec-f309-08de2b735d57
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB2992
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_080609_501128_C78F2FC1 
X-CRM114-Status: UNSURE (   8.84  )
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

Add the bootph-all property to the phy_gmii_sel node to ensure it is
available during all boot phases. This is required when the bootloader
is getting booted via network.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi  | 4 ++++
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index eeca643fedbe..c6de3ee30bf5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -358,6 +358,10 @@ serial_flash: flash@0 {
 	};
 };
 
+&phy_gmii_sel {
+	bootph-all;
+};
+
 &sdhci0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc0_pins_default>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index b3d012a5a26a..faeede4f2950 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -350,6 +350,10 @@ serial_flash: flash@0 {
 	};
 };
 
+&phy_gmii_sel {
+	bootph-all;
+};
+
 &sdhci0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc0_pins_default>;
-- 
2.48.1



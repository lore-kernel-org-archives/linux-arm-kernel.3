Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1A7CFD31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=by2kk11znyAcsbm5npA2bfi667Q7XOW1pMUO0TGBPq8=; b=XL+kRgWzKarIZc7IIbp0naf63A
	JimXbCN25xuGMvMtxvEw9Uk1eOq2jq8a/HPcLKQwAl/v33VU645OBnSADSK2KxakgbxJZJeFmqJ5Q
	24iJ8F0M2erF9q81nhf6v2r0uHDH4awl28AXYMiMJz6ohWpj1oUeuk85GyJmIdA5CEpAal3iVkgdS
	veSgjyLilazqsnwfk4OtWrlRi5faK56lSy4BWC6rZQhp3dtdiYE3khVZASaXfNm4sSFZL9hQ0lAUK
	T4NQ1CqSm/221z1W0nsKMRYsthRvVC05ohhp9GXnZRfaDllngsYfnQLsJ3VO7iQcszmJa46/qH/et
	XIWW+YrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSZN-0000000BJPL-1HqH;
	Mon, 24 Nov 2025 09:09:13 +0000
Received: from mail-francecentralazon11023096.outbound.protection.outlook.com ([40.107.162.96] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSZJ-0000000BJOX-2IB0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 09:09:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scq/oFXJWfgW/i78wh2jKM0X0+8E49+F4uk405R021UZ1dmjqORQylljcJjq1r5G1oQp43OO3MiBxy39RKWB4YBgq5RQGFOpOVvTSwSWUraIu7x7hjEoc2OccASztIdXj0zWw/o4+b7fAJ7K9L5MS0eHA/PPGld8CJjcjObTHTknYJRqtk569vQQ8djqR5RM8ZbMx1MGaZK6udNT5mN3HUSdffPVLGeejFJy0ZOrdf5dwcvWMyHm7USMhhXCQI09Qs3GbO9T+d/2psO5F+Ip1JeaP00v4t/e/VfV9a9p8wqJeROhZsVPIV/butFT2vM8T00hNnLqgwjH0LfJiBrTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=by2kk11znyAcsbm5npA2bfi667Q7XOW1pMUO0TGBPq8=;
 b=yTFqCKPkcfvNRAIRFGdMTefKEdjgRFK7/kW96BFuMHL2KP4NXcF44t+WTkRvqY9cDMukZrDxHXGf3dtRFKdbUp2Us/lzoqzyDhOKmRI6cOkFqQ6FMyFa3ZLJRCV3XOvbMXlvb2jt5ss3tIXdsNGbx8OD1/PMTvrbG5ZeaCg2Z7KE1nlPynxH8sh3ESwiMUamIwjDoTeX5Dlg3VBMWmQhOUSFfCWD1x+eToAMey9quQIBkRVMcmCvj9HcX0IVB5y0F35nu3V6dtmUz/NIBwKc7lLqEliueCl90FAqREI0Wy8OKTT8Wqa13fPh+K39syabnFzOTh/ne5b62OV6NUX8DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=by2kk11znyAcsbm5npA2bfi667Q7XOW1pMUO0TGBPq8=;
 b=JHMdvwTUmBzN7XxY6pwAG9tJDB2pveRMegdKkiM7imHfg5G4IYINHQnnDxcXcrP3nC+tLpbZA0+ClSuU8+wGAH5TLtwV1mHpWFfz1uY7WlJGsvkHGavrd2DnyPclVVe3iRKaXJBRxu2megQ4/cvLBSsmBtiFTUBjHU26dGy4lv9x+vu/47rksCKq8Wln+mxlOPG0T3UKP5AgvFlQcaXncpdNxH9yXOk6Sra90Udyg2j11/RE/frUlwi8L8YOGZ/9B2YgoHaQd58NpSyTDZMuJ2LXXNQaBmOg9kwKH48hS6JHh9xEK0QWOhj9RmLTPIUFe2BwpF76IyTmYILQXEK11g==
Received: from AM0P309CA0025.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::10)
 by AMBP195MB2860.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:6ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Mon, 24 Nov
 2025 09:09:02 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::99) by AM0P309CA0025.outlook.office365.com
 (2603:10a6:20b:28f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.3 via Frontend Transport; Mon,
 24 Nov 2025 09:08:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 09:09:01 +0000
Received: from ls-radium.phytec (172.25.39.17) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 24 Nov
 2025 10:08:58 +0100
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH v2 1/2] arm64: dts: ti: k3-am62-phycore-som: Enable cpsw_mac_syscon in U-Boot
Date: Mon, 24 Nov 2025 01:08:41 -0800
Message-ID: <20251124090842.3377294-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A796:EE_|AMBP195MB2860:EE_
X-MS-Office365-Filtering-Correlation-Id: d744cf33-7988-45f4-c13d-08de2b391c12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9nR5LR+ZPdv4qd+MGK8cgfp0zRsTlMzFow8wYCOhiAyKTvzt3Z6Tx1ShoXXz?=
 =?us-ascii?Q?mCPR7qgWVCeq+bXkGUaoGohuV6pEO8F8vWWb6yz1b4yf5Jjx2STQhRoKnNkR?=
 =?us-ascii?Q?Hbn0jtPkk6R6AiZJcvdv+BP09hQrLu9NKdezSBYrvIxs8xHVuE6R9Ru5KWFu?=
 =?us-ascii?Q?UE/n27Hp9vSwkN35A5glCJHRHGm1aQmuMfQ8rqyZirLZJlya+pxtGgrUTXgj?=
 =?us-ascii?Q?EQXjsNdRjRcngd2U/1AOJRwAJEn8nIMSmjIK7wACqZx198b1VxYfSqoyfeiQ?=
 =?us-ascii?Q?C3i18sC5cD3SHAalch/bWOE7vG+pfMdpMw+BRscwtHvVSpvolsglPcsOxFnm?=
 =?us-ascii?Q?2bCTNuRw1KTcbi4Piv3vqzL/uxI7RxEVipJjtBzgph956bvHMduCpEx+3+2g?=
 =?us-ascii?Q?8VKdxZFLy4QQfv4uPKTJ9meLwgQM+dOymGmL5qBkVtAWvsAzzQP/xDSvexnJ?=
 =?us-ascii?Q?AzhmhU+ubaTmwnMC5S6v6mH7cI9U88QXYrieJZ7hXBxrcd0geXwUeaF6Msty?=
 =?us-ascii?Q?lK6xlpbsqAVLhJs0Tk6jmd06anus7Gw1R4FdQWZ0CW/GDz6L79Ap8tY90NSW?=
 =?us-ascii?Q?vLqcQhPKkiOOzeyfs9C+sa24UrDR9NiJdZaxzYLptoJZV8/gxEfmJMFgu7Ja?=
 =?us-ascii?Q?G+Wa6jHP3UMcXHoTegwLqicj2j+SNzJ7/wl7mmQG67AMnchcCtqmU6yzWM+l?=
 =?us-ascii?Q?C4Jd7juFaUcFb7NRLVyfIzhoFpseLJ7p5Cquv4mOrZ3XyfnHDhb/XtFXw7+c?=
 =?us-ascii?Q?zgIhLDC2QaAv1ls8JXjP/deE+RJYMKnO5waYHHiN4fDoM1cGXnVZeGkjmMZK?=
 =?us-ascii?Q?yN+Ix4RuRkouN4YKBTeevf1K8Wv/sTWADsFSUIok7ypN8HRw91SKlIy52OJW?=
 =?us-ascii?Q?WCaEMXM2+pcq0EqFbhDoofAtBS7hLbFz49rEWJdLNj6Xcnauu3/dEANXVR02?=
 =?us-ascii?Q?JMsRRPza02KqnqyqLAF7+65FfYtn/DbljsGwyrPaRUSFM7CovKSf8Ns/XosC?=
 =?us-ascii?Q?lZ4RcWk13WpMywWKBCg4umhdLgQUBR6eo8OP6ryLgxgEbYnYUK2Pj77TfWTN?=
 =?us-ascii?Q?yVqq4U+9IJTAq/G/AzwYLLiea4UwSzF645MDtOotgaOIRO9dLVDBugNwo9SP?=
 =?us-ascii?Q?eyh9zFoJwmLPhi0bpCkD0EEHqoS3vt68LJ/MmOUKqISfP5oA6iMpA6qSHcVe?=
 =?us-ascii?Q?DrEf+qahrwJohAEoQyvftMWd4CovwTY3DmUW5qMMg2UhbY7QHPB0S2VahHwr?=
 =?us-ascii?Q?U1cXmVz7SzF7pFgRC5WQFawDKIF+U0Bb1R/p+HnMxZxK28oNjKVdm6BjC6km?=
 =?us-ascii?Q?xk//hhHhxsl7MszCk/xHn3KxDyp+mUyUP9Ghct80fSUn/wjn7VH594X4UtcG?=
 =?us-ascii?Q?gCh/DwwCbdcHs5inIkNxNZn1boxGOi31UvLQbe3ivGVv87TPp4941fvPwheN?=
 =?us-ascii?Q?jX/cSN5fm+0swm0U9SfHhBZMr+tgqc7F9yi2jWeZtofkivJSVCghsy/op2tw?=
 =?us-ascii?Q?6Q9Lf28A/FnCgi0sfp7ImrEJjusfLhirgPRQZhk9OK7mzTBpv7y7baB9hfP0?=
 =?us-ascii?Q?fa/WelH6+JqsJPfaJgQ=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 09:09:01.6880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d744cf33-7988-45f4-c13d-08de2b391c12
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP195MB2860
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_010909_900118_C6D059CC 
X-CRM114-Status: UNSURE (   9.33  )
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

Add the "bootph-all" property to cpsw_mac_syscon.

This fuse region contains the internal MAC address. Without this
syscon node enabled, this interface will get a random MAC during
network boot. This is problematic because the AM62x network
boot is using BOOTP protocol for some binaries and this protocol
does not support dynamic lease expiration. Therefore, the DHCP
server can run out of free IP addresses.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
Changes in v2:
  Moved changes from k2-am62-main.dsti to k3-am62-phycore-som.dtsi

 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index eeca643fedbe..beeac481e683 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -219,6 +219,10 @@ &cpsw_port1 {
 	bootph-all;
 };
 
+&cpsw_mac_syscon {
+	bootph-all;
+};
+
 &cpsw3g_mdio {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mdio1_pins_default>;
-- 
2.25.1



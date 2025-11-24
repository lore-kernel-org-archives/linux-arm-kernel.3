Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BA8CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MdhQ3P2v0v69qaVyTFp9hHzy48+cUuFhcgOiXuk+Qzo=; b=Y5Mjl9461noEUY4nHa40nthUFx
	LsPnN7eQEEu679WLfRAY/oDogP1aZTVKNj/XheFImJcJxjf5Hmby5Mrd8dynLlDY9lm9TWqOPWgkI
	PHlRGupayR7bNYyzfqGoxSDJMBdEjHRvxct6+FVwAIaXnyxsLUpxmL9vzzlIODyNxTj9Si3u3i97v
	zeMC1aab63bBmNRsfo1+NjsrqLBc95wQGrzBHkZ5dho1YG8YEK352+JpVpGwC/nyqYGBC06IBQbh9
	3j3/7y9Y0IrDX/FXjBm0ae+/NgbxcUw7XMEQnl7PuMYPQfVDgrH2wk+2f8/wRqxx+Ug8sb9B5ZTIc
	J2cWMiXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSmo-0000000BKkc-3T32;
	Mon, 24 Nov 2025 09:23:06 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSmm-0000000BKkB-2vQv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 09:23:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8D7+1MvVkW240zngVdzBkvf6vjSb4eJ9ZEd9U/4WZKfWGllOR6l5NcU8sEb+mQsYzvYSS5odTIjlEpmsD2pENu37l7rS6qHWwgXCo+2CDf5I1MoKNaHd8YW4oH86SPI+CzaddRd3IM5X9KSd67ma9H/TMJJKYUACxnB125kDiTJ+9xHxl1o/ROD6SQgmxXGuKy9Q7vdJQjJCza5hc6D5CUDoWchxzSA67o96+5lStGa7aebtcn02n/2p0ZLTKe+yWSs9Nw0NFYl1QHT+FvqY/jQxAHrTs96iFBB94grJxsHsvfyTN0OHGVVThUSspapaaDaLUHZ4hjGvH+XWxXB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdhQ3P2v0v69qaVyTFp9hHzy48+cUuFhcgOiXuk+Qzo=;
 b=srpR1+5+4HZWHUCKMDtJR9Dj1jWT5rp2ijW+5/gZ7um0LvuER/Fn/fujY5keQBvVdrDj5YSNZGGEKRm7yDRAVvo9HU7B0d3FedtQdMfSKWnPsNTSrsQd4URSPenSRhLuOCTJTUq9TafC6kny2awsNY0Sd0nlx0zRX3NE4WEUVziFZVG0ppS4/WPYZrj0jlMtW5qiG97SsrUXyWZVFW4OQjQpafLnqtpzgyS/gLMsjdb7llVRRUxrPifv13x7ZkeTNHRazt+xPsRfCGbLQfAC+m2WvZCJTaucFCxGmSdJQYIQ3eACk6+6ur91vuTtdRa5lA3vPNPL6Qgtcjqe9aL4Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdhQ3P2v0v69qaVyTFp9hHzy48+cUuFhcgOiXuk+Qzo=;
 b=abmtBNy2Q8fwXjC9pFeGyRUk1R0nhCbTFRK4KlA4lZHOnqRAWS0sJJ1TqW9uqMnWbmRdqRczFYZQxnwTiaPxqfb9Svyi2J3TRv1D/THDbybT24/zJOaGET+B1GnMrL3v0iPJXPgJ09zV0Xm9RQNE945irlpYtXMFAXBRFdvtOejJ+Gcxmzxx+DE/oeynpy+uf97vYSccP7R56/xt59MdrTyJKhkGmSkHozYTkHG+AxHuW5tJ5rozu5ZBNRh1r+iaMzDuYHTbXl+lr5s8x8usxtutyNdmac6I/Gjj0jXm7LBJufD8dOfQKKvp3Al6YlG7zE2gUqWfRWz5tnwmgmb76g==
Received: from DU2P251CA0006.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::7) by
 PRAP195MB1457.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:278::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Mon, 24 Nov 2025 09:22:58 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::bf) by DU2P251CA0006.outlook.office365.com
 (2603:10a6:10:230::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 09:22:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 09:22:57 +0000
Received: from ls-radium.phytec (172.25.39.17) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 24 Nov
 2025 10:22:54 +0100
From: Daniel Schultz <d.schultz@phytec.de>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH] arm64: dts: imx8mm: Add label to thermal-zones
Date: Mon, 24 Nov 2025 01:22:42 -0800
Message-ID: <20251124092242.3378017-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DD:EE_|PRAP195MB1457:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f11ab7-d889-40b7-66af-08de2b3b0e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m231ejOjVSKmFN7T/Nj+xsend4ssIos/clpTYX8CSEez3nCQ+USo9xKZiPYU?=
 =?us-ascii?Q?0x2J89BEAQz5sUjbB0GgMK4pp24a6xHVjOJf/Itx1An3gvT0MlIe5oSygslZ?=
 =?us-ascii?Q?r8fC2ml/aavkKrZKBSx2Mhe1ohJYvAJuSNZhPdN7LoFzOPLoMzAM/yQEYoh+?=
 =?us-ascii?Q?85pCPHoyBsQ9Ip2PfZEzgulWTglVFNlNQMyQxqerhv0tySwHp0XqSbg34o+R?=
 =?us-ascii?Q?8J8H/OQwmStTstorGW4typd/5rVJ1xlICztuv/AppSh0iV02G+TB0Q9jurEO?=
 =?us-ascii?Q?qYOU0WVVV75bPcqxQMtEGCJZxkVig9emcOIZgdelPhGxqH0LR3p3zPbWsIdR?=
 =?us-ascii?Q?noPpfmC+95yYbt+t0RZMriLt+0bUEpQFPPxedZ5ukrpmherleROhE6taJz00?=
 =?us-ascii?Q?LUpuI1TqS3TAbZ7hL9M7gaqxCz5ZCe0KGg/p8AhQCz0iKSLWujKh0MPyYLdP?=
 =?us-ascii?Q?nUHUS3pG4JFSUFYaTR7K89Xk7HQO19PWEY04BMvhAzWu25tO9bparMSS0UT7?=
 =?us-ascii?Q?QTCqrtChB/jI19O0iKmLIbOyjKEEkKcgW4MCio69nOXL83dytkvJYBoWRliN?=
 =?us-ascii?Q?UzmPeC5aBl1alA7ibEwF7uIoeRwFBc9OHwirSqfS7SN8H5id0E4/Z0E+oq3C?=
 =?us-ascii?Q?aW/diHMaya3+ogS5OhxKEdRNs7hR1OU0fuUz7bMrFMAorIOYLOvsTzpWugPc?=
 =?us-ascii?Q?aiIE7RKK2wA3BehZ+6IAXquFFSU0x1yUEivxIoqzuWRvJ8iaew2b7vtjIYBE?=
 =?us-ascii?Q?AKhD9b5fHiH4GQfG3QxQ957GsogxwLqhGwWQFCB/ew8lDn8ic+pMHoKTtER6?=
 =?us-ascii?Q?VPIHG2vnRVrt/NxSyVqgfVnpHOdgxcGiP9ATfXrNWKDYOq1SvJVf/GhzWvaj?=
 =?us-ascii?Q?Q/BS026606LxiyzHv0vVKZu9wKlTi3LZh+QeBDHyTHF/7vR1S1KqetE4MVBg?=
 =?us-ascii?Q?FBsdJD/93W/sUSrmoYS8qLSlguOIM3Sq1ewEC8Kfh0rQ7i9q2lzxoZKPEUD6?=
 =?us-ascii?Q?4yQ3JLneHTDsqf7R/ttxzI/G0hQOthSpbmYW6kXw9ojQ3iLyxC9bkthuYyMZ?=
 =?us-ascii?Q?PlFDqyusdijReyxJqeD79Szef+e6TWXWGBbhEKWN75j6SO4DFM60J0Rzkt0i?=
 =?us-ascii?Q?p1eHanEJA2Hi61Pebz/CXG6Zgi0DLc8gZs6SAxGPryLyY+ZHyTMmTe7u3LsP?=
 =?us-ascii?Q?phaPM8PhyYScj30vyjjJN1C/KH/YbO8NuwKcq6XXYlHGl6BJuYObyKiYPO5a?=
 =?us-ascii?Q?tPD26+CBBVHnDnvKLyGBWpfXrncU1Ygvkg5rmksqelEWMklz8kOuwiZzaraA?=
 =?us-ascii?Q?votM2wYNkvXRe0pO7smKRcAPcDmpMrXXnWa8czSQJV6+tL+MyGjtJp7ZRK8W?=
 =?us-ascii?Q?O5pyqrTvkMf01ht7IngqvsnlHpkprnCaNk23k/NA+ANSDBX8y+ho7M87lu1c?=
 =?us-ascii?Q?3e6/sGA925wqOB4mmxWX+mS/5ASTWVlq3h8ekcxOVY0OK+4AWVi63ioQFEqv?=
 =?us-ascii?Q?G+xHGcuVW1U9PUoRxAOXIJ+kV3QQs++rbiVp6CO0bfsbxOF9eTEEAcmxama5?=
 =?us-ascii?Q?cwY9H9E/NwTeORa+pzkPdmv6SdPrIjBoCcXqo9Gw?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 09:22:57.7199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f11ab7-d889-40b7-66af-08de2b3b0e67
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP195MB1457
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_012304_741293_FBF86E82 
X-CRM114-Status: GOOD (  10.73  )
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

Add 'thermal_zones' as a label to the thermal-zones node.

Without this label, it is not possible to add additional
trip points in board files. For example, to add an active
trip point for controlling a fan.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index fc3cd639310e..9f49c0b386d3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -234,7 +234,7 @@ timer {
 		arm,no-tick-in-suspend;
 	};
 
-	thermal-zones {
+	thermal_zones: thermal-zones {
 		cpu-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <2000>;
-- 
2.25.1



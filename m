Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B520CF8863
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G1hlqvKPAIwQVT1Ll3QBGT2+G6YKNjwCKr+w3RsFA9U=; b=dulTyrO4xf/LC693RJh3V0hH7Q
	M8lNbIUJ9HQE1gpHvecoYpzv50IKVyq9a4SXe4CRxhFts+BVJZ4tLL3UMe/hF74vBE9ia1QVZHf/c
	chx+tUODEoph/vNTvmyFQ+1UN2A//3l1Yko/f0T2gBF+auxVp1mkbKn+vpenB3LEi3Kv/x+duynoa
	7ZKTGdFXXqr4eYQtKWbvia8BP1lM8ibhjP6CFXcUAkxBxjq2yKa3eTkfOS/kbu/zYNl3sD/3+G5sU
	Tg/asnjPIYBSGdzqIqlahMzNbO96G931GQh3KmK0Us0s1bPHk4LViUaivAl4iQD7geWbdDmn0Zrw/
	6Z1ambvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5kC-00000006qr8-3XhT;
	Thu, 20 Nov 2025 14:34:44 +0000
Received: from mail-westus2azon11010014.outbound.protection.outlook.com ([52.101.46.14] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5k9-00000006qqb-1ow4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:34:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioFrAk2Ds6S/7V2/knPNqKPyRO4YmUvZrzvEtORiQLyzJP/6Fkj31kg3yTuyUYmgiUnSlq6viYkEWBToBuRBpxbFBL0E26VztoAOYm98b9n7v7Lzxle403+S8mm2TYLEX+UsVOBH4LAd6PcOMeDc05BCqogkMgRilM+eDfNaGNAC4YBKdOKLClZXt7lWOEOvDBJNw7EDJrZhEFX6D+XJQtGWGXMPxOdNrW+URyUOFtcvSthQcbbOIf4xMhzgpc6E9AFHx36zc0T4/TtaKNjbLMp18IZl7bJn//v7pJYXK2nDehhHtc5aFl8a4pEnRLXabDKuRahvQE6B1rmZIdu/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1hlqvKPAIwQVT1Ll3QBGT2+G6YKNjwCKr+w3RsFA9U=;
 b=osC+MKIKyqyciHDmZhNgfBXo9njNh/ghUUQHwXD2F4AR7xMgh168gFvE4vuqMAsEX+sJIMEEU5aJy8FWLSrFm615O/V1oyv5F4Vdn+DrFw32jIWkVXXS76hwtfzlJY5ErmTnSKOkvBvyU1pRvc+wUEsPX0qqCVrDn2H0/rzvy7LbmTs956MtKJavG7X4ljKsnfWKMTPXbNU7AWo2h/Wpf3MyWKR7X/lERYUyRJ2MLTpZAjXyhp6F00K3WHLNJp1VQSYJ3bd6GqYAo7mlViT+YK08OjLlH+Vx+yTvpEPIRCGwUDXzfQqsTSVvVZJVTvZkFw5dawFs7EoGgkOdyyiudw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1hlqvKPAIwQVT1Ll3QBGT2+G6YKNjwCKr+w3RsFA9U=;
 b=HVZEqOENT0z1dDG8rU4qV3fzRY3Unww+fv0sj3/QlrYAXepT8Kff/SzmGnYQHyb5umDvsggHPzC50pUKng/Ig2FSIHC5pPtX2s7w+9jlLOWEB62JN1VT7eZUwcfp207HRR//Es0g1+FiDwxcLDQBa/8sOhKG3m319Hp2JB91rdY=
Received: from BN8PR04CA0047.namprd04.prod.outlook.com (2603:10b6:408:d4::21)
 by DM4PR10MB6864.namprd10.prod.outlook.com (2603:10b6:8:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 14:34:35 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:d4:cafe::62) by BN8PR04CA0047.outlook.office365.com
 (2603:10b6:408:d4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 14:34:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Thu, 20 Nov 2025 14:34:34 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 08:34:26 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 08:34:26 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 08:34:26 -0600
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKEYNfn3810186;
	Thu, 20 Nov 2025 08:34:23 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am62l: Fix unit address of cbass_wakeup
Date: Thu, 20 Nov 2025 20:04:19 +0530
Message-ID: <20251120143419.223238-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|DM4PR10MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 163d438a-969c-4291-c762-08de2841ed19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YhAgKG80sE2CtXVPulI61EpvDxctqWA3XG86ASYmzaKXOGmaGMopeLNBeufq?=
 =?us-ascii?Q?HCaIFDU5yxEjhsc3AVuE145mIRzge8z80HQ78c/P1+ckU3S+tyc7juZBLGZW?=
 =?us-ascii?Q?IyZHWs0WjAMU9JhDeshNxP6lgXQDaD5u1MCFZ83Jed33lgoj8B7goYXdc1Sm?=
 =?us-ascii?Q?ThaA8Ul/GcAe9fiAPRVKmqUaMvEAUrdJCQUVwRkSjaR49SBdKtyCjjwXETAD?=
 =?us-ascii?Q?aMPLftGJdOM0tkNrJKAVwoDJUNX5KqGyeFXjHKWpAW/5MY02RigSV6bzyFx+?=
 =?us-ascii?Q?nyFbyJm7XAC38MOL7dAMaxDYSK8qZjYNDE8oRduvWQRyR3PdsfS/W+/zYcHZ?=
 =?us-ascii?Q?7EL1ltoIZD8h5fGlNKf1LHTUnjK4q9QVKzfMlk3h/HSO+SngZsBj/5mQTlnz?=
 =?us-ascii?Q?TMJvugJMdhW4IVy8Lay3E3n91lVQNwIhPXPpM92C8tU+Hane1BDdXp/+9fUr?=
 =?us-ascii?Q?wShZMTWpk3uM8imw0TM6ET9YaZ9Rlh6OGSB0yulE/H1JCqNvuAR2vLUh50KE?=
 =?us-ascii?Q?FQk0v15EjIXO6Q4AtBnDI1HBVh1JROiUZFCKAsxFosokimEVNgsjk0OL6x9s?=
 =?us-ascii?Q?uBXSZa17ahfzTXwHUGjeAbaLS0fA9TMoJ1A0Fcx0BREzsadyKgWfpvEiPANx?=
 =?us-ascii?Q?mkBK/IiRgc969B6f1ar997boxKlqKOnIqRfKe8TbdxYlc5LAbCQyyPwirqGQ?=
 =?us-ascii?Q?XddGfuXYMVw0ssutFnJnXz5wbBv6vq/fC+XIaNEhpirz/k/TeT0iImUUktke?=
 =?us-ascii?Q?UMYV9scNbIvsD8HsjSH34hDtO+ZHyBEmvUSDPWfXBD2BqnY+8OvWRiQl4dJV?=
 =?us-ascii?Q?UmtW4KWuxzkMkU/xKY4eBN4vEvfNsrF3JRUMHhh1BzXjae99bxLnmFCXW3fj?=
 =?us-ascii?Q?QMUO2ZpURlb2jl/1L3mh2Uf0Lo+9Cbebdo0mP4cahah75hy9iY0KUrOWNxh4?=
 =?us-ascii?Q?9C+bXXAs+Qs2pQpdWdehuku4bM7s4UtqIdMP3urFIxyFwlQ+inHQMPS9iBi4?=
 =?us-ascii?Q?INFYomg3L3vlv3+3S3AfsEn/CnPCRfm15GvSJaxEUVX/WbCT/2gercK9G7nD?=
 =?us-ascii?Q?/G9YUfqVNECMW6m3tuV3Ds2XeQLjfyA7CyUFCnN97QvOTPynkiVAx4gxamBl?=
 =?us-ascii?Q?kbJ0d6yDvseCvUQghZtH0e+/OAHyNaltj6/L/SdhRWrORJhN+03sU44xenkG?=
 =?us-ascii?Q?WH4+h/M0EQnHewiIeQFxIGGNdVAD1PWLuVmedv8H6f/KvP9D62TFOspEtDlv?=
 =?us-ascii?Q?FNYEMUW3bs02hogVm2NxH9ac5kNxm1zaW9qj1nU+0XKEz8YgdYwgrlSBpkb1?=
 =?us-ascii?Q?+b4WwoTLi/mCKrK6A3kESiyIrzkx2HP+hKXuwTzhaKPJv2Q+TDdeF02HLkWz?=
 =?us-ascii?Q?vHiiLRqOGnlYdKC3JNbfcocxYqjQS/+7zwByDe+xs7+jn2kFp4oWRNLQCntf?=
 =?us-ascii?Q?us1tzH7s4bMOUWInkeVo8xKNnGOv0fsSmpjRiCGnE0l6q7m+Ygsaaj7LhYFy?=
 =?us-ascii?Q?WY5uTZojT0xbOPTe49kGiIAMlVO1eVi3fhXJeuxaEiSg3zA2C4cm7IkYQpVx?=
 =?us-ascii?Q?QLPp9kMpahGE/72dJbo=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 14:34:34.7898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 163d438a-969c-4291-c762-08de2841ed19
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6864
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_063441_732408_EF5C0CB7 
X-CRM114-Status: GOOD (  10.37  )
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

Fix the following warning with W=1:
arch/arm64/boot/dts/ti/k3-am62l.dtsi:101.30-112.5: Warning (simple_bus_reg): /bus@f0000/bus@43000000: simple-bus unit address format error, expected "a80000"

While at that, also remove extra space b/w label and node name.

Fixes: 5f016758b0ab ("arm64: dts: ti: k3-am62l: add initial infrastructure")
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l.dtsi b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
index 25a5f15a8960..23acdbb301fe 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
@@ -98,7 +98,7 @@ cbass_main: bus@f0000 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
-		cbass_wakeup:  bus@43000000 {
+		cbass_wakeup: bus@a80000 {
 			compatible = "simple-bus";
 			ranges = <0x00 0x00a80000 0x00 0x00a80000 0x00 0x00034000>, /* GTC */
 				 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
-- 
2.49.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35814CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niNE352IkGkIrvc5Dyg3+WvbmS/2kObJo6TSjxa1OBs=; b=wS8BqAeffVY0I9olSTdps04qMD
	yXTA5jwYGsGD+LyP/K2lRK3PGY/wawQlpdUtmL8KCLkm4X57jB9K6BtGILtt5O1BHqnmXLUq+PdBX
	pYCj0BZGhO2wKgyItr/TAUaCMlQePI1HFwoP9yv1I3Afx6EkiYGoIbpsI+F4DKrvb5KN+sw9oqA5N
	g0gx2CYRkCQMpDRn9yZ88XTla2QW7L9rUghkYS2aeIEinzf5nm45Qj9HeELOh6564CKKClpFIBnC+
	hX3rI4HKwaAxIqdyww0lDC5OddT+MqcN/GXOkNeIam9oiWa4qe2pdB/9H8EpObFEh7SavtvjM59zN
	BToTkvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0Kn-0000000FckZ-2bYD;
	Thu, 06 Nov 2025 13:47:29 +0000
Received: from mail-northcentralusazhn150130003.outbound.protection.outlook.com ([2a01:111:f403:d918::3] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0Kk-0000000Fcij-2dR0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:47:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHwM/EphYd1jaSv0yvCTCsX7l4aKYiJBN9Pa4vukNk0PlR/xO5COONTmRZa+UnPh4rbT/djilhCfQhL7Yfeuy6zbKGCEhaExC0Ll8YpabhcT8fsCPulLAK9fvc1IBqlGM31cr8i82CWJzVqs3Q8MZjj16ZADm/81Z8mYtzjadHm5h3DOcluxfzpEDtlR6NaIEfFUwT+yXcL2d/rxF7TVcByO5MpcQYP+3jAYXb6h9/lNOuE7u8bciRGEZ3UCpHpO3CABjn4SmbOFMk40FywC6uaxj2WSztS6k9yiCZYQgFTzyiyUOSbine4xyi6TidJMT9WOJiO3SpYnOTa0urPgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niNE352IkGkIrvc5Dyg3+WvbmS/2kObJo6TSjxa1OBs=;
 b=uHgvlFBTfl6kRPHmdNSB6t1IGv5mYoSCOs6EHBCzaQVpeP/WfpAKro0VfgxUrp4aLKKK1UvaZrJVXaHCCzzsr4OuRz+8QKaKVEJI6ebBMckFMMji8HDacU9hcfgErB/t8WewSI+PHQD19Qv7kaGns6IljNuECGTYQKku+Ioh5JHQSs1862LSiRZHGLf4Mux+nzRPa3CYEqxYa+bYxS3ZY9xyxdysN7vDRuv4j492fueUEyEC8GoBXpxbd+l9rgD2P2G3TrTjbmvGykFaq6S1Zj5Q45KqdqKDgq2qWswyTVLjqJad2XoSu7JmNFb4+kJU2OfklS8v8PHxQV5r8qpyiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niNE352IkGkIrvc5Dyg3+WvbmS/2kObJo6TSjxa1OBs=;
 b=ukP6pQt3WADfflCuLxISG9qnDvvgKtWw6RZuzXuFg0Y31JZXhcQ9uIEWabXDILLJ8fZjHk8Lv4khCB79ul3YZysnSswXoPZBzBKHw/PaZ3czEJoQ1nWFCz6fwciRkwhSc7JMtfUj6Sb89UVi2oUF59+UQmqjZ33kR6rAmLg2v9Y=
Received: from CH0PR04CA0015.namprd04.prod.outlook.com (2603:10b6:610:76::20)
 by DM6PR10MB4137.namprd10.prod.outlook.com (2603:10b6:5:217::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 13:47:21 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::46) by CH0PR04CA0015.outlook.office365.com
 (2603:10b6:610:76::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Thu, 6
 Nov 2025 13:47:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 13:47:21 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 07:47:17 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 07:47:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 07:47:16 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6DkqDa1301720;
	Thu, 6 Nov 2025 07:47:11 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
	<vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/5] arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl property
Date: Thu, 6 Nov 2025 19:16:50 +0530
Message-ID: <20251106134652.883148-4-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106134652.883148-1-s-jain1@ti.com>
References: <20251106134652.883148-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|DM6PR10MB4137:EE_
X-MS-Office365-Filtering-Correlation-Id: f316d639-b98b-4b00-07b3-08de1d3b026a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|34020700016|36860700013|1800799024|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P8he3DNXo/8OJ2rzJ9noCefF5nBhJ5RUxYhwWK+tEWKmcyLyfxAFZyYYi/wG?=
 =?us-ascii?Q?i1v/Hb6DlDy00sBmkFDIRPsCODJmyCFRH5sZpdo2H+IJJ1jwzQU/re2zn7fd?=
 =?us-ascii?Q?BBjFBdrbdu41omQFDWMd0svmCC5ekSyft6HJ8PsmUuj0ChwDa2hV3hGeKOBj?=
 =?us-ascii?Q?Bci0/SdxnZMVq6tSmsHD6PqeQ2C6A9zvUw2w0pcKxF1MPp5VL85163baq8IX?=
 =?us-ascii?Q?GqO+YLfdN4MqexfJY2air82UP+iyAvhECZCgT0v6rseUAgZzLSzCHBBOGD+n?=
 =?us-ascii?Q?HnIxzHcllRK8moSWawdnffBvuhycbSoptPxQHETBvDpISLrbX7Wl+KBNPgof?=
 =?us-ascii?Q?BcRDS0fc5C2e86LvtMf2d8FJYK5rFs055ZHumWXDmfU6mDGD873CHH7Nr4DH?=
 =?us-ascii?Q?isOCVj5VhqmYngqk/az5Ytokg3I33iliY2+NOAwRLxj+ksvUlKNCHQItwQUP?=
 =?us-ascii?Q?Vr78jDOlGbOy8BVUj1uqYWR29gCuIa3PHDvjs5yq24RqqbpOFZ2pYr7Bv/77?=
 =?us-ascii?Q?aIhuoxdRsak/zsLO/f1fqB11r7JjCIG6nBkiZItuzR+QDE+/vj1NHQBRkVYb?=
 =?us-ascii?Q?aG+KXrgFSOCpwN+bFd9MbCY4wELa1kpmrqSZleOayk1MTS4VD0ot4HDPHcoY?=
 =?us-ascii?Q?HNrWcTMbkXJFt6/Xcidz2Qxyy3AZ4eliMSewB9NfgzO0mvQSeYaiuUhWqcn6?=
 =?us-ascii?Q?jy/cSkNIXl7odI8KzHSa9ZKJ7SipJSYQTqA7tCT873Yt+CqtAbTOtNUodtM5?=
 =?us-ascii?Q?Qo7/2GSJqr5WROjSJromB0JPva/eDtztYL168ZeUStUG6qOJryv5X12T4ycq?=
 =?us-ascii?Q?Kl5SIwCO4K2IEYoKGpMBjim1k/QHQeSpYtn5E1mvg1WGgzs5qxkbpjyBnR1J?=
 =?us-ascii?Q?qw9qXiqxuo55nPhsC8rHaFY5/lQu1QCRpDrGoggUjguJfTpiVFKtsns5aNGb?=
 =?us-ascii?Q?5AFFi5W8MoBHIRRBUsxJ1UibPDg9T/xXcHuCuf27y2kXoG9yXjmhbqz3LWVE?=
 =?us-ascii?Q?eF40xWtu8NcNgRaMD1rah8FKT1qcv2tyqEg4fZrwkG5OeG1bWT7cs8aPocJw?=
 =?us-ascii?Q?4bSjjk4C9fptakvIM59Eo9q7b6VfZVpZweAFQkoqWDi9UFp87ZxwaCNU07Kw?=
 =?us-ascii?Q?imQaXKJEtf6MfUMii2XSxnEZYYkAb1yJmgJdxOblephUPjeNuH0/PaccO8P3?=
 =?us-ascii?Q?7x6zWgP1pHk3GNGMy6z5UeO9WFmvLoKVG/Q8ExXSnUytADSGh4kD0m+kT+Ph?=
 =?us-ascii?Q?AwmVZCGq3H0Aumi7cWaa1YgKi+9475zjZj3R7uyDd4iYScBvGM+j7D74LUSy?=
 =?us-ascii?Q?OnlgNbifvKB7wR5ITQaU/tdb98FgmxUucHV9TME4J9TL7WpxQvBNCLc48Vw5?=
 =?us-ascii?Q?Z9zeBasE1qQVpnJ1MegrrJ1vs+trew4q6F7wewW6ziXU6X4XRSg8ZBV5GCrO?=
 =?us-ascii?Q?8fnfdzjlS6PA7l/PIyn1zWrZuWu6nQ4L36Y9wj/C87AVZILidkuJazpp9Rbv?=
 =?us-ascii?Q?u3N6IWA9LpSF2defZknYoGJ2JjBHThmzOfQ9p1K2W+yqUR4TOgr+kOsHfMe+?=
 =?us-ascii?Q?vX8STvyKsIp3KivMGfKXmW1z3ZeWA/MqDosANrVd?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(34020700016)(36860700013)(1800799024)(921020)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:47:21.2968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f316d639-b98b-4b00-07b3-08de1d3b026a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_054726_670445_49713E94 
X-CRM114-Status: UNSURE (   9.58  )
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

For am62 processors, we need to use the newly created clk-ctrl property to
properly handle data edge sampling configuration. Add them in the main
device tree.

Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
Cc: stable@vger.kernel.org
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index a290a674767b..2b6c033ae393 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -77,6 +77,11 @@ audio_refclk1: clock-controller@82e4 {
 			#clock-cells = <0>;
 		};
 
+		dss_clk_ctrl: dss-clk-ctrl@8300 {
+			compatible = "ti,am625-dss-clk-ctrl", "syscon";
+			reg = <0x8300 0x4>;
+		};
+
 		dss_oldi_io_ctrl: oldi-io-controller@8600 {
 			compatible = "ti,am625-dss-oldi-io-ctrl", "syscon";
 			reg = <0x8600 0x200>;
@@ -801,6 +806,7 @@ dss: dss@30200000 {
 			 <&k3_clks 186 2>;
 		clock-names = "fck", "vp1", "vp2";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+		ti,clk-ctrl = <&dss_clk_ctrl>;
 		status = "disabled";
 
 		oldi-transmitters {


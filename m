Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437F910A62D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qcuBciYJaURuvmrN0El+EmdiCnn6gDTtubutA/kj+Jk=; b=n3QUi8W7o7vG6Lj5ynEvFTjvE6
	Fdmh2MZOOKIhqDaX6BwLQKZn39lRxqTCusy6dzo4NaDG1JPaSGCJY00gofF8y2dS2/iggad/521nj
	i0zBhWFTnA4mJzQIIlBvrSZ3853HdAo+mAJTYJcc2z+SH/rmJ5gya6HdkO08w9wN0NnU/D+yOtIxD
	Z2dxbfkzvsV3NJohWiBTYgy+Hcg1SkPe+IQtDQDLS1UDJ5Kyo0r2AZ0Oo9sMRWx0OUHNswpx9XKAD
	pfd1oFFfNgftxL8cYJjpg2cBhCNJmFCgw1Km0LbWwEgsDemjljE7gsmgGmjXnSyLGJWznTfXplskk
	c2wxR6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5l5p-00000005a1K-0rRt;
	Thu, 26 Mar 2026 13:49:49 +0000
Received: from mail-northcentralusazon11010049.outbound.protection.outlook.com ([52.101.193.49] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5l5l-00000005a0w-3PnD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:49:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhSnJMmn2mYRaIID2f+b2V/vLRUcopWCJ/HEn3/4mcW8aoodzMCHLhPVR8U3zvw0zyCD/dsTWwe45WGVwdtB0kbQ+zAWUBgdu6J1IG/k227B9s5cSM0mpXqygRsHq60lhfIaG5klDtvXO/OfaI8QDrXISR95X8QwEdhTemew7WUToTQ2qroZt9lh9JoHLVUvwwocVjGvcsrtt5VapYn2VU0+4Lqn5DZ6sgEZn4LW3JArB2fcJKGStElv4c8fRnUO/ocaNdx129emwBnsXo17Y8i8P5n0UJPUbqsLhav31rRHVQVAfhrBrgZIiOTBeqLg7DUClwpsE3XS+R0NNchBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcuBciYJaURuvmrN0El+EmdiCnn6gDTtubutA/kj+Jk=;
 b=FLKJ7BjmmwZoM5Puc1y+SV3hu/hlwr/rd7nwgdRluyc5nNOvZS0BAv0nsAusNYKhE78lsNHpx3oFuFYCctL0WCSYl9sl/qkjfidGjzuQzNNe380+4/Frtl3QiAmWYmSZSitF0kkfJtuRVEwcsFntCDnSMQgN3xX8vgTxEMoBDPVr4mf6hzfnzHnMivWtSE1HWI+vbXdndqvwgXQB5YbAsysBPeazSqGYw8Y5QP76SZ2oOzX5szj4YqjBJItXLtBzcWSDxw7R6oUhUMQcDHJD8jeFqdus6TE6WFlg/BLJXxSCW9mPBLcTv8uq+qeduhrgl7YudNES+oKU5f8C8/gcpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcuBciYJaURuvmrN0El+EmdiCnn6gDTtubutA/kj+Jk=;
 b=Z8/ZkeQQBOXSH/lOZkjAHF125CxN81iV84BoHNBO81p2Gkc3SYPqTPqM+W9G8KNYzhUICTby7n9CqByRRD4ZM17JgUgrArwGtbwtgJmDa0dof9NolvCLN26Myyp+haYz5ea06LXt6syUjdG2tf0ZE/A6nEKmEQSsXE9lDkYFmDI=
Received: from BY3PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:254::35)
 by CY8PR10MB6562.namprd10.prod.outlook.com (2603:10b6:930:5a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 13:49:40 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::2f) by BY3PR05CA0030.outlook.office365.com
 (2603:10b6:a03:254::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21 via Frontend Transport; Thu,
 26 Mar 2026 13:49:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 13:49:38 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 08:49:31 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 08:49:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 08:49:31 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.231.164])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62QDnUPo1747784;
	Thu, 26 Mar 2026 08:49:31 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Davis <afd@ti.com>,
	"Conor Dooley" <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <c-vankar@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j7200: Fix QSGMII overlay by adding SERDES PHY
Date: Thu, 26 Mar 2026 19:19:29 +0530
Message-ID: <20260326134929.1696750-1-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|CY8PR10MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: b512cfab-c675-4a5e-6945-08de8b3e8608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: QjRcwJRDqG/zwO6Ga2yt6tp6iadV4jfUuENtp4wkroK15GKEo6FhMYspkGXsT65+yTEI5ErfvvR8xZmVrNDeLdICg1ISQZJlIdccZyMGgPcUtyJK3N5Wi3uhAiGmVHdU5ytn+t2BLNbH/gHG/q8G2RJ4JXUkcaWRwwt7An/rI9QHtPFXwJ/P8TDJxnJAP3o2UqYCDC3ojWJuy8/zhw9LWLz7joFKu8ihqjgW/VXBIFP0oaME/wWaZbYu4h4hRapggpWc97dAWAt3szsqrebPKT1yQffMMhCwF660hZwLbSoBXXi1BffaT+5K1A4Q1txPX7RqojkVFu01RoIzAak21edB0eNU8RFnPs1CKt69/KSLMkLi9pi5BHBw10mq9VbmMc8xKZhwWC5+0vT9+pAuRwTTKcQ0MZM/IrUynoljPksukgL9DgdPf0rrsQaQvDg5TY4PgWZG8bQRy0WeUYUcA/xQAz4vxGHkcMNAu2sFvXOx1H72lbSIJCig/wBNRjsTJbTVzh8N9J4ZN0bwgnv6ivHATmXLcPZLP6mt0yh9VdP7uUx/92QQGxtsBkkbujVvhm9EfhE8BP9gGJis2Cf6eTwJip8/3GX/MmvwZhhRjnzUZbFx1ZP4bsvs/mWSQh3RXGjC5R2loU5EX7x8AR6w/YNC+I8cgjHsnoSbIuVIlrrEqq1hpHckUjHgqrZCKCIeTeenfKSXhPXlhb6qcAbkANX9lBi4+ZwjTddcCMAmNJ1lJiI0rxjs54mQfPZLO/bwcCbCPzVOONsyVeeZ9ZGJ7Q==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U0ceJx62pmX+5SIlI5JuFKKigcaEQbkxtRz9HC+E5vp795ZDVrRQJYfjtNhZBUlOUbc2Wl105ApPPyhoNF59V3o3lHaLLRKiHfpof4xkCehKTYtMjld8wCc9cjGVWr215ZCMMPUDjbp6fIoiIuFjaX25m5j277qBcUINtiTzMWrwQuPZK5oYJPK9cFm+/Rl/tkGiM/kbwf2nURupZYi55EdkPJsmpYniDOT4inMKA2GK0Vlg6Y0v9Vmm69rejfM7jdDnpoLeVBgH27Blorzb25CqGdDdUPs0YE+WJJZTxjLTBxt4Svig3gV9B1pagQ71VBORb49AMHJKVdCUw3Zp2L/Sv2XhSzkc0uPmRaOEFaeeLUOw6qfCBHJDidydfT85/A9spSWXEKBuIKBL5UVudzq2wuvprMymZOZtwYcGTFK0J4jvu/TnBYsI3H4lORoi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 13:49:38.4853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b512cfab-c675-4a5e-6945-08de8b3e8608
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6562
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_064945_977950_CD960B16 
X-CRM114-Status: UNSURE (   9.54  )
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

For CPSW5G QSGMII ports, CPSW assumes SERDES to be configured. Since it
may not be always true, add SERDES phys to guarantee it.

Fixes: 496cdc82e05f ("arm64: dts: ti: k3-j7200: Add overlay to enable CPSW5G ports in QSGMII mode")
Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---

This patch is based on commit "0138af2472df" of origin/master branch of
Linux repo.

 arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso b/arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso
index 6432ca08ee8e..4824d53c95bb 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso
@@ -32,7 +32,8 @@ &cpsw0_port1 {
 	phy-handle = <&cpsw5g_phy0>;
 	phy-mode = "qsgmii";
 	mac-address = [00 00 00 00 00 00];
-	phys = <&cpsw0_phy_gmii_sel 1>;
+	phys = <&cpsw0_phy_gmii_sel 1>, <&serdes0_qsgmii_link>;
+	phy-names = "mac", "serdes";
 };
 
 &cpsw0_port2 {
-- 
2.34.1



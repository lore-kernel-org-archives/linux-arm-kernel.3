Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCD3FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qziiPtUUrqH/0snOYOthfwzUGOBEGicaHa4w1UpRjsc=; b=qIeuoBWHlHN4RO5IStbLtqRHl0
	E59YH8ANUyFqJ7U10m5rf6As8mGVRsqkBjNSNb+V0B46mFsJudhEHETIjriplV4095Ny39fJ1mPMB
	1E8UCk9lR3EaGK/RWIexsWSqu6Y9YVcq52DKRRuHFucFnWhEkdgMe/2Ed5ZxTPPAm4+WljcLkqwrY
	rXnSiR1S0ztA1HvJze8/rDHhxe5xUW/BFVy12RKCSp/yGr0g5buDaEEasMY8lcwbmQjkwQ2/DqaMh
	oR6Lt5AKZgjQpYa5GHdMdpGC261XFyIc2xFG06RvDDcZcv79uWPagMf20DaEhU3hmNKtm8VkjZqYS
	GlaBTVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDa2-0000000FzMH-13go;
	Tue, 05 May 2026 11:04:46 +0000
Received: from mail-eastusazon11012006.outbound.protection.outlook.com ([52.101.53.6] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDZz-0000000FzKp-3FXX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:04:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x88WdsxGb8NMs/iJAXLGotNT0hr042MRyU4JEaFEjFv0CGXSQlIZjtO8aPE3vlD1yvV15yXeLnAr6gZhlz8z65gUNz+VgI3Y2nifrBA4b2CIDrzUoLiQBD7R0EipGWumD/VCB3yIXa6+ANunGaOzc7+UOSKfCkDJnnhwt4usdPKYQCE5Fcqj8l3FQjzZEfGz5HE2xWuev9KzR5cVFTd5SjVFGEaffEG/LukvdD2c70HPtSa53dYXDZLHH1S5wTL35wx5S6qSQKgyGW6swDLSWhCcMH5wszfnTAs2n9p9c4UuXp9GJbIhFiZ/9Hwyg1Emq67C9uBFOohUcZsaDR8Pew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qziiPtUUrqH/0snOYOthfwzUGOBEGicaHa4w1UpRjsc=;
 b=Hd00QvUBj+0tlq2dY/mph7hoGnUCxCymR7BCeB0NvS9Uev5tmL4Qcdie4UBhSZ0D1lG6d/x5Flnmb0ZcYxyIjpOs0gJhi/D+wTRijhJiPg5R7czKIYTYzgDVeKVyQUerSv9j/+WmWbZn4Aq01Ffq0wKXqUo2su2FktcAa9fv/bB+6ztj7htuzFIplwgtl7CAbB6QUzvbr7r/d3EFhCqI4NCMq0HjbsxkajahspBGBC8wUIjtjaA8DTR/vuFoNavoSGwL8XgFDudSKKE78+YxrMSTxoB6wv292waEa4ux6JP3casMgDdM0mG/L8eHLfthoFz5NjoXFl02xAdyubpaQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qziiPtUUrqH/0snOYOthfwzUGOBEGicaHa4w1UpRjsc=;
 b=czUPouJAn31XLRNcceoy6bjkOdh0GrOJNpg9vOubv/T3pIj8rbCexFIRauuBDUVPiZretdczVyHgm+bjmJaXUKCV3qCilVyCanGSsbwdLR06Cx2KAAkG0tv966/91CVb2aWlRBzJJWMZpPLWbiTKTG4ZQXR549wEHXbF7g1HJqQ=
Received: from SJ0PR05CA0156.namprd05.prod.outlook.com (2603:10b6:a03:339::11)
 by IA4PR10MB8541.namprd10.prod.outlook.com (2603:10b6:208:56b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:04:39 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::f9) by SJ0PR05CA0156.outlook.office365.com
 (2603:10b6:a03:339::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 11:04:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:04:38 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:04:37 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:04:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:04:36 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645B49h22831834;
	Tue, 5 May 2026 06:04:30 -0500
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
Subject: [PATCH 03/13] arm64: dts: ti: k3-am642-sk: fix USB clocking for compliance
Date: Tue, 5 May 2026 16:36:04 +0530
Message-ID: <20260505110631.1144200-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260505110631.1144200-1-s-vadapalli@ti.com>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|IA4PR10MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 40723dd6-e48d-4c73-7100-08deaa961999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: UIPvPzoe+bLrxW9LDn4wslmaFH617DsYFj/TSgdRWT3HGWptDNIGI2O9VyR+pr2LeDbXVPSlWmT42rqQ/lnHySppcAAT8XE1P36c2q5K+hgbvS/bS0ymWOXjdvvbAf4/LxAcqYQYwYHZrM51PXQm2yLybXxt2gePHKBKdSIhudaZdXMsn5nlmY7CdSX+71oiKQvSRokl2O4VHEOP9pf5GYhK8pk8Z/HJsSqLLGmb5QZNl0NKFu+B+Y6V9+2q/oVQXJGOKy53wMrKu+fem9j6USUFTU8vLxpLh1xKghGje+IhDEjZ4nY+/wQJVoRhA6APkWIFmNd8+ZqXqC0SR+2YZXMMdTIPSv4amGbPzFT0iKR0tIWvDOQ/Q9V/ZdbLhEAHrQkYD4ivhnMq7n9vSbUKCEY3PFA47KWcw1wdBb63c806goEGBax6Ooge5CBV4TFSWeGSQ24iXVm0NFWbu1wte4KNgQlSGvkWRDRFW8IbZnbAjbmzVcHiE3YYEezVsB1wEplSj9zuxScbAo/CpsHwo3/YwAf9IiY/QJmmwvVLAxW5Al+lhJO/Up7JiFa0RhGesHjTPkzxCtyBkfx3Ax9Ar7sN0BbCMTH2b+n8O/X5MsC/xYeqiGxpbTs+LYf3TWURbM5EO3ZIdYJi9OEXGbW3fWUQb5A3IZUbOVQgM9y5k+X0fgMVFVYifgKm6wwtSbqqbfsVTKqF0Sk/SjOiCAMAFHuKjAA6K0yk3A76k9VdVJioLbLUv4FUnFO9zoIUJCbuSZlKn5N81lDdvN0XTRvTwg==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7GY3VsKiVkTr1KhvJ1TOc+1jHQI45CS+8k/WtHiAqV3sbyjMyKIT0eKu55hvVotRV7oH79YzZ9eom/blfOHujDiY68NOCiLjSzH57ZkEDNmsvlJkqwdQ8HSSLKsXnF9v9fWASu9FVwvTMiUv6DB+wSulKFe9m66vx51AXo7EefCEgZDfcpdH3jl0lLZj75g4/hR0G72wSxS2kMwuB4b/huo6HB+d4m5jCG5xudlpOSmxzWWQ5XZnOgoBe+fIIkNfYYzbV8YnX3VwXsVvoZDMWlOf2HX6UYVbxT57NviWiGDNePs7HZVfIA4mAU63PGa86ATWvw41hzBrctyQhwK/IIT0yEcr7suUfCoXr1Ba9RoFVJcbECIV+r7RF91zDVaYHg3A1uTyxm4Q7wG+YzlRu9GaNljcL22tlj7YdpFwORlRd82OMRgTLDjeDbfVC0O5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:04:38.3158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40723dd6-e48d-4c73-7100-08deaa961999
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8541
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040443_815722_D1783106 
X-CRM114-Status: UNSURE (   9.88  )
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

From: Luis Parga <luis.parga@ti.com>

According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
the USB 3.2 Specification, SSC should be enabled by default. This protects
against EMI violations. Hence, enable internal SSC for USB SuperSpeed.

Fixes: 4e8aa4e3559a ("arm64: dts: ti: k3-am642-sk: Enable USB Super-Speed HOST port")
Cc: <stable@vger.kernel.org>
Signed-off-by: Luis Parga <luis.parga@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-sk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index d28a38c87f32..9f63fea5e6a4 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -463,6 +463,11 @@ &serdes_refclk {
 
 &serdes_wiz0 {
 	bootph-all;
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
 };
 
 &serdes0 {
@@ -473,6 +478,7 @@ serdes0_usb_link: phy@0 {
 		cdns,num-lanes = <1>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz0 1>;
 	};
 };
-- 
2.51.1



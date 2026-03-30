Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2C910D14AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SU298OAIE11ocQTjhKba/yP+OoZH3h1N6NJC0Fscw3o=; b=rOGkib8Or/VySwW7E6kjZIl0Vy
	CsPMMndrjxKeJnwRx8DT7KXd30SnGi1YoiwQgteFn5gC3YbAPpL1InwaXlPAjx3HYoqR5JZfqUYfb
	wrsifBWs6ZxJ8zZ/m2LnmzBdt8ribjsIg3vpvPcQeA8vNWb3q4x6O9vphXYh0XhY63G1bLYdW93OH
	zbxIeTN7rz/RiXyAWB77NKgIN/IKOKhK/r5utIiX0LxEOF09PZCDm8aMyJ2/LXjMQXcTZi0K/uDMq
	xW9le95qs8J8Pw3MUDdqbu+PhBWi2miEX2PGO6rmgIR+R+FvzQ4zfVg6C1DgzEBLnh04Mp8X9IuYP
	mhVm4mqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BXy-0000000BEXD-3N0S;
	Mon, 30 Mar 2026 12:16:46 +0000
Received: from mail-eastus2azon11011022.outbound.protection.outlook.com ([52.101.57.22] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BXv-0000000BEU5-3ghp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:16:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGHnQ0kMiNFHIQIfD6VQ9TXhXFlsxP/jv5LPddB/dYbhjA75Qun51NTXDBI3YgVEyQh0vKd0htuJLQUsObNA39j7xx6JvCK0lT1D+iINOtT5fBeDBsRw9T2AUJW1il9qk2X4vg+jgzukeIhqy850HArORahHj+eW/EZJcU8o9MBZqVYsTx4eW1NRoB1U+4qNIixROf66NskIPDLX5QcpJu17vszHyQDZPRRn29IWfA3dv1ubkFjM5+aKC79fAGT40EpoKOw8GxSokRJEo9tyjOH1ly3cU6BbQwaWQ7K8trs+3YZu8mKQrU916O7rOPic9dtO2crabuh/eNitHXsyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SU298OAIE11ocQTjhKba/yP+OoZH3h1N6NJC0Fscw3o=;
 b=PJ7lde+G143Uw9Yw/nihQFgAxhUNyNTQD3QnOXfX0Odvn1s4lFum/vJ4VY/WJHaBSaoqbFKt3RrSS/UKYr9VUfe/oFu+3QlWvYPy8ZnrIWDh/yZQJ2KXj7YG9LaGQfkEOVikp/zKkuV+4p7B1MN6gbnamBRRWmwTMLbZhwLoarq6d9qgssBBxS1/y/TcRvphmfn/F2ALKIqXd3lcJU9cshjcAPjgKAldNT4H6BIzbRonFfpBcqGOLQKe9Ku6AdZCOTlGjnUNbGCHHgAJPbhEdXYJQM8A7IqxzL9hWXY0Z1lp74QNVW3MFqAhM6wTS2jveYhFCX0+gfk+BPrYHIPoSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU298OAIE11ocQTjhKba/yP+OoZH3h1N6NJC0Fscw3o=;
 b=SNiDxM+5f1Jn5wUaGZv3CT1lsIGfrC7jeOVzpM880sUulj1JXCBKgfQIopoH/sBbFKecvWq8dJP0Nf/41os2wb9c8VsxMk07+ZDwdA5d1bXkyoVFWdqoZ62v4px4TwwvjQeAB7BY+4JKkxvowSg5+bvP5nlym+/cxle5kWKt1Ic=
Received: from SJ0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:33a::24)
 by SA2PR10MB4731.namprd10.prod.outlook.com (2603:10b6:806:11e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 12:01:42 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::69) by SJ0PR03CA0019.outlook.office365.com
 (2603:10b6:a03:33a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.27 via Frontend Transport; Mon,
 30 Mar 2026 12:01:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 12:01:41 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 07:01:38 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 07:01:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 30 Mar 2026 07:01:37 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.91])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62UC18tG242506;
	Mon, 30 Mar 2026 07:01:33 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<rafael@kernel.org>, <viresh.kumar@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>, <d-gole@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <k-willis@ti.com>,
	<a-kaur@ti.com>
Subject: [PATCH 4/5] arm64: dts: ti: k3-am62p5: Add ti,soc-info to OPP table
Date: Mon, 30 Mar 2026 17:31:04 +0530
Message-ID: <20260330120105.2985200-5-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330120105.2985200-1-a-kaur@ti.com>
References: <20260330120105.2985200-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|SA2PR10MB4731:EE_
X-MS-Office365-Filtering-Correlation-Id: e1147562-cc17-4287-cdd9-08de8e541b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IQnFT/zbTiDg49GkClGOmpPkA6p3NqW8DbkWPRWROL5GPlBumo/gG92u/AZ0RCoBYWMY/TusAZlO/luvNIVVWATcRpz3dDrlBefAdvSTBzs/lpiU4re+1J152DyQ3FrK1mx6Wh+zFnuq7c4OE+cYFFpCMSb8l2ARHEP+T1HFUIF30/nSoyRPVT5noDyX7E2cnzrnsRPZxqoxJmWCHYJnunw0yPv/YTJGpHHTrz9KezVee2PIgFwG1SXBYzxr9bAiL1MYujWEdXuVp2rQYVp9uVe8V3dla0fNFLugL6V9QZYBv8xywTDnKvAN6hJ/tSpdAoA75fsaAAeyQ5YEfqUSwsUaZfx+sthKRz+KbybtTDDM5iNtXbLs0BWiRzSOZT/zOYVgUlurK4gf/aBf6Q84S3d12ntZSx+PA7PcpRsFoaxDveNy6vxe+MsVqL0hn6NBUHnXAPc6KSyRG1tJjbEK1GCTRz2zmt1BB1UzcxPbi2U83MQJ1LcamkumYXJUBvVy+AVv0dKw6bHC8TLj/6ouRuQJsCeEsaX7AWRQYCBr2TUP+eveUTOqSJCJasr4TYDQQJX0YPOMoOD8wdo/p8n7n1TVUql4EI5qCp8lUG8GH4puibDQQs+jZxKPv+SWJn3rGpwm76XG8O4mop8qe+TaDaUnnv1LbdnQFLhq9FbDALs1iCeis2Chr21klHAGDidykD2zx9fBZbFGckbUHBuAe15WXeG8tveRXAjbcHSGRKxDrszVnhCG61GQN1ZynYP6vQKy4V5PIGPUoRmuWt+OFs7wV7XHWMamG2WM2xL8o3t9q5UiIHzENEA1UfZkFGj2
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Y4nZFHz/igBsxeMOfRwzpvTgijq+eeeBw1wpE90O6635/Q5+KIcJB5nwqPdEUiiDvBGUcfwgIktUDbymsqMGPxdj/hS/V5179U360PznTEd5TJRt3YutsjpzkIy60cuy3/5FBsvXKfLEotmjduj7iSpOGmuke6Dl/jN3Xpn7v011yvO70mZNOc97i9D6bQCzocw/y0Ea5TVo2OviFpCF5n53ConEDEGvqM1KXJFR3MVVzvlI2HmqIhRrABuG3xkxe4Cqo62LHzeaaw+HF13/kbYLoJxqRHBPArZpYXlxC0FowQmzzDL+3OoBa2avoM7ZX8nPtiLru5HH04ZWuzdywbZUXtDulT6/B5hxlvniH9qtyIAt+fDZoZSA0+l/dJSoIq/KOFGqsC9yIk6QruL85FCHpY9ykA9LvRxsdl+DQq4sI80KfGWbHqvZ25tOJPJM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 12:01:41.6232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1147562-cc17-4287-cdd9-08de8e541b2d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_051643_912534_9BEF9E11 
X-CRM114-Status: UNSURE (   8.64  )
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

Link CPU OPP table to k3-socinfo driver for dependency tracking.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
index 8982a7b9f1a6..1a498c5eb3d1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
@@ -108,6 +108,7 @@ a53_opp_table: opp-table {
 		compatible = "operating-points-v2-ti-cpu";
 		opp-shared;
 		syscon = <&opp_efuse_table>;
+		ti,soc-info = <&chipid>;
 
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9220CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyYy1o8R9oQHaT/NExG5bp7ZcJj/miWnDRe15o8VAMw=; b=P+hekugzLvvWatT6tdO8Y49J8x
	6mYhoV6F0tx1l7begNESRDFsrgmZwmCMJ7k2kSFoZ5OHSQ7BbZUe56hNoFLrtbeYyKQGWfP+BzRfm
	GfU9rc+65e0GTjMeJfoAJpYIn53Hz6Fk/KHAiAicT5AD0Cw2mprySYfgUkZarVk0QuteFy/DvfI+h
	QoYEh0IYAYPZBwFbjd+W9awDl7y+f8OrO8yzPdceDezvKUoIgcmcy3kSk9ywaJnttkMiGwDyCd8Q/
	Hr8a8zxjN6sVmybTKHHAYlnzD+VeGWoBOy7yzfphhIbZ4mU/29jmmUxAOJ9RyxllRjl5y+lsj5Jg9
	kh6fNTDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDaV-0000000Fzgb-24pl;
	Tue, 05 May 2026 11:05:15 +0000
Received: from mail-westus2azon11012011.outbound.protection.outlook.com ([52.101.48.11] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDaS-0000000Fzdk-17kY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:05:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g68cbR/fFVCQbyAEDbBM1JEmGbhvLTRCzQ6hwj1cgF6R9w+m9J+aGovF8vmjWxIOh+Y6/udaoADfivWMJdo8ql9woUk7m1I8+Uco1kSfRjB8ntMoQ+17VbGH4HjevkfM7SM6q47ygAJixxCJ4SKoKobNWwDLkIg4SreGz0LpAZG3hebyYNTq9K/7arCQ6aTIvU4TUx7Y2aQsub6rkyT/5jT2HBsrjAARbOP+Z+YxmIyAb31sGWzk67wky8KtWkwMD57LAJtPD3GI68672i1b1tE+hm9ACwdZ5Bi2vRn911VpI6aLigQGj9DrECjP6UCJhxcDsSvwf7A6UMro61xfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyYy1o8R9oQHaT/NExG5bp7ZcJj/miWnDRe15o8VAMw=;
 b=dKdqFnvKW9KXZrE4+18j6csGWKilCesrAOPpUsqcVCN9B4iByFEV3aCdYTELah6K+m7udyivJniMcScxRh71Wq3GIavoio2c2quqS946ajFzlxrbDqyMR5N82jiRGDU+eplUxw1dIdTLDusBBjTKQY+shWlUMzC+4jQco5S1Qc8kBw9hz1RIB0p027A3KoU7Ixwrnc0ilkgihAvZbORfy8h6/bXD8wcW7AgwieGIlfRtoeZg9CAtCutnn8/UvijaLyKdbzbFvGVHI2LW1tOoh5PWcxnanNOzd8f7df6mKzRzlMLYlGVGg/Mb6Ztgygg62gar/SJzVbfYkXAeE85Vvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyYy1o8R9oQHaT/NExG5bp7ZcJj/miWnDRe15o8VAMw=;
 b=Q7skuPfnmFPIaS86KgBQSAAwyx5AoneWVm5Z0Uo8Qt7BFbSQgd5ntF66tNEqFggaBYHvrgYP695rYTWvOB8S6VKfWe6BuCvwCypqb1zEy5+Hth64z5uLLje2EYB4Iy2MdDReEpuKp40q0EEmAQd6nfJMpnYJv9hRy0j7jMWIPEM=
Received: from SJ0PR03CA0116.namprd03.prod.outlook.com (2603:10b6:a03:333::31)
 by PH7PR10MB7839.namprd10.prod.outlook.com (2603:10b6:510:2ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:05:06 +0000
Received: from CO1PEPF00012E66.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::6a) by SJ0PR03CA0116.outlook.office365.com
 (2603:10b6:a03:333::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 11:05:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E66.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:05:06 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:05:04 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:05:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:05:04 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645B49h62831834;
	Tue, 5 May 2026 06:04:57 -0500
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
Subject: [PATCH 07/13] arm64: dts: ti: k3-am69-aquila: fix USB clocking for compliance
Date: Tue, 5 May 2026 16:36:08 +0530
Message-ID: <20260505110631.1144200-8-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260505110631.1144200-1-s-vadapalli@ti.com>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E66:EE_|PH7PR10MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c19962-304d-4bb2-28e3-08deaa962a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|7416014|1800799024|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: R3j+TNWWGEBupjS+xprIUrXRpoo4DSS72YR6imhlwtC5452zukfqk1Moiu6jt5MLKwB2wHodZE4zOQJKyl2BMvY+W7utlbbgn0cFcMVHCRnQSrtDeIACUDf5VZaH7uFztBxa0cEFI9HcqcxNLoeyKW9R4zMHWmn7efWJfkS6dFqOlt303ts0urromRA5bTkAclvBVQJkoEoF1Z93LsJApTpAchTtZAGREO8S75dAnbgKkNZwzY0+nq5w5OYp47lmRyw7NMHKRvOd+avCS5nA21zlp4J41RJ7A0jtkBva1zFGMkpN/ctJOWQ1v4SLbkLJCl+W30L53j2azDCUE2UfPgqU5Bdq3o2hjtnEEjhA9Kq/o2J5wmrq+2fJzp4sYc9imFrxglS6RHFpMT8neOqmzacGLbKTZ7CCfQFAnEwASVxe6vwe+zczSWItxspuLxm6heUloKUVbHLWjHP/r4WaGVHyYYx3aLqAs79FBm6XECRQxb3D/6udxvk3l49YJwpCkxkXj0G2h3lZaGQbU8FHRrWBEHnWjGWP+euof/Yvv3zDv6Rpw60k5hUotNuXbS2v0/Svs2uPl0zkcHuFB1gA+i8AEChzxTBGJkdC8rNjzlnjFuG3KYFSQGB6pgAPlMqE52XlxpTBH6E40pDgXUpnbO308gJk6De81rK9Hd66bVfKagvRAlU9S+cfhtm4D1p0L43gH9HvsWuyHXSyqLtfCfa9lnyIXr6B+9AqeATfgwPmab/9MLNV9qBo49f7ydZyqqv7xBA7mlIOMVTchSOACQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(7416014)(1800799024)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: F3xGOb61D80nxQdajQvqLKt6Zxm5iWOuno5hFoc5bg0KggHXu8wsaF3bP2ViUHprcTk30Ixf5XW+W8HNptbIRkI0+5QN3dm0W9CWSnIYCUOXi33de2N9+z+q8PaqDM1tA848n9DZZ+pPdl0MjtnIgAesuCn4y3aF59gXdZSX79CVP3fQNTWAIdCa3egL4W3lB91KO/befO59uhp+IeCFlHtEbRS1HmRqAXZ0x4PRLbIekDsfWAEzve4jOIdWKm/Cld2btZy+NvW23esTcjQ4XgPWyk4LtXFCA7/DMv5IK8RukHJ/7Mt5XVjh+5qvkbVbOOUEYxhgwcvH2sAcfQf3apTtYfZjDIR6SHtv55qdr5s4rRXoZQQAsedxND8O0QLFer6ClS8PIF7jYS1LZI4MQOyUgVYFxmFLuTbRenI7GqsALOIrQXh2vPjd2Ert1QGN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:05:06.1532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c19962-304d-4bb2-28e3-08deaa962a32
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E66.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040512_563994_B095ED49 
X-CRM114-Status: UNSURE (   9.53  )
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

According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
the USB 3.2 Specification, SSC should be enabled by default. This protects
against EMI violations. Hence, enable internal SSC for USB SuperSpeed.

Fixes: 39ac6623b1d8 ("arm64: dts: ti: Add Aquila AM69 Support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
index 5119baf62a4c..7c98ee81ccb5 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
@@ -1423,6 +1423,7 @@ serdes0_usb0_ss_link: phy@3 {
 		resets = <&serdes_wiz0 4>;
 		cdns,num-lanes = <1>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 	};
 };
 
@@ -1502,6 +1503,11 @@ &serdes_ln_ctrl {
 
 &serdes_wiz0 {
 	status = "okay";
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
 };
 
 &serdes_wiz1 {
-- 
2.51.1



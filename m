Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE51CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tMacfCHTLjhTUHmlyeFMaJm5hvn2qD5WagdQJM+8vc=; b=sJWXJqG+9KuXQUOetPFY7UCjyS
	/YL12+fIDshp6YeH8Md2J62oOjyJhlCJ0+zkc6lZf+j0F0cu9FfZn01O8CSQv4KXobty3UzUaOLsI
	xBaI94Go0etWE5qYov+h2jjRtE2y+8xzvgN96qKzIapDlt5eflAGtaa5zAndPbb8FolUAnlt87HAz
	fovL031Z0ql0+w/fhSjs9qzoeuL1/N04Qj1aeLdPRb7Y53h2G2jiJlj2+etHJ3Hs9Q/Q45Ig40woz
	QJZq1D/ivL0yR3GWQXSaxJbP06EXIXsTjaRV8UYbqngEnjBY1dAEmBckCZ/PFGWGEfqa/8Pzbpeyd
	icZeZPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcw9-000000010p4-2qtl;
	Wed, 06 May 2026 14:09:17 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcw8-000000010nl-1iuw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:09:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxG7Gsq/hv4gDMUFVVp/l/CpFY1MXn5w/KI5SeWir4XRpeY00yTr61tkMiMyYIMulPIjJ4nq4Tqkl9ga3OYlxVheVJepHXYbQqN81jrOj9jvNr+J70GiJ+zuNq3L+iodKjokHPMfPaCwlE3xD7yivIDVyVgur/PofoGspBXr1H7Mqp0j6M02jE8t9cPjm6s5EhNm4Q2f+myCfEkaVLLCyfeHL/tUrYvyZPcWZzwYi2DyRpZCPspT4OKu3xT7Vo4z0Ktu9nVFE8FiAt/Z8yXGHUQHP9mhD0X1wxjLEsvkOL12srFD5GV+oE4he87qgvgW9K5Mh6Izy/HzlTZ2Ip7deg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tMacfCHTLjhTUHmlyeFMaJm5hvn2qD5WagdQJM+8vc=;
 b=lS1wQD8S+SjIZDxO7z7HFsFhM632USk5BzJ2BzW48iZlzhqYuquObCfWdy8ORoWFrCZ+PqqNi5ge1ey36mw99df1xxrtSiCHEnVUmfcs6QinqJYEOiP5EC1NP5Vut20W2Zc6SxR8dm6iDAmo6AIuiFYbZ3kKGohTNNUv2eaNSkW72xFb2aXLf7/kwyTAmKwkd3aLNon3TZY9+Gc4PKmg/Wg7i+WHZKgdex8BNgOKmdW+iVobwqLBX9AWqIX23zjapJ1IeqSNV5kO7O0DDhrbM22I/f/M6fgrn3c7kOnRImwxofHDIX0G+TTU/xght1cvVMaWwYOW2L8dsueE2c4TJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tMacfCHTLjhTUHmlyeFMaJm5hvn2qD5WagdQJM+8vc=;
 b=Ibk17i85LLq4QCoM3OKyY1yTUxxtYCOtNT6qOMec0jktDeC7z4mYEhCRtjyaxdbowlD8muGE7bh2eMR6xKO9cQ8LSSkV4bVe3xx7pLTnjOvhg9Zj8QBjq5FBCSIfpXTi0IcGw/00NFXICluYUP++x5mtUL89JY2GjhUfmRKExg4=
Received: from SA0PR11CA0180.namprd11.prod.outlook.com (2603:10b6:806:1bb::35)
 by LV8PR10MB7966.namprd10.prod.outlook.com (2603:10b6:408:202::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Wed, 6 May
 2026 14:09:11 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::57) by SA0PR11CA0180.outlook.office365.com
 (2603:10b6:806:1bb::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 14:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 14:09:09 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:09:06 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:09:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 6 May 2026 09:09:05 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E8IWr1221395;
	Wed, 6 May 2026 09:08:59 -0500
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
Subject: [PATCH v2 06/13] arm64: dts: ti: k3-am68-sk-baseboard: fix USB clocking for compliance
Date: Wed, 6 May 2026 19:39:38 +0530
Message-ID: <20260506141040.1368918-7-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260506141040.1368918-1-s-vadapalli@ti.com>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|LV8PR10MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce9aaac-dfbe-4382-59fd-08deab790ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|7416014|82310400026|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: o5LnW8H1iuLwOcKz/mw9Nk6LzlUlWcXXh5V/OA4bVjGLSxEoe9fGYjZGBzVbm7f3rHWvdii2e58tTPu3UGchPpoxtiEYU1gfzwW7hqMvIf/Q7tHM41L8eCtj7IdnGQN6afkAgeNfnyrymAziqjUFlUpCL20WiueJ1hwYQhVoycSo0ERUL4WDtQy/brIHD+0DA7DZU0rKdS7QCi5Qp2qJIKsk3JxMlHQdMF46SEv/85PAOT4tVizYHPGFgx6NxHcUvguxd0NeSzsCaanv9lCOgMjZFoaarzav8kYLFxZ+ZLP24+UoikK5fkaKxcxJ+pZds4FMwXJpw1iceKfxQkE9wsSGbxCN8eCCi++LhZ5zeE3pg5BhrUoYWmBY5TDIPn7l6nfZ7r9ev0DrxMML5lavMxoaDHenIhMwPniiPH+prki8z/KIQvSEn+soRpGE1Hkl4/Q50zYExRMbmZjKpTX4nNlnEfjmkKkPMexoZapu2C6NpRfcVdNaQJufCLZFm9QHPpfQCtu5ZjEQfgwN05ScPb107mxY/tmLmIY3HXRpiF91O72LpyhgE8Q4bn0jEQAJ7LphRZDf5czikObW86xg6TzRO32ZNTl3oOUnh/6bOSdjB6JO6fK7Ev91eJBaclOPn4kgzhoqaTzZDljpTSV9a+iHPWpuAXcscoaTpy+kudkpRKr7oG3qr1pkWPQUZnExNoWCzT2k/vBkxxoJSL+wEz6VvsxITjOHEG0wK/Bd5hieRyiTFs2h3apb78J4j2oA/2AtQxIq4W71VjvWk5bHCVsp1OAcd4r5PX2vFLJpyFM=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(7416014)(82310400026)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: q+5r27uFsmuJk2L+e3YvLNE+ZEtCf2PdkfQ4a2DMsBIproczru06HMzRm+3LIzLezAda1Y9CMVR8cJ23KnwMypnN5aXo8jvVpDdJqfzeftv9n6qnzhGsxEfpXU18ddry0SrCGOsE8OL20UN2tqqUoCnmfpnbic3SH8tlMrPsdYo89bBD3PlnlPfII181MuL0//h7kmXORbyr6PDO/VcgOCB7IOIqQHz0NfsyYw+bILng2c5aZzF+P2VFuvbWYj5ksJQ0iYjxYRlHqTMFCxEKOYG4CDjsUjTmMiemER7+wvPkrigsa5Oq03jmpRugjDJQPcL1xJnkD70k/idcKMKAFQpr+b9iLpWPEARnQQpa/2BTndeuPJ0PkXtB7VCmWELOonmFpmnm5gdfDg4HdM1kChAMN5s3ffGmtCM3CXUngLtjbcr0YEN7IvLCcQ/J4WYz
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:09:09.4346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce9aaac-dfbe-4382-59fd-08deab790ae1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_070916_451179_5CA9C846 
X-CRM114-Status: GOOD (  10.62  )
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

Fixes: 067878e6cd25 ("arm64: dts: ti: k3-am68-sk: Add DT node for USB")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1:
https://lore.kernel.org/r/20260505110631.1144200-7-s-vadapalli@ti.com/
No changes since v1.

 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index 8178333fb2b4..d44c3685503c 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -793,6 +793,14 @@ &serdes_refclk {
 	clock-frequency = <100000000>;
 };
 
+&serdes_wiz0 {
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
+};
+
 &serdes0 {
 	status = "okay";
 
@@ -810,6 +818,7 @@ serdes0_usb_link: phy@2 {
 		cdns,num-lanes = <1>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz0 3>;
 	};
 };
-- 
2.51.1



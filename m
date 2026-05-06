Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C316CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsPtpokJjeQtOjNs0PPBckEef/JByEKg22KHbbbffyg=; b=CrZ3UdhrwARt7Jr6mLgTZXpwYR
	pfsx35A9olSh9vfRSbPKGsl6HkVP3mwTWIQdS3BpOLzcwt9E2Km4NaH3zv6dbRWUGPuBCgess4ivj
	w/ZT7etzXjiEg89ebmVOGmGaO+e78oYekieuZFgyd0VHIhxHRo6uBOhrJ7o/hVNQytGhxNp0kSIxt
	dt9m2yTvsG5GjuDM8OgCTW+52mJR18HfL2mqmtsJ7LHk6I86sqo9ZdUJc7jqVlAbVnSYwkzI6SAnP
	qb9imXQtrd/Wy+0m8i4Si9czyGQmrv4W7DPeBm1BSgU3fd1H+RadcU18j7qCKBs9prUp6zG9aKbzP
	ofUpUDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcwD-000000010t1-3vMs;
	Wed, 06 May 2026 14:09:21 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcwB-000000010q3-2vG3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQTpcD50uLGFVTO3QQzHywsJpxlg8IzevfUgKsR708GsNwBv7zHP1GshgiA8jktb5FAkXDqwNaPfx3G4XI4Ww+VvYGm7AbsVVlzGez53hJWCtrF+KwpRtpllPXlMvDa3CJpmiSktIBuk5GVlQl6mXEN/W19cSle4l/DO4jX7VDFM7JBkeEwd8415lNVPHyV6gvfwpfETBaCidUdRWMQx50AH67dtXv1LVxENjdtyhC/2FkukfbXa99kcGVyOn7HKUxjHsxwjuNKqOn8CXwKVSLM8PLUku1/1YhNkDL4cePUEPMkRdOLXXQireZjKHLEOgvP9zG8J66v2yv+IZsaNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsPtpokJjeQtOjNs0PPBckEef/JByEKg22KHbbbffyg=;
 b=Pe0gDJpLeK9Uf6S2mJiTL9cz5k4txosU0tcx2xuzsnv/DEU7516gi8NERj4RRr8411tbCS5N3wqPtUxFWK9oWVmK3vQk4IhSob4UkVprRyyenKyXOQtIMk7wIDsr4ddNf1dm88Gyxm660lW0PVBm9R9KzP4ajzUTsF4oshbGXlPv2MbHaM1ATg59vYvS5BhLgq+CG6LzGR6Xo03SQ8l4rE8iCZpfiE9pdLnXqIPSOB5gzu9tJPwwqUJ3REhqDOK3yo2w6hDlp6g9kmw6zEpSEbH/p336mOvw8spAk/hDADwQMlEbBhng8MS/JCEo3qG/jYW1di2q2QXEsaXCSubFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsPtpokJjeQtOjNs0PPBckEef/JByEKg22KHbbbffyg=;
 b=h+uhXZq7VMAckrLkeXXoHVFKHaaiMoWB4OsdeFRIIN8HotfTP9MmXJfj7fMSjdb4TGWGc83iKH+ODm/Ow1YwSdzD59x/i7WmEUQk2eAv/t4PAIDxqUnUwkctgJEIbG/jexN+BoD/K3L/jXCm6f6oXkjYoAUxpD12QrdDTFD3Vrw=
Received: from BL1PR13CA0399.namprd13.prod.outlook.com (2603:10b6:208:2c2::14)
 by IA1PR10MB7116.namprd10.prod.outlook.com (2603:10b6:208:3f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 14:09:14 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::d7) by BL1PR13CA0399.outlook.office365.com
 (2603:10b6:208:2c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 14:09:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 14:09:13 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:09:12 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:09:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 6 May 2026 09:09:12 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E8IWs1221395;
	Wed, 6 May 2026 09:09:06 -0500
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
Subject: [PATCH v2 07/13] arm64: dts: ti: k3-am69-aquila: fix USB clocking for compliance
Date: Wed, 6 May 2026 19:39:39 +0530
Message-ID: <20260506141040.1368918-8-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260506141040.1368918-1-s-vadapalli@ti.com>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|IA1PR10MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a4c4e0-08f3-4ec7-83a2-08deab790d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: KChCdl8pR0YB2xgEdR4XZSCgkF8EHGOCsoEKu1ueKluYvxYsrYqb++xs4VnDwoFTlCgRWgMiMK7Eh+eYdNcqIZpzCq6Z3MoBknHfAlYuMtpNMaYavOHh9rFHvOol93T9xwEeino87y2iJU6i8IWKlxfaFvCFD0xIqiZxOMBdz2H4Il2vzCccy8dS/sBKi9jiYSQzSVpIFx93aaTObCTd1tgyYl5j3p5hYPIYIHi8ANiVdZLsQHDVwaX4r/uHlHiYdTYxoWSdG1cfkfKjgaHaaDIeftBVayAHLz2u4oQlk1G0RmOxsxmPNL+Zx+6WIPo6RE51HoD+Rect3Q1QiEueLDTPqxdxsc2I4S13/marmghmuKJErUXQ0a6ZGsciOMPSxQNh9sbVDSLMdLvZgxEWiHuCHUW5aNJ8TJGOoRf36+qyVd8k3EqRdzhfP6nxKMDQJmF3CXd2NQqpdlb/mWTqJqJ5OrP/ZgjrkRoHdfSTjckqwJF9nIkgzSH6aZ7aqq+TQ8x6/7CVotYAYWvD4IyNiQ33KwYl9eeioJHuvCEmOJVnMgKO6lbvOUY3MqQjKVJAt1Gt9zMEvwlPUAwK5mWbWQoPciT/tpg3KpeDjpkpoRKyCkkk3XWvHHfYeBDt46sRb2Dyr1JCeBe7NpmZSMh3xb1xbZflrV5qsNZ9hh5y8gNjp+FVe24d75u7xNjbnUoDDLq7Ht4RXZ48chQPjqgj1HudLFQgq26qg+PX56u12HYG3NDAZVDne7MAcjZEqnlPBnUk/+WuV4Kvc3kdYpKE+hX2/RAzWAQhGx/H5TrGhc4=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kkNY0tknsP29a6mPD23ueNJstUZ0eLSGWP+n+LcZ8EtKYu/T8dBp54T8b3y+OP3qH7lq1tL3ly8nE8OLYQIgQ1BSZeVbW/kRNhIzXFjtdQfZWQMH6vpmfp9fVTcSW7VyeBvmMUJytmxyHPyJIifhsakFxqYjwERpa6kX2gDXK8+Bq4mf0/CXZ3ahYu6mRo62Rw6mt/QJPE22dbfB8bXOEH5yxUNacxzV5JWldqslSJDfAeRsEbMwCfUotaCV7DF1NReBQQikpZ2k+imsBYFhq2SPTuqqs4wdP/ZzX3oLqrHxZzwMc5k6eqmKxzCOmkCytYNQvGaM5lL/CrCJG2nJh7TUPkrPcC+TdVXdKyMB8FsQRhANL7ZO/E2hKB/4BOXU4opiepT1PGSYdZgZJOgO/+iCuCl49o82SqxEeLjhmq5pTUEie/oGjp254QUOCBOk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:09:13.3598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a4c4e0-08f3-4ec7-83a2-08deab790d3f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_070919_741004_61967FB0 
X-CRM114-Status: GOOD (  10.34  )
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

v1:
https://lore.kernel.org/r/20260505110631.1144200-8-s-vadapalli@ti.com/
Changes since v1:
- Reordered properties in serdes_wiz0 node to place status at the end.

 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
index 5119baf62a4c..a5228a7d8339 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
@@ -1423,6 +1423,7 @@ serdes0_usb0_ss_link: phy@3 {
 		resets = <&serdes_wiz0 4>;
 		cdns,num-lanes = <1>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 	};
 };
 
@@ -1501,6 +1502,11 @@ &serdes_ln_ctrl {
 };
 
 &serdes_wiz0 {
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
 	status = "okay";
 };
 
-- 
2.51.1



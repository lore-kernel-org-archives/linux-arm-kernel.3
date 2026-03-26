Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F27F103A9A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 07:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TA32HFgYr7oc8pb+YIlVVW7lK7AkQc2kpa5muguqv4s=; b=zPUX42EV9PltVni5fHQKrIgnN3
	BEClQd+589uVUWSe/K7v7YrN0vICeEIKDKihom8c51WONhrWuntIS08J097HTnT4TTDvHWSkMOoM0
	kve4r6hqr/apdQU0fmSHZTuPvXY2NXvue28xQ+Zoxe4NxegXZ+cbJ8tcjUUyPmzG7IU3Y9pCXxxHF
	Sh5RbYEZTjqvIsMWjzGpQycYiRw2Ncnn+cGugp3l45j+3m0nYFT2hzgrOxkRZ1tyX97HxIktB7CWD
	rT9poe4mTFcYmB804VqxTFfXegeiZyPVvRSethO0G5kZ8olEO/hzftBa6eZ+tp/cD3FoEn/wGB0ou
	KwKj5Iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f3N-00000004utc-2SMF;
	Thu, 26 Mar 2026 07:22:53 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f3K-00000004ut7-1Jjh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 07:22:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlJXM/EnuRQXTn/PxWj0PQUCXhF81AMFsMwEMpZqnB/F+5GkdCz9tfvNmD9EZvKBryA4OmI6i6qmpPIy5RtBSsWLY2SNzP2SGgH42GUfNwK6UamulAdnyXHW7ReokLmXpxJrSXKMe8ZWYKS3+/hGmRdqZqhzZEwZ/7gktctLX8d7c2wQJYBuO7FMGQHkGyKSS3MRV34NnEUw/h7gihuxZr9m/KjyX0L2j3eFCN5Ern+n0vVdloWB50qT9C3MC/jRc4wBGzqLf8MRHls3YEU74oc6IioGkSwWXPzZLxBi6ccEBonUzhvGOSjEsAMSf1tu94CjY2/v5SO2iCuYbgp3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TA32HFgYr7oc8pb+YIlVVW7lK7AkQc2kpa5muguqv4s=;
 b=KkwRMYAbHBNGHRtW5NBvcnpRLYXeLeXUB+R1F3urkehn7tccz70z687r5ctXDb9jU60jkWTMkmQoNhWyUDgiDKl2f8GIfSyp6Efm74yT/D1JCoqZzt0OXT3EdovZsgTAfuCyGUsBOJLxkDThjQNpDrQDqOZ+DBIMtfXgtFqwDiVzABVNXcZGpmbA7prtqMYdHipSvUXKEVxKYbYvxGGqbOu1iyF4SJ6Q+eY+/2iyyYDSjQroInVPJis2e5l7dPzGhk0C2spVNTHTCkQ6JfvLJCCaBCs9IE9SrEzFsjC18XM60VIakiQqgwTpEnHYgEMuYjXS40x9h4r8VIVWP3po7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TA32HFgYr7oc8pb+YIlVVW7lK7AkQc2kpa5muguqv4s=;
 b=JEhSGRQI6VmXyCBGtYz/zGsuuCws9pDyHgd4SKAoRn7qx+nzU5zPewFT2RcvqVCOJtPoag8qWBczQoVdVoK+/Njmyo8x/dpZJCadnY0vZmqfN3DHF+GiMegJ2menlWeSzxOUh2WhEDBqyrU63D/aBNK5c4f4kE5PSIXwFXM93mU=
Received: from SJ0PR13CA0040.namprd13.prod.outlook.com (2603:10b6:a03:2c2::15)
 by SN4PR10MB5557.namprd10.prod.outlook.com (2603:10b6:806:200::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Thu, 26 Mar
 2026 07:22:43 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::e8) by SJ0PR13CA0040.outlook.office365.com
 (2603:10b6:a03:2c2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Thu,
 26 Mar 2026 07:22:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 07:22:42 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:22:40 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 02:22:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 02:22:40 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.231.164])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q7MdHD1728538;
	Thu, 26 Mar 2026 02:22:40 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
	"Conor Dooley" <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <c-vankar@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j721e: Fix QSGMII overlay by adding SERDES PHY
Date: Thu, 26 Mar 2026 12:52:37 +0530
Message-ID: <20260326072237.1324027-1-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|SN4PR10MB5557:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa24e61-04a1-4548-79ce-08de8b08783b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: rRTk1VkhOfvEHBrPLut0S4M33r43E2YtAZciT2Ibgn6vPkutnTL8xdOd8ld2dZ1Pp2nXVtr93XEpopSVuqy278OC9CU+5OU/KyL5JV4oP7BD7g5sZSvsONTNjeNRUy0yGI5B+zKXnMdxMzydtfhdSu2dPAILUv+LPWPLgkwHfPEcV3EiC9gZQNgO80P58UM2Am4MYKqDDypy4OU+lW82gcaNPD3hwu2VXisPqS9AOYeZsoz/yybVz305n/D+2TWhfqDsUw29hJ5chq3uSiL0VklGtPsb9foZ+Il/Wjjo+p1bqvoDGYMUXojofLyzU9wS2pP+XKkWCfjNgxr+Cby7Km0eRW8n5+wf02k9od/w7R4ecDDSn7gcR76hxrC14IGr33cvLyOfjg4kNzGu6N2xir8e6Rgt5Jf9wntXtTyBNAf9RH4Ns0kVDVlJbFW4Q1wSOKXZvoZ8nvtydXYt6hcpjTDfhMrurMsU/tnraicitTD4ZVjVTk8JSMUSZ/glWEqo3ECJtA30KqopaAg2SxnvHpiRGIZb8B7AWRSTBEf4V8prZWJZY11lVZMp5sFJPNRUHgUNsF/aNj45iUXmegNJeQqXyjjpFYw8+CuMo+EdFZtbulWOZ5gbkIGq8udXsdvPtQXFkh0TDZps+FbUeyS/on47Zr0dDjaAf1ggbpitNCO0LedESN8lJ+Pq4mc8rI5ovokWjP/pdViK2DcE7Pza1e1GAFvFBEJKemcs2rdUat/M7PCxqigDdNzm//4errpnFpj1Z4K3auUdPpA3xrVOoQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XbFpcLhag9S2AbBVMuCp92GSnoblxRkqAFRIwNoQY+t+TcOq1x0ZcIjLAUuR0uhMV62mSQX/xITxTlIEmGOz2Dz+Dv8miHPWen6y4RHCHWOSBgJNs5ut7Not2LwIGR1BMlg7Rf+bDqOEyaWsBaCJYQFYdS+b7ypfB/fNLW3MBM85Qf4JR9TL1kizPNrjQWVJeDu1jpCiJsKJ5EB350QB8hgvUZ4VRzKxk+MIZqcm+I0Hk7TAh1EMZ9tqN4Nko/TgjYDi7gZ2ljNonRbn+bmV4d1edq0Kt0AbQChzQ58lGD2FKpeXdtH5TFeFJpj35RJxqY9/twlUIe3s7zju0QN+ai6LNvTDr3l8US0RXKprNowSKaMnO7iMe876r9ZfY/WYWZLcE+gyWfxIQ8+V5p40lVr4tn6YPwwRX9foxzoj745V28IjLAdOr+d93m1JsFBx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:22:42.4919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa24e61-04a1-4548-79ce-08de8b08783b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_002250_582250_A813426B 
X-CRM114-Status: UNSURE (   9.64  )
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

For CPSW9G QSGMII ports, CPSW assumes SERDES to be configured. Since it
may not be always true, add SERDES phys to guarantee it.

Fixes: 86e7de8bf908 ("arm64: dts: ti: k3-j721e: Add overlay to enable CPSW9G ports in QSGMII mode")
Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---

This patch is based on commit "0138af2472df" of origin/master branch
of Linux repo.

 arch/arm64/boot/dts/ti/k3-j721e-evm-quad-port-eth-exp.dtso | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-evm-quad-port-eth-exp.dtso b/arch/arm64/boot/dts/ti/k3-j721e-evm-quad-port-eth-exp.dtso
index 8376fa4b6ee1..d403a3db0265 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-evm-quad-port-eth-exp.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j721e-evm-quad-port-eth-exp.dtso
@@ -42,7 +42,8 @@ &cpsw0_port2 {
 	phy-handle = <&cpsw9g_phy1>;
 	phy-mode = "qsgmii";
 	mac-address = [00 00 00 00 00 00];
-	phys = <&cpsw0_phy_gmii_sel 2>;
+	phys = <&cpsw0_phy_gmii_sel 2>, <&serdes0_qsgmii_link>;
+	phy-names = "mac", "serdes";
 };
 
 &cpsw0_port3 {
-- 
2.34.1



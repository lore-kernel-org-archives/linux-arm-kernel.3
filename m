Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7707FCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N79X5KRz+NKEQoVayD4aItAcw+8tPQJfWhnX52y0C8g=; b=Uw8ploVnuL0ffxbLxDfhTJAc2s
	yUgimPwXHC16a23bg49rF7KSUiMWLDNx1H4CndKAMU1OwlqUNXllkeHf6oH28q4fX/KojuwobXE6s
	C+n1BmnlPhVJvJ+JK4LAMGVsb330w1hrhuFcjdygV5Q7OpGDZVe4fSm1wuwNuIXldN+14UVHmHMLG
	dbyWBQ1O9Th6e59uDmQGvPJLLDMZpVbQB+/ZjSgkZyIc2zM+plAK7CZm6c5KaEByNXW/H9tgk3CeO
	jiG8eRFtf4uAKeaxmYW1t6EYNpDKTvkUeMK3vWuzhOS7jDDhUdl3Ppcg4stk6bBVALlS9dpyZTyDg
	gOurwUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDbC-0000000G0AA-3QnU;
	Tue, 05 May 2026 11:05:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDbA-0000000G087-42io
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 11:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=N79X5KRz+NKEQoVayD4aItAcw+8tPQJfWhnX52y0C8g=; b=CHbnStfSoiyqJMDx+0fq7CRPhF
	ZSlN5z3YciP6QqdfvAPprH0I3GoyycXv/tQW782EAKiiv1fay/BQZd0pno8842ij4t0eVAiUEbH6N
	Of6P3i7zR2S4wrAxR/Tq9tcoapdEPS0piJ9WHVLr0p3imghDe2v1R8PO4CyCJI25DGdLo5CQhGEyf
	yi8b/yjf71KXKlgbutbdoVSdDPrml79aNDHzSXxrwzXAwo/SVkpRcU/SzjtwKU4+U5Rjbg2Vys+o4
	i0tptfpwf9lRyt6YJOvBadywkVlJ3/xINWO/WLPI0dmphOH+rR74VAKPd8qNwdb6WO38cchS7rJZd
	HoYnWvgQ==;
Received: from mail-westus3azon11012021.outbound.protection.outlook.com ([40.107.209.21] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDb5-0000000DJ6c-0Ki8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:05:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ip4yIHmxfBraYGmntC+QwffLBb6C0J27FoIKwk4zUsWlb6MtsBrsYT/lAvvTr+LNaxiGsg9eASDCHnSt2c42J1QsJ0e/Vy/E5CEyW9zQlDarekng6AaMDtR+yHlsNYIyJsSK6r+JKYfL6dA4YRNuygTh2BWeJH6Y0a0ps8zR4FzqZE862+2803VMvLXKMj/mIsJycALjsJRtjcs30FmgSSlL137riVTtPiAYq2mPtMMHPOSxNy538++87RnSV6zTEbB35BYaRgDus+4PscuXIy8HJ94a2W1v7ijkCydNYbefCQY+N3Mlb6xDRF3eFCPis0jQqZP9ch0Yg/sXJULyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N79X5KRz+NKEQoVayD4aItAcw+8tPQJfWhnX52y0C8g=;
 b=NabeEllsar9dSgqcNkwfwCBtx+/poHzMrp0j7SuC330SovBV1vzYvDACla599IFdWYFbjEBG4p2iGkwhw06AZYxe8dpl/S0t0uW3D+v6xnYGMA0oMEVewVuLX9MfK7QyxHLNs69nHHZWrRQGwb34dpq1tB3JXXLLyS17wymRtjXC3efihxF5YEALeSFMV8ws5MC8pOnKPlyJZ8e1gSqWB9mZ6QUQT6IHRTCPmnNi+n5fBnO2Gv/0jawWXDRuMFJPN0YibniGMGruKY2ErFF79thkyrXVh9Ur2+LoeGxV6d9GqPv5o9pajHBItKYa5+mZZybhoG4YRmlIG9Cmea5ECg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N79X5KRz+NKEQoVayD4aItAcw+8tPQJfWhnX52y0C8g=;
 b=rhiTP2J8gg8kvqaq7S0Lju7i+VVpIpH8iyh9Vi8wjaVL13sxtzqR5citOiCPojSaluF81PhYaKOlVmrpfY9fyr/vhR0V+W8ShqXKtqXu/6bQk6xDO9I6TLdGqqe83fPleIXE+xZddjtTN5N3Eq06FjPodeQuzNc+yqZ2Mt/TavQ=
Received: from DS0PR17CA0004.namprd17.prod.outlook.com (2603:10b6:8:191::12)
 by SA2PR10MB4603.namprd10.prod.outlook.com (2603:10b6:806:119::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:05:46 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::9e) by DS0PR17CA0004.outlook.office365.com
 (2603:10b6:8:191::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 11:05:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:05:45 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:05:45 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:05:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:05:45 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645B49hC2831834;
	Tue, 5 May 2026 06:05:38 -0500
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
Subject: [PATCH 13/13] arm64: dts: ti: k3-j784s4-j742s2-evm-common: fix USB clocking for compliance
Date: Tue, 5 May 2026 16:36:14 +0530
Message-ID: <20260505110631.1144200-14-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260505110631.1144200-1-s-vadapalli@ti.com>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|SA2PR10MB4603:EE_
X-MS-Office365-Filtering-Correlation-Id: 514fb063-f0ff-49b2-cf03-08deaa9641bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1nalBken1Nw7LjgBa0KKbR4nfBXkg5u9InaBwx+kU33ApC2ZLXdOPnxG51yhvBiQcyKiKeBU+g1pwMqfy/oF9U+ivaG8ahBKChPAkWj6DHm+qPi8vbmFpoqdDkgzJ5qrUxtOPGgAiHCNZl8ADXWZYjUO5E3BRpjfn7F2jwU+D+8NVGYJ/A+UXVwwXOx0tvnHOqUI6kFHFBX4SXgYWxYMmg8KeG7kr5ylX8dFXHJoj7g1+c/8NIEQ6q4p3WA1Y2gV8bO4AVLGTBXmWx1Q3+BkPQ4aTmsI7oA0h+P2fTlhrNfBsNeM1jR8PYVnEPucWhzigAhnk8tMOYN71M/GD1vXmCm3XVqsqqwwq7FRGlQ69bkCfJb6Ddq0hwYuUH9aML7dGX3vbUx6QmT8nWRf0kJ+zNkIyD2/Z/YPrvO63DQODQssNDbcMO5+zTxkmZaro6hAA7LPrQckG/PfXNLkVttp/pgbZFa0EFrjWhYOdMtp8/ylsViLBs3kXBHka0RYo8o8lf6QLL+o71Fy8EVSt4uHhJVrWV32G0nSoe7g2wNojovo1XGMLTGlE10sHkc4zpaHvCty0j7kRCDYy8wNjQuYphr5wOBUyxl0/hK5KwZIxR9vONAgJ3hTS/bzOmyeo76xaGPdKmHCiRO1sjIRmOmDW+zX5tWJfhvPmtSlFa2nbMWK4eaUU1+o1xBslg9WvtrDzNe8yeuFuSa4hSUykaRzkABjdInI4MI3Y5e0Sz5LFLcx+TTZIA+cGFK/8UXKv6ellWi+W/3e2iAo2oJjBDAXdw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ylNwQ96SMneSgH1f5wtqJk1gQt36ksmqCBd4C+wPPVO39BSyJhU8mF1ujwnln6feOYmye9VaehoRE+VjomCRyGcDbkYXRvhnzJry5lWFgeO21PAb6FsCCW+qZUIQk4JUhjXJ9oLm6T0X9fexp4KGz7QZD2lOPCCtxV/jRJzjXYWDD9EMdDsaFCnbmVTt3OYbGLUiJidNSvEYNLofcZFnSQiNIgtsFlf0m+LgOCKdeD/9Aj/QyM0G7aktYO6DcIO76Qi1U1kokND32T1G0qekus0uqXrbv4RuclDSA6VCB4XPbKxvPwP+cHxURpLQ0GSChdiG5bP/VBC0k0ZE2jfA96Nd6HZWVi/J/LmqK4f8K+vWe0A80u2LBqZ/aB5jU0Fv5uJd0kKFNMZEqvpGrbGSREBynt/V0DGHroKbtQqcX2dlOxvgj/TgE2mCLCUK14WU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:05:45.6829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 514fb063-f0ff-49b2-cf03-08deaa9641bb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4603
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_120554_247097_4BBB6BF4 
X-CRM114-Status: UNSURE (   9.56  )
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

Fixes: 39b623c05c46 ("arm64: dts: ti: Refactor J784s4-evm to a common file")
Fixes: bed97e94ee2d ("arm64: dts: ti: k3-j784s4-evm: Enable USB3 support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index ff3a85cbc524..0884773ad230 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -1010,12 +1010,18 @@ serdes0_usb_link: phy@3 {
 		cdns,num-lanes = <1>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz0 4>;
 	};
 };
 
 &serdes_wiz0 {
 	status = "okay";
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
 };
 
 &usb_serdes_mux {
-- 
2.51.1



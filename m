Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E70CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiZXlagZkm6y+zux8YPMx4naf87MH3EBqhCJWS0OmnE=; b=3PhCcaEa2KQvZ8Urt8z1d5ZSPf
	9QQ/NN0EGkkwZNo9oshobKUwMO0sqX7hRin2cmIe0iIFBTtzmWG0cODXm2c2p/mhEMria1ZbN3+jk
	dG9zamyFPZ6wOZe7vfmI0wuNLKTKHRdNPColl1i9ekVpvxFNQg4j02zoJpgdL9toGRlyLuIFQmrZh
	vmgcqWEKGpD1qsrNqp0qdM5cybswyXMM24qbPEIsxhAeZbQAaWfR5zGC6O4TajjYAqQJ+ONfgmoFB
	of/i0fE1vq0OGQwqMSeo8jkRCVbkUw86mZg/q6rLH8NMWKyZDZFLf3yBEQaOB91ljQoZ+lta0NFsQ
	VBSK8/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzd-00000001liE-23vO;
	Mon, 28 Sep 2026 22:38:41 +0000
Received: from mail-northeuropeazon11010036.outbound.protection.outlook.com ([52.101.84.36] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzR-00000001laL-05rG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3kkTXHJ8XGwTbNXqIi+1Qj5yBWoRTlOA4BJ+fgvsqgK36uGSojay8KtFszA8c0CPL+shjJrjjO/LVRalQY/MTe5Mn+Sszk/k0cBVdg+Dr36gCo9DkbhgU+gMBnZDY3oF/e97SZvWUwQYxula3OdHBLU5YcehNZ+fLJ4jnT0lB0sg6qQHWzlE9cnp8fDElCEbX0O4u5f3CbRCS2R6p20Y+b8wMcW/7Ndl+DDDS7RyMBabk5DsrKfTAYx4u9LY0+CUFFFFcLG/v7P16jA8IS5vCYpA4aIKG+PrsUyIwhFiC8ERwlH2vgbjtZw3dDk8liaYhSmWa+U6fby1a6H91jJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiZXlagZkm6y+zux8YPMx4naf87MH3EBqhCJWS0OmnE=;
 b=Inl+5KelVV0u0AXU3C7jPdrV25LK7VrqW1Ao0+/U+4r8y40HrokbnUcDStN6GRIaHWp1HzjXbBx+Rv2MZBSXCFIsPCQPG5bqJNAhJ7BMjLFoA7pJptqKIMctZj2STgtZH89G7juc/eBP423n6+zd+s9uuxf1RkWPiC5vKIEvMjSqb/EcP5lESrQIHnFyrUOWxJq6GaGt/tXFD2fL3vZdhVs98OMbzFXTgKCTfCE6BR3aJgtztusPfDvKlcjX/xoVs0Grmts7+wE0/Iw4nJwvnM97YtgocWQKINJQOjhOMehhcpkf/0D/P7e6RKvht0Cs28nnUnfWAbf+Bv9wf5DGTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiZXlagZkm6y+zux8YPMx4naf87MH3EBqhCJWS0OmnE=;
 b=IDJD5WGmcbsSSYxA/E9cut3PsUyVfX/99/PxpFMjiilZZYeFEsLTgcbVJoXbYazw934fa3NUZh5RWrP+kXIKLw89poIEJGkBj5rL7iyMVIOsOgVgoPp/J2O5X8R9ch8kOL3Edw0Mle4akfkFrYDeo4u/g0Kb73FVB7s1kJIw/Qk=
Received: from DB9PR06CA0022.eurprd06.prod.outlook.com (2603:10a6:10:1db::27)
 by GV2PR02MB12411.eurprd02.prod.outlook.com (2603:10a6:150:36f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:21 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::59) by DB9PR06CA0022.outlook.office365.com
 (2603:10a6:10:1db::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:21 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:16 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 04/16] arm64: dts: exynos7: Align comments with minimal
 whitespace
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <656be573bbf45015cfa9e56cb43fbf268fec0851.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:15 +0200
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|GV2PR02MB12411:EE_
X-MS-Office365-Filtering-Correlation-Id: aae4796f-8bd7-4e96-0796-08df1db132fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|30052699003|36860700016|23010399003|82310400026|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: aMR5vL7Qu6JPYqCzvky8q2FS4VpXlKBfI7rKYeuNlIkNe4saKYqgu8LJDxs7gr7+lFX2A4SKta1gvwXcC2/HEu9zMQ6/wJQm38gw4qjfQCJxfL6q8p0e8naNE5d++AwJXKnG99tNxpBkcgysv0unWKt4RHKpFQ2nn+oGXPEIwm+s2nTEQmPVyciuuqR7kRc0xiD6skjOcK0T6wP58o3a6w5Zp0WsZk67+DlZQBEDn4ybwWhXM1Ba0VROdKtnWJNiWA79FpXts3Hvhhg4m15pOBF+HkecHParyw89/7C5HA4S7JQfsBL3Z4syvdxoh4GE78xPZ6nDoQ4ARP8NrKylQ5uirXIGQMzkFNjIipyE0HGTpwBcQKwt5ZWhIBLWTZlwqtPFz9UtYXn5zvBNJqLFMErsMvWx4lnGSUVAhQw0IlycPmHoRYWsWGkyDfJ7fNGlgk/D69FNDJT9L4+QKleXqzj93a5jwPG1MOtWwS2JgEFTk65PJhYLGCafq9CSXxF8Op3ciEucHnNOoGwdiRGWdXmCtcIkETbX+tXlPa0sON3Uw7EMKAdNy9HkI5uFNWMjxv1Xpl4/XtVe03RSIxGWTBcXw4cqyZZmg0+sUHKvW42yQydZNeRELCiTCIDDUkluzWjqjqJ6W1bw7Jr7kduYRi3GtBzVLnzuldcQcCrrixmrpRrOfonfy0Oj/jqbtSuJzGd2I8bQ0gelH7ynIbNHcg==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(30052699003)(36860700016)(23010399003)(82310400026)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cZOrrAQB2oIQImejQKYpNfLsa65tCXwPxq1X33PE7LujcKwP+TpEJcQfpVtp6DpSZcBwOWCNh5ZxgiR+opLJbwWcSSFHWTbQHqcPOd5m3Is21RBCjJvek07ShZuz+86doDk3SNqQ/WrydyPaHDZevbu5gya0BjQMP4LkEBC1S98U6TYNpVnnmi6rk2PHh7HIC6vxc54pYhwROwD+XvmQWsrEEL6RcaOmdp+LY5eL6+X3su0drIDuq/bySGoTBHCgRWoarsFX+JzV/SjB9j/3QMdhEup5B0PZZAv6tBaVzJv+PITWLFoE4LtlTY2EpM7TzGozYNyz4bZKi7txqB7Lf20KzPpeEIULBeSsuflofteOPPL+xgiCZqYyReo2OxroFTwLaTPancjgRDRXFS1QV15HJlbAJZoLWPkUQr4oY0NYXLnzXJToeELOtKa3rZbG
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:21.0454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aae4796f-8bd7-4e96-0796-08df1db132fa
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB12411
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153829_068005_DAD08668 
X-CRM114-Status: UNSURE (   9.31  )
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

There is no need to have superfluous whitespace to align comments. Use
minimal amount to achieve the same thing. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 20e24db952fa6..865add183ea2b 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -669,10 +669,10 @@ tmuctrl_0: tmu@10060000 {
 
 		ufs: ufs@15570000 {
 			compatible = "samsung,exynos7-ufs";
-			reg = <0x15570000 0x100>,  /* 0: HCI standard */
-			      <0x15570100 0x100>,  /* 1: Vendor specified */
-			      <0x15571000 0x200>,  /* 2: UNIPRO */
-			      <0x15572000 0x300>;  /* 3: UFS protector */
+			reg = <0x15570000 0x100>, /* 0: HCI standard */
+			      <0x15570100 0x100>, /* 1: Vendor specified */
+			      <0x15571000 0x200>, /* 2: UNIPRO */
+			      <0x15572000 0x300>; /* 3: UFS protector */
 			reg-names = "hci", "vs_hci", "unipro", "ufsp";
 			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_fsys1 ACLK_UFS20_LINK>,
-- 
2.43.0



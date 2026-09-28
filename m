Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87058CA5FB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nRtg0KONZHB/T+vJN9+HP7JlzxVk41MlFfpDjmIR8U=; b=Hf6R+nQ+anmL1+ZNisPm/2og7E
	q1Nvp+5eu/oIz6/ubs6EFk3gILy6MDGFcok4LkK6XTF7XxvRINs8aLlLgK0lTVl/BVAqQ9z+j7JhA
	yHF9Wd+2fzq3XmDwFT9uLol6atlsG5+ErnxNnIRMAgCW1V/T/hyRzh6ZK9ohtbbNhlPU7vQwmrojP
	SAuUjsyyGslrnbpGz0szElUs9f/swQ2WgCh3MlkMLL2YP8F1LmuWQvwODNp2IrbkfJtASqR/sBoRx
	OeFH9p07C0FDxOhH3V2DH/+yHuomv/L+Xe5e946c0wTigQtHITTeBp+uOObhpSw7KcAolWNh1gnoz
	GChMoMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJze-00000001ljV-0Bgx;
	Mon, 28 Sep 2026 22:38:42 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzU-00000001lcL-19yV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:38:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WvkmbnghM5VwiMHEno8pdgAEKnQRCyZ4pJ7EPtYvZMo9uBK1q4VyXXB3Mr4Km4oQMCnH4dAYF/lkr35WHEKPxM27OUqftgl8x3itn+OncfXffHkzaJNXcXGG84/Sfk530c3kYKBy9xy70uB0ngp1k4IlJeG604t/hGeG0ySssmXT3oqeT39TER9KbMffsGfQvVhQBjktJ55wqzy1dxkQC3LxdTiclHit+1LvYhfvuoAce1dSPss9YHMQ5FmW2I3/GIM24PCPHB9ut0D2+OA4bP3/wkyQ7bNeHprM670C5TVZk+bQN6PFkH7VS62BbCSffSjLLFmLShA87DrIgbrehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nRtg0KONZHB/T+vJN9+HP7JlzxVk41MlFfpDjmIR8U=;
 b=hX+a8+dbO2vQtr8wWlI1I7wjoDpdvqGTCQmWtVEau+Wrt+A/0paQk3wiXaRczbrPqG+AcJyC2TPf74r9nVL9+o5tP9lFP4+eLgQnE75Pyb8E+rgsX8lh23WwOnYvaiNafZNYMy/yVbivgC/lEJRfOm3FMECCOcmkqpDdC37Mqxd7sg/P+PHStXv0VdL1CSFONDWX6+LkCGYnQpTMES9vYNKFCNSz39OiYtAG2RMYEkvc6fOo0yeiAwniqBNS9QYCQ4fKvQ9rXbPqt4ygD+U/fK1G/lTQzEu6+tDomSdWLrF7N8sdJxBdPEXZmLbEVVb5A/zfBfWHATM9jcV2lOmDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nRtg0KONZHB/T+vJN9+HP7JlzxVk41MlFfpDjmIR8U=;
 b=nlkUDw4ZygZZbJS+G+daEsg6vLDxzjfNFhlL2GkddCTdcy9aqWALdYWsFvtxebO837iBf+RTZszdnK38PwO0y+uR0bIlRL/b2Hb9Qql+ZgL2x+Gpn3Goiv/gerk+Oid03dJY0T4KPWh6azs3KLjdJ1RQJW2W3wui4pP3810aMdU=
Received: from DB9PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:10:1db::16)
 by AS4PR02MB7856.eurprd02.prod.outlook.com (2603:10a6:20b:4c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:27 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::19) by DB9PR06CA0011.outlook.office365.com
 (2603:10a6:10:1db::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 22:38:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:27 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:20 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 08/16] arm64: dts: exynos850: Use tabs for indentation
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <7975d2bb948f055db90e2db4793ff906992bee34.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:20 +0200
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|AS4PR02MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c84faab-7020-46fc-9fa5-08df1db1369c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: AYJZHAHW4UMT4iaQBnTucqX5sfXomVRLrc8WGLuJtS9YJTxDS5TypCWaql3V5j5YSuURmCJIItJck2jod735leW7LPJKTC9CcIILg/oWScuH3fe599Cwau9b5leEe0A9Vl/lA6bqPlWRno980H2AnxEEmt9x3og4AM0Qz6HRJE1PrMBe16Fxi2/7idQ/CuusLGmRHRV/22Tuay3S4AgUvrp8QGnpl31wxaMPiLwHyTvwGxZU5j4SD8147pXTZD+uqmQa66ckyv98eNTuI7BwJh0+ANhcCF5Ciw+1yEjgS5N0IMvDAwYWJzFUsnQ1uVJWLTaJ3xIdSkVQkaYzkfSAvKvAkY90P/B5mYe6OTD+DSIHpi9V/aY+wQT3HmCOa4UbMB+/Raz3ThROaSfqc9lWWMUp6T40+CisM9+lxR9mmmkpWyh632e3ilrZfyOPx9Sw8DJF03h63318OsaUphYSLn7Bp+xDTuKgaR/wxg4E92wnWz0tS2BHgDIbwVHfgucd+/XEHDhaGt7+QugDKlCQjPLkB4cmr59/VaqT/I6lCdE0m2VpwgQNtkCZL+fPY+iMn6DlaCHlUpr1RUbiYpHoNhGe+GZ7zgsSjSXQVyslqNZZjx8wVo6TF72vRKLMCBIlxVBbPl4Lw7yN3G/5FlqHoxlKh0a4uYidv+d16+xMfyCHZG/dzMmvfQf2xdsf602n53Gl2W3I7igrneYkt9PmvQ==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PL2Ckffcr/R2WvQ19Pp/M32251hJQK+vYfBvtCcGXf8/IX22DYVveK6DzRgEzQN5sPSKOFODRswpi2JPyEFFFBtKLr4l3jOliKbg9rbmUcWOvSACPQuLxdDsbhP2B6ZVMC/wzXvWhZGGRvqOu9phqEWZRREQCB3jafd3xDNYC8lwxXAWsz7MGaa5j1BPj4OQ7F5SWmq5D6d1287P6Q5y4DdU8zVRpXu4fHGxWGkVIZixC4SN8OIzeIAhKlr6Gkx+N+cSPa/+ivOZFRuvo8TbAQ5xH4Twp2GirtpXu4FtFJVYnGKd2NoUckMFk27oSAin4ACNk5gH2XiC4tnITNktpKrpPh+hl/m4UwaHSmNdSdj4VREWMpvGGuwLDZIBaOcohHrEY7KJXEjaojEbfMFCNMh0uHBezoCghhrqQUPG08S3Cb5uN3Jx6KXIzlR8bjOg
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:27.1061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c84faab-7020-46fc-9fa5-08df1db1369c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB7856
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153832_317592_3EDF4A18 
X-CRM114-Status: UNSURE (   9.17  )
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

Tabs should be used instead of whitespace for indentation. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 911643008b9f5..89069c19329c0 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -164,10 +164,10 @@ timer {
 		compatible = "arm,armv8-timer";
 		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
 		interrupts =
-		     <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-		     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-		     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+			<GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
 	soc: soc@0 {
-- 
2.43.0



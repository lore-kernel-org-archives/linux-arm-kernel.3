Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EB9CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWK0U4itrA6btPQBRadQr7/Iom0BJ6NrXpvZ55m40x0=; b=hSDH+HwDw9Who+AnUVFEqGfUFW
	Ni1rHcC32InTO8p0wIV6ON+dLfWyJqgFeDRXLfs0MiPe/JXe8eaQytdqJsc3eo5DXg71hyQmoZEGz
	5KPAEOgpaNihOau9Dfjm8frl/huDuVaaic3nGCQSRJNC75vcRBdTUswWvi1WRRKLND1BUe8IuY271
	WmUT45FKQXMOMukdpcFBDuDEKzGiuzT+s3IhqP8Ah/QspJ9v0HjPA74frk9wOngt+9AvRXWs9DiXk
	OUEhDJS2nE7EWiTJU4aviTiQt9sSKyVKZ5I1rG2Boug8I646UcQpzaiFXJtDAsvovEC0kPf65TJ6e
	Ds+Bz1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmSW-0000000FEji-3mx7;
	Wed, 03 Jun 2026 14:20:40 +0000
Received: from mail-westus2azon11010006.outbound.protection.outlook.com ([52.101.46.6] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmST-0000000FEhy-0QKi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:20:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LW/HcWw/BTfivMIO0yPT24A6W2t4nyv8/An+MAi/hVzRJVIsq9yQ2LlQn/ToSxVark8nnChvuHrN51WoVmORhhO5I+VXUwREGDm/MwAAISEMxPB8cSEnGnaYaSAYwBYriiR6++0BATRAiZKRFEbg5vzVQ0iTyH4yHt5UD9yaYm8xGQ2HiVxXzlH7b5FnZBNcEsV2aZaznMhVUiUGGAf+RdmV9kLucUY5kbHbp9itns6f+2143hnMn9rFxdYJX6dVhWZ9z58AGxyeJgEz2vtlDqeog5GV0nydc8zXMqPc6DS3MlhbD2RSB2Eo52QfwPCd2O7PTe/KSnR6M91/u05ZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWK0U4itrA6btPQBRadQr7/Iom0BJ6NrXpvZ55m40x0=;
 b=KygsQYoOux/YnVc1RisUEEFGzXelGN4W/L0za12Z1FYg3kcfxoX67UXMzJDK8IW65HJ0EOxCXVgu9GSAx3l2CMBUSt2DcD1XVcsDISY8E25WPDbx6asUZcekYcK436+h5fu0NG4WcZxsPalwT1c7otcUo0d73RB8VTX6zcYX3Eq80FAJBnlfLjGWnXSLy+HDsEbLIOCsmjrfbr8A1LSnfITn69JNj/vIzfjdLcUDZfv2x10gbyafa07GPK8MffoQHJ5Dw2Bsmhj+a2y+LW2ZLgZ7iXUHfRhALTliC5TDPq4tvW0h4jR3+ZX4LxqJw3WC7dpuEbzl7j3iGRIMCWGAQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWK0U4itrA6btPQBRadQr7/Iom0BJ6NrXpvZ55m40x0=;
 b=oMDyDiLK8SDNSJdHbe5bUwOD2PzvucymcOSfCWG0Dous+Mbe6S9UrKPhfzCmi8t66i9gKwy/lIQ5fCXtZ11PF6idPqWlm6a+5arOrZQRljp0a1zDGMnngSeXm3eHkpgrs0SnEwIhoD1YnbesQOVQIanMBLfA72ZsHel69aL1qxU=
Received: from BN9PR03CA0065.namprd03.prod.outlook.com (2603:10b6:408:fc::10)
 by SN7PR12MB6670.namprd12.prod.outlook.com (2603:10b6:806:26e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:20:27 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::7f) by BN9PR03CA0065.outlook.office365.com
 (2603:10b6:408:fc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:20:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 14:20:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 09:20:17 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 09:20:16 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 3 Jun 2026 09:20:15 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: <mikko.rapeli@linaro.org>, Conor Dooley <conor+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/2] arm: dts: xilinx: drop bias-high-impedance on SDIO CD/WP pins
Date: Wed, 3 Jun 2026 16:19:53 +0200
Message-ID: <f8f0aa0d0a732127b5cb725871d06a7739f0a499.1780496388.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e01c8e60e1d9ed68c347f1a3741f89149109d8b7.1780496388.git.michal.simek@amd.com>
References: <e01c8e60e1d9ed68c347f1a3741f89149109d8b7.1780496388.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2080; i=michal.simek@amd.com; h=from:subject:message-id; bh=7u5y44qkCPKS2QEmnPV+gAif3DpuenX/ILxWkIF4jr8=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWQpWIi+cZ27IPuLa8yHSRVTc1X32LHzXf2j3Xf8RdnEp Tej5KryO0pZGMQ4GGTFFFmmM+k4rPl2banY8sh8mDmsTCBDGLg4BWAiXusZ/opn3z4//a+ZqNn6 zOk10uHC4XsM82zruCWfttueZrqjZMzIsLJkOccZXeuUCw9l7N9o/ZDPPMocvKblgd+OTSGbz9l msgEA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|SN7PR12MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: be2d2bd6-f233-4232-30dc-08dec17b4282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: kh6RxClzqPjm/Ao8OzwmRXVsyPj0FMl24ePCMrwJqcO6oDdHCHI1szKS5Yph3O0jaaNf5tRof51wJEs/95qWCiHjr7qcDvFzm/lq6glkDwLRTpQBKhmgeai1cNcd+ChStFdV0KCKOIDfdnC5I8kn6CuE9/SG62ZxVezzRWug3DsE9ICPTguAMeMuyPJNM+tCvTEwFGW+9BUFSpnA7hOKYpkoUlrm01FNmwXE1oFQUYKvHZSfrI0lSsrZdR0mWQ74IeSEqzVqU/gPJvROxhLCR/8/PZGpI0SIPhtySM6p2wNS/om7U/O+YHsVK8sdGqps74qIYc+Byra82YUJdSpA4Fjw0qAa1d07gc0CZfGgbQknNX08Q1HZ1UtivPAcQC5nzl3bJ5wIAOFOzVndAQtNzQr5uTvueE8J6p+euWuuMRUa5r4385EXOKoQ5pGTHoqNvBIBF9i4CAjBN1wo4qkj6QjiQ7SDt0z3MHmIk86tqffujbPCFTKrlHpeanMEct8OgkhFSsiyynyab94nimMNDXBpMCOzcvxeiMAwtSgYWWunkGKbu3JVJgUl0SISaoVItqR8831/T2xiWS2/RG2GHmKm7wVpvENLjARUH5J6jWhQQUBnDH6Nc50wPAC45+x1IHufoTKM/9efxY4zidnCRIFScHkbVeNXMb97aDo0FP+PvgTP2bqjACiGGiT3z2TXznqyYOWWdJNN3CcUQXsKGF5RAcRsDQJS/XwYplryLE0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MHxqQ98ynKVKr1iEGqHUICXRG7Zibmy372OabjqmV+Ap8ij3kDTeqv/VVfjzKXZNZUb2psSAQRhLdMUFQ0f8IVTjaG6vyVsX1BgfCDK1Ceeywl5GiqQO8nErwrrxYEgFeld0pwaWbbKtxSlWtIs728fJjmo55G/eGKOF8Pxlr2IS6LcNtS7NbuW2KSZAenlqG7zxULShxvTcYepN/RqRtFc4vfg3JUo6PBfYcXE/Rrq0/twAdu68qlK0q25VZ/jAAcyszg1Z+zZymunaMrC0XKNjh6KnBdzEBT2T+xX6uDdSu5xAkhjGjJMj30wqIQvS9NE12QNZ+djMbFULx8dZAQECaCHl1hzndenN0JQIoDZ+DvYAuMQb/6ENjMrOLYGBp1+QmMwoy3Gj76PsRUYiaaRAaac7TqP+YCiCIWENWSVzeqhJA2IJwoHYxu/e/9o6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:20:27.3714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be2d2bd6-f233-4232-30dc-08dec17b4282
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6670
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_072037_284560_084EBF73 
X-CRM114-Status: GOOD (  12.12  )
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

Zynq-7000 boards used the same invalid combination of bias-high-impedance
and bias-pull-up on SDIO card-detect and write-protect pin groups. Keep
only bias-pull-up, as in the arm64 ZynqMP fix.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts | 1 -
 arch/arm/boot/dts/xilinx/zynq-zc702.dts    | 2 --
 arch/arm/boot/dts/xilinx/zynq-zc706.dts    | 2 --
 3 files changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts b/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
index 14f644156a6f..19b564019502 100644
--- a/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
@@ -99,7 +99,6 @@ conf-cd {
 			groups = "gpio0_34_grp";
 			io-standard = <3>;
 			slew-rate = <0>;
-			bias-high-impedance;
 			bias-pull-up;
 		};
 	};
diff --git a/arch/arm/boot/dts/xilinx/zynq-zc702.dts b/arch/arm/boot/dts/xilinx/zynq-zc702.dts
index 6955637c5b1a..36e919aea84c 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zc702.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-zc702.dts
@@ -324,7 +324,6 @@ mux-cd {
 
 		conf-cd {
 			groups = "gpio0_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <0>;
 			power-source = <1>;
@@ -337,7 +336,6 @@ mux-wp {
 
 		conf-wp {
 			groups = "gpio0_15_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <0>;
 			power-source = <1>;
diff --git a/arch/arm/boot/dts/xilinx/zynq-zc706.dts b/arch/arm/boot/dts/xilinx/zynq-zc706.dts
index 3b803c698473..1ce35eaa607b 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zc706.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-zc706.dts
@@ -237,7 +237,6 @@ mux-cd {
 
 		conf-cd {
 			groups = "gpio0_14_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <0>;
 			power-source = <1>;
@@ -250,7 +249,6 @@ mux-wp {
 
 		conf-wp {
 			groups = "gpio0_15_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <0>;
 			power-source = <1>;
-- 
2.43.0

base-commit: 6218e588ded718ad365fed5fa7fb151a85abe5dc
branch: zynqmp/dt


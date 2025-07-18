Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E26AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEw72ybTPpcRHoQT/NUwufreGnxxmt3iOeKMb7hpbAw=; b=oZ1CzwklrlU1VT17NplcBlDah4
	iEhTflev+GCj53J/CNJB3y7iBDZta0HpBekmHbk2wucV9Niz94nOqKY8Hs/JS06TVoyOkHR9FDOrE
	IV980jIwAm3amGyDuAq5rTsu7rARsJo0ZnR/G5KBg64d5UzZhc3pfUo0G4WcaoWvZqXR2OjLIL3aO
	EhJfkwKHmnccLIypCkxyXje8YtI60WEEuVF9oXaNmgrdeqGvOH87G6rjKq8feGFb/d7qfLpf+3C1a
	E1CBW6+6w2o6zH82SCXrfYM9+TSSsb5lSZWSkAVreUhJNbH1kzcKB2iATMI2dHAZalWgUJH1GhMcT
	WbnSNX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucivk-0000000COns-3Vvn;
	Fri, 18 Jul 2025 11:07:08 +0000
Received: from mail-dm6nam12on20619.outbound.protection.outlook.com ([2a01:111:f403:2417::619] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciap-0000000CKsT-2wfw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 10:45:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjB3beXRgvE/n5k0Z5XoUxxsHrrSfAwrAZ7g2d6F78vpiQv0XlGhS3siq4proTIN5leQDfT/xwhTFmRpkC1Nl4EGot5WxAJ5SpMogsGWQMLovnq07GXKeFpy+rM9Zy5OIbGzednjEjbTKzgIPcBdxqddpP4k4zB5q4+T3eFkRtFh8hhsGoKMFMp6jGnuZZDWtYjMnSCP1sLnp+JvsQ+GD631uoiPp0cJ76wpFQzhHkP97RGikXAgbO1OSz/MNK5ixqMvXT9qAgG4D59yOhrx5sWvM7AUMIlTds17Eqi5q3Wvw6dOPtLNqhlUHw3R+mL+OWnmfiqA2Ypm7JAX5yi1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEw72ybTPpcRHoQT/NUwufreGnxxmt3iOeKMb7hpbAw=;
 b=pMDB3HdDx8i+fFgFUoNPEHlKtFHmBZm/z9/1aONwh4/1Syd7Qq+N6Z5N6dNvN4F/5IqXtxidXt0bpqM+2Q+d7OkOoALeYitXFWc5chUximbN6lKGl9DXzH6+4MNAPJdS0F5btQA+ZwDrLJ/S/3KOBJ9YyYl4OB+b0iPjzJnxKD1icWlHDJoAd/PJAoYwWVnmK5ne6j9Q6JcH/4uuNKyJtjtOiDDMCcpByv3kLGQ56fCUdBRLXp8EO61vfRCYSs3R/Y/hutMIy0IaikERgeYU3CBHRsWtLokc1wM+tt2vNhGDdBuFshJyD+fD3AyW1KSGLvBCZn5/RkCvYsCi+8zLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEw72ybTPpcRHoQT/NUwufreGnxxmt3iOeKMb7hpbAw=;
 b=TV+XncS5+EQs2qbf/a8563WxmQ5RtY5yr4233CzWOAaoKLWsc4ZkDK6oL25c8lTGH1CIw2rbbv1D92ehBTnYV78umD7q23giz/RfM9tTWF3dH5mdMWFQ+Zd6n5U4glDjV0i0ZHorp+kOEIhDHPO6C+99WH0zbHNJm5WUd+G+mj0=
Received: from SN1PR12CA0046.namprd12.prod.outlook.com (2603:10b6:802:20::17)
 by CY3PR12MB9678.namprd12.prod.outlook.com (2603:10b6:930:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 10:45:28 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com (2603:10b6:802:20::4)
 by SN1PR12CA0046.outlook.office365.com (2603:10b6:802:20::17) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23
 via Frontend Transport; Fri, 18 Jul 2025 10:45:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 10:45:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 05:45:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 05:45:26 -0500
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Jul 2025 05:45:25 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/7] arm64: zynqmp: Use generic spi@ name in zcu111-revA
Date: Fri, 18 Jul 2025 12:45:06 +0200
Message-ID: <95979240cf09929c81a6f74199b0cb7027dd8798.1752835501.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752835501.git.michal.simek@amd.com>
References: <cover.1752835501.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=821; i=michal.simek@amd.com; h=from:subject:message-id; bh=dTm5c6DNsbpMT6i7gJMPgmegevLCpiSG3EvtO++dkJo=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRUqW6vVLT44n34kruOeH39J9/S3fcXHz37ZJeW1ftsr bMKPC9NOkpZGMQ4GGTFFFmmM+k4rPl2banY8sh8mDmsTCBDGLg4BWAiIk6MDK+iWVY/C/qyMGVG 5M3K+VJbpXZftWrjmLdG9R9XwsbVT7cx/C8+fUy6il2n+cTf+cfOtuj3hYTsNBOIcjwn2/Z79sn vLDwA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.simek@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|CY3PR12MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ced306c-fec6-4a08-d735-08ddc5e835dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dG+8oD1vHOQBnUAl9OSC7hnZntb8FzvGJWlvsYvKf9Z76UNSwmqOtkLmXSl9?=
 =?us-ascii?Q?f8GBhY9FBKQnmOtbTNq0eCutK/j1OA9+65VVhgXNs47LUCveAlnvcP3+CugZ?=
 =?us-ascii?Q?/epywTA8giw9EOJEAgq7O/foogI6sWB6cmXB8gqJYlLqshmF6eHUH4+5lecZ?=
 =?us-ascii?Q?DMZvOy/RhWtAf9UTW2cGFjA2VQk2/ElvvMAYbRU/vNXlLRr1+r1ha6mUC4jK?=
 =?us-ascii?Q?PaPSQili0cEdY3d3wdphhoLCVPe7H5/ygOiFKdw6MFU0e/G6oa9VSnbJb6MS?=
 =?us-ascii?Q?Tu17ERluqCNpKTZ5bkBv0836oYHBzLzpzovUeGVW0kdyB7YuBj55bkR9yUss?=
 =?us-ascii?Q?cIIlUuN4o7CwpsRnWt04flYA5w8jBkWK5hnnsbgv3vRvvcns9XZAg0smS3Im?=
 =?us-ascii?Q?2x7q0hShXOq5+kNPLPwYv51gKe5jKE7FdCNf9CY76BEUslKTbgPr5li2vv8C?=
 =?us-ascii?Q?94kTQxzhywp6syxdYUBluHbSh1OhjgH46VTl3IOmCjkm3XsooMA8VnGTEXux?=
 =?us-ascii?Q?BaQC88uqWhgo94tLRPEoSTcvQzn7Wif5/Eeg4p9sXbbsTI5ZbaBRdhxHDnr3?=
 =?us-ascii?Q?upSjL/FNbbfCMrbeZLKdt/cnOYQbBMbbWKkqx6DN6Py7UnD+zH/Iw0fYSeIt?=
 =?us-ascii?Q?5ScwgsHlXka4IHbownrfjrKGxm14nniYPMCJE6rnZq6js+In9hp2wq27obQd?=
 =?us-ascii?Q?CDZT0+ZUTNfkVchEVcgRokaHVhjadnJb+UraDd4Kem1//OVayJWgrTB+kHSX?=
 =?us-ascii?Q?QVopRrXBlwN4sOqf6JK+LDq9y9HDVo8sSgBOhbYst+NPUe5JWOPwucgceWFN?=
 =?us-ascii?Q?HFV7QZItau76dNVF6uMd7/rzYzt0Rhu+jKk5DvOSaigMS+GXXaNY6uw7nVzY?=
 =?us-ascii?Q?gHvmyFSXPMWuhzAeIzYhLnGrC5VJwV65YoeOdewS+NJ4AYdf1YBkV3TVQ6lB?=
 =?us-ascii?Q?BlMXspABiAaqjAZFsWAAGFTA8zsDyTYaxKqd5gdva2ITdY3xRatWXrHg6W2h?=
 =?us-ascii?Q?sYeir2USoI8VRjMvwxvjttKNw+ls5aDt28mfptqHmcWEXMq1PMAkrDbHmBgY?=
 =?us-ascii?Q?z1ggMdEU1TeyUfZOkkoJu+rtrgpCnHFAtubzpulyk9gw8W82iIubCxt85yxk?=
 =?us-ascii?Q?6qprPSnf4J2VtkrGoDoR5BFIJdl82BbcDuQjgqBswwItQipONlicc1Za9zrc?=
 =?us-ascii?Q?OzTZbkr+rHcmNziigrT+uO2bvLXDwszhIzUr6MWGnSl/A8WozLdpwQIlv9nE?=
 =?us-ascii?Q?jBcS/f+KBjD4tgsB2j3ndHGztaZ7Ly3zFm1ANI5ZUofdnp2OnCmcasGRT/U/?=
 =?us-ascii?Q?OQZ2jHO4bEf5/TzprdWENVn7Ib3DiVJU4BRJ+l2E6m5TF6KiyhD0M+V4bhM4?=
 =?us-ascii?Q?8LQL8dU+hYIUDw9AddaOcCf3s/gXBaqol2DhhTEH1TTH1Q6NaxvQ0/0KCbkZ?=
 =?us-ascii?Q?8uz/PyO89MizNqiKsVEJ+m67gWTQdx7/3KQrGNY+NONT80t0Lzsdx4mLRk80?=
 =?us-ascii?Q?9K93tPAVHF/hLZ2UMPaZPLUkHtIYYQbbpW3v?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 10:45:28.2576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ced306c-fec6-4a08-d735-08ddc5e835dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_034531_884070_053EDB06 
X-CRM114-Status: GOOD (  13.12  )
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

DT schema requires to use spi@ name for SPI devices that's why fix it.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
index b67ff7ecf3c3..a0cddaa64424 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
@@ -494,7 +494,7 @@ i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <5>;
-				sc18is603@2f { /* sc18is602 - u93 */
+				sc18is603: spi@2f { /* sc18is602 - u93 */
 					compatible = "nxp,sc18is603";
 					reg = <0x2f>;
 					/* 4 gpios for CS not handled by driver */
-- 
2.43.0



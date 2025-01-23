Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163B2C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 10:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ybT1u9Pz+LSHyr6qbVSc7UC7uiDkixo/ZESmgGSjo7c=; b=EhRMI5P4Xi2fSn
	GK6qDEpyhLc7A6XpjqJBaUWybUTIp/ygLH/tFEAutH3QmNm20jPLh2+rdUETA2JbJtrTZN8JFt8V8
	PgnFmLa8Ecf6Uoy8hq9TYrGagOpyQezpvQyQXK5KFVF2lT3u128wgO66svwyGwyLJ/Rv2A+5/4tv1
	+B9N87kgRPEiQhpm5QLg4Dl5pIrtka90yiVA8fVVJte9Q4P1eZB56MPWKs7SeDm78/vLivXxmBB/P
	noTw36XYDM3tfZCFqoXau5q1H3+DPvLDlHo9vevnDA5/uQy8f7tS6Bs9LqBjFOPIsakXhFCPvgt3S
	GgwjsYJ6SSKJzTYxlPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taua0-0000000CEJx-0dro;
	Thu, 23 Jan 2025 10:36:56 +0000
Received: from mail-dm6nam04on20621.outbound.protection.outlook.com ([2a01:111:f403:2409::621] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tauYh-0000000CE9l-223v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 10:35:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdp68m8iTD/EDeBo4xAXWw2J1npQgtsoZ05EEv7AjSalQ1yHWupMOwIf3k+RlLL/haQxchb2lAQLX2HyRksWiVvXxAf+yeUJyop3zxK2NNflbMIOYPhdarnBGkX+rDkdBPMabpZCWIXs6vL/PKIxo0diwllp7ZPj+SkAn9CoK6GWgesqjhsAnl+F+BLhueb7zOHTtQm+mAkEbhbZCPDJbcgxrBbdLZ7X2f6tq8WsJNw3Hivs2XLZzUFyxnUz1BMIb1eZcGLDyRH1unB2tl7J6UmO6EGfTRpd3NaqZhe+Oflw0b4LZTU0aBxeTnxnRlsiujHAJUwFInUotm37R5rW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybT1u9Pz+LSHyr6qbVSc7UC7uiDkixo/ZESmgGSjo7c=;
 b=CZpADXnmrW+qcsL5E2iW0ttQsy/p0mCwnnZSS4A9YuNk84GH8OjOqAkEcYuMBZf/I4e4SjAH+giYInk8yVdxBWzcfQWW8XVft8f9jf30iOCMM28UqP2sFF0c+oz60WcR16WqMwHLnR/YeL1H8nzXtWmecPBL28Rd/xUaRQNv3WkiyT+fTmZSei7E5ENbze6ENI5r2p07a7jCZB3yuHsoLjXQykXyC099mX0px96/4YLsia7KSewxya1XRNOMI6nJl7CZY/2X6sZBsc34+yZCwgQldTxe7+AGt154Uww9fAG/ClSL1QfGufSJqjrGjaMCdQDpatcQl0YPGI1j2Q+4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybT1u9Pz+LSHyr6qbVSc7UC7uiDkixo/ZESmgGSjo7c=;
 b=OuCtNTiwVOgXdqiE7Q0vECrI/m2z1a+glOKUSNXZFHn2O2RGmOc/IcqdZqBCQqW4TBT8xRbHLsgZw1ULb1evxpr7T5Gms2WOj2gu62L8IsEv/PTv8gj45gynZooy2bMfoFcjRflP3P46M5uLWtkKhIxXvVMJetwuCVW4d0AhWag=
Received: from MN2PR19CA0036.namprd19.prod.outlook.com (2603:10b6:208:178::49)
 by CH3PR12MB7668.namprd12.prod.outlook.com (2603:10b6:610:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 10:35:25 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:178:cafe::95) by MN2PR19CA0036.outlook.office365.com
 (2603:10b6:208:178::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Thu,
 23 Jan 2025 10:35:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 10:35:25 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 23 Jan
 2025 04:35:24 -0600
From: Nava kishore Manne <nava.kishore.manne@amd.com>
To: <michal.simek@amd.com>, <ronak.jain@amd.com>,
	<nava.kishore.manne@amd.com>, <gregkh@linuxfoundation.org>,
	<jay.buddhabhatti@amd.com>, <praveen.teja.kundanala@amd.com>,
	<siva.durga.prasad.paladugu@amd.com>, <u.kleine-koenig@baylibre.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2]firmware: xilinx: Updates to FPGA configuration APIs
Date: Thu, 23 Jan 2025 16:05:20 +0530
Message-ID: <20250123103522.1258499-1-nava.kishore.manne@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|CH3PR12MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ea268d-c9a1-4a06-63cd-08dd3b99a5fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cYS07VxzPTrEQt7lrzVuR/YJYbKZRItwz/UHBayB7ebI7kj10ejs4P+mEj/g?=
 =?us-ascii?Q?Mr4Q0Nb/qoS1P5VXV1P6w0g1QvMzSieSp4Ht5teef3mt2koHnKIHazCajOhe?=
 =?us-ascii?Q?JMF8TeJdcFcYwCfu3J3Ghf+oT3xkZmdumd99KqWVH03hMZ2SMOQ8VYagATtb?=
 =?us-ascii?Q?GCMzJ00EOJMIRb6JFh2b3Z2PDOkigByOsYNBJDSrxRaCp7aIv1yxDqXBIrFZ?=
 =?us-ascii?Q?NSIZpozrQrwI7AgG1JdbOWDH72LUiV6xAt7aiM0ud8I5VcMrFrVaH+TnPuft?=
 =?us-ascii?Q?rX1JXxRoQQWbbDKvLRwgFocVwpUOTDTJOFzwMnZfyD7dFnL9APU5ICfug3vJ?=
 =?us-ascii?Q?BmQhXhwtVrhYV96JGCxTYimRnv46JlbGE5TeBpwnqu0G0vHghbbW3lyMvxAT?=
 =?us-ascii?Q?rYV034dL4Bx3ZynVbnbl9CU4m7p79P1T0Hz1SUcWEM3FOtJbRWpX1gQN0L1E?=
 =?us-ascii?Q?Bc88UmVablGLZ0hdERv03hugTAiAkyH4yOqfelFMGHi9o2oR6ZPNsgZMXEye?=
 =?us-ascii?Q?qggA2vUDmKUQTZuxvSJNEmJ/2SMDDiHdRF8TvyhtrsGGBgYy2W5r1zkjFTsp?=
 =?us-ascii?Q?ND/oACSRdo0HqDpK3eIaC1qqDhKDgHj76NcCBChm8rKC3QMR2bF8AH3tMGHb?=
 =?us-ascii?Q?OG0kDBCvBKApFV0V6g4SHeQq8GObAJqE+Mh+7frS5z1cToN3ngpl/x8Fsr3p?=
 =?us-ascii?Q?FMeCEw7PYNu6wBR1DyDfGP1Gzm0IXPtAyVNus/ooJo56mUxKMA/lcF2JBLZx?=
 =?us-ascii?Q?5UDrzPc4ZdNnctX+KKTC1VuiSZPo5P4NqBa426uCDh6aWd+EjPhUJaQG66h0?=
 =?us-ascii?Q?NRtIMC7wwRB2AJtllG/3+8oMgixioGq4hb+/HmtGJ7Z/CeG8hwChg5Kxd+8G?=
 =?us-ascii?Q?juIVev6CRh05GI3PqVubH91myo61iK3NhiaNU365POcEHzaQb2/LvJPuWAII?=
 =?us-ascii?Q?obZS5iRFP0AXYVj5c/5CmthFkup+F7phJfoalgBSkTUxb8VV47RLLmdAMcP2?=
 =?us-ascii?Q?oqfwz0zrz4UNCY8O+InD1f14x0UmwukPUM/eZwzgO/f/W+KlYxhD7t/XEsq+?=
 =?us-ascii?Q?TbC2enn5+XDfN6ghQJH9xa99siO7wbIEIs6cMVlEYPm+LIK66dEmKuJwhFrn?=
 =?us-ascii?Q?BbcHIzkPKU86MXttNmu3GECkWIrZ0T8+WDL1x6SFrJUw+5C3Kp9dAcD7y9Uz?=
 =?us-ascii?Q?CIo/IH9nS9PZta6TTZyftJb0e4Y10RhOEtmDmkbGrX56rK50lcYOecKTnN/Z?=
 =?us-ascii?Q?y7Z+LoPQwLoppB6wbRmTHoUg2R0fHDtjF7CM7yxLjrQct00bKDQYkPpfl3DA?=
 =?us-ascii?Q?niiIfU2hgDbOgHh2I4nDyGbvsEw00P+7irYE81NxKZ4GWd7aSVuyCSedTdzn?=
 =?us-ascii?Q?wrk9drQ7xTpa3Qcl9tyOe8EUHqsMCgNSTkF+e5QRYPsAFIjl99bnAvhdIl6n?=
 =?us-ascii?Q?ZqhXPWBkiKfLookRLLHPKX7f+dIbYZxgEXGdw70zC0tZoxMmSyThcS3/d6+5?=
 =?us-ascii?Q?qkb5yaiZ2TpJP38k/R9haHRecTfHiCha4277?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 10:35:25.6538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ea268d-c9a1-4a06-63cd-08dd3b99a5fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7668
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_023535_567860_B2B4B3AE 
X-CRM114-Status: UNSURE (   8.69  )
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

This patch series includes updates to the Xilinx firmware driver to address
issues with FPGA configuration APIs.

Nava kishore Manne (1):
  firmware: xilinx: Update the zynqmp_pm_load_pdi() API

Siva Durga Prasad Paladugu (1):
  firmware: xilinx: Dont send linux address to get fpga config get
    status

 drivers/firmware/xilinx/zynqmp.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.25.1



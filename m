Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBC6EC1EB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yu68LxP7eITEkmyMcoPrfHhW4OQlXWrDcFUzmP0pEYA=; b=Oalc9D5ZCjhFV8GeWiutXywzRx
	WfmFYhsJrDktlZQQ/FyvEqAzn6pQUeZ+CQOhx6LVqasQA1KRfgIm3Z095MSVnj3c16G6H5xK0XCIp
	qjnfYVhIeQ+4ugSTJaEYUmj7ctf/mqEokrUPa/Yd4mskbhnso+P7Bc3l7f6dl4YcP58KEx3HgsQId
	XOvjNdPy1Kxho4kyA/DZ5Tfsj9/2D/klsztjMiB/KyifEnJWY1gqfyJeK48bfrzsrvMxf6C2jstyk
	v6Hmr0gJqEJ/EUXuTRmXmu2f1NoIvWN4M/RXIM94DCCK4Qy3mY8FC944I/lNJgxBNB847mHe0GaGI
	iTTwxzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnz3x-00000009vWM-0xY8;
	Thu, 05 Feb 2026 13:06:25 +0000
Received: from mail-northcentralusazon11010002.outbound.protection.outlook.com ([52.101.193.2] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnz3t-00000009vVr-0MV4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 13:06:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwC9YO6Vd7mnFSbfa5qtQxTAKDrZdh4iphbX6Fv8My/c9SlpMOvwwEGFYJKEBkW2xz9/3lt72q3oi635Jjg1d/SzS7t7X0ZyOCMBpwDzsG0Xx0mVwD03ySyaNr1bUAXYZ73C8cL3ML5vqWBf8NveHsoXXf3DL3Fts5vvnAtfq8Gio5ldsmcFXovPCV1NUmpxeK6b953g3yMhZOvEMk53utyAR41hNqP2qo6h4XyK1HkjTTBI9KJKYcnNSgiB0fcNvxr7qI9Fpg35+/NBhzq9n11JtPvRCPGIsxs4TsgTmwJHNMHhFDVxiQA9n4IwXxt3++6jc61mRxDznlG71wdxgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yu68LxP7eITEkmyMcoPrfHhW4OQlXWrDcFUzmP0pEYA=;
 b=G45lUcssMTMLk1akftkVpg0Ud3AHmOn01X4TO35wxfx0KMYguM+NLYO8mA+ertGTnzeV2PSwDf20i+MOJsPEl1xp9Wdk9EVesJnt+gfsSVuPJJHY49NOZUsnheXXdrVOIMH/d8935QidYuas5ywnrn7WcQZZh/rYv6KO1Sjuw5kfjuXmCJMtIIPf9SMnj/TdGZbO7IgQZzUpmUMoOXVKu8B/BYUIS84Cj09pWrG0+pxYWVBCfthFDNFua66DZILHm/ph4d2DMbL7iLOSVFYMKQTPCFYyd3Zd7Bj0kPplew/KIBS1n+dTGNHPADw8NVglh4hY6ZFv5e3nLAMnrJ6zGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yu68LxP7eITEkmyMcoPrfHhW4OQlXWrDcFUzmP0pEYA=;
 b=hddnTYN4JEB5y7adDR/tYN72plhV1Cv/mGE2O6h5/KqVKOmtHMUkgwFT6T+sStt9SVwapSs0DDA7ebdhzmzKvW+ok+WE7U9vAl5LaWZSCPZtjGSxzzq9Ab/T0fW+NUsm2y/b8pPZi9r6tJV66d8OpWZWEyhmJWlKPxYLn26uZCw=
Received: from SN6PR05CA0017.namprd05.prod.outlook.com (2603:10b6:805:de::30)
 by DS0PR10MB6945.namprd10.prod.outlook.com (2603:10b6:8:143::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 13:06:15 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:805:de:cafe::60) by SN6PR05CA0017.outlook.office365.com
 (2603:10b6:805:de::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 13:06:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 13:06:13 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 07:06:11 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 07:06:11 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 07:06:11 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 615D67av3026398;
	Thu, 5 Feb 2026 07:06:08 -0600
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH v2 0/2] Enable audio support for J721S2 EVM
Date: Thu, 5 Feb 2026 18:36:06 +0530
Message-ID: <20260205130607.2032818-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|DS0PR10MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b5b8ae-0315-4e1b-0164-08de64b75729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aEQH5t05ZPfyPQziU54qQHILI/jwE33L2ebQGG4IWHhp4qc2oTy6/I+99VZL?=
 =?us-ascii?Q?1+vJqxIv6OcrsqjIxJR+eFRqs/ZnHsH22k0IX6xOPIlFxeZpb2Mu18h6VBFg?=
 =?us-ascii?Q?pC8NeJNQMCjuRkwzYnbXCkYR8+5J+WexPugHhMV6a5OcWix2qbRnSlw+jJje?=
 =?us-ascii?Q?AmnpUezPappT4eGq0LpwdapPlsPAGfgeyDjZ0fusxp2NV9f3stUZgLAb7Z5c?=
 =?us-ascii?Q?QSGbWNtKd2qLmVjU+PdHiJiVbcSs01CAc/ctKGXXzAqU8J6KuD3/0+tUu73g?=
 =?us-ascii?Q?hyw4Hsgb4HYXLkYStPwDJ+HfObnstRJoN20IeV3/Z0fCw8of3kSLlLbqjwj3?=
 =?us-ascii?Q?MBCBQIBzBHkNZCF2YWuivBsg9hG4v7cmujuNyIuiHvqpSm0vCqrYAPCUa9+z?=
 =?us-ascii?Q?SQZNLzZZWcHkGR2UndkFLnPblEsJy0lKASODat2AGpE/VWkyj1CaRimykIvU?=
 =?us-ascii?Q?bLOkFWGi7KzAaiWSX2li4otGtri+fQU5pwY0d/Ns4piVXIVW4+f4bmwuy40y?=
 =?us-ascii?Q?1feHV5cvY7PFMXyV96J+2h91lMM/bgM/SRr2r+wc/Jbzx36Qghi+srJa4FJL?=
 =?us-ascii?Q?Qt1uNPEyYEsj+h9MRNIyKvP2Ai2VZ8Y2PSh7B2qKHnkKrx6OCvPYtevHcylb?=
 =?us-ascii?Q?SH4GjZN2oDstGUwVWSR2cCZTGAsjJeD/0zOQcYsdHemhjBWD4gam7UW7+IU1?=
 =?us-ascii?Q?ALkxn0u/A6//5hllANxF4IHoiyZBrBRqCDJUm58awOrtojt19QTiF8qsSJR0?=
 =?us-ascii?Q?J0E2QlDnyO6pGk2hgh+lBwcgyHnqU+27hlrOMItoHGOHe1hGAJGRcODnTazo?=
 =?us-ascii?Q?wxoY44K8PDF8cANKcYcKtzrmulOVWiAZTjqZYmJfurQQGXyEAHq6F1C2DywY?=
 =?us-ascii?Q?aPX/dtFWFYffj4MbOY8WyHfCZlvmd61GfyRZ0BqT7dZSVFm+0n0N3q5Yvyap?=
 =?us-ascii?Q?BeY7M2cgjlGwl5zJK4hxN3tWAlof0vJIO8Mg4FneSD+wAUnVUwVFxQ2SKSEc?=
 =?us-ascii?Q?Ba7Yrt2TSSSlw2mBbMxaaAmrKkWcLsaTA3ZnbYWNCDNflTR3N0gbClNkFfa8?=
 =?us-ascii?Q?rhwn/pg2moLRJHUbadhwSRgzR/qfEGpcKG2qx1OFZq1BJVh5DZ1aYYSV+af3?=
 =?us-ascii?Q?eakRr9xL3HPMCp+ZWAWf7pi7m82Wm7W+pyGiKwG1MhKLIawPXISNLN1c/atk?=
 =?us-ascii?Q?lPvM821kAxiGDzqZilDY53QN90W1apyvqaTX6Y8Hxli6idRhgi5bklr6man4?=
 =?us-ascii?Q?f9CGy4sOK+a8T7WoALaSAwTZJyycipU2TWSQqtD4i2nhVbfwrmIOSNY+MQxh?=
 =?us-ascii?Q?6d98NIBYU/B7wO4h49ujntGcnd2fDZ84pYHbwcFRYUSUEZIaox5JJskreVyY?=
 =?us-ascii?Q?dQ+hKJWW0sXRT9N1tqHkEopI6od7WwML6vf8sVFPFd1s20sTyKJTSmw8ZyYn?=
 =?us-ascii?Q?0uwaP9PDQJJ8JmFM8iFAHbB8RBGBiUwdLhAq8iNdlYvl6jLjHR9F76E75EoG?=
 =?us-ascii?Q?4Fz2gVDHTLQLrHEiWneNS3FhTxYfC2dMvlG7tPHwwi94o8/KmuXV7OsmPq6y?=
 =?us-ascii?Q?2JOtP510JEdG9epkccvbSRw7TRq/qe2aTp+ce9+kE4gLmzozCzAnqSfHUIEV?=
 =?us-ascii?Q?M9V6KykJG3PC7RX2YufbtDQ=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fNfV+KeJTpzK6AC2BtfCHAtg8lTOf34Vdzbi85N1JSBAC6PpwXJTh/x/PCTnVme7zzn9Ldpvsl+WMxnhSAgbr2vJMzsPdJzyozfB4+ihx87u0fVAi/7YJV/tDy+8zoSwsNYpnoo1cs5lYzVkztu5rG9Yc6lDEt4rZn9qbgf2X9HRslup0qhf/AZiqgMYjudbkw/qV4B6RPN40eGXtwJveBfpsUPZSqJaY4JKpRfGgFjh9BebEdvFPiizLeqzPe7601qvovKLX2IhQHuiaF2raM61N6mRIDxVkMj2q36GsV4WyU1T/Mc9YtPxFk0L5lXc6mo0dSsWBzlNxKQNZpYgurXFUaFCSYnnGkSTAprEiQYw5T7bIa7s+BMfHO0KE0STCbAuTCJxVfW6K9B0yWcSHwcuRpW8V0urlKJWlbXq7K9LMCRmUxa6Gd7UUsL2DdZN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 13:06:13.6995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b5b8ae-0315-4e1b-0164-08de64b75729
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_050622_134576_D895CF06 
X-CRM114-Status: GOOD (  11.79  )
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

This patch series, adds support for analog audio on J721S2 EVM using
device tree overlays.

Earlier version of the patchset sent upstream[0] was rejected as
its dependency[1], which resolves the DTBS check errors introduced
by [0] also got rejected on the grounds of ABI breakage.

Another solution to fix the DTBS check errors introduced by [0] is
to modify the ti,j721e-system-controller.yaml binding to allow
audio-refclk as clock-controller child. This is done in the first
patch of this series.

Changes since v1:
Link to v1: https://lore.kernel.org/all/20260112104536.83309-1-m-shah@ti.com/

- Convert the changes to an overlay
- Enumerate the I2C mux used
- Remove CANUART_MUX_SEL1 gpio hog
- Fix typos
- Add gpio-line-names
- Fix commit message to showcase the right idle-state for muxes
- Carry review from Rob and Hari

Test log: https://gist.github.com/Jamm02/8d3f079cfe866e50e2f447165c0c7939

[0]: https://lore.kernel.org/linux-arm-kernel/20250604104656.38752-1-j-choudhary@ti.com/
[1]: https://lore.kernel.org/all/20250603095609.33569-4-j-choudhary@ti.com/

Jayesh Choudhary (1):
  arm64: dts: ti: Add audio overlay for k3-j721s2-evm

Moteen Shah (1):
  ti,j721e-system-controller.yaml: Allow audio-refclk as
    clock-controller child

 .../soc/ti/ti,j721e-system-controller.yaml    |   6 +-
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 161 ++++++++++++++++++
 3 files changed, 169 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

-- 
2.34.1



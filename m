Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C07CF8860
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DYYEOFPWoEVjkcGAE9LGuwDHISGv3UD/3KyfbPOwadw=; b=T9SK8iB8wmVm4ig2LTds+x1rmY
	PnwcImcGUxdzvkv/BPB5sXWhpHgfUj7uherHkBtbqzfZB8pePbCR+JWYpacbFNNfWYKA7BUPgqFfW
	tBWzw1Pv8nM1QoPoljeGKC9kG7bguDGVV9OfYZeY5fXnB1gqn9mBLt1OKKWvoo37zMXqyKR9PV+X7
	AHnBi87sdXetHljiuE98zPoy4kBKytA8RvDR30cZVFTQ2QmdZB18fC6B1/gIYGHiDZPprLlM2X9OZ
	mN/5/bRByJjEBEmqJ3PbWHVaFJa3WjJNzWcsVIR5m1JwedyiCL99/3x0EDd9Q59+9vpCQT9PRJSTG
	EvQGVkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5Vy-00000006pUN-1EwJ;
	Thu, 20 Nov 2025 14:20:02 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5Vt-00000006pTk-2DJT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:19:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzrX31MPuUDN5O/Na6sA1tfNm0W0+1mgyvEcb1pMi/IwDERXWdkuS8pUTP3MlE3vNQQcL0M7QB3kLtd/lheNxoe5eA97hIdZmIXe4OApkPkvPgM01oznUt+SSXfIt0hda6hAJ4PMr2j14xuGzofvfEO6BOYft5VNpGW52RTkuC0l5EH17/ge8yFKswVKkmnJkJKpLNEArMHzMuIJXJKG8+gT2UIuG8R8YubwrnkTCdd3DdSCD0GKIoyh5h+tdV7Jq2VVJJ4KjPdBlOivChioK+6DhzGpEBgq7yT3sCzmKCAFromj6GjGOUixGE1h96XREGsBRWkHIh2O2lpOpOOa3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYYEOFPWoEVjkcGAE9LGuwDHISGv3UD/3KyfbPOwadw=;
 b=jFC+IddOqk6BYJZ4sc1ldz4lFjY4C8RxU+aqrXXf6uxm4wvD9O2hTx4Ih9tzutqHnyN6r6CKb22exKQaO0KdPTGgaHo/zloTrqw59Fx9YazD6denVtF1LEIxla3EqZIwASlLAOd8lyb11wHTt85w/vcxgW/Cej9viOmColCdO1YfApGTZjBr3AYq2TZdbdjAMAm9jFUc45XOGYU2hXCvSxaET8LkXb5UriY96pP/OM02L43OamqAdULR/31NUrhPzEgmMHJ4uvt4XCNWChKUmhiLHLNZBneqaKd9wts+24GYProBg6Lrr4T78WKIortKnZUKemwk0qStwNHVcTHVJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYYEOFPWoEVjkcGAE9LGuwDHISGv3UD/3KyfbPOwadw=;
 b=Ef0Fh4C0fN1M9O2JCegEkVXSXpHLusMGIj1Rsby1BUkF95SUoVdH3n8LvJhQ5ggYCxXP0tTm72L7OID33Iu/qM1487MXNtgSA1F2g14mtD+psggyRLrWaqEI7KbEQQHf3SJusZjVkgazfugeqbXNDW4cnKgHxr7/uHCONJfASw8=
Received: from BL6PEPF00013E0F.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:13) by SJ0PR10MB6303.namprd10.prod.outlook.com
 (2603:10b6:a03:477::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 14:19:50 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2a01:111:f403:f903::4) by BL6PEPF00013E0F.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 14:19:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 14:19:50 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 08:19:46 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 08:19:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 08:19:46 -0600
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKEJhP93791647;
	Thu, 20 Nov 2025 08:19:43 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: ti: Add missing applied DT overlay targets
Date: Thu, 20 Nov 2025 19:49:36 +0530
Message-ID: <20251120141936.190796-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|SJ0PR10MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0ad64c-4aa7-4f9a-b000-08de283fdddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qUdFRwegchPgAaXDA5XANZNWhclGboCDI5K1+3KgHFmN7BA6a2j4I4E9I1As?=
 =?us-ascii?Q?Dy6UqpvHq9LhoZ32W3ibPxGMPvQg8XkoJ+dOWTiCJkl/x2ioWwVjoTvkx2O1?=
 =?us-ascii?Q?rBAK4wpQ6T4i95I2MnBr3Zg1G6G0HrPHZ+r/tJB9hjueyv9tstdTKPBplVlv?=
 =?us-ascii?Q?GhRipFnvp8OeMwOO0bVC3NQrq+G/q4zA/guff2DNVWfpLTAzkLbtPi22eNU4?=
 =?us-ascii?Q?Gs903gZOgZP8yZwjGL7JyXzzh1bR8/os0OHmkx/QqHK3JBVxQBPVPH28jWhE?=
 =?us-ascii?Q?lznMg4lCuQISrAWqT2zO+nSJtmUa6n4sXKDa1C1iGckdZw3L4Bj7UJ7Cp5W6?=
 =?us-ascii?Q?7ExPzcRjwugbx3IlpAvpHbfXk2XSZYVxZi36DPISxaDrg6JxpUTdQbzmS7sp?=
 =?us-ascii?Q?CnoKsxZzquNbHWooxOmdSvoC0RSbixsU2SCdkpNJPi97sQDRJnWrBmBlM5TO?=
 =?us-ascii?Q?+tE2h+vF6uFw4igd+UIsCe45MjHH4ikyYhUtF9lAggYv01zD+R01NEHWloKI?=
 =?us-ascii?Q?0uT8ZE/8BD0/KVKn5Jvp+rmVhzCRkcAkRuldMPAvln8OHneM2TgRn9Pa6Nj9?=
 =?us-ascii?Q?FT5iEArkbeYsSlHPXHi7WcCs1IMxY9jsCpHSjMB8QDOFhRH1KtRN1bz4Oj4m?=
 =?us-ascii?Q?4JVVvPNXz8ihkKcy/AeF9pUe3+4t7L6D/8NdubAZIOpc3rpb88Dm9vq3runa?=
 =?us-ascii?Q?NJzrCYOz55cXWDlvCT1uB/2qZWy5sVO00/mHRjQWDs5WkF99Qwl4RawcUe9N?=
 =?us-ascii?Q?egS0jA0yIGpyqx1NGa4ehKVI9iLgCQRYlHorL+mPSvIF863dHVW3bSRLHJf/?=
 =?us-ascii?Q?9SAi9gfTALF7ma5268oO75gyYQzY04kHe6qAmpbbDT76i8RKxKH77mnAN346?=
 =?us-ascii?Q?ecxRzDjrKa1dHRBVXriaoGEAugB7HmhDmOklOuDtdKELKUZ5tGN6BREAYrWy?=
 =?us-ascii?Q?jqxAxrchjEhPCdcyJJ4b/s0L2Vio4UAUXrNv/Nhrk82V13+Frc5ip8EvdcA1?=
 =?us-ascii?Q?ik+1mkHNYvoivmxzRk3Mhu+sGFKHAjnCKR9ZmteUykYJGrPbQ/Hf2sRDqEX8?=
 =?us-ascii?Q?UOL0QBWOF4nFwytB6HUpDD9/EPPOQ5agfA0qecA3rPA76v2SYe19z2CKnmwF?=
 =?us-ascii?Q?5K1BjlbrgHq1niR+NuaRBbNnL0jNm6OH1OyrqV5Ci/ntRVPEqboOCLP88Gyn?=
 =?us-ascii?Q?itDL4rRhSpQBXrOpve09SyzIFv1oVZDiUQ8uJO56SIskPT4fQfmJ9cc21W3z?=
 =?us-ascii?Q?psgdfuLLLutTpk5hqbPA+fwOaFCBGELiIcrPe0cPWNytDglS0L2pOlP3ZaMs?=
 =?us-ascii?Q?znhDlvKHNMs8BOIHxM1u0twQBoW3FS/LLjbjMXvk8uptrX4REooX4D6fvgfM?=
 =?us-ascii?Q?leH6yX29zhu0MnmKtFFA8oZLDwouAxZAIxJoXh6bgojBltLFKZD1lpFVpPp8?=
 =?us-ascii?Q?6fmoHJ9nUtXH12SfHjDeb4nFyPhh1e/NLgDgOi4YyZXql08/47rRvq5nw6JE?=
 =?us-ascii?Q?DFC25nzPsp6yr7lE3PEH3oFU/tRo8Fq8iBUWSw1opQFS55dslwmnkFh88yBm?=
 =?us-ascii?Q?XnRb5bHtsYsnR1I4mnA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 14:19:50.1516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0ad64c-4aa7-4f9a-b000-08de283fdddc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_061957_756105_EEEA502E 
X-CRM114-Status: UNSURE (   9.63  )
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

It's a requirement that DT overlays be applied at build time in order to
validate them as overlays are not validated on their own.

Add the missing TI overlays. Some of the TI overlays have the first part
needed (a "*-dtbs" variable), but not the second part adding the target to
dtb-y/dtb- variable.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
[vigneshr@ti.com: create new target for J721e GESI EVM]
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
v2:

Drop PHYTEC bits as there is a separate patch
introduce k3-j721e-evm-gesi-dtbs as new target

v1: https://lore.kernel.org/linux-arm-kernel/20251117211316.725960-1-robh@kernel.org/

 arch/arm64/boot/dts/ti/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index c85a37cdb351..cf0c11a68761 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -119,9 +119,11 @@ dtb-$(CONFIG_ARCH_K3) += k3-j7200-evm-pcie1-ep.dtbo
 
 # Boards with J721e SoC
 k3-j721e-evm-dtbs := k3-j721e-common-proc-board.dtb k3-j721e-evm-quad-port-eth-exp.dtbo
+k3-j721e-evm-gesi-dtbs := k3-j721e-common-proc-board.dtb k3-j721e-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-beagleboneai64.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-common-proc-board-infotainment.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie1-ep.dtbo
@@ -192,6 +194,7 @@ k3-am625-sk-csi2-tevi-ov5640-dtbs := k3-am625-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
 k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
+k3-am62-lp-sk-nand-dtbs := k3-am62-lp-sk.dtb k3-am62-lp-sk-nand.dtbo
 k3-am62a7-phyboard-lyra-disable-eth-phy-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
 	k3-am6xx-phycore-disable-eth-phy.dtbo
 k3-am62a7-phyboard-lyra-disable-rtc-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
@@ -289,6 +292,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
+	k3-am62-lp-sk-nand.dtb \
 	k3-am62a7-phyboard-lyra-disable-eth-phy.dtb \
 	k3-am62a7-phyboard-lyra-disable-rtc.dtb \
 	k3-am62a7-phyboard-lyra-disable-spi-nor.dtb \
-- 
2.49.0



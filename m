Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFD1D262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 05:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DJIXOJeCmidi6bs5hbTBETX+IBIlm53rUnHNw8LUAXY=; b=12JVnmyYws9SKQKfhI//qEEPh2
	wHp2zCIlrTPv/rhJn9IX6sCf7ccLyW1D8mJJYNz7vYvaB2B+fXJ04U6suVzrE8VxoljTbl/50kZbz
	HZJ63haJp764IdnoV+Yq/F/x7ZBHD6I2V7qsZYIxtIwo9mmiytUz0sDIra2Ur+1c9ftl7FqSlTobY
	Jt1sZssM53zzYlTTZ8FTVjUVmJzF3sqyiTSUNd3QovtHdwB6P8c/ZZjEQqex+sTX4+r7OC4noN2Fx
	VyMVK+Jpw5JXMo1zwDCFoCWH0FS+rrRBFcNXoZyELYGr+ARSHTa4YwgxkQsESbcy12AUT4mtuisLW
	E4FS7feA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viQcb-00000004u2F-1grn;
	Wed, 21 Jan 2026 05:19:13 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viQcX-00000004u1t-430Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 05:19:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ae6wEYn6mGT/zMD2agq9M+3OndsdyjvzGWMIN7k7/Qj89X97KoBjpmzmrcNsMDvzP5t8tpgOEUUFdc3oBAhzIZFa7KNz+UqQdn1hvDoBrg3gEQyJ6Z+hNXMqB5G9kMTQg2Qn9xCY70RdfyU5ZoMH+bb4ZIxcKEN7to7SeX08Y5rVPBtFWx63MZuXXp6sajwjG6x+NFg/EDzXbXKczdt2Z9yQ1EHHfsYqgNPH1m7mm7NlZqA35iO9lylJpcjejBpL47bU85U1LgP/n7WUA5CHp041ecAbYAIw/ow6LFbkygQclt4JywI8V68hpmKWz4/8vI3dLnsiOQ/dQ/xi6KmFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJIXOJeCmidi6bs5hbTBETX+IBIlm53rUnHNw8LUAXY=;
 b=OyE2fPYD6DEapWSRIWmt1qmvSZmY0+P3I/pyfbPi1KZ+RwRtv8pCGw7lsmy5PA1StTA4sbtAV6+9i81zyJyQWSJe/ofNG/upmKJYj4PVZG7MRzUk9k6XCjeMlOz94aRmS6asHIZ672f8S+ZsCgLlgpWSsnfj6oMCcZ0dKa11OK/xoknnN3VMB6KZC7BSso2Be2dMHPq1sgW2nOlGPpjcRNTuXd92/rN3Vr4z06PfRKqCUw/vZIk6RJvYoC1a3y8WV5zHZjG6Ooa+w3XPajEy8ic2bMmVu9fRIVjLR3CbL6FoiPyFIGrwhXDQKg5+aRt7xZszl9+9wP83WOyidRhDzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJIXOJeCmidi6bs5hbTBETX+IBIlm53rUnHNw8LUAXY=;
 b=gvDgeptpQ3f3cOmQwGCnHeOOnAKvCemePukiqkahs/y8lvf8hvafmRCVbsvor0H1HKXMOHeSDAb5LO8ofEpo+vUxxjG1x5TRjp1JY5uiudTU8ouCFN2sSbLVf46o9tmGtZIvPCcAoLeZfH/EhgJneAX9/tBfBinTUpoTKxoJp+4=
Received: from BL1P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::30)
 by BN0PR10MB5031.namprd10.prod.outlook.com (2603:10b6:408:117::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Wed, 21 Jan
 2026 05:19:04 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::2b) by BL1P221CA0018.outlook.office365.com
 (2603:10b6:208:2c5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 05:19:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 05:19:02 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 23:18:59 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 23:18:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 23:18:59 -0600
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.235.228])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60L5It9f2436581;
	Tue, 20 Jan 2026 23:18:56 -0600
From: Anurag Dutta <a-dutta@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<a-dutta@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j721s2-common-proc-board: Add QSPI flash partition details
Date: Wed, 21 Jan 2026 10:48:55 +0530
Message-ID: <20260121051855.5890-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|BN0PR10MB5031:EE_
X-MS-Office365-Filtering-Correlation-Id: e03570fd-fae2-41b6-f133-08de58ac975d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AnJ6kaJWMvf4en+VCmsrEWCJkC6/A1z9bHh2YTwsR5kUp0TEqi8p9eJRl6ld?=
 =?us-ascii?Q?2mFyN39RCTN+vxADmQVOvNmP/Q0W0r+uh19VgvaODkby28rmt1JoqewO8NqX?=
 =?us-ascii?Q?mtH+hFaIoFF8Mo+n8IrN3dt4rUwAcT+Xe1B3Ar948jv94m9ETCzRIcBm3nKK?=
 =?us-ascii?Q?gHGO5pDmpRR3yxe81Bewon0goou9ipU4blUIBHiZkdterymIq3YBTu/kK7Gb?=
 =?us-ascii?Q?M+kqHWj9EStOY33WfYz4wNQX3lvpuSNC0e2BzwIcz6FuwXOVeSbf+/TwI0Qy?=
 =?us-ascii?Q?UeZEYXtNXpJhBfQH0QPGHexbp5YcdIuBFb49MWnYqVCiDAhrY7Ry00IhIWwS?=
 =?us-ascii?Q?oUtC+eKyp8Ay+zp8YlXjIpDrD4v8VgMhms0NvxOJCHo8IJNDwqal6+Bptbg3?=
 =?us-ascii?Q?HiMYfLj+O7cVSnQV2sxwkA8J9/7R6UihMem3m6tqnTjR8++F/LfxuFmDboyt?=
 =?us-ascii?Q?FY1fJKHBIZY/D0hYeam2vc2DMGkyoHMGh0iUdM1r5pXpwTkE65r6SQ1SCVjY?=
 =?us-ascii?Q?tAvHilloZbLKku8qa9sYbR0qQbVMgtzAWz9WmUPeUDois80o3Zt+Q0uWsNoq?=
 =?us-ascii?Q?S06FB12iTO/JSJO4BpZJ19vr8Y2Ky1SzN41997NYJ7T3nLVyWMNbsszfuoW4?=
 =?us-ascii?Q?1CDTuiDG59CjRlT4Hfb/UEbGCH36NrwfSfSEzv+Rvhl/S7hgHBq8BaqHrvm2?=
 =?us-ascii?Q?b4l7u82rzsc1Rgn58Xh7GJgyaTW4y0lunWhWzHaD3u4izkiwLht0kHvq68/H?=
 =?us-ascii?Q?HXILixmWzYMlVSLB/wkr3E2DmDdD2hsDgqnTaRFTdf8i3Z0/Qbr8n3Wfa/EA?=
 =?us-ascii?Q?UPug5eeIn8L0hz1F5u8J2WHU+eAeWB4PFTP1BhH7flFmSaaLUbyccxntJr72?=
 =?us-ascii?Q?I4xHauluLLAUcYek3fJaBuLEBDGWT7qE+F0MknDesRf5DXRNW7WTyB2Pwg4d?=
 =?us-ascii?Q?0t8f8Xat0hrSVMg3XkXG1vIaVjSG/UEQZYX03kosM8vSreGR2sOQ4r3zPiSt?=
 =?us-ascii?Q?cKK4CqeHA3zOj+zCRy8n5U5IN7mfoXuXolYzzOVrRQCL2GNoCMmQkQxqjNjt?=
 =?us-ascii?Q?vJ+90ou3nS57nNaNbLtiDtV6/0TB0+80D5pQSxIQGaYaosVLiL2NVYnZZQpw?=
 =?us-ascii?Q?TK8SxicugHtky0LNYcel+wUEP4MFR939k31kufcOe3QOZizxxzlXDF7VK/M1?=
 =?us-ascii?Q?avgTU/7DT9yHNMmQMIwojtw+Ru+znkDIAMbIlcVRZ9Et9MtYlBceajPjB0wW?=
 =?us-ascii?Q?J9hvuxaxeSQLCAAxg31jO0LLtbb52US2KqUVr6dpM+JCEl4WracA0FuZkLCA?=
 =?us-ascii?Q?pSkq4OySuJINIaGuXNRXp07LeiPKYl02BuEPu8BMD33sjXyZJdyaza6LjKOX?=
 =?us-ascii?Q?P2gQdJ9O1KdzTpNncTMh9huD7oxQHiEMq64lyAR6fd3OStWktQ98KfpmeyT6?=
 =?us-ascii?Q?QKOb52/XfImrHUOC+4QWjOxmTRsb8mHy1RM1Uiz3DviZh7AOLZnopMZc4Zxx?=
 =?us-ascii?Q?qmU5hogcDizD7qbZUo6qNrL/XNRp2Pfm3JMCQIlVBUcY9GbC+dT5s49h13Zi?=
 =?us-ascii?Q?C02mg27Elbm5xwYNqT2hNuAjcUBnaPRomOp0efvimiRzVESLV5/GYNYOZPTf?=
 =?us-ascii?Q?E+JGeBdl653QtoQnM71HXHadSfj972Wd6An7/ARFTbexHuwv6CQ9HatmndvB?=
 =?us-ascii?Q?7LmPFw=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 05:19:02.9052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e03570fd-fae2-41b6-f133-08de58ac975d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_211910_238503_F9AF4A29 
X-CRM114-Status: UNSURE (   9.04  )
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

J721S2 EVM has MT25QU512AB 64 MiB Quad SPI NOR flash connected
to OSPI1. Add the partition information as per bootloader.

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---
Test logs: https://gist.github.com/anuragdutta731/b65f63f22c69317d714b65a201438cbc 

 .../dts/ti/k3-j721s2-common-proc-board.dts    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
index 4fea99519113..7faf9367dbb2 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
@@ -530,6 +530,47 @@ flash@0 {
 		cdns,tchsh-ns = <60>;
 		cdns,tslch-ns = <60>;
 		cdns,read-delay = <2>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "qspi.tiboot3";
+				reg = <0x0 0x80000>;
+			};
+
+			partition@80000 {
+				label = "qspi.tispl";
+				reg = <0x80000 0x200000>;
+			};
+
+			partition@280000 {
+				label = "qspi.u-boot";
+				reg = <0x280000 0x400000>;
+			};
+
+			partition@680000 {
+				label = "qspi.env";
+				reg = <0x680000 0x40000>;
+			};
+
+			partition@6c0000 {
+				label = "qspi.env.backup";
+				reg = <0x6c0000 0x40000>;
+			};
+
+			partition@800000 {
+				label = "qspi.rootfs";
+				reg = <0x800000 0x37c0000>;
+			};
+
+			partition@3fc0000 {
+				label = "qspi.phypattern";
+				reg = <0x3fc0000 0x40000>;
+			};
+		};
 	};
 };
 
-- 
2.34.1



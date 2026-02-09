Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891B7E7E0AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+NwwBAoRxT7rtPAm6TEeI1TmrnhChLpvgCDZzXa1kq4=; b=2AeSqwpvngArJ/101uNzChCavP
	vyy+Y0X8zongPhWFH8eHRIiCEgj4IRk7aqXTh7eE2vGZIJjMAAuPM8RVy5WPcl9Epi0Joy1OxEd8Y
	GjFLjS0bQD3vTHuCMQVrkkC8IfoFMv9sVwoh8qRwXGivgJvEhwUFRWt0Q8Eaza1xXleVPlAe9FLvN
	lnEoGr7GmxY1e9ynnYKfDXOjGUIepbf9PTjfkbzGA3tPxpI5X/p+U2+QRYS2EIX8zhMLkAEftb1mY
	jVnNf6tL5exTSZ36Bq9oqhW057XQ7kzvWTXluEJLci0jvzAEEUS4BQiA/yfyh5XzCqvGG9fMBtJth
	u2MWUt1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNbC-0000000F8dR-2Kvy;
	Mon, 09 Feb 2026 09:30:30 +0000
Received: from mail-centralusazon11010009.outbound.protection.outlook.com ([52.101.61.9] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNb9-0000000F8d3-2SgC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:30:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uC7yv53XOE4Li6JBBd6Xgy175SfWJQ7YURjnJh/D+OwQQIa/W9lYWgfVeK+53Tn5lvE9nuutw7g++gErcK5w2MqcyBrvHut5jD2b3UkOEVyvqn/WdQvl+Ab43xoFXpyRLAsZjCu0OMBBEBKdJAg/vSbS0xJms3n0o93APRdXBj6dYmBqpQPCkwInGpQ5kQDWvca+DLtp0eExZMYnZvzpFITJiKGloLY28Oe9nNtnMMeLRyCx9Se92rQqMfreyZQ5jxyr1l0JgPbcVCcyOEKiGL23AYXDPZVkTAysEBihNJL4NoNhvIa5pdA5/dN7lXgxI3rzGaNz7+lU+oUnt+sMbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NwwBAoRxT7rtPAm6TEeI1TmrnhChLpvgCDZzXa1kq4=;
 b=vanJoOXFmc/fDXBvP4ncNdk+OXiwKW64xuEnvBarGQh8KOYtQ9Bjrqy+MbMGwzvvse5ZmY8MjyghOeuMLiyTqGaHx/7KN2xnrzxLLl3hDwIZJ4w5oRx9SbiIQm1iCjS7fPYwEAFyxOFfEckGglYXlsl33hzkrfxzYk/DEB6wJuEP6+A6ootTyQBYNmN8eXmqvG4tlacekwmIH5UgpqGbAqLSTjJ6AXfGHiixSHVaqiPNs4zwWtwhfcGmf04AHUsZ+xZwvMy5csRp2bKfiytPPJ0ah4lUiIMXNOwjOP4ESg4KtV5039asVuj9H0oZxFbs69EU2jvqIlwcpp+i7ejA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NwwBAoRxT7rtPAm6TEeI1TmrnhChLpvgCDZzXa1kq4=;
 b=ReI+8u9vZi+EKZ3z5oZ3wrDcpvu8AVp3soZmcDE1vkGFP0m/O+E2Vi0HUWzOHgPGqxPzbeWdtLtmh+xRoQWGnnHugN19r2br32oJ+FftJBcoldLDg8J3SptEDzSEb89Cof8wjvIC7SYekYTiLLOxiNz0s5e+g3MVUz5Ld1c/Kz0=
Received: from BL1PR13CA0073.namprd13.prod.outlook.com (2603:10b6:208:2b8::18)
 by DS7PR10MB4863.namprd10.prod.outlook.com (2603:10b6:5:297::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Mon, 9 Feb
 2026 09:30:22 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::a1) by BL1PR13CA0073.outlook.office365.com
 (2603:10b6:208:2b8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.6 via Frontend Transport; Mon, 9
 Feb 2026 09:30:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 09:30:21 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 03:30:20 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 03:30:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 03:30:20 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6199UGra1756079;
	Mon, 9 Feb 2026 03:30:16 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <b-padhi@ti.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2] arm64: dts: ti: k3-j7*-ti-ipc-firmware: Switch MCU R5F cluster to Split-mode
Date: Mon, 9 Feb 2026 15:00:15 +0530
Message-ID: <20260209093015.3454340-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|DS7PR10MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: c7049442-da66-4c6a-c58c-08de67bdd8c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cdoMH/XGCsaTZyzV47yXZ5jLOX7Q4Dd+FgdPs9JYX2G+MwjDuNnh4jYIFl94?=
 =?us-ascii?Q?P1lQBmZD4OcYhIZracay7Ln29noP36P8QDxHsVkP2MapimcxPQTqex5sxLxQ?=
 =?us-ascii?Q?4NYfTHP6UR/H43WKIwcQ3oDkBhIsUtR3swf/aKoQ0ENU5LzDDELiu1d4CtGb?=
 =?us-ascii?Q?gcqlS7Fa7Mm6YT0oUSljp9E/zWwV12199PqTuIbFcgX+YAs//DR2EAmUke1n?=
 =?us-ascii?Q?APmsM0LPJEnelIAdCHX6rMq/ZsIMMSkoEBq3NuV+HVB86ZTq9VYdCmryNsWR?=
 =?us-ascii?Q?QpXnOQfPgF92QcxmGM3Yf7+Oe/HiNYo646DjMgXjkxDWvGjQsk4IDGmLh8UH?=
 =?us-ascii?Q?RpU0RxacvqEAJZKRF5Y6eWT4vsb9I2c7L1Iduq1xXH8JNeiI513qEuc387It?=
 =?us-ascii?Q?sIB/Ze7hP3I9KOCbHMsNjy63oLQh7e95cxY7WnoXDyVmqmXmRdjEj9XSFWPz?=
 =?us-ascii?Q?66s09u8txoWsTXgpgfZc7K7d1h/26e5IAjuEFvzrHV8wxuHjVpVDpZWuHxhj?=
 =?us-ascii?Q?9Ut7oHZLbHMpZGeo0aH/hlkZUTRpn+ZHNd6OR1w1jcHEGKVvEiLCTTi8uXtv?=
 =?us-ascii?Q?QZJPkZJQRavI65RWkezfp32ayIeXXJEDDa3+jaK6f7sPJdL8bIN5kbNAAZ4r?=
 =?us-ascii?Q?e0jy8q2etb9FRCqXpHHEBeHuSG7hoh19/bXJ1oMyVuluKZd58XDv6UTFP0fM?=
 =?us-ascii?Q?qlONHC5BHR2/6xxVYpsgxxrF3UtZ67DIeV2ktvpEYn5Bzatm6iIA+vqPK3kt?=
 =?us-ascii?Q?Y16pKuw8p1Rk3Y2kpguvAq/USb22jnETWL81zTQ8mzXFTyF/mAdMsA8PQk6k?=
 =?us-ascii?Q?6Q4lDQNccV4znxmw12p5TCSVnpJWiEMWj5jGZsstJG/WSuxbAlNlaHhPLXLg?=
 =?us-ascii?Q?WTrisz6GOfBrMzURA6fIiqqMwGeECzM5B0ELKFUAzu6Mh3p/Oef/4XOezST4?=
 =?us-ascii?Q?TDy1hcUVmRQ5ahTt2gCZ7DLdxmDwp8SLU2jpM1lZfFaTjG3D8XmIH6sM7yHM?=
 =?us-ascii?Q?sYERUcNzntIQ8mFUxxYjjpkeW/BCmeLm+Xl+jsUJ9M8Pi2Evx7lJsrUkS763?=
 =?us-ascii?Q?h+oFT3cIbOu5MUHXKm9HC1WsJ9z/+XNW7wKApMLFnVwH74aC3J7m4okq/cT/?=
 =?us-ascii?Q?2yRNaiHvU/5XI9wTHInz1TEtQP1JOTetoYHR1kMaHVmCbIjMrS6gzg76D56G?=
 =?us-ascii?Q?WwDpYKLryIH4IfY1Ha/MCh5VFoXIE/iNMUwJ4xR+SY6lQ51PateDJ8ptV6qz?=
 =?us-ascii?Q?HaXMUfbSk+HTUDcTMg99cgfPmSYSdhRv1T9Kll1nW9qi6dJegRXtaXQja54N?=
 =?us-ascii?Q?Hdrd52wW1jCnEyrn/l3O0sZjVoqD/9rRVL6mm5N7JxZ8OTgaiqi8vfQBMVgQ?=
 =?us-ascii?Q?t0AO289Xp1BUffcqQLl1at4JK+2qY8JkpO9rGZASXwXSFBttcUt5RBljCg+1?=
 =?us-ascii?Q?dLq4gcfPGAXwCnSdaRZCepLuDCN3tLpnrTHxdvoZi3gzPKKkoreKfiTa9mx1?=
 =?us-ascii?Q?uwbfMDSJp4stQFFQDlEqWE7GGT5h25JrIO2EsXI6awipsKBpQHw9c0vDZBmo?=
 =?us-ascii?Q?w+K5AJAfhAnfuwIlVkwSGuv6qFn0YjZG8utnUIkYXXsJUksttwKG1Pjq/tXj?=
 =?us-ascii?Q?qTphuNpVKWtGEDw3Fis/XtI+TEkMw5B7g+HH1yfjfmpVbeTJRW7ItTQMh4vG?=
 =?us-ascii?Q?zQgYf7fe/+uY16FZxTaSa99xGMc=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0Zt6ImTdqEkftAj+E4OV2AboM7+6+wFM+H++HDutfBGq77D07/d6KFocFPWDxRU3Prwa7ap3Vr+QQekCAf2W5sySh7R5WqgHH3UMSMyiVciAfn5zkML0AdzJb4jU8eu/lOxpX8f6Ps/JinIIKOPJ2RvShs3xQkMAwDc6FZY24/j0YXSbi8czPCOl1C0g5pCJWzO7Nl74/Sjb76AloxzGd5kVzpVOqtpATSLiiohfx32PL0XvXRBRTYrqz0q1nuo7lHtccEHUM9DZqXeHz6+0oZVOCD6mPVikDWs9DoatYoedYp79CFJJFAh6MKyUAQOvu0xF2xmYZ5bsUkZ7Ff6X3kGRPImvIwPARIcb5CaTBxEdrPSjS0hxUXJeFmYyAGDzpTwSP9XshjhYNz+6y9FUt3wQMBusCuA59QKa5SqjduSQHTo18AsIvlkgaX2/+Zwx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:30:21.5251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7049442-da66-4c6a-c58c-08de67bdd8c5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_013027_790644_82DE7552 
X-CRM114-Status: GOOD (  14.00  )
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

Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 have a
R5F cluster in the MCU domain which is configured for LockStep mode at
the moment. The necessary support to use MCU R5F cluster in split mode
has been added in the bootloader. And the TI IPC firmware for the split
processors is already available public.

Now that the firmware dependent configs have been isolated out from
board level DTS to the TI IPC Firmware DTSI since
commit c5b645dbecd6 ("arm64: dts: ti: k3-j7200-ti-ipc-firmware: Refactor
IPC cfg into new dtsi"), switch this R5F cluster to Split mode by
default in all the boards using TI IPC Firmware config. This gives out
an extra general purpose R5F core free to run any applications as
required. Lockstep mode remains default in the SoC level dtsi, so
downstream board dts which do not use TI IPC Firmware config should not
be impacted by this switch.

Users who prefer to use the fault-tolerant lockstep mode with TI IPC
firmware config, can do that by setting `ti,cluster-mode` property to 1.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
[Andrew]:
 1. Posted this as a separate patch from the DT refactoring series[0]
[General]:
 2. Updated commit message to indicate the refactoring series has been
    merged, and now its time to switch the R5 Clusters into Split mode
    in the TI IPC Firmware config.

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-34-b-padhi@ti.com/

Testing Done:
1. Tested that this patch does not introduce any new warnings/errors.
2. Tested Split core functionality of MCU R5F Cluster in TI J784S4 EVM.

[0]: https://lore.kernel.org/all/32d4b3c2-4017-4ad2-8527-493b6d3b7ecb@ti.com

 arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi             | 1 +
 arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi             | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi            | 1 +
 .../boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
index 9477f1efbbc61..b66faa2543f71 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
@@ -94,6 +94,7 @@ &main_timer2 {
 
 &mcu_r5fss0 {
 	status = "okay";
+	ti,cluster-mode = <0>;
 };
 
 &mcu_r5fss0_core0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
index 40c6cc99c4056..abd0d137d860d 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
@@ -211,6 +211,7 @@ &main_timer15 {
 };
 
 &mcu_r5fss0 {
+	ti,cluster-mode = <0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
index ebab0cc580bbb..54ae8c86901ec 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
@@ -183,6 +183,7 @@ &main_timer5 {
 };
 
 &mcu_r5fss0 {
+	ti,cluster-mode = <0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
index 455397227d4a1..ff9a296b927a8 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
@@ -254,6 +254,7 @@ &main_timer9 {
 };
 
 &mcu_r5fss0 {
+	ti,cluster-mode = <0>;
 	status = "okay";
 };
 
-- 
2.34.1



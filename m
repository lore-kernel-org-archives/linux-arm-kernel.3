Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD781CF3943
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=43gm/Usw8ONG6hyLXxmbY2+lk2y8vyhYf7JajfQezn8=; b=L7bQyX8ZmMJkZD/ksR5c1nZ1ox
	kxLfbqfK6UAflzi2hqVTr2h7y7Dav6NzkmwEBsSW4pnFTcuQpAUrtLBCtsvYysXBkJYHTib8nDho0
	V7IWMokhzpr/Uu1gQfBdC0AeJUJq0nzt7jV928IUHg9g4i4H6xACvojk3loUM9l8pa8868fxNfXBk
	yfX/y9cnTEV4rm9yp88bvT/5VE+FkUJBKSpyDCFuV5r/W4p5NKaGfsTn+4wpvHf23sc8OPzVuG5hu
	565VxN55FrUQVXwnH/C584CZLviC6QUJjouzfNUfpfIoKP34YuRSd1rOxvD+yisTlRZdnbYZ15Qqh
	lAfjVJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkct-00000003cu6-1vzp;
	Wed, 19 Nov 2025 16:01:47 +0000
Received: from mail-westusazon11012054.outbound.protection.outlook.com ([52.101.43.54] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkcp-00000003csz-48bz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:01:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=up/rp9y9HByZ8eyFc1oHOJ7ov+XHyIKyrEk9OkFwEkkkuQY4BxDGjM0VY5N01ttmcEfteJ0Q6DqBYgR3T+GvhGJXWI8zwtrm8F6zRfdSkb8X3k3vDDsmWfL2frJ4KGIoYUEpf3TH5QzeqWf15CP4Fp0J2bevb0iQ69KzIyqVboUJZ9VQNteFxlChf8TgyG6uCHL7LySz8uEOYwogRCYuL4chkb5QL5svzARVdPs+Yh2O1g2I4dF0Jn4OyDfOhev5JFc3GPdN/LzU6w1BbIhx6lR1Q62ufjDh+4q4SZ95sqbrrr/c1AsrsQlN56Rev9o0OcMFbGVg+81lOKQ0Fvetxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43gm/Usw8ONG6hyLXxmbY2+lk2y8vyhYf7JajfQezn8=;
 b=acCF8X6vWav0bRJd7QEuYuddXxiADe2kNyIqSdVekcQyCAzw8eAn91wM94bamAPwl3Zwvphq4XlsxjuILHuBPbilUTC6XIiO3dCC/DZ8tmghXWHKDwA3u02IXGGLKahfHP5/crGypuCnOMOVieT1Pui5nd6f/+6PU38XX3yKcGxe2JTUquKhty44Rg9chlMlMEgot0jiGrcvlEvqY2KxGzaFaCRO0Uq/71rtDsN8HTq9YDy9UP1RFPCqBnGYGXPtmVXRWbk1CcC6LhPtn08xv4XWbi86bvgyUDAQYgWPaYdFPYP+iQxtzL7mea/3650I0wRMlUhMgb3jyOdwJC9B7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43gm/Usw8ONG6hyLXxmbY2+lk2y8vyhYf7JajfQezn8=;
 b=NtHxxeifXoO2ACmT+IdSK6Tlb/UXerZxIWgqL/tEySesR+Mz4PmXFUaq95g9f+2tppqftq1IThdoAyY/8lu9U2eEJJxF0A6/DjygcNNhPSEHnET3M8rzMcziLCHxLG/zhd5ZXB60H22kcLlhNQKAtbSdpCLDl5dPvhk+giMVFVA=
Received: from MN2PR18CA0020.namprd18.prod.outlook.com (2603:10b6:208:23c::25)
 by PH7PR10MB6083.namprd10.prod.outlook.com (2603:10b6:510:1f9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:01:40 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::ca) by MN2PR18CA0020.outlook.office365.com
 (2603:10b6:208:23c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 16:01:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 16:01:38 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 10:01:34 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 10:01:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 10:01:33 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJG1TZ52150953;
	Wed, 19 Nov 2025 10:01:30 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <y-abhilashchandra@ti.com>,
	<u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-j721e-sk: Fix pinmux for pin Y1 used by power regulator
Date: Wed, 19 Nov 2025 21:31:05 +0530
Message-ID: <20251119160148.2752616-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|PH7PR10MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd874f5-84ef-4a8b-c847-08de2784ec72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ns4WSKUtbjmTmJ1osO7dy6+JaS+aJdIRZ5YLNQpD7RBKiZGLF9OWGoasaDpj?=
 =?us-ascii?Q?O6t1M9TJIMhY24yF5X3IH+ZqfNU6vNMHEQXDhZi1tQRN1DN0k0jhTtz9/MnE?=
 =?us-ascii?Q?ZuzFabTp1O22/zyBJZi8U5qYg9k8eeu1TwtRqw42I8j8spwTBzzNfYO9Z2nL?=
 =?us-ascii?Q?S2ligcMsHmo18YceaYBKlyZfN+h9AABew+PoxNgYpBy+dQMzBH+piRepi5eN?=
 =?us-ascii?Q?Ht/n7zNa7bpROFVmWdoaK4trPBhXftvWibnG+fGkhIUvqdiuH1sR19LGeF7u?=
 =?us-ascii?Q?1DVAeiyLSXA+vJ/FqcJUWEvL/bJUg5qk2N6SKrnfRMaCmGWGg8nNE79+aAMh?=
 =?us-ascii?Q?sKvZ6YktUbwzg+Lvs+VZ888ZXxVF/Q5E2xlkCnkaP8Ca3tH0W4OoF0WHyTw6?=
 =?us-ascii?Q?A790NArcZEY9xoP0C74xT8wssbF/W0RPQJxCTw5mRblouTQUCnLn3q6v3C+S?=
 =?us-ascii?Q?dx7/sZs2uIAX6QI467+6abvAXBCn9vCkEVYxym8OTTT8+RHubZyYwdNnPT/o?=
 =?us-ascii?Q?0uuS1Pog8zr8LBBGqQumMsFPEYWr9iSAilUmmMKPbgY3QOUkv4ck6B2iUlzA?=
 =?us-ascii?Q?KoAXpT55bowIVGRs82e/OBSKbYbj9HKw/wbss6nXFHxhHSYs2lhrnUqyi8W5?=
 =?us-ascii?Q?flmheLRLLWIT6i2qj6VIaNw6Q60/bwbYvtTy6uA+z2ezDhPY7h0QFd2ekv0x?=
 =?us-ascii?Q?kr6hkRmboywQ4Abh0wdrG9OVDZ77jPaqQ/lvGx/u6pwlKdylEbMXfzLtYRam?=
 =?us-ascii?Q?rlRMW6cuFAFqt5SRsJQ3jju1357MHUazk1q9euVH9z3nA+oXdR/Zl8RtNJWX?=
 =?us-ascii?Q?PlL9bCYZ7q/ukHAzIIF4pMfdB0ogD4Agq0WIM7TpCFZXlFLZ0D9CzDvTyXnF?=
 =?us-ascii?Q?yiJ08+Y0RE/uH4G9wq/FfUDK+m0/xY3hKgVNIY46+sSDwOrETeEgvoD782px?=
 =?us-ascii?Q?8voaPwY6ZixJLBaZEItzf112eeLYzsYm66HKzDpt35wX5J5kKK1VKN/RFp5U?=
 =?us-ascii?Q?xyLnv+Od+kKL0mO103oIOS9lnmiavZM6k2WOsImFNTzX/P4RrYclAsXmV8sg?=
 =?us-ascii?Q?Hkgal+Olht7z+1KcC0CgjSQ1B9yolD4RNzezTyplfvWimD+g7YM3amin6xug?=
 =?us-ascii?Q?O4NC3+tFzwBiiIJ9yiB/6g9j367fsJ0JOLEs+A8yfdXiwOmy1oqNd5X4pwru?=
 =?us-ascii?Q?JZgVuWXyfEW4ZFh6rqTRBq15CuZmAGpVPjtdtcmndKbxGy/FUOViKdaoGVpR?=
 =?us-ascii?Q?KOUu/ig7lHN/3UaP2oFmg7c3G2B2RdAdLKZO8G/M/vrweoarYh4b8OR34PDr?=
 =?us-ascii?Q?koNzQwAhaGKJ6xsi9Smi7C5Ps9vLk6iRpWPzGzrwcCqA4bu5YbDCpP2TV8td?=
 =?us-ascii?Q?O/htYvbHsOTI4moWdxbhPqINB+JLcAPEK4TnLbKz0Ac6bp3ZGrIjyMU7IXUD?=
 =?us-ascii?Q?IdrfbUp4whoR9yFB4zOtuW2r+SrlVsQrYTXdF7JfRhyhguSUN4jOv1oC/cYH?=
 =?us-ascii?Q?du83d22U84mWBOAc3NpPRZMwAprZEAXYHqfYS3O0aBpZY6Ol+Mzfoi6Apjuj?=
 =?us-ascii?Q?pjg8ib2ZxYRQtKFXPWI=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:01:38.8133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd874f5-84ef-4a8b-c847-08de2784ec72
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_080144_034631_FF1D13DA 
X-CRM114-Status: GOOD (  13.44  )
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

The SoC pin Y1 is incorrectly defined in the WKUP Pinmux device-tree node
(pinctrl@4301c000) leading to the following silent failure:

    pinctrl-single 4301c000.pinctrl: mux offset out of range: 0x1dc (0x178)

According to the datasheet for the J721E SoC [0], the pin Y1 belongs to the
MAIN Pinmux device-tree node (pinctrl@11c000). This is confirmed by the
address of the pinmux register for it on page 142 of the datasheet which is
0x00011C1DC.

Hence fix it.

[0]: https://www.ti.com/lit/ds/symlink/tda4vm.pdf
Fixes: 97b67cc102dc ("arm64: dts: ti: k3-j721e-sk: Add DT nodes for power regulators")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---

Hello,

This patch is based on commit
8b690556d8fe Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
of Mainline Linux.

v1 of this patch is at:
https://lore.kernel.org/r/20251118114954.1838514-1-s-vadapalli@ti.com/
Changes since v1:
- Collected Reviewed-by tag.
- Updated commit message and $subject based on feedback from Vignesh at:
  https://lore.kernel.org/r/6d6a1eeb-503d-48be-81bb-df53942b321c@ti.com/

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index 5e5784ef6f85..77dcc160eda3 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -474,6 +474,12 @@ rpi_header_gpio1_pins_default: rpi-header-gpio1-default-pins {
 			J721E_IOPAD(0x234, PIN_INPUT, 7) /* (U3) EXT_REFCLK1.GPIO1_12 */
 		>;
 	};
+
+	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
+		pinctrl-single,pins = <
+			J721E_IOPAD(0x1dc, PIN_OUTPUT, 7) /* (Y1) SPI1_CLK.GPIO0_118 */
+		>;
+	};
 };
 
 &wkup_pmx0 {
@@ -536,12 +542,6 @@ J721E_WKUP_IOPAD(0xd4, PIN_OUTPUT, 7) /* (G26) WKUP_GPIO0_9 */
 		>;
 	};
 
-	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
-		pinctrl-single,pins = <
-			J721E_IOPAD(0x1dc, PIN_OUTPUT, 7) /* (Y1) SPI1_CLK.GPIO0_118 */
-		>;
-	};
-
 	wkup_uart0_pins_default: wkup-uart0-default-pins {
 		pinctrl-single,pins = <
 			J721E_WKUP_IOPAD(0xa0, PIN_INPUT, 0) /* (J29) WKUP_UART0_RXD */
-- 
2.51.1



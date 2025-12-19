Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA312D74970
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4c/muDmRCL5PaVeiNz/HaFuG/9LDeEzOobqwK1aIc64=; b=bhkQljRDoeVkLI2uZuR9Nj7Blu
	hzJXEQ6YX1w0/Po7VmtZTNqFkvRI8aC+lVGNdSZUNsKf39mhL47rlcGK47eEcojxnVKL6UkxD87kX
	6lGwA9YoXaUF5RmLWtW8dyGnjQHiYBs1jlWGZ9YeKAfjjqMdnXHEL+lVw/M0pcZTsbVDRociudChg
	fnNf2CMFZp96rZZMzfu+XSYVly9z2U/qyYyy0xoWmmVQ45vzq2EDABAAOZftvoCSVZo5S55PrkcnN
	tRwFmvaA7fGdYMgEjlb2TI0LStp3DO2+Qvnvj+fQ+cjRUqHjrQdFzSvpbaLK2uM9tScck3i4KUn7g
	IURCApmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXBs-00000009zFI-2WMK;
	Fri, 19 Dec 2025 09:54:28 +0000
Received: from mail-japaneastazon11022090.outbound.protection.outlook.com ([52.101.126.90] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXBk-00000009zBH-0h89
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:54:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMbOIBxOhK23d2Xyt1nP4Lrf4Jv0iKQKjrG/XloVLIfje/0YqowrkV8yUKqTnMWk4gMB1+PNYhHm/z+SmAC9B3DRe/5JaxLKtBnCMFwduUkdzcr91bko3AwM9jnNCp6oWsQ+EIS5tnlY+v+CDbWe+5M2OWCVHso4GOdAy6ZNqidSkqS3V1ztBIVLM83B+KxWBDSfCG9MNN/Ca2I+LYyTenpJjnwzE45mnRiDwQQUorde5jWHtEmA6tTiYB/3WZkznNbMArX1Cc0Oz3uY+cOly8uwQTZ9shgxiXGs3gxiWRuFmqAcjU2ldSDXADvyAcp9w9MafnWuch1FRl2zBQ+GWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4c/muDmRCL5PaVeiNz/HaFuG/9LDeEzOobqwK1aIc64=;
 b=gycc/YefVQHiuCm4hrC7yxs1neehOiSxNYG0OkRNC4TTVIQbFtKRxndUw2XdL6GMUVQgSPbnjUGr+6HsNgAnjC0HJsZhaBD1D4atFlqDNgQbUGEiQqX7C6gvFlZk5hnzsqudd+hbHGjt/c9K8gu4lp5stSMF3pA1EHJkt3Ihde95Xhd6s16zau3rpPlMwziqmwZEgDFeo4tMtgRSeERKhe93vnK1H+oTASyUM+ybVW98HHt6wjTaoA8MT0blk1CGf2uKm9tr1WGqEXaGJ5doXl53QhOJ7aknhANyBjZ27K78G6l8MO+VXEjqx2RZGQx10gbi57wtrDNhEWDXncVNIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0085.apcprd02.prod.outlook.com (2603:1096:300:5c::25)
 by OSNPR06MB8212.apcprd06.prod.outlook.com (2603:1096:604:45e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 09:54:11 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:300:5c:cafe::3e) by PS2PR02CA0085.outlook.office365.com
 (2603:1096:300:5c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 09:54:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 09:54:10 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C8AC741C0A02;
	Fri, 19 Dec 2025 17:54:09 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v1 2/2] arm64: dts: cix: Add OrangePi 6 Plus board support
Date: Fri, 19 Dec 2025 17:54:09 +0800
Message-ID: <20251219095409.1395587-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251219095409.1395587-1-gary.yang@cixtech.com>
References: <20251219095409.1395587-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|OSNPR06MB8212:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e0c609c1-a4e7-4a42-af4d-08de3ee48f4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LBgWEsQZMWwyeIzj111KU4fu4iJldosaRFg23ApLyaOUedCj20QolwfPqIVr?=
 =?us-ascii?Q?2SVX3ciHmfR9ZDwvwj09hB30noPLWAwX2z412uQsDrkQw8M/VFjHgn8TXFaM?=
 =?us-ascii?Q?W+jXG5GO/q418LWI7smbg/1GwI3iQaMIf3196IcSRJLk1FmwoDbxTYpBagQf?=
 =?us-ascii?Q?QhZWWHrt9rq58XH248gfPMdRdf7j6OSof6jGFNIXz/NOwBh/YT2VfGM5JB3S?=
 =?us-ascii?Q?dGhr1b4yksG1MxJiQizQTxVtBSPKHbuahbTQM8yHpKzdiUQFiUIfghe/payy?=
 =?us-ascii?Q?hmp6xIH+yfBPc9flLGahUJuidjeTNb1hXGks6Pe/N6RiJ9TwDUcouSGlszjs?=
 =?us-ascii?Q?82vWBicjCP5ZLsq+PrnzhBQ1muqbT7uX8DdMpNMuQlZaCDydA93h/91pgnLq?=
 =?us-ascii?Q?od+3ChC3w1HOrV+SOC98nwdZsQx+R2e4qlNnVhUs0ZancyY6Tapm+0jIUE1Z?=
 =?us-ascii?Q?o9FqcaecrlkUhAYRVGpBCfG4c2nh99KqFYXsyuMHn3dzPy/ihQ5D4l4XtcMY?=
 =?us-ascii?Q?uX4zVmvVNpAnafhJKQEteT/sjyBXLSfhMBz/VHqHugiXGjkzbLU8MMfpmJZE?=
 =?us-ascii?Q?txzn6K3P00Lsvxcn+FhYhdD5xZm163ynPR9WtTqddvdUjZilG2RoUmwejgn7?=
 =?us-ascii?Q?bJhfLnB3FD3X1HEVL9XkO8yMQTk6LX07GwUsBGZg/dW/WdqZV7p+nka/iuYh?=
 =?us-ascii?Q?4an6i30gr8TbCtyPnw3V3sNZx6Wpy8vQPtEitaGecQs66ctpEbX+OJYCQUFK?=
 =?us-ascii?Q?+1yOFT7rM+xIvYLpqqUD/g656CIxktzqePPZHBxmvbUjlbtqE130PoxG4BKD?=
 =?us-ascii?Q?3FlQ8ypV9lIkJWnfywdvySQGrhgh4DIg7UqPzRdqdFpqpBhFPY8jcQtvZPTE?=
 =?us-ascii?Q?aFKSPE1VtK8NDZcm1iMe9xaodDUAynIRmW4b7+ioev7utVdMuedQ0BTyZYf2?=
 =?us-ascii?Q?A57RVZ8WMQX4hdNmXBK6tKn7/YQ9aL8BQXgow2memdSsSzs4eyW/zQlxm2zC?=
 =?us-ascii?Q?1jAC3T7/WlN8w5qGBHl4Al7x7/6xDYt9NiJIA5ZchFV0k5+Jh+IWNgZVpjVz?=
 =?us-ascii?Q?a778mCaR+u17bGZ1BF4/crrjawQfsHjn6iYUS7taWul8deySZeJgwdl5ux/V?=
 =?us-ascii?Q?KNMHxJa91Xh7gkS8E8t/pP5D+L9u3jj+Tl1l12j0DcVJLCtoSJxOh37cEfg0?=
 =?us-ascii?Q?g0+CDs2jfQh4SWvQt0AyucmQGeercOB870ul4+N0rXeYOXl9FXNstME51F6I?=
 =?us-ascii?Q?uKDnzNGz90XagvDcWIEZ/wZEO/hwAQz0rMDSojmPGh8xG7aRaPOSmIf3y0M3?=
 =?us-ascii?Q?fzcX6q5XDw0nkANKGuqQtp3RvW/wD0KRC9AiRwRFtFxTG/8JsHfQWLrKN5E/?=
 =?us-ascii?Q?sXYpiTwrQ68PDQ/LID8l3WprHUa/sCOM2MmdFBOOkivwgH3isaUejYo6AcKq?=
 =?us-ascii?Q?XRhuf7QAU4BoZ2Mc3E6rxm/ge+kBNUkO9ldTKNWzI3tek+cJwZ17L4DjgPeb?=
 =?us-ascii?Q?PJow8CQDCCwLUEGp5P0gm9cosqId34FbHUiYRe0ZxT8kwWcsx6Ul0k/kJaY1?=
 =?us-ascii?Q?M3hHdXFQ4M+19tepf3Q=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 09:54:10.8157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c609c1-a4e7-4a42-af4d-08de3ee48f4c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_015420_202278_DB71986C 
X-CRM114-Status: GOOD (  11.86  )
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

OrangePi 6 Plus adopts CIX CD8180/CD8160 SoC,
built-in 12-core 64-bit processor + NPU processor,
integrated graphics processor, equipped with 16GB/32GB/64GB
LPDDR5, and provides two M.2 KEY-M interfaces 2280 for NVMe SSD,
as well as SPI FLASH and TF slots to meet the needs of fast
read/write and high-capacity storage;

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/Makefile     |  1 +
 arch/arm64/boot/dts/cix/sky1-xcp.dts | 83 ++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cix/sky1-xcp.dts

diff --git a/arch/arm64/boot/dts/cix/Makefile b/arch/arm64/boot/dts/cix/Makefile
index ed3713982012..8a6c6fdc4ec0 100644
--- a/arch/arm64/boot/dts/cix/Makefile
+++ b/arch/arm64/boot/dts/cix/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_CIX) += sky1-orion-o6.dtb
+dtb-$(CONFIG_ARCH_CIX) += sky1-xcp.dtb
diff --git a/arch/arm64/boot/dts/cix/sky1-xcp.dts b/arch/arm64/boot/dts/cix/sky1-xcp.dts
new file mode 100644
index 000000000000..4350fbd6e780
--- /dev/null
+++ b/arch/arm64/boot/dts/cix/sky1-xcp.dts
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright 2025 Cix Technology Group Co., Ltd.
+ *
+ */
+
+/dts-v1/;
+
+#include "sky1.dtsi"
+#include "sky1-pinfunc.h"
+
+/ {
+	model = "OrangePi 6 Plus";
+	compatible = "OrangePi,6p", "cix,sky1";
+
+	aliases {
+		serial2 = &uart2;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x0 0x28000000>;
+			linux,cma-default;
+		};
+	};
+
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hog-cfg {
+		pins {
+			pinmux = <CIX_PAD_GPIO144_FUNC_GPIO144>,
+				<CIX_PAD_GPIO145_FUNC_GPIO145>,
+				<CIX_PAD_GPIO146_FUNC_GPIO146>,
+				<CIX_PAD_GPIO147_FUNC_GPIO147>;
+			bias-pull-down;
+			drive-strength = <8>;
+		};
+	};
+};
+
+&iomuxc_s5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog_s5>;
+
+	pinctrl_hog_s5: hog-s5-cfg {
+		pins {
+			pinmux = <CIX_PAD_GPIO014_FUNC_GPIO014>;
+			bias-pull-up;
+			drive-strength = <8>;
+
+		};
+	};
+};
+
+&pcie_x8_rc {
+	status = "okay";
+};
+
+&pcie_x2_rc {
+	status = "okay";
+};
+
+&pcie_x1_1_rc {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
-- 
2.49.0



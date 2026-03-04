Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D81EB7EB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d1ku7K70/Sa/jEMUfBMIWD7BFpoeLVw7+cKZ9Rv/p/c=; b=k14VBDNavqgm/SFo9V8KIfp4HQ
	IKLUPlcj9pzmbfuQ6bQuv46IFhk8BoVourM/a3ArJx9Z8aJIhWRouolZfoGGqcBCzzo1W8TMC1dha
	hLNd7LVO/3Ag0l2U019wSQ0XU2xQrxfMH5nqXcHla7FK9WO8bJ5+ybHKx6cNqD4mwkxRAU/ZyvVku
	Y8qqn2EiPuf0+FZ2Z5EkN7YKb4lZmdVo/WrdMezmAOw7n/o0UUP1i8gXEviK3IVa0gVqCLXKvwL6d
	8nEbq/gLFwsH7sqOcOCMQdR4oJF76nQ1aq917Olqi13ZaERQ2Lbk0Et9B5N8GFSXUTaVilvsVOS1o
	9HRbg06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiGt-0000000GqjC-0h5d;
	Wed, 04 Mar 2026 09:11:59 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiGp-0000000Gqin-1T26
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:11:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eumX/8ZN2CHGPcjRBa81LkzR0bayL734L9C/dxdUkGD+x/tjR2lPfxbpaLxyA+GEsGpfbIFJdQ2ujCB9v/4mzIBg2CB1XtBsLupA54kpGIzO+Ziyd/jX07TLyzLGuueb4vY7RE33VIIc3Bg1UOmTI39PkW4uX6Ix4Qn+OPRk34aWlW9xRi2Dt+1aZvlFtiL6CTSql28jNf4UcgQ8Kk4mh6Iywe+RAiIex+DGzNdvD6SRA10sHsYaGv4O0fsgEJHOxKYNWy5Z1e3tGyzF9VIf+9q7/Q+IguoSVFYfCrSkhK/OfDEqEGyf2yBziPsPKgigsLSbnK1FQmfkr0hXa14LfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1ku7K70/Sa/jEMUfBMIWD7BFpoeLVw7+cKZ9Rv/p/c=;
 b=VQFmKxjOFGpcyGk5374TONsPC+NebCPNd2AQ6GYxwdsPImYsmppNKZa5ieoe4XV2CNWmUZYbZWc0UEzX4ggv1646bUV8OzxYgJfQo595PTQFS8MN/iO1v7a1HYiwqUMGwKVlMkEbD2+W7t9Zba+bBKR3S/OnD7rukzxo9QhSvdUDYL57F9pUO/SO2Z+SNv1w4rflBEbP7IEaGKkRUQ5YtRb3L5jw0FTUbCejmSJy8ZkoHcaylT/t/65DGCW1J1tDzIzf089rjJ6FiUKnJNfX2XYPBDRAbNIEKfHiWqK9sfP0yz8uFfpKSamfdmLYKGe/eET7NvMb4Z3qZZGNMr2ZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1ku7K70/Sa/jEMUfBMIWD7BFpoeLVw7+cKZ9Rv/p/c=;
 b=nZ7KJvkbmHNNlY8xe+mGOv8DjGWNyQieZ3GvUnMdLZqCerMSIafSMAjFYWphvp6dchdOJlZ5Hg3lYXmu3Ud8ESUEaX05qxDhrm+9bmGfT6kab6a/xtNzx0Bt+v9gKM/Rf5s+H3Sei37La8ko7WoFGION173yKlBhoJzAn3fm8JE=
Received: from SN6PR01CA0017.prod.exchangelabs.com (2603:10b6:805:b6::30) by
 PH7PR10MB6532.namprd10.prod.outlook.com (2603:10b6:510:203::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.18; Wed, 4 Mar 2026 09:11:49 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:805:b6:cafe::58) by SN6PR01CA0017.outlook.office365.com
 (2603:10b6:805:b6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 09:11:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 09:11:48 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 03:11:24 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 03:11:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 03:11:23 -0600
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.51.24])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6249BKWt3789067;
	Wed, 4 Mar 2026 03:11:20 -0600
From: Aniket Limaye <a-limaye@ti.com>
Date: Wed, 4 Mar 2026 14:41:05 +0530
Subject: [PATCH] arm64: dts: ti: k3-j722s: Add main_i2c4 device node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260304-j722s-main-i2c4-dt-v1-1-03f79f0cdf97@ti.com>
X-B4-Tracking: v=1; b=H4sIACj3p2kC/x3MQQqAIBBA0avErBuwUSq6SrQQHWuCLDQiiO6et
 HyL/x/InIQzDNUDiS/JsseCpq7ALTbOjOKLgRS1SiuNa0eUcbMSUcgZ9Cf2ttHGeGVCYCjhkTj
 I/U/H6X0/Nk/A7GQAAAA=
X-Change-ID: 20260303-j722s-main-i2c4-dt-8a1344d04ffe
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, Jared McArthur
	<j-mcarthur@ti.com>, Aniket Limaye <a-limaye@ti.com>
X-Mailer: b4 0.14.3
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|PH7PR10MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: fe43490b-e3c3-4d04-d1e4-08de79ce10b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|34020700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 74Qey+VUbSBXdrBqEaoXGJL4NWu8dkrfAtEcGyD9YXkam07VCJnHlOEVRoTs+srqyVJN/+bvPHhHI5DyskW58/3hVajyrcSrnHijeD1FBNytVkI783/6Edcu6EckkRYNSfmf+M6tlQIkVlbN5M6csP9hpVWwRciNXISOE0iSfxQHh2zGaH0OprN7mvf67mTuM86wz8hJx2DF5rM2L9YxQHCHxAPCj6HF93sfo5olCJN5nV2IzMVk2Zcmvlt9JkjtNDtm7Zyh2FPRnOobnhnS+3QhgI3Q30isffwtT9tWNLfLl4SNkw/YlMSJ0kXFHLLlfIl/GBfE6GxdYr4bd5kDbCTGLIjD1pxRQyKoQNLrc8N61y2l33CXoPGep2hAz+ohcSYuXX1gaHcxzypYtWnqJk/47efsRTg9YS1ajSh+ZhQl27vP2F0XeBzZHmwS2OY65Q09cwNmCV0PnbrR0kHUBh0VL5cBd/GwAqtcsQBJK9VoUK0htvM77PbkpJpQqrAaEe9L4hRTE+3G/rfsygMQjoKwwlME35h372X+Vi5WZVnn/L3pN6+A3Stm976oVDGmv4Yzf9rklW0pQGmK5veqcmESpUl86wrmbfpaRukqOrL/GpGYLmgZ+CQG/GyM+csHi0NEJ08onnBwDW/ksei4Q3Nao0n5LAQiKc1xXhdK1hvI4pA6sRRNSpYILcr3LZpPirIK5aIlJWIQJoZo+0cof3AoxiDlJvfcIl5m3ipoWEw=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(34020700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2h3dAlBo0orfcn9LekItguaoRZGJXLWRlfQOtE937NF6eG4hvRJJCTEf/dsmTS9wOpuglNeVbCF8XEdJsI9iWM2bRFVYEFACNeCmEQOiy4rqwl6R4xy1o9IIbRdPulNqHN04TXMl0Jc6O4n5LJiHFey+IYUUgmzxGjirQpL+NuTNqGjI2hd3XKJkLOe2mOWM6N93v95JukYLdHYuzbF0ZVFhh1XR7bqR71sotJiHhWlfY+jcjC8B1xatfH93Px6CI2KkHYPptwARcwI1/Ug/R8P3imKbEskLSDBOloejbA5rETAnSO8pP3/SnuLBX+UsDWv9n5HVz2rII5EDZgvGydiQckNdcaG/cbPcX99Te4oRg+HsiCGGERbC2QCIppu6x9eNgqrSLVa0cY22qzIIWqDZjNZ+7nsDlsTeqDnruJR9NfdLthZubXWWG5AJQJqu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 09:11:48.3427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe43490b-e3c3-4d04-d1e4-08de79ce10b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6532
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_011155_580698_C2BCEB03 
X-CRM114-Status: GOOD (  13.62  )
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

Add missing device tree node for main_i2c4, and the corresponding ranges
in cbass_main. Interrupt for this i2c controller is routed through the
Main GPIOMUX Router.
Base address, Interrupt IDs are taken from J722S TRM [0].
Device, Clock IDs are taken from TISCI docs [1].

Additionally, the I2C4 is the only interrupt source to the GPIOMUX INTR
router that generates level interrupts, while all other sources generate
edge interrupts. Due to this, the router needs to handle interrupt-type
on a per-line basis. Modify the router node and its consumers to
specify the interrupt type corresponding to each interrupt line.

[0]: https://www.ti.com/lit/zip/sprujb3
[1]:
https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/index.html#j722s

Signed-off-by: Jared McArthur <j-mcarthur@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
Note:
Support for per-line interrupt-types was added through a recent series
[2], which was already merged in.

Testing:
- Enable I2C4 (additional DT patch) on j722s-evm and run i2cdetect [3].
- Add testcode to ignore the NACK interrupt, which results in an irq
  storm -> showing that GIC is actually receiving level interrupt from
  the INTR [4].

[2]: https://lore.kernel.org/all/20260123-ul-driver-i2c-j722s-v4-0-b08625c487d5@ti.com/
[3]: https://gist.github.com/aniket-l/844925345316adf9f65f04c8cdedd62d#file-j722s-evm-main-i2c4-working-logs-txt
[4]: https://gist.github.com/aniket-l/844925345316adf9f65f04c8cdedd62d#file-j722s-evm-main-i2c4-irqstorm-logs-txt
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 13 +++++++------
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi              | 13 +++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi                   |  3 ++-
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 0e1af2a69ca2..f130c7cb998d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -543,10 +543,9 @@ main_spi2: spi@20120000 {
 	main_gpio_intr: interrupt-controller@a00000 {
 		compatible = "ti,sci-intr";
 		reg = <0x00 0x00a00000 0x00 0x800>;
-		ti,intr-trigger-type = <1>;
 		interrupt-controller;
 		interrupt-parent = <&gic500>;
-		#interrupt-cells = <1>;
+		#interrupt-cells = <2>;
 		ti,sci = <&dmsc>;
 		ti,sci-dev-id = <3>;
 		ti,interrupt-ranges = <0 32 16>;
@@ -558,8 +557,9 @@ main_gpio0: gpio@600000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <190>, <191>, <192>,
-			     <193>, <194>, <195>;
+		interrupts = <190 IRQ_TYPE_EDGE_RISING>, <191 IRQ_TYPE_EDGE_RISING>,
+			     <192 IRQ_TYPE_EDGE_RISING>, <193 IRQ_TYPE_EDGE_RISING>,
+			     <194 IRQ_TYPE_EDGE_RISING>, <195 IRQ_TYPE_EDGE_RISING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,davinci-gpio-unbanked = <0>;
@@ -574,8 +574,9 @@ main_gpio1: gpio@601000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <180>, <181>, <182>,
-			     <183>, <184>, <185>;
+		interrupts = <180 IRQ_TYPE_EDGE_RISING>, <181 IRQ_TYPE_EDGE_RISING>,
+			     <182 IRQ_TYPE_EDGE_RISING>, <183 IRQ_TYPE_EDGE_RISING>,
+			     <184 IRQ_TYPE_EDGE_RISING>, <185 IRQ_TYPE_EDGE_RISING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,davinci-gpio-unbanked = <0>;
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 9ee5d0c8ffd1..ddf20e44f0ea 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -154,6 +154,19 @@ usb1: usb@31200000 {
 		};
 	};
 
+	main_i2c4: i2c@fe80000 {
+		compatible = "ti,am64-i2c", "ti,omap4-i2c";
+		reg = <0x00 0x0fe80000 0x00 0x100>;
+		interrupt-parent = <&main_gpio_intr>;
+		interrupts = <178 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&k3_pds 257 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 257 2>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
 	ti_csi2rx1: ticsi2rx@30122000 {
 		compatible = "ti,j721e-csi2rx-shim";
 		reg = <0x00 0x30122000 0x00 0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index 059c65ece183..1b36dcf37925 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -160,7 +160,8 @@ cbass_main: bus@f0000 {
 			 <0x00 0x0fd80000 0x00 0x0fd80000 0x00 0x00080000>, /* GPU */
 			 <0x00 0x0fd20000 0x00 0x0fd20000 0x00 0x00000100>, /* JPEGENC0_CORE */
 			 <0x00 0x0fd20200 0x00 0x0fd20200 0x00 0x00000200>, /* JPEGENC0_CORE_MMU */
-			 <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>, /* Third peripheral window */
+			 <0x00 0x0fe00000 0x00 0x0fe00000 0x00 0x000f0400>, /* Third peripheral window */
+			 <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>, /* Fourth peripheral window */
 			 <0x00 0x30040000 0x00 0x30040000 0x00 0x00080000>, /* PRUSS-M */
 			 <0x00 0x301c0000 0x00 0x301c0000 0x00 0x00001000>, /* DPHY-TX */
 			 <0x00 0x30101000 0x00 0x30101000 0x00 0x00080100>, /* CSI window */

---
base-commit: d517cb8cea012f43b069617fc8179b45404f8018
change-id: 20260303-j722s-main-i2c4-dt-8a1344d04ffe

Best regards,
-- 
Aniket Limaye <a-limaye@ti.com>



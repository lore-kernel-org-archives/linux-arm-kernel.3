Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CCBCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 03:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G5AcZBWgNb1pW6DzP5k71QPHdysIX0RtO4/0fc9BoVc=; b=hotM7ie9DQVFuuaBLvenQ4aVEd
	0aeRuJFpxxMBTTwkuD+I3CtcjdxA8jo82+ZTd79zvGAK2H7D/BSKvoMMC3MzYiS2Egz+p4ZDKNTGw
	vbQYUykhNCTUAZB0PFxY1Dk3NIMlleL59vXCkke8ePoqG8Dk4BygvrHR3YYK/v/08YiRVLWNRdhjm
	l5chne0XUyFtZAZRq3tj9+xl5Ju/wI6kXgur5hHosCqTTIVq+DGy8XDiocXBcLzDhvUJHabQbskXw
	vVr2zuU8wg1LkAxN35ZXL1mcegLj/EUnigbyTSIWN7cdls49TaFnkVVRBk7OQoefol8PzI7mQFrVL
	cZzlDGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKp60-00000002b8C-2YXL;
	Thu, 07 May 2026 03:08:16 +0000
Received: from mail-eastus2azolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d109::] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKp5z-00000002b75-07B6;
	Thu, 07 May 2026 03:08:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXLCKcohXq6Pk9viqwL8SILTzJBRa9LR5QL/+wjoHPyiK+ro9WDdFvT5B7th2WfFjdsnUJPYcm3u4GJoie3tFpwTXY9RDJQ/aSXS6zOv6c2MuecjYAEQhSH0uZH5YT6ua+y6ZhB6fD6cJj0AYsrTMKcVnQT4iLUkBgtOPWSDQmy/nidaF14ceaoRidRZ6s1OZcuThgz584ZbsubkSqEiInM48FARqOvvexiqOyMDa/u1EaMBE3u8Nr/wJ8Gy2UUHnP75w8GRRypVTQQxAStcJEr2uIjDWbu0maC3GjddEF59upduMn3UFi5yqlUl5E85qvWvurPJuDhAlVklcmhmJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5AcZBWgNb1pW6DzP5k71QPHdysIX0RtO4/0fc9BoVc=;
 b=bWtt61CtjyyTK9jxFAymfaQo/HBXpNK23X46E2vHJ1lmn3eGDlDXBBPY/b4FUlgElt7ZKtS6rONlBTVsohew8tzEO0URLoKNPNlX7xpx5XEYoi7/bmKaM0qtPVQ4AhZf/Xum9LB4DdFDQOjQbgYhXJESXyGFPlr9zuoFP65qOURZXJqqBLDGehWAD0bd3WHbvpsaE3w0Vyhpcv729IT//067oZt5lHqsSJRzL/AqIiHJxZ3zgcDJOlh6QsySfAyuTbVbORze+pfazwkfk/4GT/kyIgxwqVtIs484u9ndL5f3lqqrWQs6+np84UwTZ73pkIkvOV9jx6/MeO10U6zddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5AcZBWgNb1pW6DzP5k71QPHdysIX0RtO4/0fc9BoVc=;
 b=hGWpmzOuKz0u9wQs3KRqUm168gHrHL7CKB8nD3MFN09pZh/Lqz1eJBZz19kifKA11sg3+FiyUNIETs0dw0H8EFbRHx6o3xYNFMIQjmbtizqBD40CHc+Edh1Y2OpzJH9hCz5ribnJpKUoGIgONG7rxzgbmoBSwjcHTl9cp/IUBi+3fd/OHKOwZDAJbanFi1WEfsnPzQJck9JGcyC6LJldZepzdOfvoenexlLHCFqOneDD21MGbcEEBEU+R5uvAD0SosLpTEC65JSZrZQ3ozpmS47ZgzsCVaJteW05RcjL2YYkPnt7jYdJceNpdMX12Isi/pHh88CGI9kQL7DNw7svaQ==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by CH9PR19MB9443.namprd19.prod.outlook.com (2603:10b6:610:2e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 03:08:10 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 03:08:10 +0000
From: Liu Changjie <liucj1228@outlook.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liu Changjie <liucj1228@outlook.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add LCKFB Taishan Pi 3M
Date: Thu,  7 May 2026 11:07:53 +0800
Message-ID: <MN0PR19MB6091AA2B594F0E026518E884AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH5P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::13) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <20260507030753.24079-2-liucj1228@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|CH9PR19MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ecda4d5-16a1-4b8d-4e5f-08deabe5de2b
X-Microsoft-Antispam: BCL:0;ARA:14566002|41001999006|23021999003|8060799015|15080799012|5072599009|461199028|19110799012|5062599005|24021099003|51005399006|37011999003|26104999009|3412199025|440099028|3430499032|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B6ZXix6yyXPTSZWw4PoB8WpQIaXvKFQPqjXsSI5rcAjgaJjpDKatMjzBi/rw?=
 =?us-ascii?Q?6kSxGm5GnkL5HMc/cQz98CYMunWLdgfGQLZtAPkVb1UFS/chQFP6xheMFpq7?=
 =?us-ascii?Q?j/SnEA3zQpBEOOlt5fyIhtNgThyxDvAHs3/pFkNKr4mWvYWOm41xgXlq2cxP?=
 =?us-ascii?Q?zkjvN8XFOh5El2rcW3x08I9iTCIeiKyOR2OdFGiEY/C1aGftNZ8RbKqVzDwQ?=
 =?us-ascii?Q?NLV4j/e6YYA1pH7Cuh4zY23rMkX/AxP6yaIUcTy5+f6Hd2BIw/+SUr0WAhes?=
 =?us-ascii?Q?H18IZ6VUcLYmSleK4uddL5M8OpV6pva+8+x0ZvhmF7K0NdMv7iolGjLH8xfN?=
 =?us-ascii?Q?iXq/zx7rCcR54HRgVEXc44soGIFB2RnO8xpCU4EBebac2jgDANHp/+zJdL0C?=
 =?us-ascii?Q?qQndgoQyC2vaPfCFgNyKbqRsmXyUSbPQiYwi+lCu1x+3vsC8xEo573jEGEym?=
 =?us-ascii?Q?v8kqWmqAx/NJzJn690F4cj0a73tqOmq19CGA48Dr0XyLD4HdstB2UC7czUj1?=
 =?us-ascii?Q?HT2uapPQ1LjMLbYECi35M55JaqPkeJnSuW9jk2j3TghwZa0ZbysLasQ1inCa?=
 =?us-ascii?Q?CqqkzrupaKUcET/OPExOGxRQXVCvMODpTwF8IYpTCrf69vRg+rqcz73sSrfj?=
 =?us-ascii?Q?xCu7DTUakCifCb7md0nhxLkgENkOCHkYnRJGUnFRhte1s4snbXo6bHhhtjpU?=
 =?us-ascii?Q?D8LwqSMqD8/C1QwQdmvDN6zbe5gdp6DuOmmMW0wUh/y7Xoz71OFh0/Kwbhqc?=
 =?us-ascii?Q?9hQuXXaGrLjJogpxUuLmkwkRC3CXqTu1Wopgudm7LxAyg7ZEPKHTCnIbxygP?=
 =?us-ascii?Q?O8PvH90zp3pJoyF1VJzKomCq5Q3EjUi890XrdiMBGjQoWzvTn8DAzpe6N+XZ?=
 =?us-ascii?Q?S2ss1NJjB0IzV/BtV19ln1co2hx7wyascjnxpuQUolBOfdODuglVHp83Dz2S?=
 =?us-ascii?Q?e/7aZFhl+0AtTQMzE1X1UBnLcyc161fGPJoE1Acy395Sy01WHOn/G8nFDEzj?=
 =?us-ascii?Q?ftv4n+pHRindE60jT04C6wTEx0c/+5GBtOwKipxHUZKtODI6LSHKnTccUcco?=
 =?us-ascii?Q?Vfz7UfW9?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zLJPJle1zkm1yBqpLDSbbxqtVooI2Qm5a6oMOOy4qX5BFip/PWTx8K0W49l7?=
 =?us-ascii?Q?hjBwesYoAh8i1WF+OaS6wC9ogdgEwMqGVImydgSE1wLQBdPdFM37Fmxv+gDb?=
 =?us-ascii?Q?uaH8cEmwTP+uGy7fDDwnTDCgXDa2IfuG4UJhIpv9W2iKp1PkFsthvjRfibaB?=
 =?us-ascii?Q?IQDLsqJQ11p2w0eZ7pWHNFABByqkIE8NJHMVIfwsd1Ba3jTubY6E7ntrMKFZ?=
 =?us-ascii?Q?47PehfeDq4In3nvJfWjn1Su/IrOC5D1/GLuvCp4GAno9ddXIdJJQPsb3UIhL?=
 =?us-ascii?Q?xzRYxCK9/MHnGTqjVU7+ITeYMQmNuMjbqxxQn5yPUstDBSlJtGvdSvelUmpd?=
 =?us-ascii?Q?v424zNlC2xjnRpqdeZ/WVihIX1aSS5gHzZkvLIElZaTLmtdSoemntlu0youB?=
 =?us-ascii?Q?Ng3D4BLoP6lM+B2WCNM13MHsmkMdxOPT8I/iTMBHbpFxW31KeI99sDgXiiTL?=
 =?us-ascii?Q?rbc4pi479aIwCQ0OLXznZaK8dRCHSj6yn8/UOqww/YyVY2XoKQNOuF/ddBV0?=
 =?us-ascii?Q?XbGhX1HJJDkIvXOs6T6Df7y74DsDwDThwPGHb441Xk8g9cGV2U+dw4YXPWqs?=
 =?us-ascii?Q?jTjJptQQujtrAO5Xw+EQTvAsddSwbF1g6FBZfJiQSl6r3L/1wvGi1/R9DIUF?=
 =?us-ascii?Q?+zVQbtpmJOz12btYv1FQ56bMInTCOT78Jsz6/KYi//woBzKw4F+SjWzb1XLD?=
 =?us-ascii?Q?c+O9XT1Btf7il4H68ZPyb7ebXXgRUwDgYldMEUJEVBO5Lm9ohMuq1chC8dcf?=
 =?us-ascii?Q?Nhb38BdWF7x9aI8JJ8ZHdMC8O8Fgcvi0+kn6OjJ30LiSqs1of60u+tF56g55?=
 =?us-ascii?Q?xgYUfs15hlBqFe9d5bL0AJHgzOM7Ksx6EqWbkysEidV8pyArxBKnBZds8wVg?=
 =?us-ascii?Q?1e1nn8sEzC6y5auYDurpV0JqJt84O5AlLya5BxTJgNTxBBXINuMAWQSuMtS6?=
 =?us-ascii?Q?cwqeMf5UxG2ega769uFsRFzF5aMUhkYxpditacipaRmjtN/TZt94j4iI14ac?=
 =?us-ascii?Q?CjKmIOcNUorafyeA1oZ627GqC7kHN2uaSKf1NUVBOISMpZeHUtxpEWRSx50Y?=
 =?us-ascii?Q?fYcw1kqMGmNDwgibsJnx8V8Ecd3vqR+qyxVLWT9nU7Ai8EjUKuUv8YdhHmW5?=
 =?us-ascii?Q?Ls4sgx14TClHYlaiUa070P4EjCa/RHxXGgTGgT1KboOp1CDaCL9WmNhfYbGP?=
 =?us-ascii?Q?n6cBaPEeIiRU/ttMOKZDqcLCpXi4IJSF/gYrfCxI6+M9bUusrbM8lAWJel/s?=
 =?us-ascii?Q?doniteW4CJN1vIgdtGVtxAwhxly/eK92DbeooYb/+MT3jzkBdfWuQUnGxLTd?=
 =?us-ascii?Q?yZAc8PeGA0V/7PzWxVxFc1fWYRPK+eYNIiwIwZ1BmZG7gziqh2O9wgA0LI5a?=
 =?us-ascii?Q?Zs2mXMak5z5LVR0RknXvtlE2dpyR?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ecda4d5-16a1-4b8d-4e5f-08deabe5de2b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 03:08:10.3368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9443
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_200815_149594_94EF1F62 
X-CRM114-Status: GOOD (  12.62  )
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

Add the device tree for LCKFB Taishan Pi 3M, a board based on
the Rockchip RK3576 SoC.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-lckfb-tspi-3m.dts     | 711 ++++++++++++++++++
 2 files changed, 712 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index cb55c6b70d0e..dedadc22d15a 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -171,6 +171,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10-pcie1.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb2-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-khadas-edge-2l.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-lckfb-tspi-3m.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-luckfox-omni3576.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-m5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-r76s.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts b/arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts
new file mode 100644
index 000000000000..2eaa6969b33f
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts
@@ -0,0 +1,711 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 LCKFB
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
+#include "rk3576.dtsi"
+
+/ {
+	model = "LCKFB TaishanPi 3M";
+	compatible = "lckfb,tspi-3m-rk3576", "rockchip,rk3576";
+
+	aliases {
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+		mmc2 = &sdio;
+	};
+
+	chosen {
+		stdout-path = "serial0:1500000n8";
+	};
+
+	hdmi-con {
+		compatible = "hdmi-connector";
+		hdmi-pwr-supply = <&vcc5v0_hdmi>;
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	vcc5v_dcin: regulator-vcc5v-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v_dcin>;
+	};
+
+	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v1_nldo_s3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vcc_sys>;
+	};
+
+	vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_2v0_pldo_s3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <2000000>;
+		regulator-max-microvolt = <2000000>;
+		vin-supply = <&vcc_sys>;
+	};
+
+	vcc_3v3_sdcard: regulator-vcc-3v3-sdcard {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_sdcard";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
+	vcc5v0_typec_vbus: regulator-vcc5v0-typec-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_typec_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc_sys>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&typec_vbus_en>;
+	};
+
+	vcc5v0_hdmi: regulator-vcc5v0-hdmi {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_hdmi";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc_sys>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_con_en>;
+	};
+
+	vcc5v0_usb20_host: regulator-vcc5v0-usb20-host {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb20_host";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc_sys>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb20_host_pwr_en>;
+	};
+
+	vcc5v0_usb30_host: regulator-vcc5v0-usb30-host {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb30_host";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc_sys>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb30_host_pwr_en>;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_poweren_gpio>;
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&combphy1_psu {
+	status = "okay";
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_b3 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdptxphy {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	pmic@23 {
+		compatible = "rockchip,rk806";
+		reg = <0x23>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&gpio0>;
+		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_pins
+			     &rk806_dvs1_null
+			     &rk806_dvs2_null
+			     &rk806_dvs3_null>;
+		system-power-controller;
+		vcc1-supply = <&vcc_sys>;
+		vcc2-supply = <&vcc_sys>;
+		vcc3-supply = <&vcc_sys>;
+		vcc4-supply = <&vcc_sys>;
+		vcc5-supply = <&vcc_sys>;
+		vcc6-supply = <&vcc_sys>;
+		vcc7-supply = <&vcc_sys>;
+		vcc8-supply = <&vcc_sys>;
+		vcc9-supply = <&vcc_sys>;
+		vcc10-supply = <&vcc_sys>;
+		vcc11-supply = <&vcc_2v0_pldo_s3>;
+		vcc12-supply = <&vcc_sys>;
+		vcc13-supply = <&vcc_1v1_nldo_s3>;
+		vcc14-supply = <&vcc_1v1_nldo_s3>;
+		vcca-supply = <&vcc_sys>;
+
+		rk806_dvs1_null: dvs1-null-pins {
+			pins = "gpio_pwrctrl1";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs2_null: dvs2-null-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs3_null: dvs3-null-pins {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun0";
+		};
+
+		regulators {
+			vdd_cpu_big_s0: dcdc-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-enable-ramp-delay = <400>;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-name = "vdd_cpu_big_s0";
+				regulator-ramp-delay = <12500>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_npu_s0: dcdc-reg2 {
+				regulator-boot-on;
+				regulator-enable-ramp-delay = <400>;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-name = "vdd_npu_s0";
+				regulator-ramp-delay = <12500>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_lit_s0: dcdc-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-name = "vdd_cpu_lit_s0";
+				regulator-ramp-delay = <12500>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vcc_3v3_s3: dcdc-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc_3v3_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vdd_gpu_s0: dcdc-reg5 {
+				regulator-boot-on;
+				regulator-enable-ramp-delay = <400>;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdd_gpu_s0";
+				regulator-ramp-delay = <12500>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			vddq_ddr_s0: dcdc-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vddq_ddr_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_logic_s0: dcdc-reg7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <800000>;
+				regulator-name = "vdd_logic_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s3: dcdc-reg8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd2_ddr_s3: dcdc-reg9 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vdd2_ddr_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vdd_ddr_s0: dcdc-reg10 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vdd_ddr_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca_1v8_s0: pldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca_1v8_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pldo2_s0: pldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca1v8_pldo2_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_1v2_s0: pldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vdda_1v2_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca_3v3_s0: pldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcca_3v3_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd_s0: pldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vccio_sd_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pldo6_s3: pldo-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca1v8_pldo6_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd_0v75_s3: nldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-name = "vdd_0v75_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdda_ddr_pll_s0: nldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-name = "vdda_ddr_pll_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v75_hdmi_s0: nldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <837500>;
+				regulator-max-microvolt = <837500>;
+				regulator-name = "vdda0v75_hdmi_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v85_s0: nldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-name = "vdda_0v85_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v75_s0: nldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-name = "vdda_0v75_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2m0_xfer>;
+	status = "okay";
+
+	usbc0: usb-typec@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&fusb302_int>;
+		vbus-supply = <&vcc5v0_typec_vbus>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usbc0_role_sw: endpoint {
+					remote-endpoint = <&usb_drd0_role_switch>;
+				};
+			};
+		};
+
+		connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			label = "USB-C";
+			power-role = "dual";
+			sink-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "sink";
+		};
+	};
+};
+
+&pinctrl {
+	hdmi {
+		hdmi_con_en: hdmi-con-en {
+			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wireless-wlan {
+		wifi_host_wake_irq: wifi-host-wake-irq {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		wifi_poweren_gpio: wifi-poweren-gpio {
+			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	usb {
+		fusb302_int: fusb302-int {
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		typec_vbus_en: typec-vbus-en {
+			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usb20_host_pwr_en: usb20-host-pwr-en {
+			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usb30_host_pwr_en: usb30-host-pwr-en {
+			rockchip,pins = <0 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&saradc {
+	vref-supply = <&vcca_1v8_s0>;
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	full-pwr-cycle-in-suspend;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+&sdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	max-frequency = <150000000>;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc1m0_bus4 &sdmmc1m0_clk &sdmmc1m0_cmd>;
+	sd-uhs-sdr104;
+	status = "okay";
+
+	wifi@1 {
+		compatible = "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_host_wake_irq>;
+	};
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	no-mmc;
+	no-sdio;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_sdcard>;
+	vqmmc-supply = <&vccio_sd_s0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_det
+		     &sdmmc0_bus4>;
+	status = "okay";
+};
+
+&tsadc {
+	status = "okay";
+};
+
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	rockchip,typec-vbus-det;
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	dr_mode = "host";
+	phy-supply = <&vcc5v0_usb20_host>;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0m0_xfer>;
+	status = "okay";
+};
+
+&usbdp_phy {
+	status = "okay";
+};
+
+&usb_drd0_dwc3 {
+	dr_mode = "otg";
+	snps,dis_u2_susphy_quirk;
+	snps,dis_u3_susphy_quirk;
+	snps,parkmode-disable-hs-quirk;
+	snps,parkmode-disable-ss-quirk;
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb_drd0_role_switch: endpoint {
+			remote-endpoint = <&usbc0_role_sw>;
+		};
+	};
+};
+
+&usb_drd1_dwc3 {
+	dr_mode = "host";
+	snps,dis_u2_susphy_quirk;
+	status = "okay";
+};
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};
-- 
2.47.3



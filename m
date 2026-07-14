Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FE9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Cc:To:References:In-Reply-To:Message-ID:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtxhlFIBN2Z+ajWnHAlN6fmk45GC6oQZd+EfsLffF68=; b=GA2Lx0LD8aJ2kpbe3WClzxCA9S
	Ju94XOvKLP1ofCE4Ux0IUvUqra1gUP6oJUAG9azVOTtLo+aABL+aic0A4TIXtL2WRpp/AZec34x+h
	xOry5TXtI1vVbL26iKcHoMc5Yz+17RvpF1sDlZE0G/NQ+0zmN0YsJJsKJl2ZHedpxrjTQlDwSKIgq
	SpPOQgew2BpHn63YFr8Uulkfz4TYV+mVWSlD2vcVIbI3KiV0lFqh89eSzpGNGfL6RVkQD82RW/yRS
	Yw3oa1sv9+X2eKCGfp0u/Opa8pogF8n+LVPgTILi/6HO/gihKkFEpWT4Z3EP9sg7fJgUunlGHa2Ld
	WIH6yIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjX2h-0000000B64A-2OA7;
	Tue, 14 Jul 2026 06:54:59 +0000
Received: from mail-westus3azolkn19010022.outbound.protection.outlook.com ([52.103.23.22] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjX2d-0000000B615-2GNT;
	Tue, 14 Jul 2026 06:54:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bj9NC/4uEVhb0WasH7I8xtI58aswA0LMe4uy2Srqt/xxpSeX5ZAD3JlCQnaA0U6nnUC8Yb+CQSJIRrx8RYzgJMqp55sZ1TfC0IK59yeDaNk9Fnl6rMt/akGjiX03kw3eWq1ZswN1KLmfGDSIZ+T7OxVDppbENCAETLV4z0OpO/9YUZWn2u+Q+sIRbQhHQkj3tf0U2XqmsUsVrc/5hKbSTeP6q91lexlJNsl3b+/Us+InwHNJI+4ZpULQcUBo+QXVbh+mmktLWkkzZ8ocm1NPmjr8blCBu0IQFZFQUAgXRaWnmGB/UGfZ8LRzslo97x4SKOWKUgMGM4BHRCcKj9gvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtxhlFIBN2Z+ajWnHAlN6fmk45GC6oQZd+EfsLffF68=;
 b=KgbmlTvEMEr5ORvrj0c3RhOM5rjco0x30QRhmasPsadium+hrDmVXUd+RKFKByDp75JaEmwb1KP30ideHtsoRLN9mpsxqj6MUxCvSdNK8BYr+jI7MmB37N3kiG6T65cLocS7Eaetrf8qbf9YdcUpqRBeIqfFNpO2ttw+0wLGwvcGNruvhbwUQcDDk+LGkXci+BSt498VzfHY1gUejB15vrwiM+d5qh013yCw0/HVNN3FiHxGIEknAJcH9/2noLNyMYS8XyA+0C+M4f6ccWaw8Rh4fGt2ji9mDnoiMD7CDmaFJvtPgts7SqxvDT6Lre4Mq14ekPmmQSSHewX3fv0pow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtxhlFIBN2Z+ajWnHAlN6fmk45GC6oQZd+EfsLffF68=;
 b=QAjVQh3TsAL55KWltpO0jGGkXpRpry3ltBGFw+KkizyLYM9pXlQmUAmikv4RuoypNOnYfg5M9lMhAk4jZyHHtyl4xX5ufAo56mj7tlNLsKqYaZlfG7Yy5agRObbbONAciW9zF0PpxyaJ+hfbxggIPO05bQ8cdudsAZ94GHzQpX+Bk4rOF6e7Dn8wKISWqYFl0Z85ABZE/pIRyzK+UVjnACYJVjW5SdTcOexlwSKGcltjlp0lFrPrSkyfhZxUvMt8lc7MWypd1mwHtOuXYgVyjSySbk5RfKmL//7Qs+nzMt/n2WWWYXN3qjIB/94MwU2slTywNA62Ii998JAgiS4/hQ==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by DM6PR19MB4106.namprd19.prod.outlook.com (2603:10b6:5:24e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 06:54:51 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 06:54:51 +0000
From: Liu Changjie <liucj1228@outlook.com>
Date: Tue, 14 Jul 2026 14:54:59 +0800
Message-ID: <MN0PR19MB6091D3101FD2D8F940F0CE4DACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB60918292CC2D566716815F26ACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB6091C07C729B83E594722E84AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com>
	<MN0PR19MB60918292CC2D566716815F26ACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org
Cc: Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add LCKFB Taishan Pi 3M
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0053.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::8)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <e36365183e98498797247fafca8dfe62.1784012099006260.tspi3m-rockchip-v2-2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|DM6PR19MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 65abf19d-1f43-4d26-c8ed-08dee174cd74
X-Microsoft-Antispam: BCL:0;ARA:14566002|16051099003|5040399003|5072599009|37011999003|23021999003|8060799015|15080799012|19110799012|24021099003|51005399006|41001999006|4302099013|3412199025|440099028|26104999009|40105399003|10035399007|3430499035|1602099012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BN04FOQ/DoViS3ONnek3msu5IOTXqMokgSVv07K8DZOOQfn27O1AgEer441S?=
 =?us-ascii?Q?5n1LqMsXL4RgiWpo67/C3vOFKy0ud2pSxxeAlNZD5SIKWLEDUdZVuecKMDDZ?=
 =?us-ascii?Q?AlP419XUJ1QAm+M2kgyKpVatObgPWC52WkKhrd05qUJO9vHqXanb4x1/sOi1?=
 =?us-ascii?Q?qu/Slipw2ZJyBw5jqYJ4CJUmNRlY2Fnmr+KY2KpLCEp1aR8YoBl3zVXJsopu?=
 =?us-ascii?Q?KfPbZSFyQJMnqBpNs54y0Wq9w5QohzoeStkjnOyXoO5PGWLRIlodBDI8jMV/?=
 =?us-ascii?Q?9q+Etrypm41viBtYi8DGwMKfJ8LFwVU2PPrFtUQ2qfZM3UNR/Skd/nGF8Qie?=
 =?us-ascii?Q?qBsVRdFzipAM/gEN3DXZioB9DNiq2SDucELId2NEi03/feo+XR8QVQubhv5v?=
 =?us-ascii?Q?YWm3muIII9ha/qTSJ8+MEcpAjAkBAdLe3p3D9CWiIM3xFgNJFNESmvR2L7E3?=
 =?us-ascii?Q?bCybSoW10W2ZD5uWCSYEi5N1tGNw63tbDtX7FH6uqmcmzWi8m53Y70OExrGB?=
 =?us-ascii?Q?So68toWRWkIar7n2UTTOu0aV+IE0aTiIq+zCYkwt8ApKWaEomONRJA47lZ2R?=
 =?us-ascii?Q?pYw7HLlj0R83qp7UQE+uNOt/yvs91fVqAQm9PphJnIwKr8mUcxcAXWtblfEB?=
 =?us-ascii?Q?qgw+1hYqLJlKHWICu4SzGbnPVGiK6c2mKZtA9umNK3/wGayGAEUVKuIgyBIa?=
 =?us-ascii?Q?0XT/NU5zViP61TbBGvdElrHSDEl01ldUuXezkq/HKBlO6pVAfyYMqKd0NLCM?=
 =?us-ascii?Q?MXhqu5Vw5FnPr9C0gOrCrIbypxIdjdW0rUmciOVfYFi4c/oenrJV7MRtzRX0?=
 =?us-ascii?Q?JS31jk168uZ2Ev10mfW0kL/1UNFXfEtbhc/8Rb+VEpXU8qInaqCu3jWKeGRV?=
 =?us-ascii?Q?BKWPQhkKQNQc1KS4kESdUqxeQaevZMXb6bqFy+iZnrQpTa8spyVdPcRairpz?=
 =?us-ascii?Q?xRgKvPtv3jM9iJrEcaPYNVaW70UlrCg1EaTqaLOK47KI8cbzPS4/dbdPDy9X?=
 =?us-ascii?Q?UUd1smYkjsafuJLimvi3c34TrYPC+T0ay1RxsTNKXk9TorAkhxRgAKs9KOOv?=
 =?us-ascii?Q?8sT3rWdHvxSEquhZX4k+xAlyrNP7LiHrTbxSDMYADcWkwQqMWbktB1pFun9r?=
 =?us-ascii?Q?YZMMEUSpwx7/?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+UHo8ItQ9zpstUIZy8ko2+6lKUKhyAIqyeH/VvdkjQPTQURdNTzuIVdGKkce?=
 =?us-ascii?Q?plC5hewLVk248H29Ln2SI87YDld28xV7h9xcpAk5FLlWlMZvLtKB35mQpocV?=
 =?us-ascii?Q?bQB7SNjiMjWmHLOKTopex90QxB6+QZ4OoeJ3ZJ+T9Tr0wrh9Xyju105EKCEv?=
 =?us-ascii?Q?B8Vzb77S/HxkJpJpyfqC/fOPDrNiKzACtP6Dh23QStjWfCuCDSlbipIMNb6j?=
 =?us-ascii?Q?Akpo8BuiioVSuplJC5LBBFNJSaIrAI2qLclUoiILLpoMxjOXCULjsvj92FEf?=
 =?us-ascii?Q?g1hwJNQEjrQey00Mh246AiNg7VnDnrX/6kekq30xaFJVtP0195/CNFAiZP6S?=
 =?us-ascii?Q?gkC50hNoWjjBfljKkUPu1xz2oggVBXgV5oa2NZNT2QxiABSZ7JP//izM2QqS?=
 =?us-ascii?Q?EQDuTjAzG1Ibh8hn/iVZdR6A+DUCCX1AeSpKb9vyFhancGE8cAbJohhmjgRV?=
 =?us-ascii?Q?IYoH2lcHDbV9Aof/dY0r30B79U7Frfh1dNIRAufS0t5SzBf/gcJbcPii7jfO?=
 =?us-ascii?Q?QXBYugoy0k8V9w4Xi/rvKeR0YITAc1Iq5urRpY+WIlirKZvlvbzH55kksIVW?=
 =?us-ascii?Q?C2v+mFW5tOKTxoOtWcaqucM+unGjksbqfwZI/5khr5INTEAr9eaXm+5Doacq?=
 =?us-ascii?Q?M9LJUsXuj1U9PTmsimyi3guglVZK7Txc1kIHGaL5kYx9/MC2BXbYRjDxaXGi?=
 =?us-ascii?Q?/CR3vcKkEo3Cp905FK9+5Qo/1jpLvlGFIsR7dxJkKNggriIy0IMYohJGPD0U?=
 =?us-ascii?Q?yRkld3ke+knAXRk9d9RaO5UwwXpPfD5MKLAzaDiVNR3Qm/wPoldgPfsFHRZw?=
 =?us-ascii?Q?ILnclsaz0DCXHN4PtCzeyqPyVMRLwoSSwkD2ppQ7jDv784j6qk1Ji86QDDAT?=
 =?us-ascii?Q?Q4gwrkp0yzUlhfpnUKoaS/h8AEZA0cfsfRtXHCSDXdU571UhUbsIK1b238nP?=
 =?us-ascii?Q?BdZDH7TI2MIkPNmRbbNuwieRdM+1TpvyFPP7vsz9HkMktoIXhJHvc7a92YcF?=
 =?us-ascii?Q?bwGdBBFOwmsGI1ejsqK5SfFpm6550MiHyk+Bf+TGeDNCrdATumq0NGNxY9FV?=
 =?us-ascii?Q?fWSCJx6zjQLEhwv3jSAtNaA6UoqNXT8B3GXEwJhTHqRQX34ze17shdCW/cl/?=
 =?us-ascii?Q?7WHjBeKyWmufOia6XPzheZtoaZyevfqJK+Dn2zI2NJIMojld1bxbL6594tTN?=
 =?us-ascii?Q?2OouZNZmS12tnv6vJpHAEQC2q2+ftJi5roNI1FPSlnrv5jNXUCGPvjV5GMzD?=
 =?us-ascii?Q?WDX2hXD+cwUM8XctQDrosrD2TFR3j558MaaVMAauYKRde3MXBo0u0zCNsCTD?=
 =?us-ascii?Q?lCbRyVaJtSPG1t0WF3YMiiPFynEtpij918MjacBWw6+43Zr/ywcY50l8Dlze?=
 =?us-ascii?Q?jPdbx2gACRWaishOSdoNqvxtNQlTrTVbPQf7jGMkwyliB1lx+w=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65abf19d-1f43-4d26-c8ed-08dee174cd74
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 06:54:51.5072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_235455_621461_6B0CC7AA 
X-CRM114-Status: GOOD (  13.80  )
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

Add the device tree for LCKFB Taishan Pi 3M, a board based on the
Rockchip RK3576 SoC.

The board schematics are available at:
https://oshwhub.com/li-chuang-kai-fa-ban/project_gzzvrwqn

Describe the RK806 supplies, eMMC, recovery key, RTC, SD card,
Gigabit Ethernet, USB Type-A hosts, source-only USB Type-C host,
mSATA, HDMI video and audio, AP6256 Wi-Fi and Bluetooth, status LED,
thermal sensors, and debug UART.

The MAE0621A PHY CLKOUT supplies the GMAC reference-clock input, so
request its validated 125 MHz setting.

The following interfaces were tested on the hardware: eMMC, RTC
register access, recovery key, SD card, 1GbE, USB 2.0 Type-A storage,
USB 3.0 Type-A 5 Gbit/s enumeration and 64 MiB storage I/O, USB-C
source/host enumeration in both orientations, mSATA, HDMI video and
audio, AP6256 2.4/5 GHz Wi-Fi scan, WPA2 association, ping and
bidirectional throughput, Bluetooth firmware load and HCI bring-up,
and UART0. Bluetooth active discovery was additionally exercised
during bring-up.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-lckfb-tspi-3m.dts     | 984 ++++++++++++++++++
 2 files changed, 985 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 20f2d282b..4c26dc5b9 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -173,6 +173,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10-pcie1.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb2-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-khadas-edge-2l.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-lckfb-tspi-3m.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-luckfox-omni3576.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-m5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-r76s.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts b/arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts
new file mode 100644
index 000000000..bfddce2a9
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts
@@ -0,0 +1,984 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 LCKFB
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
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
+	};
+
+	chosen {
+		stdout-path = "serial0:1500000n8";
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-recovery {
+			label = "Recovery";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <18000>;
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
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clock-names = "ext_clock";
+		clocks = <&hym8563>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reg_on_h>;
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+	};
+
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	usb_a_3_0: usb-a-connector-0 {
+		compatible = "usb-a-connector";
+		label = "USB 3.0 Type-A";
+		vbus-supply = <&vcc_5v0_usb3_host>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb_a_3_0_hs: endpoint {
+					remote-endpoint = <&usb_hub_port1>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_a_3_0_ss: endpoint {
+					remote-endpoint = <&usb_drd1_ss>;
+				};
+			};
+		};
+	};
+
+	usb_a_2_0_1: usb-a-connector-1 {
+		compatible = "usb-a-connector";
+		label = "USB 2.0 Type-A 1";
+		vbus-supply = <&vcc_5v0_usb3_host>;
+
+		port {
+			usb_a_2_0_1_hs: endpoint {
+				remote-endpoint = <&usb_hub_port2>;
+			};
+		};
+	};
+
+	usb_a_2_0_2: usb-a-connector-2 {
+		compatible = "usb-a-connector";
+		label = "USB 2.0 Type-A 2";
+		vbus-supply = <&vcc_5v0_usb2_host>;
+
+		port {
+			usb_a_2_0_2_hs: endpoint {
+				remote-endpoint = <&usb_hub_port3>;
+			};
+		};
+	};
+
+	usb_a_2_0_3: usb-a-connector-3 {
+		compatible = "usb-a-connector";
+		label = "USB 2.0 Type-A 3";
+		vbus-supply = <&vcc_5v0_usb2_host>;
+
+		port {
+			usb_a_2_0_3_hs: endpoint {
+				remote-endpoint = <&usb_hub_port4>;
+			};
+		};
+	};
+
+	vcc_5v0_usb2_host: regulator-vcc-5v0-usb2-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb2_host_pwren>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vcc_5v0_usb2_host";
+		vin-supply = <&vcc_5v0_sys>;
+	};
+
+	vcc_5v0_usb3_host: regulator-vcc-5v0-usb3-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb3_host_pwren>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vcc_5v0_usb3_host";
+		vin-supply = <&vcc_5v0_sys>;
+	};
+
+	vcc_5v0_typec: regulator-vcc-5v0-typec {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&typec_vbus_en>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vcc_5v0_typec";
+		vin-supply = <&vcc_5v0_sys>;
+	};
+
+	vcc_5v0_sys: regulator-vcc-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v1_nldo_s3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vcc_5v0_sys>;
+	};
+
+	vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_2v0_pldo_s3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <2000000>;
+		regulator-max-microvolt = <2000000>;
+		vin-supply = <&vcc_5v0_sys>;
+	};
+
+	vcc_3v3_minipcie: regulator-vcc-3v3-minipcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&minipcie_pwren>;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc_3v3_minipcie";
+		startup-delay-us = <5000>;
+		vin-supply = <&vcc_5v0_sys>;
+	};
+
+	vcc_3v3_wl: regulator-3v3-wl {
+		compatible = "regulator-fixed";
+		gpio = <&gpio0 RK_PD1 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_pwren_l>;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc_3v3_wl";
+		vin-supply = <&vcc_3v3_s0>;
+	};
+
+	vcc_3v3_s0: regulator-vcc-3v3-s0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
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
+&combphy0_ps {
+	status = "okay";
+};
+
+&combphy1_psu {
+	status = "okay";
+};
+
+&gmac0 {
+	clock_in_out = "input";
+	phy-handle = <&rgmii_phy0>;
+	/* RX delay is added by the PHY, TX delay by the GMAC. */
+	phy-mode = "rgmii-rxid";
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth0m0_miim
+		     &eth0m0_tx_bus2
+		     &eth0m0_rx_bus2
+		     &eth0m0_rgmii_clk
+		     &eth0m0_rgmii_bus
+		     &eth0m0_mclk>;
+	tx_delay = <0x24>;
+	status = "okay";
+};
+
+&hdmi {
+	/* The external level shifters must be on for TMDS operation. */
+	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
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
+&hdmi_sound {
+	simple-audio-card,mclk-fs = <128>;
+	status = "okay";
+
+	simple-audio-card,cpu {
+		dai-tdm-slot-num = <2>;
+		dai-tdm-slot-width = <32>;
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
+		vcc1-supply = <&vcc_5v0_sys>;
+		vcc2-supply = <&vcc_5v0_sys>;
+		vcc3-supply = <&vcc_5v0_sys>;
+		vcc4-supply = <&vcc_5v0_sys>;
+		vcc5-supply = <&vcc_5v0_sys>;
+		vcc6-supply = <&vcc_5v0_sys>;
+		vcc7-supply = <&vcc_5v0_sys>;
+		vcc8-supply = <&vcc_5v0_sys>;
+		vcc9-supply = <&vcc_5v0_sys>;
+		vcc10-supply = <&vcc_5v0_sys>;
+		vcc11-supply = <&vcc_2v0_pldo_s3>;
+		vcc12-supply = <&vcc_5v0_sys>;
+		vcc13-supply = <&vcc_1v1_nldo_s3>;
+		vcc14-supply = <&vcc_1v1_nldo_s3>;
+		vcca-supply = <&vcc_5v0_sys>;
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
+			vdda_hdmi_s0: nldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <837500>;
+				regulator-max-microvolt = <837500>;
+				regulator-name = "vdda_hdmi_s0";
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
+	status = "okay";
+
+	typec@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&fusb302_int>;
+		vbus-supply = <&vcc_5v0_typec>;
+
+		connector {
+			compatible = "usb-c-connector";
+			data-role = "host";
+			label = "USB-C";
+			power-role = "source";
+			source-pdos = <PDO_FIXED(5000, 500, PDO_FIXED_USB_COMM)>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_c_hs: endpoint {
+						remote-endpoint = <&usb_drd0_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_c_ss: endpoint {
+						remote-endpoint = <&usbdp_phy_ep>;
+					};
+				};
+			};
+		};
+	};
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_int_l>;
+		wakeup-source;
+	};
+};
+
+&mdio0 {
+	rgmii_phy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id7b74.4412";
+		reg = <0x1>;
+		maxio,clk-out-frequency-hz = <125000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gmac0_phy_reset>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pinctrl {
+	ethernet {
+		gmac0_phy_reset: gmac0-phy-reset {
+			rockchip,pins = <2 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	minipcie {
+		minipcie_pwren: minipcie-pwren {
+			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	rtc {
+		rtc_int_l: rtc-int-l {
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	wireless-bluetooth {
+		bt_host_wake_h: bt-host-wake-h {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		bt_reg_on_h: bt-reg-on-h {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_h: bt-wake-h {
+			rockchip,pins = <1 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wireless-wlan {
+		wifi_host_wake_h: wifi-host-wake-h {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		wifi_pwren_l: wifi-pwren-l {
+			rockchip,pins = <0 RK_PD1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		wifi_reg_on_h: wifi-reg-on-h {
+			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	sdmmc {
+		sdmmc0_det_l: sdmmc0-det-l {
+			rockchip,pins = <0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	usb-host {
+		usb2_host_pwren: usb2-host-pwren {
+			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usb3_host_pwren: usb3-host-pwren {
+			rockchip,pins = <0 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb-typec {
+		fusb302_int: fusb302-int {
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		typec_vbus_en: typec-vbus-en {
+			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&saradc {
+	vref-supply = <&vcca1v8_pldo2_s0>;
+	status = "okay";
+};
+
+&sai6 {
+	rockchip,sai-tx-route = <0>;
+	status = "okay";
+};
+
+&sata0 {
+	target-supply = <&vcc_3v3_minipcie>;
+	status = "okay";
+};
+
+&sdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	max-frequency = <100000000>;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_wl>;
+	status = "okay";
+
+	wifi@1 {
+		compatible = "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_host_wake_h>;
+	};
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	max-frequency = <50000000>;
+	no-mmc;
+	no-sdio;
+	pinctrl-names = "default";
+	/* GPIO0_B6/SDMMC0_PWREN is not connected on this board. */
+	pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_det_l &sdmmc0_bus4>;
+	vmmc-supply = <&vcc_3v3_s0>;
+	vqmmc-supply = <&vccio_sd_s0>;
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
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+	status = "okay";
+};
+
+&tsadc {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio1 RK_PD4 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wakeup";
+		max-speed = <1500000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_host_wake_h &bt_reg_on_h &bt_wake_h>;
+		shutdown-gpios = <&gpio1 RK_PC7 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vcc_3v3_wl>;
+	};
+};
+
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	status = "okay";
+};
+
+&usbdp_phy {
+	mode-switch;
+	orientation-switch;
+	status = "okay";
+
+	port {
+		usbdp_phy_ep: endpoint {
+			remote-endpoint = <&usb_c_ss>;
+		};
+	};
+};
+
+&usb_drd0_dwc3 {
+	usb-role-switch;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_drd0_hs: endpoint {
+				remote-endpoint = <&usb_c_hs>;
+			};
+		};
+	};
+};
+
+&usb_drd1_dwc3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dr_mode = "host";
+	status = "okay";
+
+	usb_hub: hub@1 {
+		compatible = "usb1a40,0201";
+		reg = <1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_port1: endpoint {
+					remote-endpoint = <&usb_a_3_0_hs>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				usb_hub_port2: endpoint {
+					remote-endpoint = <&usb_a_2_0_1_hs>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				usb_hub_port3: endpoint {
+					remote-endpoint = <&usb_a_2_0_2_hs>;
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				usb_hub_port4: endpoint {
+					remote-endpoint = <&usb_a_2_0_3_hs>;
+				};
+			};
+		};
+	};
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			usb_drd1_ss: endpoint {
+				remote-endpoint = <&usb_a_3_0_ss>;
+			};
+		};
+	};
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
2.55.0


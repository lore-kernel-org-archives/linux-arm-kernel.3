Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7484CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 10:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2puu2DmmZpKwO1H34ew6mLhV1vL5oed3NJF5c1/7V+w=; b=4ZWknKW8SJIZA2fCKOPml11LuE
	7sWOCw8EmZfbqc5CVTd7g5thqqEf37bkhecgN9YSWVgAIMbPg5sCs/m5Idi1z4AkNamxluLYsVlZG
	DoUpCpZTtnyxGs/zzqC82NtaOR3ZaivafV1Hd8hybvbfgXCAMh/0OWRZlT1yqhkrq7uFDX8VrU9eJ
	kvXoojR92gJ9slnZucYmMLx9PuPcnwfBGGWwp4skx+1gK2mJ1gJFSXRpic5aKPdRblIWaMqidpBjS
	J/L/PehcQR7892VTovisEd2RdjkPEv+hQcBiLwN5ZbpMORPRWN7YjYTOMayUCPvadAxg0CbY3Xe3r
	/LdY3XdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWNC-00000002H7b-0k7L;
	Fri, 19 Jun 2026 10:22:54 +0000
Received: from mail-australiaeastazolkn19012069.outbound.protection.outlook.com ([52.103.72.69] helo=SY5PR01CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWN9-00000002H5A-1l91
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 10:22:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMhyltN0sQAcYdjDzVexce6akdXfDxKw2qOt+UjnkwEmcqgsbXc1YvRf0DS83hY/C/nW50Y0cfn0nNz+HQmyMEXpq8b7rXU9kX00eaw7PZsOJlbumBT9THjRaoqQ6ABPb6I6IsbxiwNt9F/yBJUGf1MnsrwXt2z1ncO0cVmm7rZ0DFH68PX4KT/ewroOX9vGvRZoi9/XnJGrW5AI8M1g6aGZiJQhlJ6F661xBLmrto1QYAtdq/Ila6bwVwgtQmrwQvwyTkHant9Dz1yZXkfk2EHMRIOmB9ScRqVS0BrjusP0cb/mmx1FL3QEbshdIfdsmpIO1YPVACcaplIl0DsFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2puu2DmmZpKwO1H34ew6mLhV1vL5oed3NJF5c1/7V+w=;
 b=nyJ2oFnKugm5B3vwLeJOkXOjfZUL4dJgbs9wzzvrMfkWQMTMvII3N0zYtEobgWL38Z3z9RZlflbDb4KqHsZVmJEVHFuWjOgiusFzYrXuAm7qqqPEN+jYd4KyTbVFJLAdtlW/E1biMdaLcnDHT05VETCydLuX3OiC7z4Vn0O0q4zbm15D+DJNHNpstFXUGUs+7linFl4Xc73XuiylgIGLFxEgysHdVF1cDLzWubzzcPJXq11CKgG/cco8cKdydiuiZosUUpRq7ySWnD9ItGMeqzUXsiXb+fxwXkyokOh3yJiloxUzYWpSu01F16GZNy1kg/lJ0MJRdl2wwM1VILIdOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2puu2DmmZpKwO1H34ew6mLhV1vL5oed3NJF5c1/7V+w=;
 b=bIN+bDFc3wPfc2NjMVjD7NA2BwU1Zcu0KNrJY/C7OISbYWURpwWdALCNAVA8Cacs2p549OP5OeogjQz2L7jNa6vLxZE+ZOlBP6NxlsbJcnvLWxpb8ZUysFKMtUDnQjr3ZEC+zSXChfxJdLLY9HHxtA3MikffiNzmG0EYI/AeILuzenS55miD9e7HgbDZE8/48aZU2N0jhDoqqb3gB6cD949/Uh5dTktxTY0FiPo+uxIjrR5NFGkPCaargbtlBjQeYc9AymEMt4iPruq2pR+/oF9cXpYaf4xtSHZ/2WZ9S94aot9pirSbduBHDvdbuC3HCJNuJO6/8YS6O1IFsoDuIQ==
Received: from SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM (2603:10c6:18::488) by
 SY0P300MB1571.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2cf::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Fri, 19 Jun 2026 10:22:46 +0000
Received: from SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 ([fe80::4853:f60:ab7c:d57a]) by SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 ([fe80::4853:f60:ab7c:d57a%7]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 10:22:46 +0000
From: Liu Yu <f78fk@live.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Liu Yu <f78fk@live.com>
Subject: [PATCH 2/2] arm: dts: xilinx: Add support for MYIR MYS-7Z020-V2 board
Date: Fri, 19 Jun 2026 18:22:14 +0800
Message-ID: <SY3PPF19552C607A65588339A2CED9E2AFDC7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619102214.223121-1-f78fk@live.com>
References: <20260619102214.223121-1-f78fk@live.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:18::488)
X-Microsoft-Original-Message-ID: <20260619102214.223121-3-f78fk@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY3PPF19552C607:EE_|SY0P300MB1571:EE_
X-MS-Office365-Filtering-Correlation-Id: c13aa691-d6f0-4e56-4cbd-08decdecb46c
X-MS-Exchange-SLBlob-MailProps: 8U9+OAG/EBKkI8GgeR43xRMrZ/+qH0EFqKpKdBeruX8No2jZPTsX0XpesBIhsEWekIAmzZsnCu/pb4MxtYBHpGHUpkhEamHTR9HJe7TdAWTcaCwAJFsjpU0gmCg0RWmaic0KPNtldeQq/WFHz2RXJhpFFMOsizIS12zf0t7XO7ABK0vBVUejQ2u/vK7mRiAnxzFaTGgGZdPkUPFmnvVLEx9mnGd62EcaqBNL9zbWM3iRpXHZAm/+jlZPCtfGT91rDQz6UeE0N9D8XL1PsFulHn9ggUtm9LUciHPHH1j6W9088hRhzvLSSyzIvUalP76wPiqtJnXQGheC2O6MwV3uYBm381sVi6s1OyTVg4v/DJzUTGcBaWjp7FYXorSPr//BLW+MNubWjY8H5lPeDQg0tULfMF9MAlR5pveHBMKG6CDUNR9DV5+J+IYkEXH6Xp1gnciK0E8yWaaf0weiLyIs4bO/gjUgkMq5AKYFZE7G4Vxu/rCpk6Z0PAem0RDbhZJ+6H1CkloCOgB7shjb6Q0w3bUcwTE2WEFuW1nGDHt6Ya9BOT7sDi4ltAtD500B+zdgWc1bDewOPX9wmPryoRkq3diozIZMyvM5MFT5f8EwFJN9lwGr6niRyq3TTW7YWRCVJockzkEw0Ugik3J+zhNgN1CWH/l+uscwOCVRjVb26Ie/UO95527M9aHd7zmBzHVRrPti8J0uUwFKJ+dkYLyJgnTm4MH2Sxc8LN0s7HzyG+R4STMAryha4hLh6w2mhF5eHlBQFSQN8XpsBYoKW3UxmbSiamoas09PGJ2S2IvjrH2xDjpH0vwm6tpUGHy/nVlWI2YeN/qB3SsZVNsP0IGP9w==
X-Microsoft-Antispam: BCL:0;ARA:14566002|25031999004|15080799012|23021999003|19110799012|24021099003|51005399006|41001999006|5072599009|8060799015|25010399006|26104999009|40105399003|3412199025|440099028|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JshrkeYeCW2+OOLr9j8Cm/rMhxmfLYhSSyKVNLY60cTxagcA4nAYv3TLnDQ7?=
 =?us-ascii?Q?RaSVzhhxwbS7GxP+AssdVpWb/D+bFunQmFJsKRVAFltt5y0D2VyjmgezyM8M?=
 =?us-ascii?Q?Q3G47oMlwm2Wg7CWyvfiS0efwk2dogCp045+TquN+qtuilyF+I7nt31kMY/z?=
 =?us-ascii?Q?fp7YRL99tlTSNXAE8mVesR4998Kd2o/I0zkvtMf2Lwxkx6OAJTe4fxKEtwDh?=
 =?us-ascii?Q?brUQ2aqma7lao+DmX2NX2xtkgR4fnC1yXhusXHQcosiQjv0mWOwsJNhDrvRO?=
 =?us-ascii?Q?hr5eskhx5W3Op//r980K25vg/6vdYpUnWNkmKfyKQl9EH0L8DjlyNqgGNuVK?=
 =?us-ascii?Q?5ZcGLeqnYNDdydokxEdgB7Br3hc1NlT0cmQOFpFzjBe6F+RhBJra7qskWeVK?=
 =?us-ascii?Q?NkLmvWDA98O9Iu6P4hIVb+d10cWYuywFupcgN2lI7hzEUZlc//MvIHlB8Ryn?=
 =?us-ascii?Q?+a5xONyCx1mN/a2Joyg5y69t7MeFBN1RoOGsAX+V06X0U9pUIcccRhe+6PO0?=
 =?us-ascii?Q?sw8/XyI5C5kkZtk2sIGSW+qS97dhXfmEM8rC5xJtYSM0jKhf5XhSMleHF833?=
 =?us-ascii?Q?WpTmcQFoiq00Q63onghApqRhWGX2nFje3sgTtcjLDbvrfXE3Q4m7uzcXJLvU?=
 =?us-ascii?Q?b8mDwpvNcCN5pTKndZ/HQgabFGs/pu2upi8D1fxcBJJKH0nZHw/YaovEJ/TL?=
 =?us-ascii?Q?ndSd0VV6wYY+/l5mr7xGGWr+ydsrHmjudqovNhoNtyT0nXWI4VnSmLVfdX5f?=
 =?us-ascii?Q?AnTDaaeC+Vc4GKiPExC0Aht+mJElhyOE+vjqApswnKw4girmCrvsb9bg1sXM?=
 =?us-ascii?Q?+wDYMX6RN+IhgPgGB1Ki0eWaC+6TSwCzFJapFXkSJvmRo/xIIi2Q+TvbazK1?=
 =?us-ascii?Q?HhPFtwW0WlIwvtHRMmbP5Msh/tkaA9QszQTLtgV5ZFO5KxsydCn3eU09zxcU?=
 =?us-ascii?Q?v+gxY+K5zkdmB7FVOMFu5ApLd8PZfXNIYmIkVVQZp5sIwG6fnnZKcnV+uiGG?=
 =?us-ascii?Q?t1ALbmSa3TQEWVHJkf1dCh1uHw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Od7fAXVmkLzSgRfYKgqyLzxWubY6ZFEK+TBpIivvT233UPPp2VawY+OZJIa3?=
 =?us-ascii?Q?fBfk9J0Ghzt8vAplPsuJmGJ2Yan++3XP+5eSG4noEo8Lq3kdQNJJDHaTX8Tz?=
 =?us-ascii?Q?PqqQbDx9IxKDqyJEGsO04Q5OG1jn3DLbILrSb6PJ/7AAOCEuu5Q211mjgIAM?=
 =?us-ascii?Q?/e0fvq5Xs9j9wbj/+YOkMyrBXlTVs24jLircAp94sVHXvIzzDWOBmjtTSf3J?=
 =?us-ascii?Q?PLrhViarIycexNeQQtJCFJMuNhT+I2ntpfFR6vfc5sBT6tB2QBr0UvYLpn64?=
 =?us-ascii?Q?S09uveI2BbJoBs/JLBbJ5plCO0IjzCiWZ8Y/2Js/wrofwD8UToDqIM1i9Ghu?=
 =?us-ascii?Q?3wHZ+ivnAe0iEUT8dxxK40jaQcC8uacf4gVEhG8ur8zgutsAUmt4c0dne5M8?=
 =?us-ascii?Q?9Sdtz05nj6mXSD25WxYYW7e+AcP5pRWyvuqE/qiWsBpdd14gwfW/Uo16Aha4?=
 =?us-ascii?Q?sraLwTS9Z+wed4FmkqcCz8BLGpviL3XKXq0CsZXbeKjUDNSR1/vS+wG6tMHk?=
 =?us-ascii?Q?MdUQ86aIHH4/bkd04ST2edt4/TPn2dBl01JhgMeZfBd6IbUiHVt8R3QZQ7Cs?=
 =?us-ascii?Q?eUct3xSO2UlueG8ysJ/MxGQzcMrRWXrgYqayBoEfwoUw2qQB9HVboe7AcUob?=
 =?us-ascii?Q?nLxGeEziyjQvRvWrus/Br5LtTc/c3wjMJ/ZvaTewiPFGkJSOr3AhHV7AGCYm?=
 =?us-ascii?Q?uGp+l9gFEeK3j31fYpX72YyJiLY4LrLr9jzALGapd5aSgSfP2pwgwKuP2eOD?=
 =?us-ascii?Q?IGpIHHFXbolp/9Ys1stWuiAw0wfmGunayLxtPZMIQT+Msy8ZW72w+ee0Ggbz?=
 =?us-ascii?Q?ccqYZA3aRlAWHC+SYr2mp9ED+PRnlxnkE5igiCe5B7k6As3F7sRmtTnouCZd?=
 =?us-ascii?Q?U9HkZ5oW9mb64ngiPx3weM0W7mcbWI+jQXswMqhYdaRtvBbr7X2GabKYal0N?=
 =?us-ascii?Q?MqASoA9M5t5tbHESvqHBdolL5GcX8AibDWxlfGw7znuVIXeNOtyXakXQDY/c?=
 =?us-ascii?Q?ooXclurFv15TR3Sl0sQG8fv7Fmzc18cB98o8+k+wYyinR1Ia/pQOsDDsQXnW?=
 =?us-ascii?Q?FqLpWruflHFVaFE3DACKZpnBq+GgoKaxJ10NtqHL3KAhAbotoa3NuiXVa7fQ?=
 =?us-ascii?Q?5RS82NVG6dc3b59YTSr8KZb5/N9YhXThdlrSg/Z6Oa9b9DkR++w3uU5fJ347?=
 =?us-ascii?Q?Hj96xgDuQzSv/+8warMANBspAtRtBj1SRoW2sMsy+DjL0FD0uL2mjMjS52LP?=
 =?us-ascii?Q?8HIlCrRf3oNr4IDIXfFvGtN/r+Nh5K1nv2m1nrBedFoLVr2e3TWp0HSjj4DR?=
 =?us-ascii?Q?j02yvohwbaUhV39B4l52QnE3Zenm/brqzjwnwAOfRc8MIHaR9jbMB7O+VoMI?=
 =?us-ascii?Q?B8LnKiE=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-4606f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c13aa691-d6f0-4e56-4cbd-08decdecb46c
X-MS-Exchange-CrossTenant-AuthSource: SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:22:46.5733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB1571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_032251_461546_61A0C3E1 
X-CRM114-Status: GOOD (  14.02  )
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

Add device tree support for the MYIR MYS-7Z020-V2 board based on
the Xilinx Zynq-7000 XC7Z020 SoC.

The board supports:
- UART serial console
- MicroSD card interface
- Gigabit Ethernet
- QSPI NOR flash
- GPIO-based user LEDs and push-button

Link: https://www.myirtech.com/list.asp?id=708

Signed-off-by: Liu Yu <f78fk@live.com>
---
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../arm/boot/dts/xilinx/zynq-mys-7z020-v2.dts | 228 ++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-mys-7z020-v2.dts

diff --git a/arch/arm/boot/dts/xilinx/Makefile b/arch/arm/boot/dts/xilinx/Makefile
index 9233e539b192..6c59116013f1 100644
--- a/arch/arm/boot/dts/xilinx/Makefile
+++ b/arch/arm/boot/dts/xilinx/Makefile
@@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_ZYNQ) += \
 	zynq-cc108.dtb \
 	zynq-ebaz4205.dtb \
 	zynq-microzed.dtb \
+	zynq-mys-7z020-v2.dtb \
 	zynq-parallella.dtb \
 	zynq-zc702.dtb \
 	zynq-zc706.dtb \
diff --git a/arch/arm/boot/dts/xilinx/zynq-mys-7z020-v2.dts b/arch/arm/boot/dts/xilinx/zynq-mys-7z020-v2.dts
new file mode 100644
index 000000000000..39bd864ca358
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-mys-7z020-v2.dts
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Liu Yu <f78fk@live.com>
+ */
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "zynq-7000.dtsi"
+
+/ {
+	model = "MYIR MYS-7Z020-V2 Board";
+	compatible = "myir,mys-7z020-v2", "xlnx,zynq-7000";
+
+	aliases {
+		ethernet0 = &gem0;
+		mmc0 = &sdhci0;
+		serial0 = &uart1;
+		spi0 = &qspi;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		key-user {
+			label = "USR";
+			gpios = <&gpio0 50 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_PROG1>;
+			wakeup-source;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-blue {
+			label = "led_blue";
+			gpios = <&gpio0 115 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-green {
+			label = "led_green";
+			gpios = <&gpio0 114 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-red {
+			label = "led_red";
+			gpios = <&gpio0 116 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		usr-led1 {
+			label = "usr_led1";
+			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		usr-led2 {
+			label = "usr_led2";
+			gpios = <&gpio0 9 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+	};
+};
+
+&clkc {
+	ps-clk-frequency = <33333333>;
+};
+
+&gem0 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethernet_phy>;
+
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet_phy: ethernet-phy@7 {
+			reg = <0x7>;
+		};
+	};
+};
+
+&gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio0_default>;
+};
+
+&pinctrl0 {
+	pinctrl_gpio0_default: gpio0-default {
+		mux {
+			function = "gpio0";
+			groups = "gpio0_0_grp", "gpio0_9_grp", "gpio0_50_grp";
+		};
+		conf {
+			groups = "gpio0_0_grp", "gpio0_9_grp", "gpio0_50_grp";
+			slew-rate = <0>;
+			io-standard = <1>;
+		};
+		conf-pull-up {
+			pins = "MIO0", "MIO9", "MIO50";
+			bias-pull-up;
+		};
+	};
+
+	pinctrl_sdhci0_default: sdhci0-default {
+		mux {
+			groups = "sdio0_2_grp";
+			function = "sdio0";
+		};
+		conf {
+			groups = "sdio0_2_grp";
+			slew-rate = <0>;
+			io-standard = <1>;
+			bias-disable;
+		};
+		conf-cd {
+			pins = "MIO46";
+			bias-pull-up;
+			slew-rate = <0>;
+			io-standard = <1>;
+		};
+	};
+
+	pinctrl_uart1_default: uart1-default {
+		mux {
+			groups = "uart1_10_grp";
+			function = "uart1";
+		};
+		conf {
+			groups = "uart1_10_grp";
+			slew-rate = <0>;
+			io-standard = <1>;
+		};
+		conf-rx {
+			pins = "MIO49";
+			bias-high-impedance;
+		};
+		conf-tx {
+			pins = "MIO48";
+			bias-disable;
+		};
+	};
+};
+
+&qspi {
+	num-cs = <1>;
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "qspi-boot";
+				reg = <0x0 0x80000>;
+			};
+
+			partition@80000 {
+				label = "qspi-bootenv";
+				reg = <0x80000 0x20000>;
+			};
+
+			partition@a0000 {
+				label = "qspi-bitstream";
+				reg = <0xa0000 0x460000>;
+			};
+
+			partition@500000 {
+				label = "qspi-kernel";
+				reg = <0x500000 0x480000>;
+			};
+
+			partition@980000 {
+				label = "qspi-devicetree";
+				reg = <0x980000 0x10000>;
+			};
+
+			partition@990000 {
+				label = "qspi-rootfs";
+				reg = <0x990000 0x600000>;
+			};
+
+			partition@f90000 {
+				label = "data";
+				reg = <0xf90000 0x70000>;
+			};
+		};
+	};
+};
+
+&sdhci0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sdhci0_default>;
+	disable-wp;
+
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1_default>;
+
+	status = "okay";
+};
+
-- 
2.43.0



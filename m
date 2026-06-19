Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45118CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBa7r84tcRbXVaR9dj9ns5C3Je6OKxKITJV1vr5Yf8c=; b=vkgC4zDXtj9HmnuHmIL5SvUjSq
	Egda2Y9JszL2wRCXyJ2ji/9WVoQtVhrYngPEopN3oqde2fX9+SiVrDkpQErRiHgr4AoI6JoduAI8k
	onjpj5Seg5rgWmj/iTmUn+YBEGv5pjYP4dvVN55EjKq3uWMbEYKXpnHLfVVfsanoely8uAlckcbun
	ufo+Z5l93hFEwKWJvhTAy4HH3r57C8BpIBvSngprMqcp0/17XxAsqU5cc/igr6uj7Cc62BWHiHrUA
	hu0IqmaC9CjTUlwBXpbYu8yokjZJqwRIXG6QJsgm5hscWDeZfzkW6t+of+moSeUUXxiJdHmH8TLbm
	aAEu02BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZDH-00000002TUM-1ZQx;
	Fri, 19 Jun 2026 13:24:51 +0000
Received: from mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d40e::] helo=MEUPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZDE-00000002TSU-33qA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:24:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQZAgHoGS6a57h4K3iYYRZJR+Yj5AZRcYHvet98+z0s33z2iMitI9nt5CHBOjegpPq9sfZNwM+kXSHdplr2LOCGFWjTCYi56PjUD1yRBWZ8jkHImCiyBXbhJcczjf5q6DdFcMp8/BLuK9sygzCx4ab/I/TQ97wpAJXBaIMU9FTn4yBE9n+MEnR0dRJ6SwLKF2qfKc/n72LT5n0S91hOF2K8wLYE3gbyLxsYWOtg+sI3fDUj6cSg7a08Vif4xAQJGTwBJd93a+FKg27RpzCf5BN/AiCsaZXTx6q0G8Zr9tNdHE4X0LEafahhwpKkLC8PtLwR8ZtHUFzB+0v5lAqXuAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBa7r84tcRbXVaR9dj9ns5C3Je6OKxKITJV1vr5Yf8c=;
 b=Tt7lYUViABn8QcI1wGMA1Vx8OcdVpxo5Pj8O1Yz4PTaHHrhywRl5S9Ah9BUno397xW2QDGWkXWyB6Y9LhrMRy+lSz94guY8NHsiO5lU7oRo+gvBSZvv7L67t2IRUM0LvocijjQVkJ11R3OMVcLfs4vHDbQgs9hMCut5aPdfKZ8O7Jnm/Aesy8eE+umwKPY5VG1qsugqxV0ynPSFIppvgeMcxHItzlIid+c+J2adRwv+H4He/jczEolTliMiRvOH+lMGCiLYTjtaaGO7y7cxjQcqcQ9rHAegoT1SAyRbNvxuwbRefMqfF3w2i+X29MdnUVrBbybCrfde3OaRDpo2ajA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBa7r84tcRbXVaR9dj9ns5C3Je6OKxKITJV1vr5Yf8c=;
 b=YRVYK5xD+ICqOzNfouBga0gpoKaagqnuMnbE3ubLPv7g3k+WfM69B2dtVKH5MVbg5fzwvd5TEzfFh+U6wNOYLHO33SGUHBsKCoDWSyJbJMvDDQU6OMYuCR8hmLdcslaXfDyt84xCXi8zzSO2srgacKkJk+7QoWrpr3DdaFKPogTgjPz8Eo2+eXYnPiUbYU0w+7qOOSRNupYvwDLm6+Ik2BSPYerQgw7XmMf4WDON7XbvlzVJNSoH0xCrv0RCx+LwzLyPst35eojKwJX2Duz7E5NDSrT8atyCq3ebcu5yMqdGZSV92wZRfPolGasT6n0KUxDVRBuHjYfNyvqoplPTAg==
Received: from SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM (2603:10c6:18::488) by
 SY7P300MB1372.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c4::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.13; Fri, 19 Jun 2026 13:24:21 +0000
Received: from SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 ([fe80::4853:f60:ab7c:d57a]) by SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 ([fe80::4853:f60:ab7c:d57a%7]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 13:24:21 +0000
From: Liu Yu <f78fk@live.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Liu Yu <f78fk@live.com>
Subject: [PATCH v2 2/2] arm: dts: xilinx: Add support for MYIR MYS-7Z020-V2 board
Date: Fri, 19 Jun 2026 21:23:55 +0800
Message-ID: <SY3PPF19552C60735AFA1041A0183DCA07CC7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619132355.1776-1-f78fk@live.com>
References: <20260619102214.223121-1-f78fk@live.com>
 <20260619132355.1776-1-f78fk@live.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OSTPR01CA0070.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::18) To SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:18::488)
X-Microsoft-Original-Message-ID: <20260619132355.1776-3-f78fk@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY3PPF19552C607:EE_|SY7P300MB1372:EE_
X-MS-Office365-Filtering-Correlation-Id: 22610757-174d-4602-320c-08dece06121b
X-MS-Exchange-SLBlob-MailProps: 8U9+OAG/EBKkI8GgeR43xRMrZ/+qH0EFV/Visnt8B/Pmx3+i9UQhoYORgEk3Fn1WG1088qff1kK0Ov7QcbjQcUJbC4smNRf5N+lXjr6dJEKCT73Nf7CboLSZrFzSsUCZHh7ADVyJRzZ+h/wY+NUm4z0r0Ry+Co35942LyJokn6xuOkoHCvm5WKNG/hEiVaEC5M7BT4Gu2utW+g2kw8HtQE+Zo8OTh1JTGQ9Tf9s1SFpTuJ4N+5oVtc5bIYKyVFw9015jfDnA/GdD4KlkPhUpS1ODxba6qBrAnNKkEcnbKBBvDEPsvtCZyIpVH36unYynqEZAcrqmfDA+ewUtRcwCN4r315puIaMJP6+pbu1DPC0OFKBk39EwirMR90cEiyIiIm4UPCbsUOzHzRg/qiqcIoI4D7i+4VKN17RUo6gVG+cVFc7gC++/5x9Vh+6DC8hfFuy5jGVPRu2TCXob/jl3wckOEpMBdWLIiLKvaeou13YRBOiKKw+G9pORHXMz07JqAZWlzPW6ACJpDFgqG0vmqSR3HfKra6KYvy0tfc8vbYhbNOB+/YzVy7nO08FxbQ1tCYiHcCn10eGowYdycHhBh47c58AYHrKwiIv+MN8NVzGFOPeX8CEb8qiZ7Pm4OvSI0hRBSOhFrda46HJskttnxLfBA7XOGk0it/3fRb5qVxc4IOODMnBsygVWidwwOKOCXs6Xj9zEKPFnLDyoCSEFmV8Jnw2J6s8y/07MMh7t9lpBgGUNX8yYniMBvVvh/3lGYOW+doOV4fDz4ogrUXB99pDWBoBPz7A9GKI4wqT+TyityBcZtbgfKkHKE71yHZkD/Wcd4tTbF1dqZo2eB1v2jg==
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799012|41001999006|25010399006|23021999003|51005399006|25031999004|24021099003|19110799012|8060799015|5072599009|10035399007|440099028|3412199025|40105399003|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7+36jDTRyEQKsf+vpqNZtffWt8/bNmupfkLgQmxLsrquXC0KK9pX5VNFVb3P?=
 =?us-ascii?Q?UJKzZVAK28m15YEvud1TipJzbtz9NEj9eYes7BIRwaKj92ziziyy0euGA4DL?=
 =?us-ascii?Q?Rdu45Iilhpwm7gC3/OGzH4Ssp/I9ukOKt2T6b1xe+nwlVh0h1Vd8W+Jb5ugx?=
 =?us-ascii?Q?KIxENrbLmfvOwHnywyGIud+j5yUnIny7yiGZl02jNVWwwDqv+FpqtmCLyZ8B?=
 =?us-ascii?Q?KsVgYLLqJVCjVXQ42X0fjKJiawGCECGtGOJ97sr8IMZgs8W7GHHoyCTMMWTJ?=
 =?us-ascii?Q?/MliUmhtZLihZOAb5QSPW+bB/R2vFbaFNiYUos8FRBZgzPtVafJDVHO1MVRW?=
 =?us-ascii?Q?f2+9PU99IkW+d7PfFL0F/DVEmQeKgQC6H9GtN/ZytdYIlcUMkF8478PUyZ2+?=
 =?us-ascii?Q?QJffGnemM1LnupTHYbdJmUjBFYSoNtXcZrA2uFFAXcZNBF+s76gkNOUWbMR2?=
 =?us-ascii?Q?1W2RFmkYKNQcoyzobOGrxHZvE++HlkCwGp2kAd/LC+1TtLq9RAvBWuOpOfL7?=
 =?us-ascii?Q?FoG12FNZVpNmk4u1K1CAnMFGJjA/FbR2vJDQme8NZy86UAO7KbtA9sMTj3yF?=
 =?us-ascii?Q?w2SbijcQPObPCdU9QlUYvyvUlbSqklezHkD9Ns2+SlwcmuBfHy4uZ5tP59Ev?=
 =?us-ascii?Q?TKwVDNnw14J1pmTcvOAKkbHbSwUfQytU23KgStBOMyuFHDZx3K05C/OUF07P?=
 =?us-ascii?Q?Zf57wYRHMhDgikyYWA/p0t3iwK0/8CsX87BAvbSu4RUQp8dKGjGHMbecgHiO?=
 =?us-ascii?Q?SJIfIH1r62y/bo/LzlR4YpisSLfrttA5WniPX5pSsBXx0LvYF0v1rIEjzJzj?=
 =?us-ascii?Q?eASWxvEL+IopxzzvMdH0Wftl/8Htvx7wRnsUz3gnR844UQH/3SsuKBFN/lJh?=
 =?us-ascii?Q?q2di+2okNetu6BcPkITOHTl5JpPmJTC5vhKqw10roF8LxiYgxpbBdLw48L6f?=
 =?us-ascii?Q?caYUR7O9ZNfNlqZLPPBTmPpkqZMx1Ev5FalM/7ZQwR4QaG99BC+HezRtBS+8?=
 =?us-ascii?Q?G6NYEyYeXeIP2ZfAIuiTMZ9KYA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FTCVKg/Y7ygdK+0ELXVHL8ZsDvrWOXmYD5uAg8nBpMC+FjDO3AUHW7TFZY7t?=
 =?us-ascii?Q?mZ70QB3i9tIIhmJSQucny/+ZV/u8wT3zvKHC4uf4BPvZWy0WAFwxBYvvJLhz?=
 =?us-ascii?Q?IHQnQK8Aavo0CbyIRqiZoYW+TrAWVT21ezg+TwcZB01Wuq6gJk2hgDBOkTje?=
 =?us-ascii?Q?FDJBd/LYhQzWqjkBMyRWOq+927T6nNO4fuu0MhmfCpsNP2zJ+FURT9c6Zv2c?=
 =?us-ascii?Q?7+WHLzvFWGA50I/SMZUinTBfzhK7oQxJ/b+rkpEpNLh9lSr5g1a/Yv+yibdJ?=
 =?us-ascii?Q?bazdGuT6xAVQoE8TGTyXEVyGj16DvIvZM4PfCz8bwxst6iOKRYbaPzc6FN6I?=
 =?us-ascii?Q?z467SENGhnFTqg4dG7DlVN/pcljVsqT2mnYd+lCeAD2ZOz2fiFdFNRbs90Wq?=
 =?us-ascii?Q?b0T3jIs7ZFv2UQPFH/lYSaZB5W4dkvosTI3QgxOfRVKZEXl+DYtWqrfAgj3/?=
 =?us-ascii?Q?Br4jrcNR83u76sLegW/gk7Niht/RYquewo5aAXUlgygwILkQuiIgonI9HqS6?=
 =?us-ascii?Q?otahRZYgDsgraNNKA76b4CBcUyq2ZzccAXdHGXGJUxlySPXzFKz2GFEfeKep?=
 =?us-ascii?Q?xIKoWquvGrKeqwON3xJeE3AW4/tVb+kjPxy4Lhc+ASwvxRwq/9UegGG/4d7k?=
 =?us-ascii?Q?0aH8wD7lFUjzWlmBHIQHSaJ2ZX7lcx+yFMJS+EsavK8nkVptYv5Y38DHuxPN?=
 =?us-ascii?Q?uFG92DCaJHiiHpE7OMqjdh6ruyMrz6Uh8ailRoWJZ8ZIB57i69cGHZr0zIkP?=
 =?us-ascii?Q?FM02/X7weZqFjv77hkKyAWS+wx/kWRK7FaejYEoP+WW+/SsVCwLs7StD+R/H?=
 =?us-ascii?Q?yyDg0e2eZ15ra1331ZQK2Tt1Z0a9lp94mC571Z03TuaNS3zDsfXPAUT93K9Q?=
 =?us-ascii?Q?zPVonq2Ym6mLw4UDctNxttAaZfCJ37ObQyX5lOBClBzLMsPh8oBIPyra4ina?=
 =?us-ascii?Q?AmMn0AP+vVIcwTsfQ0Aujqwt2GnV8vrRIYb0/zqst7KTqQDCDq2+ivAcRBdm?=
 =?us-ascii?Q?fgf+P0+b5JBmJtopgoDpTtf9Fm9Xi9WDajs/+LcYny2pksOZJ6wX9wnJ/6Mn?=
 =?us-ascii?Q?Wo9p5wfCXrDwvnI8tueJBX+Uc2DGG2AvCI58vHDt00Y52S3k/NZpPWh44GYy?=
 =?us-ascii?Q?kGmlAEAK6JImES40+HUUNo+HvWgtW1X6gr8z6Tm44RMWofMFyDW0l3ib2Jy0?=
 =?us-ascii?Q?Zkoji7InCPKMzFI2ANgOoDmXX2SP+aXQ6miOEc60XYuHgLkTBTCUhlqst5PP?=
 =?us-ascii?Q?/0VjaqhapvJpmHxEiy1YQhsQIzq3bclMWfOgubu3gBehC+8LSvVL6VU54NCq?=
 =?us-ascii?Q?fQmzQtUyZUnSiSWHjQ1CnyFbwHdJLt2s5tgF1Nw3rVQNZXbmBKpr1bDdrHWk?=
 =?us-ascii?Q?BNGncho=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-4606f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 22610757-174d-4602-320c-08dece06121b
X-MS-Exchange-CrossTenant-AuthSource: SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 13:24:21.0610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1372
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_062448_774858_98DF5689 
X-CRM114-Status: GOOD (  13.28  )
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
 .../arm/boot/dts/xilinx/zynq-mys-7z020-v2.dts | 232 ++++++++++++++++++
 2 files changed, 233 insertions(+)
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
index 000000000000..b55133133e2f
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-mys-7z020-v2.dts
@@ -0,0 +1,232 @@
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
+		mux-cd {
+			groups = "gpio0_46_grp";
+			function = "sdio0_cd";
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



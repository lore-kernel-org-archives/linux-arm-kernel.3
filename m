Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80116C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84FxozLh+z3Mz5Az4nAW/8Rmh+SGSo1C4c0QaxoJcYs=; b=p68S7TkiU0cHI2HrU6Pk8yKhMo
	jnlaQLHo/U48tnEcwfi59O2jGYEt2258/r24z5Jto5Hx/mGsF59PpaZj+Ydo1Ee7Zn9ekj0sxNNEH
	vG1fFglBSfu0KOszHtMEgWoAyh10qGeBhUKCiCgibEGPFts1jzwSI49LXQhKMkN4Hx3M9QAE9pqDs
	3IcItIlJWN6BfCNo0wG0Br/DskiUpnM7No4Y7AgVdJwmL0TWNseeslb0K3I6RV6jrUpb2bDtPbsHz
	4wau1O+8YkxK4lv3RBFyCS+zxmu0rX+Kvz+2GP4756IEH1yCZ7oVB1i8SL+FDBvgufUJuHjSkbgWv
	HuUuQErg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRYf-0000000Cctb-1GtU;
	Thu, 03 Jul 2025 21:33:29 +0000
Received: from mail-mw2nam12on20710.outbound.protection.outlook.com ([2a01:111:f403:200a::710] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOYR-0000000CDcD-2053;
	Thu, 03 Jul 2025 18:21:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emkWvePgLy8VvpQTNImkm6H90G8zAKQRBagxrtH1SkoxTiUtlWInOTJWgnDCoyDpiheVQbrar8jqQSpU6s9HumjjiNSpEZrryF2vEP1fiNb1VHsFZUFWQZYu8kDe131jM+/hMim2oj0AZsVHXZerRXn4zvlHyedneW1YBRt6MyUG8tbPobF/YVeWrRf+Xy7NWbaNfP/sX3V4OSedaczjc+ds/TRWBHKqDvXfyMXQSo02xKDAJcFtF6BTIHDlM++YqyAnrOUG7e39qSBilaqHCi/52461fXpPHOf5Gt9yvonYCiVoj286eIrQjUWI1klbeYeADR12CtVCk6lEv7PBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84FxozLh+z3Mz5Az4nAW/8Rmh+SGSo1C4c0QaxoJcYs=;
 b=P6D3hpBjw4cL+EmejHwZo7ZkkGr9LLm9tZke+3GLicILKGq9WMkH7jd7AIia1CipmL9QhKHGf9SqjFElWRQo6lTpw+MQ1Bx/R6fM/P4uCZeFqaiFKPpFzw3S7CBId1Nzu1pQ6ryjIv5rDgZ0ApcTlSqqieJmFCYCyQu4aJiWKxUGLT2RNSv5v8WnuN8zFYEuhSZUQF1lt99qITL95U53sI/11Dngh+i2TSOI3oz6t0JLvXdcygL7OoJ8bFOfveZi31lWFNNaRX4+OT7gm7+YeWIW0umV+dJVV4HjuRleIuO9DB9qE5oaJQ1iKssSTHN/Cs+3EU+NRujHVxtXFuo9+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84FxozLh+z3Mz5Az4nAW/8Rmh+SGSo1C4c0QaxoJcYs=;
 b=nNACMRBnsKKKluL8hQBZkk0OrYbO6jwPYCeFoZWeGE9PotG7VC+yhJOVQfef9tqQmIQ/aPLRi7NmTdzvKtT8HChuX3v1ko1JHfp80ZmlupVdQIz3yY5p2p82bMLTTagRK0T5zRieoQf9XI6Pc3mSsskLxjvcUy4VEgTxju+WpSMgSIbVFtMZ22xe7o/GIjMDY020PBNqi383ELTz6DsGpOCPVbHBBYUDd3WRzmeYqMuXtmogLPKYGYygjkSBDnYmNAOVPNZ/mix0skvoeVzs2wNVbuqrmEuPyv8xiPpNUxSUMzdFcE3DCeLh/x2R8czbvRHZk2qLwq5p6ogHetQ07A==
Received: from BL1PR13CA0311.namprd13.prod.outlook.com (2603:10b6:208:2c1::16)
 by PH3PPF69404777D.namprd18.prod.outlook.com (2603:10b6:518:1::c9f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 3 Jul
 2025 18:20:56 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::94) by BL1PR13CA0311.outlook.office365.com
 (2603:10b6:208:2c1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Thu,
 3 Jul 2025 18:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 18:20:54 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Thu, 03 Jul 2025 11:20:44 -0700
Subject: [PATCH v6 02/10] dt-bindings: arm: axiado: add AX3000 EVK
 compatible strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-2-cebd810e7e26@axiado.com>
References: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
In-Reply-To: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 linux-serial@vger.kernel.org, linux-i3c@lists.infradead.org, 
 Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=hshah@axiado.com;
 h=from:subject:message-id; bh=2P0fqQ4rK4FrrY5jP0Z+4ts52LSAML5KAClXxLndh0k=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZsn+xiL7RoOaNuZRJhf1jgJieqeiVdIiyWshf
 pA3OwKAhOmJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGbJ/gAKCRDxWHMRoTLV
 +/OHC/98YcMvbPnlfa9FC5fNOwHtCuAMaKYwEUAccULOa5eLIvWKm8Lk1rzWSYD5gVb3vDwvP6g
 0bfXXjZpi5uUUO+KhUisE69FzWYFJzyks4vB7MLkwvh5c8yzNFEmFQT3q2BNKmnRPhOaLXlNG1X
 CGAIcvI3iH4f3wj+NpOaPa//GFFkdV+XReLktmYl0O7HmO7mEKWsp6x78Yo0FugBmT1lmJTljTE
 Fj0Fl9kdIjvTzWbHHBD8I+/TAaZ3bgJiAXzaVZxz+2V9b3nf9Cr8EGayB/SbHa8HHT1R0nK/4a7
 8s3OiyswxExfHcCpFrGhs0ee0rN8ngxNrl/fegADBROVYdou8cgwuHdJ5YcbmRTiZL5QKFE20bj
 VUN+a6wei2tzc9iPqrYlkfHKGW9WSbXrkcbEi9dKmLvPjmsjQ88yiWJDgHXYk/Y4qcFY4kilT1K
 CIXJQ9cA1LQ1V+tK1xU+sT8T5lx+HYhZJtBDbODLCzIL4gaRh3ZUkBpOL8K76T6E+gykE=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|PH3PPF69404777D:EE_
X-MS-Office365-Filtering-Correlation-Id: 0935a15a-21e4-4599-d0e6-08ddba5e5a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGJ5Z1A2L3p5NHUrZTkvMm0wNytaL0VHMHZJaEtwWVFQaDJNaGluWDc4clc3?=
 =?utf-8?B?QzFWV3hRdTgwMURhb1haY1o1aTBxYTZ2SmdscE1Iem0rcmIzajJUeERsZjdI?=
 =?utf-8?B?aVB0K0tBYmcrRHRjVmliTkdwQjM3S2l6SEk3eDE0WGF1YVR2OGZOUXRYZXNR?=
 =?utf-8?B?SlJGUGcwbkRjbnNxa3VxWW0zNm8xRGJFa0gzUStLM2pmc0Vuai82N1A1bnVq?=
 =?utf-8?B?bUN2anRHWitCM1BrdCtsWUZMeS95TXRRdmphb3ZLV2IrOEt0RGNMcjJmSTQv?=
 =?utf-8?B?bmoyaGVDTmpjMmRDcDZ6OTJ3a3VWV1M5NjY3eXQ4VTVhMlZvZlhNbnpTRlhw?=
 =?utf-8?B?M3FPbitkSm1HUGlkMXBST2lwVXp5YzVNUEtvWUhSODJBVzBFK3crbi9mQjY4?=
 =?utf-8?B?UUxXbzIrUFdWcVVKanBhUHRQdGU4cUxUQnlhaS9DWVhNOGI5cm9ITmdpdkc5?=
 =?utf-8?B?dXkvSUpjd2U4Q2tRTjUyRDhXcHlHbkRIL0srTDE3allTbkI2MDlTLzRoRE1G?=
 =?utf-8?B?ZFhpV0hoVkJNOVFMUWFScXFoMnI4ZTIzZjREOFJuTGpENW1LRFhsUHBaZG9B?=
 =?utf-8?B?SHpaQ3hLL1NrMGhEdWhxcUtLOHlHVk1QR1ZhUmFkeWZKOXFzQjFJNE5yNG9S?=
 =?utf-8?B?MUZ2QUhTK3hPdkZXdTE4QW9LWk15UXIxTWg5SVhJOTNvV2VBc1dMNkU5bE5O?=
 =?utf-8?B?QWxDT3Y0S1ArUEdYOWtwL0NnUVhqMGVJQ1JUWFhSeERVNlBNY2FDVERFSmRr?=
 =?utf-8?B?QmxZcjYwclROa1NYMEllemxWejREdlJVV2x3NHA2dGE0TlRzeEdWVjNvaW5r?=
 =?utf-8?B?eXk5SU9YSFRpRHFGRTlqZ3pwYzY0MjZNM0l4R2dYWjVab0JqQUhUT24yMEFD?=
 =?utf-8?B?WDQ3UnU2U1BMVFZiYXQxYkQ4MXIycW1BaDZNREV3YUNEUVhLSU9sdHBQNnBS?=
 =?utf-8?B?b0ZsTTNGWVBwdTltT3hLSlR3c2FVRTRRdEdWMzB5MUhDcms0RmZ2bjZQSmFn?=
 =?utf-8?B?dGhzSGYyL3gvQzNUZ1llVXFjN2pZRVdSUWgySzBGRTQxT29oM0RqYzJsZGZx?=
 =?utf-8?B?SklwdzdFSm1VQXl1ZkRKbXlZV2FnQnU5akxFb2lodWxzV0ZGcURrWjJ1WVI2?=
 =?utf-8?B?OFBPSGVXdUxuUm5zTTg3NjlESmFGbE1aOFJxcFBlVEo2UDRKRkIwczNieUtO?=
 =?utf-8?B?aFA2eEZwakxNN21QclppUjVpNHpxYmRhRHdudk5xbU55cndsYzhFOGFxMnk1?=
 =?utf-8?B?R2JOemhiQmZJL2lPbUJDaGZHaG1SbzJlYk5GYWlQVWp6bUovUTJGSUdyWDk5?=
 =?utf-8?B?alJIQjhMWGd2bGtscVkyYWdlOC9VUFN6b2FjN3dyVXZhdXlCTnQyRkJEQXRM?=
 =?utf-8?B?ZmcwN2FLaHN4RFRmSU1oVml1cFZNeWExWVlVMno4R3diWm81TW9xbUxQQ1hp?=
 =?utf-8?B?L25BR2h5UXk3dEo5cDhOa1VvWkwwTlRUdUY5QjVhYWI1blZxMTR4d1BMbWZh?=
 =?utf-8?B?ejFERzV0TTNpRXJnek1mbFRFYjZYVUVlVUt3M3FDZHNyOTBTUjBnNFRZS25C?=
 =?utf-8?B?bHJZMnFsRjk3dy9ZUFlKK1NvYkJUWW1JendyWmtTWFhLMXU5K0FOSDc1Y3g4?=
 =?utf-8?B?VW5tZXdhYWZQR0NETzk5RktJc3krOUxXbUNwdThOWXZ3bVJTV2pUaEVNMHlG?=
 =?utf-8?B?N1ZIZms5aGNBMVYvQVc3YldEb2RjMFhVdE1lLzBzbkZ2dlpHcjh3MktWTi9p?=
 =?utf-8?B?amhUZVdRc2lTc1RkSVp5YUJjdnBqd01rSEFGdW9NdmFXWDhWZk9UZ3YrVVZS?=
 =?utf-8?B?eGFmSUZzWU9XNEdhY0ZYOWVhUkdPVngxcUVOWlVvT3NLbU5wZ0VBZko2RSsw?=
 =?utf-8?B?ZXYycHlXWXdPTG5mYkx6QlNseVBxUjk4eWVLM3lNSE0vYWRhMzIzWGlUY2gz?=
 =?utf-8?B?YWhXbDFsZVpYUlhvQit6b3phaUpjT2Z2MUlsaUlTQVdFdURkZjJ1WFZqVjZr?=
 =?utf-8?Q?68TUJXhppQXqdw03WdlId5SW7+v3jY=3D?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:20:54.0971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0935a15a-21e4-4599-d0e6-08ddba5e5a32
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF69404777D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_112103_512937_12455627 
X-CRM114-Status: UNSURE (   9.81  )
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

Add device tree binding schema for Axiado platforms, specifically the
AX3000 SoC and its associated evaluation board. This binding will be
used for the board-level DTS files that support the AX3000 platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/arm/axiado.yaml | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axiado.yaml b/Documentation/devicetree/bindings/arm/axiado.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bfabe7b32e65fb06d1f4faecfad032219f95dfca
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axiado.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/axiado.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado Platforms
+
+maintainers:
+  - Harshit Shah <hshah@axiado.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: AX3000 based boards
+        items:
+          - enum:
+              - axiado,ax3000-evk       # Axiado AX3000 Evaluation Board
+          - const: axiado,ax3000       # Axiado AX3000 SoC
+
+additionalProperties: true

-- 
2.25.1



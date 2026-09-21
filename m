Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA44C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ARzz8pEFoeU6WjhuQZreAOHdzZ6w+BMlo/VtQwJwwc=; b=VuMdijV3g/s9mmbc0L3jeqTX0L
	fDtglzunEpnoCrkoaPwH44BIOkFHiy1HU61GW9VA3cuO3b2Uu97sIzlkz5Sdjk54fiWfAlxa6mSu5
	AFzM0hS7BAgCfk7qE/9ZmxED5H/Ece7jxi0b/iqTQ9PTz0OoKHs2s9GhcFRtmR0PYNB6RVWD5iLQ4
	meEHjzpdnuqbz50lEuvKqNeUi14lT6Hzv+FpaY6ZaYkicQmtPoJBQFAyp+mbHHhzbjXnKd1gInkux
	+26xYClqKt078b17Q7ck+wlNV9GUJ2/L72FXlLvPnGkq7Avv8IBOfeIAF/fclN8MKOlDTPyuW0PpO
	zUSO5mXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YLc-00000001BkD-2rYH;
	Mon, 21 Sep 2026 07:21:56 +0000
Received: from mail-westcentralusazon11023088.outbound.protection.outlook.com ([40.93.201.88] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YLK-00000001BeY-42tn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 07:21:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXdceV4UddJwvpmwa5PZ0Y5EG8O/hOEXe08cmJ1lydiJyLv1+FCBwkaDaDBmfh6bvjjNQi4pC78EtkCWNUbpcHsCTz3fWivIEW/XLA7gKxACMHKaIwLHKWuurmrkSidDUiXoGX1k7cga5A7HuBRPbCpW+mUDcpNvVkKXQHAsJpvj5OsxiWhHjCU3HW6ApTnLubTa4U7W+Yf/C3C9uHBLQkY8Tufhy5CSqgi7tVLlTqc2VKAkM7i4aZ11uFRxz33YNiCrjsQBU8Ce+2kmAhJ5PcamgQA12+mVdNiz3NyP0p6RxBkOpz66PKzQKsZS+nu9S7o5drJahfbYrjqRKMKS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ARzz8pEFoeU6WjhuQZreAOHdzZ6w+BMlo/VtQwJwwc=;
 b=UHOcIuv4eA+MUxIXy8soAfo73yhioPzkmb0a6ekIKKlZlEmH5/DfhgM0OLRKcE+Bu4VxDR+0guZow0vlDMEvoC+qGS6PQRLaytKlX8O3MhlkLb9c2Uzq4LmWSD0EyKsiv0XT4bQXjNq6owvIyytnVcV6Hopc18ZNfZSviUMw0Neo9y/kEPnvdF0wQ+5KtTxgzjY73jO1zU9T4b/hOSQhlMWsSi/ndxxoO3GX8d/E7M2zQ1XZnivEC662UUtLPRhICKHle9UbNTHXiBm9OlRULOQNp4BUA0h+y9+R5TMY5ZDv8pPWEgTV6VYG6ivnCYLxkrKNk6f8WQVsCuea5vEiZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ARzz8pEFoeU6WjhuQZreAOHdzZ6w+BMlo/VtQwJwwc=;
 b=sptnIp0kcYJh+p5K3ASnHRtOQyKX3Cca/1noDEclBrY0XDCTYj5x0CKwfiiyS6Db6X+82VxMsvwM89v/H0jdmkP7GXlbwkOZwHqMXosRvLxGxDW4+14q2UCIAc5PszXZ++GmX96DU8EnSnvH02ZV18dnlOcabPUs+BnK1eXFp+0XX9ZdO1MvHMctInZCWTB66kgkA5NZlNX0tJdsxesrlYJgEnF7FvEOC87z7TbmY2knRPx/JZFYlDLP+RmQ9iTYXolVgSHWe5MqyFzQlZPynU9g91zLHZW7uwczOp6Ut6bN2LAXVchfDYemK01Ml6BWdfxAlG4V9uH6Ox8IpsqYrg==
Received: from BN9P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::18)
 by IA5PR18MB988773.namprd18.prod.outlook.com (2603:10b6:208:60b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 07:21:33 +0000
Received: from BN3PEPF00022BBC.namprd04.prod.outlook.com
 (2603:10b6:408:10a:cafe::92) by BN9P221CA0016.outlook.office365.com
 (2603:10b6:408:10a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Mon,
 21 Sep 2026 07:21:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN3PEPF00022BBC.mail.protection.outlook.com (10.167.248.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 07:21:32 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id E82664186B5D;
	Mon, 21 Sep 2026 00:21:31 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Mon, 21 Sep 2026 00:21:30 -0700
Subject: [PATCH v5 1/2] dt-bindings: pwm: add Axiado AX3000 PWM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-axiado-ax3000-pwm-v5-1-202aad28e129@axiado.com>
References: <20260921-axiado-ax3000-pwm-v5-0-202aad28e129@axiado.com>
In-Reply-To: <20260921-axiado-ax3000-pwm-v5-0-202aad28e129@axiado.com>
To: Akhila Kavi <akavi@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Petar Stepanovic <pstepanovic@axiado.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789975291; l=2448;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=uLwAdoeR3LJbJu0rTNuSOxUOdb84CUaaXpXz/dNsCiM=;
 b=fcds+4lHJJSBYJy4LOY3teG3rapWZsAc+t8n4HNGBIF7UN8dqDcaFdzeZ3UT+vB/3AROrcuTx
 SLEgk7hf5u1A8VuOFitfv+c1e5H3Iqug1ZUWIG35kI+G7pwnEm/SVrn
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBC:EE_|IA5PR18MB988773:EE_
X-MS-Office365-Filtering-Correlation-Id: c053d337-eaa0-4663-9219-08df17b0f694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|13003099007|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: M4Z/9bSXahp36HMky4Quo3UEAR4vt6dCw9gnJ4ArZDP4KoRwubiQYR1hAm5GCBzgnWErAWprxtGOX9cZa2h5KmuBXNDwKTDLuB3483BXjzcEaZ5VNLKB4Tzqs9hYHWcqusW0tIDS5JKKLaxDE4AYPcDLn5ENqAmaft5uXk/Inqnyfr+5IqEYMhJiX7vpOr5fa3Mmjz0vbB2LcT9CKOGHhPIOM3wFHSf7c2Ydlc4IQYzmZ+0M73hPXDsme9EPBBbQKP8y4xSvv8wddkVG+xoSO/pJbap+BUA4kjt5ONb/kHdSoVLcLszB4YhxX1TZ3+NIMk65vdf+CyuF3p1SF1hbvMU5iJYUxxY883KLXibdfa/A/lyKTczwCiSQHDbjdNAfV3TCpCMs5W873e1tWHcNZF7EMFEOSe/L8LxnGvmyAJrlfdad7hym/jCcrjdWtIrIz5mF11/ePTpuCGtLJmZe0MrSzcNx7v0VQvu1GoWZk3hbZcOEZSeDhTIFwBmIn5sEqsIbHXAHZcVf4SktP2a3/5txQt/pSksU4Qi8N1tO3BDwxvVzWgcTihP+RlW79rexfYa+HAX6S87hnAz15L9qZC6D8fE+/APCA5w/C06mK/boZVWvl4Vtu89Qj476LvQ6CXVCNeYIGGUV7/Ez6ul9BQ==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(13003099007)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qu6Ct0tyvSgMkREXnO+XUtQnWDHt1r7LPe69Spf94OeLFJlPqkOwv7yEuiQ4HQsfcs9bicj1GjoskhKaoq4cOtS9i9DvwWnJ0UqtmNSkxgwFJy2BsHs4chkSZPp+LtTrn8IqdR7E9Vt59MQ9xFjb4bU5tChYwPtVVG+/ddUFHC6zjGoKzstdhj85ZGvHmDpbgMxUnqRnyil0HDz0tYSi+Lx3ccQoUxOEs9Anl8BLXSszp68MW6jSQjTRDl1vMciDmOA0UE8Pk+cR8SoFpvEEcESVfHf290xqru86TEzBD8jMbMU2Ex2qZkkveehygT3DLfLm1zr+vs5HjBXNPXt/PafHE+8Qb8ZhsBJvaTINvkrDqfRSesTXXlfL6xLocVpiSPUyhvwKUlQe/e9wcDcx7Ig+CXIwcwMCq9CNmrVo6iuDYFRQsWu82hQ3BK6RYQa6
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 07:21:32.6837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c053d337-eaa0-4663-9219-08df17b0f694
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR18MB988773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_002139_043181_CE6F26F3 
X-CRM114-Status: GOOD (  13.10  )
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

The Axiado AX3000 and AX3005 SoCs include PWM controllers that can be
used to generate configurable PWM output signals.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 .../devicetree/bindings/pwm/axiado,ax3000-pwm.yaml | 53 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++++
 2 files changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml b/Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml
new file mode 100644
index 000000000000..3b73b233da86
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/axiado,ax3000-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 PWM controller
+
+maintainers:
+  - Petar Stepanovic <pstepanovic@axiado.com>
+  - Akhila Kavi <akavi@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description:
+  The Axiado PWM controller found on the AX3000 and AX3005 SoCs.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: axiado,ax3000-pwm
+      - items:
+          - const: axiado,ax3005-pwm
+          - const: axiado,ax3000-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#pwm-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm@80801c00 {
+      compatible = "axiado,ax3000-pwm";
+      reg = <0x80801c00 0x1000>;
+      #pwm-cells = <2>;
+      clocks = <&clk>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index b2040011a386..9999480376cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4312,6 +4312,14 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXIADO AX3000 PWM DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	Akhila Kavi <akavi@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-pwm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml
+
 AXIS ARTPEC ARM64 SoC SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
 M:	Lars Persson <lars.persson@axis.com>

-- 
2.34.1



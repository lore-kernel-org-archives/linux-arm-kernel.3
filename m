Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21450F9D0D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smRf72d9WumPdiT/XIWzf73qFT/7KntAUpwF2ddiLUs=; b=U1e1mJykJg1YJUp7FebwNnOguO
	bPmmQZzM7jTfnPhcF5NN2uvuTfVMvLV+Yjd1teNJeRcQCiYRhXyssbKtBKukEs/wHBFuGEEbAfdZf
	r08qPW3CdJf/9sp7uuvTAIKVExXpei0D4ETqeoFJFlAZLaAmBLHgXbm5+0oBA9k0yFvxvNZBypF4Y
	schPjh9zo7BKRl5tYOSMqIAUZKOiEBRjbx+BgAG7WoKk3BJc1Dxe5hDDqQWO4tfWzCY/1hmD+BKu3
	ZZb9nG86xxHJynXgAOlJjbGkyoPBrhcVRETIhTvEfRxfAZpSkQXepg46jDTi5tALNGbe6shuoOxco
	3ewZpwXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCe8Z-0000000HOyW-1v3i;
	Tue, 14 Apr 2026 13:49:07 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCe8U-0000000HOvQ-0RNR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:49:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulk5FvUVX0YLYXtffStD2o4SSgJtuIaKm0mRTfRCIqgBp7A88iYVIRlncgtoYeoR3SZXRk3c1y1XlAsVRwniv+CuLSdRdO3hWLE/PQiGGHbY7BvY3qRT32MW+CDIVGaurjR35DZsZcrQLscvplrMjMwsp6y513mj5vllbpe40dEE6NJeXUGjgrjH7o45RJmN4MSm9f+Fm6u9GIvDUyB+6wKasxuqEa9UrC+mXcUgXPYrYu4I5VDR84gEpjzSulxCa+JHiOspeKzcFyol0WgdrrutKFY5S09xEFvfAMNiKZjSq1ktoXyqpaPvvNpIq8aFC8wbJvtIdLMA+lUcf3yFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smRf72d9WumPdiT/XIWzf73qFT/7KntAUpwF2ddiLUs=;
 b=NHotaoZy7fyJibFW8KemMVgGXXf68EOnzJvTzMTqBvXm1SZU5L9wNfBkQeyaM121DZ5xZIjYClSg9DkDINokKOaOSIhrLRPJ9r/IcIREVoL7zFXtmBv92liQM5QDiTYA4YXMerda2N18xFuyvdbhtkKrRzbCbqLbBLCjG49lHGWdChbPAaW7eEuFB88EBImFs49RR1zgum7LXqZPae7tL72Ey5w0r3I+wx+Bl5yBhvwYyyMQW6N3jYBOCEG76lcpSL/qVD5xsu/p0Q9N6i3lVf2v6GTKlyVaTl55rXhxVGZSgwA/b5Q7UfkWjOJg9MeUdVdb4WDVmIDILDyjQuBytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smRf72d9WumPdiT/XIWzf73qFT/7KntAUpwF2ddiLUs=;
 b=pl6kX1PAnFalfG0DeTS4c0gm/dQVfotVwllqpVUEIr8Y0R/XJLy+ohMvn6kYne0g9zgyrqp/bvu7UWsXIdFCHgE0TOs4/mcc+H/klLFI3+HimYfTdw+H3n2TR5EHj1RnR5TN/EUIz2H9mJK/eKO28z2cBA0XC8S5Uy45ewjdcYnaSIQNgO5ZUw9lUhYgVlDHieYvjkEi+3Wi1zSvxOeKloCL0Pxlgco7JzJtijEqSk3tfoZlV+vxrfykrh4To6t0WcjLHa741cM7NaXk/0c49REZ5R6mNTFJKfpsGNkZCjyBa4N4dOrTlMD08ZelZ8Pfok7kx/5Cyjwq/Xs4954GIA==
Received: from SN7PR18CA0004.namprd18.prod.outlook.com (2603:10b6:806:f3::13)
 by SJ0PR18MB3898.namprd18.prod.outlook.com (2603:10b6:a03:2e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 13:48:53 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:f3:cafe::f1) by SN7PR18CA0004.outlook.office365.com
 (2603:10b6:806:f3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Tue,
 14 Apr 2026 13:48:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Tue, 14 Apr 2026 13:48:53 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 638474186B59;
	Tue, 14 Apr 2026 06:48:51 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Tue, 14 Apr 2026 06:48:32 -0700
Subject: [PATCH 1/3] dt-bindings: gpio: add Axiado SGPIO controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
In-Reply-To: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 SriNavmani A <srinavmani@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776174532; l=3398;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=H/7tphw1p5GZxdnGAdY7vnJ7mxwpU3ssqyp1QKW7D6E=;
 b=NkDfTTRAq0DF26cvYyFWrZQdoPAnIjCcmzZLMkDSC/quUivjWhiYwxa/TRR1naPdR7ITrXISl
 C1kUWdw7dFbAYSfLEfQj8tpjt2/KQ1DICEtgPrPIHjJdQhEVvP7/Z36
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|SJ0PR18MB3898:EE_
X-MS-Office365-Filtering-Correlation-Id: 18087240-ab17-4232-b63b-08de9a2c90e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|30052699003|1800799024|36860700016|376014|921020|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: EwkqRO38EN5spTKJO8qOVxx8HpBxSiO+lhPF/Am6C5KJc6sinQCMWGsu9FZ3w0m2pqpOWEXHr0qZkTSYd8fJJoF/JSUCRlZB6gZV6UjvdRVxo99ubQD9ub6wJsg607huGjl8TE5wiVxVkFfuRP1+Q4VSLj3CnSnCwosxBstk9UwwJz968OHhePtCC9pUUA1kfM8P7Kyv/fug83lu2zK9vI12/34zxOXOMgTLz8rGMh3quaClYc3SD5zpY42/xWUu38qiJ6tijM7IW9KNE8sslSOWKwkQPCRVth+rlN7o5icvrxsNvXnA6JOVKYKVnw1nSSB0RYxJlK1rkXqm2Dt57oqtm+UPKLf8fqsaZNdaRcPlBbRF/i+MOyKmh5zktVUU5ULgX9D8i68F7de0ugvxdOwiVeyZieS/acrINxtoL49SIZWIxRZfQ3ZP7w5QIm/XZaH8Qg4bjhgCq6vUUHFkh6pMArFYwbGEo3o5CHD22ATCT8AAu8GilSpdlQB+tdMaGkNTpHzTAIi0HDRdsAdD1VbCN6YaqfWxleYbWSiJ4EOVOic379PpM9KZGlJFeL3EEAwwVvfCE8DjMNkrcY1Y94uokTZfEfV1uXNUQvsMvMnGF6DrA0ZPLaW9XJCXS0dDZfpe0NP4SzhH5zY9LBPhsbolnR8tiMRH4O8VtRZrJ+XPfFZxPgSPAUYIt2O/XUX8eYz6BTQejp/TSh+mETZIQqxaUzvsryBdj3aKP9hT1kh37VDgPaHmsD4AKh399xSnTaTBU+noOokwq8VRN4MIQA==
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(30052699003)(1800799024)(36860700016)(376014)(921020)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dm1s41BSMtgKWw7XOO5/hLg4wKRhszh631SBZKV3yI0YBGM6qr5vP3PuMXBkpP23hV+H1zN4K9y+8JjKQHnPqpxkICxonRMSdLrMjXVvf3T3oG1meFozoYSRREfGeRYraHBjQw4WN2kCpzXeaL7JfOoIaDFvp8oAP1mHHgTNX0r0D1tFK+eGNR124cnp8v5ql60y+U/81rRi086jw2TRa6+RUUvHVTVIiIJca/jp+f70KjtWrzOp/mTF/gXLKhoum5DfxK29BRnh0kD53IcIbTmYM1gEp6NnPwILk2izj0L0dlnqBzbFzg+L3wcWtF7eoytVp5biRlb9OC2K4acuN4LdJ4PXltZYMNROTiT6J8EEMtduGjp5riPmAd/Dw8TX7kRbFbTdiJ6FGF9OxhLhfubFgJ5bnAPPMZV4EqkbiE3pIF6Tc2I4yTfbET8i+XmB
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 13:48:53.2390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18087240-ab17-4232-b63b-08de9a2c90e9
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB3898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_064902_159082_32188472 
X-CRM114-Status: GOOD (  10.72  )
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

Add device tree binding for the Axiado SGPIO controller.

The SGPIO controller provides a serialized interface for
controlling multiple GPIO signals over a limited number of
physical lines. It supports configurable data direction and
interrupt handling.

The binding describes the properties required to instantiate
the controller and register it as a GPIO provider.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 .../devicetree/bindings/gpio/axiado,sgpio.yaml     | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml b/Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml
new file mode 100644
index 000000000000..1533446d69f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/axiado,sgpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado SGPIO Controller
+
+maintainers:
+  - Petar Stepanovic <pstepanovic@axiado.com>
+  - SriNavmani A <srinavmani@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description: |
+  The SGPIO controller provides a serialized interface for controlling
+  multiple GPIO signals over a limited number of physical lines.
+  It supports configurable data direction and interrupt handling.
+
+properties:
+  compatible:
+    enum:
+      - axiado,sgpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  design-variant:
+    description: SGPIO design variant size in bits (e.g. 128 or 512).
+    enum: [128, 512]
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  ngpios:
+    description: The number of gpios this controller has.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  bus-frequency:
+    description: The SGPIO shift clock frequency in Hz.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  apb-frequency:
+    description: The APB bus frequency in Hz.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  dout-init:
+    description: Initial values for the dout registers.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - design-variant
+  - ngpios
+  - bus-frequency
+  - apb-frequency
+  - dout-init
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    sgpio@a000 {
+            compatible = "axiado,sgpio";
+            reg = <0xa000 0x800>;
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            interrupt-parent = <&gpio6>;
+            interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+            design-variant = <128>;
+            ngpios = <128>;
+            bus-frequency = <1000000>;
+            apb-frequency = <100000000>;
+            dout-init = <0x00300000 0x00006371 0x00003800 0x00000000>;
+    };

-- 
2.34.1



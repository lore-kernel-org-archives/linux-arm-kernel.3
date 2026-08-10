Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C72C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+52g/0eepX9Ma7LUQ65DCe5CMz6aX+KN5W9QaXaWHo=; b=0+HMcdYRfMghXG20zbAJLtZUBN
	T4mzSKO7G1lU4zzW8WNTxqm2ZWQsz11UzHgvOrGo8kQN7vd8ifVNjw7hRp5rsWYdNzvfgrISbdSqk
	2p0n5XmA79n62pfXWwwrb5waRo+AYkG2cg5c3aDakxfN2Gb1NYRIa1WSVFGdJnsxPpVXz3H0tf4bG
	d0MXn8Y9/IqKlIcTyea0XSb/gcGr1j+KzBrzW1Ttx12JjF5rUFdIWPDOxYZYl96L0nAJUnxCuToL7
	kSCI6q4x/+wmApJjYDCYR7/5Z9D7WLyzqibGjKBhjAVI7pd+41/4DcbvqAgWQlZck535DS2aYRdWS
	gWgfZDZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRK7-0000000C5My-3ZRN;
	Mon, 10 Aug 2026 14:49:55 +0000
Received: from mail-northcentralusazon11020132.outbound.protection.outlook.com ([52.101.193.132] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRK5-0000000C5L3-0Xwo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:49:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgy3UkWhMUN/nf1LLiZ6sUavwsI7jdSfz4woSkTiGAXxNOg144Vw/PJw3DSzm+dxhGmbMZsBNDeB9/e1tkYGEIo5mbNc2MNIxYueq9wMgBVbft4KMQVJfEeCm4HSBnHCHN/PeKrPCD1yoP9B+OakHRJvdhwKiFiFzKr23wh2sWIKtHactpL5EtDBPrmlgEnkbGJ79qwWdJXed4e4yAMUhRO4S0N3VFRzPajg6KliS4LqT9SYxqk6S7fE/qtoDWOE1TRb4NbvEahhHhhVKsRM6nnIo6rlFKE7zITRZ+RlzjgABIQHaEa5X2ZzaMv4dQ/yA98WN4/If9lv1fDdwN6agQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+52g/0eepX9Ma7LUQ65DCe5CMz6aX+KN5W9QaXaWHo=;
 b=xW0waCfmkdTmSOsQFiqU/VC70yFvx1C90dSsvr3v46j4LrLrkel9L+epf/F1CUD8KQP4WOWRrA3YyZnLIIRv7XWudjxA8bUQ7yoYX7ChB1g4ucJ7w8XivrxZZOxuHRyHkTxHLRS1qBnoG3OUTlz8EN/RnoyCVv6bozZwmoqR8XLXaKd6rbOHqEl+ahFDSugieK2neu5qEXtBoW5feytsj9JW2L+lgj4CzWJOOBsnd3PthA6x56xj+xJ5xf8TlYT4wzZkfdV63WKEchRNPLoRes3OqkQnpPR4muM09ddmenjlTtLW59INU4KglmidrNgv27zQzmlXD0LAMC2MO+efSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=analog.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+52g/0eepX9Ma7LUQ65DCe5CMz6aX+KN5W9QaXaWHo=;
 b=YEGYY2nQjp27voWHX6Xvg82UFP/aILbYpy/eEqRn/HNKHAxKjMhigaIKwa1oBs9vo+YT7/6/iHwZjXUhaIC8pSWhoQKu5r439/F9nCyxCyqQWPLIq0UKr9AHLNkxEb8NrBnyzi/C5zaoO6tOCyRfPSXOWXZLfFHvAP3yvGmf1r8Toiv8Cw8KmzMOaDpzvIsdJU0S4veIxEXFFVK6/WeXs7yxuYLbay3QAiLwQhCfIO2xW9+y2wahgVsltAgnjG0EJLBvudlKP8v6CNVq3AwUccGcmuROJ400JDlWTW4PbgX6Nh0okNweK/RLs78CCmYg0dIR8P/n6IpqkP7fb2nRFg==
Received: from BN9PR03CA0675.namprd03.prod.outlook.com (2603:10b6:408:10e::20)
 by SA1PR18MB4664.namprd18.prod.outlook.com (2603:10b6:806:1d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 14:49:46 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:10e:cafe::45) by BN9PR03CA0675.outlook.office365.com
 (2603:10b6:408:10e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 14:49:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 14:49:45 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 881B94186B58;
	Mon, 10 Aug 2026 07:49:44 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Mon, 10 Aug 2026 07:49:35 -0700
Subject: [PATCH v5 1/2] dt-bindings: iio: adc: add Axiado AX3000/AX3005
 SARADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-axiado-ax3000-ax3005-saradc-v5-1-bb0df3ecedaa@axiado.com>
References: <20260810-axiado-ax3000-ax3005-saradc-v5-0-bb0df3ecedaa@axiado.com>
In-Reply-To: <20260810-axiado-ax3000-ax3005-saradc-v5-0-bb0df3ecedaa@axiado.com>
To: Akhila Kavi <akavi@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Petar Stepanovic <pstepanovic@axiado.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786373384; l=2961;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=vkAKsJ2m95gzrXwsGVTAt+RuWciSLhwK1Ha1FjbN7G8=;
 b=A355fHdkVtNheom+pCLmJxAyxnfkgMhuIz3O0kK12WT+fJC0mLsW9pQw/T+Fw0Z8KSDz/F1ZM
 YvK67o3Hwg2BVXW8rAbIeSwpEZ7ZwE77b9tiahF0iblKxWdpKz96NZi
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|SA1PR18MB4664:EE_
X-MS-Office365-Filtering-Correlation-Id: 340ad07e-6f36-4341-5034-08def6ee9e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|7416014|56012099006|10067099003|3023799007|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: YZXiqle1Ghr/Vfz/kdONTQE4pM+31scO/4ybYc4llaLSF9usdn4u2qrf7XFIy2/+62+c7/+Pu6Aojl8MQ8MWnyQaQa+pnKyk/e05eYnoINTf4S7y3abdvA3a8+D3Snx/2atiDogb8FUfetaapnBAQxmY2egHMpJlQ0xqZd50ejqSUVTWfJPEhXNzUq5aH11k8vu6Rf3X2OtmELLleVs3k4yLChTp4PvFwr0xThJarEmNpVCHYX6psXZkiUgFOV8nmobX99fdw9EkpsrwX3u38vETj08VVEBgNHG3pYZHOOHuDe/hUQM7dcsRUZ00bKTRRI9No/kOOMe2TJrizik/9kyAEed5ATx2fPkX0GjZDQUrXrTXB7loQd90G77+jsKWqvgLAcdTlmOsNO/0mjwTiOP+lmR5Gc8yhQXw4J8I5ercZtH/202n/vg9OBgbXy1CPSfj8cHDW7bu60KoGqskW1QCckAYvjyw7RUq2rW7Z3WGblOPsS0JMQCkGmEY3TssjNSHC4tuUGabW8H2CPVYbh5481ouZcqLGWlDyLIiHqmjcJlx8T0POs7/UCvCYiNQCW5ymmtP/U45M+7AOesno9sK8aY28vZMsEOc7mxiQLwCDstkn/o2uqZzSlwUcz+DRC3RvtqSlyU8YouOYSP2jfKixriABQ4iW7RDmghaQ8SwPMzLrI4Iak/ccMDpn3RdD+gyptU9G4qaInPMTBkn5ROFGuFS85Q8itXHe5lWTMAWqx+YSBN4+R0SXLU9PYr6
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(7416014)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EpqL8isUcAoyQWLn44N8R2oVT/NMe7KK9xS9l9eWTApK7B3ejoIeOW68lI88Sgd8RV007ICJiLUnGrrSTxNJlklBLXAQ6DMor6cfGZki0J7GXXf2CTCwKaSwYUmMzWKF4qyuSr1+xVEumvwmWt0fm0Emq4zR5MxbyRjioeo7WuT4oEathHaXLYxQfbFiSc8RvNQTsVy77vSdJQor9Z6+w4nXXtzFTT3BU0pOTvFsiKNHeQr/JvdY1r5Bs/2qKJSbYo51cWebs2qIUbkiUeqHoTUJGXWhNShuAvRl5q67BWYHN99k08UYpkjcm2t8MS/+m1UU+Ny/5PWBbsiyvngeeFFNeY3jWLqcDydyytOy6kGB/JbfknTTXoT9xPBZ+xRmLYwHb51WLM2/jvr+dROSF46HffgH3DcicKJvYbwkJcLuRR62qcWG0qqGboL2ySNa
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 14:49:45.2649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 340ad07e-6f36-4341-5034-08def6ee9e76
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB4664
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074953_218206_79646AD0 
X-CRM114-Status: GOOD (  12.59  )
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

The Axiado AX3000 and AX3005 SoCs include a 10-bit SAR ADC controller.
AX3000 supports 16 input channels, while AX3005 supports 8 input
channels.

Document the compatible strings, register region, clock, reference
voltage supply, and IIO channel cells.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/iio/adc/axiado,ax3000-saradc.yaml     | 63 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 +++
 2 files changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml
new file mode 100644
index 000000000000..b910852aa56f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/axiado,ax3000-saradc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000/AX3005 Successive Approximation Register ADC
+
+description:
+  The Axiado AX3000/AX3005 SAR ADC is a 10-bit ADC with sixteen input
+  channels on AX3000 and eight input channels on AX3005.
+
+maintainers:
+  - Petar Stepanovic <pstepanovic@axiado.com>
+  - Akhila Kavi <akavi@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+properties:
+  compatible:
+    enum:
+      - axiado,ax3000-saradc
+      - axiado,ax3005-saradc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: saradc
+
+  '#io-channel-cells':
+    const: 1
+
+  vref-supply:
+    description: Reference voltage regulator supplying the ADC
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#io-channel-cells'
+  - vref-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      adc@806a0000 {
+        compatible = "axiado,ax3000-saradc";
+        reg = <0x0 0x806a0000 0x0 0x400>;
+        clocks = <&pclk>;
+        clock-names = "saradc";
+        vref-supply = <&vref_reg>;
+        #io-channel-cells = <1>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b2040011a386..d6f4febfe4fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4312,6 +4312,14 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXIADO SARADC DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	Akhila Kavi <akavi@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml
+
 AXIS ARTPEC ARM64 SoC SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
 M:	Lars Persson <lars.persson@axis.com>

-- 
2.34.1



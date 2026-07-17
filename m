Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB88DC4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 05:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+52g/0eepX9Ma7LUQ65DCe5CMz6aX+KN5W9QaXaWHo=; b=lme/lS78w4x58gG5eUgjkslsnx
	BQ0jFF/+0e2di51tltfXs39vSYOw7Gw6TZGr5tSLGwrvAzsSECUQeyIX/y/vh5J16flCjySgODZgX
	4XjernQJBKj6vDpirN0Pbb1k10ep9r26zlEIxhQKcWwKF/hV7pOFXjg9XC4s3ZmD71LOlqnVS8/kv
	0eEeSE6M0sPJ4S9CowZiSgzhABTtf+YqwRXuWTly1yB+5ERYTLu7uK87Kq04w5twjhp+oGko7yYZN
	OnO5FmRR7Bc6h3bqhjuwSVRFo/S4dILvsQhWaTJYSS+GxL0dpriSlZmulHBpvJOMo1vl4yth2rBUu
	p5g1tAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbVb-00000001CfA-1sjO;
	Fri, 17 Jul 2026 05:53:15 +0000
Received: from mail-westcentralusazon11023072.outbound.protection.outlook.com ([40.93.201.72] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbVY-00000001CeR-2Srg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 05:53:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ak5FW3mG6iLbZGjJa59wKKp+RKQ0QMiNYrDAqdE15S6VOrbyX+8Q88kTkvSNtoFWIKY5LatcW6ctMrWTjnNctDGeXixqNvTI3qN424yQ5QfeIsez52nvm+Gk/nwFh5MMWOkP5FRwJh3KiM8/BIZcSUokU/6Z9GOQ+s1TtxZASeAETpNh5eCwLgBGyE8PqOYA+Cna9S6YwcM9TakJx9r7LnXitrOTxmxsU0cwiPWAXDLEE+Imdovogk7eYBAfLodFDuqxv02vW4XWxkP3YguG0FtAgEoOXeCLssFu4MV4mGOC6ftbx+G53udT7AHeFcaf3Wx+8LfPXm9QFEbD0viJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+52g/0eepX9Ma7LUQ65DCe5CMz6aX+KN5W9QaXaWHo=;
 b=UeNxX81g/pzum8wpd7W69buHZ0jnxgpKoDChhI0uqkiVoxKs5bVwz+XYiTkwtVzWpw4YTWg34QK5a68XuQ/y9GUMRN48p3aK2ARy8mLAO393NbuxzO4FzcFBoj8anLvq9MyDzBGvfFbsg2wEefZ/J+WKo1/azz6fS/djBFaJTZ4XsFblIELuDGmBvc7O5dofxoh7VUOn+tXqkcLbd/UBIouGTLBnTBZ0zS5s6mBrV9LBBleTG1xLFZEMSn6CvIxBGFYjbLiJCk+MRbDO6xeo6o8KInZ/M5NmavZPEByBnKKzt9YnzfbszUfiY/F8KxY4ch71lh9GIfjoj+NUy+IAvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=analog.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+52g/0eepX9Ma7LUQ65DCe5CMz6aX+KN5W9QaXaWHo=;
 b=kSLLeylNvserR8Y1TV9YbdxNDU0OFAomJiTipU1kwN2Lx9l32jJgkPISjx01NiPK6a7x98ilVJ8wCnkFQTIJYuwm1ZSiZ6kyvpShuxQQgR8ipU6rcPoEWOcTPgk5w+qk/UGAWi2Z9DAHtm60GZBgDkEoab3jKMMnYZYp0wVMNlsUTu8NeTfE+XN+W4eR7y6zBKqSm5PjFecfxTsSD2XOwXJNtIN5iL0Ubeb4KSgHTnvngj6YV2PKr4Dwf1M4S6Fd5E8bCYZhZmr8nYa1bb00IQDxHwCoyGUwXe1O1/5MTHsvsyFPW8+/LXZdcEvyBtAWNmcFZH8k62B1C4qgRsbE0g==
Received: from MW4PR03CA0241.namprd03.prod.outlook.com (2603:10b6:303:b4::6)
 by DS4PR18MB927488.namprd18.prod.outlook.com (2603:10b6:8:318::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:53:05 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:303:b4:cafe::3d) by MW4PR03CA0241.outlook.office365.com
 (2603:10b6:303:b4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Fri,
 17 Jul 2026 05:53:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Fri, 17 Jul 2026 05:53:04 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 5ABDE4186B53;
	Thu, 16 Jul 2026 22:53:04 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Thu, 16 Jul 2026 22:53:01 -0700
Subject: [PATCH v4 1/2] dt-bindings: iio: adc: add Axiado AX3000/AX3005
 SARADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-axiado-ax3000-ax3005-saradc-v4-1-810527a9d27f@axiado.com>
References: <20260716-axiado-ax3000-ax3005-saradc-v4-0-810527a9d27f@axiado.com>
In-Reply-To: <20260716-axiado-ax3000-ax3005-saradc-v4-0-810527a9d27f@axiado.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784267584; l=2961;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=vkAKsJ2m95gzrXwsGVTAt+RuWciSLhwK1Ha1FjbN7G8=;
 b=8mAh1MiIGK0YlhlpRDxjVobgXeNJiKTbuX1WEfkubyvJdP7AjqRa8Y2POQ9TsbC1cJDH0IZWr
 o9st5EO3wjSDcuCou77kJ0cH9YOMTrAR5eCoi2gi09qMqxLlHKhSB45
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|DS4PR18MB927488:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd4ef61-12bc-4d64-8223-08dee3c7ab6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|23010399003|10067099003|56012099006|3023799007|18002099003|22082099003|13003099007|921020;
X-Microsoft-Antispam-Message-Info: K53to09h1hzp9razDUEoKViiQ9wOEctM6ha7jxSkETNFohQ0E3YPq6REkOBvzQNWH7RJY+7nakieLxnIH1sXPtgrzmrCzd8nVA7pUIvmwx32h/c/I8578URR93qDESMmFyhn2ipQtkVk6fqNx3qaqts1tTWUgFhliwhPjOV5nYi1bgzofe7ShKSv7thxsOe4Dy/Dft4bWrwJrgR8R/cUpjWT6gYNMgAmuO7W1UCSnEzYalpn47aFPhxUXqvXMc2rDJ4+LGTO/hxoPR0MmiQWs5Mj9sE9Pms7Ela2zX2e7oObKd9PUKIPFSLhbK0kuwUIA+JPSurh/tlvd3BbdLSZ/KoA+F6QM1d/qXBe5mcYo2SIl+VsGT4Fo5YRfUIO/ImzzAjluKk7O9SDuioo+8IqJ29zzBZe2oAhJGXSzLksrC+6TIJBlQGC+he1/5qMbcXv9pS6JZ/rnUlcn13do9XLe/cOD4rbZkiL1IeqjSExv+PvCpEPZUTDTySksEb1Ni+P0JTuYhFfSEjwKlTLXwOKOMqndlOOg+Q3sS0dJpWcFH2rzTukUfvPlJi6nJ5iS+3SIyz/A2DSjTXNkIpmavaNRKMtehgzC0BNM1MiCmfrkTHLDwdq11egP2ahHM0GijtYyFwBf/6HNrymN6R76QBbZE7a/uYig3Pg0W3ukTTiAaYWN07XC4PRb2sKwaGZKWGZ
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(23010399003)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(13003099007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ckJQ8SG/EU5ieuel+Ho9DtUQkSI9ApvJGzwmXNnJlqrP+AAksiYtJD4BZSPKnoHwVwar19J478Ehey+LO8MWs5aSfLJ+2xmOlTAJMxlqnwGSLG0dYCvTy7+1dh+wiJ/ni/IAWmNOYK044uApvYF6T7csZ+D1y6Q2DZNWUPHcaBO9o0RXPgWYwNrcQNoMetdp/yBIA9l2V6tN5q5B6bU0SkHscA7JpWNnrrA1Qr8WH7CkTzdylPuedy148hn02QAaaZTuKYZWuqc/j/QIcOiIfmPJC/cG/tZZjpW+oZxYrSxpHz0zoMaaeSVHjM9v+mhuz11PZF5Sb7Q4SlV3ComPcei/WjSvSQBEh/p7+WTs3o9la80sscaKc9IQRFEohBLHW+pQjAjiVwy6ZavUtazOMwnhkbnbbVBVsFazVfEQEV26eZ17xynRGNia4WnvmG6n
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:53:04.6746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd4ef61-12bc-4d64-8223-08dee3c7ab6c
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR18MB927488
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_225312_678792_3A450C10 
X-CRM114-Status: GOOD (  12.33  )
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



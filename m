Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C4AC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 04:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pJj2WPW5ZxW09Xh/QQ5F3xrCfhNtf9l+lmkdi/pLSE=; b=EGMXnTloXI2s1/NzWIBcZfaqgW
	GoMjOJcDjNhlfwnf6BszO6+SB+ZPiUc86FQ8ZCp7cUjkvqMy9RZq1P7CqIA9o/8DN6sRUIKX/RZRb
	dyWyYo7tUTiZ0x0iwTo42m8tSEYMh3L3aiZkyDxpVaUUwPcoyjQV+CEObawAdr9xnlPjkGj/qUpHc
	boAANuz+AeNeSTOSUDGE17rDKuQfKs3BnpderCIEY2XbBl7S+qIA9Lir4kvXJRx1CaKN2g7+jj23K
	4JowZtgj6buI+tRDhG4CMBMd2Ur6HzoiHeo9H//GZJAPyaNi4X0bUvzK2CyYk6o/A2mvIvT6mGQOh
	x3FT0F3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIWc-00000009Uc9-29Xo;
	Thu, 30 Jul 2026 04:37:42 +0000
Received: from mail-westcentralusazon11023077.outbound.protection.outlook.com ([40.93.201.77] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIWY-00000009Uam-1ar8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 04:37:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eM2j/SzdUqIq0gMDbu/DmQ/QgiBRFupsrTMFN5eDEn6FlFEJMXnODe9slg+qheL9k0VU5R2Kv3uJQeYMS+qT4Zf+mwLXYuyC7GlQJ2qUR+6EHLFIpBS3FBjmD+06X33JBEQp74mTEZOVtqHJWQym5Cy61jyl7FKaBGQu4jLFSThCpjD7uCIk3B4EFYA5DSOxz6a4143r45lPcbv74Kyi4Ot2c5WBj7RhslOU24Qn08/Ut4QaQhKAgjJ+xyE/Y6uQkuUKZCRve1MjB6+WLWW1EryTP2ckK5hZ9gxjaGUWJiDpw5upa1jfB07kNoI35XGE0J5fDThvvPlaWzd3OToYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pJj2WPW5ZxW09Xh/QQ5F3xrCfhNtf9l+lmkdi/pLSE=;
 b=jFep/hxBZmju6CuPl1xjMQh1ajQfYWpBv+AA5HlbudKJMH2G/8p0sEcm9PqBEyx4WYqQ44eoytBsVw5ISyY4Fl+cWOWjk+a1ixx+HxlchrY01V9Ke6yVAZzze6/vEpVszc4qYnB86ZZGBLqrYXbZmTYuhGuerLnk6qog3IEw8WZ1vNg+0psIUZQCAQJuV7/cEfUGHm1SmPc8B1WXJB0ojCiNclBpuEcojg2iONxmlClvW0m4vV4l235yAdoBZfhH0xFh3IkROIWWbJ83H0+qEdGMs+tMclRe7c31YOUO31rJmYdFC9Qx+9EFjJHj3ZYAtQ5HsCbNUG9ZuP/IXMJcfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pJj2WPW5ZxW09Xh/QQ5F3xrCfhNtf9l+lmkdi/pLSE=;
 b=pSFkPLl9u4L/XQwWD9SfwAi+EOZbyPc8t7TeVy088L6hf70zapNeH+vlsZm0Xt9zvMfZKphnZWrXd3+js3bhsSV6HNGzmysBOFDHaShj1caP8RBVr30jMq8mcgQQKOcxH61BIqzL6H2jaiijtNfVlQOQOipbuOJZ06mJ5Xxz2ULT2XHKDgVtshZUDHAahzErksDQSeiE89tKiMOUHVa6Jun0gDHqflgR9S+rSECdHxeeRM6YaQPhn+5zRqw32TXVlGlTAV28KSj2xfh7H5GdgqcHWbf4PhWpb11dLF+/PAoW7g6KXtk+JJCPpEuB3EajQobBBhJxLZH3ifdzZHQmgg==
Received: from BN9PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:fb::35)
 by SA1PR18MB4712.namprd18.prod.outlook.com (2603:10b6:806:1db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 04:37:24 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:fb:cafe::9e) by BN9PR03CA0060.outlook.office365.com
 (2603:10b6:408:fb::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Thu,
 30 Jul 2026 04:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.1
 via Frontend Transport; Thu, 30 Jul 2026 04:37:23 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 1961C4186B53;
	Wed, 29 Jul 2026 21:37:23 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Wed, 29 Jul 2026 21:36:50 -0700
Subject: [PATCH 1/2] dt-bindings: mailbox: add Axiado AX3005 mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260729-upstream-axiado-ax3005-mailbox-upstream-v1-1-8961b7350338@axiado.com>
References: <20260729-upstream-axiado-ax3005-mailbox-upstream-v1-0-8961b7350338@axiado.com>
In-Reply-To: <20260729-upstream-axiado-ax3005-mailbox-upstream-v1-0-8961b7350338@axiado.com>
To: Krishnakumar Kesavan <kkesavan@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4488; i=syang@axiado.com;
 h=from:subject:message-id; bh=miUf6MuomL/h3PtXzDabhBoWxYVv6oR4q0WFNl4dH20=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqysq0z7zXxjW/ms5mxRdLuaZPTn4O+m1stHN+jvzKhra
 tbsmszUUcrCIMbBICumyPJV51v+yVzte517V5bCzGFlAhnCwMUpABOZ9JOR4cV7/fUOMtK/H3+Z
 m59/vSrvkxWLncAzNd8mjsoj+1d6XmH4n8l659g3zn0bg5WUJnAfWCIjsUhuz6+72jV7P/Fk/kp
 KYgYA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|SA1PR18MB4712:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a690040-96bf-4c0e-93f2-08deedf44046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|13003099007|6133799003|3023799007|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: Px50ulF9U8ph9ud/fDj23dG7419/xDa3EMlPQOZoVmpvEUncm0mlcQW7i1wvB9AkVc3kT1pblr37sWVJih5bMDgfCPx9PyTgoqe2i0wcSBszaOgBELxs0GIM0sM+6lGMaBgRtQboCKE6znLDrYQrX8h74rgDnzaouPB3UnqJofKrOhVH182nSEI+rf/Ovau0+t1G3HcmLkgF5gLCdp91l8OVOk1OosM3kMNBy6wMzu5s7nLXbZMavnsFbb+HC5fZIHf+3DQ02PRyimdWMW1q8oL+T0aDXszcFRheMBSM7AjYOkhAedWUcv5uJMShe/d0gooCABlaEhsu6/PfJqYAG2ivITBFaSOdo+Vrn4KKxBZHWAYatUtP26dLo/Q/rJ1CwmLFSsYjg3vxA8mBSWgGRAOR7y3gBFhC2BHPjE7ZxZ6OTxPSRxiWbEsERPTlUuJzI44xzvXgrY9EBGYRNsGJNk4M2lBZyIuYemT4Z6mD5oqGWHyQpJumZAs2kn4GOlbzGpHxBsH82hy7UfDpjoBFomHtUkBABT18vFsHSLbz2XZ2hNAIEWVVuBDsYimR3k27zHo/qnheR01kLsLOto8lJ0POXp2yh1TpJYAba1mQOaglipOKSGhBcdly3gBltZkpmp+HH/BvLqBY3yRKGUkZAw==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(13003099007)(6133799003)(3023799007)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DeQyfOyd0aDD4iVfR+UwZzlNEwpG12W5PrugvM3zXCFYgFiNciiHvBh0Pau49qMSG+7gcRb1TTb+AW/8XyFQlJsPq+riEtyiKW07Hf5EfmWpBLnq5v0fRR89OK6xFcomR0+hgU/oxxI0AUDwoSBYJmcheB6/4KcvntyCxcfRTHs1kD5XepbRhscesABwIbYtlVY7JlZGNtCtZMTiCz6iZjfVMV5GS/Ze3pWhTlupO5IhxZFmHXrbxgIsEmrtxYtlDl7KL+G6EfXnLg/3jiYkyYJoi8C3Frx2wLtxH5YXbEAvS0auPixbv9qOj//hjtN52VwRrOysYH3OicvnIyBhrk1w/cxBgPTRzsiAho0RcNPPBHyF2xHShJDVOgQHtx34OLrhaSUxp5LCDDhVoAuDq27HaCcdyM5/qM+r92mKmzGZYbc0pwDugtv9Ms8RyI+D
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 04:37:23.7623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a690040-96bf-4c0e-93f2-08deedf44046
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB4712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_213739_085347_FCB4FD71 
X-CRM114-Status: GOOD (  14.30  )
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

Add a devicetree binding for the Axiado AX3005 mailbox controller.
The controller provides inter-processor communication channels
between the host CPU and the coprocessor, with separate TX and RX
register regions.

Add the corresponding MAINTAINERS entry covering the binding.

Signed-off-by: Swark Yang <syang@axiado.com>
---
 .../bindings/mailbox/axiado,ax3005-mailbox.yaml    | 98 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++
 2 files changed, 105 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/axiado,ax3005-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/axiado,ax3005-mailbox.yaml
new file mode 100644
index 000000000000..b4fab96356c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/axiado,ax3005-mailbox.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/axiado,ax3005-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3005 Mailbox Controller
+
+maintainers:
+  - Krishnakumar Kesavan <kkesavan@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+  - Swark Yang <syang@axiado.com>
+
+description: |
+  The Axiado mailbox controller provides inter-processor communication
+  channels between subsystems within the Axiado SoC. The hardware has
+  separate TX and RX register regions. Only the RX channels (channels 8-15)
+  generate interrupts; TX channels are purely poll/write-based.
+
+properties:
+  compatible:
+    const: axiado,ax3005-mailbox
+
+  reg:
+    items:
+      - description: TX mailbox register region
+      - description: RX mailbox register region
+
+  reg-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    description: |
+      One interrupt per RX channel. The hardware exposes eight RX interrupt
+      lines corresponding to channels 8 through 15.
+    minItems: 8
+    maxItems: 8
+
+  interrupt-names:
+    description: |
+      Named interrupt lines for each RX channel, from ch8 to ch15.
+    items:
+      - const: ch8
+      - const: ch9
+      - const: ch10
+      - const: ch11
+      - const: ch12
+      - const: ch13
+      - const: ch14
+      - const: ch15
+
+  "#mbox-cells":
+    description: |
+      Number of cells in a mailbox specifier. A single cell encodes the
+      channel index as seen by the client.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mailbox@330f2000 {
+            compatible = "axiado,ax3005-mailbox";
+            reg = <0x0 0x330f2000 0x0 0x2000>,
+                  <0x0 0x331b0000 0x0 0x1000>;
+            reg-names = "tx", "rx";
+            /* Only RX channels (8-15) have IRQs */
+            interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "ch8", "ch9", "ch10", "ch11",
+                              "ch12", "ch13", "ch14", "ch15";
+            interrupt-parent = <&gic500>;
+            #mbox-cells = <1>;
+            status = "okay";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a674e36529f7..af6c3571c9f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4437,6 +4437,13 @@ F:	Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
 F:	drivers/phy/axiado/Kconfig
 F:	drivers/phy/axiado/phy-axiado-emmc.c
 
+AXIADO MAILBOX DRIVER
+M:	Krishnakumar Kesavan <kkesavan@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+M:	Swark Yang <syang@axiado.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/mailbox/axiado,ax3005-mailbox.yaml
+
 AXI SPI ENGINE
 M:	Michael Hennerich <michael.hennerich@analog.com>
 M:	Nuno Sá <nuno.sa@analog.com>

-- 
2.34.1



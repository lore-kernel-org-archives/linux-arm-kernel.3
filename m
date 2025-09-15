Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD46ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7z9p6CVeemMGkwOQv2q/IqYKxbw5/w/2et+3MLqjUE=; b=go3bOulE9Uqf6/b8euuYcNbhR6
	FfnMNBKd3/ICn1B+SJpOh4bTM7xuePhmwOENjrWwc66EuA2V+iyvvri+91nH0gEkeFgQZSyWghK1h
	IadcVrl7i8sqBdf2+hbN9tbyEUL4KyjtkeafH+XFWrQETuj4vTxAtLrMMp7FWqfN3xmJLee15sknB
	I2U+PvZVbN1UDuPo7sgmij4QRymbgBKMZ7uAt9L0LXVBXzBHwfKa/M9+Msmryy7hfx0p5T+hQTAIX
	u9BrbAVTuMfWID1fM8ANr5uQtT9REwf/wMQX5fKu7R8Zc6tyH3MyQT0d12gaNJxllaXyiq+7Sd5JC
	mKqDz0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy90k-00000004Gey-3QGv;
	Mon, 15 Sep 2025 13:12:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy90j-00000004Ge5-2It8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 13:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=T7z9p6CVeemMGkwOQv2q/IqYKxbw5/w/2et+3MLqjUE=; b=CQPyIRpDnddUwUh4OIrhDbVMX2
	RXSGbhPgu+kfJojsf0Nlo8lmbxwibkpD+L6ocdJtCqNGym6F8iM05bfV1ZZ/gd5FN+QUrSw5N8/28
	RneYmiiZylfIYh0ULR+RjEPypSbFQT2544UQtZol/yk14iuonrTRqDGUXz3wL2Zgzq2IEDDUtJza+
	inIwUeeazieKjdHRWZrt8JERCNe2Job3Cjzbi/ey4c9BUAqxSHXKed4V2H4Bam2xqj4oTuC6QV1oe
	aWxG1bLDSmVXzXg5LjyCgsZJNXJQV8ZuwU1WGtPLeex6ho2d/ZGG+ZoCFPrL2EAan2b6uP8wbV/jc
	0pisomiw==;
Received: from mail-bn8nam11on20711.outbound.protection.outlook.com ([2a01:111:f403:2414::711] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy90f-000000070gC-3zdu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:12:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2R54a1LrL6TYMGYKhRMkt8AqWziEXWOSwLG1CFVgR3N4H7WqMNrECl7zLlrEC6shIRxuO3orG8Ua2IEjr0bkfNt06x6ZeQ07Cne6dHNbgdE3M4ldv3kys7Qyg9aqvIZWLF003cg/r5sYUQT3FGy6zmNn0XnUIew1nWe2G2fkNkz8F/taNYjb0irPyyXObH/Rrf/HRgA483ayaYm83AdC999FfbyH7ie67UbxU21PLjqtJcNo+bes9lV6xqRODEsr6JbTDc9jxiRz/t5oEwrHLDB8uMlaki0bQutqw94+j0wBuM98bqFn84495NGJAEVYurnhF5dJv7mXwWdTd9Pcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7z9p6CVeemMGkwOQv2q/IqYKxbw5/w/2et+3MLqjUE=;
 b=o6G/7OAgWS8RtOjnSUCoY6nqMRSJQrXLbYh+VuyGei3wy3shwsWOGp0D23Rb0sC1zAFeIDzbYIPgN07kZhhAmaHo74AQ3U2/0e/L98I7Bw7GOVS4ot4T4nyrRLcJD91Cq9rUUSwc18FWqaphzY4oXMXkNIsyO6ysCwJ90jmyh7AzAU6hm0YcIutLPQa/yDhRd2tZDfTyhrNqU0SyW3+D3BZv1NC2KuvoqpK8FJ+0xolyYv/3toRW05R5OTqyVChd/gGppxaMmIYDgOtSjddWWna67BIO9BAP/mXRJBFI5HRnJe4et9Qw8v5LI+eGJdKgpVvPgMkFwZgCU9eFC+/dsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7z9p6CVeemMGkwOQv2q/IqYKxbw5/w/2et+3MLqjUE=;
 b=mNYE/VCkMaDZbgNXFgAutrQlFguwrAC5nCYzn/56sQl7Pp9VLaOnUYAETeqeaNCpD1Yw4PktQ5Cc6ZFyr2pA3ydH8LOGP1GcO90lzqJlLTKY4seC4yK/m6af7LqnscujrRdAx6NzSqfNhGWLW2xCjKqeU3mh0Cq0um+L1llqzvXbGEg78tOlPjFIuIFkY/VNoHyu/7TR+6NI+dLA/rmNOmMXnp6w2GwIYZ+9itRLHSpwFIzExxefJ/jbhCSHiqMPZLFxKrPldfWlAnMxMIqTW0QU9lVbyyEDaEx3X6+T9OK5TSlja/Oj0bKBnU4TqXV/dDl2yvd2ndET3cuwFojAcg==
Received: from BN0PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:e7::35)
 by PH3PPF206F06927.namprd18.prod.outlook.com (2603:10b6:518:1::c8d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 13:12:36 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:408:e7:cafe::12) by BN0PR03CA0060.outlook.office365.com
 (2603:10b6:408:e7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Mon,
 15 Sep 2025 13:12:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=vm-swbuild15.axiadord;
Received: from vm-swbuild15.axiadord (50.233.182.194) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 15 Sep 2025 13:12:35 +0000
From: Vladimir Moravcevic <vmoravcevic@axiado.com>
Date: Mon, 15 Sep 2025 06:11:55 -0700
Subject: [PATCH 1/3] dt-bindings: spi: axiado,ax3000-spi: Add binding for
 Axiado SPI DB controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-axiado-ax3000-soc-spi-db-controller-driver-v1-1-814a1fa2a83e@axiado.com>
References: <20250915-axiado-ax3000-soc-spi-db-controller-driver-v1-0-814a1fa2a83e@axiado.com>
In-Reply-To: <20250915-axiado-ax3000-soc-spi-db-controller-driver-v1-0-814a1fa2a83e@axiado.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, 
 Axiado Reviewers <linux-maintainer@axiado.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir Moravcevic <vmoravcevic@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757941952; l=1916;
 i=vmoravcevic@axiado.com; s=20250904; h=from:subject:message-id;
 bh=b9mco7IGlIn1hSLPZSgDYySnDTz9LYMieo+XbBWapaw=;
 b=o/H3ThdLaWwmwWCQ7qOlBpVk1kkk54Xx3KSiWxZlQUYH5Tvm5hEtu7UfAAz1fE/pqadSbvt8g
 e6o9GEY6kb0APX10s8XhLyt6CZ+Pm2WOG3D2Iy+1aTZ9yuQWUk0BJh1
X-Developer-Key: i=vmoravcevic@axiado.com; a=ed25519;
 pk=iiyhWhM1F4HlCbbW3I3qKZhPCE8JsCrDQMgCBRg4YMA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|PH3PPF206F06927:EE_
X-MS-Office365-Filtering-Correlation-Id: b336a0c6-f8e5-48dd-d0ec-08ddf45989fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDRRc2kzR0E1Rk84dGNUK05DY1R3VEw5TTlXbllHTTNMbjJ1bkRFdWE2NnVP?=
 =?utf-8?B?VHI2Wm5ydHlpL2hQcEtNSEZ4SHFybVJ0c0JHSW52c01GajY3QmNzZFRrMjdC?=
 =?utf-8?B?Qm9IZUs2K0JHT1k0RDJGeVVTMkZONEp6SzZyM3ZkQlUzQm9keXA1b01iR1JT?=
 =?utf-8?B?VVhHWFhjSjVsVW91UE1yUTgyQUZ6OUlyTDhTalhPQW5hMHY2SWF4b0F1RUlm?=
 =?utf-8?B?ak5zdzF5UHd6NkU2aEJHejQxYVR6Q2RTNTk4UjVoYiszakExQzBoQmlIb1Z5?=
 =?utf-8?B?YjBmUlFrZXcwT1did3NHbG5TQUFaaEpWNGZxMjlnMGNlQUxiREFwQkdyS25h?=
 =?utf-8?B?M0o0VXgrZU1EZWVKM2x5OEdsWkg5UkxZQlQ5MlhQZi93dHpHak1reVNxY3RO?=
 =?utf-8?B?ZkFKY01VMDR3OFZzcDNITXE4MkowUDBTcDhucndzcE9NeDhMRTAxbmxJS1Zo?=
 =?utf-8?B?c2xlZWpzRHhVaWE3dW9ReXhoNDhWUnVHd3NjSU83aXUyVzFjLzV3UGJOOGxw?=
 =?utf-8?B?cVdYSW9CelppWHpDak9jZFh3blFhbWdlbHRXQXRTcDJwY1UyNDNMdHIvb2tP?=
 =?utf-8?B?aVkwRTRwQ0U2cUN5SEVEUGZER2crNk5Mczc2SDFlUjcyY25HRitNRlcwaEtT?=
 =?utf-8?B?YkRES3J0bTNqTVM3ZzdKWTlxZS8xdjgydVJGNWhRc1BFZjlYb3VJWVIwRVNh?=
 =?utf-8?B?eXVmRFp1STlxYVBiNzh3R1BMZStrb0gzQjUyaU15RVQ3SVdVbTlwNDZkOXBY?=
 =?utf-8?B?SFRRbkt6bUJza1duMnY2eVV0Z25SQmpmb1NCVW9OT212dWJ0Ti9BMWJtSGlr?=
 =?utf-8?B?Y3Nya3U0TUlKUHl3UzA2NXZ5QW5mRTF2eXlQaDJrSUh5dThkVlQ1VjFkZ0pW?=
 =?utf-8?B?b0dKaW15dTVJZXR6MlhVSGxUa0VVMjZpckJIOHZmelZiaS9NdTFod0UvcW1Y?=
 =?utf-8?B?MmZ4YTBvOVJjQ2xSMUxYYVg4YkJZVXBFNk1XZUtVZnVBTTVjWU5uNC9zeklO?=
 =?utf-8?B?bDdYUERZWDh5bVpmc3RzMkR0UXlYNkt4RXNPazZMQVhTNjErZWVPZEZSdm5P?=
 =?utf-8?B?Y0Z4ZjV6MmVSOHB1VXFRd3htdW14b0EvU1l3WlU0b2lxUjE4K1BLcUE3RzNq?=
 =?utf-8?B?S1JDWHVBUTVEMnR0b1Y5OStGdWRQNGE5NGxOdjlGRDE4eWpUVWlkRDROaXBL?=
 =?utf-8?B?bnRzRkVCdGU5NlM5R3ZZblp2YjM3N3JnL2JhR05RRVgzNnJLdFZVblpUaG5B?=
 =?utf-8?B?aXVRYzNMcVdFeER2NndMeDVPWHpydm4zeUJUckpaUUVkdy82NHdHblRDWUNj?=
 =?utf-8?B?Y1p2bXBWMHRYQytoOXcwVFFhcjAvaWdrNWFlVGVPdFJybmtCSFhsQWZzVlVM?=
 =?utf-8?B?cDc4MmR2U2VUelMxOUdscHZaYlVJbGdZZ0xObFd2STl4Yk8zbGZna2c1QXdV?=
 =?utf-8?B?azIzZ2YvWHJVVTFXcXBRdWlmdGxubUtocmpxNHdDNlVYb1JrVlA4ajdaRlho?=
 =?utf-8?B?RG9lTDdoK3FMUTlPZUJsbFpRMmg1MElWbjhKbTVYRlFmTHpGNDdpNzYrQktN?=
 =?utf-8?B?cEt0Z09GNmJHK2RKR2VHZUZUeEk0Rzd4VStBSG05Um5SZzRFS0hBNkU1UG5p?=
 =?utf-8?B?ZTlpM1VuWDNGWG1QZzYxcUpBbTV6S3Blcm1yK3Mxam5FYUZnVi80ZW9OSjdw?=
 =?utf-8?B?c3Byb0dhL1JCaDRMNktqdFZ0d0wrRnR2d3ZqRDRubkFZNUxRdXdvRENjdkFZ?=
 =?utf-8?B?Rmw4K0xzaGhMK1NxaGh3aHFkTHdzMjRKTU9hYXcrSEQzVXhHT3NVZkNTRlI5?=
 =?utf-8?B?MWdCcmFrSEZRYTJQRFA5di9vcEdKa2ZNaXJnYVMzR1JzdWo5SzRJNnpBYVhK?=
 =?utf-8?B?THRiNk5KOGoyTjVSaWR4emQ3bVUzbXRqQVY1c2FvZll6TFZ6c3M0bGpLbVph?=
 =?utf-8?B?Ym5GVFBOU01vK2ErRTlqeVJFcWdXYTRiN1hIOWNwU1ZJVTFWcDBzdzBJQit1?=
 =?utf-8?B?TjA3WTlOUmF3PT0=?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:vm-swbuild15.axiadord;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 13:12:35.0908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b336a0c6-f8e5-48dd-d0ec-08ddf45989fb
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[vm-swbuild15.axiadord]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF206F06927
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_141246_296311_DDB73EC7 
X-CRM114-Status: GOOD (  10.69  )
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

Add documentation for Axiado Digital Block SPI controller.

Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
---
 .../devicetree/bindings/spi/axiado,ax3000-spi.yaml | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..18e4b002ac99ecdd70d724680e24f2867c82dd42
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/axiado,ax3000-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 SoC SPI controller
+
+maintainers:
+  - Vladimir Moravcevic <vmoravcevic@axiado.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - axiado,ax3000-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ref_clk
+      - const: pclk
+
+  clocks:
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-names
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+   #include <dt-bindings/interrupt-controller/irq.h>
+   #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+   soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      spi0: spi@80510000 {
+         compatible = "axiado,ax3000-spi";
+         reg = <0x00 0x80510000 0x00 0x1000>;
+         clock-names = "ref_clk", "pclk";
+         clocks = <&spi_clk &spi_clk>;
+         interrupt-parent = <&gic500>;
+         interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+         num-cs = <1>;
+      };
+   };
+...

-- 
2.25.1



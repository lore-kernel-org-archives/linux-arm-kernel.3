Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC5BC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgI/JkITGmiVT6A6VUwLoEgtIIyCPMZwHp5YWFEWg+g=; b=zwx5tPK82aG4doQIqWP6ffjGI6
	dPQkgj0Z14FuoXzcjMVuTwrmktkPOiHdzgHPQfFIcYjUXSyx0cGISsu3mmj5ckQMzPgvwUnu93+e9
	qHqh2dSXhYoZy7/CyAYZY1R2f5KvDApbKdAQfKsPr6GPQ2kC/kbO+J70olPVaXTYDceCDXIyC+Ehj
	Cnba/RqZCFRYXGo7lH9sklORy2IzCigzV/UtnJ7b2GFQ62qAkBatyDK/+H+8eTw8yZLN86mu7mOZP
	GgmSSL/ToBznFvZU95Y31UTR+WCqumknylFxeheuP7jS5BWI7w3nBjUVEbQhkSoUTTSSypru+dEtM
	qYY19znQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlG2p-00000003L34-0RfT;
	Thu, 20 Feb 2025 23:33:27 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFvF-00000003J5C-3I9s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 23:25:40 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KL98lg029271;
	Thu, 20 Feb 2025 15:25:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=N
	gI/JkITGmiVT6A6VUwLoEgtIIyCPMZwHp5YWFEWg+g=; b=FAEqlyfB4jvlPoTNM
	o9/kc5/YIjScGkck9aIy8P95tBN5AUy73qMuhuhlVCDawkED8Jjp6dWn60Ee9hJP
	55W9PQ8QFeh/p3/YVrtey1TWY4/j1zaKJy1YzDdVp5kMUBj4aIE+qFDnQxDW0Hl3
	BdnYbnBQFtcQrOtapRWDlDnZa6Od2HuXI7VoTmJ++w+Wti59HUuQWW/dAyfF9mK/
	9oAp6Hxa7SypWSLoTPzm4YqBZzXeHUpy/TNofRGYR2FxrLF+9wTpxwjttNiF8Jr7
	sSbwGbJur5+vFr1LtyDxfvJTuyZFgXW80rmibmLMoZc2W6i+c9HWeVgwmwxfyT1T
	bcd/A==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 44xc24r915-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 15:25:31 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 20 Feb 2025 15:25:29 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 20 Feb 2025 15:25:29 -0800
Received: from wd-ubuntu-24-04.marvell.com (wd-ubuntu-24-04.marvell.com [10.111.132.113])
	by maili.marvell.com (Postfix) with ESMTP id C4E2D5B692F;
	Thu, 20 Feb 2025 15:25:29 -0800 (PST)
From: Wilson Ding <dingwei@marvell.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <salee@marvell.com>, <gakula@marvell.com>,
        Wilson Ding <dingwei@marvell.com>
Subject: [PATCH v2 1/4] dt-bindings: reset: Add Armada8K reset controller
Date: Thu, 20 Feb 2025 15:25:24 -0800
Message-ID: <20250220232527.882888-2-dingwei@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220232527.882888-1-dingwei@marvell.com>
References: <20250220232527.882888-1-dingwei@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 8ONWU7Zuw7aqAk6-fBizNeu7df81an_Q
X-Proofpoint-ORIG-GUID: 8ONWU7Zuw7aqAk6-fBizNeu7df81an_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_152537_934559_57C1153A 
X-CRM114-Status: GOOD (  13.12  )
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

Add device-tree binding documentation for the Armada8K reset driver.

Signed-off-by: Wilson Ding <dingwei@marvell.com>
---
 .../reset/marvell,armada8k-reset.yaml         | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml b/Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml
new file mode 100644
index 000000000000..b9f7f3c24d3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2025 Wilson Ding <dingwei@marvell.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/marvell,armada8k-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada8K reset controller
+
+maintainers:
+  - Wilson Ding <dingwei@marvell.com>
+
+description: The reset controller node must be a sub-node of the system
+  controller node on Armada7K/8K or CN913x SoCs.
+
+properties:
+  compatible:
+    const: marvell,armada8k-reset
+
+  offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Offset in the register map for the gpio registers (in bytes)
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - offset
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon0: system-controller@440000 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0x440000 0x2000>;
+
+        unit_swrst: reset-controller@268 {
+            compatible = "marvell,armada8k-reset";
+            offset = <0x268>;
+            #reset-cells = <1>;
+        };
+    };
-- 
2.43.0



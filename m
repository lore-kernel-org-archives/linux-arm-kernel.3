Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C20CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxLiY9VXwmW64brotYTwmn0HZmpUyP4jQLvqjXxfH1s=; b=zDFZO9GhTsZFw0h1xOw8XSesXE
	o0sExBVqgJBMctX0TyR1v28ML3QQIANZqI3EXegyBshHuYg9pO7iuLXJSt0V6CTvPsnZbtIek9Kuf
	bLuGQmj6X+lD4SOwqW/RmBkOwFfmXrBsOvWs/tcHhlgq0COt3HZOAo7xMQ9WC4E3acq9+6bDFtIwB
	9Sgip+q9pTwIrTWqIo+9eKLaDv+vFIhYZja2QwQhE/foa5pL8Uzqi2j/nEargtxRT876wyzWVcTKo
	Y1RqTpHrrB8MfA1OFwTSocYTFZJKX0IhzalrXWaW7KhDZUSWflHcv07xw6mZd0yuGrH74ZNh4jKdT
	l/oQBYxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ6b-0000000HDtm-0SMt;
	Tue, 02 Sep 2025 12:27:21 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utN04-0000000GGlu-0gMK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:08:25 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58297rtT2987826;
	Tue, 2 Sep 2025 04:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756804073;
	bh=OxLiY9VXwmW64brotYTwmn0HZmpUyP4jQLvqjXxfH1s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ycTw6eUyDwd9cRZQkw8mSlrcUh76XL7nT5H29Uznigoe+EA3bxRLnYvvm12jaM3o7
	 1JJSzJTnpcBgoKfAbeEeviSaqrIfuD+KcsC7vqSDrGisfUdWTQ/rEHjxkOim1phG8j
	 mbLoMHlbA2n2Fv0zbIuq0wbCfTHoXOCFNjqpsLGU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58297rbQ2729543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 04:07:53 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 04:07:51 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 04:07:51 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58297p561001497;
	Tue, 2 Sep 2025 04:07:51 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 58297ofC020820;
	Tue, 2 Sep 2025 04:07:51 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu
 Poirier <mathieu.poirier@linaro.org>,
        Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
        Mengyuan Lou <mengyuanlou@net-swift.com>,
        MD
 Danish Anwar <danishanwar@ti.com>, Xin Guo <guoxin09@huawei.com>,
        Lei Wei
	<quic_leiwei@quicinc.com>, Lee Trager <lee@trager.us>,
        Michael Ellerman
	<mpe@ellerman.id.au>, Fan Gong <gongfan1@huawei.com>,
        Lorenzo Bianconi
	<lorenzo@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lukas
 Bulwahn <lukas.bulwahn@redhat.com>,
        Parthiban Veerasooran
	<Parthiban.Veerasooran@microchip.com>,
        Suman Anna <s-anna@ti.com>
CC: Tero Kristo <kristo@kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>
Subject: [PATCH net-next v2 1/8] dt-bindings: net: ti,rpmsg-eth: Add DT binding for RPMSG ETH
Date: Tue, 2 Sep 2025 14:37:39 +0530
Message-ID: <20250902090746.3221225-2-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902090746.3221225-1-danishanwar@ti.com>
References: <20250902090746.3221225-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_020824_388220_DC291E63 
X-CRM114-Status: GOOD (  15.02  )
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

Add device tree binding documentation for Texas Instruments RPMsg Ethernet
channels. This binding describes the shared memory communication interface
between host processor and a remote processor for Ethernet packet exchange.

The binding defines the required 'memory-region' property that references
the dedicated shared memory area used for exchanging Ethernet packets
between processors.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 .../devicetree/bindings/net/ti,rpmsg-eth.yaml | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ti,rpmsg-eth.yaml

diff --git a/Documentation/devicetree/bindings/net/ti,rpmsg-eth.yaml b/Documentation/devicetree/bindings/net/ti,rpmsg-eth.yaml
new file mode 100644
index 000000000000..1c86d5c020b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ti,rpmsg-eth.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ti,rpmsg-eth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments RPMsg channel nodes for Ethernet communication
+
+description: |
+  RPMsg Ethernet subnode represents the communication interface between host
+  processor and a remote processor.
+
+maintainers:
+  - MD Danish Anwar <danishanwar@ti.com>
+
+properties:
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the shared memory region used for communication between the
+      host processor and the remote processor.
+      This shared memory region is used to exchange Ethernet packets.
+
+required:
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    main_r5fss0_core0 {
+        mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
+        memory-region = <&main_r5fss0_core0_dma_memory_region>,
+                        <&main_r5fss0_core0_memory_region>;
+        rpmsg-eth {
+            memory-region = <&main_r5fss0_core0_memory_region_shm>;
+        };
+    };
-- 
2.34.1



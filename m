Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A172C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vjypw+5SWKXj3fJsQevbLbIsP5kna9ij086B85mf7mc=; b=Bd56xesi4QApycZ2ZuB/jM/nBy
	FY6SEl1/Rgm+plO2TVxEnqqFkFhkahLy94dK9NK6zlu4NSexrIKPDeS6EWcjUHMEfSAXZUuz46zuH
	fnVUBqcLcXS5xaYq8ccIRpVeKLnU/0mP7EB/1WtSP/L4FCE474pVKVB6pgSAUcCNkvd3nKlAry2VX
	gRU8No+sPleIC0THnQ4T7woXEXoHAQSR64CNHOhyXV1VRfpfcUN1HPxYSXR8+vyL8OpIt5IJCE5mP
	WYmnEHS6gVkEteV1y3GME9duhP5HWbsQCq/mVodE9HiGKeJ9ephlHRyyqfdSj9SglT8UFPFmkBLUh
	vK+UILXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zA4-00000005GFJ-1sxS;
	Mon, 21 Apr 2025 21:58:44 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yyB-00000005DOc-0wRu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 21:46:29 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkMYc1033928
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 16:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745271983;
	bh=Vjypw+5SWKXj3fJsQevbLbIsP5kna9ij086B85mf7mc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sHJ4i/aerLXl4mgaf97v2QF7266prQFMmObmPFUNFsxEsVfPjm+Dvt/EmA1D1l9aC
	 qtlmaM4QCJfdklcFPQeteix5MVu5btNxwxTA9jxmM3pinR7AIeUV6p6l0tdxxdkDRx
	 y+gQslRsuJ+G2lkV7DA/raanKt4wKCWnBOF15OOo=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkMdB118843
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 16:46:22 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 16:46:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 16:46:22 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LLkLqL038764;
	Mon, 21 Apr 2025 16:46:21 -0500
From: Andrew Davis <afd@ti.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 1/3] dt-bindings: mfd: ti,j721e-system-controller: Add compatible string for AM654
Date: Mon, 21 Apr 2025 16:46:18 -0500
Message-ID: <20250421214620.3770172-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250421214620.3770172-1-afd@ti.com>
References: <20250421214620.3770172-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_144627_446373_00CD531E 
X-CRM114-Status: GOOD (  11.46  )
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

Add the child nodes that can be found under this node. Then as done for
other similar devices (J7200 and J721s2) add support for the AM654 system
controller to this binding.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../bindings/soc/ti/ti,j721e-system-controller.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index 13b6b6fa5dee7..f3bd0be3b279f 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - ti,am654-system-controller
           - ti,j7200-system-controller
           - ti,j721e-system-controller
           - ti,j721s2-system-controller
@@ -73,6 +74,18 @@ patternProperties:
     description:
       The node corresponding to PCIe control register.
 
+  "^clock@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/soc/ti/ti,am654-serdes-ctrl.yaml#
+    description:
+      This is the Serdes Control region.
+
+  "^dss-oldi-io-ctrl@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/mfd/syscon.yaml#
+    description:
+      This is the DSS OLDI CTRL region.
+
 required:
   - compatible
   - reg
-- 
2.39.2



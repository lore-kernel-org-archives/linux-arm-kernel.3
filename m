Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D43CA100A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irXPgS42zFgkQHjW10ATbOmLq7FuFJt14i+mSxGaFpM=; b=5Bh6vzldKEV+GrCZmjw8EBs1fF
	4d662cuhG8cj3BgmTRhzE/IVb0iqainl9A7hqlbX8cUrHeEUtu7ziGxnVUdGJrW/wYlnYOnfHqaXF
	lgF+oCf2h5N1bDlpgyp3YAw2Z5+Pbbyt8WkZV+CMAcx7xKi4WvF3anJoImAhWs01M1cuww//PfS+X
	2aawDBPVK58Ib8dy3pS/nGSf0jAVaEACPnUbOtowncgucWuvM5r+BVtANutlzqB0rRzCbo0x6lNR+
	8aYOodDRtccthoAsNn9hvEzxO8TsVZmxPTzon2LEesLawfyTourWzJrzrShW6FJG8urGcGdQtbGJA
	JAi7XywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5ol-0000000Ct1O-2LKL;
	Mon, 01 Sep 2025 14:47:35 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3Wz-0000000CLyO-1b5g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:21:06 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cFndK1HxPz9sT7;
	Mon,  1 Sep 2025 14:05:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AoA5S3BHDBbU; Mon,  1 Sep 2025 14:05:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cFndC6fbFz9sSr;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CE69E8B790;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id r-KaAi8_MPiL; Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9AED58B77B;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema
Date: Mon,  1 Sep 2025 14:05:13 +0200
Message-ID: <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756727747.git.christophe.leroy@csgroup.eu>
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756728308; l=3362; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=NiGGEzSVsJLntFwP1MIryFHdxpjk8igr3FrrVNxKPP0=; b=5WGZ5OgL+UExib3sv3fqbTbNCnvFZWxhkGlIIBNdXJikd0CcgFn/iAKdoshFpSqdsfhcw8u+A AJl1zujb3KNA/2ZISoit2AJr8HNP+vrVFJqtJpC2pYIMie16Qi8gN0s
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052105_576476_5E6320D3 
X-CRM114-Status: GOOD (  15.17  )
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

Convert QE QPIO devicetree binding to DT schema.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: New
---
 .../fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml | 53 +++++++++++++++++++
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 26 +--------
 2 files changed, 54 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
new file mode 100644
index 000000000000..e6ba319a75c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale QUICC Engine Parallel I/O (QE PARIO) GPIO Bank
+
+maintainers:
+  - Christophe Leroy <christophe.leroy@csgroup.eu>
+
+description:
+  Bindings for the Freescale QUICC Engine Parallel I/O (PARIO) GPIO controller.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,chip-qe-pario-bank
+      - const: fsl,mpc8323-qe-pario-bank
+
+  reg:
+    maxItems: 1
+    description: Offset to the register set and its length.
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    qe_pio_a: gpio-controller@1400 {
+        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
+        reg = <0x1400 0x18>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+    qe_pio_e: gpio-controller@1460 {
+        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
+        reg = <0x1460 0x18>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
index 09b1b05fa677..782699c14567 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
@@ -24,28 +24,4 @@ par_io@1400 {
 
 Note that "par_io" nodes are obsolete, and should not be used for
 the new device trees. Instead, each Par I/O bank should be represented
-via its own gpio-controller node:
-
-Required properties:
-- #gpio-cells : should be "2".
-- compatible : should be "fsl,<chip>-qe-pario-bank",
-  "fsl,mpc8323-qe-pario-bank".
-- reg : offset to the register set and its length.
-- gpio-controller : node to identify gpio controllers.
-
-Example:
-	qe_pio_a: gpio-controller@1400 {
-		#gpio-cells = <2>;
-		compatible = "fsl,mpc8360-qe-pario-bank",
-		"fsl,mpc8323-qe-pario-bank";
-		reg = <0x1400 0x18>;
-		gpio-controller;
-	  };
-
-	qe_pio_e: gpio-controller@1460 {
-		#gpio-cells = <2>;
-		compatible = "fsl,mpc8360-qe-pario-bank",
-			     "fsl,mpc8323-qe-pario-bank";
-		reg = <0x1460 0x18>;
-		gpio-controller;
-	  };
+via its own gpio-controller node.
-- 
2.49.0



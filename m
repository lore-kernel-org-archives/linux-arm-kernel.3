Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F109CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SY8YfrMPM1w7k+zZUF/W7O4HfLrCqyRv5XrwplgvkFU=; b=XNy61oz02ogPQDRw7rBxQOxxc4
	w5WUBcTDDRff3AjV5elAfs+4uew9faLxgLyx8Ev4ozw4fpxfKMa6QTatrxvU+krklz+e/fIdzj4yx
	/NjrPoRZaWE2jcWcj6aw+HjoAITEZAyTiVLTIIyWGzUsT9XnaT2Ypz2ufSY9JiAuSiEMyCSSMH1yV
	nKnpkpT8jN0rri6V3nwjwgLSOKF7iTfTtvT+dLZHyJgqn1icFLekTkomzMDZK3T6q5h5SOeJ1zvsM
	HCqLyPVpbu8dKuarl2kpyOH2wB79oSIxoR6Q6gwY4wPKOxoi66r8wRIUqmTEs5IFdjdrmC+LTCh9L
	v2xEBPhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHqG-00000000gY8-0jYx;
	Thu, 18 Sep 2025 16:50:44 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHqD-00000000gVw-2caT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:50:43 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSLY71M6Mz9sg6;
	Thu, 18 Sep 2025 18:23:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39bHytEGPYRx; Thu, 18 Sep 2025 18:23:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSLY53wZdz9sfx;
	Thu, 18 Sep 2025 18:23:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 768F88B767;
	Thu, 18 Sep 2025 18:23:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MPO8j3rwFKzz; Thu, 18 Sep 2025 18:23:37 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B88608B776;
	Thu, 18 Sep 2025 18:23:36 +0200 (CEST)
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
Subject: [PATCH v6 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema
Date: Thu, 18 Sep 2025 18:23:26 +0200
Message-ID: <5c4f831404857dd6eeefebe2ecdf2bb8ad503538.1758212309.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758212309.git.christophe.leroy@csgroup.eu>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758212606; l=3281; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Dvuwwh8MSNUgRklML1mjdeLSnlO6YfBO8ze0l2VRvwk=; b=772HlsH6h7UbPeuqAuXNjZe1qUDYjxe+koslvNmvWWXiaDk343uXnAoM6Ktsbnm/d8eLZYDLB GfJSIX1NDfkAW8rn07MXW6bSNkPxrqaok3BYmgU4ZotlEFyuJ2gkImU
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_095041_833254_01C4EA9C 
X-CRM114-Status: GOOD (  15.55  )
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
v6: Comments from Rob taken into account except the comment on fsl,<chip>-qe-pario-bank becoming fsl,chip-qe-pario-bank as I don't know what to do.
---
 .../gpio/fsl,mpc8323-qe-pario-bank.yaml       | 49 +++++++++++++++++++
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 26 +---------
 2 files changed, 50 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml

diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
new file mode 100644
index 000000000000..0dd9c0e6ca39
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
@@ -0,0 +1,49 @@
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
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,chip-qe-pario-bank
+      - const: fsl,mpc8323-qe-pario-bank
+
+  reg:
+    maxItems: 1
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
+    gpio-controller@1400 {
+        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
+        reg = <0x1400 0x18>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+    gpio-controller@1460 {
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



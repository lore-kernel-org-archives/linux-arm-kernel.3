Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4E3CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 21:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycniQyaJgGJqNZKTwz8OPAQgXyL5GobzzmE9CRpgq1Q=; b=0E9tw3WCxj/hR1IF1uXlGludXg
	ED72kmT6Eu3i++/wgenbU5/i1lLADTwlmDsTZn7rv8w8ssJQZ1sCNuaqVMwlpzBqYQLPco/YX0dxo
	UC96nDaCNE8OWyeeQU8ixfcBMPKxWkoArRubp1kdLkizyQoWqcV6IqvG5jJx7vp4wWwcfFkk2bGzp
	E2pQ32DrcHAAS8KSThcJ2HBEMf6vd8marEC98hx6Vb/jhTDMWWEM1Xs0HYDcnjoF2gMgw0Ema2Wa7
	WRdhuDu5LzwQ4al2ELpb33Zu+nQdMjlqoyiD95xZU8Q6wluYnD3/PPXjkfWR5EpqMVjCacGdvPJkn
	EJPy7q+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqXX-0000000F0j8-2byz;
	Wed, 20 Aug 2025 21:40:15 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomRY-0000000EVrj-0BJI;
	Wed, 20 Aug 2025 17:17:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755710230; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jxMnTm6Cuq0s86rLXIMY4+PooMQsFtb1doQSY1MnqoA/Xqd1GOc9UWYlu16tWqn1cLRbAUsY8C96wu9EnUD0LdNCGiXyLINotXg+/S5NVQheSvUqlD76+eIdf7hBz3aGv+MjSJv+oX1vrMO5gFPr9/4/5y9WVHWpXkKazANYovs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710230; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ycniQyaJgGJqNZKTwz8OPAQgXyL5GobzzmE9CRpgq1Q=; 
	b=QA2/VXsJM1yPDLmu9RLzq/qNo/5wgIgdL8s6ggml4QgXh7m1a3g2oHdz1cnVFksiud7+63fQqkooIUDZAMbq7N52BRMdUoDUs5MSO/d5VUKo8b7acny+Afl1XVJn87VEZcrB2LcB4TXJbRO1JVSJ5dwwRWWTBjOF8bLVA9jpVX4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710230;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ycniQyaJgGJqNZKTwz8OPAQgXyL5GobzzmE9CRpgq1Q=;
	b=czRh2mvzHkUEpQ+isiTqQNdXOID4rSWSeTrMIHdCtSJQn8UmJQY5A6I/UrheE2AS
	UMqC1Qm+Hde8EWnoaR+Bje4ROzNkKoJQwKzzcYL07IMKyTUfGBoD790NCfpAMgyEteH
	4/n1O8QC2u3/FyE2yl7F1pR4kTc2DrPUGWpBEc1M=
Received: by mx.zohomail.com with SMTPS id 1755710228543472.88877592218955;
	Wed, 20 Aug 2025 10:17:08 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	ck.hu@mediatek.com,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	jmassot@collabora.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS MIP4 Touchscreen to YAML
Date: Wed, 20 Aug 2025 14:13:01 -0300
Message-ID: <20250820171302.324142-14-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_101748_134692_94718C2F 
X-CRM114-Status: GOOD (  13.58  )
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

Convert the existing text-based DT bindings for MELFAS MIP4 Touchscreen
controller to a YAML schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../input/touchscreen/melfas,mip4_ts.yaml     | 55 +++++++++++++++++++
 .../input/touchscreen/melfas_mip4.txt         | 20 -------
 2 files changed, 55 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
new file mode 100644
index 0000000000000..170fd4212467e
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/melfas,mip4_ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MELFAS MIP4 Touchscreen
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+properties:
+  compatible:
+    const: "melfas,mip4_ts"
+
+  reg:
+    description: I2C address of the chip (0x48 or 0x34)
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ce-gpios:
+    description: GPIO connected to the CE (chip enable) pin of the chip
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@34 {
+            compatible = "melfas,mip4_ts";
+            reg = <0x34>;
+
+            interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+            ce-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+
+            pinctrl-0 = <&touchscreen_default>;
+            pinctrl-names = "default";
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt b/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
deleted file mode 100644
index b2ab5498e5190..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* MELFAS MIP4 Touchscreen
-
-Required properties:
-- compatible: must be "melfas,mip4_ts"
-- reg: I2C slave address of the chip (0x48 or 0x34)
-- interrupts: interrupt to which the chip is connected
-
-Optional properties:
-- ce-gpios: GPIO connected to the CE (chip enable) pin of the chip
-
-Example:
-	i2c@00000000 {
-		touchscreen: melfas_mip4@48 {
-			compatible = "melfas,mip4_ts";
-			reg = <0x48>;
-			interrupt-parent = <&gpio>;
-			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
-			ce-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
-		};
-	};
-- 
2.50.1



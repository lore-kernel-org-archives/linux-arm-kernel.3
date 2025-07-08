Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C957C83F15
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 18:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtpL9xeWswzKfuckZn9sP+YgvbyRD6xwyqCKGbCnyIQ=; b=VRpQJl7DfAw3t2t/7WOHb72Key
	8jJFmf9U55LtFBOMFOXTG7sMzJ1yvFqEUUX0hNu+ZzUQHdZeWQskBsM+yr/uUautcdeILtlNKmUPt
	R1klo3B8mYlckrpf9mQ2ZyFUp74fIDnXKvb7cD+ln4rJYR30JRjwtzK0OhxxcqPIUC74N4qg16IzO
	zYEi+yfrw7oXIuT2ubPxWY+/FoN2Ax1nAJeQYpHOcEqWQeH1D5nBjDmWQKxt0I2JHewmUFHEqpEF7
	wkVSNhyHiGvHmIHMxqPj0XMLH3wG+UmmSOQNjUvm0sr2MAZS7ll3MkD8Ov878KuTWSK9t9y49u+uW
	OcicbYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCjp-00000006CtC-40kz;
	Tue, 08 Jul 2025 18:08:17 +0000
Received: from [37.205.8.231] (helo=mx.olsak.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZC5o-0000000677r-1imy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:26:58 +0000
DKIM-Signature: a=rsa-sha256; bh=LtpL9xeWswzKfuckZn9sP+YgvbyRD6xwyqCKGbCnyIQ=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1751994598; v=1; x=1752426598;
 b=hKNNTxNsvtDaf14HLCbJwhNkEndvJQZ0eZnLLYPYxC5pc4WvEulGpw/uTtwpES+KrtvI3B8I
 6YgysTMp1rMtCAhzBU1hwLZVfqNs4RL/CwDY0J7Ul47Uo3wlhcvjR97iFwqbDrp4MJk4ekfFdZZ
 W3iZy414rnfVoVCnrRt65Bi5lFEjkPycxWADBfR0/09aorq4xUnEMgF1I4BxBZTOy0z50S2pNDB
 tBgWCvUMgY4F9ciVp457vxHBeJS6lJWXqPGKqQXNtgQaDEpMKGcYOzWnSFHeZTc1faze1euqNBi
 FKaLYMDxc8Q/cXP5Jf5qXHa+bMcLGkkiB7k5LHao2cm2A==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 2d725840; Tue, 08 Jul 2025 19:09:58 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Tue, 08 Jul 2025 19:09:46 +0200
Subject: [PATCH v16 1/5] dt-bindings: mmc: sdhci-pxa: restrict pinctrl to
 pxav1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250708-pxa1908-lkml-v16-1-b4392c484180@dujemihanovic.xyz>
References: <20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz>
In-Reply-To: <20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 soc@lists.linux.dev, linux-mmc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2237;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=65aNYsQ8JjFSYbzJx1V2anTWL2zOApEH8927sYndFAo=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBm5AY9nmbNYmQkwrMpQtrlS3eM9k7N5igXru/6XX3+0z
 L+VzlfbUcrCIMbFICumyJL73/Ea72eRrduzlxnAzGFlAhnCwMUpABNhVmFkWOMRLuT5c++SQiN5
 2cxjHou/XuTKK50sqdZdXplqFCSfysgw+3lvr4tJytUFZ74/fK2vcIf1gfSMk1mzXtmVVLRXFqn
 xAwA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_102656_596533_8FB87645 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

The current pinctrl properties apply only to the pxav1 controller.
Adding one default pinctrl node to a pxav3 controller therefore causes
a schema warning.

Check the existing properties only on pxav1. pxav2 and pxav3 may add
their own set of pinctrl properties if and when needed.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Changes in v16:
- New patch
---
 .../devicetree/bindings/mmc/sdhci-pxa.yaml         | 36 ++++++++++++----------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml b/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
index 4869ddef36fd89265a1bfe96bb9663b553ac5084..e7c06032048a3a73eb3eb67a887e75db273ffa92 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
@@ -30,6 +30,26 @@ allOf:
           maxItems: 1
         reg-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mrvl,pxav1-mmc
+    then:
+      properties:
+        pinctrl-names:
+          description:
+            Optional for supporting PXA168 SDIO IRQ errata to switch CMD pin between
+            SDIO CMD and GPIO mode.
+          items:
+            - const: default
+            - const: state_cmd_gpio
+        pinctrl-0:
+          description:
+            Should contain default pinctrl.
+        pinctrl-1:
+          description:
+            Should switch CMD pin to GPIO mode as a high output.
 
 properties:
   compatible:
@@ -62,22 +82,6 @@ properties:
       - const: io
       - const: core
 
-  pinctrl-names:
-    description:
-      Optional for supporting PXA168 SDIO IRQ errata to switch CMD pin between
-      SDIO CMD and GPIO mode.
-    items:
-      - const: default
-      - const: state_cmd_gpio
-
-  pinctrl-0:
-    description:
-      Should contain default pinctrl.
-
-  pinctrl-1:
-    description:
-      Should switch CMD pin to GPIO mode as a high output.
-
   mrvl,clk-delay-cycles:
     description: Specify a number of cycles to delay for tuning.
     $ref: /schemas/types.yaml#/definitions/uint32

-- 
2.50.0



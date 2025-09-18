Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B823CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4sae3VcIbk8y9qks3D5Qe5VW28dq5OkqtjE4H3CEwg=; b=ahPePMSPSmyB3tN+92EPcqpwhO
	AdJ2t8G52aWmnLXouiSPSnEE4Zk8WW+tNqH23dUOl7g+XFmxuCmY8h54mVSLbkxRkit7F8UWhTKBP
	zN3J30+k8uhK6FlaITNc7AMvbLwyeepyMKiFGU0d1vdEgUn/PjsMY7EYuUnqFBjPS3oBLqvS7V1vA
	AqBCUpDrhBgsZCsdZudfrl2eeHARp5Br/cBR0KEb8c+9UjV8DF30RSprAsH9l1WPFbH1muYhPxNFE
	Wep2snivBWCruPSJwwsFz+NawH/F1d7ofZ69r8eSXmgO076ulpyR2bfNdE545/wYeWmwq+I2tTAKZ
	yeKkEaAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHqA-00000000gUi-17sd;
	Thu, 18 Sep 2025 16:50:38 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHq7-00000000gU9-3INW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:50:37 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSLY82NTDz9sg9;
	Thu, 18 Sep 2025 18:23:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sEG83xOg8Ef7; Thu, 18 Sep 2025 18:23:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSLY624WMz9sfq;
	Thu, 18 Sep 2025 18:23:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 361D48B767;
	Thu, 18 Sep 2025 18:23:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mscD6JiKuvkZ; Thu, 18 Sep 2025 18:23:38 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 79A2C8B778;
	Thu, 18 Sep 2025 18:23:37 +0200 (CEST)
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
Subject: [PATCH v6 7/7] dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Thu, 18 Sep 2025 18:23:27 +0200
Message-ID: <7269082e90d20cf2cb4c11ceb61e24f0520d0154.1758212309.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758212309.git.christophe.leroy@csgroup.eu>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758212606; l=3549; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=k3Y6MBNnl6dECpR6PnRX0K8qXjVVH4SDYF4pnM6U+5g=; b=3OSUaeiNXCSwzLz+tUKTqJNBGf6B7Ioh5bO/V4rphHE6/+9Er+qUOqScWnM/rlK+XLEXiwf1o glInwdidngzCUT7dAGGwouPmY/73WQuRgFgH5vsf+hc8S21egdBPaJM
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_095035_984883_9CEAC981 
X-CRM114-Status: GOOD (  11.41  )
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

In the QE, a few GPIOs have an associated IRQ to notify changes.
Add IRQ support to QE GPIO.

As not all GPIOs have an associated IRQ, the driver needs to know
to which GPIO corresponds each provided IRQ. This is provided via
multiple compatible properties:

	compatible = "fsl,mpc8323-qe-pario-bank-a"
	compatible = "fsl,mpc8323-qe-pario-bank-b"
	compatible = "fsl,mpc8323-qe-pario-bank-c"

	compatible = "fsl,mpc8360-qe-pario-bank-a"
	compatible = "fsl,mpc8360-qe-pario-bank-b"
	compatible = "fsl,mpc8360-qe-pario-bank-c"
	compatible = "fsl,mpc8360-qe-pario-bank-d"
	compatible = "fsl,mpc8360-qe-pario-bank-e"
	compatible = "fsl,mpc8360-qe-pario-bank-f"
	compatible = "fsl,mpc8360-qe-pario-bank-g"

	compatible = "fsl,mpc8568-qe-pario-bank-a"
	compatible = "fsl,mpc8568-qe-pario-bank-b"
	compatible = "fsl,mpc8568-qe-pario-bank-c"
	compatible = "fsl,mpc8568-qe-pario-bank-d"
	compatible = "fsl,mpc8568-qe-pario-bank-e"
	compatible = "fsl,mpc8568-qe-pario-bank-f"

When not using IRQ and for banks having no IRQ (like bank D on mpc8323)
the origin compatible = "fsl,mpc8323-qe-pario-bank" is still valid.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../gpio/fsl,mpc8323-qe-pario-bank.yaml       | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
index 0dd9c0e6ca39..c34aeea119e0 100644
--- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
@@ -14,6 +14,22 @@ properties:
     items:
       - enum:
           - fsl,chip-qe-pario-bank
+          - fsl,mpc8323-qe-pario-bank-a
+          - fsl,mpc8323-qe-pario-bank-b
+          - fsl,mpc8323-qe-pario-bank-c
+          - fsl,mpc8360-qe-pario-bank-a
+          - fsl,mpc8360-qe-pario-bank-b
+          - fsl,mpc8360-qe-pario-bank-c
+          - fsl,mpc8360-qe-pario-bank-d
+          - fsl,mpc8360-qe-pario-bank-e
+          - fsl,mpc8360-qe-pario-bank-f
+          - fsl,mpc8360-qe-pario-bank-g
+          - fsl,mpc8568-qe-pario-bank-a
+          - fsl,mpc8568-qe-pario-bank-b
+          - fsl,mpc8568-qe-pario-bank-c
+          - fsl,mpc8568-qe-pario-bank-d
+          - fsl,mpc8568-qe-pario-bank-e
+          - fsl,mpc8568-qe-pario-bank-f
       - const: fsl,mpc8323-qe-pario-bank
 
   reg:
@@ -24,6 +40,9 @@ properties:
   '#gpio-cells':
     const: 2
 
+  interrupts:
+    description: List of interrupts for lines of the port that trigger interrupts on change.
+
 required:
   - compatible
   - reg
@@ -35,15 +54,19 @@ additionalProperties: false
 examples:
   - |
     gpio-controller@1400 {
-        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
+        compatible = "fsl,mpc8360-qe-pario-bank-a", "fsl,mpc8323-qe-pario-bank";
         reg = <0x1400 0x18>;
         gpio-controller;
         #gpio-cells = <2>;
+        interrupts = <0 1 2 3>;
+        interrupt-parent = <&qepic>;
     };
 
     gpio-controller@1460 {
-        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
+        compatible = "fsl,mpc8360-qe-pario-bank-e", "fsl,mpc8323-qe-pario-bank";
         reg = <0x1460 0x18>;
         gpio-controller;
         #gpio-cells = <2>;
+        interrupts = <19 20 21 22 23 24 25>;
+        interrupt-parent = <&qepic>;
     };
-- 
2.49.0



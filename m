Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA54C606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e/UniK+P;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9GDNgPi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lQK/52zyoZ1KJbfE9QA99o3oqHEpIh9THpXBfDC5/d4=; b=e/UniK+PhkERrZ
	cKTaL5yJLeyHmMVa23N/CjGM8RHzA/XwN/agVp2q+lbbHM+5duvb0WpmjmIuhLb2kW1D7h5Ud28sB
	fcNHC1lAxqd7wyMycPHQScP0p3b/2Qk/L+imAHqPPu2aUi5aYXunOWbJBcA55yUdUHiAjigrGp75Y
	AFiqVYmlfwcAGsZePhIMxi8hVs8kcHNolS2coqIuv2ryBXZfKS933cZichl4tO+5l9Xj2oX+6jAiW
	zGBrdrvSOYNF+6R2V6Fz510GnonU89g5V3TQT/kl+D6yiKDfgTtWcixiHgpIfuVDs2gIdtCZgpHBS
	vdfIzhEblSMj1/0WAo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxSa-000000097LS-1eDw;
	Thu, 05 Nov 2026 13:24:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxSZ-000000097LF-3kkd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:24:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 90981405C8;
	Thu,  5 Nov 2026 13:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF801F00919;
	Thu,  5 Nov 2026 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885095;
	bh=lQK/52zyoZ1KJbfE9QA99o3oqHEpIh9THpXBfDC5/d4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=i9GDNgPiT8vmuuKsFHPR3sOSJBusnsqYbZDloIIikcf3FmlNWiPFmKXXJyZy5YoGT
	 lRlDR4gFEG/fV8KrvTqfcKPJ0eoLJd8ClSKbj7dZD2jzrkUIQiGMzKQ5TM2S3dU4Uq
	 hVZzkd6Oy6WafDinDyzVqeDOM9Yndv3SCX4/u4RgrfihV6ykofwbC/4SYwec8OkYa2
	 tvHu9K5xBR4GlnZeAubQTCGCGXHMX0Yu9ZpuC0rkxA/kKc8NHP994clcRIYTw1gLrB
	 LxmcBehMW1IlykAN95l8U8HwVS7qGGfgwtwnhG/7ODyQqUIoirlJgrDJRU/jgEQ8wK
	 M/lMgrOTnTH6w==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 05 Nov 2026 14:24:46 +0100
Subject: [PATCH v5 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable
 method
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-1-4103df2588d3@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Russell King <linux@armlinux.org.uk>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

BCMBCA systems booted through CFE can release a secondary CPU by
writing its ARM-state entry address to a 32-bit MMIO mailbox and
sending a wakeup interrupt.

Document brcm,bca-smp and its single-cell cpu-release-addr property.
Require the mailbox address on CPU1, which CFE leaves in a holding pen.
CPU0 is already running and does not need a release address. Add a
Cortex-A7 example with the mailbox address only on CPU1.

Suggested-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 46 +++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 96136b70dacd..b83c7785f656 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -263,6 +263,7 @@ properties:
           - amlogic,meson8b-smp
           - arm,realview-smp
           - aspeed,ast2600-smp
+          - brcm,bca-smp
           - brcm,bcm11351-cpu-method
           - brcm,bcm23550
           - brcm,bcm2836-smp
@@ -479,6 +480,30 @@ allOf:
     then:
       required:
         - secondary-boot-reg
+  - if:
+      properties:
+        enable-method:
+          const: brcm,bca-smp
+      required:
+        - enable-method
+    then:
+      properties:
+        cpu-release-addr:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description:
+            Physical address of the 32-bit MMIO mailbox read by CFE after
+            a wakeup interrupt. Required on CPU1, which CFE leaves in
+            a holding pen. The kernel writes the ARM-state entry address
+            before sending the interrupt. CPU0 is already running.
+      if:
+        properties:
+          reg:
+            items:
+              - items:
+                  - const: 1
+      then:
+        required:
+          - cpu-release-addr
   - if:
       properties:
         enable-method:
@@ -720,4 +745,25 @@ examples:
         cpu-release-addr = <0 0x20000000>;
       };
     };
+  - |
+    // Example 5 (Broadcom BCMBCA with CFE):
+    cpus {
+      #size-cells = <0>;
+      #address-cells = <1>;
+
+      cpu@0 {
+        device_type = "cpu";
+        compatible = "arm,cortex-a7";
+        reg = <0>;
+        enable-method = "brcm,bca-smp";
+      };
+
+      cpu@1 {
+        device_type = "cpu";
+        compatible = "arm,cortex-a7";
+        reg = <1>;
+        enable-method = "brcm,bca-smp";
+        cpu-release-addr = <0xff800568>;
+      };
+    };
 ...

-- 
2.56.0



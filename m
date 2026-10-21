Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05095606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Qtpc3b5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H8fhbLDD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoDg+6sqbvUXMf1vHdHQLEEmPOtq36GA//34shPshDU=; b=2Qtpc3b50rfJcgOl+dAIhOye3/
	972SJ4I9hXI98muXFetrFhJ9XiFuq/UIKtDR3/OGycII0kAaqf4zrYtXPu0Amwz4kcEkh+LzYS3ys
	CwYbOopMgcEF40YzP0buKDcmKWmAeFpegqrvlW6Jr4g+WLMzd8yiAJB2BUro9yvhYVMPWvxOsuLay
	CvwyhyQ2iCBdpHKCIcgx2e0tCnB120nkPErnISubeQC2zc1EkLtzM/oh1QXJmrlVWT1KSMHHgapmu
	mVwPnKE4nPVj5EewP8JoKiGSPQogo3kiyfOrbQBEsh32o6usG4hUNEtlJM1RHumQ38uogs6JSzpW7
	cQKUw+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXxC-0000000CD1g-2cdX;
	Wed, 21 Oct 2026 15:10:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXxA-0000000CD16-41qs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:10:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B315601F1;
	Wed, 21 Oct 2026 15:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1761F000C2;
	Wed, 21 Oct 2026 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792595406;
	bh=IoDg+6sqbvUXMf1vHdHQLEEmPOtq36GA//34shPshDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H8fhbLDDPNiI2ncHf3xu8XiCDPdr7k4iXQCmaLsdskqFeeRwR0Fn1ykfY7a8cMBNb
	 r2LE7Wy2NE48KduOkNmAoJjYN5PzgaWZpt9NI/HARuGEXXIelMsoKN/koGjC5BSrSj
	 ydCiCUzpsFWTF0mnG7ZaPE2s+wcLu5/KNADT9ag9kSWgtB3IEImFc9CilXFlBaiakN
	 YLrfulL7/QGaThRS+tUYu5pxutwgZkGoS92X//CeOAWuzJ/b/uFH7wPmIT0KeV3OkS
	 /OG7p5q4qAA5VO0F1j6L2AbCTaO9/1VorXhDJxYsZFeDjOVme6bxxCBRYfU82vCEJ6
	 ihCA5hGj19MBQ==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 21 Oct 2026 17:09:52 +0200
Subject: [PATCH v3 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable
 method
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-1-7c871f1755db@kernel.org>
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
In-Reply-To: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
The boot CPU does not need a mailbox; secondary CPUs do. Add a
Cortex-A7 example showing both CPU nodes.

Suggested-by: William Zhang <william.zhang@broadcom.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584026..6771b85f757b 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -255,6 +255,7 @@ properties:
           - amlogic,meson8b-smp
           - arm,realview-smp
           - aspeed,ast2600-smp
+          - brcm,bca-smp
           - brcm,bcm11351-cpu-method
           - brcm,bcm23550
           - brcm,bcm2836-smp
@@ -471,6 +472,20 @@ allOf:
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
+            a wakeup interrupt. Required on secondary CPUs. The kernel
+            writes the ARM-state entry address before sending the interrupt.
   - if:
       properties:
         enable-method:
@@ -712,4 +727,25 @@ examples:
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



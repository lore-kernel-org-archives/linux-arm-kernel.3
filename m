Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF04C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dzcn15vklIxbdKo0iUkTyzz8Nnt7ea8eiW8ExHt379E=; b=AUXO1s3tkHYDLJNDsFpsqEwm2E
	G7er6bmqtxl3905aGoHMF75dvV3qMgBsX2Zu9cLCa7a3CsWMghrzq+ZhxcuED9a+lf18XVb71kSxO
	0/nqqSSdj0+GAPIRPy50fc3R97+1+gIUTkN5IcE4dMafjGZHCwb4B+Dj1r+CRldb+KbmhtSsREeSH
	jJwYOMmXYUabYFVxeTdnMyObTfmTQzasmLPFWJmriDNxVESKCG7k1l2uy18AQHB8PM6cFaXwFOZwf
	2KNFL0YvLiBEbxqbOdxMzpOa5BWn4hnonQYZVzbhtvKXkC27irXs2RMjitADHgb9hvp4gOvT0Uxza
	6kEZ/0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGKY-0000000FEyr-0p7H;
	Fri, 11 Jul 2025 16:10:34 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFCO-0000000F5ay-2XQw;
	Fri, 11 Jul 2025 14:58:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752245873; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AJJvdNxsOEJnho+xtOqxoDRJ6EdIYlIACMEE+8Q0YPbliNKu8R04mSm0JxqYLdb92lVRrVKZ0LSKfeu0BmfzN9ccG1V5oKu83eL5OLYerMTgvc1YDkaPhSo9nAJjuEiUuDeORfHlYEMDLjArW3+u3gt73IeDLRU6dauhddme84w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752245873; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Dzcn15vklIxbdKo0iUkTyzz8Nnt7ea8eiW8ExHt379E=; 
	b=a5Spyo14Pjy3FFA+yOTDCdnu80+nBXs6Cpa6xblTxaxWgHjinAfcAJGHe58TY5nuLc5JXPvgXaqMPmiENdzHkIDx+JgdC889x12qaUmDKtsSiPOKksKyA3Gfk47am01/PKfCDTeKM88+bulkPYy0WrrDWG//dYviRJdZmZOWiXQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752245873;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Dzcn15vklIxbdKo0iUkTyzz8Nnt7ea8eiW8ExHt379E=;
	b=PLZ6DB7h7PY7nEQcuRD+SZKsEKlKQRMB9/mcbsENmfn4/MVD/ws2iJ3i9GSXYiFW
	JHMJO8IOAvylMVMC59BohWVwuVIg2ipJKmdxPXgw5zQek8q3j+pQamPBFCvE63jkczX
	vqn3TFTihMtyD7Q8O11p5WumdC7ZF6J8CPmG1yi0=
Received: by mx.zohomail.com with SMTPS id 1752245870786939.833352414672;
	Fri, 11 Jul 2025 07:57:50 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 11 Jul 2025 16:57:34 +0200
Subject: [PATCH 2/5] dt-bindings: cpufreq: mediatek-hw: add mt8196 cpufreq
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-mt8196-cpufreq-v1-2-e1b0a3b4ac61@collabora.com>
References: <20250711-mt8196-cpufreq-v1-0-e1b0a3b4ac61@collabora.com>
In-Reply-To: <20250711-mt8196-cpufreq-v1-0-e1b0a3b4ac61@collabora.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Hector Yuan <hector.yuan@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_075804_703754_4C7689EC 
X-CRM114-Status: GOOD (  12.99  )
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

The MediaTek MT8196 SoC's cpufreq has three performance domains, each
with their own reg item, compared to the existing mediatek,cpufreq-hw
compatible that only uses two.

In addition, the hardware requires special handling by driver
implementations, so the new compatible is needed for more than just the
difference in regs.

Add the mediatek,mt8196-cpufreq-hw compatible, increase the maxItems of
reg, and reduce it back down to 2 for mediatek,cpufreq-hw in an if
condition.

A second example is added to help verify the binding's correctness and
document its use appropriately, though some awkward label names had to
be chosen as dt-extract-example concatenates the entire list of examples
for each binding into a single file, so naming conflicts between them
can occur.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      | 64 +++++++++++++++++++++-
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
index d0aecde2b89b1896c01ea8ae24f26032d8075a11..cee2678b926f845ab131cecef403e127a63fabb2 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
@@ -16,11 +16,14 @@ description:
 
 properties:
   compatible:
-    const: mediatek,cpufreq-hw
+    contains:
+      enum:
+        - mediatek,cpufreq-hw
+        - mediatek,mt8196-cpufreq-hw
 
   reg:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
     description:
       Addresses and sizes for the memory of the HW bases in
       each frequency domain. Each entry corresponds to
@@ -40,6 +43,18 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,cpufreq-hw
+    then:
+      properties:
+        regs:
+          maxItems: 2
+
 examples:
   - |
     cpus {
@@ -68,3 +83,48 @@ examples:
             #performance-domain-cells = <1>;
         };
     };
+  - |
+    cpus {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            mt8196_cpu0: cpu@0 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a720";
+                enable-method = "psci";
+                performance-domains = <&mt8196_performance 0>;
+                reg = <0x000>;
+            };
+
+            /* ... */
+
+            mt8196_cpu6: cpu@600 {
+                device_type = "cpu";
+                compatible = "arm,cortex-x4";
+                enable-method = "psci";
+                performance-domains = <&mt8196_performance 1>;
+                reg = <0x600>;
+            };
+
+            mt8196_cpu7: cpu@700 {
+                device_type = "cpu";
+                compatible = "arm,cortex-x925";
+                enable-method = "psci";
+                performance-domains = <&mt8196_performance 2>;
+                reg = <0x700>;
+            };
+    };
+
+    /* ... */
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mt8196_performance: performance-controller@c2c0f20 {
+            compatible = "mediatek,mt8196-cpufreq-hw";
+            reg = <0 0xc2c0f20 0 0x120>, <0 0xc2c1040 0 0x120>,
+                  <0 0xc2c1160 0 0x120>;
+            #performance-domain-cells = <1>;
+        };
+    };

-- 
2.50.0



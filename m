Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A595CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 18:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8WVt9Ctmn2q0vEpVu4PvAu7OrnSPQKmq2jz3bFRmnY=; b=jDIQwh4xo+RYsI1PI3+s5mFdwj
	mk4W3R1PAcvDfcQSxtLFv+WokQ8H0/fJxKxMzY8LkF1CiRt2DMQJxMUE5zO8gltO3QKjpkqfG/iCT
	8BkwOn0+E2jpPcZkWw9U/wZee9qzh2Q42V7t7DFnNK7iLhn2jIz6l2gMH7V7OkbTzDM3LX0+j5ozS
	AXwcc0sFaw/tzpNO2GVm43IHxSGkqxVidKzh6/XlffLnfvWCPaOvKqxfXqnWak54vXVElZmlvoOdR
	lVuiLPuku3w+Aw2AzDX40ZqTPfYVlvu2MCjTwgmJ2h8m9/1OdJxcwUMMC6ttGo2m31B2hUgh1ceUG
	IoYLLLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8em-0000000B282-0Qw8;
	Fri, 12 Sep 2025 18:38:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8ek-0000000B26w-1Jqm;
	Fri, 12 Sep 2025 18:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=O8WVt9Ctmn2q0vEpVu4PvAu7OrnSPQKmq2jz3bFRmnY=; b=YoJptv5jzf81TGlUcwot8S5xK7
	zQizFTo4Qw5Ezk05QAVCHhMVrhnG8KfMqDmZ2DNmmONAFIZAsuEErmwz9WZkTVOIYE86BbXZkw1Xy
	i8/MVEqNDwe+EevYO+SnkJJiSbAH4HAuC1CLArlJ+XdHQczMHRtNXH01EnMgfx4zlcsKAqOEYQZmE
	PqLC7MDUOeOBpFRO62ksC2eus1EKb1VK4a93uePGSndkhSrVLq5dZ0cFmkkTMV1CXgop+VCfTSNNA
	B0KTsXFjkbJMetRB/Qc5llrFj/0+pN4rF4GsOADHzHZ56uwo3cpOtBs7BOQzPY/o6LEoYfJylNY+2
	fv5LW3/Q==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8eh-00000006PMB-16l3;
	Fri, 12 Sep 2025 18:37:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757702254; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nMlPsYpy2O8sEcroQQZEZB2sKLF7HSiNy8bY58RoZ1PGORvnrM+Q4n+80vKG6cj2AtW6WMAyLT0yDU/mPwrSW1Fww0kbNL3bevFRdcBKcnS3WutXjspb0OROZ1qsQpgHvnOsgsHTRTkvQUxLNT5l7zu7QXD8o1bLAmSpJFEiONo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757702254; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=O8WVt9Ctmn2q0vEpVu4PvAu7OrnSPQKmq2jz3bFRmnY=; 
	b=feGg57ILtO1r890uqwsMAFPu7FWpIIBgqs2qrm7uRNzvdkjDuN3g2102FETPss5Zz1vZ4b3IsY8GBJKUOrXGl398hsaAnmsm5+rkW4GH2leQwV+Usidh3/IJ1+tMWoR6BzK0+OsKwFlhy3dImyADMDFWSTxGfSD5XvTTvMKmhEo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757702254;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=O8WVt9Ctmn2q0vEpVu4PvAu7OrnSPQKmq2jz3bFRmnY=;
	b=IuzaXCrbeixNucRXQlr1GWvGgkjWhmvEIGSFxjrTvwfbEde7Yrg8lpjswtQ5ifuM
	kf2gYL/EIjY6rkh5WLbij9F1pctgZvCwYqowX1q23sKAGwv3nJTGdAH9XkPJHdFat90
	QEEy0Ekcjfe9MHOKdrZFpeJjRpt51CW0Tgrll0dk=
Received: by mx.zohomail.com with SMTPS id 1757702252894215.80562166132404;
	Fri, 12 Sep 2025 11:37:32 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 12 Sep 2025 20:37:00 +0200
Subject: [PATCH v2 01/10] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-mt8196-gpufreq-v2-1-779a8a3729d9@collabora.com>
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
In-Reply-To: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_193755_530386_2BA8107A 
X-CRM114-Status: GOOD (  12.49  )
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

The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
control the power and frequency of the GPU.

It lets us omit the OPP tables from the device tree, as those can now be
enumerated at runtime from the MCU.

Add the mediatek,mt8196-mali compatible, and a performance-domains
property which points to the MCU's device tree node in this case. It's
required on mt8196 devices.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/gpu/arm,mali-valhall-csf.yaml         | 32 +++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index a5b4e00217587c5d1f889094e2fff7b76e6148eb..163b4457f7f25dcdd509c558558a73694521c96d 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - rockchip,rk3588-mali
+              - mediatek,mt8196-mali
           - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
 
   reg:
@@ -53,6 +54,9 @@ properties:
   opp-table:
     type: object
 
+  performance-domains:
+    maxItems: 1
+
   power-domains:
     minItems: 1
     maxItems: 5
@@ -91,7 +95,6 @@ required:
   - interrupts
   - interrupt-names
   - clocks
-  - mali-supply
 
 additionalProperties: false
 
@@ -105,9 +108,24 @@ allOf:
       properties:
         clocks:
           minItems: 3
+        performance-domains: false
         power-domains:
           maxItems: 1
         power-domain-names: false
+      required:
+        - mali-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8196-mali
+    then:
+      properties:
+        mali-supply: false
+        sram-supply: false
+        operating-points-v2: false
+      required:
+        - performance-domains
 
 examples:
   - |
@@ -143,5 +161,17 @@ examples:
             };
         };
     };
+  - |
+    gpu@48000000 {
+        compatible = "mediatek,mt8196-mali", "arm,mali-valhall-csf";
+        reg = <0x48000000 0x480000>;
+        clocks = <&mfgpll 0>;
+        clock-names = "core";
+        interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
+        interrupt-names = "job", "mmu", "gpu";
+        performance-domains = <&gpufreq>;
+    };
 
 ...

-- 
2.51.0



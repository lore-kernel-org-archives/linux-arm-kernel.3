Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4434DCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPHNvWMDChdk1KgHmazWkV1NbFnEmc2Tt67lRg8cQJA=; b=QAmlC1cnodyk/GZj3iWd3GhEmH
	MUlZ0M+ab69lpT10jsxdfV2LfZRKj9j/zPl8cvAKosFZE2LPl+dbnSWTUOzORoJ0QyepDxFSYQq3D
	MBJ9aaGBM3bPp3qKekd9QhMb8yLYxaMkTj8MuvuBioETyYahKTHzh95YULCSRsSvuQg7CobG3ChBY
	F6S5jXtn1jchNB4IuUC12fD3pry23dk7E+254gQqfX2IA4tAd6z6b1lCpmDXapM9CvQj9IRaBV7QU
	P4n+MOWPY0my6irEENXzxztWtaNJdgUb7AeWFZsyAXsI311saArX8LQDLr5AkmJGjXZoNw+8uLC8S
	p0FW/wfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrBx-0000000BIaW-0dZO;
	Wed, 17 Sep 2025 12:23:21 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrBv-0000000BIYx-134B;
	Wed, 17 Sep 2025 12:23:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758111783; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YWhHIKB2S29CoxvFP7qWFsagQSxmI2Vb/yqrsCFWrm9b++lzd6XqggkzOUEOVJ19y1NqLI00N5V0P+MOZfh2xsEwWdJo3cmdnIQMu8ONlm2sNziDUEt+fMnNzRtb1mME8SsT543wKxb0V7rMa4dxgtimWKPl8DtpnZiNvDbwS7A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758111783; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZPHNvWMDChdk1KgHmazWkV1NbFnEmc2Tt67lRg8cQJA=; 
	b=f8tO9oC7wK3xO3uKguZHAxGspsEVya0zKgAzvxUEdUwUv/OJbGsCv+43wxTueV/+By9PuV/pcowxZykSJ8a4Ttr0OgP4WC9ePddmAm2NGrylT4NJKgSloeGd5XN4q4pCDwabuUfrARMyCZ3u5DqyQafUKwEgd275LuHtG57/2c4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758111783;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ZPHNvWMDChdk1KgHmazWkV1NbFnEmc2Tt67lRg8cQJA=;
	b=bIjg0A4iOf8smoz3P2aFnPBIVJODsMNZVvP7foTYWlJd+gBuJ7ZOGw/X5JjdJnkK
	fMROBwzjgs/nM2knorkYhE3tYcqRJsOpSBW9vegm7eCQ2N4ZXayq+u+k2seA+aNzra9
	FeGZbPfWl+VH+MSFRodUlSHr0RFT2GQ7vJ1IDbJk=
Received: by mx.zohomail.com with SMTPS id 1758111782362530.9872816275248;
	Wed, 17 Sep 2025 05:23:02 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 17 Sep 2025 14:22:32 +0200
Subject: [PATCH v3 01/10] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-mt8196-gpufreq-v3-1-c4ede4b4399e@collabora.com>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
In-Reply-To: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
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
X-CRM114-CacheID: sfid-20250917_052319_367469_AE5FE88F 
X-CRM114-Status: GOOD (  13.18  )
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
enumerated at runtime from the MCU. It also means the mali GPU node
described in this binding does not have any clocks in this case, as all
clock control is delegated to the MCU.

Add the mediatek,mt8196-mali compatible, and a performance-domains
property which points to the MCU's device tree node in this case. It's
required on mt8196 devices.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/gpu/arm,mali-valhall-csf.yaml         | 32 ++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index 7ad5a3ffc5f5c753322eda9e74cc65de89d11c73..ccab2dd0ea852187e3ab75923e19739622b2b3b8 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -38,7 +38,6 @@ properties:
       - const: gpu
 
   clocks:
-    minItems: 1
     maxItems: 3
 
   clock-names:
@@ -54,6 +53,9 @@ properties:
   opp-table:
     type: object
 
+  performance-domains:
+    maxItems: 1
+
   power-domains:
     minItems: 1
     maxItems: 5
@@ -92,7 +94,6 @@ required:
   - interrupts
   - interrupt-names
   - clocks
-  - mali-supply
 
 additionalProperties: false
 
@@ -106,9 +107,26 @@ allOf:
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
+        clocks: false
+        clock-names: false
+      required:
+        - performance-domains
 
 examples:
   - |
@@ -144,5 +162,15 @@ examples:
             };
         };
     };
+  - |
+    gpu@48000000 {
+        compatible = "mediatek,mt8196-mali", "arm,mali-valhall-csf";
+        reg = <0x48000000 0x480000>;
+        interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
+        interrupt-names = "job", "mmu", "gpu";
+        performance-domains = <&gpufreq>;
+    };
 
 ...

-- 
2.51.0



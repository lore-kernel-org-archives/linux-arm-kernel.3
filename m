Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E02D65C7B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 17:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0hm26JZwx6v0Ry2T0SEUpthc+tXhioEHL+8VAV//SU=; b=Qr4wwypsyeiyISMziwBuveqnJQ
	HHEr5sCbNcgWAY/k8smWdYq9g5R21hNuwAhjmNAmN2duUwnUyqL5gIes2YomhmYPW4+1oglTlOuAP
	njnY1uuF1RgJWwgmkZQk8xpNnmiRlFama4Mt9Gocqff2kdLW06HyCINtyWmqsWGcAwSzWgY2Rn2l0
	4r9jkvYlW2501T/tHs2m2r+cIK8mzHzrtbP7kU18CISFlYEJciCBhQpMuZrxyYYwjdY6Ap5Gn+TJo
	DFg5KaBRlJ8Sgt34JUrQO05Vf3EjUJVpOnqCIvlXThg1K7j6k3F06edQyHS92RTxhu55nyERLZaRp
	a+uymIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuwl-000000078ux-2OmN;
	Wed, 17 Dec 2025 17:04:19 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuwi-000000078tl-20Wd;
	Wed, 17 Dec 2025 17:04:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765991046; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RdZEoObAi69A7BXQH+VVF3hMq4oOW5uPwfCNNqxQkVqeekoWEPWPh/G8o/j18RjeYm2ATJ/8n8QqzPOUhVlrg0hiypKPSBxMXemRLNNPwP0aXjCVVKUYZmbqKfqY3hGrjENjrNWssv5219GNgnNjygnbkwm1ZAN5mxdiLrxijd8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765991046; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=J0hm26JZwx6v0Ry2T0SEUpthc+tXhioEHL+8VAV//SU=; 
	b=msX9GsQspDMB1LSW9AKbYEUdb5PR35fIDUO23uHN7p6vUQRG0r+RpaxgpjsUjf7nUPClpM5cFi5wp3zN1GApfMvYXwDQDBtUlYerTzSmOEKKBukBgEpKJG6Dj9JaFuwTKqIkdTcdS/zajgWrYsD2e4JRWyI6/LWBWq+FhNpxTDA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765991046;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=J0hm26JZwx6v0Ry2T0SEUpthc+tXhioEHL+8VAV//SU=;
	b=TYF0e3zqs2OyQJdTA5j8qvuLHjvvlb07BeVcVQWey27yJ4sB2r3uAXdujYuAeZJF
	pOFIeXuXOQvDDZ4kAJu2E40hTK++vSvcqqaMJyw8Ac8nLL0CbehQSCnovc7ud/SNAuM
	5gPhibIl37GtM9bp+JwNupALEiY6YzI/n7Ft5dzQ=
Received: by mx.zohomail.com with SMTPS id 1765991044199539.6895741631515;
	Wed, 17 Dec 2025 09:04:04 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 17 Dec 2025 18:03:27 +0100
Subject: [PATCH 1/4] dt-bindings: gpu: mali-valhall-csf: Add shader-present
 nvmem cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-mt8196-shader-present-v1-1-f6f8f3aa1e93@collabora.com>
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
In-Reply-To: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_090416_569600_A1B1CBE6 
X-CRM114-Status: UNSURE (   9.72  )
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

On the MediaTek MT8196 SoC, the bitmask for which shader cores are
present and functional is not the one in the Mali GPU's registers, but
in an external efuse.

Add the nvmem cell properties to describe such a setup, and make them
required on MT8196.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index bee9faf1d3f8..8eccd4338a2b 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -51,6 +51,14 @@ properties:
           - stacks
       - const: stacks
 
+  nvmem-cells:
+    items:
+      - description: bitmask of functional shader cores
+
+  nvmem-cell-names:
+    items:
+      - const: shader-present
+
   mali-supply: true
 
   operating-points-v2: true
@@ -108,6 +116,8 @@ allOf:
       properties:
         clocks:
           minItems: 3
+        nvmem-cells: false
+        nvmem-cell-names: false
         power-domains:
           maxItems: 1
         power-domain-names: false
@@ -133,6 +143,8 @@ allOf:
             - const: core
             - const: stacks
       required:
+        - nvmem-cells
+        - nvmem-cell-names
         - power-domains
 
 examples:
@@ -179,6 +191,8 @@ examples:
                      <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
                      <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
         interrupt-names = "job", "mmu", "gpu";
+        nvmem-cells = <&shader_present>;
+        nvmem-cell-names = "shader-present";
         power-domains = <&gpufreq>;
     };
 

-- 
2.52.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5994CE668B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 18:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IbRY714eO2zGl6q64FE7lg6CXtlWXzXvxXQfYH5rwI=; b=Yil75tuOplrOn9/Ijw344hKp7h
	7unUW8ElTmgxSxCrbQDk/C6FVNPKYqCN/j8dDN/UTSACDH9FxN4lce8Z0vuTzIclJIZ6WctqucJrk
	pxFTZ/lSyhXXTnKU7avzmtUIFrE3rwA0Ty4K7QAUrWVWJgZIBgg4XOw0y7nW9yoS6xa9cGr/xekMn
	S6H2VdS+rvdHeRaUHmJ62Tn0MtveVs44yLHKT34gUnYaQ5iDE9ORfXqzIkTWxyNKodm4NbLTyB1uc
	4Vj5zljPjHLgEooFaVPk0yioIFaSnw3ow6cTY7JTV8AErmCc9lRT15aPSRyXjq8lYitLpjmmA9Y+1
	gKQtaFAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX235-0000000BozK-1y5h;
	Sat, 20 Dec 2025 18:51:27 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX22u-0000000Bot0-04ZN;
	Sat, 20 Dec 2025 18:51:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766256629; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G8xgTZWTJjB4ImOOXFRogkyAppca3TcwYZiVjfFeoWw4cnf3J6yz1l0TmFFFM69NVBZKqPXvn9qVxy8axHJzrAjdanOreLGymgDlXr19Y7ud5gjoh2mrcYVQCCz+DN4sKfQKMUF7CBihUxC0XwKABVYfHrqRvrjJR46bDyrf8vw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766256629; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8IbRY714eO2zGl6q64FE7lg6CXtlWXzXvxXQfYH5rwI=; 
	b=kyZmEgzFo3uCZqEt92Fqf1irIMioiyGvG4VCWM0XG6OY1+lX1o6vtUu9yFuocGMKQrBoM8gmxJc4Qk57fsYGruRAVHkLTy5x7LTZ9A1WgvOc+3Jovg7Bsf/zfk5g43lC+OivDYF4gltniOLqdMvn6Sn8r+TyP5acGEdedyGK7Cc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766256629;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=8IbRY714eO2zGl6q64FE7lg6CXtlWXzXvxXQfYH5rwI=;
	b=jEa18x1NgxTIWetBz2e1aTELkeupFac1ViPHoq7QhKZkaVQrtk55dqLMOL0RR9hZ
	b8KoIp+hlNHz9aVpsO0h+1GKcn9zR0Ai4Px2QJm5PBEz3xdUYuBTqMexCkgRUYF/pEU
	8FII1oDeCA1XiYsC9keOrmMm7hYhBu7JiR2iX/jE=
Received: by mx.zohomail.com with SMTPS id 1766256628125717.7120182725639;
	Sat, 20 Dec 2025 10:50:28 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 20 Dec 2025 19:49:52 +0100
Subject: [PATCH v2 1/4] dt-bindings: gpu: mali-valhall-csf: Add
 shader-present nvmem cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-mt8196-shader-present-v2-1-45b1ff1dfab0@collabora.com>
References: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
In-Reply-To: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
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
X-CRM114-CacheID: sfid-20251220_105118_766113_EE06DC8B 
X-CRM114-Status: UNSURE (   9.18  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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



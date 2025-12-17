Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39268D65C7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 17:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JodwRFPnp+dt+M6T84oVkJbSU75BprVJj2BrcZXZH5o=; b=CAvKS7/3dHVKADiEDG3sNSbvi+
	9KfpruxrFcfi6xxqha99Ef0nrjdKVlf6KuHiwdG40K1M5gebYwODsd8Bcuv0P3p3VSSLRDMwcLqfR
	vivoThjAworc0761TdOiOyAf4mgoxS78XQSD5PS6pVSQs6sBJb6J2U269f2hqQovR1rCGVCfEGR16
	AX5TXFcVGo0/f8luQZvmHRh4Z93SX3z7ZkEvyYjqdoqlwu3fv2UKgMKHUVgb2OkWlk95+iBuFKyNp
	e+xO4ct6cNxXxNQfI8t3sIAvmfl65ei1kxLEnI9OSZggboOWT7zb+ULWDzZdIV0rtoiygHaP/SIe8
	OWhGU0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuwq-000000078xg-0fV0;
	Wed, 17 Dec 2025 17:04:24 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuwm-000000078vc-2avW;
	Wed, 17 Dec 2025 17:04:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765991050; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lOk1vzhLuFgKqwCTkR2S4/2F6Bs/sk85N4qtlMfWm8I9uqLM69ONUKP6YMuLG5kWlNi+AycnblwNp7vdbfLYmfA9d8oPxTXnK2SKn9KubMwOanRqjnkqswG+0UwsAXbsi5Qat8/eTTp+fhe7nSxtp+Abst/MAf0IspLCNz+DRcA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765991050; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JodwRFPnp+dt+M6T84oVkJbSU75BprVJj2BrcZXZH5o=; 
	b=cLbWjpTBG5rGXnss8GtDsa8xjrN+Om2wLnLtx45CuSiEISUTlqfuR1Tsw18OcRELDMa/TWXOi+WaZ4iYJkD33Fam+DGG8bh1H07MbJJ8l9uUYUnTAlvtqeNio5o31zn78PACGybcaCTUr3Uk1LUamQfS3DiIkrPys8+nM4On4PY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765991050;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=JodwRFPnp+dt+M6T84oVkJbSU75BprVJj2BrcZXZH5o=;
	b=IQeMxV8hvs1t6c5qOamOfl4ECpLR61LZsbFJ9IT56qVR8fMFFZ4KscAYZ+SV2dzZ
	exFqlfYbjBZhI2qKdYIqAJtpHJHGvFCngXvq90viMIyDVzyRBz+ONGJyJB8IHko7AVF
	0VwEoNxCcIsnAkChWLECntTvBRYnft7siBvVGcgU=
Received: by mx.zohomail.com with SMTPS id 1765991049795282.56409550973785;
	Wed, 17 Dec 2025 09:04:09 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 17 Dec 2025 18:03:28 +0100
Subject: [PATCH 2/4] dt-bindings: power: mt8196-gpufreq: Describe nvmem
 provider ability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-mt8196-shader-present-v1-2-f6f8f3aa1e93@collabora.com>
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
X-CRM114-CacheID: sfid-20251217_090420_735568_F95087A9 
X-CRM114-Status: GOOD (  13.73  )
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

On the MediaTek MT8196 SoC, the Mali GPU's "shader_present" hardware
register may also include a non-functional shader core, along with the
present shader cores. An efuse elsewhere in the SoC provides the
shader_present mask with the fused off core omitted.

However, the efuse address is not publicly disclosed. What is known
though is that the GPUEB MCU reads this efuse, and exposes its contents
in the memory it shares with the application processor.

We can therefore describe the mediatek,mt8196-gpufreq device as being an
nvmem provider for this purpose, as it does provide nvmem access in an
indirect way.

The shader-present child node is left out of the list of required
properties as we may one day be able to describe the actual efuse region
this value comes from, so the gpufreq device isn't necessarily the only
device that can provide this cell, and implementations shouldn't need to
implement this functionality once this is the case.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml b/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml
index b9e43abaf8a4..66fc59b3c8b4 100644
--- a/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml
@@ -74,9 +74,18 @@ properties:
   "#clock-cells":
     const: 1
 
+  "#nvmem-cell-cells":
+    const: 0
+
   "#power-domain-cells":
     const: 0
 
+  shader-present:
+    type: object
+
+dependencies:
+  shader-present: [ "#nvmem-cell-cells" ]
+
 required:
   - compatible
   - reg
@@ -113,5 +122,9 @@ examples:
                      "ccf", "fast-dvfs";
         memory-region = <&gpueb_shared_memory>;
         #clock-cells = <1>;
+        #nvmem-cell-cells = <0>;
         #power-domain-cells = <0>;
+
+        shader-present {
+        };
     };

-- 
2.52.0



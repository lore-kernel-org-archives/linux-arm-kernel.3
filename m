Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DC7E668BC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 18:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKOC4sPnmtkQ7L+JdsUlBb5Bsh8vjqzfoYmPcpjnenM=; b=Mf8Z5VIArZ1z+MjUY7JWssm3Ef
	QZAiXONorpbntXEGjjSzAJVyfXhyH2q2bqdSMWtOKB0ohGmqddn7cRX5VAGQPDNYMdJOSy6c9BThN
	eyhbGRwQd2LoL8s5NmHPnoLxT3luTBRbJ4ruZAGt2cPQnc4hbRNa6tUJguVsmh4xPxQ0ZO77b6Nnf
	RQnjzJdl2VCJhoMXDqFG/BD2YYF7luoPLh5TFj5gOuEFiWCwZzKB8mncsSjUuieC+G6Jh6iIr0YRG
	wkvHHrHonvWKfr73d1tFJybVSobHyjehlOmlJI9BrDjQ8fwufzHvnBAGVE92wrO1ZNG6eMu1wmc3S
	05lcDsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX234-0000000BoxX-0rRN;
	Sat, 20 Dec 2025 18:51:26 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX22u-0000000Bot1-0Wh3;
	Sat, 20 Dec 2025 18:51:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766256635; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RcSApAUIVHOQQ/PxKnGD95WnMzfQvGyERWSxzZMbadXIeaP0GjeVMJE1dpYqFjvkS3Z8RvxlJ+apXRiuNwoTwkS53Wzi1neqpgLaAurOwhhB2mOIPcQBiSamSZSbcytmHzi6A5P9XPkLOlDG6T07cGKdz9M3cIH2qUXimMYS9Kk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766256635; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cKOC4sPnmtkQ7L+JdsUlBb5Bsh8vjqzfoYmPcpjnenM=; 
	b=gXoPv05aAM4S9McpI7E5eUhlRoG5iRR+B6VmdOdKkSqrxNTHuxR9HuO83Tq1Wcw5ICftOPCSS22TxcMzT1VGoWSk8fUwm9F1kzyQvX6He/R9uJ67I1Z061GCevUC3vvQ1T1OPxRNmdR6WIir+XWzYGVNnkm36WA1rlGRo+9TSMQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766256635;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=cKOC4sPnmtkQ7L+JdsUlBb5Bsh8vjqzfoYmPcpjnenM=;
	b=ItW7jbSZjDFdna655b7OCzhvdzkW0QxENSTZ6BK+Jp7zm4AIrDNFQHft3sklcy7T
	2Wx+pRZtz90Eg7AZ8rLe3Q9N8YHUUf8Ie3FcC6PFyvq4aRMkz+1bXRgBo/ASAFDpj6P
	uZa6RFtTQ/4w4N+GpTwBMIYIZFAgVjr3K2j5NX90=
Received: by mx.zohomail.com with SMTPS id 1766256633664149.3015413763843;
	Sat, 20 Dec 2025 10:50:33 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 20 Dec 2025 19:49:53 +0100
Subject: [PATCH v2 2/4] dt-bindings: power: mt8196-gpufreq: Describe nvmem
 provider ability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-mt8196-shader-present-v2-2-45b1ff1dfab0@collabora.com>
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
X-CRM114-CacheID: sfid-20251220_105118_754737_EE5DE82B 
X-CRM114-Status: GOOD (  13.02  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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



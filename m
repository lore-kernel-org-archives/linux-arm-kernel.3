Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8054E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 17:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qThiX9dgU6EfBMw4/JyALTUkB2f4Eg0S/c1cw2gw+pM=; b=ciDYLTg/+Ky59hLlwPw0KJeeR8
	e+DgONLzGD5xj79tTDbtDKJ86Xw2+pmscj+fGBiyxAsnIKkg1dviKfkhMmYmAnR8uXsyUmVMB9d0l
	zstFYDWJtqDajziFq0SaMSwdBABJ5bxDmMNVvrutrNFeuxTmu/JXinJB6BPymegMehqZ95PBu6qFq
	j13Ck4yAW8gGnYqi2n45DspXGuFePdcyiqvpCdXhm+zA8yN6L7lI9QNBjm+eYu2Fzqvj640peFvJs
	02F2ZpXf2VYJLb2bHGQhzRKnCswic+fX/rSJD0AcDqg/MyqqQEgVtxvoypbudxr6YV7lSVQlqwtJu
	y0vdXWHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVa0I-00000009PTC-11Th;
	Wed, 08 Jan 2025 17:38:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZli-00000009MtI-3NMW;
	Wed, 08 Jan 2025 17:23:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25EB5A40B80;
	Wed,  8 Jan 2025 17:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263CFC4CEDF;
	Wed,  8 Jan 2025 17:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736356977;
	bh=4Ydr7yi76iazvT8hxdJ9xbcASYnOkd7PlygWZLznx94=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GDRWwEs0sFFQZz5pukUgBa5/qHIharZsVrjp1Szv1XZIYq0mcJXwXDunw7TSdJy7C
	 EWSuURzoOEzEgNYnzZCYUCbwLRVi9nR128FbshAobTXsy+1mu5xKEmPFIolpIbgC/x
	 c691CtShFY4nzDQoiNjEjgMKpFqPFZlsF0nPzQ8UQKsCSZR0rmpPP7m4qhgOFz7/tV
	 uIyKvHIV6GWw01qEuTgzpGeZxLIPZPZV8jgUMi8n++Ojqf9wm6Sgug/nZqzzEJoG2n
	 toK05X/FADFN4YwW92OsYHJp5ib0Va06sfG+pGr15t4gtkJHA1gZA0fwb8zWeasZ+1
	 jJEYP31wh0oNw==
Date: Wed, 08 Jan 2025 11:22:55 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Simona Vetter <simona.vetter@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: amergnat@baylibre.com
In-Reply-To: <20231023-display-support-v5-1-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
 <20231023-display-support-v5-1-3905f1e4b835@baylibre.com>
Message-Id: <173635697547.725897.5297567835361998238.robh@kernel.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: display: mediatek: dpi: add
 power-domains property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_092258_978770_B23C3A9F 
X-CRM114-Status: GOOD (  12.23  )
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


On Wed, 08 Jan 2025 17:15:43 +0100, amergnat@baylibre.com wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> DPI is part of the display / multimedia block in MediaTek SoCs, and
> always have a power-domain (at least in the upstream device-trees).
> Add the power-domains property to the binding documentation.
> 
> Fixes: 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml:100:3: [error] duplication of key "power-domains" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml:100:3: found duplicate key "power-domains" with value "{}" (original value: "{}")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.example.dts'
Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml:100:3: found duplicate key "power-domains" with value "{}" (original value: "{}")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231023-display-support-v5-1-3905f1e4b835@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



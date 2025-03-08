Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB766C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 19:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/73JC/lQZJdJ3xzvnS5c1g0xscrSX8ylkZ9UGc86hw=; b=R6eiC1v5RfplsBKU+Gzx+qdm0m
	g1MzD4W5UkeqPUeK9ugEr542KUGraTlCBQAeT9auOVhxaK8KKIGUaggjBR8U6LosbWgw7AXOOAX5k
	VMTRYtxAYpXT1wsz1NZYtzur2iI2xobZ0WIinmCzRzisVHO3kmgd76TH6Hhr35qQdFZtF9ezQkpmj
	IVjiOIzjHmCT+iQgqR+V6T0Hpoy6+g7W6gKy6yYK/XMT0Q2wzP4RBeL9Q4vMLX9WBiI1AkIWLK56s
	L/VKsrR3F4mCiQSXCdymo357zS+fAJ/X+Dj6RBEVwmG2sPKpskSkA+bUfoVSiA6E5p+KY5bRBIAu0
	992ESIng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr07j-0000000H7F8-20T7;
	Sat, 08 Mar 2025 19:46:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr065-0000000H79Y-1ehS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 19:44:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D89B5C61FC;
	Sat,  8 Mar 2025 19:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9C0C4CEE0;
	Sat,  8 Mar 2025 19:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741463071;
	bh=WH7ragwrHlwuij9dMvPOSWuZiuTHQ1s+svKzfPzvvuA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=riP0IyqtTT36pME2aDILYcOKdGQiC1l+NduMZWCe/7KZ6Ce4hvZVAlipLR+lqrImc
	 aE2oulRYfxV9lcv8FbAIRsJjYjwdnwzimm+AwAqMITy3lfQnyB2KwQwi9XGsYV+SFc
	 hKmB/q/QiKkncAhQQnZYUwxsR5/tpSfFfLHxMjU+E+/TKPVTubTDfGwDkKk0PVt6tD
	 JhrnL6/gKO6MTku6s0IAOfR5rVR3UlqMzQ9iHf3xSzo/xPfXQTpZgxL9+zCCpdWFWK
	 DU40utvTxgaxb0a9z3hCso1gJZQN2gMa8gFvJiT4KZWo3GIyZaqfjguvh9die/sM+f
	 0Mr9uJFA1W4gw==
Date: Sat, 08 Mar 2025 13:44:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-staging@lists.linux.dev, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Taniya Das <quic_tdas@quicinc.com>, Zhi Mao <zhi.mao@mediatek.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Ross Burton <ross.burton@arm.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Ricardo Ribalda <ribalda@chromium.org>, Conor Dooley <conor+dt@kernel.org>, 
 Ihor Matushchak <ihor.matushchak@foobox.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Eric Biggers <ebiggers@google.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Will Deacon <will@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dongcheng Yan <dongcheng.yan@intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Javier Carrasco <javier.carrasco@wolfvision.net>
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250308183410.3013996-19-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
 <20250308183410.3013996-19-demonsingur@gmail.com>
Message-Id: <174146307027.3480579.7919845264276459579.robh@kernel.org>
Subject: Re: [RFC PATCH 18/24] dt-bindings: media: i2c: max96712: add
 support for I2C MUX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_114433_521625_9ADE6E9B 
X-CRM114-Status: GOOD (  17.55  )
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


On Sat, 08 Mar 2025 20:33:47 +0200, Cosmin Tanislav wrote:
> MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
> capable of connecting to a separate serializer. If these serializers
> have the same CFG pins configuration, they will also have the same I2C
> address, causing conflicts unless the deserializer muxes the I2C
> channels. Moreover, the serializers can have the same hardware attached
> to their respective I2C bus.
> 
> The MAX96712 and MAX96724 suppot I2C channel muxing via the GMSL2 link
> to facilitate communication to each of the connected serializers.
> 
> Document this capability.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml: properties:i2c-mux:patternProperties:^i2c@[0-3]$:properties:reg:items: 'oneOf' conditional failed, one must be fixed:
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml: properties:i2c-mux:patternProperties:^i2c@[0-3]$:properties:reg:items: 'anyOf' conditional failed, one must be fixed:
		'min' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
		'type' was expected
		from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml: properties:i2c-mux:patternProperties:^i2c@[0-3]$:properties:reg:items: 'anyOf' conditional failed, one must be fixed:
		'max' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
		'type' was expected
		from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
	{'min': 0, 'max': 3} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml: properties:i2c-mux:patternProperties:^i2c@[0-3]$:properties:reg: 'anyOf' conditional failed, one must be fixed:
	'maxItems' is a required property
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'items' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml: properties:i2c-mux:patternProperties:^i2c@[0-3]$:properties:reg:items: 'oneOf' conditional failed, one must be fixed:
		/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml: properties:i2c-mux:patternProperties:^i2c@[0-3]$:properties:reg:items: 'anyOf' conditional failed, one must be fixed:
			'maxItems' is a required property
				hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
			'min' is not one of ['maxItems', 'description', 'deprecated']
				hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
			'max' is not one of ['maxItems', 'description', 'deprecated']
				hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
			Additional properties are not allowed ('max', 'min' were unexpected)
				hint: Arrays must be described with a combination of minItems/maxItems/items
			'min' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
				hint: "items" can be a list defining each entry or a schema applying to all items. A list has an implicit size. A schema requires minItems/maxItems to define the size.
			'max' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
				hint: "items" can be a list defining each entry or a schema applying to all items. A list has an implicit size. A schema requires minItems/maxItems to define the size.
			hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
			from schema $id: http://devicetree.org/meta-schemas/core.yaml#
		{'min': 0, 'max': 3} is not of type 'array'
		hint: "items" can be a list defining each entry or a schema applying to all items. A list has an implicit size. A schema requires minItems/maxItems to define the size.
		from schema $id: http://devicetree.org/meta-schemas/core.yaml#
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml: i2c-mux: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml: ^i2c@[0-3]$: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250308183410.3013996-19-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



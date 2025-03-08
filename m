Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293FAC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 20:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iK+qxew/aHth6+fTAHYmqQeBeh7PSOZTrCuujI8vl2U=; b=xFvsb68E4ATvM56PzghtY1cw0a
	b5Ykgcb1RivfTSFf6HcLpbfs8odpUZPk8SrdLaV7qvolVJNSPHyvEh7QsJEV+BgJFns9GlcmQM967
	CTDHtpPmcgrTTjgVGGdm/Xy6hQz9yUFI2fQuj5i11dCRhE8NDndf4WXz6Qt/SpuXJ+SF7RAAeCk2X
	bcgX9We3WGhGCboZFSjvgmNa1MYlO7l3JQH+tVLePVw70DtR/RkQGXVRepTX0Oo3JuTJx+l5xgoZN
	1SGTF6cn8ywkPmNF28MyBomX+EW3+ZlClxMzM306zN/nWRG957Ve7297aYRxY9nyft8SmCGdSpl95
	vyTr2L+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr14F-0000000HAmo-11yq;
	Sat, 08 Mar 2025 20:46:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr12b-0000000HAb3-0cGD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 20:45:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46A195C057C;
	Sat,  8 Mar 2025 20:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216C2C4CEE0;
	Sat,  8 Mar 2025 20:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741466699;
	bh=tr48GDVJ9ubc/rK1vy/TnLT/dYRqQiZDykt2IihIkqI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=P1Xj1YndpLOFs7ExaR6pvYlDWlE+qPPWrJ7QxlA3bHfVzpenwZMpvKPEoHxIeuNpU
	 ExfXSFO7nPJn6Lg1onodUa7yPtMuxaTkR6AX0mys/ulU/uoDgQE6XInzqOxB+a8LdI
	 Rpz7vMnvC4takNIvlOI21QQaIt9DVwY0QpGmbeeRouD8wD+Xme8t9S285wqh3997FU
	 Ezjw5TIlOaqPf2Jg2up1chPaZKHYjWse5CYy1XJ98nZISn51ZDV5ndP3yW4bG+45j8
	 Ia3qG+qqRCU9kYytyCcGG81+9Jjb+h7uF6j9hGQBaZ0heXAGGav+IgnLXhEkf1lkkr
	 /orlaFVDWc+BA==
Date: Sat, 08 Mar 2025 14:44:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Will Deacon <will@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Umang Jain <umang.jain@ideasonboard.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-gpio@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Dongcheng Yan <dongcheng.yan@intel.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 linux-staging@lists.linux.dev, Ross Burton <ross.burton@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>, 
 Eric Biggers <ebiggers@google.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 linux-media@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Ihor Matushchak <ihor.matushchak@foobox.net>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Zhi Mao <zhi.mao@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250308183410.3013996-5-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
 <20250308183410.3013996-5-demonsingur@gmail.com>
Message-Id: <174146669680.3550268.1623859001392058870.robh@kernel.org>
Subject: Re: [RFC PATCH 04/24] dt-bindings: media: i2c: max96717: add
 support for pinctrl/pinconf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_124501_266331_85B97310 
X-CRM114-Status: GOOD (  14.12  )
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


On Sat, 08 Mar 2025 20:33:33 +0200, Cosmin Tanislav wrote:
> MAX96717 is capable of configuring various pin properties.
> 
> Add pinctrl/pinconf properties to support this usecase.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../media/i2c/maxim,max96717-pinctrl.yaml     | 71 +++++++++++++++++++
>  .../bindings/media/i2c/maxim,max96717.yaml    | 16 ++++-
>  MAINTAINERS                                   |  1 +
>  3 files changed, 87 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml: properties:maxim,gmsl-rx-id: 'anyOf' conditional failed, one must be fixed:
	'min' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml: properties:maxim,gmsl-rx-id: 'anyOf' conditional failed, one must be fixed:
	'max' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml: properties:maxim,rclkout-clock: 'anyOf' conditional failed, one must be fixed:
	'min' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml: properties:maxim,rclkout-clock: 'anyOf' conditional failed, one must be fixed:
	'max' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml: properties:maxim,gmsl-tx-id: 'anyOf' conditional failed, one must be fixed:
	'min' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml: properties:maxim,gmsl-tx-id: 'anyOf' conditional failed, one must be fixed:
	'max' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717.example.dtb: serializer@40: i2c-gate: 'anyOf' conditional failed, one must be fixed:
	Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'sensor@10' were unexpected)
	1 is not of type 'object'
	0 is not of type 'object'
	Unevaluated properties are not allowed ('VANA-supply', 'VCORE-supply', 'VDDIO-supply', 'clocks', 'compatible', 'port', 'reg', 'reset-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/i2c/maxim,max96717.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250308183410.3013996-5-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



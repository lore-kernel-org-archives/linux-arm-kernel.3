Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F540D41C07
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 06:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5YdMUXgGOAF8goB3vv69jUrB8QTyxx1LopfUs1gOnU=; b=W9RZ+9qQYVk+PFA+JaalbFnmiC
	07dfcWZZEPd33eqRK8tp0UFOFe/Lpqdebsep4xan5TgXWLuoDSwbLAjmuuG5E4gWx1mqhSYbUP+yC
	KJT9SIZPqkRu29d/vN6XXOpWqUrebFqt/l6eWxV80kmbTBxGz4xf2lKrOmkhAwpX2R+tL9wUiEUhZ
	dt3r3LD9jZoiXXu7hDSzh+hWN1kwcZR66HT58pM9FNkrQt2slb5I5AZK4NS0mIpJld5he8lBjnPm+
	2hUGbd74OQMAmIs6gjSFw6ruAz8SV2KBjXjoG3ciMBgUAanhC+LUpVKY7kub6HrWzFxF6fnFRlF6B
	iqtsdXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6h6-00000005sm2-44xB;
	Wed, 13 Nov 2024 06:17:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6fI-00000005sYX-3x4D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 06:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D43C7A4029C;
	Wed, 13 Nov 2024 06:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79179C4CECD;
	Wed, 13 Nov 2024 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731478543;
	bh=GjHWsGBW2+fujolM2tMANHwifuU0meTtmmBJ4b3ZT90=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qmCQpJzd2ahwxFIOLRTrnGuJ+kFeMPsYIBS0aPzc4h3BS7MXPwxBhDuBL8P5XaAVZ
	 ABagjtywQEbi2AV19TGV+hMZuv1BAQm/m7PQ3X0xMx8RZoKhIjSZgsZR2Y2kxJlviP
	 awiL8oQ4Ow5oejzqmbTw1b1ZSiSncj/UAPO9/8WPAYy/NS0oPsBGMY3Vlgud8GBW1z
	 crzmwWXyqMqr4FtgIhDnkpiNeBkVZiK2OgEqFbei6V0tj6sgIZOAKw4NGehTYpWXZi
	 JFe8U+7qEtRnPbGFGznPKuQ12JJwPgCrsG4BE+fCaNz518ZMDIZ7pnY2xSV9Ri/qxX
	 QumlFfgbrpnSw==
Date: Wed, 13 Nov 2024 00:15:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, mcoquelin.stm32@gmail.com, davem@davemloft.net, 
 conor+dt@kernel.org, pabeni@redhat.com, richardcochran@gmail.com, 
 devicetree@vger.kernel.org, joabreu@synopsys.com, edumazet@google.com, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, schung@nuvoton.com, 
 yclu4@nuvoton.com, ychuang3@nuvoton.com, 
 linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@foss.st.com, 
 netdev@vger.kernel.org, andrew+netdev@lunn.ch
To: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20241113051857.12732-2-a0987203069@gmail.com>
References: <20241113051857.12732-1-a0987203069@gmail.com>
 <20241113051857.12732-2-a0987203069@gmail.com>
Message-Id: <173147854152.3007386.10475661912425454611.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: net: nuvoton: Add schema for MA35
 family GMAC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_221545_132071_EB54C436 
X-CRM114-Status: GOOD (  10.27  )
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


On Wed, 13 Nov 2024 13:18:55 +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 170 ++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:compatible: [{'items': [{'enum': ['nuvoton,ma35d1-dwmac']}, {'const': 'snps,dwmac-3.70a'}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:compatible: [{'items': [{'enum': ['nuvoton,ma35d1-dwmac']}, {'const': 'snps,dwmac-3.70a'}]}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'stmmaceth'}, {'const': 'ptp_ref'}] is too long
	[{'const': 'stmmaceth'}, {'const': 'ptp_ref'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'MAC clock'}, {'description': 'PTP clock'}] is too long
	[{'description': 'MAC clock'}, {'description': 'PTP clock'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.example.dtb: /example-0/ethernet@40120000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']
Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.example.dtb: /example-1/ethernet@40130000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241113051857.12732-2-a0987203069@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



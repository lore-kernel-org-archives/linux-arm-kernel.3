Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68E1CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 03:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLatmwC5DOTCzklJj+UKIGFCark+KyCO2ajmI0Q8jXs=; b=p9gF35sMn0h91AOAfuH/IUS75K
	sGlSOPsKPdrLMGhl1FEpdVmlCve6gi5ZI1+vHf1PTwe5FMsNfclWv5+Hxk7CPTMCR1KBoG8CnKARY
	QYvaf7kSHGw5pvw8P5ZrAcVg2Bf4fLVC0jW0KagLoOCuDx8KomJ1bVCc+m1Wyjno9aCgOmxPXQC5X
	DE9pJt/EUmU92XOqUpOsbJBHtMbfMyjHwfjnAr/i+a/Xfzxx/a4vQ/lBKXcelZCYOIaQDlPqSZ+in
	Ryv3J3/85vEBMmhacBVhEDhgKYaUbElAV02zoOVHKrLYbdlnevowQKdre/NxaNE1s5UhlGVTqewZ6
	czUTcdpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC8Ou-000000088o1-18Hg;
	Fri, 24 Oct 2025 03:23:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC8Os-000000088nt-1WAb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 03:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CFA9601DE;
	Fri, 24 Oct 2025 03:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10ABC4CEE7;
	Fri, 24 Oct 2025 03:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761276212;
	bh=CNwnT8O4JG4Ottnhbl1cNUX0P6pAoK8TTMrHAWFkULg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=PAZW1d9nE4BKbSDO5YSLJIHFY7fvvq7/qb+KsjUsGRLmxi56jdxvmOARnYJv4d2ld
	 Ic/xOGBjxwDNwmiwJ7cwI4V+apON+qMOt3p6cSvOAfiZ8jtjp0hXvhPBg0AM77I1zp
	 g6i8gpSAFD7DosiR9Fi+RdTt41wplPyJOLqBMx3xzyWe4tOmA43TExpxPsd4IS8kb2
	 ffQAI4FNvAT46dKsdBSkShyj3Tac9+wpugnoPlwOkCefGTwchZzYXux2HTezbtbDFb
	 cD2F6SLTQmqfuVuj5vCgghi+8YZx5WXGvZntDmaWeqh9aFw3ZihEuSB6O7yksVD5ou
	 igWnqilxSCITA==
Date: Thu, 23 Oct 2025 22:23:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Eric Dumazet <edumazet@google.com>, Chen Wang <unicorn_wang@outlook.com>, 
 Yao Zi <ziyao@disroot.org>, linux-stm32@st-md-mailman.stormreply.com, 
 Longbin Li <looong.bin@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, Han Gao <rabenda.cn@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
In-Reply-To: <20251024015524.291013-2-inochiama@gmail.com>
References: <20251024015524.291013-1-inochiama@gmail.com>
 <20251024015524.291013-2-inochiama@gmail.com>
Message-Id: <176127621096.199631.1552825919177332173.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy
 mode restriction
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


On Fri, 24 Oct 2025 09:55:22 +0800, Inochi Amaoto wrote:
> As the ethernet controller of SG2044 and SG2042 only supports
> RGMII phy. Add phy-mode property to restrict the value.
> 
> Also, since SG2042 has internal rx delay in its mac, make
> only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/net/sophgo,sg2044-dwmac.yaml       | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml: allOf:1:then: 'anyOf' conditional failed, one must be fixed:
	'phy-mode' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251024015524.291013-2-inochiama@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



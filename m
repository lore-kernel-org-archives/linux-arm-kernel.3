Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F19CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 09:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvbsYw1GNBXDchxmmmI8ELch/9UwxqfEqARzxWrU+6w=; b=vc5xWRIq+Wanu3lStomZuGbBdv
	bhiA13SyUcq8XQ+iB/C+wi3QyQknEU+jce/1RYWYLTu8QJYYlNbrFbvPhWdQGNwnCU8BPOij6ANch
	xPDRWYGfiSxhFc7PWcpmkSPK87q01W2aJturKmb34OaQ1OtxAGSiUsoHKwmpiwYhgJ1zizL+wWT4o
	pSAcx8zWKDAUFQ4pMjpLUs0czEKjoND47CyWBbbxn9vOeMlq4PXHciXOnSD92xTEz0Kh/cb+RCI/E
	xZMFldvIkFZWTFrvF5pznZFyUjT9cqW7+8ymeP5mGrG3hqePpZNyEAIKT/U8fHHJfR9rHtOwSdmT7
	jmnCf2pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPH9U-00000001QCZ-22cC;
	Sat, 29 Nov 2025 09:22:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPH9S-00000001QCJ-44jj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 09:21:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC07160198;
	Sat, 29 Nov 2025 09:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FCCC4CEF7;
	Sat, 29 Nov 2025 09:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764408117;
	bh=AIxxNjxm6vN2BypuJM4xQOvaeA8Px9VqpKHLawNEZvU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aAgQ3lLFLxRHg3pJxjAUFy40/C4MSJrVqeTy6tnea0wIFCbgzNQqtps8cK/yTUiLR
	 gKk8KimzUZMK/fZ+oLuWiKbbnze1K3GgbUtji+qIxtX+aS4phuHC/cW1jzBkUOuJ/1
	 s6nQpd9J/6QsOMYlD63YkVCpJBRGosIi9CNUSvdWm/IU81BdXPThfGfRJtAws6CO9/
	 O01VU3Rsct7KHsMTSn9Qm4ovTnTmWjh5hdpokxgGEL1fI1Xgpja0IooFuLpG45WJh4
	 MuuHVqngEJHIyj1ZeHabmXokrXQ2cnqMwbPlDcfDAMcmmUIlL2OuBlMnmzV1VDFHbp
	 k+tZx1WwMfpdg==
Date: Sat, 29 Nov 2025 03:21:55 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>, mwojtas@chromium.org, 
 netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, 
 Herve Codina <herve.codina@bootlin.com>, Eric Dumazet <edumazet@google.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-arm-msm@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, davem@davemloft.net, 
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>, devicetree@vger.kernel.org, 
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, 
 =?utf-8?q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>, 
 Tariq Toukan <tariqt@nvidia.com>, 
 =?utf-8?q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Simon Horman <horms@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20251129082228.454678-2-maxime.chevallier@bootlin.com>
References: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
 <20251129082228.454678-2-maxime.chevallier@bootlin.com>
Message-Id: <176440811455.3523222.6418355134728802633.robh@kernel.org>
Subject: Re: [PATCH net-next v21 01/14] dt-bindings: net: Introduce the
 ethernet-connector description
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


On Sat, 29 Nov 2025 09:22:13 +0100, Maxime Chevallier wrote:
> The ability to describe the physical ports of Ethernet devices is useful
> to describe multi-port devices, as well as to remove any ambiguity with
> regard to the nature of the port.
> 
> Moreover, describing ports allows for a better description of features
> that are tied to connectors, such as PoE through the PSE-PD devices.
> 
> Introduce a binding to allow describing the ports, for now with 2
> attributes :
> 
>  - The number of pairs, which is a quite generic property that allows
>    differentating between multiple similar technologies such as BaseT1
>    and "regular" BaseT (which usually means BaseT4).
> 
>  - The media that can be used on that port, such as BaseT for Twisted
>    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>    ethernet, etc. This allows defining the nature of the port, and
>    therefore avoids the need for vendor-specific properties such as
>    "micrel,fiber-mode" or "ti,fiber-mode".
> 
> The port description lives in its own file, as it is intended in the
> future to allow describing the ports for phy-less devices.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../bindings/net/ethernet-connector.yaml      | 57 +++++++++++++++++++
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251129082228.454678-2-maxime.chevallier@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



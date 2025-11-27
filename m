Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E94CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 18:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56vV8EX01qyTPnZr1fBUtjefZdHPRpt7pDX/8CxfMAQ=; b=eemIcCSjtZ/15EnN5+v27VuTvO
	uxtIs0Wc7z5jhppgbpHlUlgYOHluAD1ssrLQN5GdP0WLuZ8d+UWp+ClXyGipVCGJ8gO3AZ6PhVzfC
	m5+96ARTCnb5zoDqXsU1amfaw6OhPKEhCjef34F5Nva4Bcd92+vH9e8qHV/N8+REKR8q4oRChRpC3
	XbfVMe/UKKFhD3lbtZFoqhJcl+dNwwru/N07ZyA+7+xksp4kPuovgiNqsVQwJpejwrZm5rhzG6o8/
	KqMOykdEZWUj7I1kRocRaarQubx6a8ttuZ18PylKl/JwN9oBoQ38VXDeF219PCVyTfw4ZYgBGmOqd
	Ft6AZAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOgXd-0000000H3ov-2xFM;
	Thu, 27 Nov 2025 18:16:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOgXc-0000000H3oj-0m22
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 18:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A14560172;
	Thu, 27 Nov 2025 18:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76AEC4CEF8;
	Thu, 27 Nov 2025 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764267387;
	bh=RflXuShl1SRrOVIWtn7ZMy5clte/Mu7DfNNyZaXZk10=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=j4GL01QeOprmmJSFmPd2dZFMiM0pK6izCKVWFTOE++RtSa0S5Lf2PeduLh5wH5U1v
	 8PbfXD9YuMGE0twIhs/58Hkoh3gmWEEKT5mNJTajY5lxJ6nsYaVzW+j44krTJ0+aeX
	 //l6AyVF44R0mYell3wFGt6lieXoB9Fl/liAl8epT/guyO40whCtTRga1ogkFAqZsO
	 GGhUeDt2tlWXchuVtmsqaM2WgLp7dg4rqRHw/leCmWo7+QTbc3TZ3jJwKSflyIsh8j
	 L0ukfXmx2mAgSIyeUPrqjE03Wi1zPl6vSZNQvHzhgFb1GYkMIlCZzrXiNYKW2l44sb
	 +gKNhGghLsOkQ==
Date: Thu, 27 Nov 2025 12:16:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, davem@davemloft.net, 
 Daniel Golle <daniel@makrotopia.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, mwojtas@chromium.org, 
 Antoine Tenart <atenart@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>, 
 thomas.petazzoni@bootlin.com, Russell King <linux@armlinux.org.uk>, 
 Simon Horman <horms@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Eric Dumazet <edumazet@google.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 devicetree@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20251127171800.171330-2-maxime.chevallier@bootlin.com>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
 <20251127171800.171330-2-maxime.chevallier@bootlin.com>
Message-Id: <176426738405.367554.14295793625592890396.robh@kernel.org>
Subject: Re: [PATCH net-next v20 01/14] dt-bindings: net: Introduce the
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


On Thu, 27 Nov 2025 18:17:44 +0100, Maxime Chevallier wrote:
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
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251127171800.171330-2-maxime.chevallier@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



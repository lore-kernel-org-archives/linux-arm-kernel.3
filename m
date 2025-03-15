Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5364BC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 17:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dr+at3MIXIUoL+5SQHgPYKX+5wYXnZaEouretQYfAM=; b=oO12AiLfTuOuLGnI/NFuT2CvPr
	s5uuZlwVQ3BMAl84Jvo8FC4yBRoUxX9PCHPEnguMdiCM+J5iMyRpa7s++ZJzuPnQz9Z9PS+v0Eb+s
	yznd4ffhD/MKCsYrWY2hgXU3GIOS5Bd8NXGHN2WEoT67lC8IewHR/JIcOtmxHWS08+RloPCYgwOhh
	SW88Vbfn0615/0NwCY4otj8tp7GY6Zq0qj/6Pi6TPjtxZrkwlClrNPGUCuz4LTQQcMcEe+WUVVn+E
	nNG9gGVZgYbflgOMj6sV6Ft5Fjh4m5Fm8CU+DtJf2US+Q1gnZoXddlKKesJUMvf6pXYKDUNmtI1QK
	UM00orNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttV5E-0000000GdKk-1ywy;
	Sat, 15 Mar 2025 17:14:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttV3Y-0000000GdDb-1Pwh;
	Sat, 15 Mar 2025 17:12:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67C9DA48B35;
	Sat, 15 Mar 2025 17:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD39C4CEE5;
	Sat, 15 Mar 2025 17:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742058734;
	bh=TAGSXpXNt+/x3uk6tc75dLbGfKv+LBmzv0BZheJ4OhM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KQOVZk/fN4mnPBUj7zObUCAOTzYH07FpvRS3NiGw9KhKmckav2nGnZhFSviF70S38
	 ABS77iPHzZUpfeBHw/nlquL0mh46+LeVPnHYUm3hOctvdBFGn0DB/K10VXtTH8OlkF
	 OQKk+fXxSLi4mfOyyc0ADd7BelPfMpHgGdEutvvPvnqn4UwZ0R0EZYKHVF3z9DgF8E
	 w22GOdJjzJf63TyoynEIyfUbLz0HMcmZzgTKBK2HSLVnNJwty6ZqSAYwvdNLfbsNAw
	 uw43pONGXMZjQTUcRH+keLJ2OUcx7GkCW1R3BiZFRdKslGCo55wZmIfzY2PLlgEZUz
	 viaus37Bpynvw==
Date: Sat, 15 Mar 2025 12:12:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Russell King <linux@armlinux.org.uk>, Vladimir Oltean <olteanv@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org, 
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
 upstream@airoha.com, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eric Dumazet <edumazet@google.com>, Lee Jones <lee@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250315154407.26304-6-ansuelsmth@gmail.com>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
 <20250315154407.26304-6-ansuelsmth@gmail.com>
Message-Id: <174205873356.67148.10337205475865865960.robh@kernel.org>
Subject: Re: [net-next PATCH v13 05/14] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_101216_505737_93327A2F 
X-CRM114-Status: GOOD (  12.13  )
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


On Sat, 15 Mar 2025 16:43:45 +0100, Christian Marangi wrote:
> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> 
> It does also support i2c and timers but those are not currently
> supported/used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/mfd/airoha,an8855.yaml           | 182 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 183 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: phy@1: $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: phy@1: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: phy@2: $nodename:0: 'phy@2' does not match '^ethernet-phy(@[a-f0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: phy@2: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250315154407.26304-6-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



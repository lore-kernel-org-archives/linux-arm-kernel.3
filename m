Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102BF107BCE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 23:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpaoXKN/PhCDZbMULkXq5SI6iDryty02Pl6Bw8fIN34=; b=u/t0UOGBLD/VjCdpZza7PiaEmP
	00V9SrFiPYZiJSMfctF4zcb1kIj4GWiIUghag9lZgUzVx3sWeoXo+3B64EZ0wwnVfTsZyLaK0A8Qa
	r4EkhJD3ZiHa+w+31dkJmpMfwsHSenoABPktqUuiYT0wV7f4OsPAtpWRFvD41ZlfRqg9Z5qL7MYIk
	ER6bmJJ3LOPQc0M1NJBxRN08WbUqGdYeY3oaijKgWkYYUtjlnp4BvqndnuVxfsb1BRG+xvTJJNUvs
	t4lGKq3PYDvjEC/ePYYBfHGEmtl2TiFJEWzemt4MEu/ULjKZoyIgjsorMFtc2FrMcvhyvXLS0F+Ff
	bPH4BpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Box-00000001Jbk-0NiE;
	Fri, 13 Mar 2026 23:21:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Bou-00000001JbE-3DER
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 23:21:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17EB7435E7;
	Fri, 13 Mar 2026 23:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0F5C19421;
	Fri, 13 Mar 2026 23:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773444087;
	bh=K0MwS09dQ1FesouGXSEQMZwoJn+bXck8mb7B9eGY9PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CUA3BHENTCO2/8OpmA3fhIz4IpKY34WfNmtQuCpCcMZWtzNE54vhGCjTdx9AX+zFl
	 a0rjFZG33yC1qgp80l/Gb4AQodxRLwDMV7gu1kfjvdu916/jGRmk81bll8octDidUm
	 PqPhCWBmsgpmzNgHa3oVOvA4ZYLuEVkXhJb9MNS6dv8k0KHb/Ygiit1OP72nEVch85
	 pzh7f2mZ7r6SKN6qPAxubHSs9pwxpYQjdH2wWxfNMgPm5xTUVMUEFielRF6yktLTGk
	 6KYpxSlliMHhj6Zu0bD9/0ftA5JF0RbNE2s7n59C2iFSJoQLXW3APjj+J8FuIRvx50
	 gMbzlcF6SwfyQ==
Date: Fri, 13 Mar 2026 18:21:25 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: jk@codeconstruct.com.au, andriy.shevchenko@linux.intel.com,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v26 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
Message-ID: <20260313232125.GA3618633-robh@kernel.org>
References: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
 <20260309-upstream_i2c-v26-2-5fedcff8ffe8@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-upstream_i2c-v26-2-5fedcff8ffe8@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_162128_842266_3795F24B 
X-CRM114-Status: GOOD (  23.31  )
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

On Mon, Mar 09, 2026 at 02:53:53PM +0800, Ryan Chen wrote:
> The AST2600 I2C controller supports three transfer modes (byte, buffer,
> DMA). Add "aspeed,transfer-mode" so DT can select the preferred transfer
> method per controller instance. Also add the "aspeed,global-regs"
> phandle to reference the AST2600 global registers syscon/regmap used by
> the controller.
> 
> These properties apply only to the AST2600 binding and are not part of
> the legacy binding, which uses a mixed controller/target register layout
> and does not have the split register blocks or these new configuration
> registers. Legacy DTs remain unchanged.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../bindings/i2c/aspeed,ast2600-i2c.yaml           | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> index de2c359037da..323e4f9b290a 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> @@ -37,6 +37,33 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  aspeed,transfer-mode:
> +    description: |
> +      ASPEED ast2600 platform equipped with 16 I2C controllers each i2c controller
> +      have 1 byte transfer buffer(byte mode), 32 bytes buffer(buffer mode), and
> +      share a DMA engine.
> +      Select I2C transfer mode for this controller. Supported values are:
> +        - "byte": Use 1 byte for i2c transmit (1-byte buffer).
> +        - "buffer": Use buffer (32-byte buffer) for i2c transmit. (default)
> +                    Better performance then byte mode.

Good, I like worse performance so I can use byte mode.

> +        - "dma": Each controller DMA mode is shared DMA engine. The AST2600 SoC
> +                 provides a single DMA engine shared for 16 I2C controllers,
> +                 so only a limited number of controllers can use DMA simultaneously.
> +                 Therefore, the DTS must explicitly assign which controllers are
> +                 configured to use DMA.
> +      On AST2600, each controller supports all three modes.
> +      If not specified, buffer mode is used by default.
> +    enum:
> +      - byte
> +      - buffer
> +      - dma

This is not required, so what is the default mode? If there's a default, 
you don't need the default value in the first place as the default is 
the property omitted.

> +
> +  aspeed,global-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle reference to the i2c global syscon node, containing the
> +      SoC-common i2c register set.
> +
>  required:
>    - reg
>    - compatible
> @@ -59,4 +86,6 @@ examples:
>          resets = <&syscon ASPEED_RESET_I2C>;
>          clock-frequency = <100000>;
>          interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +        aspeed,global-regs = <&i2c_global>;
> +        aspeed,transfer-mode = "buffer";
>      };
> 
> -- 
> 2.34.1
> 


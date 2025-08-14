Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32D0CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 22:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIFp7ebVwT9oleEhOGII0IqB6tGpNR9cpd6TYV5Jql0=; b=zeNuZnfbo7YHT7smS8Tpykc0AH
	V2n8oFlCQpxsLhexGmmr4aEE3D+TqHNfPcPgqHXprdJXCgKmoCzlqmNHe5nD/PJA5UiT8/tfm4f01
	VDSqSLONoR4TpY4BLbgkfY+5vu//tUkERavVgxXYLyAgh3HNovHm4+bB27zVLMDvNowmsLtwsvrKN
	G2p4WfulM1QWRhiwLBxQkKW10fBnWvLRP1drdJg9cn9EZV2iSLr28YP/AA1JTUdSH0/NlB0ARiWrb
	DjyShuoad+GOEsS/CnAGjYS6r9NCzj1RHDMQKA+nL+zqfCpECJrWukXfwUE4OlPVpGMa9CVQDv3bA
	bv8Lt5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgVo-00000000gNk-1zAC;
	Thu, 14 Aug 2025 22:33:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgTF-00000000gFJ-3XST
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 22:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D4D945C0A;
	Thu, 14 Aug 2025 22:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6FBC4CEED;
	Thu, 14 Aug 2025 22:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755210653;
	bh=N5VWGitysz6JFmoe9n2FhghAKkO8HINQCHJY2U2kRIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c8NZu8Q23AcSpDXYfCjfS+nijpycYbRazO8ud7muK7v/NQSmnieFRpVKZ9HpE+Se3
	 ihK/DheTyy0oiRrb1M1422BzweCx9GFLH23gWJEy8hhRFRngUNMiGhj74MtotNPhtF
	 yqrUOurUhDDUC58YxblyH88j6+KNNTcK/igm+HoklMSc/qyxQ5KQz0I5OYmUnqEyQb
	 hSHC3P59PHrQpHRwdNhYBEJf+FY2XgcEMPuuTzqg6Z4f866bnKk9VJKWj+onG9pmFj
	 gWnmU3joyDUmkrHXStOUAiu75Y3Os4fO4BMRMQVIFbAidL1DN8rkqKZOMOECpHF6et
	 Ltq0O6AyGRRpQ==
Date: Thu, 14 Aug 2025 17:30:52 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
Message-ID: <20250814223052.GA4004307-robh@kernel.org>
References: <20250814084156.1650432-1-ryan_chen@aspeedtech.com>
 <20250814084156.1650432-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814084156.1650432-2-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_153053_928044_6C49F012 
X-CRM114-Status: GOOD (  27.89  )
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

On Thu, Aug 14, 2025 at 04:41:54PM +0800, Ryan Chen wrote:
> - Add property "aspeed,global-regs" to get phandle set global
> register, for register mode selection and clock divider control.
> - Add an optional property "aspeed,transfer-mode" to
> allow device tree to specify the desired transfer method used
> by each I2C controller instance.
> - Update example to demonstrate usage of 'aspeed,global-regs' and
> 'aspeed,transfer-mode' for AST2600 I2C controller.

All of this is evident reading the patch. Explain here why you need this 
change.

> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index 5b9bd2feda3b..2a9f7d1d2ea1 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -44,6 +44,34 @@ properties:
>      description: frequency of the bus clock in Hz defaults to 100 kHz when not
>        specified
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

If no 'aspeed,transfer-mode' property defaults to buffer mode, you never 
need 'aspeed,transfer-mode = "buffer"'.

When would you ever use "byte" mode? Sometimes you want worse 
performance? That makes no sense.

I feel like we already discussed this, but I'm not going to dig thru 17 
versions to see.

> +        - "dma": Each controller DMA mode is shared DMA engine. The AST2600 SoC
> +                 provides a single DMA engine shared for 16 I2C controllers,
> +                 so only a limited number of controllers can use DMA simultaneously.
> +                 Therefore, the DTS must explicitly assign which controllers are
> +                 configured to use DMA.
> +      Only one mode can be selected per controller.

The only thing that really makes sense is dma, and you need 1 boolean 
property for that. IOW, what you had on v10 which we gave reviewed-by 2+ 
years ago.

Do you have any actual test results or usecase that show DMA is useful 
here? Typical I2C xfers are not streaming large amounts of data to 
justify the setup costs of DMA. It wouldn't surprise me if DMA was 
actually slower.

> +      On AST2600, each controller supports all three modes.
> +      If not specified, buffer mode is used by default.
> +    enum:
> +      - byte
> +      - buffer
> +      - dma
> +
> +  aspeed,global-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |

Don't need '|'. Read the documentation about when it is needed or not 
needed.

> +      The phandle of i2c global register node, For control the i2c register
> +      define selection, clock divider mode selection and clock divider control.
> +
>  required:
>    - reg
>    - compatible
> @@ -66,3 +94,14 @@ examples:
>        interrupts = <0>;
>        interrupt-parent = <&i2c_ic>;
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c1: i2c@80 {
> +      compatible = "aspeed,ast2600-i2c-bus";
> +      reg = <0x80 0x80>, <0xc00 0x20>;
> +      aspeed,global-regs = <&i2c_global>;
> +      clocks = <&syscon ASPEED_CLK_APB>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +      aspeed,transfer-mode = "buffer";
> +    };
> -- 
> 2.34.1
> 


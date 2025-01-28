Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49384C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 15:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjqgFFO124IcKFOq1UgR0It6ei0pGEta9DU5EVqtK6w=; b=wEVvhGaegmnyI1FK+8jg4N6mjg
	fqA45PdwiLTY+3EfWkRtLO0Y1MoQcyjcunwMna03287DklcN5iJbtZBp76yPjyCE68SfBuM0qC3eO
	JAn+JVIxN4Ljl5VsHNZ8g5NQBtoyn8jUCMoqIukJ4t2oMkoCR6IW4IyloOvTbfuo2R4jKHbE16/wU
	lowqbYc947y6DWm/r2iQ+9ZMNTi6Libwavc5VuoihylRnEl+7qw/gJYk3drVrTEqkxONPrInDGYPa
	vEKraidU3UTp8tKc5g2z2UUo0LSzb7/VaFymfzl+vhz2X9uCchA71qo2R0DNYWrfblgyz5MEnJlcl
	jUeE5fww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnnt-00000005BuR-20BB;
	Tue, 28 Jan 2025 15:47:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnmX-00000005BdE-3NoC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:45:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3970A40E79;
	Tue, 28 Jan 2025 15:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE9EC4CED3;
	Tue, 28 Jan 2025 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738079139;
	bh=y5fiGOpqHsjA5txZTC792Ta1uJ8fD21vvbxKBCkhSwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPoFvl2FNra+3ckqpvLYQ20USwf3/15iHNEjTckFICgs2tuHlAlYKYTP0rkMEset1
	 +7+d+0SHBn/GgPvU5ceG5sebvE0j3K0cciKjUD7+tEYR9qYWc8cGOw4Wc2hpb3uWFv
	 iC8P+SoIQItyVKJQPgU8T/w50bAnmdh9z6/9GfdBExaxHwPFY5o/rXUy0qs12oU2J3
	 KmQimFQVwb9+qvwfBqDMGKa7BVNhEABtAkKzYVMTwNHARi2lO2FhRJzKBPH3FcXTXK
	 Ef0TAu9UF2NFaBmsbEJx01KpyWggysiT2/b7kqNKivKBCWXnxUpgkRZ2FDcqNnyM6b
	 nYAR8cq2vDu1A==
Date: Tue, 28 Jan 2025 09:45:38 -0600
From: Rob Herring <robh@kernel.org>
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, conor+dt@kernel.org,
	richardcochran@gmail.com, mcoquelin.stm32@gmail.com, andrew@lunn.ch,
	alim.akhtar@samsung.com, linux-fsd@tesla.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, alexandre.torgue@foss.st.com,
	peppe.cavallaro@st.com, joabreu@synopsys.com, rcsekar@samsung.com,
	ssiddha@tesla.com, jayati.sahu@samsung.com,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com,
	gost.dev@samsung.com
Subject: Re: [PATCH v5 1/4] dt-bindings: net: Add FSD EQoS device tree
 bindings
Message-ID: <20250128154538.GA3539469-robh@kernel.org>
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102725epcas5p44b02ac2980a3aeb0016ce9fdef011ecf@epcas5p4.samsung.com>
 <20250128102558.22459-2-swathi.ks@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128102558.22459-2-swathi.ks@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074541_971840_D5745249 
X-CRM114-Status: GOOD (  14.82  )
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

On Tue, Jan 28, 2025 at 03:55:55PM +0530, Swathi K S wrote:
> Add FSD Ethernet compatible in Synopsys dt-bindings document. Add FSD
> Ethernet YAML schema to enable the DT validation.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> Signed-off-by: Swathi K S <swathi.ks@samsung.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  5 +-
>  .../bindings/net/tesla,fsd-ethqos.yaml        | 91 +++++++++++++++++++
>  2 files changed, 94 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 91e75eb3f329..2243bf48a0b7 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -103,6 +103,7 @@ properties:
>          - starfive,jh7100-dwmac
>          - starfive,jh7110-dwmac
>          - thead,th1520-gmac
> +        - tesla,fsd-ethqos
>  
>    reg:
>      minItems: 1
> @@ -126,7 +127,7 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    maxItems: 8
> +    maxItems: 10
>      additionalItems: true
>      items:
>        - description: GMAC main clock
> @@ -138,7 +139,7 @@ properties:
>  
>    clock-names:
>      minItems: 1
> -    maxItems: 8
> +    maxItems: 10
>      additionalItems: true
>      contains:
>        enum:
> diff --git a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
> new file mode 100644
> index 000000000000..579a7bd1701d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/tesla,fsd-ethqos.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: FSD Ethernet Quality of Service
> +
> +maintainers:
> +  - Swathi K S <swathi.ks@samsung.com>
> +
> +description:
> +  Tesla ethernet devices based on dwmmac support Gigabit ethernet.
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    const: tesla,fsd-ethqos.yaml

Humm...


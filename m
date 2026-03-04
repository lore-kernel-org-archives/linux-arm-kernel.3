Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC72EB7EB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlMO+SrLvKXLrTQ13wmPBK/JydgvU5DnJnBAn/ncXjg=; b=ke7EuNZD+TLGMmBrfwRSiStdTc
	yIn7sQcWkX0y3w3GwHDn2KLpg9artJHwiKPMVL7dtzVxVhGB2+v5NOGO87ZqIC0nvPcg+OJ5a2BiO
	V7ZESwg55MK6ncfsgr1c8xf2oNMypNS5UbpEhVkuD/I5LVdu8ULib6egUg6EMwkM3fS+8qlmdvjkq
	/ipmbZ4hygpaGiQE8Vm7oqo9DSiJDEDK8jcnLNlgZYjAIbgwhH/v/kD3bptUkspnUjg76KomEzFWr
	13eaAGqHLEp0KsF1Z+OLP2HI8ps4FZhPFESZsfdPA2agVA0Jt8tOvBzO0N23r1ioV6QmnrJP0scij
	jEynTxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhqF-0000000Glbw-0liX;
	Wed, 04 Mar 2026 08:44:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhqC-0000000GlbQ-0KUS;
	Wed, 04 Mar 2026 08:44:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43B7E4391E;
	Wed,  4 Mar 2026 08:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98119C19423;
	Wed,  4 Mar 2026 08:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772613863;
	bh=bJ5oHMvnEDqSRR/kfjx4LrLT56zcOOAt+qoZ/KCobTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ExQv6fcUjaxXCqkb10ek6GOSiyT8xcIBKgqmQrOlEenEjB9c8BZquWvtJQrBMMJxR
	 9SIsFZSNgO/9yv41Kogy3NSU+q7mZKq5+9Xw0ItZcmAX0QgYWIG3uOaRu74UIHRzP7
	 X5aDeGBqLkhnodHuYnxJN1qxxDJ5X2OrWfK1KB4pxTuP5jyh2u/IgX3JobvmmL/Xkt
	 xueWhr9XiE3PThGwYhvvDFEExh+0PUCTDeZ+C6fKYAz9gKddW5rUGHrZptFJGbdeWg
	 zQ0kSrzrxmBMT6IL4WYaFjoMOYbavyFWvrfsR3Jf+nPMV885MSblPtMjFZSq+l4TN6
	 t22/DuEv9Wq4A==
Date: Wed, 4 Mar 2026 09:44:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, ryder.lee@mediatek.com, 
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	nbd@nbd.name, ansuelsmth@gmail.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] dt-bindings: phy: Document PCIe PHY in EcoNet
 EN751221 and EN7528
Message-ID: <20260304-proficient-coati-of-lightning-df2cab@quoll>
References: <20260303190948.694783-1-cjd@cjdns.fr>
 <20260303190948.694783-4-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303190948.694783-4-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_004424_180720_907EC980 
X-CRM114-Status: GOOD (  18.63  )
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

On Tue, Mar 03, 2026 at 07:09:43PM +0000, Caleb James DeLisle wrote:
> EN751221 and EN7528 SoCs have two PCIe slots, and each one has a
> PHY which behaves slightly differently because one slot is Gen1/Gen2
> while the other is Gen1 only.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../phy/econet,en751221-pcie-phy.yaml         | 57 +++++++++++++++++++

Why are you mixing multiple subsystems in the same patchset? That's
like three or four different ones. Don't, just make it difficult to
apply pieces and understand the dependencies.

>  MAINTAINERS                                   |  6 ++
>  2 files changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
> new file mode 100644
> index 000000000000..8e1d3c791c6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/econet,en751221-pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: EcoNet PCI-Express PHY for EcoNet EN751221 and EN7528
> +
> +maintainers:
> +  - Caleb James DeLisle <cjd@cjdns.fr>
> +
> +description:
> +  The PCIe PHY supports physical layer functionality for PCIe Gen1 and
> +  Gen1/Gen2 ports. On these SoCs, port 0 is a Gen1-only port while
> +  port 1 is Gen1/Gen2 capable.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - econet,en751221-pcie-phy0
> +      - econet,en751221-pcie-phy1

What is the difference between phy0 and phy1? This must be explicitly
explained in the description.

If phy1 means "port 1" (although first sentence disagrees, because it
says that THE SAME phy supports two ports), then the names aren't -gen1
and -gen2? Or what are other differences?

> +      - econet,en7528-pcie-phy0
> +      - econet,en7528-pcie-phy1
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#phy-cells'

Use consisent quotes.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/phy/phy.h>

Where do you use it here?

> +    soc {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      pcie_phy0: pcie-phy@1faf2000 {

Drop unused label.

> +        compatible = "econet,en7528-pcie-phy0";
> +        reg = <0x1faf2000 0x1000>;
> +        #phy-cells = <0>;
> +      };
> +
> +      pcie_phy1: pcie-phy@1fac0000 {
> +        compatible = "econet,en7528-pcie-phy1";

Drop node, same as previous one.

Best regards,
Krzysztof



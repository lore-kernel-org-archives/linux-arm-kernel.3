Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E94BC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRvAwLbNIssG674AaLjZhtPbGgHizEjSnBjeusKXP4A=; b=Js0APG6VccyvlxQhOsCdb3Ra5v
	a890h40mdAwhFKbjzBip1CMKZ9k2QImVOxFmw2+Rl0NDegjI3PSat+JtTDse5hdIquSFcFljEstQT
	OFr9Ax7EHDcvHRVaH2cYGlgrApSQ5/FhidW+ptgM8Q1ACcTv4FhjbkV/vjcLJdKtoebAnZ9CjvGwI
	UcioE+suPi1DEr7wFrfv/8kXbIvCk6U/ys0m36m1AETRphzWqPokTzCg3zVubFlnqHuRsobmaLHBb
	TqpIEZ0Wvn6yqavQ3KQ4RiFrlMtjkIbd8WQpWt2D9jnDPJizY2cAZdQS7vCYVUTgpYmVPtCeCP4RI
	1T7Ad1KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2tY-00000001cOl-2VUe;
	Tue, 25 Feb 2025 21:55:16 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2q8-00000001bmK-3p1v;
	Tue, 25 Feb 2025 21:51:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1740520299; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kKpnwqL23qM255LDU7Kavm53nW5Sfsv/fiQCAMwjmhozGaXDh7gBbsN9XV69BvD6VHGdGdEkZkeyFYWoLaP4atl3j/FIjpWs0d+lVnOCAwEc97uub9MJN/I09m+xxNzZTY0OmJl9BPrCczZa0ZXqPP0PcgCitsOKJgySg89juXg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740520299; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gRvAwLbNIssG674AaLjZhtPbGgHizEjSnBjeusKXP4A=; 
	b=fs+RxRi3Dx1sHjH3ffMThzrKwCOhtPiwvTQivQx2+Z529hEKvHYDy1jDf8rhm+BcGKExafSCqrYxWUro1u56H5MN6hR8SSq1ODuVrMyiULEfAuS4tJ3HQubuICV12icDr8GlxDsAqkjm2e66Q59TtH3YEDH6hgds9JIAR/cIBhc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740520299;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=gRvAwLbNIssG674AaLjZhtPbGgHizEjSnBjeusKXP4A=;
	b=UPaipt5FnYaXKMPGeTGt2rQC6zrZWqvGss4ZULEqjqnAGwnkZnI2V6v1+As+pYHY
	bIzMtKbGkmY9HBgFN8HH10TVpf2bd8I28HVXoAOVgEQsJfe+arrBfO/8ThHTptes9KD
	aufIe8euQL5DeFgPEduRo4PN+0vzMvozv1VVFIdk=
Received: by mx.zohomail.com with SMTPS id 1740520296039872.1712499063477;
	Tue, 25 Feb 2025 13:51:36 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 040DF18040A; Tue, 25 Feb 2025 22:51:31 +0100 (CET)
Date: Tue, 25 Feb 2025 22:51:30 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Simon Xue <xxm@rock-chips.com>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/2] dt-bindings: PCI: dw: rockchip: Add rk3576 support
Message-ID: <jzxf7a7xm4xm5yjgim2sqmxuvmtjrqupps3mnwvhbzimsu6zdk@75fyzct43n3e>
References: <20250225102611.2096462-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225102611.2096462-1-kever.yang@rock-chips.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_135144_987257_435AF9EC 
X-CRM114-Status: GOOD (  22.48  )
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

Hello Kever,

On Tue, Feb 25, 2025 at 06:26:10PM +0800, Kever Yang wrote:
> rk3576 is using DWC PCIe controller, with msi interrupt directly to GIC
> instead of using GIC ITS, so
> - no ITS support is required and the 'msi-map' is not required,
> - a new 'msi' interrupt is needed.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---

You should either drop my Signed-off-by or add

Co-developed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Both options are fine with me, but the current one does not make
much sense :)

Greetings,

-- Sebastian

> 
> Changes in v7:
> - Move the rk3576 device specific schema out of common.yaml
> 
> Changes in v6:
> - Fix make dt_binding_check and make CHECK_DTBS=y
> 
> Changes in v5:
> - Add constraints per device for interrupt-names due to the interrupt is
> different from rk3588.
> 
> Changes in v4:
> - Fix wrong indentation in dt_binding_check report by Rob
> 
> Changes in v3:
> - Fix dtb check broken on rk3588
> - Update commit message
> 
> Changes in v2:
> - remove required 'msi-map'
> - add interrupt name 'msi'
> 
>  .../bindings/pci/rockchip-dw-pcie-common.yaml | 10 +++-
>  .../bindings/pci/rockchip-dw-pcie.yaml        | 55 +++++++++++++++++--
>  2 files changed, 57 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> index cc9adfc7611c..2150bd8b5fc2 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> @@ -65,7 +65,11 @@ properties:
>            tx_cpl_timeout, cor_err_sent, nf_err_sent, f_err_sent, cor_err_rx,
>            nf_err_rx, f_err_rx, radm_qoverflow
>        - description:
> -          eDMA write channel 0 interrupt
> +          If the matching interrupt name is "msi", then this is the combinded
> +          MSI line interrupt, which is to support MSI interrupts output to GIC
> +          controller via GIC SPI interrupt instead of GIC its interrupt.
> +          If the matching interrupt name is "dma0", then this is the eDMA write
> +          channel 0 interrupt.
>        - description:
>            eDMA write channel 1 interrupt
>        - description:
> @@ -81,7 +85,9 @@ properties:
>        - const: msg
>        - const: legacy
>        - const: err
> -      - const: dma0
> +      - enum:
> +          - msi
> +          - dma0
>        - const: dma1
>        - const: dma2
>        - const: dma3
> diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
> index 550d8a684af3..4764a0173ae4 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
> @@ -16,16 +16,13 @@ description: |+
>    PCIe IP and thus inherits all the common properties defined in
>    snps,dw-pcie.yaml.
>  
> -allOf:
> -  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> -  - $ref: /schemas/pci/rockchip-dw-pcie-common.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
>        - const: rockchip,rk3568-pcie
>        - items:
>            - enum:
> +              - rockchip,rk3576-pcie
>                - rockchip,rk3588-pcie
>            - const: rockchip,rk3568-pcie
>  
> @@ -71,8 +68,54 @@ properties:
>  
>    vpcie3v3-supply: true
>  
> -required:
> -  - msi-map
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> +  - $ref: /schemas/pci/rockchip-dw-pcie-common.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: rockchip,rk3576-pcie
> +    then:
> +      required:
> +        - msi-map
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3576-pcie
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 6
> +          maxItems: 6
> +        interrupt-names:
> +          items:
> +            - const: sys
> +            - const: pmc
> +            - const: msg
> +            - const: legacy
> +            - const: err
> +            - const: msi
> +    else:
> +      properties:
> +        interrupts:
> +          minItems: 5
> +        interrupt-names:
> +          minItems: 5
> +          items:
> +            - const: sys
> +            - const: pmc
> +            - const: msg
> +            - const: legacy
> +            - const: err
> +            - const: dma0
> +            - const: dma1
> +            - const: dma2
> +            - const: dma3
> +
>  
>  unevaluatedProperties: false
>  
> -- 
> 2.25.1
> 
> 


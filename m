Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04DEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 21:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8AYB3qr0rI4Q6BV8egZtLOnh5AgoD1Erm0sJ1aQRyJM=; b=PLjVkds+TzsCWG
	7PRuyc0qafWNyG9HRfjMXulcUQzORE1qDkExOWgIGbZhFWk98YgX7UxhIFbV3fpACtOSu8THD5s0W
	Aq7q8I50I6OMxQjBRCinLX0tm804LZhx0pDf4kkF9ZzOL0XL5Joio6OjDaT1yZ1DDDwpk+Dsa4JTv
	dbyZaOWsnrgsk5yEDoMgD3CLWhWJWSbPJtJ2+PpGXDtmuGTUBOK5MOATjAABCEp14LmDzwXNpLjvt
	jfcBuHYNiXUc7bN6QV5owptVdOx9pk7WpUEgSbimtmehnj76D1DJmPJcjhGsbA1iaqmlUzCQB3CRL
	gPQvT517hgG2A1Srqdnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhxQa-00000006pyf-40TZ;
	Fri, 01 Aug 2025 21:36:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhxO0-00000006pj5-2RE3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 21:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 676CAA5564D;
	Fri,  1 Aug 2025 21:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADCCC4CEE7;
	Fri,  1 Aug 2025 21:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754084034;
	bh=+pXG+/8x+eovxVFUgbrD5YQLJQEUBlpsiR9an1SRSUk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dEJFuXVUpIXNqVnLu3QVmq4JfP26f/yuEPleAj+PZbjcPkFXJ3hNEwE+Ea33zwB3T
	 yTebhUob6kuVT1jRDV+XIqDksoyzYfvuZgW0umz6tbStW3c4ljN3ewPd/uu2xlqEJ2
	 00/Jj9thTraNR+PxHwC3km18lK5oP/AHunuTpBIu1MhgY1ImOGNVM/dANHT6Vuk8/T
	 hQ0qDN6yILZxCa0Uwc0WMPwMVztv9T7mZ7ubMQQFi3nSCpArTPiQ/LM+yIHSOvbNCT
	 YabR5DqoiFrjV40nIqngb0zKmPLUVkXvZnvUETgKjgHc+eW8CuGLkrvOn9eqSJlCEn
	 IHSBguVjpWCeA==
Date: Fri, 1 Aug 2025 16:33:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ray Jui <ray.jui@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: PCI: Add missing "#address-cells" to
 interrupt controllers
Message-ID: <20250801213353.GA3511997@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801200728.3252036-2-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_143356_754188_D922A8DA 
X-CRM114-Status: GOOD (  16.80  )
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

On Fri, Aug 01, 2025 at 03:07:27PM -0500, Rob Herring (Arm) wrote:
> An interrupt-controller node which is the parent provider for
> "interrupt-map" needs an "#address-cells" property. This fixes
> "interrupt_map" warnings in new dtc.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> PCI maintainers, Please ack, I'll take this with the dtc update for 
> 6.18.
> 
>  Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml    | 1 +
>  .../devicetree/bindings/pci/marvell,armada-3700-pcie.yaml     | 4 ++++
>  .../devicetree/bindings/pci/marvell,kirkwood-pcie.yaml        | 3 +++
>  .../devicetree/bindings/pci/socionext,uniphier-pcie.yaml      | 4 ++++
>  Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml  | 3 +++
>  5 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml
> index 5434c144d2ec..18e7981241b5 100644
> --- a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml
> @@ -108,6 +108,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>      gic: interrupt-controller {
> +        #address-cells = <0>;
>          interrupt-controller;
>          #interrupt-cells = <3>;
>      };
> diff --git a/Documentation/devicetree/bindings/pci/marvell,armada-3700-pcie.yaml b/Documentation/devicetree/bindings/pci/marvell,armada-3700-pcie.yaml
> index 68090b3ca419..8403c79634ed 100644
> --- a/Documentation/devicetree/bindings/pci/marvell,armada-3700-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/marvell,armada-3700-pcie.yaml
> @@ -42,6 +42,9 @@ properties:
>      additionalProperties: false
>  
>      properties:
> +      '#address-cells':
> +        const: 0
> +
>        interrupt-controller: true
>  
>        '#interrupt-cells':
> @@ -92,6 +95,7 @@ examples:
>              reset-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
>  
>              pcie_intc: interrupt-controller {
> +                #address-cells = <0>;
>                  interrupt-controller;
>                  #interrupt-cells = <1>;
>              };
> diff --git a/Documentation/devicetree/bindings/pci/marvell,kirkwood-pcie.yaml b/Documentation/devicetree/bindings/pci/marvell,kirkwood-pcie.yaml
> index 7be695320ddf..3d68bfbe6feb 100644
> --- a/Documentation/devicetree/bindings/pci/marvell,kirkwood-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/marvell,kirkwood-pcie.yaml
> @@ -101,6 +101,9 @@ patternProperties:
>          additionalProperties: false
>  
>          properties:
> +          '#address-cells':
> +            const: 0
> +
>            interrupt-controller: true
>  
>            '#interrupt-cells':
> diff --git a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
> index 638b99db0433..c07b0ed51613 100644
> --- a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
> @@ -56,6 +56,9 @@ properties:
>      additionalProperties: false
>  
>      properties:
> +      '#address-cells':
> +        const: 0
> +
>        interrupt-controller: true
>  
>        '#interrupt-cells':
> @@ -109,6 +112,7 @@ examples:
>                          <0 0 0  4  &pcie_intc 3>;
>  
>          pcie_intc: interrupt-controller {
> +            #address-cells = <0>;
>              interrupt-controller;
>              #interrupt-cells = <1>;
>              interrupt-parent = <&gic>;
> diff --git a/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml b/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
> index 69b499c96c71..c704099f134b 100644
> --- a/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
> @@ -99,6 +99,9 @@ properties:
>      additionalProperties: false
>  
>      properties:
> +      '#address-cells':
> +        const: 0
> +
>        interrupt-controller: true
>  
>        '#interrupt-cells':
> -- 
> 2.47.2
> 


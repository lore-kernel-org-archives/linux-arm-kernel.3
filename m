Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7182C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vU+UbaI0y1z7+rAUbjnlbUsrwqaWS4xVdk7Oxwpmak=; b=lS62gFLoam5gURlcfLUXIQrfqY
	usRelQfZk9NERo/ITolkDvb10hWM8AM68vNIf1LcfzqJyufyC0SfuYUv/LBBm0dpXr4pVghB0ygtI
	l6poihWRNjlpOpwmHrbfWsi3WWIn6Y42nT15h+4AvSfk7rm4yzvnidP46HpRoVwcFrLSyrmmB7uDr
	n/zoVsfUlfei0p1dwAuRRyPrX5+JC25i8s40lc7mT59/yqWMKxjDl1iHFqy5o5hnb5HVaZA2PUhcB
	xI3IYbkhOIkFXg6duVO7tJaeB9mq5Jo9lJS+Ndr4gv7XdKfGa7n36u0LvOIPv4QWDcseIsPR/qzMA
	S5MZBXWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGU7-0000000Fplr-3vb2;
	Fri, 27 Jun 2025 21:19:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGRn-0000000FpWZ-3bCX;
	Fri, 27 Jun 2025 21:17:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12714A53025;
	Fri, 27 Jun 2025 21:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DC6C4CEE3;
	Fri, 27 Jun 2025 21:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059042;
	bh=+EQCIEgsXVvxKsrT0WsXUC8n/w8gjOICwEyTeNeHuEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hNaU10tMhAYo5UGed+PugNq2z2uaOfR4n1dTptlDOnYNO+dZPouJG4Yi7JMSza6/s
	 5D2HmCiksnZI3k3NKS68X0f5iat0pazkWRJnz8gf1+Rcp7/UAm6I5KQTZOlSTS84xH
	 OjVKx7cbnQkX6Pgb5ZUZ4iOIJHfR39ZGpkfpqHuRiUoNFcYcIQmZA9iXzolCFVimNF
	 LGAuVl93HL2WhaFtdwepQfKOkkKVzCyrnCVBYlAlIaZfwwm0LHIpxcNaZHFw7iA0pG
	 A3iY4sGQpWrYP1xzEFUo2NUEIOTmjxZNoa5tFG8DLBTiJCm+yipFuAXaxh4k2MRtrC
	 iMob9UwH57Utg==
Date: Fri, 27 Jun 2025 16:17:21 -0500
From: Rob Herring <robh@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-fsd@tesla.com,
	manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com,
	pankaj.dubey@samsung.com
Subject: Re: [PATCH v2 07/10] dt-bindings: phy: Add PHY bindings support for
 FSD SoC
Message-ID: <20250627211721.GA153863-robh@kernel.org>
References: <20250625165229.3458-1-shradha.t@samsung.com>
 <CGME20250625165319epcas5p3721c19f6e6b482438c62dd1ef784de03@epcas5p3.samsung.com>
 <20250625165229.3458-8-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625165229.3458-8-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_141724_025061_39356754 
X-CRM114-Status: GOOD (  16.74  )
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

On Wed, Jun 25, 2025 at 10:22:26PM +0530, Shradha Todi wrote:
> Document PHY device tree bindings for Tesla FSD SoCs.
> 
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  .../bindings/phy/samsung,exynos-pcie-phy.yaml | 25 +++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
> index 41df8bb08ff7..4dc20156cdde 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
> @@ -15,10 +15,13 @@ properties:
>      const: 0
>  
>    compatible:
> -    const: samsung,exynos5433-pcie-phy
> +    enum:
> +      - samsung,exynos5433-pcie-phy
> +      - tesla,fsd-pcie-phy
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    samsung,pmu-syscon:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -30,6 +33,24 @@ properties:
>      description: phandle for FSYS sysreg interface, used to control
>                   sysreg registers bits for PCIe PHY
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - tesla,fsd-pcie-phy
> +    then:
> +      description:
> +        The PHY controller nodes are represented in the aliases node
> +        using the following format 'pciephy{n}'. Depending on whether
> +        n is 0 or 1, the phy init sequence is chosen.

What? Don't make up your own aliases.

If the PHY instances are different, then maybe you need a different 
compatible. If this is just selecting the PHY mode, you can do that in 
PHY cells as the mode depends on the consumer.


> +      properties:
> +        reg:
> +          items:
> +            - description: PHY
> +            - description: PCS

else:
  properties:
    reg:
      maxItems: 1

> +
>  required:
>    - "#phy-cells"
>    - compatible
> -- 
> 2.49.0
> 


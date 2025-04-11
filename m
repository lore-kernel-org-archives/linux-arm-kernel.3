Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EB1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNvvXB07W7yYPXVEu21FHZKJV7xVVdNXQwWoJfFlVBk=; b=avHgGJBdiAzYb+bBOmYolGIxpD
	nWzBXAkQd2uzToxl8sEuEe3dqMyco7oJzycgvj6hmvVjHc+ZIplogawfZV62LGPH1dVGsfMyS1L/V
	Tld3qp1RAbDTo7HoYv6qkSgV0sQms7V77RZW8wxz5pO5Iuil6YQvoEno7RsTYZDbeQ5ycwyiocet+
	Tl4GNgC7gkrkxD9nTgsPY4HoV1690nwmMRpjwjae7pjo6b5UqxKnmWZ9rTq6XFw8p+85iM9qg28zr
	MXkuZm5Y+ZQedyWeAW0wBKkhKq4h/U7h+Kly9hPXcWhD9nZ1ktfxhl9la0Lh5cnsRnwkLU2u16wpg
	nDDBod1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Fqu-0000000EAtM-3RQZ;
	Fri, 11 Apr 2025 14:59:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FWk-0000000E7e2-3PxS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 14:38:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37F4B43DD9;
	Fri, 11 Apr 2025 14:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44D2C4CEE2;
	Fri, 11 Apr 2025 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744382322;
	bh=jAJlS5q852euhAe6wyd7vFRnrkERexMZBYRdv4EcB0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjGetJCrr/sz6vp/t4NriLyM4AZgVjR1JD0g+XkmUyXoFZHKgEQliaAbU+YsF+ybt
	 +kcTXDIuo8zlyiy4PyXingdVCLrv8uCQeiFIl3dFvjH+WekfZBZ5Y9GOnietOAzshD
	 ibwGTqV9WUMxsRnO87Bluy1qqlXXaaqUVGpHo2pBETy7CeTs5nGg0pR4oDuKtygLL5
	 7Yhtwk7+l+yWYExiqmDbhGimC/igkoymfZdjapsjUQ6fv6tclOCWQ2Q637Z2M1a7TQ
	 ZHuRrtXWYaNoVkzT0Y57jM/Hz+Q0LiBDEaJJ5g/dcC0w5u0Oy8FWg3Cd9UnVF5wh0R
	 ljhES93+qM6oA==
Date: Fri, 11 Apr 2025 09:38:40 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org,
	jdmason@kudzu.us, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v17 04/15] dt-bindings: PCI: pci-ep: Add support for
 iommu-map and msi-map
Message-ID: <20250411143840.GA3153754-robh@kernel.org>
References: <20250407-ep-msi-v17-0-633ab45a31d0@nxp.com>
 <20250407-ep-msi-v17-4-633ab45a31d0@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-ep-msi-v17-4-633ab45a31d0@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_073842_891713_B48BD27B 
X-CRM114-Status: GOOD (  28.01  )
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

On Mon, Apr 07, 2025 at 03:50:54PM -0400, Frank Li wrote:
> Document the use of (msi|iommu)-map for PCI Endpoint (EP) controllers,
> which can use MSI as a doorbell mechanism. Each EP controller can support
> up to 8 physical functions and 65,536 virtual functions.
> 
> Define how to construct device IDs using function bits [2:0] and virtual
> function index bits [31:3], enabling (msi|iommu)-map to associate each
> child device with a specific (msi|iommu)-specifier.
> 
> The EP cannot rely on PCI Requester ID (RID) because the RID is determined
> by the PCI topology of the host system. Since the EP may be connected to
> different PCI hosts, the RID can vary between systems and is therefore not
> a reliable identifier.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v16 to v17
> - new patch
> ---
>  Documentation/devicetree/bindings/pci/pci-ep.yaml | 67 +++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/pci-ep.yaml b/Documentation/devicetree/bindings/pci/pci-ep.yaml
> index f75000e3093db..a1a5b9b8ef859 100644
> --- a/Documentation/devicetree/bindings/pci/pci-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/pci-ep.yaml
> @@ -53,6 +53,73 @@ properties:
>        must be unique.
>      $ref: /schemas/types.yaml#/definitions/uint32
>  
> +  msi-map:

Not that the rest of the file is alphabetized, but put i before m.

> +    description: |
> +      Maps a Device ID to an MSI and associated MSI specifier data.
> +
> +      A PCI Endpoint (EP) can use MSI as a doorbell function. This is achieved by
> +      mapping the MSI controller's address into PCI BAR<n>. The PCI Root Complex
> +      can write to this BAR<n>, triggering the EP to generate IRQ. This notifies
> +      the EP-side driver of an event, eliminating the need for the driver to
> +      continuously poll for status changes.
> +
> +      However, the EP cannot rely on Requester ID (RID) because the RID is
> +      determined by the PCI topology of the host system. Since the EP may be
> +      connected to different PCI hosts, the RID can vary between systems and is
> +      therefore not a reliable identifier.
> +
> +      Each EP can support up to 8 physical functions and up to 65,536 virtual
> +      functions. To uniquely identify each child device, a device ID is defined
> +      as
> +         - Bits [2:0] for the function number (func)
> +         - Bits [18:3] for the virtual function index (vfunc)
> +
> +      The resulting device ID is computed as:
> +
> +        (func & 0x7) | (vfunc << 3)
> +
> +      The property is an arbitrary number of tuples of
> +      (device-id-base, msi, msi-base,length).
> +
> +      Any Device ID id in the interval [id-base, id-base + length) is
> +      associated with the listed MSI, with the MSI specifier
> +      (id - id-base + msi-base).
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description: The Device ID base matched by the entry
> +          maximum: 0x7ffff
> +        - description: phandle to msi-controller node
> +        - description: (optional) The msi-specifier produced for the first
> +            Device ID matched by the entry. Currently, msi-specifier is 0 or
> +            1 cells.
> +        - description: The length of consecutive Device IDs following the
> +            Device ID base
> +          maximum: 0x80000
> +
> +  msi-map-mask:
> +    description: A mask to be applied to each Device ID prior to being
> +      mapped to an msi-specifier per the msi-map property.
> +    $ref: /schemas/types.yaml#/definitions/uint32

maximum: 0x7ffff ?

> +
> +  iommu-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description: Device ID (see msi-map) base
> +          maximum: 0x7ffff
> +        - description: phandle to IOMMU
> +        - description: IOMMU specifier base (currently always 1 cell)
> +        - description: Number of Device IDs
> +          maximum: 0x80000
> +
> +  iommu-map-mask:
> +    description:
> +      A mask to be applied to each Device ID prior to being mapped to an
> +      IOMMU specifier per the iommu-map property.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 0xffff

0x7ffff ?

> +
>  required:
>    - compatible
>  
> 
> -- 
> 2.34.1
> 


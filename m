Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D879FCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWmIbIyeYWJEtyF/AgjaTVhSAAu3l7zfvf2i75ksJuY=; b=rjabvTsFIuT+nQj4uaoQv9yf5G
	kiK7DC3z7oNkMMfjqORifqY0Wa+gHKy8OuAkf2uBLagsWx+qv+MQpJy+rSrz2191cZI5+12XwcAzg
	ssNRoJKtcqHyeT5W/0v4xlgMhxa1mbeeR8wfNn+BNk+kBsOmJzwtAb8i9kExSJEsL8Mn2it+Fj6lz
	ZYyNc7Z3CtM7qVyCiAsR7lWRe6/qayEvrKxtR01TBvlHKuj8cyYqpKpntxZ5vtg8uFNISpQE5k+hh
	kcBiKg06DFiA+dsbBmwQE0dwaeE+hF1jmvZSxNZioTkW+k2/C6ywdCVcuVP1++pxzjWDv0bzxM1Fu
	tz7973OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorHo-0000000F5wa-3u4e;
	Wed, 20 Aug 2025 22:28:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomud-0000000Eb21-0Ogl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 17:47:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23158601EA;
	Wed, 20 Aug 2025 17:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B7EC4CEE7;
	Wed, 20 Aug 2025 17:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755712069;
	bh=+LT24B6nqcidaacLuQ1/YF/caYmrsYm6FwAYLXqEPO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cGfgqJgvrbi0zV1kwHYzxbXXJaIzYhoUFz2CSLBnMyRYL6ysG7dz8r+YTY4tp0/7e
	 8hTD/KfoIYxXv8p+n5NzZZn/bVxt4wifzpDA2ERiFb40jnNfEArkddbUSn8XtrX86q
	 N9c0FgJgxq/F8KL7SUSDJ1+xINq/wH2ixyUBhNszXwpvnlPZ/mRPFu5Uw0iWCa4Idt
	 DFOLdGd8ER2vYoDgIFQow3Zzh+++QJa3RJKAzBmKW2iIrYV3sUngWGhs1lTt6oXsMb
	 7ji8XG0nKmqqj2ehoFJg0BHUv8dfXOQe5Y6CTcllIHACTMMb7a4unufQfj9DVRkoPC
	 MCj+DE8fbLJCQ==
Date: Wed, 20 Aug 2025 23:17:30 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, lizhi.hou@amd.com, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 3/9] PCI: of_property: Restore the arguments of the
 next level parent
Message-ID: <7wmpgldjvznbllotblv6ufybd2qqzb2ole2nhvbx4xiavyqa2b@ezaqwghxmbve>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-4-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704161410.3931884-4-claudiu.beznea.uj@bp.renesas.com>
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

On Fri, Jul 04, 2025 at 07:14:03PM GMT, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> of_pci_make_dev_node() creates a device tree node for the PCIe bridge it
> detects. The node name follows the format: pci_type@pci_slot,pci_func. If
> such a node already exists in the current device tree, a new one is not
> created.
> 
> When the node is created, its contents are populated with information from
> the parent node. In the case of root complex nodes described in the device
> tree, the created node duplicates the interrupt-map property. However, the
> duplicated interrupt-map property does not correctly point to the next
> interrupt controller.
> 
> For example, in the case of the Renesas RZ/G3S SoC, the resulting device
> tree node is as follows (only relevant DT properties are shown):
> 
> pcie@11e40000 {
> 
>     // ...
> 
>     interrupt-map = <0x00 0x00 0x00 0x01 0x1f 0x00 0x00 0x00 0x00
>                      0x00 0x00 0x00 0x02 0x1f 0x00 0x00 0x00 0x01
>                      0x00 0x00 0x00 0x03 0x1f 0x00 0x00 0x00 0x02
>                      0x00 0x00 0x00 0x04 0x1f 0x00 0x00 0x00 0x03>;
>     interrupt-map-mask = <0x00 0x00 0x00 0x07>;
>     interrupt-controller;
>     #interrupt-cells = <0x01>;
> 
>     #address-cells = <0x03>;
>     #size-cells = <0x02>;
> 
>     phandle = <0x1f>;
> 
>     // ...
> 
>     pci@0,0 {
>         reg = <0x00 0x00 0x00 0x00 0x00>;
>         interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00
>                          0x10000 0x00 0x00 0x02 0x1f 0x00 0x11e40000 0x00 0x01
>                          0x10000 0x00 0x00 0x03 0x1f 0x00 0x11e40000 0x00 0x02
>                          0x10000 0x00 0x00 0x04 0x1f 0x00 0x11e40000 0x00 0x03>;
>         interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
>         #interrupt-cells = <0x01>;
> 
>         #address-cells = <0x03>;
>         #size-cells = <0x02>;
> 
>         // ...
>     };
> };
> 
> With this pci@0,0 node, the interrupt-map parsing code behaves as follows:
> 
> When a PCIe endpoint is enumerated and it requests to map a legacy
> interrupt, of_irq_parse_raw() is called requesting the interrupt from
> pci@0,0. If INTA is requested, of_irq_parse_raw() first matches:
> 
> interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00>
> 
> from the pci@0,0 node. It then follows the phandle 0x1f to the interrupt
> parent, looking for a mapping for interrupt ID 0x00
> (0x00 0x11e40000 0x00 0x00). However, the root complex node does not
> provide this mapping in its interrupt-map property, causing the interrupt
> request to fail.
> 

Are you trying to say that the generated bridge node incorrectly uses Root
Complex node as the interrupt parent?

I'm getting confused since your example above shows '0x1f' as the interrupt
parent phandle for both Root Complex and bridge nodes. But I don't know to which
node this phandle corresponds to.

In any case, since this seems to be an independent fix, please send it
separately.

- Mani

> To avoid this, in the interrupt-map property of the nodes generated by
> of_pci_make_dev_node() map legacy interrupts to entries that are valid in
> the next level interrupt controller in the interrupt mapping tree.
> 
> With this, the generated pci@0,0 node and its parent look as follows:
> 
> pcie@11e40000 {
>     // ...
> 
>     interrupt-map = <0x00 0x00 0x00 0x01 0x1f 0x00 0x00 0x00 0x00
>                      0x00 0x00 0x00 0x02 0x1f 0x00 0x00 0x00 0x01
>                      0x00 0x00 0x00 0x03 0x1f 0x00 0x00 0x00 0x02
>                      0x00 0x00 0x00 0x04 0x1f 0x00 0x00 0x00 0x03>;
>     interrupt-map-mask = <0x00 0x00 0x00 0x07>;
>     interrupt-controller;
>     #interrupt-cells = <0x01>;
> 
>     #address-cells = <0x03>;
>     #size-cells = <0x02>;
> 
>     phandle = <0x1f>;
> 
>     // ...
> 
>     pci@0,0 {
>         reg = <0x00 0x00 0x00 0x00 0x00>;
>         interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x01
>                          0x10000 0x00 0x00 0x02 0x1f 0x00 0x11e40000 0x00 0x02
>                          0x10000 0x00 0x00 0x03 0x1f 0x00 0x11e40000 0x00 0x03
>                          0x10000 0x00 0x00 0x04 0x1f 0x00 0x11e40000 0x00 0x04>;
>         interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
>         #interrupt-cells = <0x01>;
> 
>         #address-cells = <0x03>;
>         #size-cells = <0x02>;
>     };
> };
> 
> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v3:
> - none; this patch is new
> 
>  drivers/pci/of_property.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
> index 506fcd507113..8dfed096326f 100644
> --- a/drivers/pci/of_property.c
> +++ b/drivers/pci/of_property.c
> @@ -243,6 +243,14 @@ static int of_pci_prop_intr_map(struct pci_dev *pdev, struct of_changeset *ocs,
>  		}
>  		of_property_read_u32(out_irq[i].np, "#address-cells",
>  				     &addr_sz[i]);
> +
> +		/*
> +		 * Restore the arguments of the next level parent if a map
> +		 * was found.
> +		 */
> +		out_irq[i].np = pnode;
> +		out_irq[i].args_count = 1;
> +		out_irq[i].args[0] = pin;
>  	}
>  
>  	list_for_each_entry(child, &pdev->subordinate->devices, bus_list) {
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்


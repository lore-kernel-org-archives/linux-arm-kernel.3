Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D40CCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 04:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaFCKV+QLw60nhd6Jqm7uGyLTfBeMsN5sFipJ9EBnJI=; b=D56z3hwNwZ7izwLW7fnaiMWRqI
	u6GyJFSxBmCFUNBZWLknPkAMfmV25TGbyH2Lmy1DqOV5CHtLDURdGmmwMCSI2WH/fECTtJRZlXKBh
	5NsDVfe3/sn8dYOB74WQi5SSCJilUd9j2Kc36l2Bpa1q6MHSKx6xyZD3drT1ns+wxTpJqffrw36As
	DrKcn5yhtd0nNkeaAnggV3w7/PBftZh9Cm+NM6tdBDIvsVroa3vqCOREriY/GPXwcEJ4td8nZD2dX
	/UKKH48DHzz6VIwtIxtH0iteJJm0u0sJLi3Pgxg4QX05vBnbmjM1cHpN1OYoZOGoVMFcPGvYD7s6z
	0mXOMLOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usCyl-00000007Pjs-3Z3f;
	Sat, 30 Aug 2025 04:14:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usCvB-00000007PPX-3iPx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 04:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE1E960191;
	Sat, 30 Aug 2025 04:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF0FC4CEEB;
	Sat, 30 Aug 2025 04:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756527032;
	bh=+Bg+RVavGYMPykEG5hhqXkc3Av6gb9iZ45IEltTHUHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d822i5PQL/Uvn3lE2lP6EXOe+aAdp86itNdmpV/DjBhUXFigUGStBOlEmkIVXZaiu
	 4jqo7FEpZb4107b55pmYgddnw9xP9EkPeKvFcThgDO+ZS3xK6Oyr+Vr/c4zaXG6HZy
	 fpT9SOIapIKkhqhJ9oKJ/fptZNB2qmSLXRFOjUBfcHy8h0xFQ++D97B3bufKCGXPDi
	 JWEhUdvAY6ADvJ1aTRU1LyBJvRNqBGkY5eHVYcczZ/okP/PqjZ3q6ceafB7ia7fXA0
	 V3WLJKjK7tYfpzBz7h/pL5X2rOYheO6Yp91+Ya7h1ygJ/0jUZAO/LfRI99l9qjImGY
	 DhQRBlJyhQaBg==
Date: Sat, 30 Aug 2025 09:40:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, lizhi.hou@amd.com, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 3/9] PCI: of_property: Restore the arguments of the
 next level parent
Message-ID: <zvyro2dl7hqproym4shawsckorhlcfkyucponfvw2qrbc44zb2@3kg2eaab42rj>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-4-claudiu.beznea.uj@bp.renesas.com>
 <7wmpgldjvznbllotblv6ufybd2qqzb2ole2nhvbx4xiavyqa2b@ezaqwghxmbve>
 <d004d9c4-f71b-49e6-9ced-031761f5e338@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d004d9c4-f71b-49e6-9ced-031761f5e338@tuxon.dev>
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

On Thu, Aug 21, 2025 at 10:40:40AM GMT, Claudiu Beznea wrote:
> Hi, Manivannan,
> 
> On 20.08.2025 20:47, Manivannan Sadhasivam wrote:
> > On Fri, Jul 04, 2025 at 07:14:03PM GMT, Claudiu wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> of_pci_make_dev_node() creates a device tree node for the PCIe bridge it
> >> detects. The node name follows the format: pci_type@pci_slot,pci_func. If
> >> such a node already exists in the current device tree, a new one is not
> >> created.
> >>
> >> When the node is created, its contents are populated with information from
> >> the parent node. In the case of root complex nodes described in the device
> >> tree, the created node duplicates the interrupt-map property. However, the
> >> duplicated interrupt-map property does not correctly point to the next
> >> interrupt controller.
> >>
> >> For example, in the case of the Renesas RZ/G3S SoC, the resulting device
> >> tree node is as follows (only relevant DT properties are shown):
> >>
> >> pcie@11e40000 {
> >>
> >>     // ...
> >>
> >>     interrupt-map = <0x00 0x00 0x00 0x01 0x1f 0x00 0x00 0x00 0x00
> >>                      0x00 0x00 0x00 0x02 0x1f 0x00 0x00 0x00 0x01
> >>                      0x00 0x00 0x00 0x03 0x1f 0x00 0x00 0x00 0x02
> >>                      0x00 0x00 0x00 0x04 0x1f 0x00 0x00 0x00 0x03>;
> >>     interrupt-map-mask = <0x00 0x00 0x00 0x07>;
> >>     interrupt-controller;
> >>     #interrupt-cells = <0x01>;
> >>
> >>     #address-cells = <0x03>;
> >>     #size-cells = <0x02>;
> >>
> >>     phandle = <0x1f>;
> >>
> >>     // ...
> >>
> >>     pci@0,0 {
> >>         reg = <0x00 0x00 0x00 0x00 0x00>;
> >>         interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00
> >>                          0x10000 0x00 0x00 0x02 0x1f 0x00 0x11e40000 0x00 0x01
> >>                          0x10000 0x00 0x00 0x03 0x1f 0x00 0x11e40000 0x00 0x02
> >>                          0x10000 0x00 0x00 0x04 0x1f 0x00 0x11e40000 0x00 0x03>;
> >>         interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
> >>         #interrupt-cells = <0x01>;
> >>
> >>         #address-cells = <0x03>;
> >>         #size-cells = <0x02>;
> >>
> >>         // ...
> >>     };
> >> };
> >>
> >> With this pci@0,0 node, the interrupt-map parsing code behaves as follows:
> >>
> >> When a PCIe endpoint is enumerated and it requests to map a legacy
> >> interrupt, of_irq_parse_raw() is called requesting the interrupt from
> >> pci@0,0. If INTA is requested, of_irq_parse_raw() first matches:
> >>
> >> interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00>
> >>
> >> from the pci@0,0 node. It then follows the phandle 0x1f to the interrupt
> >> parent, looking for a mapping for interrupt ID 0x00
> >> (0x00 0x11e40000 0x00 0x00). However, the root complex node does not
> >> provide this mapping in its interrupt-map property, causing the interrupt
> >> request to fail.
> >>
> > 
> > Are you trying to say that the generated bridge node incorrectly uses Root
> > Complex node as the interrupt parent?
> 
> I'm trying to say that the generated bridge node is wrong because it copies
> the interrupt-map from the root complex mapping int 0x1 to 0x0 in the
> bridge node, while it should have map the int 0x1 to something valid for
> root complex mapping.
> 
> E.g. when some device requests INT with id 0x1 from bridge the bridge
> mapping returns 0x0 then the returned 0x0 is used to find a new mapping on
> the root complex based on what is provided for in with interrupt-map DT
> property.
> 

TBH, I don't know why it generates the 'interrupt-map' property for the bridge
node first place. It just creates two level lookup and in the absence, the IRQ
code will traverse up the node to find the interrupt parent anyway.

Maybe the intention was to avoid doing the traversal.

> 
> > 
> > I'm getting confused since your example above shows '0x1f' as the interrupt
> > parent phandle for both Root Complex and bridge nodes. But I don't know to which
> > node this phandle corresponds to.
> 
> Root complex node from this patch description has:
> 
> phandle = <0x1f>;
> 

Oops. I failed to spot it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


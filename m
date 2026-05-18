Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2067CCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 22:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NICbkQQdRoV0Bx1rLVTrcr9quvoWxCqrJ8N0XFoOpO8=; b=oEH6IH9AN0QfI/
	nwdH+0k4n/BCloikP9L69RURhm1Sd21Zck4Cte2v3VlPa65eZD0GgHijtOhFfJnHCimLhedEeg9Ht
	6c8BZ26c8YEOh5xyx5jRXVKLXNVde1U7C/MvgXzVUIi7zeYTdynJWeJQD9EE3m097Gn51sgLfX3ta
	2/Bf9TV2rofCQwDln6yeiUTaChRg2ZQq1kJbRPqQ0TuwC0J2pDsu2Zj6ufyn22HdFMKEef1gWpCxU
	WX6u37Tsc6aTTOCj+kBESBC9+8ebRlxn9GTRhSWyJ5a7hqIkAULnWNFzmNp8bbR4ZOVo3aoeI8y2w
	fb4H+VOJ74rwC8pz7FPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP6b5-0000000H6ss-1j8T;
	Mon, 18 May 2026 22:38:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP6b3-0000000H6s9-0lgH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 22:38:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED0A5402B7;
	Mon, 18 May 2026 22:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE48DC2BCB7;
	Mon, 18 May 2026 22:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779143879;
	bh=yCPh+HXQRcTVsmUvu2yXJQlDcVHXXFcwMfPUyflHlTc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=uIV9oMFsZiB2k1H5yl4LvHnzDb5kbXykJcpKi7D9HmO3wpF30Fm7LMuqdkV/3wCSx
	 OZUB0KApB6xzK86w+pr1GMGjcouh1CpiLyTubSJWy5Iizzi4Sh0lwp+iUl5vy4gPCe
	 hVUHFUGhHj/5bI5VhZ5jEFySJ7rdeKgSF+J7SO1dmKKI7ondlimEn9G0rFsSQFIxzS
	 Wuph+R9JnXLbtGU5Xvac38Cp0cMt9u0DQ5P/aqPnpoAQKMIdGejHfufT4c+eB+oPta
	 6aFZyhcUkwnug9239xE8FvofQgCMdSkFJZtUA2kDeuTuF14eScoCCQb/PcZbUrT3Wg
	 Ty4V3IdCqwS6Q==
Date: Mon, 18 May 2026 17:37:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	Hongxing Zhu <hongxing.zhu@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V14 02/12] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Message-ID: <20260518223758.GA649325@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI0PR04MB1211452312EB9BC6EF1ED2E0192032@VI0PR04MB12114.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_153801_265147_5721FB16 
X-CRM114-Status: GOOD (  31.69  )
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

On Mon, May 18, 2026 at 08:42:38AM +0000, Sherry Sun wrote:
> > Subject: Re: [PATCH V14 02/12] PCI: host-generic: Add common helpers for
> > parsing Root Port properties
> > 
> > On Wed, Apr 22, 2026 at 05:35:39PM +0800, Sherry Sun wrote:
> > > Introduce generic helper functions to parse Root Port device tree
> > > nodes and extract common properties like reset GPIOs. This allows
> > > multiple PCI host controller drivers to share the same parsing logic.
> > >
> > > Define struct pci_host_port to hold common Root Port properties
> > > (currently only list of PERST# GPIO descriptors) and add
> > > pci_host_common_parse_ports() to parse Root Port nodes from device
> > tree.
> > >
> > > Also add the 'ports' list to struct pci_host_bridge for better
> > > maintain parsed Root Port information.
> > > ...
> > 
> > > +static int pci_host_common_parse_port(struct device *dev,
> > > +				      struct pci_host_bridge *bridge,
> > > +				      struct device_node *node)
> > > +{
> > > +	struct pci_host_port *port;
> > > +	int ret;
> > > +
> > > +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> > > +	if (!port)
> > > +		return -ENOMEM;
> > > +
> > > +	INIT_LIST_HEAD(&port->perst);
> > > +
> > > +	ret = pci_host_common_parse_perst(dev, port, node);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * 1. PERST# found in RP or its child nodes - list is not empty, continue
> > > +	 * 2. PERST# not found in RP/children, but found in RC node - return -
> > ENODEV
> > > +	 *    to fallback legacy binding
> > > +	 * 3. PERST# not found anywhere - list is empty, continue (optional
> > PERST#)
> > > +	 */
> > > +	if (list_empty(&port->perst)) {
> > > +		if (of_property_present(dev->of_node, "reset-gpios") ||
> > > +		    of_property_present(dev->of_node, "reset-gpio"))
> > > +			return -ENODEV;
> > 
> > This doesn't seem right to me.  The parser of per-Root Port properties should
> > not be responsible for deciding whether legacy methods are valid, i.e.,
> > whether a property is in the Root Complex node.  I think it's up to the caller
> > to decide whether it needs to look elsewhere.
> > 
> > I don't think this even needs to return a "success/failure" value because there
> > may be more properties in the future, and not all will be required.  This
> > function can't tell which properties a specific driver requires and which are
> > optional.
> > 
> > The caller can check whether we found what it needs and fall back to a legacy
> > method as needed.
> 
> Hi Bjorn,
> The code here was suggested by Mani, https://lore.kernel.org/all/lnzprzrdwra7pn7d6m3sbj5pvjy64blwpjl6i3lmlnfbyho63b@czpyhpgz5vum/.
> I think your suggestion here is reasonable, the per-Root Port parser shouldn't
> check the RC-level binding. That's a policy decision that belongs to the caller.
> 
> Hi Mani, if you also agree, I'll rework this so that:
> 1. pci_host_common_parse_port() only parses properties from the Root Port
>     (and its children) without checking the RC node.
> 2. The function won't return failure for "property not found" - it will only return
>      errors for real failures (e.g., -ENOMEM, GPIO acquisition errors).
> 3. The legacy fallback logic will be moved to the caller, which can inspect the
>      parsed result and decide whether to fall back to the legacy binding.

This is only used for imx6 so far, so I think this is OK as-is for
v7.2.  We can file this under "possible future rework or kernel
mentee project."


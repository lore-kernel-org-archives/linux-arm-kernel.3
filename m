Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC514CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 06:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgENt1aUql5leWB11YhE4AQhVjtbVDS4QwxhrhSyIHI=; b=MndAH4OBmodb4NucJA125Vphuj
	KpzXsabENAZATWsH4z0fsfyvz/uiw39g2MfORp+oTC5LPhAT50M0NAUDvpP+lhaSxLo3Rsf7l7QJO
	GDTphPDgJHgVz0802BS71YM8jbSqWMnJ3Dy67Vs1+4Nt4EFnkMc0pMs3A42LQg4i1oyUvUQQoXNiE
	/h0Q/fW2wtF2HJJzBWkmtNORu1jD6Wk6R3tj1oupZQpBXdqHrW5hUFDUVMzfJ6cson0lFJ6uUrmJA
	OnFrJZILdmk/EDYTdRW3PYPYhwOVF35Svjpv91cnegXyFE9aKU9iFQrreiVm/vS3pJWRp1rqYtB6J
	IBJm19Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZNCU-0000000FJSE-1sla;
	Tue, 16 Jun 2026 06:23:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZNCT-0000000FJS5-1SAr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 06:23:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5483F60137;
	Tue, 16 Jun 2026 06:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF171F000E9;
	Tue, 16 Jun 2026 06:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781590984;
	bh=JgENt1aUql5leWB11YhE4AQhVjtbVDS4QwxhrhSyIHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K6GSroawCwbP0PxVEQc17I3NazJ7RtNnYjSWzZ6hX8BidX+413z4mve6p06B6m9mB
	 rjLO9xYk4L11ZlS58wskr7I3MmKAHk9oyEmVlNDpEuO1gvh25fmpDuDrRnFDKhkwGl
	 DM6UEXr6vP23ROYX/Bhz1jUgZDponk+coNBaagfsqGnRXRRalAW79bIq1FFyA/ghGQ
	 wWMuGcAn/SgRZmPD5/pITbQoucTk3Ju5OUrn/WTLX4P3Fi6/sBMvSq7HyZeHRkmFW1
	 cpAdgXkypm7w2V1XKvTExM+7xheraW5WRnldrwcrJhyUh7hmUpVrw+pBppo7+z6Eqg
	 U/kvYrg5/KCZw==
Date: Tue, 16 Jun 2026 08:22:53 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, kwilczynski@kernel.org, bhelgaas@google.com, corbet@lwn.net, 
	kishon@kernel.org, skhan@linuxfoundation.org, lukas@wunner.de, cassel@kernel.org, 
	alistair@alistair23.me, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, s-vadapalli@ti.com, danishanwar@ti.com, srk@ti.com
Subject: Re: [PATCH v5 3/4] PCI: endpoint: Add support for DOE initialization
 and setup in EPC core
Message-ID: <grfjlghqd3k3i3uxll2jksrh7pgi2mtxifbq2vymsdgbzijsnq@dvgu2qp2hza3>
References: <20260611191252.GA499821@bhelgaas>
 <0216a528-3737-4714-b9d1-5d28008e0ec8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0216a528-3737-4714-b9d1-5d28008e0ec8@ti.com>
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

On Fri, Jun 12, 2026 at 01:54:13PM +0530, Aksh Garg wrote:
> 
> 
> On 12/06/26 00:42, Bjorn Helgaas wrote:
> > On Wed, Jun 10, 2026 at 03:32:55PM +0530, Aksh Garg wrote:
> > > Add pci_epc_init_capabilities() in EPC core driver to initialize and
> > > setup the capabilities supported by the EPC driver. This calls
> > > pci_epc_doe_setup() to setup the DOE framework for an endpoint controller,
> > > which discovers the DOE capabilities (extended capability ID 0x2E), and
> > > registers each discovered DOE mailbox for all the functions in the
> > > endpoint controller.
> > > 
> > > Add pci_epc_deinit_capabilities() in EPC core driver for cleanup of the
> > > resources used by the capabilities of the EPC driver. This calls
> > > pci_ep_doe_destroy() to destroy all DOE mailboxes and free associated
> > > resources.
> > > 
> > > Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > Signed-off-by: Aksh Garg <a-garg7@ti.com>
> > > ---
> > > +/**
> > > + * pci_epc_doe_setup() - Discover and setup DOE mailboxes for all functions
> > > + * @epc: the EPC device on which DOE mailboxes has to be setup
> > > + *
> > > + * Discover DOE (Data Object Exchange) capabilities for all physical functions
> > > + * in the endpoint controller and register DOE mailboxes.
> > > + *
> > > + * Returns: 0 on success, -errno on failure
> > > + */
> > > +static int pci_epc_doe_setup(struct pci_epc *epc)
> > > +{
> > > +	u8 func_no, vfunc_no = 0;
> > > +	u16 cap_offset;
> > > +	int ret;
> > > +
> > > +	if (!epc->ops || !epc->ops->find_ext_capability)
> > > +		return -EINVAL;
> > 
> 
> Hi Bjorn,
> 
> Thank you for your feedback comments. I will work on them and post v6
> series incorporating the changes.
> 
> > I don't see anything that sets pci_epc_ops.find_ext_capability in this
> > series, so this looks currently unused and untestable, so likely not
> > mergeable as-is.  What's the plan for users of this?
> > 
> 
> Currently there is no EPC driver upstream which supports DOE yet. However, I
> am working on a platform which supports DOE (support for
> which would be added soon). Mani pointed out that if EPC driver support
> for the same is guaranteed to be added soon, the APIs can be merged
> first.
> 
> For the demonstration purpose, he asked to show how an EPC driver is
> expected to use the API as a snippet in the cover letter itself.
> 

I retract my previous comment here. Let's not introduce dead code in the kernel.
We can review the series now, but cannot merge it until the EPC driver gets
submitted.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5CFCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaWCNwcV4Q9WPXltaMYYj+j9vFr5Kxt8/s7SNLX1Li8=; b=xQ6gqqW7l+cFLUcgk+BHmWTqt5
	/qGwq0TH2XJiqQxnd+DDM19FgysU1lyazuM+tyafyPrmKVaO4KTxX9RnLc8AbGZ3lc+9DqcRDxyex
	CpKj63b6i4asn+iUFRrTQ9vmUmm70fdCUhZJIMGF+ew/3ME5ojOkI1zZroeNqmqnnPyBr+vLi+X1f
	PxqqFwP6W2HEYEDYOqsXO2jL5XC09SWJx5KlE06QAp78HfCIK44M4+NAHn3NqxoRjfs250rNDJILX
	UtiGXltC5vMww9/zcQnlRswBJpqR1+TzTwP5vTtMtWzRzbBvC2AqC3Nd+Rs+hSe6qIZBpgnRjc27u
	G+1F7iLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ51g-00000008GOg-22Rh;
	Thu, 21 May 2026 15:09:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ51d-00000008GO1-0zxb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:09:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B257B4176A;
	Thu, 21 May 2026 15:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E111F000E9;
	Thu, 21 May 2026 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779376168;
	bh=WaWCNwcV4Q9WPXltaMYYj+j9vFr5Kxt8/s7SNLX1Li8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zn/JZ/6/1NhMbxJt9yFc14hFBWdZSs1lsZtRAwmO3xi9reC3KCOyZeu+YLzQZT/Mv
	 szdEjjM1MMqKc+jMitK6CQ1GDHgoVqccxfyGSYSBLLQWsAqUqDIzkkZ7i4/zv4esD1
	 MQzc6i/FXjYwPO89cjJO/NwSjKbNMfVU6WKKueysXFDhIQCrZ1WxRVbwXXbIYnwauH
	 vmtDI/QvTIhhjEpdEAkhXK+yywEHsNy5NFoWrolQCn8/+TbPwPglIbcgsFdgPJdchW
	 VXvjq7pwwJknnJfILyJYzWzrgFZatsGOMJ8BoT0V6RNhpbDRBx/mF5u4oNCHqT4XkS
	 HlHpvLuTB9yXw==
Date: Thu, 21 May 2026 20:39:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v5 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
Message-ID: <f6o5hl25ewgegvhhdhzoiuor2bgvlqduk46yvmascgabpzbf33@vcueeqidww2u>
References: <20260519223901.GA20376@bhelgaas>
 <20260520202755.GA120626@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520202755.GA120626@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080929_313294_2A0A23AC 
X-CRM114-Status: GOOD (  30.59  )
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

On Wed, May 20, 2026 at 03:27:55PM -0500, Bjorn Helgaas wrote:
> On Tue, May 19, 2026 at 05:39:01PM -0500, Bjorn Helgaas wrote:
> > On Wed, Apr 29, 2026 at 12:12:23PM +0530, Krishna Chaitanya Chundru wrote:
> > > Add a common helper, pci_host_common_d3cold_possible(), to determine
> > > whether PCIe devices under host bridge can safely transition to D3cold.
> > ...
> 
> > > +static int __pci_host_common_d3cold_possible(struct pci_dev *pdev, void *userdata)
> > > +{
> > > +	u32 *flags = userdata;
> > > +	int type;
> > > +
> > > +	/* Ignore conventional PCI devices */
> > > +	if (!pci_is_pcie(pdev))
> > > +		return 0;
> > > +
> > > +	type = pci_pcie_type(pdev);
> > > +	if (type != PCI_EXP_TYPE_ENDPOINT &&
> > > +	    type != PCI_EXP_TYPE_LEG_END &&
> > > +	    type != PCI_EXP_TYPE_RC_END)
> > > +		return 0;
> > 
> > From https://sashiko.dev/#/patchset/20260429-d3cold-v5-0-89e9735b9df6%40oss.qualcomm.com:
> > 
> >   If the topology contains an active conventional PCI device or an
> >   intermediate PCIe switch in PCI_D0, returning 0 here allows
> >   pci_walk_bus() to continue without clearing the
> >   PCI_HOST_D3COLD_ALLOWED flag.
> > 
> >   Does this create a situation where the host bridge might
> >   aggressively power off the link, dropping power to these active
> >   components?
> > 
> > I guess this is intentional, since you have comment about ignoring
> > conventional PCI devices.  But this does seem like a potential
> > problem.  Why should we ignore switches here?  And I think it's still
> > fairly common to have a PCIe-to-PCI bridge leading to a conventional
> > PCI device, and I don't know why we should ignore them.
> > 
> > The commit log consistently refers to "PCIe" devices and endpoints, so
> > maybe there's some reason that I'm missing.
> > 
> > There are other sashiko comments on this series that I think should
> > also be looked at.
> 
> This series is all in pci/next, so you and Mani can decide on whether
> any sashiko comments need to be addressed.
> 
> Even if there's no code change, I think it'd be nice to have a brief
> comment here about why conventional PCI and switches are ignored.

Looking at the helper again, I think we should allow all PCI/PCIe devices to
take part in the D3Cold check including Switch, Bridge, RP, RCiEP and RC-EC.
Some of them like RCiEP and RC-EC cannot be put into D3Cold by the host
controller drivers individually, but if they are bound to a driver, then there
is a possibility that the driver would want those devices to be kept in D0 for
some reason. In that case, the host controller driver should not broadcast
PME_Turn_Off.

So I've removed the PCIe device checks altogether including the check for
conventional PCI devices in the PCI tree.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DA4CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Sf1SMQC28bDRL9mfOLMubwubEk1ClyBVQ/X/6xOLHzc=; b=ptV6GCuBoiTb9U
	i/vJrrvUYRm/uzjykJCwcuzTYFYXtPaDX3pA7sh3YjXMdr1vWeFjRtzkHH15aamtEK79n5jfF+rXx
	5vEuibe65DB7lk4aUsCrqllhSVYT1B0FfhuxLvRbzOKsstxyiDVUDd5t6+OMY4gpOQ7wVboeOHCkL
	ZzTBQjIwe6Y+csRWHSreofeyQd0HwwZNH9ZdJOw3lGKIgMVeitaCbxuj6fm5pGV8kpU7Umf5Pih5R
	Mia7xjMKZvJFPXeMwl7gDPe55yeT7kye3LaPxBL65ia7jJtZeE2ZFEKVkkOWBx9ninMABATI5ElVT
	beMFMXFAwzF1vcg67nUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnWJ-00000005iuL-3iAY;
	Wed, 20 May 2026 20:27:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnWH-00000005itW-2rFC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 20:27:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E8C114456F;
	Wed, 20 May 2026 20:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9C32C1F000E9;
	Wed, 20 May 2026 20:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779308876;
	bh=Sf1SMQC28bDRL9mfOLMubwubEk1ClyBVQ/X/6xOLHzc=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=Tzb1Ret77ExKLvkEHhl993AAxmn1PQZDUTwx1VawQJyrOOaiXEOcOhOUXf4DIQxVg
	 xBtX0U8pNf9//BzKJH6MzU6mvOMjZiqc6gcibTTnVMyFFttt/mGxPG23JhfredhdtC
	 gHofPsuO6hd3CxCZE+fqiEawS+IeZgoZ5XyhksIeYLSi17kBZmGYcR9c/k0ThnMxef
	 hA/in1OvY9BzhpP3Tf8n4DHdPKNnG+OF1WCv0K3JBl91IrM53Ojf81RZ298bR6C4eR
	 bHD9eFR/fXqfcBw2VYfh/e6mMt/pS8p1NKwgTopsZyOMq/04ZW2BgRVHwv2ru2o26W
	 4LS/8EHAyDBNg==
Date: Wed, 20 May 2026 15:27:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com,
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v5 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
Message-ID: <20260520202755.GA120626@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519223901.GA20376@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_132757_744649_8F221FAE 
X-CRM114-Status: GOOD (  21.66  )
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

On Tue, May 19, 2026 at 05:39:01PM -0500, Bjorn Helgaas wrote:
> On Wed, Apr 29, 2026 at 12:12:23PM +0530, Krishna Chaitanya Chundru wrote:
> > Add a common helper, pci_host_common_d3cold_possible(), to determine
> > whether PCIe devices under host bridge can safely transition to D3cold.
> ...

> > +static int __pci_host_common_d3cold_possible(struct pci_dev *pdev, void *userdata)
> > +{
> > +	u32 *flags = userdata;
> > +	int type;
> > +
> > +	/* Ignore conventional PCI devices */
> > +	if (!pci_is_pcie(pdev))
> > +		return 0;
> > +
> > +	type = pci_pcie_type(pdev);
> > +	if (type != PCI_EXP_TYPE_ENDPOINT &&
> > +	    type != PCI_EXP_TYPE_LEG_END &&
> > +	    type != PCI_EXP_TYPE_RC_END)
> > +		return 0;
> 
> From https://sashiko.dev/#/patchset/20260429-d3cold-v5-0-89e9735b9df6%40oss.qualcomm.com:
> 
>   If the topology contains an active conventional PCI device or an
>   intermediate PCIe switch in PCI_D0, returning 0 here allows
>   pci_walk_bus() to continue without clearing the
>   PCI_HOST_D3COLD_ALLOWED flag.
> 
>   Does this create a situation where the host bridge might
>   aggressively power off the link, dropping power to these active
>   components?
> 
> I guess this is intentional, since you have comment about ignoring
> conventional PCI devices.  But this does seem like a potential
> problem.  Why should we ignore switches here?  And I think it's still
> fairly common to have a PCIe-to-PCI bridge leading to a conventional
> PCI device, and I don't know why we should ignore them.
> 
> The commit log consistently refers to "PCIe" devices and endpoints, so
> maybe there's some reason that I'm missing.
> 
> There are other sashiko comments on this series that I think should
> also be looked at.

This series is all in pci/next, so you and Mani can decide on whether
any sashiko comments need to be addressed.

Even if there's no code change, I think it'd be nice to have a brief
comment here about why conventional PCI and switches are ignored.


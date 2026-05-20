Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525B1CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QokDhHnAKqLWHjogTXLoR4DHLEoCdHeJVwDfmUpDWFI=; b=CNVfir/l0MpR+L
	nLeEnKFionnyyzZO2dskAUsGnLXnB86oOhZRPwvm8boPRelM9sFHfivKY04kY00qQJWcQrJvwsyml
	Va0A2AQWIM1zXo2z1Cn49t+GGDseG4gd9VUgSWu4+b5gC9GKC6PjQNHozjF9JPgvXl9gIiRMH5l5j
	aq8efbJMSGYVfzgT1tKs53/0Y/Jd9S/O/u4f65L7LUvz36f2pVccD2DFOXffHa00m8M8y7WxeAea3
	yY8V9/QHWXJ1wo51xjLVGrQwlW5yw7BZbnycoVVuzU4IPUDi1q5mYF9fle/SIz1u0M14E6UoOKCA2
	KfyQZbeGrFNGsA4RKyyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPl1W-00000005LV6-38Fq;
	Wed, 20 May 2026 17:48:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPl1V-00000005LUd-1gES
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 17:48:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 6250E60129;
	Wed, 20 May 2026 17:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E55DC1F000E9;
	Wed, 20 May 2026 17:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779299280;
	bh=QokDhHnAKqLWHjogTXLoR4DHLEoCdHeJVwDfmUpDWFI=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=X59zp2JT2ThlWcF8Vwx5hipnuU3pVcb+NfDjk2Z2sHtYDjkv+g3dJ0zZr2SGgl213
	 1C0hCo1gnbyqdhUCR+J6gzpc8QSsRa50+ECq21EUTPKSlop5c2ppovIB2kN3lPYiDQ
	 GR1Ypw4utLINVSrZVNL5Ysm4lJlrsSdcXXrYlEYy81+++le0P7+ckaH3kTfZIPhd/h
	 G5L5/+OpcbEO3IC+73xXcXcYHpivSRqU3jGXcMYQKbRNtlDpVoDXwc8ETE1DGBGa/B
	 FzvalrcDibzcUjSlRfzL+b/TJhLoq8ZU6IGme8BJScJjxXYhD+VHvlU8uda6mLonKz
	 zFY9Io0VLlY6A==
Date: Wed, 20 May 2026 12:47:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, will@kernel.org, robin.murphy@arm.com,
	bhelgaas@google.com, joro@8bytes.org, praan@google.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, dan.j.williams@intel.com,
	jonathan.cameron@huawei.com, vsethi@nvidia.com,
	linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v4 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Message-ID: <20260520174758.GA66039@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag3vb4SWIfuw++vp@Asurada-Nvidia>
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

On Wed, May 20, 2026 at 10:29:19AM -0700, Nicolin Chen wrote:
> On Wed, May 20, 2026 at 11:20:43AM -0300, Jason Gunthorpe wrote:
> > On Tue, May 19, 2026 at 06:04:18PM -0700, Nicolin Chen wrote:
> > 
> > > > Yeah, that's fair, so let's rename it to 
> > > > 
> > > > pci_translated_required()
> > > > 
> > > > ie the device requires translated requests to function. This is what
> > > > CXL.cache implies (IIRC I was told the spec specifically says this)
> > > > 
> > > > Requiring translated requests implies you have to enable ATS in the
> > > > system.
> > > 
> > > Perhaps we could let IOMMU drivers check:
> > >   pci_cxl_is_cache_capable() || pci_dev_specific_is_pre_cxl()
> > > directly?
> > 
> > I'd rather have a single function.
> 
> OK. Can we use pci_ats_required()?
> 
> CXL spec explicitly used "ATS" when stating the requirement of
> CXL.cache). And it'd fit into the existing pci_ats_ functions.

OK by me.

You already have a comment in the code about the CXL.cache
requirement; thanks for that.

I don't know enough about CXL to know what's behind the ATS
requirement.  It sounds like it's more than a simple performance
optimization.  If you happen to know the reason, it might be worth
a short comment about that too.

Please add a one-line comment in the code about why we check
Cache_Capable instead of Cache_Enable, i.e., even if CXL.cache is not
enabled now, it may be enabled later.

Bjorn


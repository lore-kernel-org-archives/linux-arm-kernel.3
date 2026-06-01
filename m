Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC7DCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sldHCJrVX7HHPNnZ6TyMOXSdYqXeIyil59tqXzT91Q=; b=X/ayrYmGflZenx5MNos3kBOQDU
	5QezdBqDrvaOC4ZBI5CaZij2FbKAJBqhIz1A8hTZE1C7WlHcSjteRNsCli69nsRyyyvzKwOx/ULcd
	ij7LTUXmHdKSo7CPA0JxiGGt1Ap7jVHS4TszSTRB4BZ/k3IbYNc2S7El6fkaGxK8oZumEDB2rvSx2
	aIDerbysv5OJM8ZxgGIeDUq9pFf7aUVqLyu/2XFtPW1uFOIzU9dtDUB7ezg9Q/5HQFwRkTkseiQnX
	ATy2Qs6VfDCAsX8K/hcvnWX/aIrxtryXryPyKwHyGWQRC+a7kznuLQC3c9eaUoR+09uFjHyhsDekU
	5ojxapyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU05F-0000000AdsO-3zeU;
	Mon, 01 Jun 2026 10:41:25 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU05E-0000000Adrz-0JQq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 10:41:25 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf22c18ad3so135ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 03:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780310483; x=1780915283; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+sldHCJrVX7HHPNnZ6TyMOXSdYqXeIyil59tqXzT91Q=;
        b=CDaON2eZzw6J/seArAflbFxrNhMXmJ2cjBfVd1NkqIF4HfRj3UHQ8BYxjsgKWqaqQ1
         KQ6Krm0aVx1Li2VG2D/7b7MM+RCYc0j4CZyvcTXGfyiFfOsmgnVw1T5wJM//w3blX46/
         mOIBKJGEwKMAC7cjGAXRgthDfh3vfmKCNaM4RsCQMH9/bylCrG4aLR3eqHfzj2NM9btU
         1Z0djlkxQCNZoEcqpXVHgVJMqRrq1LuJ7ISn0RSVQiy91hPMYTu4eQGxn4goASjzOyYK
         yxyyWX5/QTtCEnpMZWEHRoT+80jGTO2yEq9fqSWb1UhgSsseGz8FmMSN/0t+pQa8hRyP
         CSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780310483; x=1780915283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+sldHCJrVX7HHPNnZ6TyMOXSdYqXeIyil59tqXzT91Q=;
        b=gzgdiFQioRrUZjlgKRgY1fO6hV/DGZmIC2rJ6AIJNlzM/i13Cyj9AH/YqGlUnsvHvs
         4ZQm4eZqKft7OoobmzEwVjwOlmmO47uRfXw/Kgo27Tq1M/I9gZDjNSIU5ZLggp16jOdC
         4Nrzu9lim9cK7Ri8+nyqyJx3N5NYU+7Q11vEtKbxJwSWK4OMtQ2PV89kdoFd7ezUIROF
         m9lw87fcAf+loAVesDolsJ0asZSWZZmLxOI0J7O5jlghQmkJG98bN9T9g6Dz05nkFVgt
         aXsvkyqe99Ip81b3uWzQYWYNG6O4suoZ2442gPe7nCbW2nQcTCE5hYjJLTVGm6lAKljv
         Td/A==
X-Forwarded-Encrypted: i=1; AFNElJ9FlHNQwMABECdRTBg074VMSnCtDRk94bsJmbjtJQyhJtfp5Vy/9ogj1S9lp6MvqVmJl3/NFQrXV5xdl1Y8WwBz@lists.infradead.org
X-Gm-Message-State: AOJu0YwpsvySGCs5xvQdeqAdiWAuvAYUnLPtMfZ7pTi/NydNhmyOA5XQ
	OJLPUay9IkIVPPezECIRGUl20rBDTqAl8qweHxU5/mYWNLfZnStqf5mUFCLvm9IYzw==
X-Gm-Gg: Acq92OGSKQKJKpv8nTYejDarB4T3mjzKiqwmRlydbhpyjUiW7XBD+7I7JPFKvwyZ+k5
	CwRu0VAHvImqMSlqeKFViZardJbguGkBmmrn69w+DRLfbcfOwkUVJMYwqAoj0OZXHRhHsQSV7BE
	KSmh85rKWU9PwTKWKqzj25lczaVCNp3IYPd9A3LdMRUwBXttdNbMkQ+VW5dVd0fJXbN6Zl/CrYZ
	4L+05qwmbsn4PL9FhpWMES0lvXDe2K3HG26KmvfP9XrQ/SX+RatFzI7RcyuXmFJaWE8w+x7TvMM
	+EkdMWJfgr7nmhCqNp+7oeTHztPtVdSOv+RvcNI8YZxGrRGqOqIX1nUrr5NzNibBYCSJsnPxQ9i
	AyrEnNhtnASGWQRlgRVjidu4CdKcPQrn5x8BZ1801uwGhItiJ6Yl9OqxnxgLHsVVTzSKBtBsDc9
	uCmhwxwLN8tBcsbceO9lydf52+ECNYde+FjRibZmoxqs9ePCSR6dPBWD9/M0SBlYyuZNrkSxE=
X-Received: by 2002:a17:902:da81:b0:2c0:c14c:bf37 with SMTP id d9443c01a7336-2c0c14cc181mr2103265ad.16.1780310482513;
        Mon, 01 Jun 2026 03:41:22 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84246844780sm4225556b3a.30.2026.06.01.03.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:41:21 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:41:14 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Vasant Hegde <vasant.hegde@amd.com>
Cc: Ankit Soni <Ankit.Soni@amd.com>, iommu@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	David Matlack <dmatlack@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v6 6/6] iommu/amd: Fail probe on ATS configuration failure
Message-ID: <ah1hyp0oB5iJenQt@google.com>
References: <20260529111208.387412-1-praan@google.com>
 <20260529111208.387412-7-praan@google.com>
 <unqzyef2n26wdf6tmc6vvwvpsgv244uvz7cxji4scymqmoofyb@trkzr7ix5bog>
 <ah0kyi5asHpnrpgC@google.com>
 <6086ebd5-4538-4b85-bbd3-84df9c6198d2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6086ebd5-4538-4b85-bbd3-84df9c6198d2@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_034124_147425_42418584 
X-CRM114-Status: GOOD (  37.86  )
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

On Mon, Jun 01, 2026 at 02:58:11PM +0530, Vasant Hegde wrote:
> Hi Pranjal,
> 
> On 6/1/2026 11:50 AM, Pranjal Shrivastava wrote:
> > On Mon, Jun 01, 2026 at 06:00:15AM +0000, Ankit Soni wrote:
> > 
[...]
> > Hi Ankit,
> > 
> > Ack. Sashiko made me realize that this regresses IRQ mapping for AMD,
> > and I agree that the call to iommu_ignore_device() is a bit too 
> > aggressive as it  wipes the rlookup_table entry required for IRQ 
> > remapping, particularly in PD_MODE_NONE.
> > 
> > I was thinkig to address this in the next version as follows:
> > 
> > 1. Split the probe error paths:
> >    - Proper init failures (like iommu_init_device) will continue to call
> >      iommu_ignore_device(). I will fix the double invocation here.
> > 
> >    - Config failures (like ATS mismatch or PD_MODE_NONE) will return an
> >      an error but skip caling  iommu_ignore_device(), preserving the
> >      rlookup_table entry for IRQ remapping.
> 
> I was reviewing v5 last Friday and decided to fix probe() code as its been long
> time I wanted to cleanup this code.  I have a patch series which pretty much
> does this.
> 
> I haven't fixed iommu_ignore_device() code, but should be simple to fix it.
> we can use amd_iommu_make_clear_dte / amd_iommu_update_dte. It will set the
> dte.tv=0 and essentially blocks all DMAs.
> 
> If you already have the patches then please go ahead, else I can post the series
> this week.

Hi Vasant,

I have drafted the fixes (including the alias clearing order and the 
atomic DTE updates for iommu_ignore_device), 

I'll go ahead and post them as a separate preparatory series soon.
I'm also happy to incorporate any of your existing patches if you'd
like?

> 
> 
> > 
> > 2. Resolve the Use-After-Free (UAF):
> >    To prevent the UAF on the "DMA-only" failure path, I will ensure that
> >    the hardware Device Table Entry (DTE) is set to a safe state (like
> >    blocked or bypass) and the dev_data->dev pointer is cleared, as the
> >    IOMMU core does not invoke release_device() after a probe failure.
> > 
> > 3. Fix iommu_ignore_device() infrastructure:
> >    I will address the pre-existing bugs identified by Sashiko:
> >    - Fix clearing order (calling setup_aliases before clearing the
> >      rlookup_table).
> >    - Replace the non-atomic memset() on the hardware dev_table with an
> >      atomic DTE update.
> > 
> > That said, I'm investigating the safest way to revert the MSI domain
> > assignment on probe failure to avoid the dangling domain issue pointed
> > out by Sashiko. Maybe we can add an amd_iommu_restore_msi_domain() helper
> > to revert the assignment made in amd_iommu_set_pci_msi_domain() on probe
> > failure?
> > 
> > Please, let me know if that sounds okay?
> > 
> > Also, I'm wondering if I should send this as a separate series specific 
> > to AMD which is unrelated to this one? Or maybe handle AMD IOMMU in a
> > separate series altogether. Let me know if you (and Vasanth / Suravee) 
> > would prefer that?
> 
> Lets separate out AMD fixes part as its not related to this series.
> 
> If you want to keep this patch then just the "iommu_ignore_device" part that
> should be OK -OR- if you want to drop entirely and pick it up with AMD specific
> series that's also works for me.

Ack. I guess a separate series to handle AMD IOMMU sounds better. I'll
post one soon.

Thanks,
Praan


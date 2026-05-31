Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5002DCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtFz/hC3O8enmBfuHY94wDqD/sImgOOHpNXD3ZxO5m0=; b=PRFaW2Qj+NWnT9KwqkY0gK/DbD
	Ud/c9lN8KkdqUuD9d+JvEnilMM7SYW4uAHhEuJd1vp2sRyjpMkA+6KaL41+edq8cHIE8pvED79smu
	QNXfWQCQIjPQBtfOrhXJVXAbdh4EuLekibzCkvrlpGMa/IwTCynnMPCG/5iCFd/gqokwUgRob7m2x
	oQg15+EI7+5AGOhh47cOpXAvVNWJpoIBKyPGVfLMaPokvzQU5YOdxnImM914nz/12zsAn6BmrBvyn
	IZQWXxRTSUIKJysHZGBJCiN07UFfPzCRft3SpBtIYcxGvmoqYnwu5fw3wGcmviwaBk4MBgw8823rG
	iOaEUukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTjjJ-00000009mUr-27ZT;
	Sun, 31 May 2026 17:13:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTjjF-00000009mU8-3rGM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 17:13:40 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2bf2d865383so115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 10:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780247617; x=1780852417; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qtFz/hC3O8enmBfuHY94wDqD/sImgOOHpNXD3ZxO5m0=;
        b=LewIW2zIhNV6YNLk0OCCRhxhRYGNyFmkm9KchELYS9fbzGvMmDdgtXDZCUn5KM/qXL
         e2rUvdHTqKjwFT0JE7y4nLk/mjENnCf/n98+zuKjeAFo9+4BGor8OuS9HF3ABH4Hk/A+
         3aOTOJbGWRH8e5nbwIPCPRBI5ci0hGRXK84s/dAonB4ayti1ncMaL7m8zvW6zihNFvNL
         Q7UPzyuOkXVa8NqM5RL+2H6qCtRN4dfyETKZUg+euAUeGCZjJ4AewQGm1AOgyeMINpnJ
         AxSctvzrHnSvmaIG7Bu9TZE1umRDVhcs1bUEFDDkPHiQyCPciZgYieDmPbBJWGptwPM1
         zYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780247617; x=1780852417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtFz/hC3O8enmBfuHY94wDqD/sImgOOHpNXD3ZxO5m0=;
        b=aVghZPKx/SrdMeDEXI8lCUhLiwm631jWl090luK65HxUy4eA8FEnfhRoAEEIEYyXHy
         tnvzjDAhSHKvDVA1aueUuefxTSpynaPgRy7M0lIKigEFdXOt2PGEeRRCvRHfTVE/XuxX
         5yNhrB2FNAYR904h+oaRX+z96XU4A2AnhVmcJC6gEeBw3GF6zTNc/bv0k5S836stVNrK
         5eM2HtMI/olqwg9QdpVmTBG7PxY7AFT80ZwGf3IwSojywQLXI25QoSSNh5DGhnOo0FLc
         e44LCuLdtgWaQSjLXGcIwjyXJqb31K+hcXt+tO6h5I5FB7+50VRNk3zULUh8X7WOAlwl
         /Cwg==
X-Forwarded-Encrypted: i=1; AFNElJ8oxbhfcBnLobUiUBpLC0It+Ns6zpZa8iZguXAD4+UWgzkRaJRBRMSd7kUeKsQ/3fT+P1hquLsBTqo+L3g/qCNa@lists.infradead.org
X-Gm-Message-State: AOJu0YwVt2JO+nYyxmqqI+LBxBNzZDNDysQVYNN3ZBOZECSh0bTlqWIX
	g+o2fyA3PqtYb/kHa37fikl8OJZ/IUYRc8BhrCHQjo3J/rnGcIossFE90FVedH15zA==
X-Gm-Gg: Acq92OE6RMiYwdTubPM/Q8ed7IjevmYUHfpo19sqTk4YU3hmG5Axwb9RCN5Ud/KeIwe
	g6r54tGceIz2rHO4EGzcXAVM/N2TnTiyJ8NjVli2+41m1C0wSmCe95Y4/MQ2Mvv3ar0g9Yne9R+
	OtvfUu/GqnOJS6r6/Ju4mSGW+80yRBgtzVtBjCdfV7Ev5UVv1vNlVSMgin3ku/u1WBlWslUqkc6
	kHZ3MAt+nKOchwPkHqA96aEn4LA2BokznNBV8v7SRL6zoQpWs+cQW57PYRASGkMqUSisOKb0omO
	U3CwD7dkMF9nbzVqCbKTa8YJVNr2rDKB5DGfeSei3XOyb0Qtb6zNVxRAGqK7PZozMl8TlRe3egE
	SRAp+drN1hOxZ0Pq+CBxTiIBUYUWSovLxvl3bX+6gF5AOqbW+Jj165P5Z3X66ycoHxEbF5o6WKP
	pJMogW9OQu8fbh7Ff3/eUECHqJnMYS2XEH0beKzzR06mATbiguRq8gMqqL/EMkIn/P/OMhD+Q=
X-Received: by 2002:a17:903:41c6:b0:2b0:b0c9:96e2 with SMTP id d9443c01a7336-2c07cb6c77dmr2512555ad.21.1780247616106;
        Sun, 31 May 2026 10:13:36 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b01727sm84542255ad.53.2026.05.31.10.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:13:35 -0700 (PDT)
Date: Sun, 31 May 2026 17:13:28 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, David Matlack <dmatlack@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v6 4/6] iommu/arm-smmu-v3: Standardize ATS enablement
 failure reporting
Message-ID: <ahxsODjvubhUjJjG@google.com>
References: <20260529111208.387412-1-praan@google.com>
 <20260529111208.387412-5-praan@google.com>
 <ahoKeEmFhU8nWV3P@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahoKeEmFhU8nWV3P@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_101337_960647_3DFF0EB5 
X-CRM114-Status: GOOD (  31.40  )
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

On Fri, May 29, 2026 at 02:51:52PM -0700, Nicolin Chen wrote:
> On Fri, May 29, 2026 at 11:12:06AM +0000, Pranjal Shrivastava wrote:
> > The SMMUv3 driver currently has a two-phase commit in its ATS enablement
> > flow. During arm_smmu_attach_prepare(), it predicts whether ATS will be
> > enabled using arm_smmu_ats_supported() and accordingly increments
> > nr_ats_masters and merges ATS invalidations into the domain's invs array.
> > 
> > However, the actual hardware enablement via pci_enable_ats() happens
> > later in arm_smmu_attach_commit(). If this call to pci_enable_ats fails,
> > the SMMU driver's ATS state tracking remains polluted, i.e., the driver
> > tracks ATS as enabled on a master that is not actually using it. This
> > leads to an incorrect nr_ats_masters and triggers a warning in the PCI
> > core during detach:
> > 
> >  1 [  127.925080] ------------[ cut here ]------------
> >  2 [  127.925084] WARNING: drivers/pci/ats.c:132 at pci_disable_ats+0x94/0xa8
> >  3 ...
> >  4 [  128.068169] Call trace:
> >  5 [  128.070603]  pci_disable_ats+0x94/0xa8 (P)
> >  6 [  128.074688]  arm_smmu_attach_prepare+0x104/0x310
> >  7 [  128.079292]  arm_smmu_attach_dev_ste+0x128/0x1e0
> > 
> > The issue was exposed under heavy load when running a VFIO-based DMA
> > map stress test (iova_stress).
> > 
> > Following the addition of the arm_smmu_master_prepare_ats() [1] helper during
> > device probe, failable ATS configuration (STU setup) is now handled early
> > during probe. This ensures that any master reaching the attach phase is
> > guaranteed to have a valid ATS configuration.
> > 
> > Update arm_smmu_enable_ats() to use the WARN() macro for any
> > subsequent enablement failures during the commit phase. Since probe
> > checks now preclude software configuration errors, any failure here is
> > considered a kernel bug.
> 
> The commit message feels like mixing a stale background and the
> real requirement (based on the latest code line). Could that DMA
> map stress test still trigger the WARN_ON in pci_disable_ats(),
> after having arm_smmu_master_prepare_ats()?
> 
> It'd be nicer if the writing can be simplified a bit.

Ack. I'll re-word and remove stale context.

> 
> >  	arm_smmu_atc_inv_master(master, IOMMU_NO_PASID);
> > -	if (pci_enable_ats(pdev, stu))
> > -		dev_err(master->dev, "Failed to enable ATS (STU %zu)\n", stu);
> > +
> > +	/*
> > +	 * Any failure at this point is a kernel bug. pci_ats_supported()
> > +	 * and pci_prepare_ats() have already verified the hardware capability
> > +	 * and programmed the STU. Thus, pci_enable_ats() should not fail here.
> > +	 */
> 
> The patch that removes pci_ats_supported() from pci_prepare_ats()
> is dropped in this v6. So, my previous comments may stay true and
> the two lines can be enough?
> 
>  	/*
>  	 * As pci_prepare_ats() have already verified the hardware capability
>  	 * and programmed the STE, pci_enable_ats() should not fail here.
>  	 */
> 
> > +	WARN(pci_enable_ats(pdev, stu),
> > +	     "Failed to enable ATS (STU %zu)\n", stu);

Ack. I'll update this.

> 
> https://sashiko.dev/#/patchset/20260529111208.387412-1-praan%40google.com
> Please check Sashiko review (for other patches in this series too).

Yup, already sent out a series [1] to address Sashiko findings
separately.

> 
> I think it'd be cleaner to just have:
> 
> -	if (pci_enable_ats(pdev, stu))
> +	if (WARN_ON(pci_enable_ats(pdev, stu)))

Sure.. I'll also maybe keep the dev_err log that we have, knowing STU
mismatch is slightly helpful.

Thanks,
Praan

[1] https://lore.kernel.org/all/20260531170254.60493-1-praan@google.com/


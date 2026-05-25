Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987CACD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWhZgy3CvZVYPvW9umuB7DRocYTW3QJrl2ACJkt8tw8=; b=HkzIefZmNjC462dajx5aP8UOpY
	D0F4hwZB0hpdSdXJOTt1PovQMbTs33ovvmfwig4feQJtG98R3XT6fNacNQEX0qFJ7ZcHl9ej2m0kU
	mhIbDPmIt/uGN3a5sp22qquTKEqEogoUja3GDtd8+fQrurGfjNPI/fGRRkqSETe6SvVGaugoIlbSL
	3jTIDptg1KPHyvC3PA8SZVLjuRVe44GVjssU/QCXnqEHRduVBPa1LLgRhfZz0s61HlQLenFywwCGa
	MZoJ0NUDOzEHAW1WXQlesCx3NpFuXGjkP5Ub1gBULEHG0z9bQRmgNYPLaREbB0mA+jh2t6IAvT1i2
	kMSpz8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbwa-00000000Pjn-0w4W;
	Mon, 25 May 2026 20:30:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbwU-00000000Pim-3CpM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 20:30:34 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ba180a022dso75ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 13:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779741028; x=1780345828; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zWhZgy3CvZVYPvW9umuB7DRocYTW3QJrl2ACJkt8tw8=;
        b=q6O+vqwVM5BYaJwEonPb9aLIRK6cRLTLr46uRlGvtKTS5Z8JSsLssH+aMa7Hoxsow/
         pZI95ai9zD4a3+QHwv2ka/7br4x9wYDXsqrTEx/f0xzxpgbln4w4F3tvEVM96AnCIS0Q
         Su5oOHGJimlyQb1k5SM7hZqx42QGGAtS7qNRDuUEK5DJtTsc3CYaIRpnf4zDi2tqH+5H
         diEnZ4JaKKNaqc1Js8mzytsZpLG+An5legME0a0OSRtqm1+rbrll4sMBMyOabgpeNYeL
         fViRi6DbnrypjXWSf32MthpeluJFczUkZyYaS0EamDH1KXLWK89UVWqahQ/VRcOeaXzp
         r3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779741028; x=1780345828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWhZgy3CvZVYPvW9umuB7DRocYTW3QJrl2ACJkt8tw8=;
        b=lma3ZAMxG82U86En6zPTfhD5RBq8w8BJyAK+bh9Gpcf2r3H+H4F/RzbLgBgl1iltyy
         jchsl4QZlZ7+GV/4xLZtYUc+5MRpMmFytfituLRkrOAnxmZvE8UNpAlx4PsKOU/e6e41
         kXcj8AfdIoOjarkr2EtbgV1tS7llzb11Zp9x44RqiP3Ba9Ew4sUL3vYz3s11SBMzloR6
         qmv4m+lF5cwvAgX7IlbX5DZiFgIgQLL+uoAib8lHet3wAGdm0QMhkcofw9drrjs1sQz7
         HAWXK72jyW5litnuuUx1zBiPTLeYdyPhTP2duF0372swjOrwtm3ffxDX52xHXlRS088g
         CyGw==
X-Forwarded-Encrypted: i=1; AFNElJ9AvG0uLdqd2KhBZKEhNyHxJSfYthmWuIzMcUsQlCdvcScaUS6iOJGb5xGC5JXobxd2f6sq+j09ZrDUCfICD4Ku@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4jtmUzMhZuYA7Pu6dEVVscdUokudeVjAf1Ufl0gMc0XAwetX4
	I5kT1iztHMJx1OywIqpSnX59k1XlVddfLvRVtRnBiKJ+qTE0wNT2pufk291ScmyQ9A==
X-Gm-Gg: Acq92OE7EP7h87MGGRew8dIcW8EXuSRmRd6ktn0r9UCx0I/ii5MzE0tmT22mb//J2fD
	SyIkKRIhL7QJAb12dIxAAcsjbRbR/ecS3esMDA9cFjtnuVU/4iB+aQN908JCzrrWcXOz48M+Bw4
	pRwnx/GFj51uGQxeKBe6FI6uqEVIhUNvlncIk45zOVsbIJNrQ30hOBRROgTVTaUZmu/HSLEGGfx
	oyqMhkp7h03C40NoM10ZQBy5fCcuPRpbSLPZJIemwLNPsb5DGrVW8RMuWw629SHZhSEr+Yo8AEl
	ahMFStIOMvGQhxNfc9NS2VGY9jwtmFZwwsxWZ7h3FA94IBw/tikK21x9QL8gxIDfeZUOVadgEos
	8BKt2QwfNOweVlzTmxD3Ysy6AfyPwDudD8z1fWwJNLSEEhG6+Dt8Fp4V2TfpWvoMlBi9OwoOSY8
	dwHY30DDQq5Cyp8RXDw5DI0RymeHuCYpY35gTqlNo4YtHquDI08PnEdx95fT7Dd7jieOU5
X-Received: by 2002:a17:903:1aeb:b0:2b4:6529:7bae with SMTP id d9443c01a7336-2bec11c2cc4mr3609585ad.17.1779741026873;
        Mon, 25 May 2026 13:30:26 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36adc0a6e94sm4597808a91.4.2026.05.25.13.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 13:30:26 -0700 (PDT)
Date: Mon, 25 May 2026 20:30:18 +0000
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
Subject: Re: [PATCH v4 3/5] iommu/arm-smmu-v3: Fix ATS state tracking
Message-ID: <ahSxWoWd5hFvKE_R@google.com>
References: <20260525184347.4059549-1-praan@google.com>
 <20260525184347.4059549-4-praan@google.com>
 <ahSrkOv+4QZWrcJq@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahSrkOv+4QZWrcJq@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_133033_546743_FBBF6171 
X-CRM114-Status: GOOD (  26.64  )
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

On Mon, May 25, 2026 at 01:05:36PM -0700, Nicolin Chen wrote:
> On Mon, May 25, 2026 at 06:43:45PM +0000, Pranjal Shrivastava wrote:
> > @@ -3065,8 +3065,14 @@ static void arm_smmu_enable_ats(struct arm_smmu_master *master)
> >  	 * ATC invalidation of PASID 0 causes the entire ATC to be flushed.
> >  	 */
> >  	arm_smmu_atc_inv_master(master, IOMMU_NO_PASID);
> > -	if (pci_enable_ats(pdev, stu))
> > -		dev_err(master->dev, "Failed to enable ATS (STU %zu)\n", stu);
> > +
> > +	/*
> > +	 * Any failure at this point is a kernel bug. pci_ats_supported()
> > +	 * and pci_prepare_ats() have already verified the hardware capability
> > +	 * and programmed the STU. Thus, pci_enable_ats() should not fail here.
> 
> Nits:
>  - WARN usually indicates a kernel bug already.
>  - pci_prepare_ats() covers pci_ats_supported().

Ack. For the pci_ats_supported.. since we're failing probe if
pci_prepare_ats() fails, the idea was to call prepare only if ATS was
supported [1] i.e. not penalise non-ATS callers of pci_prepare_ats. But
I agree.. maybe a better way would be to factor our pci_ats_supported().

> 
> 	/*
> 	 * As pci_prepare_ats() have already verified the hardware capability
> 	 * and programmed the STE, pci_enable_ats() should not fail here.
> 	 */
> 
> > @@ -4264,9 +4270,16 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
> >  		master->stall_enabled = true;
> >  
> >  	if (dev_is_pci(dev)) {
> > -		unsigned int stu = __ffs(smmu->pgsize_bitmap);
> > +		struct pci_dev *pdev = to_pci_dev(dev);
> >  
> > -		pci_prepare_ats(to_pci_dev(dev), stu);
> > +		if (pci_ats_supported(pdev)) {
> > +			unsigned int stu = __ffs(smmu->pgsize_bitmap);
> > +			int ret;
> > +
> > +			ret = pci_prepare_ats(pdev, stu);
> > +			if (ret)
> > +				return ERR_PTR(ret);
> > +		}
> 
> Again, pci_prepare_ats() covers pci_ats_supported(). So, the check
> is redundant. Instead, it should check arm_smmu_ats_supported().
> 

Ack, I'll add a check with arm_smmu_ats_supported

> By the way, this would conflict into my series:
> https://lore.kernel.org/linux-iommu/18bb6f421b3be891caa8f1fb50f3a4d56b52d5be.1779392420.git.nicolinc@nvidia.com/
> 
> It would be nicer to have an arm_smmu_master_prepare_ats() so that
> both series would have a common ground; mine would be just adding
> some additional lines if your series goes in first.

Ahh yes, I was thinking about the conflict to (I'm yet to review the
series though). That makes sense, we could add 
arm_smmu_master_prepare_ats() for clarity

Thanks,
Praan

[1] https://lore.kernel.org/all/20260519145947.GK7702@ziepe.ca/


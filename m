Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B44CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5q3gOIhDAVqYSRxkfcmclYVTj3UlMX250M/GhPgP2Y=; b=ce+zMPo0ZDmByIYiVKboMf5cMY
	AKsFKMlG5SQc3WaP6G+vc07j+d3VGO5mBBFpqxYTzNXKPhwK6a/cwkNJFtplZESmLAQM6lMHdXXN3
	a7Ri+5UYy1F9y8OFzY153Y1m1Of7dDuPnITO730ymSj+QWz+jcpa7cdejlNyIWA77rgsootWkz8+I
	z5sWPzsnMk6P+yXAnKbQyIXwwbbt+Jninpju6Y/aHanD8memMB1c3kI+D88bUMIhs8Ib7RbZq4AmB
	WBIT7/dLVkqia6oPPduOZF9dK3QegkXnJxC8/LH7dKQFIoR1gi/hfWwM9mN59Rhvi7KizlKMJnaqr
	zwxjUO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShKn-00000006Lhm-0YsG;
	Thu, 28 May 2026 20:28:05 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShKk-00000006Lgw-35wb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:28:03 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2b46da8c48eso865ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780000082; x=1780604882; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c5q3gOIhDAVqYSRxkfcmclYVTj3UlMX250M/GhPgP2Y=;
        b=H6xOB6v9DfG4MDCNKZQtSqf1Y7zaXqcV2eZA6yytH/4sMZbDvgTKExVDEC68AMswuJ
         MtirXZqwlWVja+3BUWYYPsPhVRrXThSIRQYjb0dEeNnLxW1Ku5PVfQr2JF5BP6uJa1UX
         b5jfaH42p4ZbvrMpeUWC342j0xXa5kV/iCI2jmgc28OKXc9IBQZoe0GekHMgaO/NTxqC
         WaLd/VpOqx94D38r0Tju9+RZsWy1m+iUZeeAI4OaGg2i1qw2+zU80v9K01ySQBYi36Zw
         L2652cNVANSiAtBbxPvBEulZCIAcmE5kJveaCaFz621YoorMaSaByvRTx6ZmdDwZTVE6
         34/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780000082; x=1780604882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5q3gOIhDAVqYSRxkfcmclYVTj3UlMX250M/GhPgP2Y=;
        b=jEOq9OXPTZCyEhyN7G7v+WE12jARSMgAel2OXtqeVU1Xc/0r+btQ+BjS/IGWF6luue
         GfBvBg7bUU9FsbJaBSsFrUNdMhaamnxuepchsULA+Mqyu01kBMIpTRtpMHBUeRyQF+lh
         37jgCk85+TvqLLcTh8UBg6LVi4IUpq3HwU4A748j9T9M4P8Z4AHnJNJLoo+az+YV3lc2
         QuJAR5b56zc+lV/8QBcS2mouE3zw7RkqzNI4xcLEhXaFgkYbTIFg6bOtfhV5B3qvx1PN
         6rGjFM5bTSq3mUr5uRNEvc2IOTDr7IS61s2umgxipoPfQ9UhoYb25eKDXaEyxjuI2M9I
         vfFg==
X-Forwarded-Encrypted: i=1; AFNElJ/QjnOb7Ov5Hy+s/bDB8STZ2J9blzWrSKvg3KifSTgVVsIpO1jn8VeCL78OSjrnWKFUkcZGXx7UECYyEtsZX1vL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1NXdJjn2y9qpvHKujuakY+/WYt/cDVdcAeeMEISS/X3CvG6yF
	NYHb6IlU5XljSHU+Ak6GMXamS7wm+bksMgn/qVBn6Lkv2HWjJ2J1ki5j6GSaUXbwiw==
X-Gm-Gg: Acq92OEX6VUVxCykrSzGNqVlt5VJb01OCFUDMtRreO8xGHGcG3a/avgH5RpC03mN4ce
	XVWLThx1zIBXL44c9Gdd69/lD4c3iENVEBEwoogXcm09xGsnw0ivuPLYoltO2gh4HCLQ6Va8fF7
	/jmviKE+lTi4bXmRUUrGKEekl5mZl2eyua7cNQ3qjpvn667uoQpeA3YPO78v4W5ntAWW043eVHy
	6F/ImAHD39YLCwdPJQRYA3hJTMNADdigR/g2/kQoplR6+7s+l2L0A2n0YHKY5jOjTA5YOfRIQ/8
	1x5RjhFAqjpgyowG2sTnCyNJWqpNsQCVFvPI11AmTqTrbbLNSIC4KlG8eASLETBNZgdFRWCFhox
	CrOoGj23I+vDFxraIvfKhWNVCRxh5iD7KrEa9fa8uJxfXvk+UdZNXK1cP15ICmCRi+xBTQR1F1j
	0XRlsoy67FHcnNW5CEmgYneh5vEznt3m4EnMGQIqzGfNke14y26s+hUOOuX0KKGCC9w6NNHpxfO
	LWlSL8=
X-Received: by 2002:a17:903:1a67:b0:2bd:6dad:3dfb with SMTP id d9443c01a7336-2bf2046519bmr36625ad.25.1780000081220;
        Thu, 28 May 2026 13:28:01 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8572cdd391sm167499a12.0.2026.05.28.13.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 13:28:00 -0700 (PDT)
Date: Thu, 28 May 2026 20:27:52 +0000
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
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 2/5] PCI/ATS: Validate STU for VFs in pci_prepare_ats()
Message-ID: <ahilSL7sGb1pnq5I@google.com>
References: <20260525184347.4059549-1-praan@google.com>
 <20260525184347.4059549-3-praan@google.com>
 <ahSnLeKchpPbz1m9@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahSnLeKchpPbz1m9@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_132802_785295_0F14ECFE 
X-CRM114-Status: GOOD (  22.63  )
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

On Mon, May 25, 2026 at 12:46:53PM -0700, Nicolin Chen wrote:
> On Mon, May 25, 2026 at 06:43:44PM +0000, Pranjal Shrivastava wrote:
> > While every PCI Function that implements ATS has an independent ATS
> > Extended Capability structure with a Read/Write Smallest Translation
> > Unit (STU) field, the kernel manages SR-IOV ATS by requiring the IOMMU
> > driver to configure the STU on the Physical Function (PF) before any
> > any Virtual Functions (VFs) are created.
> > 
> > Currently, pci_prepare_ats() bails out early for VFs, assuming that the
> > PF has already been correctly prepared. However, this creates a potential
> > mismatch if a VF is subsequently prepared with a different page shift.
> > 
> > Update pci_prepare_ats() to validate that the requested page shift (ps)
> > matches the STU already configured in the associated PF. This ensures
> > early detection of incompatible configurations and maintains the kernel's
> > policy of consistent STU sizing across all functions associated with a
> > given SMMU.
> > 
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> 
> Nit:
> 
> > @@ -73,8 +73,13 @@ int pci_prepare_ats(struct pci_dev *dev, int ps)
> >  	if (ps < PCI_ATS_MIN_STU)
> >  		return -EINVAL;
> >  
> > -	if (dev->is_virtfn)
> > +	if (dev->is_virtfn) {
> > +		struct pci_dev *pdev = pci_physfn(dev);
> > +
> > +		if (pdev->ats_stu != ps)
> > +			return -EINVAL;
> >  		return 0;
> > +	}
> 
> pdev doesn't seem useful. Dropping it reads better to me:
> 		if (pci_physfn(dev)->ats_stu != ps)
> 			return -EINVAL;

Ahh, I missed this nit in the v5 I just posted. I'll surely address this
in the next revision.

Thanks,
Praan


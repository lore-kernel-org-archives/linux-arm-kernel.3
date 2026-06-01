Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D11BCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 06:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soP7J9BuT/6lT7vP2K/RAxhntDj41HAi5S9Movt3ds4=; b=KAOAZ5svNjPXnYfANxWPp/MRp3
	0Nb81obmEsas8H67eKENk0TdquvUh15HUUR5aapF2PphEkdogDR0k7yUv5umTTTKaV4jwfiGrSzxP
	q+5e7Z7Etx2eD+pP9vlrhjSSdUP16XjzNGI3k1TNpAM9cPlm9y5+rTc9EkzrD6yugbJpxG+bTqtud
	a+PtCApEAwXFLPfVsxWSdXS4MSFvGHZgQmmT5+15bQ94h1IVJqhEWPiE20nuyzGc1bEk2gOMzVDb+
	zYDdjyeoCP0XUCqe0519XvV4fCHhYPl7lJ6YMip03Yclb1ghUpnFcGBPrf6HYvWL89QaA7JXfBNQY
	NQR4klfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw1O-0000000AC81-47kW;
	Mon, 01 Jun 2026 06:21:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw1M-0000000AC7S-0sfd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 06:21:09 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bf2d865383so335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 23:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780294867; x=1780899667; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=soP7J9BuT/6lT7vP2K/RAxhntDj41HAi5S9Movt3ds4=;
        b=e6o+AkTDf2WUrlo8K9ZCkP1IpvIE8K6I9n4WkqcSkJL6erOpA6YJVyxzi96bxJmdSA
         jimi0uu3eiqgJAIamokK4hTo1VWhsP7sLIpMVfOdiUsYTI+5yAhhCtICcJrjmwJOlUHf
         r7rSks5EknXm2iwIbescDgQGs++LVyc4DITJGJURM6giIBYRtI6y+hNAo58hog5zE/KO
         M06AgXmgQbBRnrolOoNbNuz6iz8InBkO2ABkk+UzJ8MJo7jDvtw1mK8U8BJ3Rpjw57hj
         Tt0uKvGsezz9uNDRwTX10T3Gk8hHKXYA026Q7TDQM6wVmqrXWTLMCIlqP8gKB/IR+tKR
         AsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780294867; x=1780899667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=soP7J9BuT/6lT7vP2K/RAxhntDj41HAi5S9Movt3ds4=;
        b=M9aH02PnMAvcwJQiSs6zWfa0raQU82esxNXrRfFdsHn/nb+mK614VtrIxTUism4wHp
         Jse2pAM6yxLXAPviFIL+HTt9qkP2l1uXJcHh9kOWN9Abw36JxQ3UfsrfpbujTnyJHJ7z
         HnRCQyU3tGFtkNS09U90U9IgrV/UKwllic0X2p7G5p/2O6iXTchMyYys80PaktWM8eUk
         n2f10MPUggEEhhnIe2FjJtJQ15MnKifvBzdkg553Y5bNBuyy9WtGOR5eN7R4BHeDE7iO
         kPIezLWv3eNbfth97sMjO4D73fYc0j0KjIBRKd9vSKtjUYVto9l+dlFO/yzdCTmW21Xn
         9h/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Fjfe5QRcyLGLX2OZyUr/8Y9nhScE/8kCAl+OLfuH8Z59hJOpan2jtVRN+w/qoQkTGJqDcHtaFe7yTzu68LS5G@lists.infradead.org
X-Gm-Message-State: AOJu0YyeIhNV3447sDs7IR27MYE9I5/WrFhQvl8124fWH6Cu0R9SYE/U
	3AoWnJMMsEBf200m9sjzGGkjEv3FZW4pNcb8Xwe5vePZSPTDKqbUz1lyzzUyj8tpgri0DuRg8pO
	4+g4UrA==
X-Gm-Gg: Acq92OGqbeRidbXJhmYjT0NXthu1X8FpV5VbBRiSyzTAVzL9f0oO7PO8xBZnIBgFpQe
	B3mkLAquDlX0rxsarT8X1xNJRTPaAHiYGYxwU9ti6JqY00TRV1Q1VZN6t3nhl2eEmoJSIP+0qOD
	EWeDBeNrWcOBdDmfVsDpGOk8iF6UWsEkB0aOw3SyPIXfKW2u/SG1lXgFUrCU8Ps6czbC3RXqPKT
	JJcbdxa8LgoQR7Q7ikMGBEgxrFoO05haTLrf0Ks5s5FpgB6m7wz3TwYRp21LDO4DSWhPjrxbgVU
	zAVWgWRCqq00cCnL1fEa77YmHRBQ6mj6dDGFTUGa5nFUkPbnMEPP1rBEblopAtASyn7tUvqqLm/
	39PmZP9JacMAHo4KDtn0VWRHDunHZSX7l22mauOHCFbGXtHvYvhMsW5owqgmQOsRH5t8e/70dUS
	H9P9gn44LnU3YGaKkW1vNPxpqZJuxaVytvCcGDFIEi1TlRLdGWnPHBRdbUkmYz5pVFG8m0zTs=
X-Received: by 2002:a17:902:ecc4:b0:2bf:139c:dcf3 with SMTP id d9443c01a7336-2c07cb51c58mr2879505ad.19.1780294866691;
        Sun, 31 May 2026 23:21:06 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8424defc024sm2572466b3a.47.2026.05.31.23.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 23:21:06 -0700 (PDT)
Date: Mon, 1 Jun 2026 06:20:58 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Ankit Soni <Ankit.Soni@amd.com>
Cc: iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Message-ID: <ah0kyi5asHpnrpgC@google.com>
References: <20260529111208.387412-1-praan@google.com>
 <20260529111208.387412-7-praan@google.com>
 <unqzyef2n26wdf6tmc6vvwvpsgv244uvz7cxji4scymqmoofyb@trkzr7ix5bog>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <unqzyef2n26wdf6tmc6vvwvpsgv244uvz7cxji4scymqmoofyb@trkzr7ix5bog>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_232108_261664_9E6435FD 
X-CRM114-Status: GOOD (  26.33  )
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

On Mon, Jun 01, 2026 at 06:00:15AM +0000, Ankit Soni wrote:
> > @@ -2502,10 +2508,22 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
> >  	else
> >  		dev_data->max_irqs = MAX_IRQS_PER_TABLE_512;
> >  
> > -	if (dev_is_pci(dev))
> > -		pci_prepare_ats(to_pci_dev(dev), PAGE_SHIFT);
> > +	if (dev_is_pci(dev)) {
> > +		struct pci_dev *pdev = to_pci_dev(dev);
> > +
> > +		if (pci_ats_supported(pdev)) {
> > +			ret = pci_prepare_ats(pdev, PAGE_SHIFT);
> > +			if (ret) {
> > +				iommu_dev = ERR_PTR(ret);
> > +				goto out_err;
> > +			}
> > +		}
> > +	}
> >  
> >  out_err:
> > +	if (IS_ERR(iommu_dev))
> > +		iommu_ignore_device(iommu, dev);
> > +
> >  	return iommu_dev;
> >  }
> >  
> 
> Hi,
> This regresses IRQ remapping in the PD_MODE_NONE branch. By design
> rlookup_table[devid] must stay valid for IR - init.c:2257 documents
> this: "Do not return an error to enable IRQ remapping ...". Pre-patch
> the PD_MODE_NONE branch returned ERR_PTR(-ENODEV) without nulling
> rlookup, precisely so irq_remapping_alloc() / __rlookup_amd_iommu()
> keep working; this unconditional cleanup violates that.
> The new pci_prepare_ats() failure path has the same shape:
> amd_iommu_set_pci_msi_domain() ran earlier and parented dev->msi_domain
> on iommu->ir_domain, but on this new out_err that's not unwound. So
> nulling rlookup_table[devid] makes irq_remapping_alloc() return -EINVAL
> on the first MSI alloc for the device. Sashiko also flagged this in [1];
> 
> Also if iommu_init_device() branch fails, iommu_ignore_device() will be
> called twice.
> 

Hi Ankit,

Ack. Sashiko made me realize that this regresses IRQ mapping for AMD,
and I agree that the call to iommu_ignore_device() is a bit too 
aggressive as it  wipes the rlookup_table entry required for IRQ 
remapping, particularly in PD_MODE_NONE.

I was thinkig to address this in the next version as follows:

1. Split the probe error paths:
   - Proper init failures (like iommu_init_device) will continue to call
     iommu_ignore_device(). I will fix the double invocation here.

   - Config failures (like ATS mismatch or PD_MODE_NONE) will return an
     an error but skip caling  iommu_ignore_device(), preserving the
     rlookup_table entry for IRQ remapping.

2. Resolve the Use-After-Free (UAF):
   To prevent the UAF on the "DMA-only" failure path, I will ensure that
   the hardware Device Table Entry (DTE) is set to a safe state (like
   blocked or bypass) and the dev_data->dev pointer is cleared, as the
   IOMMU core does not invoke release_device() after a probe failure.

3. Fix iommu_ignore_device() infrastructure:
   I will address the pre-existing bugs identified by Sashiko:
   - Fix clearing order (calling setup_aliases before clearing the
     rlookup_table).
   - Replace the non-atomic memset() on the hardware dev_table with an
     atomic DTE update.

That said, I'm investigating the safest way to revert the MSI domain
assignment on probe failure to avoid the dangling domain issue pointed
out by Sashiko. Maybe we can add an amd_iommu_restore_msi_domain() helper
to revert the assignment made in amd_iommu_set_pci_msi_domain() on probe
failure?

Please, let me know if that sounds okay?

Also, I'm wondering if I should send this as a separate series specific 
to AMD which is unrelated to this one? Or maybe handle AMD IOMMU in a
separate series altogether. Let me know if you (and Vasanth / Suravee) 
would prefer that?

Thanks,
Pranjal


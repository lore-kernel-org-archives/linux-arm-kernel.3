Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52A4CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 05:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aS6sOmcWqD+JGmAwtp5t++abYU7vJWrSGj4RsT0KIIw=; b=3BqqAgn9K2kG0CCDGrOosFmQ0J
	quOfYGK+l8dy+QG9kWy8wk8x9+obOcHQQn/gT5+Tw/raSWoo2ZpVTJPHQ9gh0qsqa1FHs200crVFr
	HcPSGOnYHeho13VIkyEvgO6f8A9VOW4/jukGfnyaSKccn9e1gGXeN0FzJLPOaYVZwlKsvnfY3Im4O
	Ro6mA1ul9Yuvana4qlfaSgR/YP/VfbKnBQucIZa7mxWK7ayZmHTCKDdp+E161BKYqBa/Se02osO93
	+L8rgPwof4j5KVNpJP4pVA5u1Iq5LKpts8KEsnQVh+mwInpSzrkrLx1111yrWGrTpAkjNBSSLlCtF
	sK5z5qEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9XI-00000007pp2-2Eof;
	Thu, 01 Oct 2026 05:40:52 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9XG-00000007poa-3HoR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 05:40:52 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2db33db4de9so21415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 22:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790833250; x=1791438050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aS6sOmcWqD+JGmAwtp5t++abYU7vJWrSGj4RsT0KIIw=;
        b=wJCr+HZACdOHsq8sOj/SHK5b4PnTSonRqTeUDUT1tH/GNkNUI5ScRDGv32f8BoRtjr
         jJQ2CatYv9EomFKFfmOmGztWvJ/2+PluV07SgFFc7iqi/rRqmTJmtzmg1Yz01h1bjYxx
         PwU9Gy4sS2LQQ5ADgqSwC+VYEDVcC6/TSIgnuWkLlhvRXEaxltjLYS8gg6w7baZTzKeC
         6YvlmaLljK+Tc0a/PbzSrR7DtIpNft1M9MMzW+JTb22QdROKgFpFoRzKRJYuU6eh4EEk
         H/LaEIU/VjzKYtRMzR+6wcuEOGAOxoYIPmjo23UhRGKukrfydM+Ry2AXH6U1rfHj2fJ3
         A7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790833250; x=1791438050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aS6sOmcWqD+JGmAwtp5t++abYU7vJWrSGj4RsT0KIIw=;
        b=wxR41y+w6I36u56r4Lgy0SbRXmbzEwAgG8mZbhPTOnF+oUl8SChCQWwEFLMmprd2Qy
         2bwIeL1QrWdVYehi6eknsMF3FJPczZUrpt07PFqyxL7UWLdWWR7VU6igy6jQ4P/zZN8z
         3F1mD5JWC9zuAbkEjMVb0lvVQ4PUQTeI5We/W6mehX+tel2U0FjoGPB3beiVW1vLdWip
         Az03T5qMYAOn0aK5amBvYticcz/C6TDVvc7fRvyPg2/EOuqgaBXw8e5oXCRBLjQ7DtRO
         +7Uf8v43DRmWX7/C3WQ6L15PQIfLBlNplKW+4358m4tRWcQ4ec4VEMMRImvykjeEs0LZ
         8VBA==
X-Forwarded-Encrypted: i=1; AKwUvBzmB4q3KsSEcxWC9o+lWCKGYs7LNK/gZviYLW3WPvMfqdGdCZOPUoWg1GanYenZYslaJHjU7eaMB3k3YCrRjPp1@lists.infradead.org
X-Gm-Message-State: AFq9FYIIIZPOinE466gmXdYgeiIIX9ZPE9+4lbLzp5djw1fK7KcWDJg0
	E5eb8h9c4baslLAlJpZOY+Btx+aMZSQG1Bpgw6seb8d6lGQThEabGIcz+oq9SJgF8w==
X-Gm-Gg: AYBFou15AGEEgQDy1lAmxag+TiPL36xSBrNwZri4MurDXXnsCUhqQCOL//TgAwATdx5
	4Pw4/9PTh1LbUdROeM+F/EgPoI+3ju/1sHQwl3JiotYc3eQY0LdssgKSXhDGUp2OdWfkk0onGiI
	Lz1vIRDz5kpf9cQva+VMZYqYoOwMFzVjsJlLhbvb9u75eCraXAVZeKPFXCAIxf3a///SSxv9Q8v
	bf59DZKGCQMlbXIXJXm8Y3UrAsxpIIvaJDDl1PBJggAxMQpTZebiE1z2XN3XXpHbTuZ39uvFUcs
	mXIGvsyQxEXu3w9H54LZ9K7GgbxWX6jP2vacgetvFiya104K8Ic24vrPeyH1oP+0qeIBuouW4cj
	ZVdjVf1oJlFJzwS5it1Ut45z+sdaJaJjRt6WbUUKCayHgiqgPFEgxKLVeKbsWUfieb+xIUoYljM
	Y5E74AyFMVkishINwHfy754AzNhjVXqIFqQb5V5m+n6h/fyCS6fs12S1bwiQnGtFU1VTOqPxu5y
	rUAwvBRD6F8sXf+eZgqNgBwXopJEeDDOxcZ
X-Received: by 2002:a17:903:1acc:b0:2c9:bd54:cf with SMTP id d9443c01a7336-2e301d71be7mr3155715ad.4.1790833249336;
        Wed, 30 Sep 2026 22:40:49 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b6d7a1sm5294465ad.76.2026.09.30.22.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:40:48 -0700 (PDT)
Date: Thu, 1 Oct 2026 05:40:41 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <ar3yWUmi8E0k37Ml@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <ar1yNtr7Kp2OTcDd@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar1yNtr7Kp2OTcDd@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_224050_830145_2BF1E924 
X-CRM114-Status: GOOD (  32.10  )
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

On Wed, Sep 30, 2026 at 01:33:58PM -0700, Nicolin Chen wrote:
> On Tue, Sep 29, 2026 at 03:45:05AM +0000, Pranjal Shrivastava wrote:
> > @@ -726,13 +727,42 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> >  	do {
> >  		u64 old;
> >  
> > +		/*
> > +		 * If the SMMU is suspended/suspending, any new CMDs are elided.
> > +		 * This loop is the Point of Commitment. If we haven't cmpxchg'd
> > +		 * our new indices yet, we can safely bail. Once the indices are
> > +		 * committed, we MUST write valid commands to those slots to
> > +		 * avoid indefinite polling in the drain function.
> > +		 */
> > +		if (Q_STOP(llq.prod)) {
> > +			local_irq_restore(flags);
> > +			return 0;
> > +		}
> 
> Sashiko pointed out this:
> "
> Can this early return cause memory corruption by silently dropping ATC
> invalidations?
> 
> When the SMMU suspends, Q_STOP(llq.prod) becomes true. If a driver or
> background thread then calls dma_unmap() to free a buffer while a PCIe
> endpoint (with ATS enabled) is suspended to a state like D0, the SMMU
> driver will observe the stop flag here in __arm_smmu_cmdq_issue_cmdlist().
> 
> By bailing out and returning 0 (success) without actually submitting the
> CMDQ_OP_ATC_INV command to the hardware, the IOMMU core is misled into
> freeing the memory while the PCIe endpoint's Address Translation Cache
> (ATC) retains the stale translation. When the PCI device resumes, or if
> it issues a TLP while in D0, it could use the stale ATC entry to access
> the now-freed memory, bypassing IOMMU protections.
> 
> Are we assuming endpoint drivers clear their own ATC or that a hardware
> reset handles it? Client endpoint drivers typically lack an API to
> manually clear the ATC, and SMMU hardware resets do not broadcast ATC
> invalidations to endpoints.
> "
> 
> We may get away from the TLB maintenance. But ATC can be the case
> broken by the stop flag?
> 

Not really, I guess Sashiko missed the comment in a later patch. This
was discussed with Jason in v9 [1].

The key thing is that ATC_INVs can't be issued by the time we set this
flag anyway.. if we're in the suspend callback, the PCIe EP is already
suspended, so none of the ATC invalidation TLPs would be responded to.

I'd addressed this in the RPM patch with a comment right above this check:

         * Note that eliding ATC invalidations (CMDQ_OP_ATC_INV) is safe
         * because client PCIe endpoints are guaranteed to be suspended
         * (via device links) before the SMMU is suspended. With the PCIe
         * links in a low-power state, no new TLPs can be transmitted.
         * It is strictly the responsibility of the client/endpoint driver
         * to quiesce DMA and ensure that the ATC state is cleared across
         * power state transitions.

i.e. we only start eliding once *all* consumers are RPM suspended, so
the "endpoint in D0" scenario can't happen.. and a suspended PCIe
function shouldn't be issuing translated requests anyway.

So we can't issue ATC_INVs during suspend (the EP is already down), nor
during resume (the SMMU resumes *before* the EP is made active). The EP
can't use its ATC while suspended, and if it loses power/resets on the
way back to D0 (from D3cold, or D3hot with No_Soft_Reset=0), it comes 
back with an empty ATC.. same assumption the PCI reset path makes today
(pci_dev_reset_iommu_prepare()).

I can add a pointer in this patch's comment to the RPM patch to make
that clearer.

[1] https://lore.kernel.org/all/20260826134757.GK3325090@nvidia.com/

Thanks,
Praan


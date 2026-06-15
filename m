Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5A5CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 19:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+BTW9/C923Dre8fNOzQLPuL2WsbnK1fVP5EdiSCsyk=; b=m2xBHz4+ssoKQF5EGwzWg1rENM
	EaMtCnY95t8/gtuALG3qMkNMfKIuxCCMzQD+RH+eGNf3kt+w/Eh5n0m0tT4MXxS54QNuJUhoZtkus
	3sw/EdVXPHNMSkqumcVj74XcAphFvBENKxbVVeXM8fvr5QxOf98NInBLPTuVfQW8KHs/nPm7e2WH8
	FKTh1ylyojWExzOhEOr/QP9HOlM2fFyBNYeuZ9jpMeLUNHSPZPBN1rp5G85JNmOBKIJSz2vwdMcgs
	fmFR4ynrVa5jw0bh9Jjg/oGW21Ep53pxqkS0b/BsrNt6NzJgpiKvEwonEENJT6ztXKyQL/gnYLfhX
	LZWhb1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZDEZ-0000000Emtk-0REb;
	Mon, 15 Jun 2026 19:44:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZDEW-0000000EmtM-3V2O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 19:44:34 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c67ea316caso2035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781552672; x=1782157472; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c+BTW9/C923Dre8fNOzQLPuL2WsbnK1fVP5EdiSCsyk=;
        b=iTiEF5RHYPAcc7ODIVmBj26p1ahIweKhBHVayLM0S7vwkteWT9Fc+0afMb2+3jnFSs
         UNc9z6na4iGRbh4jJ8tBH+VWYZ9dXFhSFBgmPVij32huVZn3OWhwh6qptc6qvhgw/bGF
         nuh3KPDoElo0hloklnae9wz2+70BJXoxKX3Dj/TrhwKTr3nYl0df6eJhpBEAWysOAIQF
         80J1DJKqXBJcdpp9AJ6EamvHPPvUGys6xi0sySlbb6NeEfjpWRr/41c7QU4Klafgk7BZ
         R3yqMoIDaKrKHMsc6qt7pQaiGRZAE+/1vFDNE2irL3OR/Y7om66rynPzien3q/+iY+9H
         m9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781552672; x=1782157472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+BTW9/C923Dre8fNOzQLPuL2WsbnK1fVP5EdiSCsyk=;
        b=eXo7/PFa+BZc9Q9HIQrsmJbfKw3S0pNI8zaOIUawInb3087RSadoJpAHR6Dcq/cyYT
         8K6Sw2PVkkjNBxy0k+/zseiltF/wmTcvDGc0teWcntb+uiVMsVaOKs7w8nTIP5VrhVF4
         aWPxtEAvkwu7FAqlglGVLpxTwmsGBXTOGnI+MarV4RAIxdiYwo9pw7ASxU3kPW+HNm6e
         MaGjuNLGotoy6ZXZnN/yc03ZfdCqIbIPA7wXenPxbHp2Sgx1ywoNt8QKylPO48ULCyQe
         NC/YiHQDtYgPiGMLvQqhF3qlfeJZmHk5uP/KtPvL6m9tVsiGGapJlOeVuBLcegkIUaUs
         G0HA==
X-Forwarded-Encrypted: i=1; AFNElJ/qDiLJGsPuH9iejn64ViSPk5zKg4IP2Zn8wfpCBmrJdVr1jbRaOTH0PjNiIKMfPf9SdDVPj4AbGCei69glVUSz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+WEbdhhYmpdgAP93XbwBm1t7LO22LpnT42ICMUD7CL3O7JTxE
	bpzxI0BfG83+6CNmQqBLi0b0jmHNhbNSFue5/Uram9KO7XTtiBPyeFg+Dl6qJ2eQPg==
X-Gm-Gg: Acq92OE8xhpC3+rtv+lF7DBbgH4FPgrSBghpqht/CmjHD9ElkB+7RvifZFIXLUQEIuo
	E8IsL2LPxoNf1wneaFZpZuJhEbSHzHwBqXt34m/t+WvqND1HPFeVeyL4HSzCczeiJ9uVCW3uxcW
	roSuUNdkpGPxC8r1YoexRuZYhshnrRkFOL+32w0eXbYuJlfq/CvJncoOcJ19uRPRnYo7d4K5dp+
	4GEd/285cJIfgXuPr/EuEzdYDHheSdNKiByxBw+Oy/2gJjKxaFNfXMFqFDlUUoGqbKx/mBjNfqF
	ZNbSGM2pGjgAUkhXftQoCUhBUpGXpsy3dHXm8IOc+s/I0RQpPRqdxu47L29TuwmcVzq3Tabhv2K
	9OP9wakc/qrMqbZOb8zPfP42TYGtOCgo+66OEig5c5afL/cw2P/pigne1reEAUGVBdMGboXO/52
	juC3vFFntlGHGmtwPueotVNsOA1JF0Bt1WyZcSbmYD+womtCgRw2+PrGdb09Mo
X-Received: by 2002:a17:902:e54a:b0:2c1:4a67:5f31 with SMTP id d9443c01a7336-2c69c1d5825mr21705ad.9.1781552671287;
        Mon, 15 Jun 2026 12:44:31 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433558365sm108450835ad.77.2026.06.15.12.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 12:44:30 -0700 (PDT)
Date: Mon, 15 Jun 2026 19:44:25 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 09/12] iommu/arm-smmu-v3: Implement pm_runtime &
 system sleep ops
Message-ID: <ajBWGSs6RrkRTcSY@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-10-praan@google.com>
 <ajBCazla1VoJX9Ms@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajBCazla1VoJX9Ms@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_124432_902611_F0B9FB08 
X-CRM114-Status: GOOD (  39.36  )
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

On Mon, Jun 15, 2026 at 06:20:27PM +0000, Mostafa Saleh wrote:
> On Mon, Jun 01, 2026 at 09:59:06PM +0000, Pranjal Shrivastava wrote:
> > Implement pm_runtime and system sleep ops for arm-smmu-v3.
> > 
> > The suspend callback configures the SMMU to abort new transactions,
> > disables the main translation unit and then drains the command queue
> > to ensure completion of any in-flight commands. A software gate
> > (STOP_FLAG) and synchronization barriers are used to quiesce the command
> > submission pipeline and ensure state consistency before power-off.
> > 
> > To prevent software metadata flags from leaking into physical registers
> > or polluting the tracking pointer, a newly introduced bitmask
> > (CMDQ_PROD_IDX_MASK) is applied to all register writes and tracking
> > updates.
> > 
> > The resume callback restores the MSI configuration and performs a full
> > device reset via `arm_smmu_device_reset` to bring the SMMU back to an
> > operational state. The MSIs are cached during the msi_write and are
> > restored during the resume operation by using the helper. The STOP_FLAG
> > is cleared only after the CMDQ is enabled in hardware.
> > 
> > Suggested-by: Daniel Mentz <danielmentz@google.com>
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> > ---
> >  

[...]

> > +	/* Clear any flags from the previous life */
> > +	atomic_andnot(CMDQ_PROD_STOP_FLAG, &smmu->cmdq.owner_prod);
> > +	atomic_andnot(CMDQ_PROD_STOP_FLAG, &smmu->cmdq.q.llq.atomic.prod);
> 
> Should not that be done from the suspend call?

I'm not sure if I understand? We're just clearing the flag here?
We set the flag in suspend to close the gate and clear it in resume 
to re-open it. Clearing it at the end of suspend would be wrong as it
would allow new submissions while the SMMU is off..

Additionally, I'll remove the redundant operation on owner_prod (since
it's never set in owner_prod) if that's what you're saying?

> 
> > +
> >  	/* Invalidate any cached configuration */
> >  	arm_smmu_cmdq_issue_cmd_with_sync(smmu, arm_smmu_make_cmd_cfgi_all());
> >  
> > @@ -4898,6 +4939,21 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> >  	if (is_kdump_kernel())
> >  		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
> >  
> > +	/*
> > +	 * While the SMMU was suspended, concurrent CPU threads may have
> > +	 * updated in-memory structures (such as STEs, CDs, and PTEs).
> > +	 * Any invalidations corresponding to those updates were safely
> > +	 * elided because the command queue was stopped (STOP_FLAG == 1).
> > +	 *
> > +	 * Since the reset invalidate-all commands above have fully cleared
> > +	 * the HW TLBs and config caches, the SMMU will fetch these descriptors
> > +	 * directly from RAM as soon as translation is enabled.
> > +	 *
> > +	 * Add a memory barrier to collect all prior RAM writes to ensure the
> > +	 * SMMU sees a consistent view of memory before translation is enabled.
> > +	 */
> > +	smp_mb();
> 
> Should not that be dma_wmb() as this is syncing with the HW?
> 

Right..  as discussed with Daniel on the other thread, the dma_wmb()
inside the issue_cmdlist() already ensures that PTE writes have reached
RAM. I'll update the comments to clarify the barrier design here.

The first CFGI_ALL invalidation we issue on resume uses the CMDQ's 
standard submission path already includes the necessary dma_wmb().
This ensures that the hardware sees the correct state before we set
SMMUEN=1. I'll update the comment to clarify that we are relying on
this existing synchronization rather than adding a redundant barrier.

> > +
> >  	/* Enable the SMMU interface */
> >  	enables |= CR0_SMMUEN;
> >  	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> > @@ -5580,6 +5636,117 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
> >  	arm_smmu_device_disable(smmu);
> >  }
> >  
> > +static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
> > +{
> > +	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> > +	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
> > +	int timeout = ARM_SMMU_SUSPEND_TIMEOUT_US;
> > +	u32 enables, target;
> > +	int ret;
> > +
> > +	/* Abort all transactions before disable to avoid spurious bypass */
> > +	arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> > +
> > +	/* Disable the SMMU via CR0.EN and all queues except CMDQ */
> > +	enables = CR0_CMDQEN;
> > +	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0, ARM_SMMU_CR0ACK);
> > +	if (ret) {
> > +		dev_err(smmu->dev, "failed to disable SMMU\n");
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * At this point the SMMU is completely disabled and won't access
> > +	 * any translation/config structures, even speculative accesses
> > +	 * aren't performed as per the IHI0070 spec (section 6.3.9.6).
> > +	 */
> > +
> > +	/* Mark the CMDQ to stop and get the target index before the stop */
> > +	target = atomic_fetch_or_relaxed(CMDQ_PROD_STOP_FLAG, &cmdq->q.llq.atomic.prod);
> 
> As Daniel mentioned, I think this shouldn't be relaxed.
> 

Ack. I agree, I mis-read the kdoc about this, I'll fix it.

> > +	target &= CMDQ_PROD_IDX_MASK;
> > +
> > +
> > +	/* Wait for the last committed owner to reach the hardware */
> > +	while ((arm_smmu_cmdq_owner_prod_idx(cmdq) != target) && --timeout)
> > +		udelay(1);
> 
> I think --timeout has an off-by-one.
> 

Good catch, I'll fix this!

Thanks,
Praan


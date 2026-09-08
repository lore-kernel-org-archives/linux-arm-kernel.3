Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9C0C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 20:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1I3msafLVMvvHTnjs1M742qvOTnA2IGWYTqmBJm7pXk=; b=oy2N/1+jMbtSGtImCNO0WJ6QAA
	LAlAMXROhlxdKJjsWE/oxVNY1b01Z4QVuV0qvJtBsZ3Bm+6t1I8F195S6yH5xYZgmM/1IkajDzWa7
	W0PKhfAA/JjM9PWnj02xz+WJiBLI92zw+ay1XZo6G1twfydyjfOBvs1oN8uZG5+vrnDSNk3Cve39i
	MTM2bOHT+pgdKAXx38P+fnkj1AmvepBUmUHtlfvTmw7dHEFLvOw2nSpSmm60jReRHtf7IV0XadYy3
	dbNZCqncw8methXwTgUtX1r2Cz+6S+Qo8e57dW0UDAt9r0mY20EQpMIM+C1dNUPBCcculxuVQ/UR9
	zXQ2LMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42MK-0000000ABQ3-2oIb;
	Tue, 08 Sep 2026 20:24:00 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42MJ-0000000ABPe-09cM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 20:24:00 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d6ff3aca07so2225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 13:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788899038; x=1789503838; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1I3msafLVMvvHTnjs1M742qvOTnA2IGWYTqmBJm7pXk=;
        b=PEGu9s+2kByqocC1ooFyYmNMSTw4OGqrqpCGaHMPO22/3sJ6ul3PrAoP/otiB1jh/c
         RPqr3oeYWS6MrCB8hD89LHsIIuFZXkWShohyvcE49flrpJQETcl9FSf82J9ASbL29f+v
         w8goaWUuFTED+DoXwsVZsDR36SByx6kZfXHEQtfkFPoHnQ+yYqJOxnY4mlj6fcuIdsZ0
         lAXVDqTCKjTppKdcdYCIDoFRT06As//aBKYMlBkqX7hdjFNUiJ0krZd/mzx+1zspgcmR
         QIBn+93qH4IOAH0XrI9tPkUTB814V2gRa0fbuYAvpxHGngOAIUXwolUFtG7kw9AXHR8F
         8m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788899038; x=1789503838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1I3msafLVMvvHTnjs1M742qvOTnA2IGWYTqmBJm7pXk=;
        b=OZscNlqsD6urh4DgOF0K0BaX5XMjoqkHPdY+qkgTUFZZ3tuM1fkR0ZYAaWkjkVd7ib
         LRUdU+/fqALVcxRc9BDXbMFYXuih7+WXfkUs9giGCPJGdEVSyRooPs1pBjUVv/2T6OXi
         iME0oztufTKdvVOgUtiZHxE4DO3w6K+KiwaAy3qfiMpz9ijP2wJK+Gjdqn/YS9DSJnJD
         qSJDDkqZMV3AAr6oKnx8+r2ByzctBzwuBBTrwABfjqTCMu3nrOi2HvQITBpmlldr9r7w
         a//1V0JsglrGyUBSvrxDNiIqfqdw0OyrBGKULPM5sTCUoBfDxX+bHpQaqIWvDARKP7OH
         XLGg==
X-Forwarded-Encrypted: i=1; AKwUvBxxPBvRq8cQ8itCzNVETvMA/7KGTFTfwyIvztn6DKB6BNwIdHcZQToOIUJvDyw3vvtEUwNd3vbBDEl0Osw4XFGw@lists.infradead.org
X-Gm-Message-State: AFuF++ly09eaY7yeqyq0vd3xRvXGd5pVnScLWJK3fnMSUoPWLDS0PoDr
	S7kGvCFUGL5bdJtNFLXTKHFi1CSqBIsmS5E2tBodpzClGrBmzBIRQz2mREgNAu3zuQ==
X-Gm-Gg: AYBFou1r3O/MsFESB/nY/k6xDKXMwnnOMvScU0Y6sLMzMuolQi8dhaiOElSajHmIu37
	s+3hKVK5VYwm1/PNO5ffZNSAsxVWr9d76uOhVLB76pDqtP7vRdBihtKLnYs4iblC8B/O+/5+ufA
	SxHnVVStwse5OiVC+htBpt+Xt5CIlkQxc1WysBB+q5ZZX5zVN0lEdPERKWrhhQGSDLBiU2k5dW8
	PYRv2AbWks7GRWTHUiIoB1lX+43w9EBOh0pH+81KKuxVWnKMtxTm77oMOayBeuW6gRFFlGvlyEl
	DfZr3InJwBLSY5z8T2rD7GI/aC7AMS0SCPiL34scpR8rVmVFxEvyLwnaVoySDRuZoFqhpvDohFl
	4DsrnMRbKuhgrICoFz4s/wbo9+S1vjxamoYY4Qql1bKnqGx7EdVuYhRhnuXJ1lHgYGfNso5JG8D
	Pfcuo6ajAg3ge6vCKxCzhf9XJmvxJos69NGhbhAoRw0mkAmsuV8yGwJTE9ldxKA2PUfBZdYe8+Y
	8wlLd60LBxUBH+3C0lyUysWCg==
X-Received: by 2002:a17:902:c94b:b0:2ca:4bb4:4bd with SMTP id d9443c01a7336-2dcfc99344fmr4355ad.5.1788899037835;
        Tue, 08 Sep 2026 13:23:57 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm45959637c88.5.2026.09.08.13.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:23:56 -0700 (PDT)
Date: Tue, 8 Sep 2026 20:23:49 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v10 08/15] iommu/arm-smmu-v3: Cache and restore MSI config
Message-ID: <aqBu1W6fBVKikMUd@google.com>
References: <20260908171712.356645-1-praan@google.com>
 <20260908171712.356645-9-praan@google.com>
 <87pkyn1pqm.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pkyn1pqm.ffs@fw13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_132359_115555_D4EFCF12 
X-CRM114-Status: GOOD (  27.12  )
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

On Tue, Sep 08, 2026 at 09:56:33PM +0200, Thomas Gleixner wrote:
> On Tue, Sep 08 2026 at 17:17, Pranjal Shrivastava wrote:
> > +static void __maybe_unused arm_smmu_resume_msis(struct arm_smmu_device *smmu)
> > +{
> > +	/* Clear the MSI address regs as they reset to unknown value */
> > +	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
> > +	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> > +
> > +	if (smmu->features & ARM_SMMU_FEAT_PRI)
> > +		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
> > +
> > +	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
> > +		return;
> > +
> > +	if (!smmu->dev->msi.domain) {
> > +		dev_err(smmu->dev, "msi_domain absent during resume\n");
> > +		smmu->features &= ~ARM_SMMU_FEAT_MSI;
> > +		return;
> 
> If dev->msi.domain == NULL then arm_smmu_setup_msis() already cleared
> the MSI feature bit. Has it magically been set again or does resume run
> before init or does dev->msi.domain magically disappear during suspend?
> 
> I'm all for defensive programming, but this is voodoo and not structured
> defense.
> 
> Aside of that dev->msi.domain is the patently wrong condition. For
> devices which instantiate a MSI device domain dev->msi.domain points to
> the MSI parent domain and not to the actual relevant device domain.
> 
> You can't query that easily by chasing pointers (for a reason), but
> there is no point to do so. See below and the patch I sent you.
> 

Guilty of voodoo defense. You're completely right—FEAT_MSI was already
vleared on fallback during probe, and checking the parent domain here was
misguided. Dropping that entirely. (I added the check here and then
updated the setup_msis() part).

> > +	platform_device_msi_rewrite(smmu->dev, smmu->gerr_irq, arm_smmu_write_msi_msg);
> > +	platform_device_msi_rewrite(smmu->dev, smmu->evtq.q.irq, arm_smmu_write_msi_msg);
> > +
> > +	if (smmu->features & ARM_SMMU_FEAT_PRI)
> > +		platform_device_msi_rewrite(smmu->dev, smmu->priq.q.irq, arm_smmu_write_msi_msg);
> 
> And that's exactly the point I made about sprinkling this stuff all over
> the place and thereby violating all layering rules.
> 
> Done correctly this whole function boils down to:
> 
> static void __maybe_unused arm_smmu_resume_msis(struct arm_smmu_device *smmu)
> {
> 	/* Clear the MSI address regs as they reset to unknown value */
> 	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
> 	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> 
> 	if (smmu->features & ARM_SMMU_FEAT_PRI)
> 		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
> 
>         msi_device_domain_restore_msi_msgs(smmu->dev, 0);
> }
> 
> It just works simply because the function returns early when there is no
> domain or the domain is not a MSI device domain, which is correct
> because there is nothing to do when nothing is set up.
> 
> But that results in too comprehensible code I fear.
> 

I certainly won't complain about code being too comprehensible! :)
This is much cleaner than what I had.

I'll drop my implementation of patch 7 (platform_device_msi_rewrite) 
completely in favor of your core msi_device_domain_restore_msi_msgs() 
helper, simplify patch 8 to this and take it for a spin.

Thanks,
Praan


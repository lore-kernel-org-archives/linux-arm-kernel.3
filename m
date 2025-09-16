Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297A6CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTpmHXQDrDNu2omvxpv38G1z1jQL9k5zYwI+nHzzx2A=; b=KbaHOdWylElc3OMVfQ8kDFPuAA
	HzgfZlp138SfMK7krE9c1q6qQmFHZimHl4yqcU9pYjk/5xDg6MsGIwPt8cX8ULTbarVfx8qu+pWoB
	C9vtItTXpJ4hEdiTtQlFz65JvNP2NGuO3YQPGTRNx1S3nvebIzqayQSxzcGZpNfOBBcxPm7VxV4DO
	Q19TBJ0OKyw21oFu+QcN0kdrEohxzMAeP4xFwTDMPjaIjSXv/tRs7wwCNMi92T96fHQ45qGDi5moU
	kS6M4V7gss3o2bYjXQwamZqXubYnGvAgs4kD1vUu+qZGM/133tW4B8dcmkXZXkawjQ2GbOP5TMfTu
	W3JiCXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyX0k-00000008Bgo-22Fd;
	Tue, 16 Sep 2025 14:50:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyX0i-00000008BfJ-1OPJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:50:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45f2f894632so58575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 07:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758034222; x=1758639022; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZTpmHXQDrDNu2omvxpv38G1z1jQL9k5zYwI+nHzzx2A=;
        b=lfGA5vGRmi+kHxfUasV5PJYuW+5EFx55pZ/ec0He3OQ1Es0Px2I/AaPxKB05vVMFWl
         S4uJS01yBiMxxzdXBL7SvvEGkJhT6nK8L8uaI1VWhLV9drDXb9MKkQmhHe/cACJsdUXR
         WC/dSeaccd279bkt9mXucVt2jVwjQfGf09HehEAzIlsMBe6nlWhjOmn9S474kJScF6u/
         87ZB2p9x1pgLj5kaGBBisLwZSFYPAOwZ1c90nSD8i64WpKzZp7QZe0gd3+0FgKCMfUi2
         6XJO+hzk3vQ0XtMs2jxR1tqx4VJdO1jLtZpwLrognvu4h2DYN5f/JkokexSuirjZFU5P
         2sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034222; x=1758639022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTpmHXQDrDNu2omvxpv38G1z1jQL9k5zYwI+nHzzx2A=;
        b=NEtcnHgbxIb6c1EWzBGhEalBFDYa6jMROYTk8UGvCPoFBNQpIRZ5o5mO2e8mNa7sHt
         LJ4Qf2NhF9+BcWjLuOcm2lNC8r4dY+qJTBInzFqwIiHjk4Eg2h1HgCx84EUjnPfF7q28
         k2QU6YimY9LL+RQdAZlAr9ZF/v3FmjFEjIF9nff9rqeNFpANOA3te7j93zkefSWTbMT7
         yT87HLJ1tlf3i38y6jCkgG2KLzHxo890oUdN3e0Axw+hC6sjH1hgs1tRtN232fPGZtHG
         ez4wXjUHQMpuPp7+ivUQY4k3l27FHKOLAbdPTIF/ej9wByU/x3maDsTgTEue6GhxzHnM
         vuIw==
X-Forwarded-Encrypted: i=1; AJvYcCX1W7PV3AmtjGjFTZyld2GJnF6POIKWQHWuc45tAFu8QZF8BNvje7dPsfOG/DJNY3n31/lvH1oJwLdLBHMvUaw3@lists.infradead.org
X-Gm-Message-State: AOJu0YyUnioEZlwCEHm6uG6933gyHKSIdtCn3hAIsf86ggtoLm5LMdv+
	uoI+aCYjzknev4v6t7DTWwLNLY3q10QgccUJwRIDhkefqgmU6tMwA6WyPAlyF7LvHQ==
X-Gm-Gg: ASbGncuge4bKydMlQcGbWFXxs1xuYtau5LXeH7VXbFvRYfzL3x2NSKMD+WO14TsRz4k
	qTg3VBnW900TFsCHtJTuFMYynkSUc7f7BgfGFbvlLVW8WoU/NFcDfDEIksPKncGqytqH4KX/px9
	1hjQmWpnHAY0hV7F3L34b3Nv6CJC9EuoRLVF1ulIMb5DWDzEd0qxzeYLivC+13D6u2RDECO/vSJ
	B5VbrZD0L5vGQ2EQJI/ojSSxElqM7pa/RD5v7w8elINPItn/S7X4j6kBTUIoBjRfH+ZNAiFvqRi
	C/jUA4WZlpJP0xvrP6iWj2D4/F4ZBEbOcjFg+h/5gOIKYqUX1n5GztJNZ9atG0VwdeW4CIxuUlB
	kvdqTqDpA6IXpR2LnaVg+BCT7z7SI2lQtRCoFDAKO876INeWFiAcrMgACUgAD6rnV5r0WPg==
X-Google-Smtp-Source: AGHT+IHD9Kzax0Ca9B0Mi5gbzv7latmKARYeb9YTewjapsp5wcmK8hKO8yrvBqqgUSVFMKJVQNhyag==
X-Received: by 2002:a05:600c:4689:b0:43d:409c:6142 with SMTP id 5b1f17b1804b1-45f320079e2mr1999085e9.0.1758034222192;
        Tue, 16 Sep 2025 07:50:22 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f2a65e1b5sm123753115e9.4.2025.09.16.07.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:50:21 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:50:18 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 22/28] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <aMl5Ku6ZbzTOuGh-@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-23-smostafa@google.com>
 <aMQroI4NDu74PDGT@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMQroI4NDu74PDGT@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_075024_394466_7C197003 
X-CRM114-Status: GOOD (  37.67  )
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

On Fri, Sep 12, 2025 at 03:18:08PM +0100, Will Deacon wrote:
> On Tue, Aug 19, 2025 at 09:51:50PM +0000, Mostafa Saleh wrote:
> > Don’t allow access to the command queue from the host:
> > - ARM_SMMU_CMDQ_BASE: Only allowed to be written when CMDQ is disabled, we
> >   use it to keep track of the host command queue base.
> >   Reads return the saved value.
> > - ARM_SMMU_CMDQ_PROD: Writes trigger command queue emulation which sanitises
> >   and filters the whole range. Reads returns the host copy.
> > - ARM_SMMU_CMDQ_CONS: Writes move the sw copy of the cons, but the host can’t
> >   skip commands once submitted. Reads return the emulated value and the error
> >   bits in the actual cons.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 108 +++++++++++++++++-
> >  1 file changed, 105 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > index 554229e466f3..10c6461bbf12 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > @@ -325,6 +325,88 @@ static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
> >  	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
> >  }
> >  
> > +static bool smmu_filter_command(struct hyp_arm_smmu_v3_device *smmu, u64 *command)
> > +{
> > +	u64 type = FIELD_GET(CMDQ_0_OP, command[0]);
> > +
> > +	switch (type) {
> > +	case CMDQ_OP_CFGI_STE:
> > +		/* TBD: SHADOW_STE*/
> > +		break;
> > +	case CMDQ_OP_CFGI_ALL:
> > +	{
> > +		/*
> > +		 * Linux doesn't use range STE invalidation, and only use this
> > +		 * for CFGI_ALL, which is done on reset and not on an new STE
> > +		 * being used.
> > +		 * Although, this is not architectural we rely on the current Linux
> > +		 * implementation.
> > +		 */
> > +		WARN_ON((FIELD_GET(CMDQ_CFGI_1_RANGE, command[1]) != 31));
> > +		break;
> > +	}
> > +	case CMDQ_OP_TLBI_NH_ASID:
> > +	case CMDQ_OP_TLBI_NH_VA:
> > +	case 0x13: /* CMD_TLBI_NH_VAA: Not used by Linux */
> > +	{
> > +		/* Only allow VMID = 0*/
> > +		if (FIELD_GET(CMDQ_TLBI_0_VMID, command[0]) == 0)
> > +			break;
> > +		break;
> > +	}
> > +	case 0x10: /* CMD_TLBI_NH_ALL: Not used by Linux */
> > +	case CMDQ_OP_TLBI_EL2_ALL:
> > +	case CMDQ_OP_TLBI_EL2_VA:
> > +	case CMDQ_OP_TLBI_EL2_ASID:
> > +	case CMDQ_OP_TLBI_S12_VMALL:
> > +	case 0x23: /* CMD_TLBI_EL2_VAA: Not used by Linux */
> > +		/* Malicous host */
> > +		return WARN_ON(true);
> > +	case CMDQ_OP_CMD_SYNC:
> > +		if (FIELD_GET(CMDQ_SYNC_0_CS, command[0]) == CMDQ_SYNC_0_CS_IRQ) {
> > +			/* Allow it, but let the host timeout, as this should never happen. */
> > +			command[0] &= ~CMDQ_SYNC_0_CS;
> > +			command[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
> > +			command[1] &= ~CMDQ_SYNC_1_MSIADDR_MASK;
> > +		}
> > +		break;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static void smmu_emulate_cmdq_insert(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	u64 *host_cmdq = hyp_phys_to_virt(smmu->cmdq_host.q_base & Q_BASE_ADDR_MASK);
> > +	int idx;
> > +	u64 cmd[CMDQ_ENT_DWORDS];
> > +	bool skip;
> > +
> > +	if (!is_cmdq_enabled(smmu))
> > +		return;
> > +
> > +	while (!queue_empty(&smmu->cmdq_host.llq)) {
> > +		/* Wait for the command queue to have some space. */
> > +		WARN_ON(smmu_wait_event(smmu, !smmu_cmdq_full(&smmu->cmdq)));
> > +
> > +		idx = Q_IDX(&smmu->cmdq_host.llq, smmu->cmdq_host.llq.cons);
> > +		/* Avoid TOCTOU */
> > +		memcpy(cmd, &host_cmdq[idx * CMDQ_ENT_DWORDS], CMDQ_ENT_DWORDS << 3);
> > +		skip = smmu_filter_command(smmu, cmd);
> > +		if (!skip)
> > +			smmu_add_cmd_raw(smmu, cmd);
> > +		queue_inc_cons(&smmu->cmdq_host.llq);
> > +	}
> 
> Hmmm. There's something I'd not considered before here.
> 
> Ideally, the data structures that are shadowed by the hypervisor would
> be mapped as normal-WB cacheable in both the host and the hypervisor so
> we don't have to worry about coherency and we get the performance
> benefits from the caches. Indeed, I think that's how you've mapped
> 'host_cmdq' above _however_ I sadly don't think we can do that if the
> actual SMMU hardware isn't coherent.
> 
> We don't have a way to say things like "The STEs and CMDQ are coherent
> but the CDs and Stage-1 page-tables aren't" so that means we have to
> treat the shadowed structures populated by the host in the same way as
> the host-owned structures that are consumed directly by the hardware.
> Consequently, we should either be using non-cacheable mappings at EL2
> for these structures or doing CMOs around the accesses.

Thanks for catching that, I missed it, I think we can keep the host shared
as cacheable, and use CMOs when accessing it, I will have a closer look.

Thanks,
Mostafa


> 
> Will


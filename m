Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C261FA3755
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 18:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbKNq3OzvNgOXwfOYEfmEuaPS05vXN54NlE6TZcUdp4=; b=gUGrvfO5D0L1zxcxyuHAKwkebF
	U8rWDHtNB13YVxiTiZOFRzQFi4sKOqMi90A/GoTN31+42V6OJp0NnO7nn3wMuSSiPouoe+8/l22JD
	xAGvByu7rqJvtsEx8QSsxlrZAfE58kDYkNv1NySeTr9v52hcuvtYxU5BycCQv5oeYID7TVZvYF0S2
	nGEn79y9OqM4H/MLhpY7bWLZXscOKfwd59uNilS48kcvSB3SEEqeeygNLkmiyT8kBSHsTaMiK+Ixz
	hF2A1r+X21+QWwj4H9Wj6W+5+SgndfOv5ahmHNhNbjIb+mUOZ7uF6cWIUcRa+26Vw5uIIGp+Nrt5d
	7tkxFWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbk5O-00000008dgm-3v6M;
	Fri, 02 Jan 2026 18:41:18 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbk5N-00000008dgJ-0iVY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 18:41:18 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8b2d6df99c5so17299685a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 10:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1767379275; x=1767984075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbKNq3OzvNgOXwfOYEfmEuaPS05vXN54NlE6TZcUdp4=;
        b=E3jOa3YH+7EUJSmfAPNjyuS6mhbUAp7AbXAEGXb2VyDbn+AQOK/z71t/ucZVb5pbVF
         qHRgOg6hhGzvADCqSy3jkl+F46TB25J4oo8+A1PdWK5ELkI/PxDXnaGDx6omsPf/ujjk
         Qh4bitfwKVtLwelUlfUlJq5X5HDeLxs7Qmi/BAD4QMZ24yxts8cqcbHZyyWQRXlbGQ89
         vsbID4w8EOZkVDgWw3hP1csD995lZR6R+2GZrByJrWG+kYhkFFSTMwPbeupt3QtqL+eK
         wRc9uJ1snHQELPkvRqNMJYlIjEfLcBNU/Kx4EnO16eq/3iBMfhHzYiK0OFMuDlluAYXZ
         wiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767379275; x=1767984075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbKNq3OzvNgOXwfOYEfmEuaPS05vXN54NlE6TZcUdp4=;
        b=Tg9ZcPPAx6Usyeo6l8jHLRIgJt24QS05eTMhENeuY9D7sIcdwW//rZqsfPjmpZ+6bv
         UATgvdk+ywhaWR8syCvHHKvwivp5Brg0e5fZpt8e/GrDa4uvhoncOEmrTwstj5K2xm0C
         P1M5Xt688gWRAupSWpm9aKRNb0sHIqqEUKm7oiPM0mDn9ckuv36EUCJ61sha4LlhZ7kQ
         hbEVFx/6M9n1L9bdtQg5dmggFf90D3U6gz5arJqqVJgu6fqMdGbmhtL5CsaUSpmTr/B2
         i4hj+Np/c9AeawYTYIOX7MH/tyW+fMb+W2ElAzMKDQQBvruB2XVD+tEJoBp8XrkaMmyh
         WRVA==
X-Forwarded-Encrypted: i=1; AJvYcCW046+Y/5d/F/xA0OoMohQYEBAIb/K6P6ZutdF495PwJRN6Yru51t03iPy4u04EgzpQgBwa1B2kYb0fzT0U8bum@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4aGbQoawOAxQIwdnamUgp6Qu67N0y1n3wss14Nr20VMsfRb+c
	UTf1NCkyNFOIOgPEdfZg4M+2eiHlw8Axmoi6QEzH93F2PuJCPeozkU49a2ANek5uYoA=
X-Gm-Gg: AY/fxX5y/B25lVTGiQvnIlWW3J0zw7EduYJxwQYvu8A5ik9C9GIJq/csTH+o02RA0El
	laSyP7d5gKqTyn9yWrXE0iDPFCfi+U4RE2LFi8mpGw4EPu65zvf6hBRch79WCtduoqrJ8/OoA4Q
	3/w+pAaZOIVCPUwF5RfNrcNAXCfgp+QAejFtQiriuS9LlL7ucjS3lOFNi76Q0SvRzrOOnoDQ7/M
	3M5ZumhCTWhGn/FaM88ddlAjoEIeBiS/AHpZEp9YUhtutLkeMZbo+5A4oR8UGl8rrLxPgVF5/rb
	RNcccLGctUjWo+9vFziibw641HugFlmveQ5X7uU7muna973Gtjw9EdjX/IyZlc3j+WN7h0Wmbmw
	7uWYiY88eJ4MBPZb1djOj+eSb9q3otVYhCsqs10bxZTtihu31c2u18udmD+GBWihqbnKhksdA5t
	09ic5s0MYi4m11EEj+rGdNAEMbvhy2nSXQ3yYvxg57dO5eKHSHn9ywsZOnaoANIzI5WUE=
X-Google-Smtp-Source: AGHT+IFf1uKGIwRHqgDuPoJHVm8is9Z+z+ElqpNBRFLqGHyGLWLw+ECPqzKaTxkx0tZNT3guYluMgA==
X-Received: by 2002:a05:620a:7111:b0:8a3:90cb:9224 with SMTP id af79cd13be357-8c3568a0131mr102879985a.2.1767379274814;
        Fri, 02 Jan 2026 10:41:14 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c09678afa6sm3293504685a.2.2026.01.02.10.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 10:41:14 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vbk5J-00000000neJ-2b6O;
	Fri, 02 Jan 2026 14:41:13 -0400
Date: Fri, 2 Jan 2026 14:41:13 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dawei Li <dawei.li@linux.dev>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Maintain valid access attributes for
 non-coherent SMMU
Message-ID: <20260102184113.GA125261@ziepe.ca>
References: <20251229002354.162872-1-dawei.li@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229002354.162872-1-dawei.li@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_104117_396508_8E1F9DA2 
X-CRM114-Status: GOOD (  28.54  )
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

On Mon, Dec 29, 2025 at 08:23:54AM +0800, Dawei Li wrote:
> According to SMMUv3 architecture specification, IO-coherent access for
> SMMU is supported for:
> - Translation table walks.
> - Fetches of L1STD, STE, L1CD and CD.
> - Command queue, Event queue and PRI queue access.
> - GERROR, CMD_SYNC, Event queue and PRI queue MSIs, if supported

I was recently looking at this too..  IMHO this is not really a clean
description of what this patch is doing.

I would write this description as:

When the SMMU does a DMA for itself it can set various memory access
attributes which control how the interconnect should execute the
DMA. Linux uses these to differentiate DMA that must snoop the cache
and DMA that must bypass it because Linux has allocated non-coherent
on the CPU.

In Table "13.8 Attributes for SMMU-originated accesses" each of the
different types of DMA is categorized and the specific bits
controlling the memory attribute for the fetch are identified.

Make this consisent globally. If Linux has cache flushed the buffer,
or allocated a DMA incoherenet buffer, then it should set the
non-caching memory attribute so the DMA matches.

This is important for some of the allocations where Linux is currently
allocating DMA coherent memory, meaning nothing has made the CPU cache
coherent and doing any coherent access to that memory may result in
cache inconsistencies.

This may solve problems in systems where the SMMU driver thinks the
SMMU is non-coherent, but in fact, the SMMU and the interconnect
selectively supports coherence and setting the wrong memory attributes
will cause non-working cached access.

[and then if you have a specific SOC that shows an issue please
describe the HW]

> +static __always_inline bool smmu_coherent(struct arm_smmu_device *smmu)
> +{
> +	return !!(smmu->features & ARM_SMMU_FEAT_COHERENCY);
> +}
> +
>  /* High-level queue accessors */
> -static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
> +static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent,
> +				   struct arm_smmu_device *smmu)
>  {
>  	memset(cmd, 0, 1 << CMDQ_ENT_SZ_SHIFT);
>  	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
> @@ -358,8 +364,13 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
>  		} else {
>  			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
>  		}
> -		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
> -		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
> +		if (smmu_coherent(smmu)) {
> +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
> +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
> +		} else {
> +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_OSH);
> +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OINC);
> +		}

And then please go through your patch and add comments actually
explaining what the DMA is and what memory is being reached by it -
since it is not always very clear from the ARM mnemonics

For instance, this is:
 /* DMA for "CMDQ MSI" which targets q->base_dma allocated by arm_smmu_init_one_queue() */

> @@ -1612,11 +1624,18 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
>  		(cd_table->cdtab_dma & STRTAB_STE_0_S1CTXPTR_MASK) |
>  		FIELD_PREP(STRTAB_STE_0_S1CDMAX, cd_table->s1cdmax));
>  
> +	if (smmu_coherent(smmu)) {
> +		val = FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> +		      FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> +		      FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH);
> +	} else {
> +		val = FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_NC) |
> +		      FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_NC) |
> +		      FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_OSH);
> +	}

This one is "CD fetch" allocated by arm_smmu_alloc_cd_ptr()

etc

And note that the above will need this hunk too:

+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -432,6 +432,14 @@ size_t arm_smmu_get_viommu_size(struct device *dev,
            !(smmu->features & ARM_SMMU_FEAT_S2FWB))
                return 0;
 
+       /*
+        * When running non-coherent we can't suppot S2FWB since it will also
+        * force a coherent CD fetch, aside from the question of what
+        * S2FWB/CANWBS even does with non-coherent SMMUs.
+        */
+       if (!smmu_coherent(smmu))
+               return 0;

> @@ -3746,7 +3765,7 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>  	q->cons_reg	= page + cons_off;
>  	q->ent_dwords	= dwords;
>  
> -	q->q_base  = Q_BASE_RWA;
> +	q->q_base  = smmu_coherent(smmu) ? Q_BASE_RWA : 0;

CMDQ fetch, though do we even need to manage RWA? Isn't it ignored if
IC/OC/SH are set to their non-cachable values?

etc..

Jason


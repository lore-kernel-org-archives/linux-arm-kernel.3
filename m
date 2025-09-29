Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2A8CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg8kwxsOK3RvjQ0Oy8bn6on+o39qQD/CbdbTzAEerLQ=; b=gr6rvf7juvyi5g/w//5XET1ZOR
	1JP+r7bxLmDynDddnzCtNHMYScBWlV2/hlD/dhnHcrvMfU7twBoOIc5+yQh21KQ52HGN6setPELbG
	ji+dPp1YcgaYpmPWcR+FoQrG5ZLMnFGXJQ+OkxSxkKP85TXo/G0NVW+gzNHK2gjHzYQsk1I2m042D
	BKRIAOfaQSebhMSxq64WYlefPhMthDvnO2QZddG5Ejk8C6tzexFxX2CtvAB6ELkaKcBZWNLfdvfCj
	7FHPpKZmoAHKe9U5zkYhn2dZO8r3xSYzVUrAhMKRL2VO3tXh9IiDNIGHtIlyREV44jMIkO/8qtPLQ
	6maHCoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Bd9-00000002GHu-18U6;
	Mon, 29 Sep 2025 11:01:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Bd6-00000002GGq-3IWJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:01:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-46e32c0e273so101335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759143675; x=1759748475; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rg8kwxsOK3RvjQ0Oy8bn6on+o39qQD/CbdbTzAEerLQ=;
        b=l4ROIYN9loNkF70M4G/EP9dd7/th3RQxcbx95yBS8G2MoWQtx26bx+hPEJdP/oHHvL
         FCSvLTObFR97V8gtM8iASkXFhiuDB98FHhjGkFELpNEQiXZ7KqUi6IceSzMo8Y4pMCGq
         thMmMfW0qczbyocjVUsEECzEEVh7W8y3eMheMCo3IjCXGlnqkK755QfSEtLF7j0UnzWb
         ekXKl+KVhEHvH/I8eOpYxQV2yIzQSjT/YEdl+LG7W+nDFks2L0hxYwHYiLMh7pRIi+S5
         71NX8VYugXl94xo2sl9QvK0MuqKnp/IErYOLibhDbWhAzIaMd7GvROSVp1dVlPt291cd
         Nn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759143675; x=1759748475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg8kwxsOK3RvjQ0Oy8bn6on+o39qQD/CbdbTzAEerLQ=;
        b=gUR86bemoyC41BwmkKomlL+HYBvR9lCV6oE2pN6SrAOs6D9+JD8TGMZDf2HM9irWpg
         D1NP/C8XMxDQVvDSYX+fnl7pzFg2GANd2tBLji2CaBCxLHrR9l4dXDdy0ZAN5snvpH2h
         Amq3ppvNDd4y9BCHog1M0eEpSDkiRb+kTe95zkyUyDIjVeZCkT9+5VNc9jxKHMhG35PO
         N5yD/U09YmzKWDzOXNSlLja7n0xW7h/2FJEenCOwHf5cxOzMxdbyJxBdzo8VERadIUBz
         aKmslgNlP4F2Xh41EmgS+9Y2JFn4xj+6rL/rIpReAP2KRYLqvO8ukUjvec+FoxQe6ilf
         WweA==
X-Forwarded-Encrypted: i=1; AJvYcCXwagyVEj05X2rs6z0qonx/3kVhjHZtcZF1VaTrU7xK5GbnMbAhNf+wr9gQJp9UjVwqMm2rO2GU44nxFSsrrWNF@lists.infradead.org
X-Gm-Message-State: AOJu0Yym5GLiR5Hpl52fGFb/e59wYOytOqLOUh3lut33TpFKfDR3riDH
	gqThkEfDcvbrQTVTbR9QYTdI61oORbXXWWQyW/aw7orFHVZsxUaQHf+ntEdkc2ydWQ==
X-Gm-Gg: ASbGncuMGJnC7zzPF1wVH0rhW0R7Toh4vjFuizFil5GQMROJuoOF0CQwXlwx9A/+5ye
	IoAGAds1pCp3lqKiQh7VXvhcJC233vJ5q8gGbwuP4a8nvVPsNclbGATCb51FLOz1a6jTjlhYlEs
	Cjek9UYJh4KLWss+g5lZFO/RGcXI6E7z8geT8p5VSbr2zrmI8KsQcxhTCvuiqB1Osk4gizjRo1k
	90+VuVyUKAps6u0DYvR9ggMLSWl7Hyd4wWdEKiwYsZG2R90eTjIBBwwu5PGSNYdTZEHkIX7tLZ+
	AtpUmfB8ePjCWfDrpmTUQTRl25w07lkB+68ErlidroSz7YHd2G2CVKJK6tx6y6WtZN2/wE0ngdX
	BTFodNXDHiIT0dfZJ0/qpxpMQ8X2+lPlj/+bKtuRpY+Txm5liosT6Ehfo4AefqfyYnes=
X-Google-Smtp-Source: AGHT+IFg+hCsYGMP/Ez1tXXALpy4mbn6kahyoJaMM4qeV/gbtw19iOEwbJlDUZ+YOlPn2J+hesMSFw==
X-Received: by 2002:a05:600c:a31b:b0:45d:f51c:193 with SMTP id 5b1f17b1804b1-46e575a116emr243565e9.7.1759143674689;
        Mon, 29 Sep 2025 04:01:14 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e4ab0bf62sm70168175e9.9.2025.09.29.04.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:01:13 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:01:10 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 10/28] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <aNpm9odmzv__2RyA@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-11-smostafa@google.com>
 <aMA8vz0v0Vn-02QP@willie-the-truck>
 <aMlzLsj5slPQhWEr@google.com>
 <aNamXlTErXDs1K8Z@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNamXlTErXDs1K8Z@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_040116_853055_4E937390 
X-CRM114-Status: GOOD (  39.16  )
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

On Fri, Sep 26, 2025 at 03:42:38PM +0100, Will Deacon wrote:
> On Tue, Sep 16, 2025 at 02:24:46PM +0000, Mostafa Saleh wrote:
> > On Tue, Sep 09, 2025 at 03:42:07PM +0100, Will Deacon wrote:
> > > On Tue, Aug 19, 2025 at 09:51:38PM +0000, Mostafa Saleh wrote:
> > > > diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> > > > index a01c036c55be..f7d1c8feb358 100644
> > > > --- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> > > > +++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> > > > @@ -4,15 +4,94 @@
> > > >   *
> > > >   * Copyright (C) 2022 Linaro Ltd.
> > > >   */
> > > > +#include <linux/iommu.h>
> > > > +
> > > >  #include <nvhe/iommu.h>
> > > > +#include <nvhe/mem_protect.h>
> > > > +#include <nvhe/spinlock.h>
> > > >  
> > > >  /* Only one set of ops supported */
> > > >  struct kvm_iommu_ops *kvm_iommu_ops;
> > > >  
> > > > +/* Protected by host_mmu.lock */
> > > > +static bool kvm_idmap_initialized;
> > > > +
> > > > +static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
> > > > +{
> > > > +	int iommu_prot = 0;
> > > > +
> > > > +	if (prot & KVM_PGTABLE_PROT_R)
> > > > +		iommu_prot |= IOMMU_READ;
> > > > +	if (prot & KVM_PGTABLE_PROT_W)
> > > > +		iommu_prot |= IOMMU_WRITE;
> > > > +	if (prot == PKVM_HOST_MMIO_PROT)
> > > > +		iommu_prot |= IOMMU_MMIO;
> > > 
> > > This looks a little odd to me.
> > > 
> > > On the CPU side, the only different between PKVM_HOST_MEM_PROT and
> > > PKVM_HOST_MMIO_PROT is that the former has execute permission. Both are
> > > mapped as cacheable at stage-2 because it's the job of the host to set
> > > the more restrictive memory type at stage-1.
> > > 
> > > Carrying that over to the SMMU would suggest that we don't care about
> > > IOMMU_MMIO at stage-2 at all, so why do we need to set it here?
> > 
> > Unlike the CPU, the host can set the SMMU to bypass, in that case the
> > hypervisor will attach its stage-2 with no stage-1 configured. So,
> > stage-2 must have the correct attrs for MMIO.
> 
> I'm not sure about that.
> 
> If the SMMU is in stage-1 bypass, we still have the incoming memory
> attributes from the transaction (modulo MTCFG which we shouldn't be
> setting) and they should combine with the stage-2 attributes in roughly
> the same way as the CPU, no?

Makes sense, we can remove that for now and map all stage-2 with
IOMMU_CACHE. However, that might not be true for other IOMMUs,
as they might not combine attributes as SMMUv3 stage-2, but we
can ignore that for now. I will update the logic in v5.

Thanks,
Mostafa

> 
> > > > +static int __snapshot_host_stage2(const struct kvm_pgtable_visit_ctx *ctx,
> > > > +				  enum kvm_pgtable_walk_flags visit)
> > > > +{
> > > > +	u64 start = ctx->addr;
> > > > +	kvm_pte_t pte = *ctx->ptep;
> > > > +	u32 level = ctx->level;
> > > > +	u64 end = start + kvm_granule_size(level);
> > > > +	int prot =  IOMMU_READ | IOMMU_WRITE;
> > > > +
> > > > +	/* Keep unmapped. */
> > > > +	if (pte && !kvm_pte_valid(pte))
> > > > +		return 0;
> > > > +
> > > > +	if (kvm_pte_valid(pte))
> > > > +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> > > > +	else if (!addr_is_memory(start))
> > > > +		prot |= IOMMU_MMIO;
> > > 
> > > Why do we need to map MMIO regions pro-actively here? I'd have thought
> > > we could just do:
> > > 
> > > 	if (!kvm_pte_valid(pte))
> > > 		return 0;
> > > 
> > > 	prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte);
> > > 	kvm_iommu_ops->host_stage2_idmap(start, end, prot);
> > > 	return 0;
> > > 
> > > but I think that IOMMU_MMIO is throwing me again...
> > 
> > We have to map everything pro-actively as we don’t handle page faults
> > in the SMMUv3 driver.
> > This would be a future work where the CPU stage-2 page table is shared with
> > the SMMUv3.
> 
> Ah yes, I'd forgotten about that.
> 
> Thanks,
> 
> Will


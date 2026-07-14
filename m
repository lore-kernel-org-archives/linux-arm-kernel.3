Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F331C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1XR0xXH676IkskJiy7lkXwYtMlnQ7GpPOPMnybj7LE=; b=1FOZCpnuR+OK3suyQfMHoHJf51
	3OtgXV5kImRlLSjg3bZBYY0pSRsc1Kveah4pCB3bEDTErtKbEQUMjkS9JfPmjpjJM5sB0iEd9x8ps
	xGs9OyFYAkF9O8lEzsF7fZ6W1sPd0XkogGQwA/Sy1skrjCxwN6eUtrmPFc0EWWzf80Bh2gOT+MWYx
	Kf/1fRF33eDHXaZjOdragDS3/Uf6sofLA2j7DHcJiKRf8M4pZs9bQmnPln9zXFr7cMoZstY5hwjEC
	EjItdYdpkiD5R1gTIvptV018NK+krlgK7fhiacMTRgULVsGwnXcAIovTACPv/YLRgV8q64UAWiAa2
	4YtoheWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYWS-0000000BJ80-42Fj;
	Tue, 14 Jul 2026 08:29:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYWP-0000000BJ6j-1TcP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:29:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493b8d92a4eso42105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784017783; x=1784622583; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h1XR0xXH676IkskJiy7lkXwYtMlnQ7GpPOPMnybj7LE=;
        b=gRTzx6boHUZb+IlZVyKSaqqtN7H1U0DbT6VIXSTnMyR8VeMCPjtje/C/YzVrXi1Irp
         t9DkqSWgG3QQ7PpBq1Zzc2rBwWTRkqJPTlb11Blz4Bf6mxF7G8BLixoK86drDtwAvtR8
         JORHoD3vjpXrsdkJi1U3NRWgA9EbJjGeWMvpYbIAowybjn1pcDn7bnu9mwSO2lT7G0ar
         FW/78hpzFVBZEA8rxjXgR9TAbWfW4NClAKu+ZF2TGb2RgixjLUb+fC/XLSeXZAcDi1pc
         oOYwx8f82oA+N6QVsWBHu2CKhcRuUG3OqfRbNt/0zDVxyyIp0jo6YpHpUXU9SMLV8b61
         x5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784017783; x=1784622583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h1XR0xXH676IkskJiy7lkXwYtMlnQ7GpPOPMnybj7LE=;
        b=GuUYxJPoaixQIaECixKHhGwgdsYkd8BRfrSdz8vV420fj6Btk6xvHOv1yAcZ/zVKDD
         KO+yj3sg0vBxCI8KhDpsel8/8BO471ItyjoNg11e+JcrNhYjensCndeitapx2mNDdwie
         OVfIyNNwGioC9gZhEe3EBq5BuXVrr563rdHTYV9MDIr8e2sy3gAwX0WgT7X2SLxitKZS
         BXB/zRXC+5mWP772wXrsIc5836I1/0HAyFFB8WAOX8MlPEuL1G7Tsd8OowuhYlrEiK/Q
         ugG5/Fbue3anEjpX2EUv9YUh0oi/djwUT0JNVs83JhMduoZH4bFY1juJTysFjQBSkhAl
         mjPg==
X-Gm-Message-State: AOJu0Yyv07OJLk+cSNW/BrthQBYoHW/iJkuez2anVDDHTZeb4/1Jg5VU
	itdPw3JUN7Qmrsl96J6mIWvSX6s3j2KPomM0q7UTw3b/YMGBEKPOT56W8NvV7yxQlA==
X-Gm-Gg: AfdE7cnwm9ci7iXyuiRkOFT/a37ACVQWkb8aIgFlfym3Bq03c78wZbpLlDZ9sFFmBvz
	eY73ajURudoAgmRqovemLX1/O0B8PmoiQbmkAL5tQpV+BpRpRSEKU5zG1qccPVVwBvgbYBiw1+p
	GHE8fEsqmRe52hIGHO1rFSWOg1WZeXLuVLKXLiBgPY7p101bq3BLg+U4mChD4ds3rxQKjpOY/VW
	C3nDl+zERTpsNByp0s1GrUOB5a/OGolIc+FlmsnAfIii1recwMj5l+ix97KnReBoNF0bLtk46mO
	5n14MkUgB8anmD1RPEFjT/StkcPPOzVrt05ne6EHC2QPByDFAdkv3pzopjXeXJJ0rqtC7gOBZ7W
	EpB67WzyEu1cf2RkXFlAfFlFyv9fC6qf+YObeTSXg50nO4iW1RskHtb4BJV6ThCVzcAR1gS4Ff7
	Mxi7x4ocZMFqYlWjQvv3GBNit3XfZtvdgqcrGcg8hHH943f4cc
X-Received: by 2002:a05:600c:621b:b0:493:b169:784d with SMTP id 5b1f17b1804b1-49462165300mr1774335e9.8.1784017783083;
        Tue, 14 Jul 2026 01:29:43 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c9cc3sm6301185f8f.35.2026.07.14.01.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:29:42 -0700 (PDT)
Date: Tue, 14 Jul 2026 08:29:38 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <alXzcrnxWADIEL2H@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <alTnAy7jvjUamwUA@google.com>
 <alTvf7iiOWn4PKE8@google.com>
 <alUA7zsJO1FGnss-@google.com>
 <alUJa5cbjjqZ8n72@google.com>
 <alUMVU7DYcrvgAYi@google.com>
 <alUsLFBQ5qKFOgwQ@google.com>
 <alXwXRGqECTUZ3ou@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alXwXRGqECTUZ3ou@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_012945_408608_DC6753C0 
X-CRM114-Status: GOOD (  25.49  )
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

On Tue, Jul 14, 2026 at 09:16:29AM +0100, Vincent Donnefort wrote:
> On Mon, Jul 13, 2026 at 06:19:24PM +0000, Mostafa Saleh wrote:
> > 
> > That would walk the table twice, first time with a massive map, then
> > to unmap the pages that was just mapped, issuing TLB invalidations
> > for all of those, also as the IOMMU page table code never frees tables
> > that means we would immediately exahust the IOMMU pool.
> 
> Well the massive map is pretty quick we would mostly just allocate the PGD? And
> then it would be just for the subsequent unmaps to split the blocks. So nothing
> to be freed really and no risk to exhaust the pool. But if you put the calls to
> the host_stage2_* functions that's pretty transparent.

Not for the IOMMU, everything is mapped with a leaf mapping, because
the pgtable code does not support splitting blocks, this is something
I plan to add support for in a follow up series after this one is
merged along side other optimizations.

> 
> Just to make sure I am clear. Here's what it could look like:
> 
> in iommu.c:
> 
> int kvm_iommu_stage2_idmap_init(struct kvm_s2_mmu *host_mmu)
> {
> 	u64 addr = 0;
> 
> 	for (i = 0; i < hyp_memblock_nr; i++) { 
> 		kvm_iommu_stage2_idmap(addr, reg->start, IOMMU_MMIO);
> 
> 		addr = reg->start + reg->size;
> 		kvm_iommu_stage2_idmap(reg->start, addr, IOMMU_READ | IOMMU_WRITE);
> 	}
> 
> 	kvm_iommu_stage2_idmap(addr, kvm_phys_size(host_mmu), IOMMU_MMIO);
> }
> 
> in mem_protect.c:
> 
> int kvm_host_prepare_stage2(void *pgt_pool_base)
> {
> 	...
> 
> 	return kvm_iommu_stage2_idmap_init(mmu);
> 
> 	/* 
> 	 * From here, all the changes to the host stage-2 will be reported to
> 	 * the iommu driver
> 	 */
> }
> 
> On the pro side: no custom walker and we really couple the iommu idmap to the
> host stage-2 map.
> 
> On the con side: As you've pointed out, we'd need indeed the iommu to be ready
> early enough.
> 
> If you want to stick to the snapshot function, could we have the walker to
> first walk the hyp_memblock? the .arg could just pass if we are walking a MMIO
> region? That would avoid that find_mem_range_from() and I believe would
> massively simplify the snapshot walker.
> 

I see, let me try that.


Unrelated to this, but while looking into option#2 I see that
__pkvm_guest_share_host() does not call either of the
host_stage2_set_owner* so that requires another explicit
pkvm_iommu_host_stage2_idmap() call.

I still plan to use option#2 in v7.

Thanks,
Mostafa



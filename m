Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95863C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m879ws2jFhHLOh/9WRuezyCL3r8TAQ3JpjmFZyFa7tw=; b=Z51MCmAFxnota7sC3euS5e3yaD
	Nd1duSp33TKhdQocWy5bvZoPWm8Ewir3LAOLIx9igD4HrfQ9WHK3zYIopAobQoCZhk4AzkBFtM/RE
	HnfVkeZ6GbSqqQTbRVd48OZGcAONWq2cePO+lZiHRMVhBiNnA+jRUu4evX86jci5ZV8u51BZMfjlf
	vXGNOQzIqSzhMc18SxirkmLLiHWkI+pVv2vLrjHzbcwByMEQNZC2n9lTNnW8ecpVWyNLEqT4XfoJ9
	n9I2YqLZVula34vJUVH+HYAt0EzNdkwO1Fn2/BPmB34nvqXFl1uy/PPjUXd0/E0TQ6vZ9m3Ob+vpn
	tRIokr7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYnd-0000000BLui-3qPp;
	Tue, 14 Jul 2026 08:47:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYnb-0000000BLtp-2bDN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:47:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493b77b150aso5053485e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784018850; x=1784623650; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m879ws2jFhHLOh/9WRuezyCL3r8TAQ3JpjmFZyFa7tw=;
        b=j70dQtMZm3+/H9BZK1sFVEOouj/q02fxb1HdTGdbbwNnHuiof7S+tKhqHr8Q3+0i2g
         yUuD1/wt99HNJFqINKAG4Xg/9IqKRDSGqS02iAdjCKsdKce4elinw9DKcFAEnPkAJp4n
         rgjIscylnZahT7YDi96GiYoSkSscLI6SP0l8/jZLxRnyWy2rj1qILLkNWPJups9VCykK
         dbfvs65CdU+XF7B0dRakJ3LTn2IaMUA4XHMwbTefMxf1j6095Q+vrusOik+ynoOHJxGo
         rv6PqLGCvIGUHbpHOLedYAZF/AcVGq9SOyUmAIYTIv4aVXNsSpaWmI72NnNhT5/Xl7iv
         Zyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018850; x=1784623650;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m879ws2jFhHLOh/9WRuezyCL3r8TAQ3JpjmFZyFa7tw=;
        b=qrVW8NEVD8Nns0gYsjtucqV+eo8VIO1HIUavJ8U2kEuF7SCG0Qkrdkk0WtM0umEsJT
         idow5NzntTu8GX6KJSRQb2hm9YedSYDW1gpPQlXsf0MZ6FXDvHHkzuSef8lwHnvYHZVm
         Uyt97BlVpAATL+kRPV7x6pByvyM100mxvGTw5q4h5NxzcqjBfjWJtkB9621uf7cP33dl
         GZVGk7qo3KhiFMa+mhr0EKVRDS7t00p4CzYrJsLYEuUeZN/knI1q4l7IcTsEf2cCZPkw
         fIKE+cXkybYI1LJ4ms5ijQI6s0LeI4CHbDBzcCbbgmidzyXnRbVuuG+/Zt8y2laH0asW
         BT7Q==
X-Gm-Message-State: AOJu0YxZXXqhyven+vkQe+dEoKF5z76dmgszLo+ptn5qQIVI1mBq1K8f
	CbGjXNdgMRwoTzxNkpXEyKOJng3auhGKkUo1Eb8ygVqEyD0WzeVSoe8DxwtAashbFA==
X-Gm-Gg: AfdE7ckCGcKisoqBAWkLSo/gSfzMT5h6r9u8Gka/+sX+GLk5KBBNJbzOBBRLD5PbrPY
	w2R8DjnZ67jfONMJpT6Y8x6SgFqNlZclRWAou19ygmxcIgQVMauvrPhdSNcllt5Uo7TUZ8C969I
	eV9iI3sMKqV25Yig/52+utNfPoVHHLEEijTLEWId6d0gXPHxzrYU1nmypUq5XKXw/lTF+nur8bx
	X/ypFSaEiwdG5VzKw1vfsABeKkTbNKG2mIf0uiBS1BrIoJqp+PSFg4w8Tq2Gaw2Su6JOwWzt340
	8XigPgpBFia9hXu8Viu6UdcbvKrK2TFMTpS8MaBfQaeP3QFeh7XY9IZFrDL0nhq4jNALQY7MPHl
	6sO+nMQnSi9aprPEY7IDxxq+nVUdGZiXK4kTejVUyDOqxkD2pxbs49EdYK6bxZ360123TXMQfmT
	1DAdG6vdwAoAmuB5E2aG5yNihLbbUZPM8X9Wb3Hm9LaLmK1Cy5pww=
X-Received: by 2002:a05:600c:4f8a:b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-493f87e6e9cmr127818785e9.15.1784018849325;
        Tue, 14 Jul 2026 01:47:29 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495086ca93esm59158715e9.0.2026.07.14.01.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:47:28 -0700 (PDT)
Date: Tue, 14 Jul 2026 09:47:24 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <alX3nHLykNc_nng5@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <alTnAy7jvjUamwUA@google.com>
 <alTvf7iiOWn4PKE8@google.com>
 <alUA7zsJO1FGnss-@google.com>
 <alUJa5cbjjqZ8n72@google.com>
 <alUMVU7DYcrvgAYi@google.com>
 <alUsLFBQ5qKFOgwQ@google.com>
 <alXwXRGqECTUZ3ou@google.com>
 <alXzcrnxWADIEL2H@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alXzcrnxWADIEL2H@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_014731_676993_F16E89A7 
X-CRM114-Status: GOOD (  32.82  )
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

On Tue, Jul 14, 2026 at 08:29:38AM +0000, Mostafa Saleh wrote:
> On Tue, Jul 14, 2026 at 09:16:29AM +0100, Vincent Donnefort wrote:
> > On Mon, Jul 13, 2026 at 06:19:24PM +0000, Mostafa Saleh wrote:
> > > 
> > > That would walk the table twice, first time with a massive map, then
> > > to unmap the pages that was just mapped, issuing TLB invalidations
> > > for all of those, also as the IOMMU page table code never frees tables
> > > that means we would immediately exahust the IOMMU pool.
> > 
> > Well the massive map is pretty quick we would mostly just allocate the PGD? And
> > then it would be just for the subsequent unmaps to split the blocks. So nothing
> > to be freed really and no risk to exhaust the pool. But if you put the calls to
> > the host_stage2_* functions that's pretty transparent.
> 
> Not for the IOMMU, everything is mapped with a leaf mapping, because

Ha Ok my bad, I didn't get that!

> the pgtable code does not support splitting blocks, this is something
> I plan to add support for in a follow up series after this one is
> merged along side other optimizations.
> 
> > 
> > Just to make sure I am clear. Here's what it could look like:
> > 
> > in iommu.c:
> > 
> > int kvm_iommu_stage2_idmap_init(struct kvm_s2_mmu *host_mmu)
> > {
> > 	u64 addr = 0;
> > 
> > 	for (i = 0; i < hyp_memblock_nr; i++) { 
> > 		kvm_iommu_stage2_idmap(addr, reg->start, IOMMU_MMIO);
> > 
> > 		addr = reg->start + reg->size;
> > 		kvm_iommu_stage2_idmap(reg->start, addr, IOMMU_READ | IOMMU_WRITE);
> > 	}
> > 
> > 	kvm_iommu_stage2_idmap(addr, kvm_phys_size(host_mmu), IOMMU_MMIO);
> > }
> > 
> > in mem_protect.c:
> > 
> > int kvm_host_prepare_stage2(void *pgt_pool_base)
> > {
> > 	...
> > 
> > 	return kvm_iommu_stage2_idmap_init(mmu);
> > 
> > 	/* 
> > 	 * From here, all the changes to the host stage-2 will be reported to
> > 	 * the iommu driver
> > 	 */
> > }
> > 
> > On the pro side: no custom walker and we really couple the iommu idmap to the
> > host stage-2 map.
> > 
> > On the con side: As you've pointed out, we'd need indeed the iommu to be ready
> > early enough.
> > 
> > If you want to stick to the snapshot function, could we have the walker to
> > first walk the hyp_memblock? the .arg could just pass if we are walking a MMIO
> > region? That would avoid that find_mem_range_from() and I believe would
> > massively simplify the snapshot walker.
> > 
> 
> I see, let me try that.
> 
> 
> Unrelated to this, but while looking into option#2 I see that
> __pkvm_guest_share_host() does not call either of the
> host_stage2_set_owner* so that requires another explicit
> pkvm_iommu_host_stage2_idmap() call.

It does! it calls __host_set_page_state_range() which calls
host_stage2_idmap_locked().

FTR, I don't really like __host_set_page_state_range(). And we removed it
recently from our Android tree. Because there's just a special case in
__host_set_page_state_range() to cover guest_share_host. So we can easily
replace all the callers with __host_update_page_state() and and call the
idmap explicitely in __pkvm_guest_share_host().

> 
> I still plan to use option#2 in v7.
> 
> Thanks,
> Mostafa
> 


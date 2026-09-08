Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D166C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSaDyXNNPLHKZbj3b8+laIVszUdNsLcjgEBe5WQFgWo=; b=ZEv1HLLpDMV4oJqnbr73fu4QDB
	vk7Sl2he7zGA1r1IH/rFDatwfEQhcwxfBlfIa9CYe64iMJ3j3gEbOHJ84gcbOiKuv3ZWogMALfOl4
	AXDrittFQS938N3Fi8VQmZEFsO8LfBuEXD/A+SAU3a4ugu/fzSXvn8mSbe33f7cNTGpw2CtBej/uz
	dKVxDpeCPBW3+kkpYrHfP8oHiq9clIuTN9Mgt/WSL8OLK1dqQ2JrYbK6g+VJs/9WpNvBGutvhZDgZ
	vKFh+mxHI87N0EbHLoqyax9tXGFm8+M/Hm+Yp57b/Pf9+LFwKMGyKo3gpJklS24Iss9n0OGlYWULm
	fZ9gczbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xFQ-00000009Lre-0hRO;
	Tue, 08 Sep 2026 14:56:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xFK-00000009Lpq-2mhD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 14:56:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso50960305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788879385; x=1789484185; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uSaDyXNNPLHKZbj3b8+laIVszUdNsLcjgEBe5WQFgWo=;
        b=PruyEesekaTQKi81te5dkPaVyilkVShQpOuox0+r5n56/CJx4Uxb515Vkbnzq3YPbZ
         EaL+maPAduHiEc9xesiDQqotiSKSGy48OgK/eOan8Ix0EqR2HdBkOur39Adquo2HCdg9
         2/eUzEj4GOOuQpc8EAgWxJPgOErFEKxQHU2KFAc6NPEz87bmA4ecURHG2eSANn0ITvIj
         bvTekmMlaK1L1zbFRlvbqqtXJ8j8O3pWpSzCLNNDZ80uiEHu3pWP188sTqH7DFb+po0R
         T3z2TsQZW8KVtMMo/pALy65ZVeFWlB22YyfVHVS8Hp1tSjaqZ/j9BrtIT1lUSHkuUNsK
         Nnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879385; x=1789484185;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSaDyXNNPLHKZbj3b8+laIVszUdNsLcjgEBe5WQFgWo=;
        b=Ora8LmBK6C3d6r/VljZEuPM1ruUvkYlaTD+nVvIqMT1TC+mpS5GYqFfqQg7NxN/OoC
         wzSG/ZXfHCbywsVkRi0ZbAl0/GXqOgquXcoGoYp4dggBLH4WKPADQlNn1WKWnIYdJsE2
         98s5lzbpa+RfWOoP7XpwZl2kZ+PRpO7SVpsWb+99rrO3RLyOYbKsdcxUG5lIKRSM1dNZ
         PRGBWi62UpJ3dwG2a1ccyuQ+DSg1gDWnjvCYkforo2YVE6eeGqGryNRFSztGi642EOOC
         RtTu6ZPJIJc2gAgVY2q+Rr1xP7W7rpmmzFUvkFDvRFhGgblglnsfAnoSvPnFhuHmjIfc
         YBsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJ8h4oInqr6I8OXCgr9JUZKZGknvGOk61cz400l4MZa4AyC2gZxIotY27elJsxeGLbOZzxeDZlObaTi+2IYgvF@lists.infradead.org
X-Gm-Message-State: AFuF++kY1HMYrC/9w6RC1gGFh4/S3yA7NU7XC9HgI9nToS20AkX7bprV
	LlJMuuZVBgmpj1OjJOv5wD1V4wZtcE5qblFWAslF+jYJ8s4QXj/a7Suvxc2m4a1d7A==
X-Gm-Gg: AYBFou1sRFBwBMi3HvSdtdQzoTdsL74ynua2j/VwHHNjFXQAdWJcvdMqazUDbBIVGnJ
	5nI8BBPlq5j+wyP1kfN5aqB0zp4dR1YlRldK3bXn0xliGhDGqWflokMSzDY5r8ABLdVvO8JeSv5
	OXqxS1HOLzEqTMjHpjSqyOIWMCXWhspGoAQTybFgJ22jP+YiQM2UgnOxYjf6jLzGGOnUUzOHYWE
	cdSvKghZP8Dvt1/73Q78OklBVQDjjJCcK91zghcPh9TPF4SmSKG9lXObweS8BS6G65MRmoWQXp9
	YSVrFLv/OkJwYVblcLH8AZ4QZCxdjvhCh1SU/rKa3ImBqOe9bzTMOT4+OS3eHfOmb36yEEHUjXI
	hYeXCaLZtc9gC2nUD+Bi0OUGFJ2pe2WTlkJ01KdIbyAfF3Rd42JKy6JTwZ0dylGIPu/dB6Jqsrm
	F2VAeiax2kGyYMvI9q3rw4riWqzGOkdS179OtXKo8linNzOaGlco6m0iA1kkFyRH7EvcbCrq2DD
	wG85PGiZ0kJAjMce0KyW7W1M8eL8XXn
X-Received: by 2002:a05:600c:154f:b0:49c:fc6e:8cb5 with SMTP id 5b1f17b1804b1-49cfc6e8ee3mr300453305e9.25.1788879383965;
        Tue, 08 Sep 2026 07:56:23 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cc7sm399626395e9.4.2026.09.08.07.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:56:23 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:56:20 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 18/20] KVM: arm64: Add PKVM_HYP_REQ_SPLIT
Message-ID: <aqAiFGL4gm_j2HSv@google.com>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-19-vdonnefort@google.com>
 <b55i2bcuqp2wgadrj5a6nuc3t4o7ordrlcugxhhjw37k6hrlks@2h7ulmokholz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b55i2bcuqp2wgadrj5a6nuc3t4o7ordrlcugxhhjw37k6hrlks@2h7ulmokholz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_075626_729649_271FDB5D 
X-CRM114-Status: GOOD (  23.52  )
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

[...]

> > +static void pkvm_mapping_split(struct pkvm_mapping *mapping, struct kvm_pgtable *pgt,
> > +			       struct list_head *spares)
> > +{
> > +	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> > +	u64 nr_pages = mapping->nr_pages - 1;
> > +	gfn_t gfn = mapping->gfn + 1;
> > +	u64 pfn = mapping->pfn + 1;
> > +
> > +	lockdep_assert_held_write(&kvm->mmu_lock);
> > +
> > +	pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
> > +	mapping->nr_pages = 1;
> > +	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
> > +
> > +	while (nr_pages--) {
> > +		struct pkvm_mapping *m;
> > +
> > +		if (WARN_ON(list_empty(spares)))
> > +			break;
> > +
> > +		m = list_first_entry(spares, struct pkvm_mapping, list);
> > +		list_del(&m->list);
> > +
> > +		m->nr_pages = 1;
> > +		m->gfn = gfn++;
> > +		m->pfn = pfn++;
> > +
> > +		pkvm_mapping_insert(m, &pgt->pkvm_mappings);
> > +	}
> > +}
> > +
> 
> I don't see anything wrong with this linked list approach, but have you
> considered just allocating an array of pointers for the allocated
> pkvm_mappings? The union in pkvm_mappings can be avoided.

I have, but it doesn't fit the reclaim path which frees pkvm_mapping as a single
object.

> 
> >  int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
> >  			     struct kvm_pgtable_mm_ops *mm_ops)
> >  {
> > @@ -619,6 +682,91 @@ int pkvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size, void
> >  	return -EINVAL;
> >  }
> >  
> > +/*
> > + * Splitting is only expected on the back of a guest HVC, while
> > + * pkvm_pgtable_stage2_split() can be called with dirty logging.
> > + */
> > +static int __pkvm_pgtable_stage2_split(struct kvm_vcpu *vcpu, phys_addr_t ipa, u64 size)
> > +{
> > +	struct kvm_hyp_memcache *mc = &vcpu->arch.pkvm_memcache;
> > +	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> > +	struct page **pages __free(kfree) = NULL;
> > +	struct mm_struct *mm = current->mm;
> > +	struct kvm_memory_slot *memslot;
> > +	struct pkvm_mapping *mapping;
> > +	struct kvm *kvm = vcpu->kvm;
> > +	struct list_head spares;
> > +	unsigned long hva;
> > +	bool writable;
> > +	u64 nr_pages;
> > +	int ret, idx;
> > +	gfn_t gfn;
> > +
> > +	if (WARN_ON(!kvm_vm_is_protected(kvm)))
> > +		return -EINVAL;
> > +
> > +	if (!IS_ALIGNED(ipa, PMD_SIZE) || size != PMD_SIZE)
> > +		return -EINVAL;
> > +
> > +	ret = topup_hyp_memcache(mc, 1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* We already have 1 pin on the huge-page */
> > +	gfn = gpa_to_gfn(ipa) + 1;
> > +	nr_pages = (size / PAGE_SIZE) - 1;
> > +	pages = kmalloc_objs(struct page *, nr_pages);
> > +	if (!pages)
> > +		return -ENOMEM;
> > +
> > +	INIT_LIST_HEAD(&spares);
> > +	ret = pkvm_mapping_alloc_spares(&spares, nr_pages);
> > +	if (ret)
> > +		return ret;
> > +
> > +	idx = srcu_read_lock(&kvm->srcu);
> > +	memslot = gfn_to_memslot(kvm, gfn);
> > +	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
> > +	if (kvm_is_error_hva(hva) || !writable) {
> > +		ret = -EFAULT;
> > +		goto unlock_srcu;
> > +	}
> > +
> > +	mmap_read_lock(mm);
> > +	ret = pin_user_pages(hva, nr_pages, FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE, pages);
> 
> If I am not mistaken this is for getting additional pins only. hva walk
> and pages[] are just by-product.
> 
> Can we use folio_add_pins() here instead? Then I think we won't need
> pages[], the hva walk, and unpin_user_pages().

Good point, folio_add_pins() sounds way simpler.

-- 
Vincent

> 
> Thanks,
> Wei-Lin Chang
> 
> > +	mmap_read_unlock(mm);
> > +	if (ret != nr_pages) {
> > +		if (ret > 0)
> > +			unpin_user_pages(pages, ret);
> > +		ret = -EFAULT;
> > +		goto unlock_srcu;
> > +	}
> > +
> > +	write_lock(&kvm->mmu_lock);
> > +	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, ipa, ipa + size - 1);
> > +	if (!pkvm_mapping_can_split(mapping)) {
> > +		ret = -EINVAL;
> > +		goto unlock_mmu;
> > +	}
> > +
> > +	ret = kvm_call_hyp_nvhe(__pkvm_host_split_guest, gpa_to_gfn(ipa), size / PAGE_SIZE);
> > +	if (ret)
> > +		goto unlock_mmu;
> > +
> > +	pkvm_mapping_split(mapping, pgt, &spares);
> > +
> > +unlock_mmu:
> > +	write_unlock(&kvm->mmu_lock);
> > +	if (ret)
> > +		unpin_user_pages(pages, nr_pages);
> > +
> > +unlock_srcu:
> > +	srcu_read_unlock(&kvm->srcu, idx);
> > +	pkvm_mapping_free_spares(&spares);
> > +
> > +	return ret;
> > +}
> > +
> 
> [...]
> 


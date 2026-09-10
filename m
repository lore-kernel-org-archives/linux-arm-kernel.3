Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B34CC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKoYJ3dn9mRGunMRInGIver5jTSz1tQREqhFgol67GU=; b=SBuHcT5ypdGmZ4NN6KK9KNRJnP
	1v9N8u/R+84OCeggxx6W0u0q/woee8S771OCOYkPQGVjP3Iy9tezGbKcTnUbs8p7PB0J2v8jHdkEO
	yQUwC/ocjcuS3gMaPECkQlPhtXxpZ7wnLCxTy0sMQc62FWqfqdVMtN22rsSnm7H2UueMNsKoc3Gla
	LQY8H/82Ip9l1CNc51M8UUOPoHQIUKRv8uKj2vFAXyitCipfrJR0FbAquPWbYEYofP6oMryd7/qyN
	oNike/1KOPt9YIuVDuQYd3WAMUjrJU51a2ojmCXtYJUN9vQR/q4jarGYhKF/nCoYTbizL7lJrmBvj
	e+zwwAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cuK-0000000ECAL-2qsJ;
	Thu, 10 Sep 2026 11:25:32 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cuI-0000000EC9f-2Myd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:25:31 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-4b21f09ec76so4775722b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039529; x=1789644329; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rKoYJ3dn9mRGunMRInGIver5jTSz1tQREqhFgol67GU=;
        b=YNIcBeyNeOKhvP5TMY9DdNxeHm8dI5a0/70BJ+AoFU407FI9O7NBfvFmQgt6XCxb65
         TlSa17LhhevxwV1SP71vpy0N09dlXUISKgW1zfTzvWDsWVoJ3Dsfji1Q3aN2z+QbFwUd
         VM2amTUon5qdF+LC9r82aLJ57EdrMNvDvTvxdwEm8lumQOZhGsz9Q28zYD3FxjM2nRPy
         riaVHXMeHbjEt2D69RuHRM/63LnhwFklERR6fnPmyIx2jATMaJJsNjLe1ENjU7+Z2/IL
         4bFhkIEJZcVMXp838z2V/PuZlQAEpjmVb6DXk0AavhmFmAzoP/+Ox5FVan7rA9vGGwxB
         DMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039529; x=1789644329;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKoYJ3dn9mRGunMRInGIver5jTSz1tQREqhFgol67GU=;
        b=cou9s3Bfn8RC9BACw+fFZvFc0ZboayF9adVacTlwuoVMbIicD6lzSZ88pT9BANIgAG
         O9D3rdpTypi6J1x3cEAgSziTdh7teOkeWXWOTeYLqvMWDL69cxTeL/mXJ3kifMrLlNKF
         T6xiYxtZtiFSWH61pvABPYTVF7qESblfLgI2lt2pQ4FdlfwYp4p10+7zSE/LsLc2+/Pr
         XvkM9wFeMFto4rfOYxugOqG8yaj6NMOkGDa3Ao6b6JkhRpyONrtc0t93GpvcgntnDAbe
         wkrHBawb//+mqy+weZmH6FZiK9EHjMJILKEjE/o3tfF9sBe/bOnYxC1UMpW/GWzdFAjI
         G/5g==
X-Forwarded-Encrypted: i=1; AKwUvBwQ2QeyXCwLCAAB2Ygc3AAndQYeqQ22rFPvHpHzzdwzY3UlPVvbwuRjZTP4Vm8VnGGsq2tbVgp2Hj/sUhoq6MlZ@lists.infradead.org
X-Gm-Message-State: AFuF++nIh3g6kI5Mel2GdZ/KP5eAXl+WTMRtJsKfe1zoDxD25tD7J+vP
	iWk4UD0RCMdAn45g5xDWbojY4S/LGgrlMkJmidRxsZOvucK7huBnKk8E
X-Gm-Gg: AYBFou2F7NmGt3jaObj2A9cj+vVOgJFVucQQ3y075xh4cZ5Fzv0nA3QFdGkU4pfNkHY
	5JJGU0Q3aItz0atdgu0OW16IbtlPAe2YaFSNp5Y9BOo2/lqKtILfnqOpUnfxkZtnkCbpCTXddPe
	fbBLB+3zRr+sRXovJQhatbk/MDpWIhTsTbGMxqF6RH10o+I083BiLEVvJX/WeUfp6ZVvyYmbZqY
	NEj2SK0pis0f/V+r/w+jo1CyvvhP2BLqaxPaUzb+gSCQTqQRgEJS2qeoMyuNId6xWEsJ/P9ny/q
	TBZ0g3MJJecaMP3Ai1Hfsp123uevg3bt3kRxky+mgJ8Slm1V91TTc12hHqLkRX5PmmTWfLk9lyz
	A+0kT3X+25EOUxq3TyLrdL/nKz66pqSX6WQ2gER5xRKy2rb0Uotuj72ySWrZyjn7ita2tByHw2/
	FgMvg/68xFRYsxWecI+QGkVp/Pc1VzzSlnC034zSpJnOS9DwtUqdG/S8S1cehwuHiwPD5s0bg0U
	en0hWE3boX4fVJhN08rAoKnuJ1QGYbnyAJIdk8cXbHO9co3zOmGn6Q=
X-Received: by 2002:a05:6808:bca:b0:4b9:e6ab:d086 with SMTP id 5614622812f47-4b9e6abd362mr23531944b6e.38.1789039529448;
        Thu, 10 Sep 2026 04:25:29 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1435c2ae6b5sm6444309c88.1.2026.09.10.04.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:25:28 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 12/20] KVM: selftests: Add APIs to override memory region types with custom memslots
In-Reply-To: <20260902164123.2546762-13-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:48:26 +0530
Message-ID: <5x0d1hj1.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-13-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_042530_608334_149D6446 
X-CRM114-Status: GOOD (  11.01  )
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

Sean Christopherson <seanjc@google.com> writes:

> Add and use APIs to override memory region types instead of open coding the
> logic in tests, partly to dedup test code, but mostly to add some amount of
> protection against conflicting overrides.  This will allow converting more
> tests to override memory regions without taking on too much risk of bugs in
> the long term, e.g. due to silently overriding a region multiple times.
>
> Deliberately "unroll" the loops in __vm_create() and the CMMA test's
> create_main_memslot() to avoid filling all memslots in anticipation of
> adding an "extra" memslot that is for test use and *only* test use, i.e.
> shouldn't be configured by core library code.
>
> Converting tests to overriding memory regions will allow taking the region
> type instead of the raw memslot in the physical page allocator APIs.
>

May I suggest few changes in the naming of these APIs:

static inline void vm_override_mem_region(struct kvm_vm *vm,
					      enum kvm_mem_region_type type,
					      u32 slot)
{
	TEST_ASSERT(vm->memslots[type] == KVM_INVALID_MEMSLOT,
		    "Memory region type '%u' was already overridden with slot=%u",
		    type, vm->memslots[type]);

	vm->memslots[type] = slot;
}

static inline void vm_override_add_mem_region_flags(struct kvm_vm *vm,
					    enum kvm_mem_region_type type,
					    enum vm_mem_backing_src_type src_type,
					    gpa_t gpa, u32 slot, u64 npages,
					    u32 flags)
{
	vm_override_mem_region(vm, type, slot);
	vm_userspace_mem_region_add(vm, src_type, gpa, slot, npages, flags);
}

static inline void vm_override_add_mem_region(struct kvm_vm *vm,
					  enum kvm_mem_region_type type,
					  enum vm_mem_backing_src_type src_type,
					  gpa_t gpa, u32 slot, u64 npages)
{
	vm_override_add_mem_region_flags(vm, type, src_type, gpa, slot, npages, 0);
}

Those "_add_" and "_flags" in the function names easily gives away
the difference in the APIs, rather than differentiating via "__".

However, logically the change looks good - so feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A889C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zj+ANRRCM3elfcsUYTWPFAAqMrBVEKBDUe1b3TfKqtc=; b=FRxdQCeMdoYsbifz8lEt/UpC7c
	dVFZFLu4Pp9fjjzkA9bflaQnA1g31Ee7ahNj+HRiU615o+qY3r8sNzuTuMe1Pk0WUMOz6qGRTT0MR
	/pwqrG/LHcys0A9s2uw/Va/b7k/Tn4tCyh5WWMSYkdliK+m862i0BGTOn+CYIcKckyKdGHQcNGTso
	zF1eU1flKnR5fB1X1GMMdE8oiwkXKinN3ropx9DQKgN3Hr6G/xqpvzUWmbKmSJSee84HN82LBtICG
	6W+L8MclMY5HqYhxlT1ew6VVkghAQDg4abplAIWK1mHe9ENaQEYQT9mPl10v7TGW92iNX6NzcCp7x
	TfGcksbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOQ2-0000000DFUW-2ses;
	Tue, 20 May 2025 14:58:14 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHONv-0000000DF8Y-1slf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:56:04 +0000
Date: Tue, 20 May 2025 07:55:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747752959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj+ANRRCM3elfcsUYTWPFAAqMrBVEKBDUe1b3TfKqtc=;
	b=ougTOzs8lk/ovza5YLoy9N0ZdDaLIty8216yrXX/PTHRFPrYWOAr39Ky7KXAitDyEwpSI7
	VdxjjfIwFeqk5Ta8Zp2V99dfZWbxov+vnaXJih+KqhKG4yJlyfF5YYhmqXLQZVtbYtqcNv
	VuRBvCtO4RA5O6IBzs2Ndd4/VnqHjIw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
	shahuang@redhat.com, lpieralisi@kernel.org, david@redhat.com,
	aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com,
	kjaju@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
	acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
	danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com,
	udhoke@nvidia.com, dnigam@nvidia.com, alex.williamson@redhat.com,
	sebastianene@google.com, coltonlewis@google.com,
	kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org,
	akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org,
	ddutile@redhat.com, tabba@google.com, qperret@google.com,
	seanjc@google.com, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	maobibo@loongson.cn
Subject: Re: [PATCH v4 2/5] KVM: arm64: Make stage2_has_fwb global scope
Message-ID: <aCyX2nJzBXmQarAJ@linux.dev>
References: <20250518054754.5345-1-ankita@nvidia.com>
 <20250518054754.5345-3-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518054754.5345-3-ankita@nvidia.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_075603_634165_FD26B0A7 
X-CRM114-Status: GOOD (  20.52  )
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

Hi Ankit,

On Sun, May 18, 2025 at 05:47:51AM +0000, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Change the scope of stage2_has_fwb as it will be used in
> broader KVM code to determine whether the FWB feature is
> supported by the hardware.

Please just use the cpucap directly outside of the page table code. The
only non-FWB stage-2 that KVM maintains on a FEAT_S2FWB machine is for
the host when using protected mode. I don't anticipate that changing any
time soon.

Thanks,
Oliver

> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 8 ++++++++
>  arch/arm64/kvm/hyp/pgtable.c         | 2 +-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 6b9d274052c7..f21e2fae2bfe 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -507,6 +507,14 @@ u64 kvm_pgtable_hyp_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
>   */
>  u64 kvm_get_vtcr(u64 mmfr0, u64 mmfr1, u32 phys_shift);
>  
> +/**
> + * stage2_has_fwb() - Determine whether FWB is supported
> + * @pgt:    Page-table structure initialised by kvm_pgtable_stage2_init*()
> + *
> + * Return: True if FWB is supported.
> + */
> +bool stage2_has_fwb(struct kvm_pgtable *pgt);
> +
>  /**
>   * kvm_pgtable_stage2_pgd_size() - Helper to compute size of a stage-2 PGD
>   * @vtcr:	Content of the VTCR register.
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index df5cc74a7dd0..ee6b98fefd61 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -637,7 +637,7 @@ u64 kvm_get_vtcr(u64 mmfr0, u64 mmfr1, u32 phys_shift)
>  	return vtcr;
>  }
>  
> -static bool stage2_has_fwb(struct kvm_pgtable *pgt)
> +bool stage2_has_fwb(struct kvm_pgtable *pgt)
>  {
>  	if (!cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
>  		return false;
> -- 
> 2.34.1
> 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACAFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 17:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ck52aVERa/dSK9EW2phIhpiajUjsHvNg/KF8jAj4tKg=; b=vdE7ZQKQGX30NlYffL/SzoRiGI
	eXMMtaMWVoiPgpE0SG6CAw7OTEqymxHaJdH43iCkbzOyTSakMsP9Nwo+1vZQhTRc8RbTewoXg5NLG
	qYLBg+N2NcQOwYOuHdlhS8ZLM4WEP/YkURr2ZnR0Sg9nTXo946AAUGXdf9bv1SPa87wv/mOP0tnWo
	jRjSFY2sxBx94ttDjqfOO6zZmEofdEQ3Up0ypw/wUo6vvTmRjJ5wBhlKTXyDcsTJ8qrWz5QWCeTwq
	T6clzYRnqDw0aSf6xzwgPsR0k3FZWu0TLf648ugNy/YcohvQg0DrclWe50vmtx2g2wXA2L13r5y5V
	lZab5mhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFuX-0000000FIwI-0JXr;
	Mon, 29 Jun 2026 17:36:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFuV-0000000FIvn-0QpI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 17:36:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BD596014B;
	Mon, 29 Jun 2026 17:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620E31F000E9;
	Mon, 29 Jun 2026 17:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782754601;
	bh=Ck52aVERa/dSK9EW2phIhpiajUjsHvNg/KF8jAj4tKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KjaI50+gv3cmFnwRjqe6vTKfy49cDAY23fDmMF3N9T/0Io5q/qT0Q0F2n+Gv1EWzk
	 GOIm5WnE+sogMZ6SOs6TV9DkwIpebLa+2JgRbXc4BqMd1ieftFthZcvUZEdkoAbIyF
	 iCKEbj2tJIVRZgPqaF1Axib5kH6LONGp5AdMT8RovzBryMJSQXwma2rQytxsxJ7/XT
	 +zns84KvzucCrgsGo1h6+jn6PWZTU3nUUnizHk6V5hX891lQRZB3UPhPm9K34CAWai
	 gixob5Cg7h5dd44cQ98s+DsEdSITlckacEJqhfYJShwirdeuiz4hAjbV9CANlQ+E6b
	 2g92MUpvRF56g==
Date: Mon, 29 Jun 2026 10:36:40 -0700
From: Oliver Upton <oupton@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Kees Cook <kees@kernel.org>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	James Morse <james.morse@arm.com>, Zeng Heng <zengheng4@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>, Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 06/13] KVM: arm64: dirty_bit: Add base FEAT_HACDBS
 cleaning routine
Message-ID: <akKtKH8O5hngLenm@kernel.org>
References: <20260629111820.1873540-1-leo.bras@arm.com>
 <20260629111820.1873540-7-leo.bras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629111820.1873540-7-leo.bras@arm.com>
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

On Mon, Jun 29, 2026 at 12:17:54PM +0100, Leonardo Bras wrote:
> Introduce the basic cleaning routine that is going to be used for both
> dirty-bitmap and dirty-ring routines.
> 
> It sets the required registers with the input buffer, and wait for
> HACDBSIRQ to happen, which means either the task is done, or there was some
> error during processing.
> 
> It is ran with preemption disabled, as a task being scheduled in could
> change the translation registers used by HACDBS and end up corrupting the
> current dirty-bit tracking and the sched-in task's S2 pagetables.
> 
> Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> ---
>  arch/arm64/kvm/dirty_bit.c | 81 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/arch/arm64/kvm/dirty_bit.c b/arch/arm64/kvm/dirty_bit.c
> index 789da8712b1b..e4283828b780 100644
> --- a/arch/arm64/kvm/dirty_bit.c
> +++ b/arch/arm64/kvm/dirty_bit.c
> @@ -1,36 +1,117 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (C) 2026 ARM Ltd.
>   * Author: Leonardo Bras <leo.bras@arm.com>
>   */
>  
>  #include <asm/kvm_dirty_bit.h>
> +#include <asm/kvm_mmu.h>
>  #include <linux/kconfig.h>
>  #include <linux/acpi.h>
>  
>  DEFINE_PER_CPU(struct hacdbs, hacdbs_pcp) = {
>  	.status = HACDBS_OFF,
>  	.size = 0,
>  };
>  
>  /* HDBSS entry field definitions */
>  #define HDBSS_ENTRY_VALID BIT(0)
>  #define HDBSS_ENTRY_TTWL_SHIFT (1)
>  #define HDBSS_ENTRY_TTWL_MASK (GENMASK(3, 1))
>  #define HDBSS_ENTRY_TTWL(x) \
>  	(((x) << HDBSS_ENTRY_TTWL_SHIFT) & HDBSS_ENTRY_TTWL_MASK)
>  #define HDBSS_ENTRY_TTWL_RESV HDBSS_ENTRY_TTWL(-4)
>  #define HDBSS_ENTRY_IPA GENMASK_ULL(55, 12)
>  
>  static __ro_after_init int hacdbsirq = -1;
>  
> +static void hacdbs_start(u64 *hw_entries, int size)
> +{
> +	u64 br;
> +	/* Each entry is 8 bytes */
> +	int size_b = size * sizeof(hw_entries[0]);
> +	int size_p2 = max(roundup_pow_of_two(size_b), PAGE_SIZE);
> +
> +	/* If not using the full size of the array, put a stop entry at the end */
> +	if (size_b < size_p2)
> +		hw_entries[size] = HDBSS_ENTRY_VALID | HDBSS_ENTRY_TTWL_RESV;
> +
> +	sysreg_clear_set_s(SYS_HACDBSCONS_EL2,
> +			   HACDBSCONS_EL2_ERR_REASON | HACDBSCONS_EL2_INDEX, 0);
> +
> +	br = (virt_to_phys(hw_entries) & HACDBSBR_EL2_BADDR_MASK) |
> +	     FIELD_PREP(HACDBSBR_EL2_SZ, ilog2(size_p2) - 12) |
> +	     FIELD_PREP(HACDBSBR_EL2_EN, 1);
> +
> +	this_cpu_write(hacdbs_pcp.status, HACDBS_RUNNING);
> +	this_cpu_write(hacdbs_pcp.size, size);
> +	write_sysreg_s(br, SYS_HACDBSBR_EL2);
> +	isb();
> +}
> +
> +static int hacdbs_stop(void)
> +{
> +	write_sysreg_s(0, SYS_HACDBSBR_EL2);
> +	isb();
> +
> +	if (this_cpu_read(hacdbs_pcp.status) == HACDBS_ERROR) {
> +		/* In case of error, HACDBSCONS_EL2.INDEX should point the faulty entry */
> +		u64 cons = read_sysreg_s(SYS_HACDBSCONS_EL2);
> +		int idx = FIELD_GET(HACDBSCONS_EL2_INDEX, cons);
> +
> +		this_cpu_write(hacdbs_pcp.status, HACDBS_IDLE);
> +
> +		return idx;
> +	}
> +
> +	return this_cpu_read(hacdbs_pcp.size);
> +}
> +
> +/*
> + * Clears dirty-bits for an array of pages (hw_entries) using HACDBS
> + * Returns the number of items cleaned from the array. If returns value < size,
> + *	there was an error in the processing.
> + */
> +static int dirty_bit_clear(struct kvm *kvm, u64 *hw_entries, int size)
> +{
> +	u64 hcr_el2;
> +	int ret;
> +
> +	preempt_disable();
> +
> +	hcr_el2 = read_sysreg(HCR_EL2);
> +	write_sysreg(hcr_el2 | HCR_EL2_VM, HCR_EL2);

sysreg_clear_set_hcr(). I'm pretty sure all the speculative AT errata
depend on HCR_EL2.VM being set _after_ the stage-2 MMU has been loaded.

> +	__load_stage2(&kvm->arch.mmu);

Pretty sure you need an ISB here to ensure loading the MMU is ordered
with enabling HACDBS.

> +	hacdbs_start(hw_entries, size);
> +
> +	do {
> +		wfi();
> +	} while (this_cpu_read(hacdbs_pcp.status) == HACDBS_RUNNING);

This is exactly why I said you should just poll hardware instead. It is
entirely possible that the IRQ arrives before you WFI.

> +	ret = hacdbs_stop();
> +
> +	write_sysreg(hcr_el2, HCR_EL2);

write_sysreg_hcr()

Thanks,
Oliver


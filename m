Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EBDD29C58
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 18:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c42DaJASRb/gHd6HvTQo4SRBavzrq7Q4XzEVl0qXAS4=; b=WbKp8g88ExkWqoUc2qju7qidEe
	2shk0vPp8dctVW09axa/C1u0UGoVXoRBrRpZrv110gGhcmMEoGDfOLTVj5XdUzjxtacBGvXNLZPHH
	6TvTBDqHzl29+QNYB0F1/qrZQDBZ/4TmUPAjTTDq9OHL1LUTCTPugqz5cBVx/qLisC4ykhN9H9o8Y
	Sx8E8a2ZRRggitETmGLMQJvbt/MrguxiSq4FpL7e3tvtI9kJL1v1cldT/hSzKdh1Le2K9zXupISnK
	vXKJUZCMleFPIbejqdENtdgzZ9ewaecGX1Bxb55wM54ceTqAdCBxuLbtDaNTBszydlSA4N5PSBk2t
	bhT0CKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtol-00000002hPB-2jpV;
	Mon, 19 Jan 2026 18:17:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtoj-00000002hOC-3RBG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 18:17:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39BBC497;
	Mon, 19 Jan 2026 10:17:25 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F222A3F694;
	Mon, 19 Jan 2026 10:17:30 -0800 (PST)
Date: Mon, 19 Jan 2026 18:17:28 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Carl Worth <carl@os.amperecomputing.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Taehyun Noh <taehyun@utexas.edu>,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v2 1/2] arm64: mte: Clarify kernel MTE policy and
 manipulation of TCO
Message-ID: <aW51OPBNsydlJS30@arm.com>
References: <20251030-mte-tighten-tco-v2-0-e259dda9d5b3@os.amperecomputing.com>
 <20251030-mte-tighten-tco-v2-1-e259dda9d5b3@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-mte-tighten-tco-v2-1-e259dda9d5b3@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_101733_936102_CB25F872 
X-CRM114-Status: GOOD (  40.71  )
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

+ Peter as he contributed the original patch for skipping PSTATE.TCO
clearing.

On Thu, Jan 15, 2026 at 03:07:17PM -0800, Carl Worth wrote:
> From: Taehyun Noh <taehyun@utexas.edu>
> 
> The kernel's primary knob for controlling MTE tag checking is the
> PSTATE.TCO bit (tag check override). TCO is enabled (which,
> confusingly _disables_ tag checking) by the hardware at the time of an
> exception. Then, at various times, when the kernel needs to enable
> tag-checking it clears TCO, (which in turn allows TCF0 or TCF to
> control whether tag-checking occurs).
> 
> Some of the TCO manipulation code is unclear or perhaps confusing.
> 
> Make the code more clear by introducing a new function
> user_uses_tagcheck which captures the existing condition for testing
> whether tag checking is desired. This new function includes
> significant new comments to help explain the logic.
> 
> Also fix the confusing naming by renaming mte_disable_tco_entry() to
> set_kernel_mte_policy(). This function does not necessarily disable
> TCO, but does so only conditionally in the case of KASAN HW TAGS. The
> new name accurately describes the purpose of the function.
> 
> This commit should have no behavioral change.
> 
> Signed-off-by: Taehyun Noh <taehyun@utexas.edu>
> Co-developed-by: Carl Worth <carl@os.amperecomputing.com>
> Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/mte.h     | 40 +++++++++++++++++++++++++++++++++-------
>  arch/arm64/kernel/entry-common.c |  4 ++--
>  arch/arm64/kernel/mte.c          |  2 +-
>  3 files changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
> index 6d4a78b9dc3e..fccb51b2abb0 100644
> --- a/arch/arm64/include/asm/mte.h
> +++ b/arch/arm64/include/asm/mte.h
> @@ -224,7 +224,35 @@ static inline bool folio_try_hugetlb_mte_tagging(struct folio *folio)
>  }
>  #endif
>  
> -static inline void mte_disable_tco_entry(struct task_struct *task)
> +static inline bool user_uses_tagcheck(struct task_struct *task)

The naming is not entirely correct since the user may have enabled
asynchronous tag checks. They are still checks.

> +{
> +	/*
> +	 * To decide whether userspace wants tag checking we only look
> +	 * at TCF0 (SCTLR_EL1.TCF0 bit 0 is set for both synchronous
> +	 * or asymmetric mode).
> +	 *
> +	 * There's an argument that could be made that the kernel
> +	 * should also consider the state of TCO (tag check override)
> +	 * since userspace does have the ability to set that as well,
> +	 * and that could suggest a desire to disable tag checking in
> +	 * spite of the state of TCF0. However, the Linux kernel has
> +	 * never historically considered the userspace state of TCO,
> +	 * (so changing this would be an ABI break), and the hardware
> +	 * unconditionally sets TCO when an exception occurs
> +	 * anyway.

This behaviour around user TCO is already documented in
Documentation/arch/arm64/memory-tagging-extension.rst.

> +	 *
> +	 * So, again, here we look only at TCF0 and do not consider
> +	 * TCO.
> +	 */
> +	return (task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT));
> +}
> +
> +/*
> + * Set the kernel's desired policy for MTE tag checking.
> + *
> + * This function should be used right after the kernel entry.
> + */
> +static inline void set_kernel_mte_policy(struct task_struct *task)
>  {
>  	if (!system_supports_mte())
>  		return;
> @@ -232,15 +260,13 @@ static inline void mte_disable_tco_entry(struct task_struct *task)
>  	/*
>  	 * Re-enable tag checking (TCO set on exception entry). This is only
>  	 * necessary if MTE is enabled in either the kernel or the userspace
> -	 * task in synchronous or asymmetric mode (SCTLR_EL1.TCF0 bit 0 is set
> -	 * for both). With MTE disabled in the kernel and disabled or
> -	 * asynchronous in userspace, tag check faults (including in uaccesses)
> -	 * are not reported, therefore there is no need to re-enable checking.
> +	 * task. With MTE disabled in the kernel and disabled or asynchronous
> +	 * in userspace, tag check faults (including in uaccesses) are not
> +	 * reported, therefore there is no need to re-enable checking.
>  	 * This is beneficial on microarchitectures where re-enabling TCO is
>  	 * expensive.
>  	 */
> -	if (kasan_hw_tags_enabled() ||
> -	    (task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT)))
> +	if (kasan_hw_tags_enabled() || user_uses_tagcheck(task))
>  		asm volatile(SET_PSTATE_TCO(0));
>  }

TBH, I'm fine with leaving the logic in this function without
introducing a new user_uses_tagcheck() but not strongly opposed to it
with better naming.

That said, the set_kernel_mte_policy() naming looks too broad. The
policy somehow implies tag check mode, fault behaviour. All it does is
dealing with PSTATE.TCO.

-- 
Catalin


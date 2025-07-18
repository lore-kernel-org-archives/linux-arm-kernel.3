Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DDDC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bq3CWgM1X4CD+URSy8keqkaO9TmOO1aYiktkN74EFc=; b=fJsbzZ+/WeTKVllBgB0PE9wI0v
	nRa0myzn16lOiFrzTJzpfaz0ccwugZdjSb7gwSq5y8VDb6VTgmGy/QACLyVH9vBGXcc6B+1PaxXRr
	J9BpvWTY8D3lGoD0xkhAMSuxCJuR8c1VlfuXGvm86wAfv0wTYRJDSADZA21IO9rJ83o8WHWAXr93F
	6myin7l5OPWerNjwaHYZT/w7k31QKsADA2So1MYVteFJJ8f/IHpkdz6UwruqX+T++cBxYlYoLYget
	Vd3Ul1WqXDaYwQKSWP+nGHl8nmgjb5kDh4uu2BfqhwdYGFYiK/qreAJvVN/FrmSnBZ7/GFsYb4UHX
	ZYTy28TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclhv-0000000ClCm-1dqm;
	Fri, 18 Jul 2025 14:05:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclWO-0000000CjeU-2S80
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 13:53:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0583744339;
	Fri, 18 Jul 2025 13:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3169C4CEEB;
	Fri, 18 Jul 2025 13:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752846786;
	bh=B4SnE+zQQYrXoOXSH3uh52tXSCyHrejJfwt5H9FxdM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NlGGxUof11Zehi8WBXyY/8GR05FhcOVGptIke0qiu0pQfbjWDF4kH235O8293aR2d
	 YvWNzcgzpoYL1rmqDAQ3XTk5/0gadDntr+1tTU1Z7YMmwlmqqe/K/vPbLQIMGcg6NQ
	 wZMibR8oYCiKzHRN1TwApjuzcj+ry5jE4DvLD/aQMtQdhO9lbq5DOiQvdFOwiq5J9+
	 /9QbvorA4qw/MObr/WO8ycsIoxPnGfDOnk8M6XCCgPvZDpkNJjlXMTuS2UH8XU/sTm
	 JIpt36PkfH6ZQOjQsmN8OnDI24KpPaYKKVfouIPA7lqNgK3GRNm7Nhg9VvowAU7lnN
	 dC4BzIdNfmnZQ==
Date: Fri, 18 Jul 2025 14:53:00 +0100
From: Will Deacon <will@kernel.org>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, ahomescu@google.com,
	armellel@google.com, arve@android.com, ayrton@google.com,
	qperret@google.com, sebastianene@google.com, qwandor@google.com
Subject: Re: [PATCH v7 5/5] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in
 host handler
Message-ID: <aHpRvBO864x1vvqP@willie-the-truck>
References: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
 <20250701-virtio-msg-ffa-v7-5-995afc3d385e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-virtio-msg-ffa-v7-5-995afc3d385e@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_065308_663651_07419C23 
X-CRM114-Status: GOOD (  20.93  )
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

On Tue, Jul 01, 2025 at 10:06:38PM +0000, Per Larsen via B4 Relay wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> FF-A 1.2 adds the DIRECT_REQ2 messaging interface which is similar to
> the existing FFA_MSG_SEND_DIRECT_{REQ,RESP} functions except that it
> uses the SMC calling convention v1.2 which allows calls to use x4-x17 as
> argument and return registers. Add support for FFA_MSG_SEND_DIRECT_REQ2
> in the host ffa handler.
> 
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 24 +++++++++++++++++++++++-
>  include/linux/arm_ffa.h       |  2 ++
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 79d834120a3f3d26e17e9170c60012b60c6f5a5e..21225988a9365219ccfd69e8e599d7403b5cdf05 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -679,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_NOTIFICATION_GET:
>  	case FFA_NOTIFICATION_INFO_GET:
>  	/* Optional interfaces added in FF-A 1.2 */
> -	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */

I think that's the only change needed. In fact, maybe just don't add it
in the earlier patch?

>  	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
>  	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */
>  	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
> @@ -862,6 +861,22 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  	hyp_spin_unlock(&host_buffers.lock);
>  }
>  
> +static void do_ffa_direct_msg2(struct arm_smccc_1_2_regs *regs,
> +			       struct kvm_cpu_context *ctxt,
> +			       u64 vm_handle)
> +{
> +	DECLARE_REG(u32, endp, ctxt, 1);
> +
> +	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
> +
> +	if (FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != vm_handle) {
> +		ffa_to_smccc_error(regs, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}

Why do we care about checking the src id? We don't check that for
FFA_MSG_SEND_DIRECT_REQ and I don't think we need to care about it here
either.

Will


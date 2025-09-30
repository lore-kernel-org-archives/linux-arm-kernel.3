Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEE4CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pHpt7CDHCqXZIPqXqP5GeFUQ+2hDy19GgbDfEoEHB4=; b=bQUvKgol9Pn4Bz3jLxZ/5HiANL
	aK00Bn5+KiNVf69pwy2wCXuq1nU+Fz82bqTh3CDo1jmj4uwVZ4E3MWYxYQ07JEL8p/Km6t/797DY/
	M/pvCzV3VAY6d6QIpkiaDHDoqyC4klEg2IxpG8UjqHvRARgL2V2OTEdODjmWQF3PXJhOR0REs5a2A
	2xY5R39ON55TpKPzazNjTQykhniFFQqYxqWA6xOEos/6PfPreLLwR64NKut85rlwO6EtDHSACJp/w
	4TjxRXY0eQVSTqc+T1ikaWeX5FbxuaikRG6zQlk37VmOgYfiB1MItvjVaa2BJ3LfZGMA3W5FRjnXA
	6tGVr8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3XMB-00000004yGW-3PfF;
	Tue, 30 Sep 2025 10:13:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3XM9-00000004yFZ-0pAn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 10:13:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07E161424;
	Tue, 30 Sep 2025 03:13:02 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEC843F66E;
	Tue, 30 Sep 2025 03:13:08 -0700 (PDT)
Date: Tue, 30 Sep 2025 11:13:03 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 03/13] KVM: arm64: Replace timer context vcpu pointer
 with timer_id
Message-ID: <20250930101303.GA1093338@e124191.cambridge.arm.com>
References: <20250929160458.3351788-1-maz@kernel.org>
 <20250929160458.3351788-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929160458.3351788-4-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_031313_277684_74FB5087 
X-CRM114-Status: GOOD (  20.79  )
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

On Mon, Sep 29, 2025 at 05:04:47PM +0100, Marc Zyngier wrote:
> Having to follow a pointer to a vcpu is pretty dumb, when the timers
> are are a fixed offset in the vcpu structure itself.
> 
> Trade the vcpu pointer for a timer_id, which can then be used to
> compute the vcpu address as needed.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/arch_timer.c  |  4 ++--
>  include/kvm/arm_arch_timer.h | 11 ++++++-----
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index e5a25e743f5be..c832c293676a3 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -149,7 +149,7 @@ static void timer_set_cval(struct arch_timer_context *ctxt, u64 cval)
>  static void timer_set_offset(struct arch_timer_context *ctxt, u64 offset)
>  {
>  	if (!ctxt->offset.vm_offset) {
> -		WARN(offset, "timer %ld\n", arch_timer_ctx_index(ctxt));
> +		WARN(offset, "timer %d\n", arch_timer_ctx_index(ctxt));
>  		return;
>  	}
>  
> @@ -1064,7 +1064,7 @@ static void timer_context_init(struct kvm_vcpu *vcpu, int timerid)
>  	struct arch_timer_context *ctxt = vcpu_get_timer(vcpu, timerid);
>  	struct kvm *kvm = vcpu->kvm;
>  
> -	ctxt->vcpu = vcpu;
> +	ctxt->timer_id = timerid;
>  
>  	if (timerid == TIMER_VTIMER)
>  		ctxt->offset.vm_offset = &kvm->arch.timer_data.voffset;
> diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
> index d188c716d03cb..d8e400cb2bfff 100644
> --- a/include/kvm/arm_arch_timer.h
> +++ b/include/kvm/arm_arch_timer.h
> @@ -51,8 +51,6 @@ struct arch_timer_vm_data {
>  };
>  
>  struct arch_timer_context {
> -	struct kvm_vcpu			*vcpu;
> -
>  	/* Emulated Timer (may be unused) */
>  	struct hrtimer			hrtimer;
>  	u64				ns_frac;
> @@ -71,6 +69,9 @@ struct arch_timer_context {
>  		bool			level;
>  	} irq;
>  
> +	/* Who am I? */
> +	enum kvm_arch_timers		timer_id;
> +
>  	/* Duplicated state from arch_timer.c for convenience */
>  	u32				host_timer_irq;
>  };
> @@ -127,9 +128,9 @@ void kvm_timer_init_vhe(void);
>  #define vcpu_hvtimer(v)	(&(v)->arch.timer_cpu.timers[TIMER_HVTIMER])
>  #define vcpu_hptimer(v)	(&(v)->arch.timer_cpu.timers[TIMER_HPTIMER])
>  
> -#define arch_timer_ctx_index(ctx)	((ctx) - vcpu_timer((ctx)->vcpu)->timers)
> -#define timer_context_to_vcpu(ctx)	((ctx)->vcpu)
> -#define timer_vm_data(ctx)		(&(ctx)->vcpu->kvm->arch.timer_data)
> +#define arch_timer_ctx_index(ctx)	((ctx)->timer_id)
> +#define timer_context_to_vcpu(ctx)	container_of((ctx), struct kvm_vcpu, arch.timer_cpu.timers[(ctx)->timer_id])
> +#define timer_vm_data(ctx)		(&(timer_context_to_vcpu(ctx)->kvm->arch.timer_data))
>  #define timer_irq(ctx)			(timer_vm_data(ctx)->ppi[arch_timer_ctx_index(ctx)])
>  
>  u64 kvm_arm_timer_read_sysreg(struct kvm_vcpu *vcpu,
> -- 
> 2.47.3
> 


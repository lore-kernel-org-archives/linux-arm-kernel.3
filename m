Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6808BC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsLJzuOka1G82HHnXudeI7xCsozIFQ/OmCRJbIumR6E=; b=b4kXI524X6hjt3QC1EvBBK5yBV
	UroYKnz1a7Xp/Kkuy4X2OO/Kt4MUaLPcr+4KsDwQI2RdwReJJy79GY2UMMrj2KqTrWBx0eLjJ7USA
	F+j8piEkR23mA2KXSUaE8RrrN2VDnLeN9dx/LZ6dQdmoyWGE/HAtS/MdviS8fLa52x5EiWHtQKR4F
	WRG81CIX14id5hBrrNLY8KX+24d7H/lU4FK/HIhJ8CpZMT6CV5SFOBYcZKpXJmbre/R5v8LILG5na
	JI+22i1ekdNH3GLV02rjlPZTIVrTJpV5BFr+5zmBzUBF30wDBFQxiM5UyWa9ond74OZXPbpvicvO5
	B772XeKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmzo-0000000HFPh-1oaU;
	Tue, 29 Jul 2025 16:16:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmf2-0000000HC7A-1zhd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 15:54:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8178B601F4;
	Tue, 29 Jul 2025 15:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7B0C4CEEF;
	Tue, 29 Jul 2025 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753804479;
	bh=n3Jk+CPILaJYaCx7aTV41IfzLXf10369ycUvb31MdKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYavHetWDdRQrwYVwiIDQu/+5/kxpO6SdrYzb559IzsmNAvSyIhnYpjdQdEORxUT+
	 JelpcInB+0Tstp+5et8taFYA9aj2ng6IwTqOAzuDl/W/2+E368U9x+PuMVvzinefWE
	 KP+0J9bv/rtIoyV+GlZdej6VomTyj9k3DpF+DchtUYOoTfK0f6jFls4XjKOrIY+GwF
	 YW0KXfdCSMyZyzm511WjZDHjph8iFbYapkgcTPuKMxYjAKJcx5GM/C7d6ncBJAcm69
	 KIZqUly7CdiGPjfP9Ve9PUZLbwVJWvp5IsjOt/XPAz1LGXmEq5JdLAybekNIO47nVN
	 +puzQQug3keTg==
Date: Tue, 29 Jul 2025 16:54:33 +0100
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
Subject: Re: [PATCH v8 7/7] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in
 host handler
Message-ID: <aIjuuTf2az25A7jW@willie-the-truck>
References: <20250719-virtio-msg-ffa-v8-0-03e8e8dbe856@google.com>
 <20250719-virtio-msg-ffa-v8-7-03e8e8dbe856@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719-virtio-msg-ffa-v8-7-03e8e8dbe856@google.com>
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

On Sat, Jul 19, 2025 at 02:11:29AM +0000, Per Larsen via B4 Relay wrote:
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
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index f6d964df53c3e21ba85984f35cc7b6859012d1b0..363374408b354a5d65861b9cf140974d8914ff40 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -851,6 +851,15 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  	hyp_spin_unlock(&host_buffers.lock);
>  }
>  
> +static void do_ffa_direct_msg2(struct arm_smccc_1_2_regs *regs,
> +			       struct kvm_cpu_context *ctxt,
> +			       u64 vm_handle)
> +{
> +	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
> +
> +	arm_smccc_1_2_smc(args, regs);
> +}
> +
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
>  	struct arm_smccc_1_2_regs res;
> @@ -909,11 +918,18 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_PARTITION_INFO_GET:
>  		do_ffa_part_get(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_MSG_SEND_DIRECT_REQ2:
> +		if (hyp_ffa_version >= FFA_VERSION_1_2) {
> +			do_ffa_direct_msg2(&res, host_ctxt, HOST_FFA_ID);
> +			goto out_handled;

I think it would be cleaner if ffa_call_supported() returned false for
this when the FFA version is < 1.2

Will


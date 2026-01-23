Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B332D74EC2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 12:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ij2RGbSR4/41SvaAzVIlaX6o5oVSqmFdwyLW6lZyVqg=; b=rx3M6FTDhV4L3O4r/2Z42QXZwn
	d3QBsAtDzXHf+iMiNaJGmukdogwt+uFaUpdzLsYvRo9r/P2JEHmzQ7UIN+m6k4mX3cHwOf01pcrOR
	wRLVH+uRqbeaoTv9Dm211b7aw24Z9Q6HjrIkRccVqOrT9vsfLhWcL+CgU88lmR73L+ATUjzahoSp/
	tHeevQJYJ+AThZ+pkV8++UPDFyEyIxzd8ZdaNxinaIK5y1quFClcsYvqk/+P+Ep2Nb1/QYb4r3U7y
	BWymwjBt7rZ1hBJ9OIHZi4CuVmSR22MhGqeCa945uXWOPE3Mbu/IIfKUJBIwtstiSquSNR45optiE
	jH96fNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGhb-00000008w23-3aYD;
	Fri, 23 Jan 2026 12:55:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGha-00000008w1s-2GA8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 12:55:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A646A60010;
	Fri, 23 Jan 2026 12:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A79C4CEF1;
	Fri, 23 Jan 2026 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769172949;
	bh=GcaMgzzRJVMZIDYWEMwJdb54aJDPROHZoomAa2LyUcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pHcFHW/XhoB4yR0c7RrUSgqzjTmQdT1JTb99sdK1mTjrZmaQIQ+gUXZbsp7k9r28E
	 4p5EX8n2PnELlfa7oVBobJOmjRGf8wAllbJGLU0V7jrNXvvwWrrpMrIY9P9oEwWqIJ
	 fLD5aEHRJGBACNclN6lUXppO/IjA/xnQ78XsUe3BilaBfZmTcbRB7UN0vZqYFiW3SW
	 u/lWYw64BNivYn82XTc4GsytJo3C+euWJJ6eyz8xApcXSSqulp2B/e1pVysA3j+L+k
	 0W9kWRYfZLxhWsLJQnxDAT4WXNPqHZI45GdP0B4pxHA3UGwKfnZwG1nI8wBUNINagx
	 yVq7lABae2stQ==
Date: Fri, 23 Jan 2026 12:55:43 +0000
From: Will Deacon <will@kernel.org>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Armelle Laine <armellel@google.com>,
	Sebastien Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in
 host handler
Message-ID: <aXNvzxoBXr-oRB8r@willie-the-truck>
References: <20260121-host-direct-messages-v5-0-2c1614c94e80@google.com>
 <20260121-host-direct-messages-v5-1-2c1614c94e80@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-host-direct-messages-v5-1-2c1614c94e80@google.com>
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

Per,

On Wed, Jan 21, 2026 at 08:27:12AM +0000, Per Larsen via B4 Relay wrote:
> From: Sebastian Ene <sebastianene@google.com>
> 
> Allow direct messages to be forwarded from the host. The host should
> not be sending framework messages so they are filtered out.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index f731cc4c3f280a32acccca0de92b9ac6c8e05602..9967916278a7ca051500946ef2fcfe7bb40e0e8d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -862,6 +862,28 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  	hyp_spin_unlock(&host_buffers.lock);
>  }
>  
> +static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
> +			      struct kvm_cpu_context *ctxt,
> +			      u64 vm_handle)
> +{
> +	DECLARE_REG(u32, flags, ctxt, 2);
> +
> +	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
> +
> +	if (vm_handle != HOST_FFA_ID) {
> +		ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}

Sorry, but this isn't what I had in mind. 'vm_handle' is just a local
variable and the only caller passes HOST_FFA_ID, so this isn't really
achieving anything.

What you had in v4 dropped the 'vm_handle' argument entirely, which I
think is the right thing to do. However, the FF-A spec encodes the sender
ID in bits 31:16 of register W1 and so _that_ is what I think we should
be checking because _that_ is what the receiver will see.

Honestly, we could avoid quite a lot of these review cycles if you
actually replied to my emails on the list instead of just responding
with a new patch series each time. It's supposed to be a technical
discussion...

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46B3D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kss6sRcyiicuExPPJv15p6/SjCbLVfDN7OMYxMgsRiE=; b=e96H2j3Ty/TTYHzxPI52aeCgrc
	9Nu6is1FcQ9zC27uNVjdFJ00PuUwngus6J1yY4g+W0oJZHwnChAoCCdt7IAMThCAjhKqgvkwbG0HT
	47Zw5J3PtYe2oBgOZ4qj5NJOaCET/73GrsqC9TIe+HQrmDNQV9K9QVQimpreRRYFqmwBVaE0NKXL6
	UkOgFDosxjX8pLiuhd1CX6b+aK2d7qAq1+u/i2Y8BBURdBDY8vKD8EqGKJY7661CkqM0kSs5kYsO7
	s+pC0Ow7EJK+/wcmt/8JvbvL1Tc3KqCFLnr06C2jbLZ+gfpilE6p2KA+eMQcGx1Qpfh8bO56R26xN
	hpPFy0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdru9-0000000HWLN-3OW6;
	Thu, 08 Jan 2026 15:26:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdru8-0000000HWKa-16w4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:26:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38F5D60130;
	Thu,  8 Jan 2026 15:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8ACC116C6;
	Thu,  8 Jan 2026 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767885986;
	bh=+ovEomnQgps42mBgCaU8zAij1WwMupnacumZo1P2P/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YICLigBh8it9PyFKds+w/KJn+a3+w/NSUl5i6g44lYWLNx/pKfE3KuVPNx+9ZmeWY
	 qzCiTTNbx9N2mbSeZqKM08M945LqyJn1jwWAyqP1YSJJ9RbtWAmnCtsXb4x1IlDaw4
	 LWngcz1AwfsdsNnc8QbWccMiuR3qV+sMH5DHaGrUmXkxx1TmFld5OX0TkmnLD0dS4C
	 AaevQGJsM2bp4bejW/keV+Asjy8379X9swsWCoiWuPQu6x9u/lZ53KOYNCtfSqw9j0
	 zuogC2bjuvLTXjG1A2ORCWMV+HotsAa2/ZUJibCpOHvvbD562U7WdJ9ns7YrQkwAWJ
	 WEbw9Um5Jq+xw==
Date: Thu, 8 Jan 2026 15:26:21 +0000
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
Subject: Re: [PATCH v3 1/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in
 host handler
Message-ID: <aV_MnW8cg7IsWPuD@willie-the-truck>
References: <20251119-host-direct-messages-v3-0-c74d04944b26@google.com>
 <20251119-host-direct-messages-v3-1-c74d04944b26@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-host-direct-messages-v3-1-c74d04944b26@google.com>
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

On Wed, Nov 19, 2025 at 02:07:53AM +0000, Per Larsen via B4 Relay wrote:
> From: Sebastian Ene <sebastianene@google.com>
> 
> Allow direct messages to be forwarded from the host. The host should
> not be sending framework messages so they are filtered out.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 22 ++++++++++++++++++++++
>  include/linux/arm_ffa.h       |  3 +++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 58b7d0c477d7fce235fc70d089d175c7879861b5..a38a3ab497e5eac11777109684a33f02d88d09a1 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -862,6 +862,23 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
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
> +	/* filter out framework messages */
> +	if (FIELD_GET(FFA_MSG_FLAGS_MSG_TYPE, flags)) {

Wouldn't we be better off just checking that flags is 0? The rest of it
is SBZ or MBZ in the current spec.

> +		ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	arm_smccc_1_2_smc(args, res);
> +}
> +
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
>  	struct arm_smccc_1_2_regs res;
> @@ -920,6 +937,11 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_PARTITION_INFO_GET:
>  		do_ffa_part_get(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_MSG_SEND_DIRECT_REQ:
> +	case FFA_FN64_MSG_SEND_DIRECT_REQ:
> +

Weird whitespace addition ^^

> +		do_ffa_direct_msg(&res, host_ctxt, HOST_FFA_ID);

What's the point of passing HOST_FFA_ID here? Is that supposed to end up
in the Sender ID bits of W1?

Will


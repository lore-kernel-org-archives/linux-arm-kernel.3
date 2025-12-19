Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61758D7879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 20:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5FEnGY1NKX/wN6LU/aVpAgILvYaWYtgK6g5vpLHPRQ=; b=wPvpUjwu+lIYeSDMZWYBF47VWi
	QH3wbQyOGdaxQIrsugeIoF4l573DwtxxsQiRWRZQmZQWs0AToKq2u45MrCPEhAb117r26LxDMeX/w
	RjSLm16NFZM3FDC2A5f6kZpL9SotamMTUYigHsOr7La7g0HwRLR6oufpbHZLkcgaVURNYxRlBvbFr
	b0faGFudzz1ZnhAtDN0PdOKnPR+qZw9Bf1xnk2tdKyjQCwIPVS324ZdVXgR5WHgzhuy2R817ORMGm
	7xD9vZtY9A73etu1MXEGNmWxVWEBJL2UNRvg+YNQZwiRycYSpyMNPBpRIhVZAY0JjncRXEfC+j5b6
	lJ3sy41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgfQ-0000000Auu3-1cm7;
	Fri, 19 Dec 2025 20:01:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgfO-0000000Autu-16HR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 20:01:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1441E60008;
	Fri, 19 Dec 2025 20:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C417C4CEF1;
	Fri, 19 Dec 2025 20:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766174492;
	bh=8pUZmGCDJ1FRjMBboLacZFWGbm4ILMwIQXmKN3FO6Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0sXO6BT/vcNQGDrlB9yBfVJqM3igby0cJbL1l7VI6hqkx+rcosg37YWD5nBa4oXk
	 jL5voRf92E0kYiIhGXQkB01F/PuPRT2zQDHjK3pP6M2K77IDVHr5xgx6Wb8/a17QeS
	 YpO3PZTSpa0drljnYZdeZW/9kGCqacQxrr0WtKv0OFK2CB4C1dddB0lqZ1GIVed3nW
	 2r4LMfMJvdTEoy6+/azwDLAiv3VhYTMro/lg8Cs8Qtaa34pLaYGtSADdrp42wTmMbp
	 KC96hXht+fPuZju0WMp4q4QLqRlbSxkowxodLa3gF39b1I6DsTOFSuXZkNvFfEJn9N
	 OJYwXBH/I5URA==
Date: Fri, 19 Dec 2025 12:01:30 -0800
From: Oliver Upton <oupton@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
	dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
	fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
	jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	peternewman@google.com, punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com, reinette.chatre@intel.com,
	rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com, catalin.marinas@arm.com, will@kernel.org,
	corbet@lwn.net, maz@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 05/45] KVM: arm64: Preserve host MPAM configuration
 when changing traps
Message-ID: <aUWvGjGyU7DUW8MI@kernel.org>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-6-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219181147.3404071-6-ben.horgan@arm.com>
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

Hi Ben,

On Fri, Dec 19, 2025 at 06:11:07PM +0000, Ben Horgan wrote:
> When kvm enables or disables MPAM traps to EL2 it clears all other bits in
> MPAM2_EL2.  Notably, it clears the partition ids (PARTIDs) and performance
> monitoring groups (PMGs). Avoid changing these bits in anticipation of
> adding support for MPAM in the kernel. Otherwise, on a VHE system with the
> host running at EL2 where MPAM2_EL2 and MPAM1_EL1 access the same register,
> any attempt to use MPAM to monitor or partition resources for kernel space
> would be foiled by running a KVM guest. Additionally, MPAM2_EL2.EnMPAMSM is
> always set to 0 which causes MPAMSM_EL1 to always trap. Keep EnMPAMSM set
> to 1 when not in a guest so that the kernel can use MPAMSM_EL1.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index c5d5e5b86eaf..63195275a8b8 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -269,7 +269,8 @@ static inline void __deactivate_traps_hfgxtr(struct kvm_vcpu *vcpu)
>  
>  static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
>  {
> -	u64 r = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
> +	u64 clr = MPAM2_EL2_EnMPAMSM;
> +	u64 set = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
>  
>  	if (!system_supports_mpam())
>  		return;
> @@ -279,18 +280,21 @@ static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
>  		write_sysreg_s(MPAMHCR_EL2_TRAP_MPAMIDR_EL1, SYS_MPAMHCR_EL2);
>  	} else {
>  		/* From v1.1 TIDR can trap MPAMIDR, set it unconditionally */
> -		r |= MPAM2_EL2_TIDR;
> +		set |= MPAM2_EL2_TIDR;
>  	}
>  
> -	write_sysreg_s(r, SYS_MPAM2_EL2);
> +	sysreg_clear_set_s(SYS_MPAM2_EL2, clr, set);

I'd recommend documenting that writes to MPAM1_EL1 are followed by an
ISB. Otherwise it isn't obvious here where context synchronization is
happening (if at all).

Thanks,
Oliver


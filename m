Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC37E66884
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 20:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThbxJ9zZBS9pJSxKXMQE5KTk6l5uNgD03C4cZPQZs08=; b=FvmQYVQMSJl9MJozE1j7QdwDjG
	0aF61WMsFAaWhW6osGDZkcjimRgZ6O001FRIAyX7uMzg/r0KfHCmhZgd2OdvadnowQqHjvhpVocE5
	vUQbEPjK83yFuhLUhG0F9Yu04dabSP9awIjPLrPdCfyTJRAjf5DGxeeja5X0UG/Mdxi2IChQ8b2ca
	1mHsyCYxOBJcUyIHx6p021SWbIOjGLOooIxXns18ileTcehq/o+qMCWHrJopn5hxRyY6IWgL66tTl
	rnc1JRuw28uoG/Yj7280lC4WSWKBp8XvsZHY2NNHWYDxK+q4dUUq+K1Oi5mxOwWBUvolnMRoruzzP
	onzPOXeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgnz-0000000AvLN-1y2A;
	Fri, 19 Dec 2025 20:10:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgnx-0000000AvLE-3qjz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 20:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED6286001D;
	Fri, 19 Dec 2025 20:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44087C4CEF1;
	Fri, 19 Dec 2025 20:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766175024;
	bh=cuuf9jwjA23EzGC5CEmDMJAVh8R6FAC6fbYSEHdZ0YI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kS7I0nik4rKzjaRGYHq7ke+Ygk3K1YlBzsIDyra2D4j7O9Rk4NgKW0sByHuNafIiT
	 3GZhm1DNorrXaNdVXsPwqDOXSdWh5pY/2BBxvi2UEQlfk6uUX4Z25nU8gXQkcj2jk+
	 sXcvB9BoQcjuJexcPe0Zu27TEMNkD6MFQjplpEKeoWreKuOoYe4bMWvtKj7TYQDX9t
	 R9hfYUSlmNqDk8GhpcaGDqLE8RtcAiIvfVFH6NTtWzheNjgCFMwKV28qOGKvrt8z4t
	 Ecnbm34MSou6sd3PVHpLmejn/SZpIDeetPMvCFuJoyUb9eKBKA1GspXWoWyrhKTEy9
	 epA2mbfFk5S2w==
Date: Fri, 19 Dec 2025 12:10:22 -0800
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
Subject: Re: [PATCH v2 13/45] KVM: arm64: Force guest EL1 to use user-space's
 partid configuration
Message-ID: <aUWxLp2GUk2_p58e@kernel.org>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-14-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219181147.3404071-14-ben.horgan@arm.com>
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

On Fri, Dec 19, 2025 at 06:11:15PM +0000, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> While we trap the guest's attempts to read/write the MPAM control
> registers, the hardware continues to use them. Guest-EL0 uses KVM's
> user-space's configuration, as the value is left in the register, and
> guest-EL1 uses either the host kernel's configuration, or in the case of
> VHE, the UNKNOWN reset value of MPAM1_EL1.
> 
> We want to force the guest-EL1 to use KVM's user-space's MPAM
> configuration. On nVHE rely on MPAM0_EL1 and MPAM1_EL1 always being
> programmed the same and on VHE copy MPAM0_EL1 into the guest's
> MPAM1_EL1. There is no need to restore as this is out of context once TGE
> is set.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Drop the unneeded __mpam_guest_load() in nvhre and the MPAM1_EL1 save restore
> Defer EL2 handling until next patch
> ---
>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> index f28c6cf4fe1b..a2e8f6187675 100644
> --- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> +++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> @@ -183,6 +183,16 @@ void sysreg_restore_guest_state_vhe(struct kvm_cpu_context *ctxt)
>  }
>  NOKPROBE_SYMBOL(sysreg_restore_guest_state_vhe);
>  
> +/*
> + * The _EL0 value was written by the host's context switch and belongs to the
> + * VMM. Copy this into the guest's _EL1 register.
> + */
> +static inline void __mpam_guest_load(void)
> +{
> +	if (system_supports_mpam())
> +		write_sysreg_el1(read_sysreg_s(SYS_MPAM0_EL1), SYS_MPAM1);

nit: I'd prefer using a mask to extract the fields of interest, guarding
against future architecture doing something silly with the RES0 fields
of these registers.

Thanks,
Oliver


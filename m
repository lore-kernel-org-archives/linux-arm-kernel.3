Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD361D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RIKrOtSrZCjU+49GFgDk0B16AH7WqW4jA0Zs5uYsEw=; b=bPgFiqgOESi940G2P/AR032ccF
	IghXkVdXTLpf8Y4G+jfcRbb8KiYgEJ6HaVb5cabX6S5TQmHUKXcyq56VHdbOj7LcQ20MHo/D2eQMa
	JpMnBZLuYRkf009HGruAoGk+LBje6qF4ZTG9OqBeRhPkYlMvhieHUfq8uvMEZ+mnyTrIhQzeeAaEu
	R/vGiWmCqX0wTxtAUb8zX0osLIrnBJdGdS7Lku21zkCO1609lGLU8XDHjdrsr1hsPZRuSdzaK3inV
	LXpNSh9NhZHrBO47HT4G8UA523STXvABGWJL0EdxxfaqinS92gqec2QC3cjGLjLq0ZBy8Xs3FmCZD
	fjblc2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCQt-00000003xLI-2ytd;
	Tue, 20 Jan 2026 14:10:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCQr-00000003xL7-36yy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 14:10:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C51B360010;
	Tue, 20 Jan 2026 14:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F47C4AF0B;
	Tue, 20 Jan 2026 14:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768918208;
	bh=Ym1BChiDA/nfvHPs0Pfn4x26/vTjDWdcKmeSW/i2+E8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYpbZuFluE7Uc8y1vpgERaU6XAa5n/fvQ/K56ZbqGt3sRL5iQF21JCt+kALvLIugx
	 FyVaRlMeMTI8Ih94Sz5EFdsDwE93XxHrSRisOlawIKJneUtql5nqD3nwWJNSjc5Ora
	 Xve2KhQIT4X+PvjLymzzZt1SZNPCK0lbklFE68IYwcEpMnxW2NFoOh49AvA/MX2O5x
	 9RDv7nSvqunBctVvkVSrMIIQ05S/GTVsLs9CBwcp7Ey0ztr7MyIhazqm4yJ5xRdWsD
	 icxl3qapy2SikY3ermb7927dsvsNNK76kZU0Z69iDaslwUQD9wqvXvIXgM2plbEXOw
	 0OuVAOlpTAI1Q==
Date: Tue, 20 Jan 2026 14:10:02 +0000
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
Subject: Re: [PATCH v4 1/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in
 host handler
Message-ID: <aW-MugHHrJVQQKxc@willie-the-truck>
References: <20260109-host-direct-messages-v4-0-95da4221d186@google.com>
 <20260109-host-direct-messages-v4-1-95da4221d186@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-host-direct-messages-v4-1-95da4221d186@google.com>
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

On Fri, Jan 09, 2026 at 10:34:25PM +0000, Per Larsen via B4 Relay wrote:
> From: Sebastian Ene <sebastianene@google.com>
> 
> Allow direct messages to be forwarded from the host. The host should
> not be sending framework messages so they are filtered out.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 20 ++++++++++++++++++++
>  include/linux/arm_ffa.h       |  3 +++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index f731cc4c3f280a32acccca0de92b9ac6c8e05602..fc84595007f310004def7d525371fa7c128f244a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -862,6 +862,22 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  	hyp_spin_unlock(&host_buffers.lock);
>  }
>  
> +static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
> +			      struct kvm_cpu_context *ctxt)
> +{
> +	DECLARE_REG(u32, flags, ctxt, 2);
> +
> +	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
> +
> +	/* filter out framework messages and validate SBZ/MBZ bits */
> +	if (flags) {
> +		ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	arm_smccc_1_2_smc(args, res);

I thought we were going to validate that the sender is HOST_FFA_ID?

> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index 81e603839c4a51873090b7e22edbe7b33a7e94df..d209d0cdac1eb804be01e4607acac8f76cc99e40 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -130,6 +130,9 @@
>  #define FFA_FEAT_RXTX_MIN_SZ_16K	2
>  #define FFA_FEAT_RXTX_MIN_SZ_MASK	GENMASK(1, 0)
>  
> +/* FFA message flags */
> +#define FFA_MSG_FLAGS_MSG_TYPE		BIT(31)
> +

This hunk is no longer needed now that we're just checking for the flags
being zero.

Will


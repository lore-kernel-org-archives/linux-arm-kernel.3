Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9360CE8D5F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDVXFowoojM3Rvu4qMqxE1ZRVz5Nhbee1rBXcvikAE4=; b=v4jD4h3gsfnX6u6QjfjVNu5PlK
	Cch782A22bdoWdMrg3cRc5bAhPjZQyGA2fQ5IjcAKFm56WaM8AEm7DUcks7dAhYeYeo2eizJ14yD0
	Ab6g7HDED7o+RHmZVPqv1w4ab1XN1nCeGtXvPPMxVKjyu9/hzIQardZbLd7AlQKDlwUGtCdS6gL/U
	ZZj9a2fRnc2VlJ0QdRKo9olFhrX9RMFrkIOzEXfc6nlpVXAkk4rqndSlXJMW0jeeCpLhjm4cYd9uJ
	IHCtUu4I6I8NHwlK8n1Xfkn4Cg9sl6/qIkIJe6AW/7OcJu8EuNznFc50AgV4x0E3sSW5NMfQDmbH8
	efW2ctCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxnv-0000000Crhb-3cEl;
	Fri, 14 Nov 2025 17:41:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxnu-0000000CrhC-07w9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 17:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F6FD601AE;
	Fri, 14 Nov 2025 17:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66731C116D0;
	Fri, 14 Nov 2025 17:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763142105;
	bh=IQZR6GSdsfxkXbWwpBWciwNfmoY8y6liTJu6TwjjAWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hk6XIezoo/nMtNckSn17IIlP0olpWzyv6gHkAkkgDZS0z/4FfzAdOD1RDoY9DAlp9
	 Vx+z1XQvLC8KC3+MT6fU83Cw462fnoyo0KN6AoCKswor6OvN6ddCGRYKsfR9CfG8lI
	 DbvhEHbR3yR94FyfSTIzgSBzf8cHh5oaVWOW24JXCxIKWysEiorhDcnzDjR9nDJWqX
	 2sakkLLKUm7qNGP1g6x5CYDsf8KDjDYWY2yv7eimWa700/Nn5Q59JPBwRt5PDAT4t4
	 etMtcRTXG6ialwlupGxG9qOQOnWsBU3L1kFZCtimHG/mVKJtYzTHNdbEJFFh4bPcL8
	 eIfR2MHEOACTQ==
Date: Fri, 14 Nov 2025 17:41:39 +0000
From: Will Deacon <will@kernel.org>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Armelle Laine <armellel@google.com>,
	Sebastien Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in
 host handler
Message-ID: <aRdp02lPH0Ls5iqV@willie-the-truck>
References: <20251030-host-direct-messages-v2-0-9f27cef36730@google.com>
 <20251030-host-direct-messages-v2-1-9f27cef36730@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-host-direct-messages-v2-1-9f27cef36730@google.com>
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

On Thu, Oct 30, 2025 at 03:49:16PM +0000, Per Larsen via B4 Relay wrote:
> From: Sebastian Ene <sebastianene@google.com>
> 
> Allow direct messages to be forwarded from the host.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 4e16f9b96f637599873b16148c6e40cf1210aa3e..bb38ee7c86bad1646c16c562127eb3bef6297a84 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -857,6 +857,15 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  	hyp_spin_unlock(&host_buffers.lock);
>  }
>  
> +static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
> +			      struct kvm_cpu_context *ctxt,
> +			      u64 vm_handle)
> +{
> +	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
> +
> +	arm_smccc_1_2_smc(args, res);
> +}
> +
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
>  	struct arm_smccc_1_2_regs res;
> @@ -915,6 +924,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_PARTITION_INFO_GET:
>  		do_ffa_part_get(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_MSG_SEND_DIRECT_REQ:
> +	case FFA_FN64_MSG_SEND_DIRECT_REQ:
> +		do_ffa_direct_msg(&res, host_ctxt, HOST_FFA_ID);
> +		goto out_handled;

Should we filter out framework messages so that this is limited to partition
messages instead?

Will


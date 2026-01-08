Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26542D1D47C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwAEACWq+mTHd+2IZ1ZoRNWi89Mv5W5mh7MD5rujIhI=; b=p/qLa9OP7QkTxMoHzr6q7FXYU0
	0HrHUtfc8gDUs8KJhF/830kZxmKfDsfb3C79gFR+OKxzaxSweQIdqkNrcwVNrqWPy+eqYtLOiMmWs
	xoy7LLsm/2wADAPy4czMI3IGRWtYSh7qxmyxOyHml7blw5jh+rOGJvBd8q58L+2fhOQFFlQfcxnHv
	zXDttv+FpNMjPo7OfzDj/Fbo2syH2iZFXnazutFjAONy9ydAEVMys5baY6TWc6qJvdKZLU8R6+BNf
	abh+ei6WsnP9kj1ycs78uaBkiaiQxdle12t60W8IV/5+A09zC5L5iwcFnHFH6fKlFMNLZSC6i8P0v
	PzHUDtfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrxq-0000000HWxq-0kr9;
	Thu, 08 Jan 2026 15:30:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrxn-0000000HWxF-4765
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62C4040965;
	Thu,  8 Jan 2026 15:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3B1C116C6;
	Thu,  8 Jan 2026 15:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767886215;
	bh=XRv28BEV+7f5GPwMsVGezx6oU/g6sID3XcDLpPgJ/UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=As77JXYbZSzOEVql1xo0ouFGu82gdNCv1NSpZj3O1uguqcpf9Pa4JwwCPtqU3nwJb
	 ZTDmuRCPXnllm23tgj8k/0CvoUIKFfJTgMeq53oq2qWoU7act7OlbwCC9Ot62UZgPx
	 kg8u5v8Qdobkzpvn2P9nrW8OpocKMs9whMS1pj1EA/LG+2O0y1N5wxNgVxe/aZeHEW
	 3RVJ21thBq/mg3+2BrYSQWCoaXcKuqOhfarxT/+vFaRJ8uCSJK70pikvJjbQ4/tjyu
	 iOWd56c0iiorhmYvpYnGBztMBO10NJydQja5+FVHqnf4NSq1TCkkaRaOMOGj3hspLh
	 yWROmsviluqng==
Date: Thu, 8 Jan 2026 15:30:09 +0000
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
Subject: Re: [PATCH v3 2/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in
 host handler
Message-ID: <aV_Ngc2KKKZYLH1m@willie-the-truck>
References: <20251119-host-direct-messages-v3-0-c74d04944b26@google.com>
 <20251119-host-direct-messages-v3-2-c74d04944b26@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-host-direct-messages-v3-2-c74d04944b26@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_073016_059971_1B372A86 
X-CRM114-Status: GOOD (  21.89  )
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

On Wed, Nov 19, 2025 at 02:07:54AM +0000, Per Larsen via B4 Relay wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> FF-A 1.2 adds the DIRECT_REQ2 messaging interface which is similar to
> the existing FFA_MSG_SEND_DIRECT_{REQ,RESP} functions and can use the
> existing handler function. Add support for FFA_MSG_SEND_DIRECT_REQ2 in
> the host ffa handler.
> 
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index a38a3ab497e5eac11777109684a33f02d88d09a1..c794802bda589b315faf978086ad164a2aee510a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -683,8 +683,10 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_NOTIFICATION_SET:
>  	case FFA_NOTIFICATION_GET:
>  	case FFA_NOTIFICATION_INFO_GET:
> +		return false;
>  	/* Optional interfaces added in FF-A 1.2 */
>  	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
> +		return hyp_ffa_version >= FFA_VERSION_1_2;

You might as well just move this to the end and avoid having to add the
'return false' above.

>  	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
>  	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */
>  	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
> @@ -866,12 +868,16 @@ static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
>  			      struct kvm_cpu_context *ctxt,
>  			      u64 vm_handle)
>  {
> +	DECLARE_REG(u64, func_id, ctxt, 0);
>  	DECLARE_REG(u32, flags, ctxt, 2);
>  
>  	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
>  
> -	/* filter out framework messages */
> -	if (FIELD_GET(FFA_MSG_FLAGS_MSG_TYPE, flags)) {
> +	/*
> +	 * filter out framework messages.
> +	 * FFA_MSG_SEND_DIRECT_REQ2 is only for partition messages.
> +	 */
> +	if (func_id != FFA_MSG_SEND_DIRECT_REQ2 && FIELD_GET(FFA_MSG_FLAGS_MSG_TYPE, flags)) {
>  		ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
>  		return;
>  	}

It would probably be better to switch the polarity of this check so that
you look at flags if FFA_MSG_SEND_DIRECT_REQ or
FFA_FN64_MSG_SEND_DIRECT_REQ rather than if !REQ2.

and again, I'm not seeing what the 'vm_handle' argument is doing here.

Will


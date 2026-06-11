Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBCBCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caoKMgRrh781zMJjCERxNdYYkromYU4iEkGrg3oyQos=; b=N2CfRz3gtWtCUkDq/3G2yT8kfr
	J4TZPTgk4cZF2cpCtW7g7Mlvr0glxdC87+zpC3gh1KQJJr6O9xNT/hW0L+PyrgCd1UFbPPb4O9C75
	XQsVqCbGLNPWzBDe7pPE1Yti9jcR5gK+c4sg1CKfGvIktU3O5nJGOlwLNZkURRGka9QtASIdmCUCr
	HLeoeAe0BdJrp2uJA7HL3Azm+HiQeYcaMSOytftnfvhcSeEV++YUUv/DEq5h9SGt1EsYAv6QXqsuD
	Jo1dU8qShrMnoXQCber59iDU3JCoBbJWTKken5qXtVr1JbTFYUU6Ro/H4CmNl5a5QTkikc9kFbrUJ
	KRbNX10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbzH-000000099Rl-3fF1;
	Thu, 11 Jun 2026 09:46:12 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbzF-000000099R6-28kU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:46:10 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-68d22476e88so9966a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 02:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781171168; x=1781775968; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=caoKMgRrh781zMJjCERxNdYYkromYU4iEkGrg3oyQos=;
        b=ZJ/PR4cv9Lu2vC7yrGa75mNYKDcevGbtO3a0nFRxwwGjm8f2mxPjrrVGd9BpVxGGzl
         6KM6fqjH6qo6qeeCFgNj25jzFOHYHdm16xtdmEDup52YYjJB/oJQ6ashn601Uo+9gPaF
         b58W0UMuZgof8O3mPKweJR416tQv6KPGdcei8VO9rqUwNH8kcjSqFy48WanSWqkWFdgn
         GvoPEupLeR/neOlsUp4i0q1QQZ2XIlzfflGDrTcZdHQYk8h0Iv1LoPQyCwxRfWhMjS7B
         qWCQqKZwhKHB3tpJJWmGCdlnGbuUZFJxlwTx7KDUhZP5iInCPl0PVKHGyVLps3sqaDrr
         xmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781171168; x=1781775968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caoKMgRrh781zMJjCERxNdYYkromYU4iEkGrg3oyQos=;
        b=FwY/kHBdvMHFFyNnF+KN1Deqj+0dkaEuASOypv+0KRCQaecU7Uc4dcgO9u9Sp3aNfU
         y36DXSu3uSvoBgp0zA/2n3QksC2dlResnpHBzzAjZ8UEkLyOiudNAAaQbTzD++Ft7UeN
         ThsWgGhjZUB5XHUFUppsMDKA8imoosMckuef2rQiLsXmccPB5ED6Ez22kOi8YEqsrElb
         7qQJQQSxn7wcPbUmyUqpbz7/uibkap1GyO3wyrtYbQQu+hIdKE49kd9iFRe7w/SGL2YR
         IBVBZ1I9VzDcSRor+4zNn5z/O95dkRpAFE3vNCDO/fxAmbpmuuqoRt+QOU+H3dhuD3QG
         CVpg==
X-Forwarded-Encrypted: i=1; AFNElJ/ttDyucGExCor8YxlIK/flVbzZbFVAKRRTNCOvCIkb4PHsIdtekcVgwsyFa+nUHV+xMsZ9BfSHpksuNPwm8KGf@lists.infradead.org
X-Gm-Message-State: AOJu0YwuZKmMFmFESnCT48ZuR6YmiliuZ+PJBmX26Rb0Sx2/RMVz74bx
	JDm9H70wOM0SVFL2zSRgSbM1Px8DQp/5jXh2UfLvnAlK/8aLtaSoUftBdNbaHxFvow==
X-Gm-Gg: Acq92OEOA1GUWaX3o6SrG4f9X1HcCIBcrnK8VZZdI+Z1iKVSOGimkqoKE666+bLAHvL
	8TzTA8T2OaiyHoFtGVbNMLrPZ7gVcMeT520mtpF1FRT+APopSYrSrs+5SC6uRgr16MVRqby4r6Y
	FT6faNUyYzGUidmvOtJJ9VFmENtHib2TPkR2brGx9KaTOrfKLZNLOHTYdX6D3bFAFPyICmH917I
	61q+MhR03z0NJ3+9lfgzTP0H3kJXo9KEfv3b0QgD6Ql9Y9Lhz62Fm7pvB3/jPN4rXWui91e9ILI
	pP6jmOe2a903W0+F0QxjmeR5ln38ZIkF6tf9TsijIBGY2ym9zB8+ZEqHeXxBwj4urmt5eEIuwLx
	wxum+FghaEDYo8oSH96qcZMD7Vbbv9FZbW3O9whsCLWGPL+Bxe/yOF6/gUDhc5ULFP8HvWjiDje
	sg+DOn/gJppqwMpC31hQHNBMjVY+5615EQK5i3ovGeRJqbhncyLmKSE+Ap5JvE9lkEx2cwL4chi
	V3M9HPA
X-Received: by 2002:a05:6402:a545:20b0:68f:d41d:ca5d with SMTP id 4fb4d7f45d1cf-6930e145acdmr20838a12.11.1781171167189;
        Thu, 11 Jun 2026 02:46:07 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14edbsm40206466b.3.2026.06.11.02.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:46:06 -0700 (PDT)
Date: Thu, 11 Jun 2026 09:46:02 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 1/7] KVM: arm64: Support
 FFA_NOTIFICATION_BITMAP_CREATE in host handler
Message-ID: <aiqD2sy-PawXWXQU@google.com>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <20260608165549.1479409-2-sebastianene@google.com>
 <aiklq5QvztNk8FZR@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiklq5QvztNk8FZR@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_024609_564581_286508A7 
X-CRM114-Status: GOOD (  27.07  )
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

On Wed, Jun 10, 2026 at 09:51:55AM +0100, Vincent Donnefort wrote:
> Hi Seb,
> 
> On Mon, Jun 08, 2026 at 04:55:43PM +0000, Sebastian Ene wrote:
> > Allow FF-A notification bitmap creation messages to be forwarded to
> > Trustzone from the host and introduce a helper to check for SBZ
> > register fields.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 36 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 1af722771178..c20d45191085 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -71,6 +71,18 @@ static u32 hyp_ffa_version;
> >  static bool has_version_negotiated;
> >  static hyp_spinlock_t version_lock;
> >  
> > +static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
> > +{
> > +	int reg;
> > +
> > +	for (reg = first_reg; reg < 17; reg++) {
> 
> The upper limit should probably be something like ARRAY_SIZE(ctx->regs.regs) - first_reg?
> 

The upper limit is 17 since the smc64 uses x1-x17 as arguments and w0 as
a function identifier. ARRAY_SIZE(ctx->regs.regs) is 31 

> > +		if (cpu_reg(ctxt, reg))
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >  static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 ffa_errno)
> >  {
> >  	*res = (struct arm_smccc_1_2_regs) {
> > @@ -676,7 +688,6 @@ static bool ffa_call_supported(u64 func_id)
> >  	case FFA_MEM_DONATE:
> >  	case FFA_MEM_RETRIEVE_REQ:
> >         /* Optional notification interfaces added in FF-A 1.1 */
> > -	case FFA_NOTIFICATION_BITMAP_CREATE:
> >  	case FFA_NOTIFICATION_BITMAP_DESTROY:
> >  	case FFA_NOTIFICATION_BIND:
> >  	case FFA_NOTIFICATION_UNBIND:
> > @@ -862,6 +873,26 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
> >  	hyp_spin_unlock(&host_buffers.lock);
> >  }
> >  
> > +static void do_ffa_notif_bitmap_create(struct arm_smccc_1_2_regs *res,
> > +				       struct kvm_cpu_context *ctxt)
> > +{
> > +	DECLARE_REG(u32, vmid, ctxt, 1);
> > +	struct arm_smccc_1_2_regs *args;
> > +
> > +	if (ffa_check_unused_args_sbz(ctxt, 3)) {
> 
> Is that expected we start at 3 but only read 0 and 1?
>

That's what they are saying in the ffa doc (16.1
FFA_NOTIFICATION_BITMAP_CREATE). They use w2 to hold the number of
vcpus, that's why they start at 3.

> > +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +		return;
> > +	}
> > +
> > +	if (vmid != HOST_FFA_ID) {
> > +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +		return;
> > +	}
> > +
> > +	args = (void *)&ctxt->regs.regs[0];
> > +	arm_smccc_1_2_smc(args, res);
> 
> Should be hyp_smccc_1_2_smc()
> 

Yes, replaced it with this.

> > +}
> > +
> >  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  {
> >  	struct arm_smccc_1_2_regs res;
> > @@ -920,6 +951,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  	case FFA_PARTITION_INFO_GET:
> >  		do_ffa_part_get(&res, host_ctxt);
> >  		goto out_handled;
> > +	case FFA_NOTIFICATION_BITMAP_CREATE:
> > +		do_ffa_notif_bitmap_create(&res, host_ctxt);
> > +		goto out_handled;
> >  	}
> >  
> >  	if (ffa_call_supported(func_id))
> > -- 
> > 2.54.0.1064.gd145956f57-goog
> > 

Thanks,
Sebastian


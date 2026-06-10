Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA96CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c28G8tbnZUyXO5kH0COrZ2xlMJ2YX0+1C3t/9VCQTd8=; b=JCKLlYKHmjcPpUVZAwjNw53Vxf
	HA8j1ikW7wdpEwROEM/JKA4G7lRGXSiUMmLeHbMwxA00ONp3fhf/50fRL9sGxbDVG0rd/ZFgvEIAX
	Y9e9xVbIdrLuK60TBPEV/DZzeyRbxrCbf8AwXoeawnKnfKN1bO6YhqNpowOHbl8ULN9Y6tzmBLTBj
	uLECj/hF9U3bS1xgZ2y//sdhXcMv/ydMfeI1zdbYEpaZmc9MhZ5epBZHvdZ2Hm7yQxcfSNYPKTVm5
	fgFHkHN87tF18daIa3z3sPy8N9Uyb4uQ3vl1nrdT+eXeENO0wZeuIhps/Yl//ivP5BIh9tmRmDDBX
	HO6+i69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHb5-00000007br8-2ktL;
	Wed, 10 Jun 2026 11:59:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHb3-00000007bqn-2OCc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:59:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45fd464d51fso3659585f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 04:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781092788; x=1781697588; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c28G8tbnZUyXO5kH0COrZ2xlMJ2YX0+1C3t/9VCQTd8=;
        b=E3MVyRMm8Sy1OCCYmLfagkufQXr0PzJUBdoHcmI03A4elHZlYcsVsfd9w9dXws/d79
         Ce80Pb6Zb7LOwByrodjOVUD2HspyDhrm4GyL8tOySROQL/+YFrxKBmW6uy8zH9E/W9DO
         WL6TbBdcdPtVC02aBjNVvCzQ1LdqAMZ3LcqBwSXqqJ7ln6EE6DiIkkCbkx6opmvYc918
         1jDe6iL3xhhViALJDjYvm54lgN+SpFnRJ8neQ8l1NIf2y33KRy29DRSkEMhiDJvNI4cU
         6sYZU/3wCSau3o7gKulngU78hVudunpPvQPI0HdLm6KXCUQ/5mezFsZOdC2yVVjN+eG3
         byKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092788; x=1781697588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c28G8tbnZUyXO5kH0COrZ2xlMJ2YX0+1C3t/9VCQTd8=;
        b=ZxmrMacM8iUt5KvTLTNM+LKoY4UEPFNBO6q9ce1nIwrtopKxSHG3KfjgZ08m6+DOpL
         YxLpzFxcvBylu3URtAID4/LJjoXLArdvxhkf42Bm2chHPpnyehZixeXTxmVx5W5gnqEa
         DpSxPmV5NZPGd+NMdJIu1ckC3adXFDdTiwU7pE8DrJ/V9cH4QMT2f4HN6E4G+27e5igB
         lhWd/gVigcvHU34GHhGgkMUEbYLaqPVx6vm+Ef6KnNGFA4kqBH5Yw7VA3/udeOiZ4LCp
         pR+y0/HTgtTp5FFLMmv+w+dtIXZw3YwKR7mMzdCYYu8Fame8k5e0U9D1nxVXzVydaTKz
         spMg==
X-Forwarded-Encrypted: i=1; AFNElJ9MKidLwUSgf4gPy5RJDgSl2J7ZFTmgvuNittXlOBusCQBXO/z6EDFcifVa5KZPy00JYP6BTD75urU+xtq9NDT0@lists.infradead.org
X-Gm-Message-State: AOJu0YxApfzrqJKAsTdUbcLrMTBFbSVvbTMFcBGLDMlBVR4MImg3m79J
	Ve9+rdG00PiGVIMsfsVCfUYe8a5KXpsW0s3lAHJS6vP9iaO73orbrXwWCxqnIs20vQ==
X-Gm-Gg: Acq92OEkQWq/ydL4oy+GJiVFI5lFhUxja/w+My37nWsqpu33NkYWlIMoavI6IW9LPRr
	Xm1Y6iqqGro+TQVt9QIAYAO44UE80XUN+wBbkY12e94+F6hRAsVl8/84FpSMxNj35l1diVMF5vu
	9ftQUA07X5QBeO3oSeG2tCMUUQxsnjhYa2k3MzBcYFGY1re3EuCmkGOmT0YRdeBX98BoA1KLwLH
	QwS6kLR1I1UGXNXFWjcVY2dTe5R3zrqVcXX2B3mmLzR+pKqGN+hI7uAzbVBeZHJ/rJa8hizU70Z
	HlfxgKPLateCuiP5ztnaeFvmQ/TGbjc/b4Xz+Zm70DVCRH5OJiMclmAE6l/2awIH9rQ18/631B6
	cL8KRYnm7wha4/4YAPDCXGrtwSWwZY07+wIL7EF24G4QExWyeZC4MPjkvHQB2c3yIun5634rchO
	vPXk+1MBCBxJwowIbLORQ+yFGisOvcL9k4+E13WiPFK2hMRhvPo0JB/que+zj6jn4vvNoZ6xtpK
	1wVNw==
X-Received: by 2002:a05:600c:6091:b0:490:601f:d766 with SMTP id 5b1f17b1804b1-490c259a103mr424487945e9.1.1781092787304;
        Wed, 10 Jun 2026 04:59:47 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3446aesm78457172f8f.24.2026.06.10.04.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:59:46 -0700 (PDT)
Date: Wed, 10 Jun 2026 12:59:43 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 1/7] KVM: arm64: Support
 FFA_NOTIFICATION_BITMAP_CREATE in host handler
Message-ID: <ailRrxS5nbvNsbWB@google.com>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <20260608165549.1479409-2-sebastianene@google.com>
 <aiklq5QvztNk8FZR@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiklq5QvztNk8FZR@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_045949_674402_6A3938EC 
X-CRM114-Status: GOOD (  26.31  )
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

I wasn't really inspired this morning on the cruiser...

But nonetheless, that 17 should probably be a #define somewhere?
> 
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

Ha, we do not read 2 but nonetheless it is useful!

> 
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


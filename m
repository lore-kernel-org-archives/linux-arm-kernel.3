Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3FECD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/Oe3DW38b9AqfeR+BNHeTcKWnxDeKkYt2PnJ5PXJTI=; b=TBoJ29NPCYgDcgNqY8dMGy5ffo
	8Rs9baEoO5wR/m2fHYX0Bpb8sVR6GF4oQzPw84onv602WoRAAiLnqYkXCCmK7qVBSo+5mtG+22ZGw
	d+IDnIolexXVSVlWIjEXCzOIMWCSyhi1mkSIdoYPffCtZoG8s63MTk/Xk0wgt+8hM338eP2tKAwBn
	8PhJoHxVROP5j4pRbm8Cr+G6HLHaJHsQWVJRZytrv39zyijrd0rWVZyOp3Vu1k7ZcYc6DH9zKpKl0
	P4oauazEXnZE5pZV5DI+jK78Ry6/q1GR1ne3XOZyIQPYDoucZQ+wwCs9bBzspJg/T1x3xFSfqL+CP
	HoZYVcJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbk8-00000009812-1VRB;
	Thu, 11 Jun 2026 09:30:32 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbk5-00000009804-1Xvs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:30:30 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-68d22476e88so9737a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781170227; x=1781775027; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n/Oe3DW38b9AqfeR+BNHeTcKWnxDeKkYt2PnJ5PXJTI=;
        b=bn5NdEbOAWAkKHT+FoTeEJ3IS+NXAhjDB5seK+YQjsok064IC58TvCYklFmWs/R9Jt
         vYfDnSmwh9GvoSjoVbguSJ4oqxPBpX1Tv+XhcL64LDv5/qfplM1zbqBvQIs/FTKRmMlv
         oz0avX8N2Ng3YhqN3X3IloCLPSHMMRoR5LVtPnuJnBGixg8G7SeWEHc1f2ndPVID8/yU
         McwHX2dRs47+gaESTDCEWI1Gjkb2OgVpr0S3Sjf3JAL+tkVf0bWSsGIHHyxGgQBQpN4p
         9cstsGovGjCisCWxHhWgb7dLI+vYj3dKtatIFR5TEvKOPUnSep8CeoBg/5AG0/Rs//6K
         1HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170227; x=1781775027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/Oe3DW38b9AqfeR+BNHeTcKWnxDeKkYt2PnJ5PXJTI=;
        b=WHBu2UjdEv3IFRSE1Ckq8FB2S67YHkswMI2fQG3kUPM1cI9zY9mzNlHxFc7MGaieUj
         BL3mNH+RbtHVLZg6Ugzio4HjUyYoSyi6SyMmDnicmfm8lXpQp/2Qgra+H0J21+jnEOTE
         zsxfoS4MXk1WYsxst6ggKV4DqaTBnBeWyUcZtTf/0lI2gPaT2TTa0hlAmoFN/nsuh3H5
         GUycmXPO0rLEaGufIkwU8P5x25v5/zh9fnNAg0deAwRvidZiGeEYzaB1IU2Iq23iMqW5
         tTwW9W1Hyte2lu/ggvXvcs/oIy0USZ845460EyWI58P/qLtk42PZ/SohBnrN3TPc3haZ
         wnnw==
X-Forwarded-Encrypted: i=1; AFNElJ+4cXoHXpjOd7Sr3JiJk+VxkhKcy4tOov9OOfJzBicF0j0y4woEEGf3PHyJ7PYMhMAcCz8lp0pzzQ7QYMbNqztW@lists.infradead.org
X-Gm-Message-State: AOJu0Yze1ENnshVo5CXpOFTixXUVG5G0G/+DWU1/fPSemqKHIMWFPHM4
	ouRLRAnaKGewTNVFqwGRH1ohq3jb9A5Exj789cp8VUaI4yTtVUV39SOaQDK91EIzew==
X-Gm-Gg: Acq92OE2rBYZs4WpIiKLLbZpnmR9Kf9GVQVU3aHEfUAa6VHKHa8b7FH0S1hegUqIRJs
	j7yGVL+tt+VxMKpB6EU4ks7ZQxb9w2hlqY5/jEFJDY+xSemmOx/ZADT+AuhzoEaqTnw9LgcZouK
	qX450uO9EKMD+9n92J5ms562ZZnjg/cR4FivG3FrtURZPxznONsX6q4oZBvQK1bzGKAdMeAetS2
	vlOpogR2NZSG3jN6qRrFYxSKDUx/yPgLr1DY3SkrzLaUEpXDeG9LCbC/4jAbPJJIXUlq9ExuzIG
	xeNekXBWagF/yuNiidoNHC+rmqCttD9PFap+Arod7y8pVOGe4mCP8k0w0ZMz2cX66W9tke5+FRz
	oxp3TUC5LILDiwAcsCJnfNAPQO5A2qlrSLLYtDdOHspQBk3zfCUpzJWTBQFJuWLBwqLZAFE+nLE
	/Vl5k+mXJunGUxd53u3VrvR5RTHcOV9VCmgo5AzQO4eA0NLz2kIPtejYGfXi7kBEA7g48m+Mc7a
	FHAVsS8
X-Received: by 2002:aa7:ca54:0:b0:693:17e4:c6b0 with SMTP id 4fb4d7f45d1cf-69317e4c895mr18477a12.9.1781170227170;
        Thu, 11 Jun 2026 02:30:27 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64c2f34asm11046002a12.4.2026.06.11.02.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:30:25 -0700 (PDT)
Date: Thu, 11 Jun 2026 09:30:21 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 3/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host
 handler
Message-ID: <aiqALaxb_1r9lbZE@google.com>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <20260608165549.1479409-4-sebastianene@google.com>
 <aikobxnyWj_G2iPT@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aikobxnyWj_G2iPT@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_023029_443397_116EEC3C 
X-CRM114-Status: GOOD (  28.64  )
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

On Wed, Jun 10, 2026 at 10:03:43AM +0100, Vincent Donnefort wrote:
> On Mon, Jun 08, 2026 at 04:55:45PM +0000, Sebastian Ene wrote:
> > Verify the arguments of the FF-A notification bind call and forward the
> > message to Trustzone.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 32 +++++++++++++++++++++++++++++++-
> >  1 file changed, 31 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 91e89d889c44..eedb01955a45 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -42,6 +42,8 @@
> >   */
> >  #define HOST_FFA_ID	0
> >  
> > +#define FFA_NOTIF_SENDER_ENDP_MASK	GENMASK(31, 16)
> 
> Could we move the MASK definitions form arm_ffa to include/linux/arm_ffa.h?
> 

I wanted to keep it here since it is not used anywhere else other than
this file.

> > +
> >  /*
> >   * A buffer to hold the maximum descriptor size we can see from the host,
> >   * which is required when the SPMD returns a fragmented FFA_MEM_RETRIEVE_RESP
> > @@ -688,7 +690,6 @@ static bool ffa_call_supported(u64 func_id)
> >  	case FFA_MEM_DONATE:
> >  	case FFA_MEM_RETRIEVE_REQ:
> >         /* Optional notification interfaces added in FF-A 1.1 */
> > -	case FFA_NOTIFICATION_BIND:
> >  	case FFA_NOTIFICATION_UNBIND:
> >  	case FFA_NOTIFICATION_SET:
> >  	case FFA_NOTIFICATION_GET:
> > @@ -912,6 +913,32 @@ static void do_ffa_notif_bitmap_destroy(struct arm_smccc_1_2_regs *res,
> >  	arm_smccc_1_2_smc(args, res);
> >  }
> >  
> > +static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
> > +			      struct kvm_cpu_context *ctxt)
> > +{
> > +	DECLARE_REG(u32, endp_id, ctxt, 1);
> > +	DECLARE_REG(u32, flags, ctxt, 2);
> > +	struct arm_smccc_1_2_regs *args;
> > +
> > +	if (ffa_check_unused_args_sbz(ctxt, 5)) {
> > +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +		return;
> > +	}
> > +
> > +	if (FIELD_GET(FFA_NOTIF_SENDER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
> > +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +		return;
> > +	}
> > +
> > +	if (flags & GENMASK(31, 1)) {
> > +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +		return;
> > +	}
> 
> 	if (flags > 1) ?
> 

sure, I can replace it with this.

> > +
> > +	args = (void *)&ctxt->regs.regs[0];
> > +	arm_smccc_1_2_smc(args, res);
> 
> And of course just like all the other functions, it should use
> the hyp_ prefix.
> 

Added this.

> > +}
> > +
> >  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  {
> >  	struct arm_smccc_1_2_regs res;
> > @@ -976,6 +1003,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  	case FFA_NOTIFICATION_BITMAP_DESTROY:
> >  		do_ffa_notif_bitmap_destroy(&res, host_ctxt);
> >  		goto out_handled;
> > +	case FFA_NOTIFICATION_BIND:
> > +		do_ffa_notif_bind(&res, host_ctxt);
> > +		goto out_handled;
> >  	}
> >  
> >  	if (ffa_call_supported(func_id))
> > -- 
> > 2.54.0.1064.gd145956f57-goog
> > 


Thanks,
Sebastian


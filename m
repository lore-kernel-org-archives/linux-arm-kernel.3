Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF68CD98E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxF4JdKLz/47JU+Sn8F0zfHSo7R8CT604WZzC5dB9aI=; b=OBr207oDJ358cfWZPADp685gGc
	gbGfQ9gtwNLXXVXKE28l02MbN3YAB/BlZWg+6c8yi7Ve1hQiBlgWjWSTS84Sftfnf6pEj78cbpxg8
	zB6OQlnH1tGirDCHio7JKDuLC+a+J5dJpiXNxTZUjs/R499My7CL/y9vIGcoZrnHouDbrSwPfaV94
	Zl1AzIbCd7acJLhqGDQbEQldt2S3grXiwP96te+wmooFeA0GZ8NxA0i46LqSEn7HOlTMfnlQgklsm
	POuI3tjCXepSepxnXxlnPekcX1CgdyNwY0zts1zw3HOqPrB4iNMELjMZgyPuA+J1DwCFr5DzF13zs
	9lhKVWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUnv-0000000FvEt-44m9;
	Tue, 16 Jun 2026 14:30:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUnt-0000000FvET-1urq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 14:30:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490b23c828aso47415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781620212; x=1782225012; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sxF4JdKLz/47JU+Sn8F0zfHSo7R8CT604WZzC5dB9aI=;
        b=CzXr9SOauMltVCfcYCwLRnmtUp4v+nVzEOrm7Hxz7a6mTX1oDkXoQLjY5UXu2ujUyr
         +z+3uPQeUsT5tbfiGJd5nmbP3cx80R1xd3zwm2LK8cOGV5c/Mh2Sy2vvKwoV/2wNhc1r
         M4wxsj3aw09PgN23kaobFQSe/SucZ6yElpzLweYyl4A61ycQPRkocznsyZPGEMmBdDFI
         nmFUjSkLc9NoBPKvpu0MJBjLuJ5rpfiMfzPXGW+HiYL/ROCfprM8MTiiPERhxqMZM/Y1
         AiBCmLlGEduUCS1cCvx4bdR1Jf2pOz6P3FqnBdT+V8XxBM3bfu3nuo7fgVjTn7FEAfYt
         ofDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620212; x=1782225012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxF4JdKLz/47JU+Sn8F0zfHSo7R8CT604WZzC5dB9aI=;
        b=FjHjZx3iCAXqSZDy1HCoaI9kQxF/4O5E+/DRbcLFcHkwIAxr//yEYFDHW+yPPSH+D+
         lv1U5jZTETGAD0stOafrTOP1FmpboKas8/+8ZfaIrJP+Tfq52LFIns6mw+pKfCRDOl1X
         4YS9z38Wbj3sF23+c5HVJ4BZ+GOkC00HhORSt4iqtPI8kzz5NHdWXDQfZH+rVG6F6ZsL
         VzHkf1i1IOFX3x+eX+5LxSbK746cEm/2VRbnjkgocqmj16C+GVu9epr4/tnHZuwvCg8/
         iUp2xKrcEGWWOfgSRQJ5fHi47LiM1Sv3Rn+4Tq2BwVSrJvNmGZRRgjwTdSu44hlP3m5m
         73dw==
X-Forwarded-Encrypted: i=1; AFNElJ9mGofYxGbj3/29XgpVA4CSTQTAMgaegkJ8oAAGL2uuwshyKwZNUmTL+AvmQenvZ7AVftTvAWBZHwbhWnEZLloA@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj7lmoXfmhxcDDQ7h59cxUzmBugLmTw1+PbT2KO59Fw3a4hFn3
	tYwNXseoSnDVOX/jsA5bs7G51TuGbFbPRRw5ej1xYQQfwaVjgmnFjChbVUAtvrzd1w==
X-Gm-Gg: Acq92OGVfyCSlhl+VUJo9Xb+x9McmfssXnz0OXH0gY1GKuNYVQZQbd2kc4WG+q14r0z
	kpmDw039L1N29+rEhL70nb7MQMAhnWEmQKmZpi8PkTXFt7shFKA4uTEtLMheWWyKnLOllvPV2Dt
	ov7BSpID3M13awK+G3sep8CwWMU4C2zgqgcxMKUIoZP6kSV6pXlqUTU0013FvxT6Y7BTI7n4UA6
	71ZU+CqHvtAaFtAbCltCn7wlaxY9GBexh+byLSoVCPAQZR6R8xh8C3MlqRxeEH+ERkMIjFcyapu
	p/gcm9hqE7EhMRce3JZiEbSDUtE9pCDECltpNS4QLl5trzVCQUG5Fi5Qc1p49H8lqZX1dNfrtYt
	7+iMJWKEbEMcLy7Gh3Cxdb818bHtTrpe0mf8cyqAHL5R6uEODy5bQt5Hj5Yu2Pr4FW9sfBE4A3O
	IZqceHW+WrhtaOEhsJYCXUg9VMNRqjAwkhq4aRTXLWshRuGh7JiJlAFsqG+U1smFXlaS5QVg==
X-Received: by 2002:a05:600c:6dce:b0:490:ae08:1150 with SMTP id 5b1f17b1804b1-4922ffad1c8mr1143425e9.4.1781620210848;
        Tue, 16 Jun 2026 07:30:10 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2d933esm44203626f8f.33.2026.06.16.07.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 07:30:10 -0700 (PDT)
Date: Tue, 16 Jun 2026 14:30:06 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v3 3/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host
 handler
Message-ID: <ajFd7jPk9mqw2NX5@google.com>
References: <20260616105417.2578670-1-sebastianene@google.com>
 <20260616105417.2578670-6-sebastianene@google.com>
 <ajFKRFj8vp_KqrNc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajFKRFj8vp_KqrNc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_073013_514488_F5613818 
X-CRM114-Status: GOOD (  28.87  )
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

On Tue, Jun 16, 2026 at 02:06:12PM +0100, Vincent Donnefort wrote:
> On Tue, Jun 16, 2026 at 10:54:12AM +0000, Sebastian Ene wrote:
> > Verify the arguments of the FF-A notification bind call and forward the
> > message to Trustzone.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 32 +++++++++++++++++++++++++++++++-
> >  1 file changed, 31 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index dc7496ec295f..3d8ed829f558 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -42,6 +42,8 @@
> >   */
> >  #define HOST_FFA_ID	0
> >  
> > +#define FFA_NOTIF_SENDER_ENDP_MASK	GENMASK(31, 16)
> > +
> >  /*
> >   * A buffer to hold the maximum descriptor size we can see from the host,
> >   * which is required when the SPMD returns a fragmented FFA_MEM_RETRIEVE_RESP
> > @@ -713,7 +715,6 @@ static bool ffa_call_supported(u64 func_id)
> >  	case FFA_MEM_DONATE:
> >  	case FFA_MEM_RETRIEVE_REQ:
> >         /* Optional notification interfaces added in FF-A 1.1 */
> > -	case FFA_NOTIFICATION_BIND:
> >  	case FFA_NOTIFICATION_UNBIND:
> >  	case FFA_NOTIFICATION_SET:
> >  	case FFA_NOTIFICATION_GET:
> > @@ -929,6 +930,32 @@ static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
> >  	hyp_smccc_1_2_smc(args, res);
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
> 
> "A Receiver uses the FFA_NOTIFICATION_BIND interface to bind one or more
> notifications to the Sender"
> 
> Does that mean that if the host issues a FFA_NOTIFICATION_BIND it is the
> "Receiver" and not the "Sender"? 
> 
> (Same for unbind)
> 

This means that we will have to check the ID of the receiver and not the
sender. Thanks for pointing out, I will add this to unbind as well.

> 
> > +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +		return;
> > +	}
> > +
> > +	if (flags > 1) {
> > +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +		return;
> > +	}
> > +
> > +	args = (void *)&ctxt->regs.regs[0];
> > +	hyp_smccc_1_2_smc(args, res);
> > +}
> > +
> >  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  {
> >  	struct arm_smccc_1_2_regs res;
> > @@ -991,6 +1018,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  	case FFA_NOTIFICATION_BITMAP_DESTROY:
> >  		do_ffa_notif_bitmap(&res, host_ctxt);
> >  		goto out_handled;
> > +	case FFA_NOTIFICATION_BIND:
> > +		do_ffa_notif_bind(&res, host_ctxt);
> > +		goto out_handled;
> >  	}
> >  
> >  	if (ffa_call_supported(func_id))
> > -- 
> > 2.54.0.1136.gdb2ca164c4-goog
> > 

Sebastian


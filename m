Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E28CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 14:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1A9QCNLx15SB0an96dcEu6XnxzvG/ZR/jjxiLCYEWo=; b=xlBOS2b1qF2CcMiBLmJT1ekllm
	xINbUqiV1w1zbgugMzhCMSB1l82QZsW2sOWrV6aAgxIc+t+g8IwfguM9/97gn/6kjna1FTljxjDKa
	JVT4DioKGg9XQ/fYyFDUxO9dXS/GGKNQkEaWcuzI9kZmxHPJIvhkrWt+nIER8EggTwSLZnYPBOBUR
	XAi1eHK15WI+V6QX2i3cNJG0uxlsWg/8fMtvDyPCTYEwVSUs2bEhkKJiSTDdAYJUU7V50R1xnMg3b
	hd7uXzJTPPCfYYO0kOvtyN39tqmqXvJjpm6t6GLe8jlQOHd7hRYFd/c7sYnpF+nBrJ6S9iBOGRTYT
	bo8gdWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUqw-0000000FvVL-0Hc3;
	Tue, 16 Jun 2026 14:33:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUqt-0000000FvUm-2SRQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 14:33:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490bd64ca95so57175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 07:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781620398; x=1782225198; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G1A9QCNLx15SB0an96dcEu6XnxzvG/ZR/jjxiLCYEWo=;
        b=qh9uxCZ0kNiVQLFq97B45TuKTfi/llMjgIa67Gamthmc/rAcfHl1zJAUmHPqTHvb8Q
         sb/bevjg2dvpBfnuTeOD9SAhCge89QFAVni7d8xFxlRpIddCXKO1rddCsOvX9NOUMiqJ
         TN4WfVb0fJIX2THH3Gm9Tge6q06hBC94Zc/zB9NkD0vHJGVQxfDkq2GdJUAiBBjtXzxo
         7eFY8HKMMxjApJ8kBWzMDmEYc53VSPEt8c9KR8o3hW9ipr4YAlG9glAYrmFyoRWjljsa
         4OsFNxgJ5g19j5up0c8M7VipJZNyDvaO8gDBiQ6gfkqGAlPf90bbbz9xIJjweIYdU+MK
         1OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620398; x=1782225198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1A9QCNLx15SB0an96dcEu6XnxzvG/ZR/jjxiLCYEWo=;
        b=LhbKX1fxkz7APShfmD6FvfDrVTJGjzfd0xaGMTv9FGVXP3MG1XqAum/Clj9E6hc9Ze
         A6skZ25EjuaDEtCdZZL+aTcSTTpLIGRUCR+K47Kkap1KNtnA4GocerKT02IboeHzHKba
         y64/KRIvbgN4GBbr364lZwpl4oSxnfPWkvKdgnAHAmDKNz/bnRJp96yoiZOg2LdGb7k+
         JUZ6m2fOPEYK0THLQd2Cb8E277+RIgDkzNtf3NZFiGcJbkCb5tleljaveT5Hiv8Zk65z
         sLZSoVLJ51WNslWwrxi7abpm+VPcRVhVmdbRruxXB0yqWUsjo/LkkzFVu644ME7WH3LT
         gQrw==
X-Forwarded-Encrypted: i=1; AFNElJ+gL+nZ4NW3hlNDHSyCaD+OriGbcyf8UlTiCgQGzWt9GltP6kL4e5ezgdYuZtsckr0BE5I3ih+xg+clVx6em0Mn@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh3y8sYEw8K1hAzZ5q2jM2c2fNG28qEtCnhIM3jHY7iyBaSxnE
	OvxjSQe8HufvHOrxvF6k6bi4mUKDB1Vd7pcVU8BUQMGMgGuhhCBzYd/CHRegM6RM3g==
X-Gm-Gg: Acq92OELb7NGx3b5gRhIUUqsk1nrSdqqkzUl6UwdxwJFxDjGPuRzH+EL8vsdBg9gmeA
	4dNeHxFd6jmLhS1F/EZpgU27eNIb0rhq3XJUmWIgGY1e0gtMAY6D9DSrP6l8KL77SmAQK0UDaO1
	bFdp6N+hWt3R8plAIstDgIJu3zu8mHdgkCCa914BwtJ4COaptItZ7e6/VGYwFSvutt+kcTC2MIH
	ZIdro5aZNtuLyLsjlMkF1DrP6FEi4fWVL1dJMCoyPQhQp+wnQMxTo2OZYGhAQ7A2bXHj1YkNuXw
	L8cCF4WGOxxE+TI+rORfQ3czYjMqoQwaPVuu6nEXJZ0AnGVEnt6UiEyTIC4Xz0/dLYDlgzYw0rj
	++66XW5WtB3be4nqm1ZBi/jWDjBydFxhm7cBQIV5qG+KBKlxhM93l9xwnh6j6nnoNYsnhaTfhEM
	fZnrt7p0hwJQQrf63zTiGl5obcYE/KnuSOG/FsSnW/Rq/z/OyhIkHRD8s=
X-Received: by 2002:a05:600c:1c1d:b0:490:c2b6:de6a with SMTP id 5b1f17b1804b1-492308958dbmr1481635e9.11.1781620397230;
        Tue, 16 Jun 2026 07:33:17 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm64331015e9.3.2026.06.16.07.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 07:33:16 -0700 (PDT)
Date: Tue, 16 Jun 2026 14:33:12 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v3 2/7] KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls
 to Trustzone
Message-ID: <ajFeqC03MnWPSv0A@google.com>
References: <20260616105417.2578670-1-sebastianene@google.com>
 <20260616105417.2578670-4-sebastianene@google.com>
 <ajFEu3rjmWxVKgyW@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajFEu3rjmWxVKgyW@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_073319_987048_A793AF98 
X-CRM114-Status: GOOD (  23.09  )
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

On Tue, Jun 16, 2026 at 01:42:35PM +0100, Vincent Donnefort wrote:
> On Tue, Jun 16, 2026 at 10:54:10AM +0000, Sebastian Ene wrote:
> > Allow FF-A notification bitmap messages to be forwarded to
> > Trustzone from the host kernel driver enforce checking for
> > SBZ fields.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 28 ++++++++++++++++++++++++++--
> >  1 file changed, 26 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index c723a21006aa..dc7496ec295f 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -713,8 +713,6 @@ static bool ffa_call_supported(u64 func_id)
> >  	case FFA_MEM_DONATE:
> >  	case FFA_MEM_RETRIEVE_REQ:
> >         /* Optional notification interfaces added in FF-A 1.1 */
> > -	case FFA_NOTIFICATION_BITMAP_CREATE:
> > -	case FFA_NOTIFICATION_BITMAP_DESTROY:
> >  	case FFA_NOTIFICATION_BIND:
> >  	case FFA_NOTIFICATION_UNBIND:
> >  	case FFA_NOTIFICATION_SET:
> > @@ -909,6 +907,28 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
> >  	hyp_spin_unlock(&host_buffers.lock);
> >  }
> >  
> > +static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
> > +				struct kvm_cpu_context *ctxt)
> > +{
> > +	DECLARE_REG(u32, func_id, ctxt, 0);
> > +	DECLARE_REG(u32, vmid, ctxt, 1);
> > +	struct arm_smccc_1_2_regs *args;
> > +	u32 idx_unused_args = func_id == FFA_NOTIFICATION_BITMAP_CREATE ? 3 : 2;
> 
> nit: should probably better expressed as a int as this is the type in the
> ffa_check_unused_args_sbz proto.
> 
> Perhaps you can even fold that directly into the ffa_check_unused_args_sbz()
> call?
> 

Yes, let me try this.

> > +
> > +	if (ffa_check_unused_args_sbz(ctxt, idx_unused_args)) {
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
> > +	hyp_smccc_1_2_smc(args, res);
> > +}
> > +
> >  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  {
> >  	struct arm_smccc_1_2_regs res;
> > @@ -967,6 +987,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  	case FFA_PARTITION_INFO_GET:
> >  		do_ffa_part_get(&res, host_ctxt);
> >  		goto out_handled;
> > +	case FFA_NOTIFICATION_BITMAP_CREATE:
> > +	case FFA_NOTIFICATION_BITMAP_DESTROY:
> > +		do_ffa_notif_bitmap(&res, host_ctxt);
> > +		goto out_handled;
> >  	}
> >  
> >  	if (ffa_call_supported(func_id))
> > -- 
> > 2.54.0.1136.gdb2ca164c4-goog
> > 

Thanks,
Sebastian


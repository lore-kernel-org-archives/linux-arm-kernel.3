Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC1F54AC7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptGMB7I5UZgWyMFfPZCZTiz7S0WJEUd1UA28PK4qTlU=; b=j5RXy6wyr3UETLmk7qpGENNNkA
	kMYEWMZZiPxbpxgjqJ7QUksy9G/+/74KB2eTmOxCgG01h3hkK967SZVCfdlg554XI0cqLm1uY+iBC
	3VY/j5jNuK5w5/LWFnFFGI8+xITrTfF5m8gZYOXqUsfIYaP7jaHXvvl4UhxiteE9FwpyejvWpcR8B
	EZTCN0iHyVynYYePpCfwRrphMnyw4Uke0BkVhPSc78EkriO3a2yuUdkaH/OVArXLgU2BRPuk8lF62
	Qo7PsYTriL0+vtm3ZUOXOkhrn2p93oftMIHTAvQrFRrVIZStAbz2KB8V7Tm2vbR8CHYoI7XV4A+7U
	b5vnSmgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53KB-00000001iaE-255n;
	Tue, 24 Mar 2026 15:05:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53K8-00000001iZM-2HFy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 15:05:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-486fb990b9eso78735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 08:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774364739; x=1774969539; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ptGMB7I5UZgWyMFfPZCZTiz7S0WJEUd1UA28PK4qTlU=;
        b=OWAWpbXlFpBiwqp7V6/eEtqyUoZqCTATS7Q3+ljrNMbB96pK3Tly3B+JHPDAsoZ3sQ
         g7TrG0HAEevulvTGunnZPD6DtvoQ5dtkGtbRgeYoATp2YFQrf1igejboNtfqIS+fn9HE
         SMunO0EVdrlYHFgL/IRHMnpdSIgZ4cegx/3/DCf7NmiBcCE+ZN6Qz5U43u+sf06pc8Te
         ZKMlH/yN8i3yMQj3KpqurZfLm9rqNtNXul7WFosYTeUx5nTAQhddspxk7/mIxbvXvGJ5
         m0+wv0jWq6NY+zSrZLBpwljmZAbfNKksf+hwGFm9oNJRdNqGr5f8qjSgDP0QwO6ZN/x7
         U0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364739; x=1774969539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptGMB7I5UZgWyMFfPZCZTiz7S0WJEUd1UA28PK4qTlU=;
        b=fbPzm/LfD8naG9CSKSVW3PS84JrT9gsMDDszB9FgcKuVQdvNxntqcJJHcTinwT1wjM
         9Bq0HTRxYo8Y0FCDg3mmlMURENF3DgjDGmAqzuDSDnvQqNQS+IqJ81ecJIWFBgKy2yf5
         pfUkVboCEIH85hjrBpEOyImk7rqM9XqmFMxq5teeBHPuyJ1E/ZlqmCu2ilmPojPCfzkU
         tPP9COZk9ilSf28z+1YxqTbfRKjCx9SjiLiZe06Z0Hf7wsuVNO23kIDnAQ99aM1pXbSo
         /03v4uDCdWCMQszIRLL+xwwJTht2+uOGcjDuDg87Oce+RM6YQQoqr1tQZE7EFuAxxBqc
         zN6w==
X-Forwarded-Encrypted: i=1; AJvYcCU4rRwglojTC3MWmXabjdD6cdHjIVDaGWTmn/b/5/1LNChFiYzSO6/einkqM29MrGIboq6igAKndv12Xf0BYxI9@lists.infradead.org
X-Gm-Message-State: AOJu0YxV2oiICuLxZoj7NUSuwrB8Wmk4xcS8SbOAy8bHq242Yu+XyPo8
	r6kIbji6to8YsBTbg5y7TjTQ6bwDsJ//OXEqhOsXgYBMjOhlbiVVy7ozqY8CQS9iOg==
X-Gm-Gg: ATEYQzyLalQChNChxCjp3l4E9M2YvbGAy3Gupm6YJWuxqXZ0YVkvXqCqFq86fd/KYVk
	HHN5zN9Sj8dN9c/J9LJH8hWCz9pDE/I9seMebutolaPtBrf0yB8DU7FUxWH5PdY8PfaLc/J1hpJ
	TpJFuu/qc2G8euEKaBps5cMkusWYYsdEz1OaT+hst8/EFCSai8vPss6TfMTGWL5FuV+/ozMGxYO
	BQRWZuAuTwOXFAbGY1vVhH6deavHZHsNv+uHJU3Vf7BfXTCX8xggYaRcVJibtFBOa9SWuQDTDcH
	5uWroazLm6wgfK6E8oe1hg75LTRNo2VvF1jhFBEH+Fp5mu8dINyEEaW4nBvrQDUCMdE/tOY/vhV
	1p+/yvI44VRFbWzuqyVPciXH5HBWnqgNGz5OXzO2XQXVII5gEsIv6inSm2A33totQxuYsE47cQm
	QwzeQ88LXe07QbjDH7onTxUMBQxPQ3XgfgOkBW529p/fD9vH8575JQunpo6PrRS5qACqQ=
X-Received: by 2002:a05:600c:c16e:b0:485:5981:141b with SMTP id 5b1f17b1804b1-4870f598118mr927705e9.12.1774364738382;
        Tue, 24 Mar 2026 08:05:38 -0700 (PDT)
Received: from google.com (209.13.205.35.bc.googleusercontent.com. [35.205.13.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0b0csm36743525f8f.15.2026.03.24.08.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:05:37 -0700 (PDT)
Date: Tue, 24 Mar 2026 15:05:34 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com,
	maz@kernel.org, oupton@kernel.org, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: Inject UNDEF when host is executing an smc
 with imm16 != 0
Message-ID: <acKoPpoicnQ7ZMBt@google.com>
References: <20260324135728.3532400-1-sebastianene@google.com>
 <acKacAd6aV32624m@google.com>
 <acKbLtb288sABYA4@google.com>
 <acKdHK1FbHM_-zdl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acKdHK1FbHM_-zdl@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_080540_594268_20AC7166 
X-CRM114-Status: GOOD (  27.26  )
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

On Tue, Mar 24, 2026 at 02:18:04PM +0000, Vincent Donnefort wrote:
> On Tue, Mar 24, 2026 at 02:09:50PM +0000, Vincent Donnefort wrote:
> > On Tue, Mar 24, 2026 at 02:06:40PM +0000, Vincent Donnefort wrote:
> > > On Tue, Mar 24, 2026 at 01:57:28PM +0000, Sebastian Ene wrote:
> > > > The ARM Service Calling Convention (SMCCC) specifies that the function
> > > > identifier and parameters should be passed in registers, leaving the
> > > > 16-bit immediate field of the SMC instruction un-handled.
> > > > Currently, our pKVM handler ignores the immediate value, which could lead
> > > > to non-compliant software relying on implementation-defined behavior.
> > > > Enforce the host kernel running under pKVM to use an immediate value
> > > > of 0 by decoding the ISS from the ESR_EL2 and inject an undefined
> > > > instruction exception back to the caller.
> > > > 
> > > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > > ---
> > > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 7 ++++++-
> > > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > > index e7790097db93..ff6a90a4a4c7 100644
> > > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > > @@ -756,13 +756,18 @@ static bool handle_host_mte(u64 esr)
> > > >  void handle_trap(struct kvm_cpu_context *host_ctxt)
> > > >  {
> > > >  	u64 esr = read_sysreg_el2(SYS_ESR);
> > > > +	u16 imm16;
> > > >  
> > > >  	switch (ESR_ELx_EC(esr)) {
> > > >  	case ESR_ELx_EC_HVC64:
> > > >  		handle_host_hcall(host_ctxt);
> > > >  		break;
> > > >  	case ESR_ELx_EC_SMC64:
> > > > -		handle_host_smc(host_ctxt);
> > > > +		imm16 = esr & U16_MAX;
> > > > +		if (!imm16)
> > > 
> > > if (ESR_ELx_xVC_IMM_MASK(esr)) ?
> > > 
> > > Also, I can't find void inject_undef64(void); I think you need a vcpu for that?
> > 
> > Ah my bad, handle_host_mte() introduced it!
> > 
> > > 
> > > > +			handle_host_smc(host_ctxt);
> > > > +		else
> > > > +			inject_undef64();
> 
> Could it be better to return SMCCC_RET_NOT_SUPPORTED?

Right, I will do that since it seems this is the correct approach.

> 
> > > >  		break;
> > > >  	case ESR_ELx_EC_IABT_LOW:
> > > >  	case ESR_ELx_EC_DABT_LOW:
> > > > -- 
> > > > 2.53.0.983.g0bb29b3bc5-goog
> > > > 

Thanks,
Sebastian



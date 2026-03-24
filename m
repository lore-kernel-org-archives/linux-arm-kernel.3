Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF55F54AC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZ4LSksyFg1Xo3cRrPoFB7zz76+M0JIYSoezHnjgfsE=; b=k964RuxhDiMMsVBP2o0+QAddtm
	Whj9DvaEOmmeBesTC3zxwsGyXytMkygukHPXbHt57hiqm7tMr+Z/k79ekQaDqACXCsUwcFYHXtGmU
	DYrNf2fB48jPJj141W7etUUue2xtuId99Hulo6gdwk2vrbtN0uFjPrpGYswbWd66ULWYyYaTmMOGu
	+fNce8nFnWCE0gR7XUAUGaGCEN77dswayAcYJDPqQ23zvv+wQooiowKwLOgeu0RIhVMrMIS8DLsXr
	Cg0XtwiPOOmY1X6IyYpmLvhk+faQE9ojvTIPlj3oIwS//7kfABMMMknqhVmdWYaP06AvRgeYwJdJ2
	75U4KBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52SF-00000001c0V-0YFu;
	Tue, 24 Mar 2026 14:09:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52SC-00000001c05-45Nk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:09:58 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-482f454be5bso59449485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774361395; x=1774966195; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tZ4LSksyFg1Xo3cRrPoFB7zz76+M0JIYSoezHnjgfsE=;
        b=GwuahNUJxD0uxKq32nwh3Bp4fiqiCpazWYyt3wzq031ARVlJ9UXZ2B7DvVjyGzlXNm
         ubmilmVvHPR/0crwRvVJSHtPKx+oRwUz5nRxhHlpMrHfVogIb4teZGHFTGjTMVOqlbJa
         IwM/XjNqhCUtWqk43nQ0HI2aEz26mTj4d4esP/YkzUN3MZ/2AhCrXWmCE/1JhCpWOPGy
         MHXYACU/v7XfQLgQUBURc/m9q6CHjcu85ffNzQVtvj1c5uBAF+098UYhAmAtoHZ+Tph/
         IS1YDpCHJfiMstZ45D6rp25io6bBkOexF5bFtqZt6eOyu44nq3vPHwssvhy/SmU2cIKQ
         RxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774361395; x=1774966195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZ4LSksyFg1Xo3cRrPoFB7zz76+M0JIYSoezHnjgfsE=;
        b=LQ7R0IWJAF7bk6oQG1NZx38PHTXPcU1QKA3BMZN6ttFtujuXqEIA1+BnFKy8AZqulH
         qItjsoiT8hQTLMINor9QNCQRTFuOqMf3Q+cF/rXBzml7RIaovvb8JXUXe30cLiVbHXFd
         JPxwF3YaK9nT6fJCPl64aCGkPT40MDOAcrmAlAv2eBJIBzFTPJ2YJ9h4Dzh6A6UKBLaw
         M7JLsQ2zqQiSnFTMB4pe/KIwzO5xlN5rVOTnUxBCofGYLz2mLTHhBa6T0IKMiUaCTWTQ
         Hy+X0IL1/pg7gX7PPCWAqpv5osciEIbwpO0olV7OuQv68e5Ab2JIMknbXNPdtQrpMYU3
         4cFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEQR2JnX1sUxHXn4W7gLEzrvsGei1i9woXXpO3ry4xxxtrsMbnZuKifIsWVfKJToTSRC+dox6lBsUIb3Wgo/ll@lists.infradead.org
X-Gm-Message-State: AOJu0YyKsw//ssKcdhz5Lx/bcVw+y11G1FhAbMsKQVgSlwOuEGI3HReO
	HGARqMecMtTHDx2W1xw8dEA5ajEQH31HCzoi3XMlz3k3hLIh4MJUXTuthU5EYls4HZ/Ll9cMc46
	edxCnLw==
X-Gm-Gg: ATEYQzzCFgT3hfMDiVE5R/Eq8WY8S9WYW+YAUd/3a0J+3gJliJKP0ov0ulEMxNkTzYA
	piwbeXDdww58rsWNdMS3A1LnWtxgr1ZhJPIu9bL8ah+sU8Ktse2QgIIF+0WlwFxvZYYnF01l9qr
	4r2cGfCm6YJiE1TTO5H2jyHafu+sn6soJJfzn5l0tIZPWZ1hRQlFU0YBxJaTX/xIu6zrRCB/njl
	6hQ4Jo22TrAB7LiIno80vz6o6AY8XY8kguHpwcRT3AvmrQDB/9fWQHcAN+/9IooSgHiEM8WTTz8
	/5ydEkYOV54W7LJykY0G3QtlAp2k88cVInOAjGp2NsGmEgz2CjiSaSZ4JnBiBp5ofRJ5BMadsRx
	4+7CzD2+XRwV6/sMbdmjsRtbluFPadgFWndm3jMYdMlWKtMKFXKyIvafUXNqf8DzUAr+/q1MlCV
	ftI+ZQqFTn8MgZ5yWLVkLqxiMrPwfnjYCL+5YlVkJtgYIOlTtqsKpJ/bzo1encUsZmPAA=
X-Received: by 2002:a05:600c:1d02:b0:487:12c:e7ea with SMTP id 5b1f17b1804b1-4870f1f40f8mr51547485e9.5.1774361394440;
        Tue, 24 Mar 2026 07:09:54 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871105c799sm24855475e9.20.2026.03.24.07.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 07:09:53 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:09:50 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com,
	maz@kernel.org, oupton@kernel.org, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: Inject UNDEF when host is executing an smc
 with imm16 != 0
Message-ID: <acKbLtb288sABYA4@google.com>
References: <20260324135728.3532400-1-sebastianene@google.com>
 <acKacAd6aV32624m@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acKacAd6aV32624m@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_070957_038510_A3A02F6A 
X-CRM114-Status: GOOD (  22.43  )
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

On Tue, Mar 24, 2026 at 02:06:40PM +0000, Vincent Donnefort wrote:
> On Tue, Mar 24, 2026 at 01:57:28PM +0000, Sebastian Ene wrote:
> > The ARM Service Calling Convention (SMCCC) specifies that the function
> > identifier and parameters should be passed in registers, leaving the
> > 16-bit immediate field of the SMC instruction un-handled.
> > Currently, our pKVM handler ignores the immediate value, which could lead
> > to non-compliant software relying on implementation-defined behavior.
> > Enforce the host kernel running under pKVM to use an immediate value
> > of 0 by decoding the ISS from the ESR_EL2 and inject an undefined
> > instruction exception back to the caller.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index e7790097db93..ff6a90a4a4c7 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -756,13 +756,18 @@ static bool handle_host_mte(u64 esr)
> >  void handle_trap(struct kvm_cpu_context *host_ctxt)
> >  {
> >  	u64 esr = read_sysreg_el2(SYS_ESR);
> > +	u16 imm16;
> >  
> >  	switch (ESR_ELx_EC(esr)) {
> >  	case ESR_ELx_EC_HVC64:
> >  		handle_host_hcall(host_ctxt);
> >  		break;
> >  	case ESR_ELx_EC_SMC64:
> > -		handle_host_smc(host_ctxt);
> > +		imm16 = esr & U16_MAX;
> > +		if (!imm16)
> 
> if (ESR_ELx_xVC_IMM_MASK(esr)) ?
> 
> Also, I can't find void inject_undef64(void); I think you need a vcpu for that?

Ah my bad, handle_host_mte() introduced it!

> 
> > +			handle_host_smc(host_ctxt);
> > +		else
> > +			inject_undef64();
> >  		break;
> >  	case ESR_ELx_EC_IABT_LOW:
> >  	case ESR_ELx_EC_DABT_LOW:
> > -- 
> > 2.53.0.983.g0bb29b3bc5-goog
> > 


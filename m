Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE22F54AC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9azy4441Z9htuSU+O0vgMgPqnPm0TMDTgfr4iB1vDg=; b=wBfYKXa7awFKNREmAkofQhPqCu
	8NbjTK5seQ7xydchv693H/4fVoq4eoSGLulHatq889f5exWnzy2wCEzUcA7o4LPmMwQ+pO3UDxCiO
	YTMtgYO/jA4nNqSHFGwU5QGBU8uQngwG43D8S2hfOnIQyUxPVl4oFEseuwTWvb49Ht8MB/ZpCUySI
	H7vFifEAJfrlH+n5Td5MTtEqhMBioAxU1cHocLbWehIZf0M+AYe4PoYdIkvptwrJa8V16C+4yXcx6
	83lm6gJXmnP+JUCgjoQc8ZOxeSrZ3DrFcx5+8SGqyJ7PEw4CN+le9D3A0iydRE8P6HOnEigedOgOg
	mMRImcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52xJ-00000001ftA-2C1V;
	Tue, 24 Mar 2026 14:42:05 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52xH-00000001fsd-24tL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:42:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-485317b6bd0so62385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 07:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774363321; x=1774968121; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R9azy4441Z9htuSU+O0vgMgPqnPm0TMDTgfr4iB1vDg=;
        b=BRkmLq0VnCQtQCAbfTk7+GpDVrUR9Fw+eSM6/WxDeCaNqg3jWnJvmhGf/mXHk3Jghj
         INIB5a+2QtAS5Rte5of1EmcYeZyaVh4wV5vOYl1kEJzCIInkqre5LDbwsMEWTyYo1UdK
         +blG1yEIssLd6920wtlNd+Ei5/gQkb7WNuGlSR/n6cEJzNVlnsGdd5pDStITcZeqm08u
         9I4Ev4LzKDhEHxXAjT3IfzOaw2NfSHnseg4fnUtPiNWvnnl3572xuYxSCXThjAmrr2V3
         IE5S4JljnwwqYvwBfJgvS+fsGgKDoEzg1JtS6bIGfueg72Xh7oYwMyIjcmirjzlkqGce
         W/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774363321; x=1774968121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9azy4441Z9htuSU+O0vgMgPqnPm0TMDTgfr4iB1vDg=;
        b=UR6NcZEoqNoWE1bCTVVKv/2fNp/i20BYDysRz8UsxBV6Q5/yoaUOINW8tXe9J9e79a
         JXjh5IMD5Tc2nv5vw8k1HQtxom1yI7OcGUsvUV9KxHkPRyKK5oeaN11Nxbi6fXkOBGMO
         fr2+quFLDGf5Z0isrjfGLKOfOQEW7yxRYVurKxC5YMKidsFVAPD+8K0V3+4UsPOeJAsO
         Kg0b8duaLeLQs2FTTmXV/mvkXYR8Hkfqw6EGdC6ac7wR8K5603fztmIg48tnBgRcyAgR
         4Qt4Krzi7xuUNX5oMTo/9tcSZKJpRz515nk4g+VFidC4aTUmSip24ro2novCcB4l/y6O
         l5BA==
X-Forwarded-Encrypted: i=1; AJvYcCVHukZ7+z2gEJK521VUpeUB4aROp/1hKrwW8ybmDy6AWKfv6qPydDTiacelzZmlDXzs6RnfLR0Fla+F7HEUDXmJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzsz7kZ4iy+gQ4ntPUc39BQzANXp1kzEJj2KrJ6YMTcIhJdk4C6
	56iVTs6CctRWBUxYnOjL9xvQape58neETuD026G4GHvYO3+ypTnP8cK2yw6ZRxJUFg==
X-Gm-Gg: ATEYQzyGztXji6E+a34TmtLnpqSdaYgByKmPiAg8RGpNzdTnWBmQrhILRSsQLw2xvVP
	+tuT1LWm7IcMSX9ZgTS0vPIYdqtB4J3S9XGZqkvr6oSwTv6iWqRswmr27qr6bukZenm9hXQmLq2
	G6ds4IhvpB60peESx+mhaKx+iPz2eIIvycbuZasq7MpTFzhUWs5W2BC57Hyx5jqeKCxx3PMKUCY
	g3VDSNXlF3U69lO2/6IA0+4J/wVXwfYm+ue7NFf4vHiJJo1BLBbY3mtNju8QSy/h4X+km3bbM4X
	7CxIUL+gd5WB6L3r2Hv8xnIoHI/IH/trQ9pn1W1EcPboAblJwzVo7Ym4wC2+8TGFJkjomSfW3IY
	Gqtn5Qo1rI09uAol6LMPkKZJ1VRCydiipv4bPxXWdOCdcv3O4Br7uGljFnQyYtjaHKdX1rWUaHB
	5gcpbCvNYVjTMA9uC/euKqHJXUsvmTvAYWJhETbxJMH25v91DR+1Xp+6CPyYXFK8qp7UtRealCX
	qAQMA==
X-Received: by 2002:a05:600c:4e0e:b0:486:fbd9:b22c with SMTP id 5b1f17b1804b1-4870f59993dmr1066435e9.16.1774363320437;
        Tue, 24 Mar 2026 07:42:00 -0700 (PDT)
Received: from google.com (209.13.205.35.bc.googleusercontent.com. [35.205.13.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64711f58sm39757790f8f.29.2026.03.24.07.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 07:41:59 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:41:56 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com,
	maz@kernel.org, oupton@kernel.org, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: Inject UNDEF when host is executing an smc
 with imm16 != 0
Message-ID: <acKitObzn6jrO205@google.com>
References: <20260324135728.3532400-1-sebastianene@google.com>
 <acKacAd6aV32624m@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acKacAd6aV32624m@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_074203_549103_7D48841B 
X-CRM114-Status: GOOD (  24.69  )
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

Hi Vincent,

> if (ESR_ELx_xVC_IMM_MASK(esr)) ?

Yes we can use this instead.

> 
> Also, I can't find void inject_undef64(void); I think you need a vcpu for that?
> 

Right, there is one version that does that.

> > +			handle_host_smc(host_ctxt);
> > +		else
> > +			inject_undef64();
> >  		break;
> >  	case ESR_ELx_EC_IABT_LOW:
> >  	case ESR_ELx_EC_DABT_LOW:
> > -- 
> > 2.53.0.983.g0bb29b3bc5-goog
> > 

Thanks,
Sebastian


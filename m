Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2D6F54AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLMmL9VmQywy+Up0QoM5xuLhWibdytnU56bbqoy1KIg=; b=iNtWZfLhr+ffo49TOrpLUNFpGz
	nDlQ97259QNywQW80bS5lMGseKgjR2VliKXVtPVj2uktbsQbIxM3qWWTlaqNCLOKVs7fX3/HIJLf1
	ERluDuWjtDmMm8cMO2m03OCZ4zp0GqZtgHCUSkKdsWDmRv/zslAjpWVg2kp/Sw1y8HrT3mYVpGe7V
	NO1/DwWSVlrd0TJS8w8UaWmWu7Go6jCcht6SAq76sx4UWWC4HE3nzdTfYebE2a80l+4Fl86Ba/kuT
	5aGeS6x1+I6iCezxVxb8NTev4EArM78HBpIZWaBmwaVwjCJ2aFFUkUSMHD00hZCmPz8bbVuZLGZEI
	T6GD9ZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52aD-00000001cY9-3MEo;
	Tue, 24 Mar 2026 14:18:13 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52aB-00000001cXi-1Bg1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:18:12 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso10279695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 07:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774361889; x=1774966689; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YLMmL9VmQywy+Up0QoM5xuLhWibdytnU56bbqoy1KIg=;
        b=Rljd5r3yIzcXJB9CxOC07ZeJ4u7m+jDC4JLqNXKvfOQgmjNDjgVLlRbF8nMxNWKfKp
         zqQVRXHG7NueYUiaCnvX+extJcjP3wm31KEhjjuUvn54APQRs0z5rSyzV6Hdk6CSnXMf
         lqlOKx6mLlmUlNatgK5lEwd2vS91XVveNFNe0/U1eS4jHFIAlSRLvmtmC3AXBe1rpY3x
         D6XCfKc4iWX3QC1uMWX06DMZRVaOJLhuqKA5GOdfoxAH76NoayAcG4vegpk3VCzoGKJk
         tnhsiMrEXjEcYhMp6sc0sRTbRj2+tDfjNhxNijEDdH3Dy681ITvc9O8Xh0GaLPOVvIjc
         g94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774361889; x=1774966689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLMmL9VmQywy+Up0QoM5xuLhWibdytnU56bbqoy1KIg=;
        b=dXlVAjGX6i2UrLQK7CjOUkAY7hNtx4h0AujMYic3A37MPlEFRQifcqFKPSj0u/9L0a
         4rAhuU79CpVp8MQ8rQ/x5Td78F+muNX619BaZO6q895v172p8w+tDKooKGLqJH4W1/Kg
         vsmcZEMzIVDpkIYH7hZcHIu4m7yPw1/ohr+W6RxpNrHAzNBZxieMrmwez50kAPZob8aX
         r+54Y7TEXBXRFPdCMDGVozZpJ1OLXn9iBby1shJ1LP4CMmqAQPvBV0Qr3GCK1PGNUMm5
         JrhwwX6LVoCLRkMzusfD1ljPR2iwO5TopUIE1BjkscgXa1EKb2OOgvIW29rSak+6yfn4
         /yXw==
X-Forwarded-Encrypted: i=1; AJvYcCVc6yI9kKsDqxYJ4UZCDZ0j8KJE1HxaMk5l0931fnd1rZpEqRYwnbGLa0nIeK4ZMgXZoFVU8ooQvxZCXi201TIx@lists.infradead.org
X-Gm-Message-State: AOJu0YxolG4Q5+kL1sGqJ/dZokBxUwaW0opvQKC/lGMEezo3ZCiNcKSN
	hui0V1U8iaV1R0l4/HrwVP4enHoIQue8pY8zMuGZ/KF5HyUl6INMDGHd4dbtZtDHbA==
X-Gm-Gg: ATEYQzy1+hOom/1IZRHog2jinVYgcD70RRewxq5YvaNi41pGWRvY7AnWlXQa7eWBuVM
	YmRdMInq5FHa8LpTc2BkIr04SzLq5twBoHcM5r/qE3gkqFtLT7n7mtl6DEJYudIy1ugz613kOod
	DsOTeH4gryEsgLbTZiBY7rkJHd1WpwCpO6UggM7i4qQqOAny9WSQ8Yj0Nm38qDYhxZ/+VVq1imu
	ZMniJxrxwBpJEfKQj2v36/SpR2r5KW55EA+XJrCroQAJZxh6MatLu3+xZXSFUQh/IHX2V/bVvTD
	r75C04cM5Lc5yp9ch+UD8RXQLufmJMFyeZWcdsbyZL+1bCNotihK4BS1VP4BDAOMY8DF99/PNpa
	felayzDLex32kbTf8BVu+D5JOSrzGyLH5UBuCGd/cgAoeXvHkb6t8ke2mMXDwOvK7Ok05Z3O334
	qz07abIEOpuZYZl8+iFHemWscmJquemPlIz43jiLv9tOGakmAOBXGRzr7qq3UuPEYnlrdaPbjRy
	UlTHw==
X-Received: by 2002:a05:600c:c167:b0:486:fab9:a578 with SMTP id 5b1f17b1804b1-486fedc3843mr249633765e9.11.1774361888913;
        Tue, 24 Mar 2026 07:18:08 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487117732a1sm48548215e9.15.2026.03.24.07.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 07:18:08 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:18:04 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com,
	maz@kernel.org, oupton@kernel.org, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: Inject UNDEF when host is executing an smc
 with imm16 != 0
Message-ID: <acKdHK1FbHM_-zdl@google.com>
References: <20260324135728.3532400-1-sebastianene@google.com>
 <acKacAd6aV32624m@google.com>
 <acKbLtb288sABYA4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acKbLtb288sABYA4@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_071811_341335_276A48AE 
X-CRM114-Status: GOOD (  24.45  )
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

On Tue, Mar 24, 2026 at 02:09:50PM +0000, Vincent Donnefort wrote:
> On Tue, Mar 24, 2026 at 02:06:40PM +0000, Vincent Donnefort wrote:
> > On Tue, Mar 24, 2026 at 01:57:28PM +0000, Sebastian Ene wrote:
> > > The ARM Service Calling Convention (SMCCC) specifies that the function
> > > identifier and parameters should be passed in registers, leaving the
> > > 16-bit immediate field of the SMC instruction un-handled.
> > > Currently, our pKVM handler ignores the immediate value, which could lead
> > > to non-compliant software relying on implementation-defined behavior.
> > > Enforce the host kernel running under pKVM to use an immediate value
> > > of 0 by decoding the ISS from the ESR_EL2 and inject an undefined
> > > instruction exception back to the caller.
> > > 
> > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > index e7790097db93..ff6a90a4a4c7 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > @@ -756,13 +756,18 @@ static bool handle_host_mte(u64 esr)
> > >  void handle_trap(struct kvm_cpu_context *host_ctxt)
> > >  {
> > >  	u64 esr = read_sysreg_el2(SYS_ESR);
> > > +	u16 imm16;
> > >  
> > >  	switch (ESR_ELx_EC(esr)) {
> > >  	case ESR_ELx_EC_HVC64:
> > >  		handle_host_hcall(host_ctxt);
> > >  		break;
> > >  	case ESR_ELx_EC_SMC64:
> > > -		handle_host_smc(host_ctxt);
> > > +		imm16 = esr & U16_MAX;
> > > +		if (!imm16)
> > 
> > if (ESR_ELx_xVC_IMM_MASK(esr)) ?
> > 
> > Also, I can't find void inject_undef64(void); I think you need a vcpu for that?
> 
> Ah my bad, handle_host_mte() introduced it!
> 
> > 
> > > +			handle_host_smc(host_ctxt);
> > > +		else
> > > +			inject_undef64();

Could it be better to return SMCCC_RET_NOT_SUPPORTED?

> > >  		break;
> > >  	case ESR_ELx_EC_IABT_LOW:
> > >  	case ESR_ELx_EC_DABT_LOW:
> > > -- 
> > > 2.53.0.983.g0bb29b3bc5-goog
> > > 


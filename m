Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0B6FCA16D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 18:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADzjqBFR4WyG4XO+KFuvgSIJVhmrK46zCfN+Fca80dI=; b=u6ZMbu8/ASeAmVgxPP2k0opIhS
	voF7Jn9A4W/ea0KpHcjANnP43KfUoki+hGJfEfqGkQYHISuCfjVM60fRqnGi6wNWiBWgM9l7sx++2
	iw2OS9QRS543dtXyqE3mQDcQ6+l+V/3GNtQMhrElvOQ+GEZ4YLTk4DynbGM0vACfKRFb0376EClmY
	2CGKCydN6048t7PEQYJsmNqUynl5+KA6ENpNzOSL5PMW6MBOnxw50HodpLqY+lrwTws+lFtnruRFf
	c/3JYp5LlCZOManoZAW2M9qYgOeOy+pGip+dJm7lszq6Z55GHarupV0LKFoXeppuqMm9qQLOxPdM/
	2Z4H8i2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzf1H-00000007sRZ-1Ube;
	Mon, 09 Mar 2026 18:07:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzf1E-00000007sRB-47uo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 18:07:54 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-439ce3605ecso3358699f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 11:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079670; x=1773684470; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ADzjqBFR4WyG4XO+KFuvgSIJVhmrK46zCfN+Fca80dI=;
        b=qLwWDrGHXVQGV9daXD2mYcWhInVHlLXi8uNuFb6NBwjmld4wMfV2c5Js2xqc8oFX9u
         dvpAFKYaKMaTuFESapHhYOr4lJrSpoMKx+dVv/aumGiPUZBts9ZxDubk1hJZ/4lQFvJJ
         nmhDlx3nU1jIJOJ/KYmgs7xyYh4O+HW8YXTeJUoio2wD/NjZhGh/qq+s5npNvtQn05Vy
         NWJocP8BP+oyq/IzzRVdpHBPM6XMIV78xhQ//TurQozfMQPSkhg5eE8UtQCSgSuWXA4H
         tKgqjgF2dwXL8U1Ik3BgyVspNGUGNcy/FYie/8vjuU+hP4pC63Cl9f7uKcV2ZnDCriun
         8fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079670; x=1773684470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADzjqBFR4WyG4XO+KFuvgSIJVhmrK46zCfN+Fca80dI=;
        b=ECzz77LShJARaeJEqFGeM7Mm/uS3acm5quTgYNIZ7rT+i1ubnJwELzDLoZnYrKbq+H
         +9nplH9D+P0ZCtK4JmawsTRJKqyCmRs72ehUCmGus0MCzttkV0bQRLpXkwnEGiXs3kBM
         REa4AaSmxW7C4OQkpnbzIYdFjqg+zN9ZmnZoJiMoLtI3qYf9CerKFDFqoqcKXDURvR1b
         oiwcsvU5HItUWqb7jvBuBU5bzI9+9yX21wTbZuoMEVH/BhgK5cmbEbpmuEFXBbWOrLVa
         RtCrkpftQiZiFEHkjQXzTu789VTwKk6JKtRJk1Xj9J/ETQ37+FodLtuC9z0sxKwAxe2e
         ekJg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ/R3jTzD1oZjn5X8WqwS081SyIRKjvWzWpoio9TI5VFnaq//2rdrQksekIUf/d0LjOFh5momopydczDbmJd33@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2/SGPsjLCQ3uBwQjF63t2f/Wo/vwWU3p+rLOSNjhppDCstMGd
	xskIzG1eW3ryjEjjYfisJul8D1VXDpLq6dU016BviR0aORhX1Ii0jp/38jSOFB7nuw==
X-Gm-Gg: ATEYQzyxNLYBs31M7aNAfiMwpb/6odf5W2FV1XM/W+vkdtsFqSyntBfHAUZKfhhVGcI
	wJwKfYCChjJRRSFrLd4f2z3BWs1GEZB743nrmupwO1FIwgNwxetTfmDoC7oZ1TWlImTIAG9Woc3
	d2Gx08Fz6systgMkQ64fgXfd4s7KtfWQ0jJaAdURAXGsceS3cv7KCQPkMJz9ZEebEpoLQHU7Ghu
	DoSBBaHMCJXXXjhh1wAXi1kJO6e2bvElRH7DlNGpwDDkzBsrr9XoMILj19T5B58Exin0a1/lyhg
	g40EAIidWGmf9vJ3KHhVRLFyPyxPmZRKMGNHi7g6gbFbXHFSRp9bi9R/rpY4gfkNhfa5TLrRZcY
	aceDM8Grnv29PoYhYdiZXOIAv223cKcPKNH3HhYsUrM2QnGRfox3pw1s2qA+By14fG3pawJYt/6
	iwbYPMTXY6ADSqlTEWPYmIEtMhmoIYqPAc+Ldnl21+Zs6MsHU4n9h7y5wfl9VWr3p7rJM=
X-Received: by 2002:a05:6000:40dd:b0:439:cb5c:b18d with SMTP id ffacd0b85a97d-439da893f6cmr21068586f8f.38.1773079669660;
        Mon, 09 Mar 2026 11:07:49 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d973sm26709539f8f.3.2026.03.09.11.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 11:07:49 -0700 (PDT)
Date: Mon, 9 Mar 2026 18:07:45 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, tabba@google.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Fix ICV_DIR_EL1 trapping detection for pKVM
Message-ID: <aa8McT6o2_KSXVfz@google.com>
References: <20260309160450.2610295-1-vdonnefort@google.com>
 <86h5qo7vr9.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86h5qo7vr9.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_110753_066060_ADAB9E12 
X-CRM114-Status: GOOD (  21.67  )
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

[...]

> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index e7790097db93..0432852228f9 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -463,6 +463,11 @@ static void handle___vgic_v3_get_gic_config(struct kvm_cpu_context *host_ctxt)
> >  	cpu_reg(host_ctxt, 1) = __vgic_v3_get_gic_config();
> >  }
> >  
> > +static void handle___vgic_v3_get_ich_vtr_el2(struct kvm_cpu_context *host_ctxt)
> > +{
> > +	cpu_reg(host_ctxt, 1) = read_sysreg_s(SYS_ICH_VTR_EL2);
> > +}
> > +
> >  static void handle___vgic_v3_init_lrs(struct kvm_cpu_context *host_ctxt)
> >  {
> >  	__vgic_v3_init_lrs();
> > @@ -622,6 +627,7 @@ static const hcall_t host_hcall[] = {
> >  	HANDLE_FUNC(__kvm_timer_set_cntvoff),
> >  	HANDLE_FUNC(__vgic_v3_save_aprs),
> >  	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
> > +	HANDLE_FUNC(__vgic_v3_get_ich_vtr_el2),
> >  	HANDLE_FUNC(__pkvm_reserve_vm),
> >  	HANDLE_FUNC(__pkvm_unreserve_vm),
> >  	HANDLE_FUNC(__pkvm_init_vm),
> > 
> 
> This looks incredibly complicated. Since pKVM forbids late onlining of
> CPUs, you are absolutely sure that you have already seen the CPU being
> hot-plugged on.
> 
> So it would make a lot more sense to just return the current value of
> the property you are trying to re-evaluate: you know for sure it
> cannot change under your feet.
> 
> I have quickly tested the following hack:
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index c31f8e17732a3..947ff71b3b66b 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2345,6 +2345,9 @@ static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
>  	    !is_midr_in_range_list(has_vgic_v3))
>  		return false;
>  
> +	if (system_capabilities_finalized() && is_protected_kvm_enabled())
> +		return cpus_have_final_cap(ARM64_HAS_ICH_HCR_EL2_TDIR);
> +
>  	if (is_kernel_in_hyp_mode())
>  		res.a1 = read_sysreg_s(SYS_ICH_VTR_EL2);
>  	else
> 
> which works for me. Could you please give it a go?

That works! I can spin a V2 with that if you want.

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.


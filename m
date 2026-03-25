Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA3D106B526
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 13:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fr/xJXr+pWIqYUCMaECKCggQV4ePG6j5BQohThHEf40=; b=L9z1GOPtIYW667H5JFLHrrHj1i
	U2xwIJvIOtNF8ZQXpxI96sXy9t1/7q24lt7UJ0Axp+bsqf2xD+D7MrFpy/xKdqvlcdbPUCaHuxDUu
	SS0IMid8Kgwo9nS+9NmET5VERhIJS4S2fcArYrcYYRBz04K7GpjPpEd7ww89bb6QwWYhiF14gzrOM
	8+dvmZEFITPIzA1VbGQHhqBDgbAYdd7bLyV2CcJH53AWVTeXZDvdEd4WErP3HsBKKznG+Q+T5DcIa
	Jnj7QwmdTX2X/IZdLWt05EXGKwS8WGTNc8rBPFZ4Iv/zJp62lHEbxtGXd+/GEhKnau/hWscjnECfa
	+iPgzALg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5O4j-00000003RHD-1lLG;
	Wed, 25 Mar 2026 13:15:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5O4h-00000003RGr-0Xx1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 13:15:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48569636800so69955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 06:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774444505; x=1775049305; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fr/xJXr+pWIqYUCMaECKCggQV4ePG6j5BQohThHEf40=;
        b=LXHEn3yMlXFMbDbFHbZK6tJyorIAcBALuQs6grxET/yKIA21oYELU7hd2XkoOcTv7L
         9zdNLEkQv6oEOJgNFi/GN26nb32fopJkFM0mZWHvQXMNTfWphpji64+TuG316V9rvTbO
         uTE1bfh/3Z0hbSaLDnRdd5MWCNclm2dS4he4bD5GxbA+5IPO4G7JKusCU8vgJyd7GUJt
         uJXBMFvQ0al/cIaR1mhcgFABSDklIO42zn3EVPGa+vkIwhVOc67TOTMZ0x0vz/vW1ESi
         ZUOry0ocNp21NEs4r/Ue9EGv4cPzlfmUWB2ByVcyhgBsmSZwOncY0VCNw0ZbrdhqmNfB
         lf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444505; x=1775049305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fr/xJXr+pWIqYUCMaECKCggQV4ePG6j5BQohThHEf40=;
        b=E7HLiobsLOiFMOkYuJWT1fcn4lZtgIoPmb6IgacgGG/rMyEJSbLQbJZWy3Nn1kPGyZ
         wWtCSIDjxEwgXMLFgAHNAmrcCfMl++kWvoGRw9qX5b+9c6z96pZRStbrUOeboo64jQHV
         qeL7WR93hpEKhhwldy2E+hzrzFUQD952X0AUEDgevlILK4j9dn0RPDw/v2+UiIp6+Qzt
         QHjlmaUQa/eZ5iNFiLKFrsPvnZzVRGqFHY2QgzIAOAPBXD77uC77z6/ns9WDld1LIPbt
         FKdkXaBkCzYHjK+oEk3W7gRdJDOO4uTaCzVEHQxjXpmo3eegui/oMYHF1fNAHXZGMzMV
         BmKA==
X-Forwarded-Encrypted: i=1; AJvYcCUL3GkU+Ff8CZfYtQWrZP+xU3GMlu0GzDa5V0BgILbtkAnpsxxjt+LhoRl9IfxLwvAEWrSRas8jiOCmLKE0PXDv@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy/aja5iI1++OJTyn19WCIzoF3WC12b/VyRAaguMfRCFRW9XUO
	4zbFtWve74DCFircOI6yOpqUvfGd8ZkMwcXx1F73Ts1wzfaMcISfVYOQqi+lFjYBDg==
X-Gm-Gg: ATEYQzxFzZb9Ui99xV2G7pnoPgneGVs7G9uSs+p2zOtTgz+tvvYd2AItanTf8yhbohE
	iaryL8ho7TTCl4WOSQUKR1cpvSW4ylOEp19yUIekgphI3khJTpvDILuOSCSWupLugkQcbRlWiPb
	341v82GjRmPB9g8op4EcDNQbIueD9CUUAglyxxiTTqT0HfASn8+zM3gFKcbbfnbVINlOlKrzTbs
	XD2U7JUEz5X5fEWGXUPblWbvF8opTXVb71l5DjpOkQFMmwXmLVUg+xIZawncB9ZHHVn1BsbeK+g
	kJSB+B0PBt2qUio51+VibLZV6kDj1UKBQFRry+7c12pk3m2unug8ghKa1sVtHzvoiQVm8LWdD5t
	SpMfdxW6TkNUxKxROxOezeI9qlHMPJbUWksq6KlF08FgZmG9pR8wK4QDJMqQWWECcAhpJyZlukz
	5MbDZnwEwas2U29VLOWQuRp5cgKcMNIvem2OLVamWYiAcOL1gbNwX8dAJQbm/RhKEyI4Y=
X-Received: by 2002:a05:600c:2d43:b0:483:6a76:11a6 with SMTP id 5b1f17b1804b1-4871787d9e2mr493345e9.5.1774444504645;
        Wed, 25 Mar 2026 06:15:04 -0700 (PDT)
Received: from google.com (209.13.205.35.bc.googleusercontent.com. [35.205.13.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee514sm157350785e9.13.2026.03.25.06.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:15:04 -0700 (PDT)
Date: Wed, 25 Mar 2026 13:15:00 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, catalin.marinas@arm.com, joey.gouly@arm.com,
	mark.rutland@arm.com, oupton@kernel.org, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH v2] KVM: arm64: Prevent the host from using an smc with
 imm16 != 0
Message-ID: <acPf1J2dOLvpXHhE@google.com>
References: <20260325113138.4171430-1-sebastianene@google.com>
 <acPIdoA8oc7T8wKX@google.com>
 <86ldfg3ze2.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ldfg3ze2.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_061507_209845_A763477C 
X-CRM114-Status: GOOD (  31.59  )
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

On Wed, Mar 25, 2026 at 11:46:29AM +0000, Marc Zyngier wrote:
> On Wed, 25 Mar 2026 11:35:18 +0000,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > On Wed, Mar 25, 2026 at 11:31:38AM +0000, Sebastian Ene wrote:
> > > The ARM Service Calling Convention (SMCCC) specifies that the function
> > > identifier and parameters should be passed in registers, leaving the
> > > 16-bit immediate field of the SMC instruction un-handled.
> > > Currently, our pKVM handler ignores the immediate value, which could lead
> > > to non-compliant software relying on implementation-defined behavior.
> > > Enforce the host kernel running under pKVM to use an immediate value
> > > of 0 by decoding the ISS from the ESR_EL2 and return a not supported
> > > error code back to the caller.
> > > 
> > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > ---
> > > v1 -> v2:
> > > 
> > >  - Dropped injecting an UNDEF and return an error instead
> > >    (SMCCC_RET_NOT_SUPPORTED)
> > >  - Used the mask ESR_ELx_xVC_IMM_MASK instead of masking with U16_MAX
> > >  - Updated the title of the commit message from:
> > >    "[PATCH] KVM: arm64: Inject UNDEF when host is executing an
> > >     smc with imm16 != 0
> > 
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > index e7790097db93..4ffe30fd8707 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > @@ -762,6 +762,12 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
> > >  		handle_host_hcall(host_ctxt);
> > >  		break;
> > >  	case ESR_ELx_EC_SMC64:
> > > +		if (ESR_ELx_xVC_IMM_MASK & esr) {
> > > +			cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
> > > +			kvm_skip_host_instr();
> > > +			break;
> > > +		}
> > > +
> > 
> > I wonder if it isn't better to move that into handle_host_smc() as this is part
> > of how we handle the SMC after all? (and it calls that kvm_skip_host_instr()
> > already)
> 
> Yes, that'd be vastly better.
> 

good, I will update the patch to do this.

> It also begs the question: if you don't want to handle SMCs with a
> non-zero immediate, why is it OK to do it for HVCs?

I talked a bit with Will about this before writing it. My understanding is that we
don't have to do it for HVCs because the interface with the hypervisor
is controlled by us whereas with non-standard SMCs we need at least to
tell the host that we are not handling non-zero imm16.
 
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Thanks,
Sebastian


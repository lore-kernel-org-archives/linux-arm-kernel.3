Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C64CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4PZUJriZ6o5oZdswvVmoADliWthbllAlriaIosIncM=; b=e7aIrCc8gSwAbu8D4pZdvNSLNo
	8L4w09ay25avQMiWyHIXpwckcRjxCHI9iWliguGjp3xNd2uMltLB5l3mMtPPjXDKzUq9TwGdnRl9+
	W3iDMfuQY27L5itORLg61ROTlrC+KXa/YD3WAofN78XxbfhsYXTxjBehWb0sucpoYoZygXjyeLSlE
	BD6SPh1grYbtqnnUPm0iQb+KuAwS3fMf1SYydvH6Nrn146rSkTPWGUrWMiJCh4p71G4pzsrmt59W0
	t8AL/RnlcdOaoxYqMW4FkOWjp3RRcn4xMA4abI9js6I0fxFLxXJmUJsjS6eHr9eESlUtj69FMPRGq
	3h6DJ/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHQG-0000000Buuj-0Uf9;
	Tue, 04 Nov 2025 13:50:08 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHQD-0000000Butb-3O1p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:50:07 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4ea12242d2eso268641cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 05:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762264203; x=1762869003; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e4PZUJriZ6o5oZdswvVmoADliWthbllAlriaIosIncM=;
        b=bsRPtJ+uG3lxiP3jO4GO3X0WvbU38vrOCEpQZk85sqd5F+9/rj4kjW9CxhozyzTmYW
         A42Moc7NPnceIznYPefOFovXOAkj/CQx5jrYNmobfP22CveECO+EVbW7FVFZSPl2sDFO
         mxzFPjeFRrJD/cLle/sN/QPsAUyXAUA51opo/b6REv5fwkYmjyX5EGTXS+JwimOYwIz4
         wV6hoDRgGhB06OuS96ovH1M46KQI+TFONJ1Ec4lv0w+2T9xVpBqh5etz/IScCn1W9jvM
         pf4X6Qcl66DrUetdUbPJ4NiIcp5gk77V2B3M/MJp4dyY/mAleRy8oC9wZDRSNoNgRg60
         Ksnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762264203; x=1762869003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4PZUJriZ6o5oZdswvVmoADliWthbllAlriaIosIncM=;
        b=NiZYjfF8xub1zu9ovc64eubOA5GYq7ZnqBUeoqIIs0OS1VLDqxWDURd14i9Rjy11nq
         EQfChEgkY9QI/zt/m2SIuezu80D0b7J1zLq3+qQShBUHVNZ2Cce3yduyXx0EBgAq2+lF
         YyrbJB7WceA6TMIn+WtVNVamBqdI82BFmhD31dmWL0dPEG9kmLo7UbAaGTcxZ/ADnuYl
         9h1744bMnOPqrnWws167aE+B4Y2rIMLudkcL8ssZcqg2wuw0N1wBpG5jssLvG1mNi4qR
         FpD84g0vN/tZtpqDVGq/Ek/pR6DR45Fc2TjKRtr3Ce8YM8oTVmy6SOfm56wzk7x2+QhG
         Sv0w==
X-Forwarded-Encrypted: i=1; AJvYcCWsFSVdjfn2rrNvJRzl0XSskdxGQPWPoPBQK99Oa4Up0jEwyuibwVzP3G7AtikH40rNgO1Vi8UQstws45RwZ/Wn@lists.infradead.org
X-Gm-Message-State: AOJu0YzNdc2QXwpkhhgd4YChLj1T4ZvA6cSs9n35toxfW4+2AbgWcoFw
	lcNSqal7SDPWVy4miGngWm5yI832h3imVEZO34IBi2cptJQ2dwo9dm5ipna9gSz6rKwCZXdohpQ
	ImnT/MFTuLydpGm3Gv0MXsJZVBWDzxn0TFVZ28ec8DbtWJKSrpTv/0xbO
X-Gm-Gg: ASbGncv1TOMsrT9KI6x80avGWiQ4vlwPnU/dVRr8RGTR1SfweqSAvk3l2K6qK96Tw6+
	wMljuwCbfd9hegONclBw94BRhFzHnMajikFJ7fkyQ9iJcGodq2XfQzak+/6kTyqPIpVbfVQ0DIh
	BvDALgosLVymNoYFjyY1Sos20MtO40a8McUF1uPR1lq7syKreIc+w9plaF/1xF4IGPu40s4ANne
	/uS6OIr/Vmm3k/0M/bPEXUL4Hdr2dDH6EwLiMVsQZ0tG1cKATn+KNuXLpL/gUFSGJPC8ZamKm0f
	VtQAF/lH8kx9UwRsLP5X10I=
X-Google-Smtp-Source: AGHT+IGTBq9V0fTn68K5+VaRr10xjLMseLr8sKIiRzYHVvyriGiMAPU0QHrZo65E9fUodm9ZFPFCOW1IRZkY1g2Qwjg=
X-Received: by 2002:ac8:5796:0:b0:4e4:6a1b:1148 with SMTP id
 d75a77b69052e-4ed61c2b012mr7863361cf.6.1762264195039; Tue, 04 Nov 2025
 05:49:55 -0800 (PST)
MIME-Version: 1.0
References: <20251104125906.1919426-1-tabba@google.com> <20251104125906.1919426-2-tabba@google.com>
 <20251104134439.GA285975@e124191.cambridge.arm.com>
In-Reply-To: <20251104134439.GA285975@e124191.cambridge.arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 4 Nov 2025 13:49:18 +0000
X-Gm-Features: AWmQ_bn0Qp35aVsUEeieVb2P4NkOnkj_isUo2GmXSf1FLIHtXP--Xilm07LyOK8
Message-ID: <CA+EHjTw6bQOnGczLCJGmz_cbwj_Sd42pU9DOxLarkETzWfLS3w@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] KVM: arm64: Route MOPS exceptions to EL2 when
 guest lacks support
To: Joey Gouly <joey.gouly@arm.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_055005_857436_55FD5576 
X-CRM114-Status: GOOD (  30.55  )
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

Hi Joey,

On Tue, 4 Nov 2025 at 13:44, Joey Gouly <joey.gouly@arm.com> wrote:
>
> Hi Fuad,
>
> On Tue, Nov 04, 2025 at 12:58:59PM +0000, Fuad Tabba wrote:
> > MOPS exceptions must be routed to the hypervisor (EL2) when the guest
> > does not support the feature. If the guest does support MOPS, exceptions
> > should be handled by the guest at EL1.
> >
> > The existing logic was inverted: exceptions were trapped to EL2 (by
> > setting HCRX_EL2_MCE2) when the guest supported MOPS, and left to be
> > handled at EL1 when it did not.
> >
>
> This doesn't seem quite right? Check the commit message of 2de451a329:
>
>   A KVM guest may use the instructions at EL1 at times when the guest is
>   not able to handle the exception, expecting that the instructions will
>   only run on one CPU (e.g. when running UEFI boot services in the guest).
>   As KVM may reschedule the guest between different types of CPUs at any
>   time (on an asymmetric system), it needs to also handle the resulting
>   exception itself in case the guest is not able to. A similar situation
>   will also occur in the future when live migrating a guest from one type
>   of CPU to another.
>
> So it's intentionally trapping MOPS to EL2.
>
> Also with HCRX_EL2.MSCEn=0, execution of the MOPS instructions are UNDEFINED at
> EL0/EL1, so you wouldn't take any MOPS exceptions to EL2 anyway.

Thanks for the clarification, you're right. I'll drop this patch.

Cheers,
/fuad

> Thanks,
> Joey
>
> > Fix this by moving the setting of HCRX_EL2_MCE2 from the feature-check
> > block to the 'else' block, ensuring exceptions are only trapped to EL2
> > when the guest cannot handle them.
> >
> > Fixes: 84de212d739e ("KVM: arm64: Make FEAT_MOPS UNDEF if not advertised to the guest")
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_emulate.h | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> > index c9eab316398e..0f8311263edf 100644
> > --- a/arch/arm64/include/asm/kvm_emulate.h
> > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > @@ -684,7 +684,9 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
> >               vcpu->arch.hcrx_el2 = HCRX_EL2_SMPME;
> >
> >               if (kvm_has_feat(kvm, ID_AA64ISAR2_EL1, MOPS, IMP))
> > -                     vcpu->arch.hcrx_el2 |= (HCRX_EL2_MSCEn | HCRX_EL2_MCE2);
> > +                     vcpu->arch.hcrx_el2 |= HCRX_EL2_MSCEn;
> > +             else
> > +                     vcpu->arch.hcrx_el2 |= HCRX_EL2_MCE2;
> >
> >               if (kvm_has_tcr2(kvm))
> >                       vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
> > --
> > 2.51.2.997.g839fc31de9-goog
> >


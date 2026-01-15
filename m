Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F92D4660F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 19:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=789E7XMsSF/vUYGo+sB/vwsS/4LWZ4RWatA6a6kFxhE=; b=NF4ZkBfKu3d0MgEo28c18GHugN
	6VBiSrjgKIsK0KYEaNpgUd+PW8SuaNZwMtkM5Dq66d93Yfz8fj06GeXCRjmFT7BXloGe+2NWcjFNF
	p9L7nRjytPCExhv4ROhnpOtwVxSkaJUI8TggsIamcdrNf+GhYmISlq1cq6jLabdaV+dnwS+ki1I7v
	LMIqks0ugJ4iCjLbaGeEo2wBYTNostePy5+MVEUeE+6a4P6vw6S1mRuaX3M9kS1P1GCD3rpN7zqmT
	1dt2v421uzE9nfhfkKwoO0I+J4vDMLo4cVgjwXAAL3LD1A1poP+bPNeYggQV3t69yPRWiktN1eyFA
	4DAOZ5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSpJ-0000000D23f-3dsJ;
	Thu, 15 Jan 2026 19:16:13 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSpH-0000000D23H-1vZX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 19:16:12 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-501511aa012so36681cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 11:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768504570; cv=none;
        d=google.com; s=arc-20240605;
        b=T1j+QgYt/gijZdtJ1wRqmkAn5gkVxzGGdXtvsO4vIR5My2wUp/mP3f2mTYngXkKoYH
         odF15yWYN5RjhAKOd92YnQsb/NvmX3tyrE6fPupLePCeOPTeQ31UA1wJ4wGd7uQPMks0
         tFFAIiDp7aJGnqbPmNxTKljhYoJCIie2Dhpgpdfly3EDhTGQcQXLyEOBaXmlG7EuWu3u
         RfCLB3qL/RSTYtiZ4GYx+nTA5vLQv5F9UbE0vp8RK9I4WUNqfG35rNeosCYRym314Efg
         +15FanUzn9U6ii8+RhsJsBF2ORU3aAxsyJor36ithLIJ26By4A5R3JwAX7goPbnsS/oM
         6YaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=789E7XMsSF/vUYGo+sB/vwsS/4LWZ4RWatA6a6kFxhE=;
        fh=yuNk4Puh5DMCzpAu7wB0IRyj+7+5baT1sEtEwoLSHss=;
        b=PrkysWzY3OZhZG4bxDDCyby76C8Ip+JTbwwt2kibJNHiVJMlS8cHPsrTeNQ/HIRR9P
         jYV/62tkSzOMbw6x52HBR7A6EnB+ioIAoT6qR3DJsZRYDSbCOxOm6KfzeCi1ae3Dr8A8
         FWnJ4lYpSxuyDhh67/BgX37MItisDe8O5cxMvhiJnUC49dzWWcImywgkD0FeU9tk3Xg8
         /C9xgVOxWAzHJqMlExIrJxYlSK2e63hQa6oX9zkvTGCbwrpBEYIMskjVLyNOwNay3dqh
         xAVt6nmamDAvXAR/3w+T2ml8OvqknvXZWcjMm9uYeacleo6QMRVNKJWONbzVb6LyHjdW
         2ipQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768504570; x=1769109370; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=789E7XMsSF/vUYGo+sB/vwsS/4LWZ4RWatA6a6kFxhE=;
        b=1JkIDxQ6FIVQag2L7Rju0qfK1hlEjYaCWB4XF7/Op2OrSUBHbk84RVIP2K+v7VjyVG
         cM/UAaQiLFrct3RHjoC2iHl0aM0JSWJ+yzRzhETEdiK1lqBRWL3FxtW7hzLB3INgLJV3
         Kw+t3JNe4sbcTKyRJSEkbIFN1VeidpfMQv/3B0D2hllLNG5y6KngYXXyMgtzLKtRt0HP
         w6AGQ9h7W6b6ESa7nwKM5DXLSKeSlyW3ik8MLiec/RSLLyI3qWEApbK+Q1jkKeUn1/+b
         V6WSweHiAcLKZxeR3O+KzfShZm/gqttURZa/nyvvCuToO6/ofFeN4c+5pyuHcqS05jr1
         W5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504570; x=1769109370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=789E7XMsSF/vUYGo+sB/vwsS/4LWZ4RWatA6a6kFxhE=;
        b=KIQg/XGKYRsi5s3egfKz49Lhe5i93Mnl6ISwpNHOWJj4SjoTaMJ9fTQuE/pUQrqK/p
         um+EZfiZT9DHgAxk2cXIGGfVXsho0LM7gzoB+d7l8i8v7plGMmL/+DQ+1ViwQIs5GiDQ
         +DTEoqJuIK3jEa3N+PPOGomfR+WmeD5iaOOxxe4CTHdHMMOM53qJlI22jBhf3g7wPqnQ
         zfOOHrK90Sh66my5Eb0+bzl8TyKEo6wBs+1+Y0B89hEIJvG1Lo1wNCigWP+B3MKLplI/
         d1T9i64Vp8YIfW1Hu1w+5H5HjEi0TonDkhevPXGpf0Mrkq7UxxqTsPM9AypqOwOpu5SF
         CuXg==
X-Forwarded-Encrypted: i=1; AJvYcCUIMjkKAgC+VMRBvUKO1bdkC09LWIf0rRGeXBT/Xz0YOAevXowJ2chvyygGF8+VqI4rh6JarLK22mis4wNJ4DuH@lists.infradead.org
X-Gm-Message-State: AOJu0YxvFbGSrRP5Z1+SXZYriNFpY0xA8mzhUWCRdmNG2zH5quZw4kCZ
	Akhbqv43owLRb81UNFUSM4CBD0EyhZIPI5CUlOVGR2xem6za+X6U/4FSidaoGClQUKr5ajNR1da
	7kEBvCaBLKdSqNgrJoFrnXxswCTm75lDgoIWjEOYk
X-Gm-Gg: AY/fxX463PhPdRt/dND35CLZq9fk9hpQ2875W0uji5/L1ePtS76CR3OV0eoKkxWMYif
	rwWH8uPDVIoyrc/32BzMswTvmIaB0cCXhNioteUMlqSSn3PxaEky6pueEWAsT+zcRZ1bVzhk+ct
	lc0GcdgyA1x7kWWCnxOQey433IyscO0rvZBD/5JjFGthAMqfYF9C8pCJVm3tulqfxPf9IF61DPT
	BdmG/o+Dp2X4k09BInVe9PDqwasAyo+ss04U94cykTt5VASXWdac1r4pkmL8PuY8fz3hjU+WY/8
	RGFkJP0=
X-Received: by 2002:ac8:5f85:0:b0:501:19ce:5bdd with SMTP id
 d75a77b69052e-502a2308428mr882991cf.6.1768504569294; Thu, 15 Jan 2026
 11:16:09 -0800 (PST)
MIME-Version: 1.0
References: <20251211104710.151771-1-tabba@google.com> <20251211104710.151771-9-tabba@google.com>
 <86h5smlxyo.wl-maz@kernel.org> <CA+EHjTzEtPta5VHr5R0r0v7ui7-8xv5me29uk2devZ=S14RHqw@mail.gmail.com>
 <86fr86lv3d.wl-maz@kernel.org> <CA+EHjTwX-kDg24LMHCyMVP3Xpdpv55WyP2AxeWXa5CKk1yyudQ@mail.gmail.com>
 <86bjiuda8g.wl-maz@kernel.org>
In-Reply-To: <86bjiuda8g.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 15 Jan 2026 19:15:28 +0000
X-Gm-Features: AZwV_QgcKJ5OhA7XfrB4ljMybieHt7byPPTTE3IaEVLHFanD5VjBl9f8hknoheQ
Message-ID: <CA+EHjTzMLEYH7f+=1MMv_oRfk9fEUge325RzhoFbPhNRa0W=aA@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_111611_543638_2F4F89F8 
X-CRM114-Status: GOOD (  38.48  )
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

On Thu, 15 Jan 2026 at 18:03, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 15 Jan 2026 16:14:39 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > On Thu, 15 Jan 2026 at 16:05, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Thu, 15 Jan 2026 15:19:48 +0000,
> > > Fuad Tabba <tabba@google.com> wrote:
> > > >
> > > > Hi Marc,
> > > >
> > > > On Thu, 15 Jan 2026 at 15:03, Marc Zyngier <maz@kernel.org> wrote:
> > > > >
> > > > > On Thu, 11 Dec 2025 10:47:08 +0000,
> > > > > Fuad Tabba <tabba@google.com> wrote:
> > > > > >
> > > > > > Certain VM IOCTLs are tied to specific VM features. Since pKVM does not
> > > > > > support all features, restrict which IOCTLs are allowed depending on
> > > > > > whether the associated feature is supported.
> > > > > >
> > > > > > Use the existing VM capability check as the source of truth to whether
> > > > > > an IOCTL is allowed for a particular VM by mapping the IOCTLs with their
> > > > > > associated capabilities.
> > > > > >
> > > > > > Suggested-by: Oliver Upton <oupton@kernel.org>
> > > > > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > > > > ---
> > > > > >  arch/arm64/include/asm/kvm_pkvm.h | 21 +++++++++++++++++++++
> > > > > >  arch/arm64/kvm/arm.c              |  3 +++
> > > > > >  2 files changed, 24 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> > > > > > index 5b564576160d..0fa8c84816fd 100644
> > > > > > --- a/arch/arm64/include/asm/kvm_pkvm.h
> > > > > > +++ b/arch/arm64/include/asm/kvm_pkvm.h
> > > > > > @@ -9,6 +9,7 @@
> > > > > >  #include <linux/arm_ffa.h>
> > > > > >  #include <linux/memblock.h>
> > > > > >  #include <linux/scatterlist.h>
> > > > > > +#include <asm/kvm_host.h>
> > > > > >  #include <asm/kvm_pgtable.h>
> > > > > >
> > > > > >  /* Maximum number of VMs that can co-exist under pKVM. */
> > > > > > @@ -43,6 +44,7 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
> > > > > >       case KVM_CAP_ARM_SVE:
> > > > > >       case KVM_CAP_ARM_PTRAUTH_ADDRESS:
> > > > > >       case KVM_CAP_ARM_PTRAUTH_GENERIC:
> > > > > > +     case KVM_CAP_ARM_BASIC:
> > > > >
> > > > > Can we instead rely on an existing VM capability? I'm not overly keen
> > > > > exposing something new to userspace (KVM_CAP_ARM_BASIC) for something
> > > > > that really is KVM's own internal problems.
> > > > >
> > > > > Looking at the history, a bunch of things have always been present:
> > > > > KVM_CAP_NR_VCPUS, for example. You could even #define
> > > > > KVM_CAP_ARM_BASIC to that if you want.
> > > >
> > > > I wasn't too crazy about that either. I like the idea of defining it
> > > > as an alias of KVM_CAP_NR_VCPUS. I'll do that when I respin.
> > >
> > > I've done something [1]. If that works for you, let me know and I'll
> > > just merge that.
> >
> > That works for the previous patch (7/9), which is where you've made
> > the change. But since the alias is defined in `arm.c` it wouldn't work
> > in this patch (8/9), because the function kvm_pkvm_ext_allowed() is
> > defined in  `asm/kvm_pkvm.h`.
>
> I dropped it from patch 8/9 for the reason below.
>
> > Defining the alias in `asm/kvm_pkvm.h`
> > or in `asm/kvm_host.h` should solve this, since both files are visible
> > in arm.c (and in kvm_pkvm.h in both cases).
>
> Nope. The compiler spots that this is the same value twice in the
> switch, and compile fails. I only kept it as syntactic sugar in arm.c,
> but I could otherwise drop it entirely.

I see. Thanks for fixing this Marc!
/fuad
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.


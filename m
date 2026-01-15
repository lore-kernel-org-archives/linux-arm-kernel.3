Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38C4D44C76
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 16:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADZclYBOIi/AqOnvkqBKuIp0Ei0sTC2tGmNVMMOBzb4=; b=kkmW2AnXc4N8MY9GM/uhGu5i0u
	Ray4WUV5+0/TOjMGQOQLkngKR/qFhk3C3WNaO+uUJcR8Ny/29XyzocjlPVV7pz174ni4dqxOv/GNB
	qnR1SMqxzK5LIjtNJQ16eM4pTAzaYR1FmxmmGhZYZZ3qPUdg309zdHV8M+gD6l6WvMuM1rFKKpo2Q
	aCfcsXgMUcQP6qo5aH6ohWMTnReXUjoHSwUQdW4hWxJjbIX6mDdamS/txBRQePFfTIs7gqQXuWwjJ
	evSi1wPuDXSZPm8ztJLvRlZCkrg1lHtLq2MBfzXd7VyWDXiCz4wNKKkh9ijS4lBH3di6VCsDtHOFr
	trjt1kjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ0K-0000000CfUe-1d13;
	Thu, 15 Jan 2026 16:15:25 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ0F-0000000CfTr-0kcy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 16:15:22 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5014acad6f2so452661cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 08:15:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768493718; cv=none;
        d=google.com; s=arc-20240605;
        b=eTAGI2zj9QYAyv8rY7nhwxyNoGondt4orjmpAMLAj0r9T+FbUOKsPLBcPGieW9f8rf
         Xtw2YwzHA9UMHZHtt6+Ggo70JcWalTB9+Ns2emCTwAfEqZsn2/QRuYWnVbmvt/Zj2W2G
         tq2CJ44BdAAimNfIDffZnkuPyWL9wPocqeTIY/Sjwvexd0SMsq1oBLfryGqa4HCqZU1z
         GP7+WbHtc6EsL05/8Ohoo1l1fx3QtLCm2aoVTFiy/dLa9NRn8+OY05fM8eGKUR2a46E4
         JEoMaautwfBD3uIBfasKNZdN/FGrqGRMle4kbzpFvGoQxcXBATvtbHNS3iB8xeu4XcUC
         5xqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ADZclYBOIi/AqOnvkqBKuIp0Ei0sTC2tGmNVMMOBzb4=;
        fh=n1tJ3pst2P02CDTH8nsKq/gvVEn/Ugga0AAEXKBjFno=;
        b=jdQu4AkBi+FDOEFCi3yP5zQULnGW9MIx7v6YdwlYDFoyaLqOtwK+N5g5PikCp0U1yr
         Z2SfZdPKEePPw12rHOg0N0ZPmvEjx9Ni2fr0nGWjEnNDDb+OdIIgJ3qks4pTj4eLsEi/
         G6qkyFSMVeUQIEo+ng/OyO9tC/I8rpHbTsOBVf4pIIQAHvFlsTUhSh/m3oJnjVk2ISU2
         Doz0+xBqqkPQlaaZiU/nuWwIbEbePEV5g7Wys6Qt1jxyK6JugH+6E50y7HVz6iALV0AJ
         jxywdHv5byRP1FoT5aTqHhE3xP6po3AKs7xqErTNFHFxbhoYqm3ExVgIC2c7OUiezA07
         PQiQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768493718; x=1769098518; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ADZclYBOIi/AqOnvkqBKuIp0Ei0sTC2tGmNVMMOBzb4=;
        b=0TLQcKfDCOIKlRuUenyYmUOUt1QPmown4Cbg0daKiQvvr6u+V45mnQGYXSto/PtjAH
         q1M2Tu9K3qyd1L+Qu/ddDRxMnprRNCoIRuUorYXVJ0tskoMJsXYiO3N6mMdoiTsO2hge
         z0pSPosXLWttaNEdzsqkQHpo4sdJvrpXyADqq8wxQzdhd6K2HOVJfrokVrWeJPsZ+5sR
         Zwc+AuYpKtLFRyjhyDPqCBdmbVFZbjDL75kFuVJqnCFSDbt4aDf/jNMLlDIqTRC10q4V
         6E7oAbRsHpnYPmVNCXa9mbhDZIyVwiacx5fnHzd08gt7kCVL7NuaSnYeTawtwDpLl3TG
         tmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768493718; x=1769098518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADZclYBOIi/AqOnvkqBKuIp0Ei0sTC2tGmNVMMOBzb4=;
        b=qPBXlgCap+bx7frozw/c8gYrTs7y0K3rSXQyT/3mUnCcajBwTeH8qWgU2rkD/lWPTN
         rjMgSB5qyz7B+WLG3Xt7LKzIrOwKDD+BDqCwI2K050zQh5MYGwEdSgdD287hpjzObNbv
         m0gAx3rCpqOMhYxSiSsdVbDHH32FpPQzWkcfPEaCPsRZzpE2+pxVX5uhplOmcCE6iREe
         5cex4/GKmCDIDLg5IqOf79fX+YLVM4+RvLwEiY23xGTUdebCb8hP5e/HkanHzh/L/Ap4
         D3N5aCSF6wgXf8ZFLnbvdrlhDOE6rxbHt7ZDeTDmhATBxEQe4eAeRzNqauAd3gHIKexA
         6KIg==
X-Forwarded-Encrypted: i=1; AJvYcCVP+f+DANsX9b4XnUJ7GfS8MQqsAtLX5CzM8+x7Ok5hEzIA+Pqa5wYabimMFy78ZIpJBqN+imfzqdDPxI4zwmUx@lists.infradead.org
X-Gm-Message-State: AOJu0YzsRMiBDh5t36irJp9jqBBFaUS2Dm2V/l/zf2Q3w25hJkT57ayM
	U6pyA10jT88/MCHsH6246fKihYw8hNYCL4S4VD5MRjvNbSZugTOpilo+j45F/C0pcguMUzUXeeG
	nGiIF2GZieul5uYQpRx1VOvqDUcA3kTozGTTiEzOk
X-Gm-Gg: AY/fxX7TVghKj0c/Jly8KrCKPHsCnr2FFNO3YlfvYkvEJw3imwD92iPvDr2+heHk3sS
	YKthKQhos3muoz7hUAxVKtyRh1ji9cZ21tiwaxJB9ELx1/r9e0iu+tpTzTWjpEYyZV2AcI8a9C4
	0ix63CX37FmAm1yjfC5f77nAG49Gs+s5qYCThh81N0pDc6yygNb6pnFnWKauHtCRNzp/hjwnBEO
	+TIXeXB3csiuyypxQ6vrxL1PNXbg3eN3H95ZC9GhUIX63pN37hkJMghQL/R5BbCxWHZ5inc
X-Received: by 2002:a05:622a:1990:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-5026ecd9f86mr9214711cf.1.1768493716769; Thu, 15 Jan 2026
 08:15:16 -0800 (PST)
MIME-Version: 1.0
References: <20251211104710.151771-1-tabba@google.com> <20251211104710.151771-9-tabba@google.com>
 <86h5smlxyo.wl-maz@kernel.org> <CA+EHjTzEtPta5VHr5R0r0v7ui7-8xv5me29uk2devZ=S14RHqw@mail.gmail.com>
 <86fr86lv3d.wl-maz@kernel.org>
In-Reply-To: <86fr86lv3d.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 15 Jan 2026 16:14:39 +0000
X-Gm-Features: AZwV_Qjxkf37x4xlkb_vNXX6DSUwpmJb6vgEZyD9bK2AvVgSh62ISFpVaKTdQlM
Message-ID: <CA+EHjTwX-kDg24LMHCyMVP3Xpdpv55WyP2AxeWXa5CKk1yyudQ@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_081521_721791_B35A6595 
X-CRM114-Status: GOOD (  32.68  )
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

On Thu, 15 Jan 2026 at 16:05, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 15 Jan 2026 15:19:48 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Thu, 15 Jan 2026 at 15:03, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Thu, 11 Dec 2025 10:47:08 +0000,
> > > Fuad Tabba <tabba@google.com> wrote:
> > > >
> > > > Certain VM IOCTLs are tied to specific VM features. Since pKVM does not
> > > > support all features, restrict which IOCTLs are allowed depending on
> > > > whether the associated feature is supported.
> > > >
> > > > Use the existing VM capability check as the source of truth to whether
> > > > an IOCTL is allowed for a particular VM by mapping the IOCTLs with their
> > > > associated capabilities.
> > > >
> > > > Suggested-by: Oliver Upton <oupton@kernel.org>
> > > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > > ---
> > > >  arch/arm64/include/asm/kvm_pkvm.h | 21 +++++++++++++++++++++
> > > >  arch/arm64/kvm/arm.c              |  3 +++
> > > >  2 files changed, 24 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> > > > index 5b564576160d..0fa8c84816fd 100644
> > > > --- a/arch/arm64/include/asm/kvm_pkvm.h
> > > > +++ b/arch/arm64/include/asm/kvm_pkvm.h
> > > > @@ -9,6 +9,7 @@
> > > >  #include <linux/arm_ffa.h>
> > > >  #include <linux/memblock.h>
> > > >  #include <linux/scatterlist.h>
> > > > +#include <asm/kvm_host.h>
> > > >  #include <asm/kvm_pgtable.h>
> > > >
> > > >  /* Maximum number of VMs that can co-exist under pKVM. */
> > > > @@ -43,6 +44,7 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
> > > >       case KVM_CAP_ARM_SVE:
> > > >       case KVM_CAP_ARM_PTRAUTH_ADDRESS:
> > > >       case KVM_CAP_ARM_PTRAUTH_GENERIC:
> > > > +     case KVM_CAP_ARM_BASIC:
> > >
> > > Can we instead rely on an existing VM capability? I'm not overly keen
> > > exposing something new to userspace (KVM_CAP_ARM_BASIC) for something
> > > that really is KVM's own internal problems.
> > >
> > > Looking at the history, a bunch of things have always been present:
> > > KVM_CAP_NR_VCPUS, for example. You could even #define
> > > KVM_CAP_ARM_BASIC to that if you want.
> >
> > I wasn't too crazy about that either. I like the idea of defining it
> > as an alias of KVM_CAP_NR_VCPUS. I'll do that when I respin.
>
> I've done something [1]. If that works for you, let me know and I'll
> just merge that.

That works for the previous patch (7/9), which is where you've made
the change. But since the alias is defined in `arm.c` it wouldn't work
in this patch (8/9), because the function kvm_pkvm_ext_allowed() is
defined in  `asm/kvm_pkvm.h`. Defining the alias in `asm/kvm_pkvm.h`
or in `asm/kvm_host.h` should solve this, since both files are visible
in arm.c (and in kvm_pkvm.h in both cases).

Cheers,
/fuad



 > Thanks,
>
>         M.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=kvm-arm64/pkvm-features-6.20&id=8823485a697de5c280a7a2632620338722f16663
>
> --
> Without deviation from the norm, progress is not possible.


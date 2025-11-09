Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B9DCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 19:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxR6AO2B/jl6sBl+TPdH+gIFub+ESvkBEdXOIWya/Nk=; b=lRZg8PrycCPuu9Ags4nCUhGSct
	ObhKSd3LFUFv/GVOqVBEe3aNbkpPRBfA/P1+L489+TfNfZzG8QUhjnCWwXNN3g0TRTWQfpJ73Ka16
	DVsvnQKPZFyv9/ECTYxFWIJEgY7LkG+YFm9KOlKjyVDzf4rDGj8tZWtl9830xPchdCdun03LuWwmF
	1iKStTGJB5plRfP9uDlkYnT9SjB+Jn+BIJw5xbSKXlGD4JLKFwfb8ez326X1KfQIr9P2IeDEUBu/x
	FLUvG1QD0SgFs8+f9Ygl7CnYX3ElubBsOwPXwuB5mT7MVsxx5EZq3xuLHSbZHuqfFd7ERn1NJyppM
	IWqAAnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIBSg-00000004LaY-3gvO;
	Sun, 09 Nov 2025 19:52:30 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIBSe-00000004LZZ-2daX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 19:52:29 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4ed6ca52a0bso317621cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 11:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762717947; x=1763322747; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xxR6AO2B/jl6sBl+TPdH+gIFub+ESvkBEdXOIWya/Nk=;
        b=Qa6Xk9MEflEGNtPzqI9EVCFsPJ6a69Kfk2Awm3yjtT0Q8/gG/Qoa8W986oy7T3PjAQ
         pZ6g0TO8LVsWBb1wJ1ovBQ9Dy/OxqeVtfCn5Ho6wYDp9qYRovHzflvnHC+RFS5A3uiY1
         mYO4A87rQSCwFw1tz151NFhquKfCl9fMBTdEo9AvGJhYHawvZDMzobX8wJuH+Xs6Dfv3
         B8f0x4bCrKWiIi8dIzDm/K9sxOjuqiilNcsdtuBIM9nQJbiv2Z7az3ELMTOxFAaawwoe
         NdC4XwPFzWLNjr23lBf75XU8jIIOxAm5j2Ol+pSeL2zbx0wBBd8gc+LAK3SIhTAxro82
         jItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762717947; x=1763322747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxR6AO2B/jl6sBl+TPdH+gIFub+ESvkBEdXOIWya/Nk=;
        b=PS8g+IHsQUy0w+VsPTLAhl78aOb/DU1Psp0b3mrwLkPGTTr7Vw/Mgf/YiJpBfEEp/u
         7cjZxTs8x7Oj7HfUER3Ak4bLaGL02dXdSs26oVm8wf2+SmdvvoqLvabuRGigdhdB6cwm
         oGXL2UeEIf1JwK3qPMyGcnYlvvKYsG7h1UcA27dbcuW86pW/V8AxRAOFZGlrdmHUtJG9
         LdxHkNNFSgtnqJEspEHdztZJOf+bWG6GhuY0konUl1eASN9QmZbe2kStRTnoDMdHizw1
         dN/2iO8UsVJsXjyVrjGOUvlIqXCqNmbn+iSrTxjdaaaxmP9eHeI+BnDNvciQBbK0qnY+
         +pQA==
X-Forwarded-Encrypted: i=1; AJvYcCXhyHnHLGOKZifhuDcTHgrMeHLkzCaMuS6o4fT5p+yTXtWy39p+hTx1pZnIFI+xc2gkFaKtVnigv52GZzTZKPLl@lists.infradead.org
X-Gm-Message-State: AOJu0YywAHbEyhDWmq/UeZyCeYvVp4y6amL8ROelfYv2qQjRDNTVOtma
	pcCgjCc9zZQz624RXNQupoFMwokMMa3igW1U3cUP9kJW0XWlVJ0BLlDsoZhRXBEUG+FtsW3MMOb
	06uH0nd+2cDZwOFAtinjP42TW2SWjIsuQ/nAi1sXc
X-Gm-Gg: ASbGnctKW5ishjun2CnCpCRv1guLxfE8il47z936N7mz2MhRt955J224gL0QesiJMk7
	2MnHn11bj0wJr4nmiVcIiraJhaRtDEQRlffVBaTwQZbRSYkdHArJC4QgbTru4VAaPxui74DfmtO
	kTwubJfm5boUZeQoIodxwHC1h/3jA8D8KuWaorClWO8aw1ym+I4I0vkLCHVGhOtI9BS2RgtuYnj
	ajSAPuib4Pzn+UetBN1GqSl+UWaypGtZ0NvdvhuPJLXTAssEL9Oan6RHCLI
X-Google-Smtp-Source: AGHT+IHJSNuyAe+Uxnb5byLMLhBxTCB9wY6uFCm/p+xazecRp4xYXv0GsvkhIaq1bmYoMG8A6aq02n8SHCv+pR7YX+Y=
X-Received: by 2002:a05:622a:2cc:b0:4ed:8103:8c37 with SMTP id
 d75a77b69052e-4eda4e2c1abmr10604291cf.12.1762717947186; Sun, 09 Nov 2025
 11:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20251106144418.2847443-1-tabba@google.com> <20251106144418.2847443-6-tabba@google.com>
 <aQ580W6SU1lGbd_D@kernel.org>
In-Reply-To: <aQ580W6SU1lGbd_D@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 9 Nov 2025 19:51:50 +0000
X-Gm-Features: AWmQ_bkltSpteSq6mNSrRDyI0IRhsoYujO6S4KSBeDrZfrq3926fOivxRsnvq9c
Message-ID: <CA+EHjTxwGEb0vPWNT7C8Gg6zhETk1C_dGhJ2+a9E+eJ84hvshA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] KVM: arm64: Define FAR_MASK for fault IPA offset
To: Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_115228_683169_AEE83762 
X-CRM114-Status: GOOD (  25.06  )
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

On Fri, 7 Nov 2025 at 23:12, Oliver Upton <oupton@kernel.org> wrote:
>
> On Thu, Nov 06, 2025 at 02:44:17PM +0000, Fuad Tabba wrote:
> > This 12-bit FAR mask is hard-coded as 'GENMASK(11, 0)' in several places
> > to reconstruct the full fault IPA.
> >
> > Define FAR_MASK for this value in the shared header and replace all
> > open-coded instances to improve readability.
> >
> > No functional change intended.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_arm.h         | 2 ++
> >  arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c | 2 +-
> >  arch/arm64/kvm/inject_fault.c            | 2 +-
> >  arch/arm64/kvm/mmu.c                     | 4 ++--
> >  4 files changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> > index 1da290aeedce..e995e9b3a0c4 100644
> > --- a/arch/arm64/include/asm/kvm_arm.h
> > +++ b/arch/arm64/include/asm/kvm_arm.h
> > @@ -343,6 +343,8 @@
> >  #define PAR_TO_HPFAR(par)            \
> >       (((par) & GENMASK_ULL(52 - 1, 12)) >> 8)
> >
> > +#define FAR_MASK GENMASK_ULL(11, 0)
> > +
>
> This seems really confusing to me, since FAR_MASK sounds like it
> represents the meaningful bits of FAR_ELx. Perhaps something like the
> following would better represent intent:
>
> #define FAR_TO_FIPA_OFFSET(far) ((far) & GENMASK_ULL(11, 0))

Sounds better. I'll change it.

Cheers,
/fuad

> Thanks,
> Oliver
>
> >  #define ECN(x) { ESR_ELx_EC_##x, #x }
> >
> >  #define kvm_arm_exception_class \
> > diff --git a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
> > index 78579b31a420..22898ed4dd6f 100644
> > --- a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
> > +++ b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
> > @@ -44,7 +44,7 @@ int __vgic_v2_perform_cpuif_access(struct kvm_vcpu *vcpu)
> >
> >       /* Build the full address */
> >       fault_ipa  = kvm_vcpu_get_fault_ipa(vcpu);
> > -     fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
> > +     fault_ipa |= kvm_vcpu_get_hfar(vcpu) & FAR_MASK;
> >
> >       /* If not for GICV, move on */
> >       if (fault_ipa <  vgic->vgic_cpu_base ||
> > diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> > index dfcd66c65517..8ef3453696a2 100644
> > --- a/arch/arm64/kvm/inject_fault.c
> > +++ b/arch/arm64/kvm/inject_fault.c
> > @@ -258,7 +258,7 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
> >       unsigned long addr, esr;
> >
> >       addr  = kvm_vcpu_get_fault_ipa(vcpu);
> > -     addr |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
> > +     addr |= kvm_vcpu_get_hfar(vcpu) & FAR_MASK;
> >
> >       __kvm_inject_sea(vcpu, kvm_vcpu_trap_is_iabt(vcpu), addr);
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 7cc964af8d30..21a9442f9b1e 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1959,7 +1959,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
> >
> >               /* Falls between the IPA range and the PARange? */
> >               if (fault_ipa >= BIT_ULL(VTCR_EL2_IPA(vcpu->arch.hw_mmu->vtcr))) {
> > -                     fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
> > +                     fault_ipa |= kvm_vcpu_get_hfar(vcpu) & FAR_MASK;
> >
> >                       return kvm_inject_sea(vcpu, is_iabt, fault_ipa);
> >               }
> > @@ -2059,7 +2059,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
> >                * faulting VA. This is always 12 bits, irrespective
> >                * of the page size.
> >                */
> > -             ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
> > +             ipa |= kvm_vcpu_get_hfar(vcpu) & FAR_MASK;
> >               ret = io_mem_abort(vcpu, ipa);
> >               goto out_unlock;
> >       }
> > --
> > 2.51.2.1041.gc1ab5b90ca-goog
> >


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F3CD78326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuoJI3+9b4DhTXF6MzkEBOqdB10jGfOvJOhA0wuCACY=; b=t2ZyEoXyk6RHkgTtstt72pua/i
	wDAa7ieHR4uVjm/yEKFFdKyT2YjqhK+vYzeL53pz9FbrdyZMgjEZCusL5JcQibdRNHfYLGHMGkz4R
	kNsr1bCOuwQQI/jgTxgLdnNaZfOImMyyMlHPZtos9Vi2uQzZW6CPvS4BRTEBozvmuBcCgbq6SXbyi
	6iaAPXNDzAWK0FzHpV8gLcHrDxc41TKSkEJIHL5Dc2XI1PYZbNIvXuooFm9msPgN+q8HALeT1N7Yz
	rkyNJ6pRXIfYawePP5Y9JSQUPot0DgSknZIlaoXI2mAUqp+Isf33nT/aPRse6SmpiXk7H7YyRU19A
	2QvxTJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7k3-00000006WSG-3arK;
	Mon, 02 Dec 2024 14:49:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7j4-00000006WHW-0rdl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:48:39 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4349ea54db7so229785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733150916; x=1733755716; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kuoJI3+9b4DhTXF6MzkEBOqdB10jGfOvJOhA0wuCACY=;
        b=tokq8nq3a0JeQPOaJrjIvMzTuMU78inU1x8NP4iygLgtckI6tp8Gg40Czb5h8YqY9Y
         9m7u5u9BmP8qHxjKiMGYRo2Hl4BjAbBZJ5hSoco/tjwCPPMMVc6XQ0lnY0LuISBoTGC8
         l32wqby5TQvaXE24QHE2N66FCEMuA7EZ4DF6QRzYWE7zkNrbM+mWNtU+zArj5XZFPq7H
         rBOZ1ap+PFGDlvLi5gCCMAtvitjX8mmmnGBU3vb6wKVeDkjkTu5g0F8Mg2wkFwRV/92S
         We/O6tEP5ZDRSr1XGbcx24F4sBNaCvMrx0THacq7lOT0dtjrkHPBxwQ/SbBnnnxGjib7
         m3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150916; x=1733755716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuoJI3+9b4DhTXF6MzkEBOqdB10jGfOvJOhA0wuCACY=;
        b=LZdCP7AvY+OR+gR+q0Oa32N7cfCJPX0VyntFF2itSnFYKgUw4ZP4Z5axrFEavREAEf
         MvpuXOiDy/ruyUe1jEp9Ut/+KFCyxIxrTruBzPc7sIaL36VQkL4t1MXDo1drtDHdWSv5
         V80ZLLHCcxSNdvay0CWQWkxw9VpNWzOZqC/Czmq9Wy2GMdUMOWlgX2ZobRgjaF2+G+lP
         1l4LItS1f6E8MTD52TCk99CgJPvOR5etOHQLO6NfDLQHCUJ1M9IIJsGOLNXFS00gpeMe
         9f7tnPAXGB3KT48/yrb0TSlpsQvzRNddbnp3q8ITVsITbVIE9rbczkljjsqr3RUMk2Fh
         8Q+w==
X-Forwarded-Encrypted: i=1; AJvYcCUg7TECJeCtvA/B15O2ztXQ9fZnByv/7oa4+pGz8Pbt3lr48d2QVcdsQMt4OkFiGlmqZxj71Uuh4uYE/CN78Pfx@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs9NSa9lfob08aUeVnd3tJYEBSTZSIhtl/86tY25XPX9VfgyxP
	b0Vm8Z9uGjQ1KE/vJ8naHBl1asGMJaC3LR63dnXWGV5L69dWBEMQN8H5AQXcihJFDHOQ7K9qmxc
	xQ2ZegTj5TwLzFP4wIq1BUvcgCkFWPYpJNizO
X-Gm-Gg: ASbGnctefTS6+uH6hZnNklwD6LqpLa5rEIS3iMP3SgDsibHPaympcTDIbCSQCHeGn+/
	cHGjNzLIsh6DbUBM1t3bgKdALVGm9UQ==
X-Google-Smtp-Source: AGHT+IH+RHZF5RillqOjxyrN+kl1K9NyowcjP13Axo/IJklX7DvsBhh9bTUsEaXTK8MaqJ0VHpeIHFGvXkvmMGcR8m0=
X-Received: by 2002:a05:600c:6a88:b0:42b:a961:e51 with SMTP id
 5b1f17b1804b1-434b0401690mr4828385e9.0.1733150916001; Mon, 02 Dec 2024
 06:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com> <20241128123515.1709777-15-tabba@google.com>
 <864j3nv9tk.wl-maz@kernel.org> <CA+EHjTyXj6NhUcxTfER=zPz3VOtd+HgqpfmyfR88cVyiXoxqwA@mail.gmail.com>
 <CA+EHjTysFaaxGBo212e8kSHi_VkpXx6N6ddxwB0UGC6bSoK0gA@mail.gmail.com> <86v7w2taxq.wl-maz@kernel.org>
In-Reply-To: <86v7w2taxq.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 2 Dec 2024 14:47:59 +0000
Message-ID: <CA+EHjTyzAcMPspvO8cAp=0_-i6hJHw2y--eieNkjZk2AuzG5FQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] KVM: arm64: Convert the SVE guest vcpu flag to a
 vm flag
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, james.clark@linaro.org, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com, 
	kristina.martsenko@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_064838_243856_6E56D766 
X-CRM114-Status: GOOD (  35.81  )
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

On Mon, 2 Dec 2024 at 14:29, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 02 Dec 2024 12:57:44 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Sun, 1 Dec 2024 at 16:01, Fuad Tabba <tabba@google.com> wrote:
> > >
> > > Hi Marc,
> > >
> > >
> > > On Sun, 1 Dec 2024 at 12:58, Marc Zyngier <maz@kernel.org> wrote:
> > > >
> > > > On Thu, 28 Nov 2024 12:35:14 +0000,
> > > > Fuad Tabba <tabba@google.com> wrote:
> > > > >
> > > > > The vcpu flag GUEST_HAS_SVE is per-vcpu, but it is based on what
> > > > > is now a per-vm feature. Make the flag per-vm.
> > > > >
> > > > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > > > ---
> > > > >  arch/arm64/include/asm/kvm_emulate.h    |  6 +++---
> > > > >  arch/arm64/include/asm/kvm_host.h       | 10 ++++++----
> > > > >  arch/arm64/kvm/hyp/include/hyp/switch.h |  2 +-
> > > > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  2 +-
> > > > >  arch/arm64/kvm/hyp/nvhe/pkvm.c          | 11 +++++++----
> > > > >  arch/arm64/kvm/hyp/nvhe/switch.c        |  8 ++++----
> > > > >  arch/arm64/kvm/hyp/vhe/switch.c         |  2 +-
> > > > >  arch/arm64/kvm/reset.c                  |  2 +-
> > > > >  8 files changed, 24 insertions(+), 19 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> > > > > index 406e99a452bf..ae6d0dc0e4ff 100644
> > > > > --- a/arch/arm64/include/asm/kvm_emulate.h
> > > > > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > > > > @@ -620,7 +620,7 @@ static __always_inline void kvm_write_cptr_el2(u64 val)
> > > > >  }
> > > > >
> > > > >  /* Resets the value of cptr_el2 when returning to the host. */
> > > > > -static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
> > > > > +static __always_inline void kvm_reset_cptr_el2(struct kvm *kvm)
> > > >
> > > > I'd rather you avoid the resulting churn:
> > > >
> > > > static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
> > > > {
> > > >         struct kvm *kvm = kern_hyp_va(vcpu->kvm);
> > > >         [...]
> > > >
> > > > which does the trick at zero cost. It is also more logical to keep the
> > > > vcpu as a parameter, as the per-VM-ness is only an implementation
> > > > detail.
> > >
> > > The reason for the churn (here and below for vcpu_has_sve()), which in
> > > hindsight I should have mentioned in the commit message or as a note,
> > > is that this code is called by the host kernel (e.g., in reset.c), and
> > > by the hypervisor). For nvhe, we need kern_hyp_va(), but not for the
> > > host. Should I gate the va conversion with is_hyp_nvhe()?
> >
> > I spoke too soon. Your suggestion results in less churn, and of
> > course, solves the issue I had with kern_hyp_va.
> >
> > I did have to convert kvm_reset_cptr_el2() into a macro, because it
> > now needs kern_hyp_va(), defined in kvm_mmu.h, which in turn includes
> > kvm_emulate.h. But since it's __always_inline, it shouldn't make any
> > difference in practice.
> >
> > If this conversion to a macro is alright by you, I'll respin this.
>
> If you can convert it to something like:
>
> static __always_inline void __kvm_reset_cptr_el2(struct kvm *kvm)
> {
>         [...]
> }
>
> #define kvm_reset_cptr_el2(v)   __kvm_reset_cptr_el2(kern_hyp_va((v)->kvm))
>
> that'd be great, as it keeps the body of the function as C code, which
> helps with debugging.

Will do, thanks again!
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.


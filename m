Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFDACFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 16:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDrq4Mc2hK/U8sfxbgazMAArpTKo1U5Tb3vPp4StZnw=; b=RNyAHfBySz0S7nSapyhS3vTUJ3
	h2PUdHGubL1UPo7/FSJ07aR6QoXsJk9Kq8dnVxC5vaY0TOAB/QG7LMPvZTMh1hSkd9wSe0/2phN/k
	SZoPkYdzUaw8K3pSp+Ux+4IzFUEkn6aQ+3gkOtA3b2497RyYY4E7GRn5N2XAqfCML3Zgr3Sbkv6q4
	Np+anhMdDGcE/ofxx+LVhoHtDeOJfXMtqunWJH7+nHLHsD4FfVhB9krboOMHRzP6X7YjLH4j4rsPo
	iTCmIz8m8vnCr82vNxWD27ZMOFCSfjqcKPCJcWI4cvPEMAH5S0Q01LmWrjKV7vsnEFEpffc8EJ2GU
	M3rBtuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOen5-0000000GvIA-3DmH;
	Thu, 27 Nov 2025 16:24:19 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOen2-0000000GvHU-0ljp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 16:24:18 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4ee147baf7bso294211cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 08:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764260655; x=1764865455; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KDrq4Mc2hK/U8sfxbgazMAArpTKo1U5Tb3vPp4StZnw=;
        b=SSIc+VYaHUmD3rpHETEWvgnplH20dkt7NPOrEnpUsxYN5YekD8osmfNi/rd0837JfP
         wUC9WTmg1kyedNeK2JSSGaTl5Ej89x0C9dMv9FoYiX9I74bqnoCPhw5VXZfL845Cg32g
         O91rqaszq16pOW09wPV5C8/bzUtYWEdumJhf7RX1PIl9rUaf8ynqhVz+O5yDrUm5hXUi
         gErXWAzPTBzwao2TfLiG4+8jSvVhR3sOjbvA0iesLmID2l/h3uTxnpTZMoDqQMn0Tt7E
         xpVWG08wwgSDtet6OSpQ+IhWUxR9gJirULVJ++p+so39rvZSVvex+E4dxNwHxPP2+SqV
         hMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260655; x=1764865455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDrq4Mc2hK/U8sfxbgazMAArpTKo1U5Tb3vPp4StZnw=;
        b=A16RB/hcGLbnZOqPG5idwDORzsBmBqWdyXiRUizoj4omwcQebMbAn33Wg1DNHI4nRG
         uN8kKZMNqZ8cY5BUnaaQ0ZUGPvHPRieIbq484nq1jT2alHlQO8v0VCek+RiJlTXBLTMI
         7F3gkjXMsJpDecOfCjUvGx5X9LoWj2ZXUa1R01koKiLQ6jB9nQDfCAO9HwFAKnVlnbCh
         r7XTQ102sCwToVIWC30YYzWChmiJGDth5BeLf2a5yehUG0E0KViPh/Gr+gbp/ZNXESnn
         cIgaUKdqlaUZSrxGIsIBBIuqvkPjY+RmeweZDTDsLw7xKkYGLR8g506XmoQF84nd7eGU
         yanA==
X-Forwarded-Encrypted: i=1; AJvYcCXBpvuT76htnq2SzNmrC8zkMxMWLCk5nVIiVrEFAScIf+vqFPR5WmaTx3A/gmqShHL49o+VBP0j17CSuo3dDqmF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3+hXi5iaU/owZnNqvOvlZSXIQRjGDPGuPGSFPbppjWQ5GoDS9
	/b+KstZ9YgvNH4YkeSnWSC060PQhWyQLjG/ofX+UHUYTMUoFg5d+rHnIJ4jfT5pvtGuznUDf2QW
	2ouCBgWDPzS4Ig7CnhsleCb4apF7M6Iv0vjETRARG
X-Gm-Gg: ASbGnctHPDsTvEn6LR7AFgUZDJ1rxXi6P4Iy3ZaAZoqAfHSoCwFECR1cE5UrJ/XFqDO
	EpinAtMKDcKlE78jI3ksT2NlHNA5otgjM65Zlm/EAdRICRmZ44bjJgPNA5Yv0+sXi6lQZPqyIdb
	YVqGQpr0Zdd13RMJMK+Oa/g3lOMim/aFLUzMuHm1pONDmuieewTia3jx7GkTgNAzRTq2Y0x2Ag8
	3bXF8Ai8PTbh5uP0lV9GxV9LmRrslR+vw/pnj+oIokXoikOhGUDvHj4uCMU3QH4BS5j624=
X-Google-Smtp-Source: AGHT+IHUROWxuoISlEOryPuGRbWM6oCmISGZW+YubY2toLfzoVx3V91s8k+8Qv7E/WvcOmzpN43HiE9VuLU76nSzyVs=
X-Received: by 2002:a05:622a:15ca:b0:4eb:7681:d90 with SMTP id
 d75a77b69052e-4efd0ca4493mr4908951cf.16.1764260654699; Thu, 27 Nov 2025
 08:24:14 -0800 (PST)
MIME-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com> <20251118103807.707500-3-tabba@google.com>
 <868qftqehe.wl-maz@kernel.org> <CA+EHjTwHrLhdHrNSA8f-+bCZ1-QEuNocQQxeiaaost9oLwaG5A@mail.gmail.com>
 <865xaxqal2.wl-maz@kernel.org> <CA+EHjTxhOvu-733Z-gJgc6f_EAs-tksA6u5KuQZeimP6T6M-fQ@mail.gmail.com>
 <7f1c187b-0f94-49c5-b4c9-2f414ab0ac8a@linaro.org> <CA+EHjTxpTKFQwWHR6vBVxC_a6dpza_bgCmxTXSbWjT7wfJh2TA@mail.gmail.com>
 <7dadacee-b95d-49a2-88b0-73367dab25ed@linaro.org>
In-Reply-To: <7dadacee-b95d-49a2-88b0-73367dab25ed@linaro.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 27 Nov 2025 16:23:37 +0000
X-Gm-Features: AWmQ_bkf0yOaE3gheZNJ4N8MjFaCXAfQTgEbm5B-UzmgIGp-A6s4wvhZ9Jzyj3E
Message-ID: <CA+EHjTxNLMYH-jejcv-aJXieSnXDvGn0q1CS2vXz3eczre0QPg@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
To: James Clark <james.clark@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_082416_249962_45D4C48A 
X-CRM114-Status: GOOD (  33.81  )
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

On Thu, 27 Nov 2025 at 16:06, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 27/11/2025 3:38 pm, Fuad Tabba wrote:
> > On Thu, 27 Nov 2025 at 15:26, James Clark <james.clark@linaro.org> wrote:
> >>
> >>
> >>
> >> On 26/11/2025 11:48 am, Fuad Tabba wrote:
> >>> On Wed, 26 Nov 2025 at 11:47, Marc Zyngier <maz@kernel.org> wrote:
> >>>>
> >>>> On Wed, 26 Nov 2025 10:37:57 +0000,
> >>>> Fuad Tabba <tabba@google.com> wrote:
> >>>>>
> >>>>> Hi Marc,
> >>>>>
> >>>>> On Wed, 26 Nov 2025 at 10:23, Marc Zyngier <maz@kernel.org> wrote:
> >>>>>>
> >>>>>> On Tue, 18 Nov 2025 10:37:59 +0000,
> >>>>>> Fuad Tabba <tabba@google.com> wrote:
> >>>>>>>
> >>>>>>> The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
> >>>>>>> register accesses. These accesses are trapped to EL2 when the bits are
> >>>>>>> clear.
> >>>>>>>
> >>>>>>> The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
> >>>>>>> had the polarity inverted. When a guest did not support the Trace Buffer
> >>>>>>> feature, the code was setting E2TB. This incorrectly disabled the trap,
> >>>>>>> potentially allowing a protected guest to access registers for a feature
> >>>>>>> it was not given.
> >>>>>>>
> >>>>>>> Fix this by inverting the operation.
> >>>>>>>
> >>>>>>> Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
> >>>>>>> Signed-off-by: Fuad Tabba <tabba@google.com>
> >>>>>>> ---
> >>>>>>>    arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
> >>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> >>>>>>> index 8d06a246dfd1..f6f8996c4f97 100644
> >>>>>>> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> >>>>>>> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> >>>>>>> @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
> >>>>>>>                 val |= MDCR_EL2_TTRF;
> >>>>>>>
> >>>>>>>         if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
> >>>>>>> -             val |= MDCR_EL2_E2TB_MASK;
> >>>>>>> +             val &= ~MDCR_EL2_E2TB_MASK;
> >>>>>>
> >>>>>> This does not only change the trapping logic (bit 24). It also change
> >>>>>> the ownership of the buffer (bit 25). I wonder whether you should do
> >>>>>> something for that, maybe by clearing TRBLIMITR_EL1.E, because
> >>>>>> otherwise, you keep tracing, but using an EL2 VA. What could possibly
> >>>>>> go wrong?
> >>>>>>
> >>>>>> Overall, I'm very uneasy about TRBE in the context of pKVM.
> >>>>>
> >>>>> So should we clear/restore TRBLIMITR_EL1.E on guest entry/exit in
> >>>>> protected mode?
> >>>>
> >>>> I think you need something of the sort, yes. Overall, SPE and TRBE
> >>>> should be aligned on what they are allowed to do, as they are two
> >>>> sides of the same ugly coin.
> >>>
> >>> I'll fix this (or add a patch to do this, depending on how it looks)
> >>> when I respin.
> >>>
> >>> Cheers,
> >>> /fuad
> >>>
> >>
> >> To understand this, is it just belt-and-braces because you don't trust
> >> the current filter clearing in TRFCR_EL1? And to reduce the potential
> >> for mistakes leading to trace leakages? I suppose even the hardware
> >> itself could have some errata where it tries to access the buffer, even
> >> if we've completely filtered out trace and flushed before going into the
> >> guest.
> >
> > Yes, we don't trust the host. The pKVM threat model is to protect
> > against a malicious host.
> >
> > Getting into hardware errata... that's a can of worms. I haven't
> > considered that.
> >
> > Cheers,
> > /fuad
> >
> >
>
> But the hypervisor already clears the filters, equivalent to clearing
> TRBLIMITR_EL1.E. Which is why I was wondering if there was something
> extra on top of the model where the host isn't trusted. I would assume
> that without anything more specific that just clearing the filters is
> enough. If we trust the hardware then it is anyway.

We trust the hardware, yes. Marc, what do you think?

/fuad

> >> Thanks
> >> James
> >>
> >>>>           M.
> >>>>
> >>>> --
> >>>> Without deviation from the norm, progress is not possible.
> >>>
> >>
>


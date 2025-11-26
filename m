Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3952D10F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqXHzvwmvoGg6pqZSjb2mOgsez6Y0zUfBWYZPKgQD0M=; b=CQgBCePpP8kCen8+uFvX+hO6hJ
	vgDwxabMZndsYyraCMnEQEm+1IE3LS2cLP9ZOrioETiXhLHy/Exr/5u0elgy2Y3bUeqjgyHTOFgYO
	9dK8ojFgLSJ1+p2IWlaDrtiwKOUN5q7/pQL8UiMyT24ssBlNPcM3bwec0VW21oUuvdtGa1K7g3dsr
	Ay4VWOitw8HjkMrxo4db+gIAt3ROdDFFxVq9rHf4cKWEszBZNcQPD678Xq1OKTtRHzvy7myc+AKY0
	vL8GK6AXJ3l4a1/DFNZpYQ3JaCJYRLNRXP6C0oP3wSdw5/Dqq5y6zKfkV7mujz7ZG56C7m0t9blPv
	cOmHzmrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCuz-0000000EoqO-3oLg;
	Wed, 26 Nov 2025 10:38:37 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCux-0000000Eopo-1ekZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:38:36 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4edb8d6e98aso319701cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764153514; x=1764758314; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kqXHzvwmvoGg6pqZSjb2mOgsez6Y0zUfBWYZPKgQD0M=;
        b=MdTFvEmsiBkwLuTBwemiqvoaE4VdwvWeI8CzSOdnm9TtLhi35pF0AhFZIz0E+nidJE
         pgsLN1m0y9XFueD+JWpu74PGlXT8KGIixSsGuJ4dGgEoTLkTpsSP2jzeptZ7o2gm71WI
         TezG0+hs4JXzv4mtd+dQfyrB/2FdqoIwjkeoxoVQ8cjAeeWHV+0Pl9zYZm9LqxS2Lf3X
         rLx/trVpya1W+fcbG2lxUWLLhxKGSKjgdm01MASJhK6x2AX0pamV2LWGtz4kdBa2OPT6
         mpgUUD2apWLGCruQ09EbWEgDkoH6B5txUV0IfRM32gefxhEu2l6vIoH/Hu3Mc4LytDwY
         6xUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764153514; x=1764758314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqXHzvwmvoGg6pqZSjb2mOgsez6Y0zUfBWYZPKgQD0M=;
        b=X3BwIF+hh04SYYuxGZcgMRBt277OFd3sN/xFxMwnrWvnuL1IEubT/CnoriQbe+ntDY
         1lCyj9+YP8twIOifwPP74U1MMKxPZqd3pjMIFH3NjC4T6WjpFojU29Z6AePxzH17CXQ+
         AnNqkU2khoi1XNUSy/XJ6uy50q9DbN6TDf9X6GJ1PZR4xPu5kFbXqAiQfnbCmcKIymrd
         I5cKLzd717wBT1dBtGdZJeVRXY6poIrKXGgtnh5Ex63CAQofvGuOfMyf2nXeg7P4Pmvs
         iEBTPPjdx+79rVj/FDX36KIvav2t7sprQS5A1rx+KDf5LOqlhSDJ3F0y4CO/XDt4XIYx
         2xuw==
X-Forwarded-Encrypted: i=1; AJvYcCU8rNB6yVQsdJPZiABKg3AjzCvRd8XApX+pigisp1GHdkVTju3oR4PMt4gnbH+YwGxnQ8SDbJogIeeg8uJzKknx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu+TYtwH7rA06UkjOleGWu98o/aeYMXoS90QFOXazcDlOYLLC+
	6Myjdc6B21RUoWBTuOJqhzJMIk1N/ObBLzX734okcEJtkVtnalSVjSfQzRaO2xJDKBwcyjeVUiz
	taezAzWggBSarz27VYfVvxHbCzMrZ4iukMyyKfgnS
X-Gm-Gg: ASbGncvsx6VyUliQ/71s/aHeSKZKm1iCCQyDNfFUNMvhlS327kX3JEqgEw/CCKQkWrR
	pILGoLCjh34vRJf5EYZ8MM4GY1CnrwOjrwD3ZoRDDpLgnKyWS0M2N4Klb0v/0H+JWQuYNA/IYYA
	NWZsHWtpMRo+hwD/Zn0kmfvZnJpl53vtxa6xtxc0QiYfV3azIzroI05PLrmgNjuwtVKq4fAmqgH
	APgBBzTOnehtZjh2zEJFb5u6BxcqFIIevudZgCChVx21CcLMGL1jv+4kwSopSd4d3jc5sJupuK/
	VnNOkIjgT9TY8Q/q8ydKOwIg
X-Google-Smtp-Source: AGHT+IFEItoaU8n1dUE+RT80BKVjrf9iLlu1HIXY0cBSskpScSOIaQL/NClTMCE9saVAiaioP1yxTQtsh+6JQd2KBrw=
X-Received: by 2002:ac8:5e06:0:b0:4ee:40fb:d2e8 with SMTP id
 d75a77b69052e-4efc83c3b78mr3072821cf.21.1764153513797; Wed, 26 Nov 2025
 02:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com> <20251118103807.707500-3-tabba@google.com>
 <868qftqehe.wl-maz@kernel.org>
In-Reply-To: <868qftqehe.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 26 Nov 2025 10:37:57 +0000
X-Gm-Features: AWmQ_bl986BZK6mXylg70DosjYrRxjqNJ_REYpEjIxvfAOZqy8dAVrL8-eyJLDY
Message-ID: <CA+EHjTwHrLhdHrNSA8f-+bCZ1-QEuNocQQxeiaaost9oLwaG5A@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_023835_439024_6516FE44 
X-CRM114-Status: GOOD (  22.92  )
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

Hi Marc,

On Wed, 26 Nov 2025 at 10:23, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 18 Nov 2025 10:37:59 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
> > register accesses. These accesses are trapped to EL2 when the bits are
> > clear.
> >
> > The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
> > had the polarity inverted. When a guest did not support the Trace Buffer
> > feature, the code was setting E2TB. This incorrectly disabled the trap,
> > potentially allowing a protected guest to access registers for a feature
> > it was not given.
> >
> > Fix this by inverting the operation.
> >
> > Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index 8d06a246dfd1..f6f8996c4f97 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
> >               val |= MDCR_EL2_TTRF;
> >
> >       if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
> > -             val |= MDCR_EL2_E2TB_MASK;
> > +             val &= ~MDCR_EL2_E2TB_MASK;
>
> This does not only change the trapping logic (bit 24). It also change
> the ownership of the buffer (bit 25). I wonder whether you should do
> something for that, maybe by clearing TRBLIMITR_EL1.E, because
> otherwise, you keep tracing, but using an EL2 VA. What could possibly
> go wrong?
>
> Overall, I'm very uneasy about TRBE in the context of pKVM.

So should we clear/restore TRBLIMITR_EL1.E on guest entry/exit in
protected mode?

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.


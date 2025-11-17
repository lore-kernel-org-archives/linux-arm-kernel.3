Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D610CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtFMwliyeURMAMFY1byC+UBdCK6dtQy078PTE9BuABk=; b=iI6C1SIAypAJeFr77T8mtLqbyY
	AjVAPTst1FZXpH4MwWTbk7OIBZ51muBdicJbYUIJGT8WoSpAiqZgzFCAApElmnt70wM8i490UKTII
	Wr42Z91F76ehVEe0V3ZqXa4s1C/U+Rz3lO/llanbAjqL6k99wiMrp1FhVB6v21JBM0NiOvk+VawES
	MuBWEoVEV3QXXDHH3n6DitUbR+qoiS6o5gRll5RhKzMowzAIUyVUneZM4YquZ4Jh1Sry8cLgSyR0I
	gYuBpkFrXI1C3BvcwOvAvbBwQlYLRRVuoO3jUzwqpQDiFsvS4J/jNaf7MAtKHClRjt0deLt2ASaTK
	lkymIHUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxj3-0000000G0U4-3SiX;
	Mon, 17 Nov 2025 11:48:53 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxj0-0000000G0Tj-3rzE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 11:48:52 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4ee243b98caso191281cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 03:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763380130; x=1763984930; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wtFMwliyeURMAMFY1byC+UBdCK6dtQy078PTE9BuABk=;
        b=aIeGMnqZhWz+QK5JVwEa/Edh/bcUJTZlot16FfsNTkLfZlFCoCrrqDRK9RjQC+S/Cs
         tAO8ibGZcje/Gbp3a5TRZJh/oy9u8gEVh0q74mKyYlZPkb8xfT+E2Yg2F+36jL02asY3
         4JQcEk0w1u1PQE3vUbOXFl54t7qUBVz6yeOmkHPqRPcRtZs5XoFlnLNqJbFREl/wZLph
         MZqQ58VU5A9Ef+3etT19ww3gfaMPbcKqiFi6oSOaLIe6jdnenFx+xezibB/ooBsgtBP+
         7U7i2hze4GqrKBebH0TvVQC7soSzrByUq0zQ0glALtTf/2UdvXC7stdoQri+kiJ2vJY3
         6lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763380130; x=1763984930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtFMwliyeURMAMFY1byC+UBdCK6dtQy078PTE9BuABk=;
        b=JTP2Pew5uifMN+UBDCUI/fs4//4d1ruTwo/XLaMQnGKPP1gR++7KQyVPWx1s+ME/9g
         OOgDDadKUxAx4LRoedxh/UcvKwdAZQ+kOXst54GBIevbv9eNxlef7gqhqh92oPfKOyWd
         iJXipylo5uUzsX9kk2fXAAHlyN75ARKTlOqdaP/21yuNmsQOdbKhCO6vo8onXo/fYTpo
         oQ1j85KbHr7EgGjiZpYKdyCaP02j6/spnRYp6tZ8PXYsKtKohX/azP3Rj8/GBfRTN3IU
         G/zw8Da13lWEUprPrYBVufhUMoBJqSDmCwgWqwzyRN2WPied61QZ3o+Mj9CMkn5FSd7F
         2NmA==
X-Forwarded-Encrypted: i=1; AJvYcCWMpNJXvBXD4JOi9gmx0sQ+ljQCklPXoFwc+FbBSLLW93C22svCpkyUhFkZqS+o+hFqAnm25QIkzrpVbs7yUAPA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8Hnr2yZ719528ck+d+lML2vzdPO1Z8WdSp+4wE4oezjtqUrGD
	fYK+c0jHH/DXx9xO7ISCNRMzxpSE7Xk1NRV+9CBuiBNcQTLELuTrQjY/+Q/hxIAyVbRHbatDhO4
	4rd0gcWIci03Iu4FDIApyp8/f0HRJalAdZrSGGymC
X-Gm-Gg: ASbGncvMY3gTKDqsQhnOIcRqm/KXzPSrgebzWNQdhkwLRkofONXS4mb1Ruv4Ps13R6W
	2C/RaG18iLE9kc4xwhb8uytYCUYA0YsZMv3jD3x0enmBSmRoqDL239Yi447Qez2Du5L7wu5jgHU
	atb0p3jq3k1mHaunBxSc95O+kGMYmrDWfFMKf724NwxGqbJ1KEKp3EHMc/ltRYQYe5Ygujj82wo
	gLdS094uB+ai1haIocWNApg2d0hjbAoZ7w7e3dEK6vb+kdUCev/8pYy0Zkw9LO9lbGTE/8=
X-Google-Smtp-Source: AGHT+IEHIBrDsl1tNBXJlZjvy3Cf3bvvIt0plNzv8yp90Dy54B0sd0uogGQ1BYNz1nQ2J5pl3F6LJlVNsJl1l4fGJHA=
X-Received: by 2002:a05:622a:4f13:b0:4ed:ff77:1a87 with SMTP id
 d75a77b69052e-4ee02a994a9mr8359641cf.19.1763380129366; Mon, 17 Nov 2025
 03:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20251117091527.1119213-1-maz@kernel.org> <20251117091527.1119213-6-maz@kernel.org>
 <CA+EHjTxVr7uk8Ofhb2VHjDw+LfC4ZSz4dDun5+xLcnRQy5AKaQ@mail.gmail.com> <86346cubqo.wl-maz@kernel.org>
In-Reply-To: <86346cubqo.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Nov 2025 11:48:11 +0000
X-Gm-Features: AWmQ_bnWedPYEhHQPg2C4X-v3VYqSp4JpRxkKgnh4axAij7gQDfBobnagYWNTiE
Message-ID: <CA+EHjTxB6qf80zLYQJnpr=beJWg2CiqcbTwPhodgtBceEGLVUw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] KVM: arm64: GICv3: Force exit to sync ICH_HCR_EL2.En
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_034850_970352_842971F6 
X-CRM114-Status: GOOD (  25.56  )
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

On Mon, 17 Nov 2025 at 11:42, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 17 Nov 2025 11:35:18 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Mon, 17 Nov 2025 at 09:22, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > FEAT_NV2 is pretty terrible for anything that tries to enforce immediate
> > > effects, and writing to ICH_HCR_EL2 in the hope to disable a maintenance
> > > interrupt is vain. This only hits memory, and the guest hasn't cleared
> > > anything -- the MI will fire.
> > >
> > > For example, running the vgic_irq test under NV results in about 800
> > > maintenance interrupts being actually handled by the L1 guest,
> > > when none were expected.
> > >
> > > As a cheap workaround, read back ICH_MISR_EL2 after writing 0 to
> > > ICH_HCR_EL2. This is very cheap on real HW, and causes a trap to
> > > the host in NV, giving it the opportunity to retire the pending
> > > MI. With this, the above test tuns to completion without any MI
> > > being actually handled.
> >
> > nit: tuns->runs
> >
> >
> > >
> > > Yes, this is really poor...
> > >
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/kvm/hyp/vgic-v3-sr.c      | 7 +++++++
> > >  arch/arm64/kvm/vgic/vgic-v3-nested.c | 6 ++++--
> > >  2 files changed, 11 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> > > index 99342c13e1794..f503cf01ac82c 100644
> > > --- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
> > > +++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> > > @@ -244,6 +244,13 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
> > >         }
> > >
> > >         write_gicreg(0, ICH_HCR_EL2);
> > > +
> > > +       /*
> > > +        * Hack alert: On NV, this results in a trap so that the above
> > > +        * write actually takes effect...
> > > +        */
> > > +       isb();
> > > +       read_gicreg(ICH_MISR_EL2);
> > >  }
> >
> > nit: is it worth gating this with "ARM64_HAS_NESTED_VIRT"?
>
> This is in a *guest*, which knows nothing about being virtualised!

Nested makes my head hurt :D

Cheers,
/fuad

>
> > Otherwise,
> > Reviewed-by: Fuad Tabba <tabba@google.com>
>
> Thanks!
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED7CC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnZ58QpNpvBwycojF2nbwIbKbRZbutG5CaI6EccsGVE=; b=QWonJDf6c7oPtU40LvOetssP7T
	kjIb4HNp8T9mX/YYVenGKf/NON2x++51WGlPpqIP8wAyl14jwHvAR/ewUxCV2/fX/Yf9NinK8v1rW
	+vHRpAxM9pTBYNsSQj3amQQEg4tEbh8QbFF7lTjcyX3ps7i6qHHUOYe8iW7nsmBboOAL/uUwqMn+e
	Y4g3K6Cms0pYzy8qPrsUcmCsp6oVjrSYopBrIQOR1+gCQajSKz+SJfg5+Cc99ZkxpNpiitvpu8BPD
	JV4Oh71Njl3gXqvrf5nn8XX4la4jObhJHVuUfmNlldNvEb5Yty0q7TiQqDdsjy9+hHw7aMm3rkTNu
	j03MNYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJid-00000004PRp-0Ggn;
	Wed, 26 Feb 2025 15:53:07 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGn1-00000003jnG-1Ciz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 12:45:28 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-471fbfe8b89so325841cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 04:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740573926; x=1741178726; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FnZ58QpNpvBwycojF2nbwIbKbRZbutG5CaI6EccsGVE=;
        b=38lDx86uJJrwt1Zc8b6jb96Y8LVwSOkLXXN91c2uWNxy4f9H2AiaBs3h4dmHdmvEZJ
         B+sc89cgWP6xm9TwaFg9wUe2Td/0r+NMUEqReMp2zGVGZryqaMB+ANVOmsYTt7sxOIQx
         7Emqm7IJyQnZ5kYdzACDWZPk65JyCpOje8ywItP8GidcdW5dLajtsg5M9HI+DkF1fqeS
         anlHx5B8QdRh36iORISTvGrc6AiWqPlIaN/wh3ej2h83KgFOA55JAACHWkduTQWET+QH
         heQ9c5AKKzsFIGVd9fknuGRBFvkFupJCcoclJTTu0s76xUlNEyerHQNCwoZA7dgMLaWi
         7JyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740573926; x=1741178726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnZ58QpNpvBwycojF2nbwIbKbRZbutG5CaI6EccsGVE=;
        b=f5YFSxjJpt5lBIUV55LfdXs7h3Qucqw6YNDXrF9bit13uCExyyHQXr/U+1bctMvB10
         xjFoQu0QTyr3eVgPd8gg49NfbTRofRAvTbePo13z/RBlmcEmgO2Z6p1AJV+dv4psF6S6
         zLbHGLUzxFjYAuZlxaGqDmrrqD/qaR7N8Ftw3cMty75QKUOc756oU8ikbtPMzJhKOevX
         tDr2bFfRhOnwPmLPcs1oJxOv3cNbMy9pzlUI2r3yOUvRfy+fN3nTjXgRtIyQems7+DhJ
         jMln0E0UMHEJeIBYIaEDJk+dguPjVt1Y5fCXP50IpA6lPpVjG/VALyOZJebRZLmFkoR+
         1b2w==
X-Forwarded-Encrypted: i=1; AJvYcCU7B+Xep0jor4KHX6GWK57heZ4WlQIwbtB4OGaKU6lOTewgGGsw3/Nkq0C1JjIvElI54ftFspW0N48GIL4rBlc8@lists.infradead.org
X-Gm-Message-State: AOJu0YzylLrl863mweQ5b5+SMtXdHMcqeV/JmuHTG3lfmg0Un4H6dDWJ
	45HjVx85z19r1E1m4byskdqY/Ca+ZKhm/FES+WrW+e71xeIlH4UeMp1Rz81coUtPwhxcfNGL7Oz
	XesQ7+g23kwOXOMS/zD2SXF7K+tfYwdqO2knu
X-Gm-Gg: ASbGnctDScp2lx41Dlanx5XZwnI8lZJhOybk12g1CgkusnKpPW5brBd0R7p+Ryb2G2E
	Jfn4KlZqQFonKf9K2cmp2Ux/55MBg+STXuvjBDa8yxP0znZZk6ptQK9OLtDXDNUQ9aQZKZ34wPG
	rgigw=
X-Google-Smtp-Source: AGHT+IFPsfyVxDmOk5bhhOwAYkW0RuBl+C5BgE8AvC3sWrJRgsvEpg0IbCAel4g627Ak8eyzVdEUrJ5bLuAAKop36/c=
X-Received: by 2002:a05:622a:4a:b0:466:8f39:fc93 with SMTP id
 d75a77b69052e-47376e5e3aamr8364681cf.3.1740573925849; Wed, 26 Feb 2025
 04:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20250214150258.464798-1-tabba@google.com> <20250214150258.464798-2-tabba@google.com>
 <Z77n_Gv0X0bolONW@linux.dev> <86a5a9q90z.wl-maz@kernel.org>
In-Reply-To: <86a5a9q90z.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 26 Feb 2025 04:44:49 -0800
X-Gm-Features: AQ5f1JpXLWze3ZsKcg1F1ITEjoOVRMUPQeTV9gjFFgka2SqDslZdnyDLB_yzXd8
Message-ID: <CA+EHjTwRNj6z_TTCXR8UNiB0ty=85_VKWDVsFOLke31UGnBE7A@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] KVM: arm64: Initialize HCRX_EL2 traps in pKVM
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com, 
	vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_044527_322882_888452CD 
X-CRM114-Status: GOOD (  30.59  )
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

On Wed, 26 Feb 2025 at 02:45, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 26 Feb 2025 10:07:56 +0000,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> >
> > Hi Fuad,
> >
> > Series LGTM overall, one comment:
> >
> > On Fri, Feb 14, 2025 at 03:02:56PM +0000, Fuad Tabba wrote:
> > > Initialize and set the traps controlled by the HCRX_EL2 in pKVM
> > > when the register is supported by the system.
> > >
> > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/pkvm.c | 46 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 46 insertions(+)
> > >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > index 3927fe52a3dd..668ebec27f1b 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > @@ -58,6 +58,30 @@ static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
> > >             vcpu->arch.hcr_el2 |= HCR_ATA;
> > >  }
> > >
> > > +static void pkvm_vcpu_reset_hcrx(struct pkvm_hyp_vcpu *hyp_vcpu)
> > > +{
> > > +   struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> > > +   struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
> > > +
> > > +   if (!cpus_have_final_cap(ARM64_HAS_HCX))
> > > +           return;
> > > +
> > > +   /*
> > > +    * In general, all HCRX_EL2 bits are gated by a feature.
> > > +    * The only reason we can set SMPME without checking any
> > > +    * feature is that its effects are not directly observable
> > > +    * from the guest.
> > > +    */
> > > +   vcpu->arch.hcrx_el2 = HCRX_EL2_SMPME;
> > > +
> >
> > The comment isn't wrong, but we don't support SME at all in KVM at this
> > point.
>
> This is a copy/paste of what we have in kvm_calculate_traps(), and the
> result of the removal of the dreaded HCRX_GUEST_FLAGS.
>
> > Any objection to dropping this bit? I can fix it when applying the
> > series, no need to respin.
>
> Whatever we do, I think we should keep the two side of the trap
> configuration in sync, as this is otherwise a cause of bugs.

I could take the initialization of hcrx part from
kvm_calculate_traps() and place it in an inline function in
kvm_emulate.h. This then would be called by kvm_calculate_traps() and
pkvm_vcpu_init_traps().

What do you think?

Thanks,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CC8CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYC/cCd0zSITxczUbxXMENMoMGUFbD0O4ppMDx0q/Ls=; b=sbfTUg/8GymtW+USoPPCtBqns4
	V1tKrwunStsF4YbBFu/1J0sjuDNCSLgoJGuGjvZd2RX21EWOVpF23HsC20wEp6U3WJjya82PHX6pL
	NwxpofsVFxZEUUZ+jxQbssDEszBfmA3yi2Y+SI2pDBG52RrkYlr32L9/1I1XejBOt/CpVW2SP3Iq0
	H+BpJV1vAEHR0/a0FNCEz0D3Mdsr3MjpY/TFEIE4fExY0ayBOtXiehbVs7j1NrWV0QpENNKthnw+O
	zN8oaoeI0oVyI58p/QVeunHHh78HfWx4ldBcEr7l7/Vs7ogbYU5QjxEvLsMRSRb5AbGV/D50X6y3o
	gbCp832A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJ07-0000000C64Q-2bZo;
	Tue, 04 Nov 2025 15:31:15 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJ04-0000000C63j-1XWq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:31:15 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ed6ca52a0bso113911cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 07:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762270271; x=1762875071; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XYC/cCd0zSITxczUbxXMENMoMGUFbD0O4ppMDx0q/Ls=;
        b=XHdTj0/PGaQefKqCQ9ipnn6yTGSFoy5MYZqSI2fEnk8ZV1w0j9HynwuJeGPobilLTE
         ULUazwAlXwXzjgZvNUufHlAZCpR9g6/Kwdb32eDZtUjS7vwxzY89mQ051HvAVFqWf9y5
         SghVLH1J4Uob/lUL9A0KLS2sSAakpzajBiLS4hnTPxkukrDW5qQUZB44afWcLEMmmrP5
         g6JMty/JhsI5rWEFmMHH1MSFdSlK43ehikjoQSA1TgJHmsgKQYGQ8X5rwE2tp6TYpAb9
         d9ElIc/zHBn9YNwpDLtiFTB9ubt9VEMfP+hCYaakZTsPOyBOEHlWfdBwUq8wCH6+3nwG
         DD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762270271; x=1762875071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYC/cCd0zSITxczUbxXMENMoMGUFbD0O4ppMDx0q/Ls=;
        b=B52IcSDMvdJEXqgCxygvpXKMSm8wqNlN04mJTtHgVua2GFWxiwYgNvcQZfb+7/oqTO
         c1VhervtQdrFxgAWtsltLmYRRVrCZJJbGr1c8+87atejVesOS/fHTUzovSLVXebDigpt
         csOWQlJiTl1nGpVuXAGTMwLBXEoLDkqQcu3UA//JGVwlEkMMLf9ytQvo0Tw3WR2gYO9Z
         V9M3WyyL7jbEtr4Y3LNP/jTgfOqrHf5I1p7ViJ9P1SXM3AfdfFufyWp0lztI2zqK5RfR
         BhXY1+YLS8B6y5tVLcBO9/C4SKIMYLmp2hodm0FdhvyEhgomosSI2SyBlY/s+Ihr3ATr
         S/Zw==
X-Forwarded-Encrypted: i=1; AJvYcCV/i1v+WykXf89GZDYD2Y9npYY3LjdK3uFFJCp/EmuAaX2N/2V6VIMoMAzUqXRr60nhV6DolsWEs8aUsrF4knLs@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7JcZsCX5NWVZlztO1i5WqtMtRw1vT9+BW21hPB3uVX1/den1o
	JBVh7WAUTsXEuSJvSAVOVg0eR85P9MTA9LwlT1XR4as23TD6pAk6WhjFffHOR33+NSx90SCIL1b
	wfaBtYMpw2PIvjHKmpbEsr3qzcSCpQ81IqZURKh03
X-Gm-Gg: ASbGncvUM0j2MY2p/l2MCUGDqbouhUDUYeAealnXUBYo7qzbD2ZbxB51G6AVVI2HQYr
	qxDS3Hkqwk0qaiBNqihvHqaEHkz7R617frrv+Du8CvhmyUrE20+9m01Eo2y/Z0XP2A5upyyqkjJ
	ZsoDE3F/yR95eN248x5B4FuXMBOZWbIBhCjK3c5txH1A5+NyAL5p2J10ddpmSqsf5YQa5QGOfM/
	bLLHt83XEUs0LqyYT4EFZk1Z2a4fo0yBsVjFvtkzUFysog6l6fQMBWxeLqJMatFyiABf+smTa6D
	gQqqfik9xbddcg==
X-Google-Smtp-Source: AGHT+IGjkCUOPyp9FCLMHbslLbqZzJXPypdP//fUskMq5DkFmSvtOV4TlqlZVNNTd4TNVSEXr+c4/jM98dwnWzbJCoQ=
X-Received: by 2002:ac8:7f49:0:b0:4b7:94d7:8b4c with SMTP id
 d75a77b69052e-4ed617b7589mr7544371cf.0.1762270270683; Tue, 04 Nov 2025
 07:31:10 -0800 (PST)
MIME-Version: 1.0
References: <20251104125906.1919426-1-tabba@google.com> <20251104125906.1919426-3-tabba@google.com>
 <86h5v9vnfc.wl-maz@kernel.org>
In-Reply-To: <86h5v9vnfc.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 4 Nov 2025 15:30:34 +0000
X-Gm-Features: AWmQ_bmhJA89LI3vSbI9WLgObKAQrN9YiB8af5ySDlbgGi81lT7jPmV-Xk_U0IE
Message-ID: <CA+EHjTw7KnXVKeyxd4kNysAOMZrJniuBdCNGV=NoWodc3H-rMw@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] KVM: arm64: Trap access to ALLINT if FEAT_NMI not
 supported by the guest
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_073112_430583_8A989A76 
X-CRM114-Status: GOOD (  26.50  )
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

On Tue, 4 Nov 2025 at 15:15, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 04 Nov 2025 12:59:00 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Access to ALLINT is part of FEAT_NMI. If a guest does not support this
> > feature, any access to this register must be trapped to the hypervisor
> > (EL2).
> >
> > KVM didn't configure this trap, potentially allowing a guest to toggle
> > all interrupt mask when it doesn't support FEAT_NMI. Fix this by
> > checking if the guest has FEAT_NMI support.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_emulate.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> > index 0f8311263edf..3fc62808c548 100644
> > --- a/arch/arm64/include/asm/kvm_emulate.h
> > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > @@ -688,6 +688,9 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
> >               else
> >                       vcpu->arch.hcrx_el2 |= HCRX_EL2_MCE2;
> >
> > +             if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, NMI, IMP))
> > +                     vcpu->arch.hcrx_el2 |= HCRX_EL2_TALLINT;
> > +
> >               if (kvm_has_tcr2(kvm))
> >                       vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
> >
>
> I think this is moving in the wrong direction. We have for quite some
> time now tried to automatically derive these behaviours from the guest
> config, as we do for FGUs.
>
> I would like to see a similar behaviour being introduced for non-FGT
> bits so that we don't have to worry about these things anymore.

I agree that we should make this more like FGT, but since that will
likely require a bit more time (and probably a couple of respins),
should we fix the HCRX traps as they are now?

Thanks,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.


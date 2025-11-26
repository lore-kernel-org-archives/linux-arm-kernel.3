Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17FFD1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 11:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kr3qwrLRk4v2y/s5BXARDD9+PbbRYtmC9PW2DSjFBz0=; b=KZVhKqZeHXIFo/SresXo7DflOX
	QhZA8BhQQrdjQ7qYEdKArvpHaIodhlDRdMtHnWwx34zlHjNWW/NIzSEMiSVhTctVxBV8QVWJerMFn
	a03oMUUwD12cbJWWoARyQgpVoVGVlNi3CbX/WONQilFQ9jSCxjDdeK4agMHqdD8iK8lAkuRH9eAi9
	j1R0v8J7UbVZMLSQJ2F86qfCHkyXRsrhMnnve7z1dAcY4hqQxO0nUyJ8eX16juivyxjAz1g/QUhXo
	3sjnU+QQMCyWkJiMVLHnTqokDma2vV1E93H236p0OL/Y3Cf1EuPmBa77dc3v0tTQks70tOlnEb8/M
	x4NppKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOE1Z-0000000Evv1-3iTP;
	Wed, 26 Nov 2025 11:49:29 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOE1X-0000000Evug-35R1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 11:49:29 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4ee147baf7bso216081cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 03:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764157766; x=1764762566; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kr3qwrLRk4v2y/s5BXARDD9+PbbRYtmC9PW2DSjFBz0=;
        b=vmN9a+1yNETXdbu5UlzE6RVwz78qENyJWLrb2YuufzJRjMTAjznzpWy2n0ervJWcFD
         HXfOQGkFc9222uC4HJ1ja9XmJaVmUAQ22Jfo9SKkp6PJ3SeALLuAJ1eA8AtYxLQTWkp2
         IxY5QvA6YOSfNR1SHD1z2BI4NA9/DqXw2749znhUHaWUqMuCYTjQmsFWY0P3stwlRhCU
         4EJ5H1pbySIrmFyK/A2KQFt26PN9GMDsqQrO8RWeaf6Z2st2/QFmw2TY5bbnRKpqoynK
         BRNbL0CqJ687/eKXwFPgwvNVmuv3Fp0m3rz54Ns5yEH+eqj/FGXHM8Aa53wZM4xhhyvw
         DmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764157766; x=1764762566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr3qwrLRk4v2y/s5BXARDD9+PbbRYtmC9PW2DSjFBz0=;
        b=TdHYsgXhfEohW8rogoStQwiR8tj16M6+0xFicgzWh6/JcXpG+yczEVtkP+44pFtEtY
         WFStZ3GzlFByasRAJYx2e8fiJgcrpnFI34A4QpBzb04lsiRaa3ixjCstPmZEFMYSzBiW
         PuU94uf/Igy+Kng/uL+jNnVrU0eI7MTm4W0bA8uvQYu2/0/qnhcU8E7Aj0L/Ez0GJPan
         u785mjA5MBdh9JWPIdLkixNC1rJMXKA63ZbyTaBoQ95UV9tSo54G3lZhahMyo7GT6fLi
         nm/fgrQkMTzrLjz+vMPzOOFVKtyweRyNNiPajg6/dEXvowvY+VnabWSrGoBOX3ZBiy7a
         T4aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhcf7iHo7PAxglPUs+/tv1fpkkLOdhhy0Zc03QMWst2OXvHEHQ4cYvPwDR1QLXvn0wIPV8PEvl6sF4lGkGuk5o@lists.infradead.org
X-Gm-Message-State: AOJu0YwAzRENndzrtAphncqI0+0zwnc0PYl/nVJHEfTbo1igtrgX2xGp
	S0RxrwjPOPUJKTiHaxoV9fbUgFYC0f/gOiNEYUC6GsqskQDVhUUHLYMg9JnhdT7FYeTHGOVCT8+
	CgdsT2aRvTFZNwbOpToHyliowMf21O9qaKiozX97wNJvCJom0MseQYGVu
X-Gm-Gg: ASbGncvrodYrtL0i2xXjk++dQppMq7JEx0b4ajvXizYMOdD1S4e95+7HTd3mfQYfM0u
	9RtPwlDuD3n4fIWVf9JSGsoqHVMMW9EoR7DyaATYc/5vPbO865UtBRMb7pwh1/0f1P5qEi493q2
	+u46V0JRMONal71IAUQ+eNFkWmdxVv5pb9wFp+qTvLtiqNwlrevKEeX+h49GzCsz+e69t7/03Wj
	nI42eETBPQ2nnJlYCIaORnoxlNMXE3VZYfFjo/aKEqFtPWBHLUsnFBCOWgOS2ruv8ImioeRJd6t
	I0mBFuIGFvUyT7imNfqhJChc1avw+4ZIzJo=
X-Google-Smtp-Source: AGHT+IFT30zb6Vmyhh/ZY3aMrC8XWe6qd4Iv+A4t88+50yH5QFBLi99beNKd09a29+A04Gvb4d9EJyYi8xds41jsviE=
X-Received: by 2002:a05:622a:3c8:b0:4ed:ff79:e679 with SMTP id
 d75a77b69052e-4efc83c47e9mr3916231cf.19.1764157766175; Wed, 26 Nov 2025
 03:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com> <20251118103807.707500-3-tabba@google.com>
 <868qftqehe.wl-maz@kernel.org> <CA+EHjTwHrLhdHrNSA8f-+bCZ1-QEuNocQQxeiaaost9oLwaG5A@mail.gmail.com>
 <865xaxqal2.wl-maz@kernel.org>
In-Reply-To: <865xaxqal2.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 26 Nov 2025 11:48:49 +0000
X-Gm-Features: AWmQ_bmAonQV6lX6CJR23oCHhfHyu2-Eny56MVRap83EMYa4CBEecAcKDPm5NxU
Message-ID: <CA+EHjTxhOvu-733Z-gJgc6f_EAs-tksA6u5KuQZeimP6T6M-fQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_034928_173893_7CEF9412 
X-CRM114-Status: GOOD (  30.60  )
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

On Wed, 26 Nov 2025 at 11:47, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 26 Nov 2025 10:37:57 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Wed, 26 Nov 2025 at 10:23, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Tue, 18 Nov 2025 10:37:59 +0000,
> > > Fuad Tabba <tabba@google.com> wrote:
> > > >
> > > > The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
> > > > register accesses. These accesses are trapped to EL2 when the bits are
> > > > clear.
> > > >
> > > > The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
> > > > had the polarity inverted. When a guest did not support the Trace Buffer
> > > > feature, the code was setting E2TB. This incorrectly disabled the trap,
> > > > potentially allowing a protected guest to access registers for a feature
> > > > it was not given.
> > > >
> > > > Fix this by inverting the operation.
> > > >
> > > > Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
> > > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > > ---
> > > >  arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > > index 8d06a246dfd1..f6f8996c4f97 100644
> > > > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > > @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
> > > >               val |= MDCR_EL2_TTRF;
> > > >
> > > >       if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
> > > > -             val |= MDCR_EL2_E2TB_MASK;
> > > > +             val &= ~MDCR_EL2_E2TB_MASK;
> > >
> > > This does not only change the trapping logic (bit 24). It also change
> > > the ownership of the buffer (bit 25). I wonder whether you should do
> > > something for that, maybe by clearing TRBLIMITR_EL1.E, because
> > > otherwise, you keep tracing, but using an EL2 VA. What could possibly
> > > go wrong?
> > >
> > > Overall, I'm very uneasy about TRBE in the context of pKVM.
> >
> > So should we clear/restore TRBLIMITR_EL1.E on guest entry/exit in
> > protected mode?
>
> I think you need something of the sort, yes. Overall, SPE and TRBE
> should be aligned on what they are allowed to do, as they are two
> sides of the same ugly coin.

I'll fix this (or add a patch to do this, depending on how it looks)
when I respin.

Cheers,
/fuad

>         M.
>
> --
> Without deviation from the norm, progress is not possible.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A38CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nbk67PysBg7DJJKGW/wCdu53ipJpqlNAOSXxv9Li8rs=; b=K6XmwU0BgslgLItx5lDsoTPG0B
	8TyJ9hsDJGzZO+Frfa9eDx8UCNaS5h/12mkygN/7uTRiPD4mhBpGEDImmL8PpbNg2xAGxNvC7Ht8h
	2Gzf79+S6aog6km2VbDkEsOo2K02LWRs/gfLQwLfzaG9IUyP8JNHvMICXRxMDM3VlgEjgs36jXeQd
	bPLF+n9hmUueljo2vQ3GK6ip1NWNeQP+QKjFNRczXigOi/SGkKDtC1kuvRyXW+vimTCir+Sg2qQCC
	F4uy/8fm5baper3vLp+vDZUjFcOL4BoSRkF3RI+IgI/UvrrPc0CKnYx7aCqWWYf9NQ3yw8vEgZHoe
	mVKl9OJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8EK-0000000GnvF-1eks;
	Thu, 04 Jun 2026 13:35:28 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8EI-0000000Gnuq-0jD4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:35:27 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-36d8b644473so661489a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780580125; x=1781184925; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nbk67PysBg7DJJKGW/wCdu53ipJpqlNAOSXxv9Li8rs=;
        b=ot8Jh8qQVpBwj6Fzx3BctsNeNZC92FMwkZQsDWH4MK5FodvW9WLXrdukqdCm7C82ve
         9PjqQL/+DlVf1TxkdAwDyKkHSB1Kyeeic8lVL7Hf086PZf8n+sfJZhM15ntAfmSW5K5A
         SMoje5r+79BcCKgZGsXXusE9r4vVfBouUWdALGSTopILlmGjPJhcpFJg83ftnMOTU/kj
         n1AFCdwsMGcjhDarxS44bHL5zuhu98zO5ezxHp5PQB/OHNl3sBmW1XP1pM636SHQB1qb
         7XFmVG+GMWRi3X9m1BwMf7sj7LpKFXF0kssSUD2lPs6d7hzbpYi0OBGqsNUsNx1zDjd/
         ElfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780580125; x=1781184925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nbk67PysBg7DJJKGW/wCdu53ipJpqlNAOSXxv9Li8rs=;
        b=Gl9FtViDNh1Mk6uG4o72C0oIZoQIdvRaAmbjDtcco+tmTYzLY6bhlftipEQmFpukX1
         pLYwi6/MVtPqYlyLz5pp52sEoYjjsREWvi26oHaU+z1ApF8M4OQ3v/JWzPZZ0Oi3HJS6
         hOcsCvFVcwyWWiCxbgNlLXXMCGPAGNTJkFZMcBBJTf2dfNckjNxzi33tp7ixni0FTg0Q
         jiNglTivp94CFnSFdqlMYLiIE2++VBBRQar0pGLVoBSYjJBRIuQsOa39IKGVcgQ7Pv99
         JyWUrLfvv97aM25CrvclMHklcODY4kIa7hffIyDBUPFTWp4+Ol2abAAZ2abmG0o0QyzL
         mvUA==
X-Forwarded-Encrypted: i=1; AFNElJ+/uCWZ9CtOx6dkVplPY4kRCmpE6kEXGXSwt403ePnFEhSYfR+4gfSLcOfTXD5G3mQfqCJ45t9TK1nELlfrSHRV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5fpB7r9o5IiDsKSo/m/cb4qpBHicy4SmPhlN8jG5gF0QGjLjC
	7RwObDOxlpEXQVWwIK1cpOEnxcemwHkRSFztbLAZIQPnP9/4dIRS0A7g
X-Gm-Gg: Acq92OE5fvKRGItDTa4nA7qbeX9vmFeNflBkM+EaZ6TU2f4o1Cnh8dFBzMVVWdch2Ao
	LkD26AuFZbDkL4bTZnLKwC5RW2whquALWfulI+ZSQw2rx6uGUqgHxFKeeh0wTuA+GyxqB2FSk60
	il1kITpq1A7WK2do6pRiq5wZN0bvFYgR9fii3ycWNg5GK6mnWYJGuBiqBISDgdC28Mt7e4g8+1g
	QR1YrFLYNA/ihCwWMbSYzz3swo0sneF4DzEm0hn6IcnR2qSXrmVqEmxfkz+bZLwFpHMYHvY/rnK
	Up2wsGHfDaD4PMZfGjHghDeS8we1TUXaVzOLhq8RjYqYe2uihz1V96LRwtnUzDxK9DSnM71/NH9
	dZDMRYsJhqlBMTd9VFQ71zgdbD0ARWdaIWRNbW2KHYQ4EwvLIddpUtRa0UouKPEjOrubrStH0aB
	CfV5RWt1ivjWb+ceBHx9cFzu38AakLDoGzUgIJzN67P6xjSXN51rqLqQ==
X-Received: by 2002:a17:90a:f94e:b0:36a:ee1:fc24 with SMTP id 98e67ed59e1d1-36e2f3c3635mr8502314a91.8.1780580125219;
        Thu, 04 Jun 2026 06:35:25 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a29cd6sm3133442a91.11.2026.06.04.06.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:35:24 -0700 (PDT)
Date: Thu, 4 Jun 2026 22:35:20 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Fuad Tabba <tabba@google.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: Re: [PATCH] KVM: arm64: Sanitise host vCPU fields in flush_hyp_vcpu()
Message-ID: <aiF_GLmaDdD5i1Cp@v4bel>
References: <aiFe-CXo-XVTFz1g@v4bel>
 <CA+EHjTwgPFbbp7khcy+DZ9HZWCX-OWPfO78Gj_eQuCoj+SA90g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwgPFbbp7khcy+DZ9HZWCX-OWPfO78Gj_eQuCoj+SA90g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_063526_219497_92F9CE59 
X-CRM114-Status: GOOD (  29.45  )
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

On Thu, Jun 04, 2026 at 02:01:17PM +0100, Fuad Tabba wrote:
> Hi Hyunwoo,
> 
> On Thu, 4 Jun 2026 at 12:18, Hyunwoo Kim <imv4bel@gmail.com> wrote:
> >
> > flush_hyp_vcpu() copies the host vCPU context and vGIC state into the
> > hyp's private vCPU on every run. ctxt_to_vcpu() expects a guest context
> > to have a NULL __hyp_running_vcpu, which is only ever set on the host
> > context, so that it resolves the vCPU via container_of(). The vGIC list
> > register save and restore expect used_lrs to stay within the number of
> > implemented list registers. While this is generally the case,
> > flush_hyp_vcpu() copies both fields verbatim from the host vCPU and
> > enforces neither expectation.
> >
> > Fix by clearing __hyp_running_vcpu and clamping used_lrs after the copy.
> 
> Nice catch, both fixes are correct.

Thanks for the review.

> 
> Please split this into two patches, one per field. They are independent
> bugs that just happen to share a Fixes: tag and the function. Both are
> host -> EL2, so worth stating that in the commit messages.

I'll split this into two patches and resend it as a series.

> 
> Otherwise this looks right to me.
> 
> Cheers,
> /fuad
> 
> 
> >
> > Fixes: be66e67f1750 ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()")
> > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 06db299c37a89..ef9318ff0c25e 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -7,6 +7,7 @@
> >  #include <hyp/adjust_pc.h>
> >  #include <hyp/switch.h>
> >
> > +#include <asm/arch_gicv3.h>
> >  #include <asm/pgtable-types.h>
> >  #include <asm/kvm_asm.h>
> >  #include <asm/kvm_emulate.h>
> > @@ -128,6 +129,9 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> >
> >         hyp_vcpu->vcpu.arch.ctxt        = host_vcpu->arch.ctxt;
> >
> > +       /* A guest context must keep a NULL __hyp_running_vcpu. */
> > +       hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu = NULL;
> > +
> >         hyp_vcpu->vcpu.arch.mdcr_el2    = host_vcpu->arch.mdcr_el2;
> >         hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
> >         hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> > @@ -139,6 +143,13 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> >
> >         hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3 = host_vcpu->arch.vgic_cpu.vgic_v3;
> >
> > +       /* Bound the host-provided used_lrs by the implemented list registers. */
> > +       if (static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
> > +               hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs =
> > +                       min_t(unsigned int,
> > +                             hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs,
> > +                             (read_gicreg(ICH_VTR_EL2) & 0xf) + 1);
> > +
> >         hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
> >  }
> >
> > --
> > 2.43.0
> >
> >


Best regards,
Hyunwoo Kim


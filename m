Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772F3E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lccj5szcR2Loq0SLYGfcfm6VfqCNUTcb2r9ZMHJPtZI=; b=X+2jzBsKbdCXQvHiBtRwe3+wch
	CCYNCvvL1slS5OTZlBqfIzGerXmSktQjRf1bKYK3OY2F7eyDxSeAAB8XW9LK0Uwek3nLO8HeBM3U1
	aEZARf5uVhMCZjwr+H00t06XkZeouC1O4LFgjL35FoF6oFQUwZTECD/HFW9/2Wow+TH3ds3KgUzKv
	KMe/lAalxCHTnRlZCwIAbFrng+/CKquZtnLJ5gn8RG9fsTVmSBNd+2PL8sM4nux2ckOckFLeWIw8f
	mu+MrbBojTXJgU2h+njnHLmehzV8xYQS6pSnVJKB/4FWVEIi0Y89Kau2nIXBwmyJ7GU3NTqfzPrFa
	S4Nfx+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1z4-0000000Bug2-3b6i;
	Tue, 10 Dec 2024 15:17:10 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1xx-0000000BuWs-1Lh2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 15:16:02 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9e8522445dso1139586866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 07:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733843758; x=1734448558; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lccj5szcR2Loq0SLYGfcfm6VfqCNUTcb2r9ZMHJPtZI=;
        b=UFlcjq8inbHcZx9Z0At16ajmBYUTpS76PZS5JXFuJtZkZElgQIRP9jROWx1uxqI9bm
         6fGQ4Yxx+dz/YIfo0olC4hQFgNhbPPjGbeJfxgjvb33GglshS/KfaIpDP+78Z9uEH9oS
         aRCOG2obfoqaRd9/kBJIYfgRmJyrXuc1fxZgCDllJmwM4bbwkzc3C0G52rFBGFvL6r3G
         xqnSdDbyk1EknyWjRDm2nVnvwp1O/DFpGfahC/y5QYx3OtdFyJO8cpGkpY4yoTIRBKNE
         q9AtfaZa6YfdmVvUkP0MEn4SccGmhH3xcVgiyXzeQgA66cxeYRmKIDz+UaAQoRhOA9Cr
         dqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733843758; x=1734448558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lccj5szcR2Loq0SLYGfcfm6VfqCNUTcb2r9ZMHJPtZI=;
        b=UXwxWzyqXW4twxpmDqE5P9POwLSSDqSrARtEMvNUwpkFJJAi+m9lNvh2qeqc8uvGiL
         igvLVfz+93TmzpSEnebRoDAjI6lnZJmPC2C6xDAGt1sGXKfLDOppB0BAg2t/77t+BHeZ
         t7xrF5J0R5m4PGjazaGLJLVjtek4TVzJMDbsepCHgE8PsI9pTUHIWQtmC9PpdVMlBGFx
         sw+WTW5VLE1xU0p+dIgeqI9kKhAvtN63lOSXW0ZSrRC9KAjQFKFRIJILturKOy28QyhN
         OBart2dNE9mkwDTOSm6htXvPFvQrEuagn8ysj6UHeDkAShjGccb0uKYhqFhw6lDOqZsI
         bqeA==
X-Forwarded-Encrypted: i=1; AJvYcCXAGt2L+rKJtxTUzRqfSbc6wkvebtwG9JmC+Il5I4Th+w5iwCGBY2beeWpAK6rfFx3ef11KdYSpRnbLyWnAXeXQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyGUHOJ5+8MDXHC2x+skY0wfWUC0X4MX/SeTeuJEE4mj17lFnwk
	FTPnvxb+LitIpaysHeyDRBsdqwCRbI6YJkDAvSD7Gn41VtSmwbWpQuAo4cOjmA==
X-Gm-Gg: ASbGncsnlwxqGlCko+5PATWcfeVrWDgjoefNjdYSv4qkwjiVXQdlel7vpHXWoiJa2zs
	y9i+J80QXocOdmhS7lLoRFKmblZk73sSSqoLkw76XAuDcEImogIDtof9O3mH/8OTxbRYrAmn25P
	JTSK4dYM1BbuOmIrInGEZfr+MLrOuHWRyEUBppi3QCzC8AqPgEMAIbKUX0UfA4FE+cp332OazUp
	A7Rs+Pbrrw3tLGlWZnpznm688z/5Axg6fb1SDB1jiMAxFCn2wGxgBu3CORb/KsLwiNNXaTZpBxZ
	OQVznkzkHMm+
X-Google-Smtp-Source: AGHT+IGQyoODgkoUO+Oc0opjizE3auLPjFl7HcIY2FHdwIvo4FWM24+WSW6gR/vIwAErqWTGt1UzGQ==
X-Received: by 2002:a17:906:4d2:b0:aa6:aa89:6d5e with SMTP id a640c23a62f3a-aa6aa8971d4mr141516366b.18.1733843758225;
        Tue, 10 Dec 2024 07:15:58 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68f4eb962sm281095666b.3.2024.12.10.07.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 07:15:57 -0800 (PST)
Date: Tue, 10 Dec 2024 15:15:54 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/18] KVM: arm64: Change the layout of enum
 pkvm_page_state
Message-ID: <Z1hbKrUPXdEokXpP@google.com>
References: <20241203103735.2267589-1-qperret@google.com>
 <20241203103735.2267589-2-qperret@google.com>
 <CA+EHjTxfchr+ggO_z_zrrFTrFpS3oTJXt13t-854xWxYY=oSQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxfchr+ggO_z_zrrFTrFpS3oTJXt13t-854xWxYY=oSQQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_071601_378685_E7873256 
X-CRM114-Status: GOOD (  24.54  )
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

Hey Fuad,

On Tuesday 10 Dec 2024 at 12:59:44 (+0000), Fuad Tabba wrote:
> Hi Quentin,
> 
> On Tue, 3 Dec 2024 at 10:37, Quentin Perret <qperret@google.com> wrote:
> >
> > The 'concrete' (a.k.a non-meta) page states are currently encoded using
> > software bits in PTEs. For performance reasons, the abstract
> > pkvm_page_state enum uses the same bits to encode these states as that
> > makes conversions from and to PTEs easy.
> >
> > In order to prepare the ground for moving the 'concrete' state storage
> > to the hyp vmemmap, re-arrange the enum to use bits 0 and 1 for this
> > purpose.
> >
> > No functional changes intended.
> >
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > index 0972faccc2af..ca3177481b78 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -24,25 +24,28 @@
> >   */
> >  enum pkvm_page_state {
> >         PKVM_PAGE_OWNED                 = 0ULL,
> > -       PKVM_PAGE_SHARED_OWNED          = KVM_PGTABLE_PROT_SW0,
> > -       PKVM_PAGE_SHARED_BORROWED       = KVM_PGTABLE_PROT_SW1,
> > -       __PKVM_PAGE_RESERVED            = KVM_PGTABLE_PROT_SW0 |
> > -                                         KVM_PGTABLE_PROT_SW1,
> > +       PKVM_PAGE_SHARED_OWNED          = BIT(0),
> > +       PKVM_PAGE_SHARED_BORROWED       = BIT(1),
> > +       __PKVM_PAGE_RESERVED            = BIT(0) | BIT(1),
> >
> >         /* Meta-states which aren't encoded directly in the PTE's SW bits */
> > -       PKVM_NOPAGE,
> > +       PKVM_NOPAGE                     = BIT(2),
> >  };
> > +#define PKVM_PAGE_META_STATES_MASK     (~(BIT(0) | BIT(1)))
> >
> >  #define PKVM_PAGE_STATE_PROT_MASK      (KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
> >  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> >                                                  enum pkvm_page_state state)
> >  {
> > -       return (prot & ~PKVM_PAGE_STATE_PROT_MASK) | state;
> > +       BUG_ON(state & PKVM_PAGE_META_STATES_MASK);
> 
> This is a slight change in functionality, having a BUG_ON instead of
> just masking out illegal states. Is it necessary?

Yep, this is arguably a bit zealous. Passing e.g. PKVM_NOPAGE to
pkvm_mkstate() would be properly bogus, so having a WARN_ON() or
BUG_ON() in there is still a good thing, but it should be done in a
separate patch.

I'll rework in v3.

> > +       prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> > +       prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> > +       return prot;
> >  }
> >
> >  static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
> >  {
> > -       return prot & PKVM_PAGE_STATE_PROT_MASK;
> > +       return FIELD_GET(PKVM_PAGE_STATE_PROT_MASK, prot);
> >  }
> >
> >  struct host_mmu {
> > --
> > 2.47.0.338.g60cca15819-goog
> >


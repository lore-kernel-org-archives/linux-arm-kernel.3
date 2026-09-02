Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CBCC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKnXY7MEBAIT2z0U8Pdm3ub9BknRxPDK3T/7b/5NYBI=; b=QaBYpH9jL/h/kX+wOz25uTxg6i
	Qkqy8pkiak/hyUVhxkbk2ZZ3oGl1uVxNTZlkWo6Fy6Yvwchd2oA1OnITAPej9bJoasYfYeFtKuflh
	J4oXlvyPLr9+0SRgQOjESB/058ERpmdeVNZCQ9wNK1xs7wISpBPXJVw3ubCOF/Y+eJwSO19mGW17i
	nSw0dbm++/Hm1ZkdExwYOYPwgh4dNM3ep5HqNADyz16qeHZAhaPeml6NNX1xv6/ZUYVNaTLYt9A2t
	Dj5DrTH6lYyY+qBUT1urucZz5kU+jeczdAVutKYwTIxZj/JsocSWyZMn1ookcN+NZROOsUqSoy9vn
	xmV/pW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jGH-0000000EWlp-23p2;
	Wed, 02 Sep 2026 11:36:13 +0000
Received: from out-57.mta1.migadu.com ([2001:41d0:203:375::39] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jGE-0000000EWkR-3oE6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:36:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=BiRsbHGkJc2vaZ1y6LTSpqtajhdT9mOwKxmAqCYwFoc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788348968; v=1; x=1788953768;
 b=CgvumHaxdlWCIiopNiouEMsg/hfQwLmFjQ1Cuj/92szWL5ZQm0o0iTbfBm7/ZaWDLQS/qso/
 hcifsDp5iKl3Ey1GV5flW6z0q0VJVogNcug3WLA35eBBh/Y9+zZ/5HJCCadIbu7LE30JPEK6XK0
 fNtTKoHbRa4TvlhxLYENrNsY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5c7b5269bb86d779;
	Wed, 02 Sep 2026 11:36:08 +0000
X-Mizu-Trace-ID: 5c7b5269bb86d779
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so738e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 04:36:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzyBGL/d8QyfxhR4zFMrGxjvHPU8zqYX6E9ERZ5zfYeCx37eAXhGA6fwRLj4M5GKtVjzVY8/By0gtBV5h44/YVh@lists.infradead.org
X-Gm-Message-State: AFuF++nP+iNvKCXt7YX/tzSrpLu2ml8kQK9f5N7XXpOFF64WBWDkXWAw
	+7x3opzecmb/f6AB5mi2ugNQwB3IwFQBIkjLU7tL+/Bl3eoSomYd4WHaS9pRuypAAaiOcVf/NLi
	/H9qJdJYuvAMORcjYRkoSkMziNc5St+BUeYM8sYC/
X-Received: by 2002:a05:6512:3093:b0:5ae:a4e8:47be with SMTP id
 2adb3069b0e04-5b60d6755a2mr15375e87.7.1788348963517; Wed, 02 Sep 2026
 04:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260831163421.272420-1-fuad.tabba@linux.dev> <20260831163421.272420-5-fuad.tabba@linux.dev>
 <apf2jvCicXlw7JYP@e143914.arm.com>
In-Reply-To: <apf2jvCicXlw7JYP@e143914.arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 2 Sep 2026 12:35:27 +0100
X-Gmail-Original-Message-ID: <CA+EHjTww35U372+YMHZTU-qP_C6+9wTxU9YWC3tZk8rm33zgVQ@mail.gmail.com>
X-Gm-Features: AcwNN1VE-_5vfzg4Lhs7Q3UcFlXLB7ylH5M4tdjkXzGG-P3YyREDqCRKlfdtavY
Message-ID: <CA+EHjTww35U372+YMHZTU-qP_C6+9wTxU9YWC3tZk8rm33zgVQ@mail.gmail.com>
Subject: Re: [PATCH 04/17] KVM: arm64: Introduce per-EC entry handlers for pKVM
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_043611_088150_344E1166 
X-CRM114-Status: GOOD (  28.05  )
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

On Wed, 2 Sept 2026 at 11:12, Joey Gouly <joey.gouly@arm.com> wrote:
>
> On Mon, Aug 31, 2026 at 05:34:08PM +0100, Fuad Tabba wrote:
> > From: Marc Zyngier <maz@kernel.org>
> >
> > Add an ESR_EL2.EC-indexed handler table, entry_hyp_vm_handlers[],
> > consulted from flush_hyp_vcpu() on re-entry when the previous exit was
> > a trap: sync_hyp_vcpu() records the exit reason in the hyp vCPU as
> > exit_code, and the trap's exception class comes from its ESR_EL2.
> >
> > Entry carries the host's requested PC updates to the hyp vCPU: add
> > vcpu_copy_flag() to copy a masked set of flags between the two vCPU
> > structures, with PC_UPDATE_REQ covering INCREMENT_PC and the
> > pending-exception flags. The wholesale iflags copy moves into the
> > non-protected branch; a protected vCPU takes only PC_UPDATE_REQ.
> >
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>
> Not really looked at nVHE much (or pkvm ever), but:

That's a plus. Good to get a fresh perspective on the code.

> Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks for the review!
/fuad

>
> > ---
> >  arch/arm64/include/asm/kvm_host.h      | 19 +++++++++++++
> >  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  3 ++
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c     | 39 +++++++++++++++++++++++---
> >  3 files changed, 57 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 27fe0cd5b2d7a..78a4d387f9fd4 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1033,11 +1033,28 @@ struct kvm_vcpu_arch {
> >               set;                                            \
> >       })
> >
> > +#define __vcpu_copy_flag(vt, vs, flagset, f, m)                      \
> > +     do {                                                    \
> > +             typeof(vs->arch.flagset) tmp, val;              \
> > +                                                             \
> > +             __build_check_flag(vs, flagset, f, m);          \
> > +                                                             \
> > +             val = READ_ONCE(vs->arch.flagset);              \
> > +             val &= (m);                                     \
> > +             __vcpu_flags_preempt_disable();                 \
> > +             tmp = READ_ONCE(vt->arch.flagset);              \
> > +             tmp &= ~(m);                                    \
> > +             tmp |= val;                                     \
> > +             WRITE_ONCE(vt->arch.flagset, tmp);              \
> > +             __vcpu_flags_preempt_enable();                  \
> > +     } while (0)
> > +
> >  #define vcpu_get_flag(v, ...)        __vcpu_get_flag((v), __VA_ARGS__)
> >  #define vcpu_set_flag(v, ...)        __vcpu_set_flag((v), __VA_ARGS__)
> >  #define vcpu_clear_flag(v, ...)      __vcpu_clear_flag((v), __VA_ARGS__)
> >  #define vcpu_test_and_clear_flag(v, ...)                     \
> >       __vcpu_test_and_clear_flag((v), __VA_ARGS__)
> > +#define vcpu_copy_flag(vt, vs, ...) __vcpu_copy_flag((vt), (vs), __VA_ARGS__)
> >
> >  /* KVM_ARM_VCPU_INIT completed */
> >  #define VCPU_INITIALIZED     __vcpu_single_flag(cflags, BIT(0))
> > @@ -1055,6 +1072,8 @@ struct kvm_vcpu_arch {
> >  #define INCREMENT_PC         __vcpu_single_flag(iflags, BIT(1))
> >  /* Target EL/MODE (not a single flag, but let's abuse the macro) */
> >  #define EXCEPT_MASK          __vcpu_single_flag(iflags, GENMASK(3, 1))
> > +/* Cover both PENDING_EXCEPTION and EXCEPT_MASK for global operations */
> > +#define PC_UPDATE_REQ                __vcpu_single_flag(iflags, GENMASK(3, 0))
> >  /* Host-set: the hyp flushes the non-protected vCPU state in on entry */
> >  #define PKVM_HOST_STATE_DIRTY        __vcpu_single_flag(iflags, BIT(4))
> >
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > index c904647d2f760..49a0a992047ba 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > @@ -26,6 +26,9 @@ struct pkvm_hyp_vcpu {
> >        * per-cpu pointer tracking us. Otherwise, NULL if not loaded.
> >        */
> >       struct pkvm_hyp_vcpu **loaded_hyp_vcpu;
> > +
> > +     /* The previous exit's ARM_EXCEPTION_* code. */
> > +     u32 exit_code;
> >  };
> >
> >  /*
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index b6bfe502bcd04..ca7122b0bccdd 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -31,6 +31,17 @@ unsigned int hyp_gicv3_nr_lr;
> >
> >  void __kvm_hyp_host_forward_smc(struct kvm_cpu_context *host_ctxt);
> >
> > +typedef void (*hyp_entry_exit_handler_fn)(struct pkvm_hyp_vcpu *);
> > +
> > +static void handle_vm_entry_generic(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +     vcpu_copy_flag(&hyp_vcpu->vcpu, hyp_vcpu->host_vcpu, PC_UPDATE_REQ);
> > +}
>
> This is added here because the full copy of iflags was moved into the
> !pkvm_hyp_vcpu_is_protected() section, so is needed temporarily until
> each EC has its own handler.
>
> Thanks,
> Joey


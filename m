Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DC7E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCeBFQbxDNcGU8eAxUj/y7sI+rg04GZNTgWblO08pkI=; b=iI1Z7X7dL+BGhaTclt89+jCHui
	nYaUe449n68RVcupLJAyM5zO7pa9xm8ZJqlCDZ+ix7hQXjh97oYWMKxGrtOvGBs/P+vxvVDoiiimf
	HvHyz4+2DwbxXYsCWMjcowJHP0W29cR/xIZzPav4E4WmTpPlXGOQ5+LzrwAamsOmXCqZi7FJNC2qU
	DHdFqKEpwfk3u8UtYfP6dVs3ZB7rAUitLnstICC95AexvU2t5tXlT+7JQ8z3FW78o+xLz5PCye+JC
	E5v0ATUT2hFK0N94OLI+aVo2qMRXjn9jV1wMJnFZDFE9pWgEriBk5twlCbj+IRpIbnctBLC6fiK9v
	I8iwjRMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJa9-0000000EWIq-22xh;
	Wed, 11 Dec 2024 10:04:37 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJZ5-0000000EWBh-0Oep
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 10:03:32 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5cfa1ec3b94so8822617a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 02:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733911409; x=1734516209; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uCeBFQbxDNcGU8eAxUj/y7sI+rg04GZNTgWblO08pkI=;
        b=G6fgf3fwIJMnUveLyVjeIxGO6Nah7vlF3LtZYOK9jc/n0N8K41d+vcmXlg0yVUl2RX
         +GohzZug5tG9HgmDvBp5SE9wvdfuVdVGxBVCsOU28XEX9RbMGLc8ZZmk9uWUQvs+ezFv
         GFS4xDKCIRNeE75fbF8eJXLWMnQzW3kHNJlLhvOQsLbULpxJFW66UkIHOgK92yxtFtzW
         DXz7DDi2KDcUO7gguJYft1Zue4F5wXOizaVhQlMsTFH8XDqhS+LVyCPGWI8OJCDv//yO
         ARVYTq5jZmND5iAn3QXvegw9MzPZIZKOKRKZOBZ3EXckOS8wCAkdrqOD8r+qU58pvlqP
         OVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733911409; x=1734516209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCeBFQbxDNcGU8eAxUj/y7sI+rg04GZNTgWblO08pkI=;
        b=TEJuvsh54DxwnmuYvZdstxzc0rt+YOCnO/hA70Xl8cAVl8e0Skpk0eU2MXsg6NRpP5
         ey+0acRiCO4eRkksN3iErT+RjjgwQeozO1AsiwO1omA1YJrnqoqZsCVv7p6+utb6wGGz
         dCUMP1Qqo66G5BNQAMB7jybYiyhjt4ESPbI+t4HjaGxgga/IcYOg7BpPzYerwulR4zUO
         ZETerJmUM6pwhgPN1gtVr1RPhVdLJst4nVAfGb4Yxb+kPfnh/ZRK45TsflEb7oTPkWlE
         aJ+5oppRJGr25rPnV4LA2Ha0/HVKqxxQ3etz99Z0NLjWZiO/rFNGoaO1/daPTfYjqbVU
         V+tw==
X-Forwarded-Encrypted: i=1; AJvYcCXnexJ0QcC67C9L01I7i2em2/eU5Ha+ERRYrc3GFflqMiooOlZnnZxiS1/sTdJuOI0PCwj1XKkoEjWA4ao9Yo5H@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkesu4gMkcN4h89XUuRI3TqdV1ajjf7Nqn15mxlKF6TnyLniua
	1OFZ9Bl0wILRiJkPYU3Al+tcCMQUP75P/w7eKSzNKSDGjduvDgjEoH6nJ45uow==
X-Gm-Gg: ASbGncvSaUqOmZt6n+cl6Rw2hxC576rJKerDVQuHdEFzgT1zCODPC8lXcBUnmFRgV2J
	GICDixmsG1EijB3uXJg/2yDpHYc3VUDnHTvigOyJIE4TLb+zaq8nKnUAVuyIO5hv9zKd8EIORZV
	oOKHYx0PiL+OPhFi35uXYvGxqzKztDFj2xHpz9+jduqBSTrdjhmUa53OMHBEt44/UcS2vhrZXXK
	iLAwYDKgUX06KatOClIkXVVgcNkt5H5B3QTlctVLFKzgEpIZKJjNMDOp8DZaZnt5FhdCI/zlNmV
	dpCnwv96NDlR
X-Google-Smtp-Source: AGHT+IFlnlrpokPXa68KO5qLY5+q1kB5CE8QSEZpGK7a+vw6fuvmt14yba9TOC/UESn8Ss3rIxUq4w==
X-Received: by 2002:a17:906:30d1:b0:aa6:6e41:ea55 with SMTP id a640c23a62f3a-aa6b112c3c6mr209577866b.7.1733911408899;
        Wed, 11 Dec 2024 02:03:28 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68880b3f7sm433504366b.92.2024.12.11.02.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 02:03:28 -0800 (PST)
Date: Wed, 11 Dec 2024 10:03:24 +0000
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
Subject: Re: [PATCH v2 16/18] KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
Message-ID: <Z1ljbPFsUdUC8AD3@google.com>
References: <20241203103735.2267589-1-qperret@google.com>
 <20241203103735.2267589-17-qperret@google.com>
 <CA+EHjTw_e_q5TFkgxvVDKxwj-C5S0Hd1OfVO4_FitrB8_J2Rpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTw_e_q5TFkgxvVDKxwj-C5S0Hd1OfVO4_FitrB8_J2Rpw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_020331_133270_0C243162 
X-CRM114-Status: GOOD (  28.29  )
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

On Tuesday 10 Dec 2024 at 15:23:02 (+0000), Fuad Tabba wrote:
> Hi Quentin,
> 
> On Tue, 3 Dec 2024 at 10:38, Quentin Perret <qperret@google.com> wrote:
> >
> > Introduce a new hypercall to flush the TLBs of non-protected guests. The
> > host kernel will be responsible for issuing this hypercall after changing
> > stage-2 permissions using the __pkvm_host_relax_guest_perms() or
> > __pkvm_host_wrprotect_guest() paths. This is left under the host's
> > responsibility for performance reasons.
> >
> > Note however that the TLB maintenance for all *unmap* operations still
> > remains entirely under the hypervisor's responsibility for security
> > reasons -- an unmapped page may be donated to another entity, so a stale
> > TLB entry could be used to leak private data.
> >
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_asm.h   |  1 +
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 17 +++++++++++++++++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > index 6178e12a0dbc..df6237d0459c 100644
> > --- a/arch/arm64/include/asm/kvm_asm.h
> > +++ b/arch/arm64/include/asm/kvm_asm.h
> > @@ -87,6 +87,7 @@ enum __kvm_host_smccc_func {
> >         __KVM_HOST_SMCCC_FUNC___pkvm_teardown_vm,
> >         __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
> >         __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
> > +       __KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
> >  };
> >
> >  #define DECLARE_KVM_VHE_SYM(sym)       extern char sym[]
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index de0012a75827..219d7fb850ec 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -398,6 +398,22 @@ static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
> >         __kvm_tlb_flush_vmid(kern_hyp_va(mmu));
> >  }
> >
> > +static void handle___pkvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
> > +{
> > +       DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
> > +       struct pkvm_hyp_vm *hyp_vm;
> > +
> > +       if (!is_protected_kvm_enabled())
> > +               return;
> > +
> > +       hyp_vm = get_pkvm_hyp_vm(handle);
> > +       if (!hyp_vm)
> > +               return;
> > +
> > +       __kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
> > +       put_pkvm_hyp_vm(hyp_vm);
> > +}
> 
> Since this is practically the same as kvm_tlb_flush_vmid(), does it
> make sense to modify that instead (handle___kvm_tlb_flush_vmid()) to
> do the right thing depending on whether pkvm is enabled? Thinking as
> well for the future in case we want to support the rest of the
> kvm_tlb_flush_vmid_*().

I considered it, but the two implementations want different arguments --
pkvm wants the handle while standard KVM uses the kvm struct address
directly. I had an implementation at some point that multiplexed the
implementations on a single HVC (we'd interpret the arguments
differently depending on pKVM being enabled or not) but that felt more
error prone than simply having two HVCs.

Happy to reconsider if we can find a good way to make it work though.


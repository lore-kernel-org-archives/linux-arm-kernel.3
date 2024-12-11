Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF53E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeXMj8VvPwXBM+YorP3kB6swE+LJumb2PgH049Y7jrU=; b=0DQnZp72g5Y9pdloXFKkrrweno
	WqJesuBEuqGDEa1QPyLRt6vT4lM8MKZAANfvv7QnSjDLKKS6jTBCxYHC+L9a8WOd0rWckJBg43Unf
	U9G+XBNeJ4EaRvrSueYqq5XgJkOOGq+ft6WL7l8a/dQflX1www6xO6bghGJtC9bVlNz8BV2R3LU78
	l7tZctcudfVcZtKIkL19d20K/O+HJNXZJuhMH1ll5L9UZOFk2rHhtzLZc/QNUWWWI+i0H2gtSOhlr
	mzO5CmlZOK2Bev+UJl99pCS/wpjSdqRuLn0SOMvaWJyZkJ7DlmPW9kBxzEswJYQEpuJZkQMZhMtQf
	9Ijca6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJvU-0000000EZgY-0sNc;
	Wed, 11 Dec 2024 10:26:40 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJqw-0000000EYta-1Zz5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 10:21:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434fa6bf6e4so28625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 02:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733912517; x=1734517317; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BeXMj8VvPwXBM+YorP3kB6swE+LJumb2PgH049Y7jrU=;
        b=Cba5zYLdgdFd6t1Dme88De28yUUwCDG6JxcT3oz8laPsgt9C555Ab96hO0hAnCH4+k
         IFibrkQuy7GL6V25UbKKe+AYjAQC4Lnc/i0pFihHnoVyu6EL7aJeev07KB5oYeL52tNW
         VeHTrvx4FT7gZ6ynagJECib0NYYMWz4nvDLvk/+AOjJdCgfHFuNkOjRRiuxvNQNPlXmO
         XUz3H50AnEM+Z18Tz25ZVnWg69UzO4ecXeJlVRCw321snLmuVMgkdCdvXTLWvBxc0Mek
         9VDwJtqENy/3bvUAvbd041MZWK7ZV88ajAlc531bH+lckd+VBCjVWpim5CXhv2o8KGXQ
         yhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912517; x=1734517317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeXMj8VvPwXBM+YorP3kB6swE+LJumb2PgH049Y7jrU=;
        b=goU70g1MN1yyyyKGDjOmh55h8rGNIGDpptKtZBYXAaPbnrn4dlniOEfSDtRhhkPDVw
         ZB70fqHG1pv8hgRlF5NPN7ImJzbEb9Ut/F8yhcNsl5pQaxviDk6m581VonaBnbwMCx7r
         c0JYOGgcOzQye/kgrZFlwf2B4e2Rky5cwWjWuAsepneNxb8ZFWPEcyzHh2mGyydzV2tA
         XQWuiw0VV24FML4vV3xUIIhcO7W+r2mA9e5Bw2itvf00P1OqQReCj8syGYzPPNH9cJic
         mbSRigqj68p5h1EzevyTzT1zwKHoLoAORz/janLR5qHaiQZuXX7PpvX9K/UEOF1yUbsu
         t5dg==
X-Forwarded-Encrypted: i=1; AJvYcCX+ID4ra8COpCvDT5s9zJ1H5AxmaDQlB3p4SZkw6HhFT8BU5U2MhgUcC3sev/QgG56YRohMMoIiTEaXvEJ+a3ok@lists.infradead.org
X-Gm-Message-State: AOJu0YzEJoQtYIMzg+vnS3QbNxZ02Zz6mIsJOXfimmX2+iEuTtuX0KYV
	/VX2VT56uYDvKq3V8C03fc/Aqs5gtRcC4wDxwdYWMkmvWUvPbcYZWvVUhCi/GLeCrpiTDMDGOIb
	sJeKRUDDsmOtJSSdFD+fUtcgCu0fuweQmguul
X-Gm-Gg: ASbGncuU3nb6fV4L5SEoZLQx3EqPLeZ3bmlvEG5WA1qEG3yyOrabFXRlNWGzdjNL/CR
	tHqvaXsbhvQ5Xm6V9jJiUsqjq7hMP8axXFCdGvrmhggbrJHq0ssvvtixqNYKV12Ny
X-Google-Smtp-Source: AGHT+IGdAegS44TMEDlVdgvzE+gKy2ozwm3TkkcQ7rpYSyvhwicVZQRotOml5HMNIrItY+DK9IjWorBpSsLKxTL7rAM=
X-Received: by 2002:a05:600c:490a:b0:42c:9e35:cde6 with SMTP id
 5b1f17b1804b1-4361c0e320bmr1000685e9.2.1733912516699; Wed, 11 Dec 2024
 02:21:56 -0800 (PST)
MIME-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com> <20241203103735.2267589-17-qperret@google.com>
 <CA+EHjTw_e_q5TFkgxvVDKxwj-C5S0Hd1OfVO4_FitrB8_J2Rpw@mail.gmail.com> <Z1ljbPFsUdUC8AD3@google.com>
In-Reply-To: <Z1ljbPFsUdUC8AD3@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Dec 2024 10:21:20 +0000
Message-ID: <CA+EHjTwnZ8S4LUgmJ40g8juHh5OneWUWtJDDCnn03Xw0MvQ-=A@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_022158_413069_6FB109D7 
X-CRM114-Status: GOOD (  31.55  )
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

Hi Quentin,

On Wed, 11 Dec 2024 at 10:03, Quentin Perret <qperret@google.com> wrote:
>
> On Tuesday 10 Dec 2024 at 15:23:02 (+0000), Fuad Tabba wrote:
> > Hi Quentin,
> >
> > On Tue, 3 Dec 2024 at 10:38, Quentin Perret <qperret@google.com> wrote:
> > >
> > > Introduce a new hypercall to flush the TLBs of non-protected guests. The
> > > host kernel will be responsible for issuing this hypercall after changing
> > > stage-2 permissions using the __pkvm_host_relax_guest_perms() or
> > > __pkvm_host_wrprotect_guest() paths. This is left under the host's
> > > responsibility for performance reasons.
> > >
> > > Note however that the TLB maintenance for all *unmap* operations still
> > > remains entirely under the hypervisor's responsibility for security
> > > reasons -- an unmapped page may be donated to another entity, so a stale
> > > TLB entry could be used to leak private data.
> > >
> > > Signed-off-by: Quentin Perret <qperret@google.com>
> > > ---
> > >  arch/arm64/include/asm/kvm_asm.h   |  1 +
> > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 17 +++++++++++++++++
> > >  2 files changed, 18 insertions(+)
> > >
> > > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > > index 6178e12a0dbc..df6237d0459c 100644
> > > --- a/arch/arm64/include/asm/kvm_asm.h
> > > +++ b/arch/arm64/include/asm/kvm_asm.h
> > > @@ -87,6 +87,7 @@ enum __kvm_host_smccc_func {
> > >         __KVM_HOST_SMCCC_FUNC___pkvm_teardown_vm,
> > >         __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
> > >         __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
> > > +       __KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
> > >  };
> > >
> > >  #define DECLARE_KVM_VHE_SYM(sym)       extern char sym[]
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > index de0012a75827..219d7fb850ec 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > @@ -398,6 +398,22 @@ static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
> > >         __kvm_tlb_flush_vmid(kern_hyp_va(mmu));
> > >  }
> > >
> > > +static void handle___pkvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
> > > +{
> > > +       DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
> > > +       struct pkvm_hyp_vm *hyp_vm;
> > > +
> > > +       if (!is_protected_kvm_enabled())
> > > +               return;
> > > +
> > > +       hyp_vm = get_pkvm_hyp_vm(handle);
> > > +       if (!hyp_vm)
> > > +               return;
> > > +
> > > +       __kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
> > > +       put_pkvm_hyp_vm(hyp_vm);
> > > +}
> >
> > Since this is practically the same as kvm_tlb_flush_vmid(), does it
> > make sense to modify that instead (handle___kvm_tlb_flush_vmid()) to
> > do the right thing depending on whether pkvm is enabled? Thinking as
> > well for the future in case we want to support the rest of the
> > kvm_tlb_flush_vmid_*().
>
> I considered it, but the two implementations want different arguments --
> pkvm wants the handle while standard KVM uses the kvm struct address
> directly. I had an implementation at some point that multiplexed the
> implementations on a single HVC (we'd interpret the arguments
> differently depending on pKVM being enabled or not) but that felt more
> error prone than simply having two HVCs.
>
> Happy to reconsider if we can find a good way to make it work though.

I don't have a strong opinion about this. I think that for now, since
it's only this function, it's probably fine. That said, the
multiplexing is (as of patch 18, which I haven't reviewed yet) is just
lifted higher up to the host kernel, albeit with fewer parameters to
wiggle around.

To summarize, I think we can worry about it if/once we need the other
tlb_flush_* variants.

Cheers,
/fuad


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA45E94102
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 23:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaCAmCD1pI2PB4kVDvq818qZSC88KaBTxMeyOFyVIUw=; b=MH1BZY5j1OMBB5zZWbXSi1HCaE
	rkxdcCojfF2ffRG9fw06Oa8ROnKAxJfImoI1+oyOgWp51IUt6nV3YxAWahgDnWKXMfaLxg7/P8CQ1
	akKn6h5dLwEAepHt2vEPZcQvhtwI+HVCTbB8VMGcAvLJW3dJo/ARJb4CbbuODWXAln98gQnIxYXa+
	7f3XV8eosJgTSwIG92R1jWF+IjoDqpmWbwORaTZ+L5oxKHial5wxnp9f52fQesvlH8icnnpg2B3Lp
	F3xLPbrjGP6Voa0IyiniK+Yhe3BaNbxPl4Rnz3QW8Xvzf5fzxhqTpPrI8Ne12FEk3FsLKUFWhwaTl
	zuruulGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaN7A-00000004ADM-1Z1c;
	Mon, 29 Dec 2025 23:57:28 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaN76-00000004ABy-3sB1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 23:57:26 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso17965645b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 15:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767052643; x=1767657443; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaCAmCD1pI2PB4kVDvq818qZSC88KaBTxMeyOFyVIUw=;
        b=Exbi19g3iSDD1XlqrHs8hWXWfmGesph4xEIEbHgDuiBvpXDanlClvqhxWfmVOv6b2X
         u35MpWa+wCc9krpswJEDzLDIGel0bqzE6PM7NoiU18jC84uTEvHIJDI7F2ZzM4+elE7K
         6h5OfCk2Dt7J9TO+R4VK/8qbdTU6axjopdF2Rx/8SUKexFc0ERSicHfdocV6XEKGQIp4
         vJhozZaaUvTy7sEDBYpJVoRCXxicW130vtn0xfH6iUzbp891u4BniP3pO0PasBaEgSiQ
         4D3uHWji4cT4HxCqiJR97xASV+7IGhKfJNHnGWIjFjNZYlUwwaFBfHP8/Y+ADfM2t03X
         EHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767052643; x=1767657443;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vaCAmCD1pI2PB4kVDvq818qZSC88KaBTxMeyOFyVIUw=;
        b=ZuqhOjmHnpowrium/olskaxd3g5HGsZCJ4H/7i2RLAyPb6j7KWYnfR7qD7FnrIU3z/
         0iNNSAD4sAvcMKXKKUndw34GnMsdI18+zws4g5OaaP3o7YC4AA2CK5GazI8J/q1zfXb8
         Z1ITD4k14yM0I0243gMAFw1SYmHoyIcLqWJQOt0Vo15ChQMIx7euBxMHPnDbkDLFugzl
         zKNTy6NWt+IPLZieeyDi46WdSfBUDbwL+BqsAQgfaxepWVU6aHtdEBMwZf508nqNdEYT
         vwD1vxIEZ9H6Kq71tYBoEiBPuBKtgWfzjMHM7GpV4lufdVlzEr6Ld2+gIYLo1KFYneAI
         gziw==
X-Forwarded-Encrypted: i=1; AJvYcCUvQOsvPcimMMOeVvDpWuX9eKoOC+L9J2BzT8QqVewWjvIxTVM44iNInNI52gIInb8mHaGGXkCt8NB0JS7bqJ+o@lists.infradead.org
X-Gm-Message-State: AOJu0Yw49wyZmrXyL7S/mphNt/RubiI6fthgkqREUQqnbgvh5lsNGUyK
	gKrAcEYELMFadHUraKeeju2ZmdH4k9Q87u+UAY0s34sV1eUJTb7NQ1xmUJmQUoIQEiJc1NqGpO7
	ScvpTuQ==
X-Google-Smtp-Source: AGHT+IGWSzvMBdAgSpc1cQ4FNAzud2F9vkcmbgsGWHl/uECW+mXFCBlsNw6jhBxprH27ZWhYhxw4eDFyKfA=
X-Received: from pjhk89.prod.google.com ([2002:a17:90a:4ce2:b0:34c:1d76:2fe9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9185:b0:343:af1:9a57
 with SMTP id adf61e73a8af0-376aa8e98d6mr28981483637.56.1767052643109; Mon, 29
 Dec 2025 15:57:23 -0800 (PST)
Date: Mon, 29 Dec 2025 15:57:21 -0800
In-Reply-To: <43d1cde6-2277-4f3c-8e7d-59e6edb2228a@linux.intel.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com> <20251206001720.468579-16-seanjc@google.com>
 <43d1cde6-2277-4f3c-8e7d-59e6edb2228a@linux.intel.com>
Message-ID: <aVMVYY_WkNClfXuj@google.com>
Subject: Re: [PATCH v6 15/44] KVM: x86/pmu: Snapshot host (i.e. perf's)
 reported PMU capabilities
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Xudong Hao <xudong.hao@intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_155724_966064_BE082CA2 
X-CRM114-Status: GOOD (  21.31  )
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

On Thu, Dec 25, 2025, Dapeng Mi wrote:
>=20
> On 12/6/2025 8:16 AM, Sean Christopherson wrote:
> > Take a snapshot of the unadulterated PMU capabilities provided by perf =
so
> > that KVM can compare guest vPMU capabilities against hardware capabilit=
ies
> > when determining whether or not to intercept PMU MSRs (and RDPMC).
> >
> > Reviewed-by: Sandipan Das <sandipan.das@amd.com>
> > Tested-by: Xudong Hao <xudong.hao@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/pmu.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> > index 487ad19a236e..7c219305b61d 100644
> > --- a/arch/x86/kvm/pmu.c
> > +++ b/arch/x86/kvm/pmu.c
> > @@ -108,6 +108,8 @@ void kvm_init_pmu_capability(const struct kvm_pmu_o=
ps *pmu_ops)
> >  	bool is_intel =3D boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_INTEL;
> >  	int min_nr_gp_ctrs =3D pmu_ops->MIN_NR_GP_COUNTERS;
> > =20
> > +	perf_get_x86_pmu_capability(&kvm_host_pmu);
> > +
> >  	/*
> >  	 * Hybrid PMUs don't play nice with virtualization without careful
> >  	 * configuration by userspace, and KVM's APIs for reporting supported
>=20
> Hi Sean,
>=20
> It looks a merging error here. We don't need this patch.

Gah, right you are.  I overlooked it because it didn't conflict on a rebase=
, and
I once again forgot to test on a hybrid PMU, grr.

Thanks!

> The original patch "51f34b1 ("KVM: x86/pmu: Snapshot host (i.e. perf's)
> reported PMU capabilities")" had been merged into upstream and subsequent=
ly
> we submitted a new patch "034417c1439a ("KVM: x86/pmu: Don't try to get
> perf capabilities for hybrid CPUs")" to fix the warning introduced from
> previous patch=C2=A0 "51f34b1 ("KVM: x86/pmu: Snapshot host (i.e. perf's)
> reported PMU capabilities")". Thanks.
>=20
> -Dapeng Mi
>=20
>=20


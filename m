Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA2BCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3naOg0AXa4lxy2J7qWFZUYdZmmuSUah42Rbajn2HebA=; b=NY7I3JetysVsSjrgqsMUXQSV14
	UIzOAsqXg+tDK/RA8tp7yahYy+Fgunv4WenxR+FgxyDgM4Koc91zhSAzeERY45wxSsav2+YLAsWRw
	jr8SKar10reHrRMhOMgTDhaSvVR1UsPxuhfW81NwMDks68RHFd8r4JPLFU6Yu+7ktST7AKoM3Is1N
	ddJYxjeNLx9Ft46IXgMF1F6sMAFFeBEXeD6B/SCXPEOmF10WwcAehROZqGF4gdw4+TYoY7nD4uSW9
	nqRrOPd2NUMs16FSt6l6F2o8Qe5rg+RuSJNP8puY/rH92EviowqQSf225SBMh5jkWK8qXRl3Lp7sR
	TSECOwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96YT-00000002eFX-3nvs;
	Wed, 15 Oct 2025 18:48:57 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96YR-00000002eEu-382e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:48:56 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33428befc5bso13385705a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 11:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760554135; x=1761158935; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3naOg0AXa4lxy2J7qWFZUYdZmmuSUah42Rbajn2HebA=;
        b=uWW9SEImkZ1Wcog0/FXfsWMxOtg0nt0jP3W07wVQORtT+uI+nGFGqa0/f0bVkhZJ9t
         N6jhQ8195xiA6BAww+A3jYoxTgbmu7IQkwmzUu9EGoFhn2N8/Ks6vQvcMiZPjuqAMuSn
         +qWEjOsNTGb8pE+LHVs1t7qV9xuyW9sjIkGyk+MOzflJAKSGPEj4nwz57Cey1AM9PUIa
         oWy5BTVXn5t4LUzWGWmqn9J3JvCgrXEnJaGpNcEbzXAPPvNKcNx2vVZ09AnsWuygO72a
         UHdQBvTENRuo6KmsQl3Ewo6h986vUDPDiwr/r1qYK0q2io2tBOO8GFIvV/8SnLWTeAtT
         900Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760554135; x=1761158935;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3naOg0AXa4lxy2J7qWFZUYdZmmuSUah42Rbajn2HebA=;
        b=tO/ms5WtzIhrq+GyVHLT3aeymTzidBh5T1GvysR46Zq3aDDAyF9oZQlVPiLxwkakRt
         PvXjkZgIukSrOW6lvmOQmeXItdVycOEnOMUKNFs7Rryh6YO+RV08YmfiuLMxh8p4/m0t
         s9inQyeZX1n4FVOor1DrjeV0tcwOlTYM8oL2qO5GJ7xnMAp1P/D8O3/408Xbmhc02gRj
         /TG+LXF4YKXhsY0YuguJOdJ9X6xwpBmihIthNm1cQAeDbkzEXfH/9bqB8SeMPVniE/uv
         Kk8ZlILwEyMe5q91Anuzt74zxHR5+qWfAkzEVOo6jM51YdMVbmk//Pp0AfErpn+BK4dg
         OlsA==
X-Forwarded-Encrypted: i=1; AJvYcCXnIDVMjOqJkyRKhoaJM9qLx5VzD27xbfWqjbljE2WfMDoFuPrQ9+qY2BEXbk7K10CndZSOdukWdTfqnq1wEeHi@lists.infradead.org
X-Gm-Message-State: AOJu0YymH8UMCid+PqXOiPd0ABaNhS21fbw38hBO2QlSlGRANMJKH8Wg
	19TJo1C3sdhb8Ka4BsCJG7QaO2Z0ov/QbjrteLBWfroLlW288HJsXBwg3MzZ8BSVakSN92uApdT
	9KtpyOQ==
X-Google-Smtp-Source: AGHT+IE9eJmZgE8/vrWWkRhltj63ksxMU8MKwID4HHHoGFacVC2zof2bk9aQHK5Js4MPCgK0DcLQje9LyvY=
X-Received: from pjpx13.prod.google.com ([2002:a17:90a:a38d:b0:33b:51fe:1a93])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3909:b0:336:bfcf:c50b
 with SMTP id 98e67ed59e1d1-33b513865a2mr39206696a91.20.1760554134578; Wed, 15
 Oct 2025 11:48:54 -0700 (PDT)
Date: Wed, 15 Oct 2025 11:48:52 -0700
In-Reply-To: <0276af52-c697-46c3-9db8-9284adb6beee@linux.intel.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-33-seanjc@google.com>
 <f896966e-8925-4b4f-8f0d-f1ae8aa197f7@amd.com> <aN1vfykNs8Dmv_g0@google.com> <0276af52-c697-46c3-9db8-9284adb6beee@linux.intel.com>
Message-ID: <aO_slNn8X1A84sI-@google.com>
Subject: Re: [PATCH v5 32/44] KVM: x86/pmu: Disable interception of select PMU
 MSRs for mediated vPMUs
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Sandipan Das <sandidas@amd.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, 
	Mingwei Zhang <mizhang@google.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Sandipan Das <sandipan.das@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_114855_793020_BDF29ACF 
X-CRM114-Status: GOOD (  23.23  )
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

On Thu, Oct 09, 2025, Dapeng Mi wrote:
>=20
> On 10/2/2025 2:14 AM, Sean Christopherson wrote:
> > On Fri, Sep 26, 2025, Sandipan Das wrote:
> >> On 8/7/2025 1:26 AM, Sean Christopherson wrote:
> >>> +	return kvm_need_perf_global_ctrl_intercept(vcpu) ||
> >>>  	       pmu->counter_bitmask[KVM_PMC_GP] !=3D (BIT_ULL(kvm_host_pmu.=
bit_width_gp) - 1) ||
> >>>  	       pmu->counter_bitmask[KVM_PMC_FIXED] !=3D (BIT_ULL(kvm_host_p=
mu.bit_width_fixed) - 1);
> >>>  }
> >> There is a case for AMD processors where the global MSRs are absent in=
 the guest
> >> but the guest still uses the same number of counters as what is advert=
ised by the
> >> host capabilities. So RDPMC interception is not necessary for all case=
s where
> >> global control is unavailable.o
> > Hmm, I think Intel would be the same?  Ah, no, because the host will ha=
ve fixed
> > counters, but the guest will not.  However, that's not directly related=
 to
> > kvm_pmu_has_perf_global_ctrl(), so I think this would be correct?
> >
> > diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> > index 4414d070c4f9..4c5b2712ee4c 100644
> > --- a/arch/x86/kvm/pmu.c
> > +++ b/arch/x86/kvm/pmu.c
> > @@ -744,16 +744,13 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned=
 idx, u64 *data)
> >         return 0;
> >  }
> > =20
> > -bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu)
> > +static bool kvm_need_pmc_intercept(struct kvm_vcpu *vcpu)
>=20
> The function name kvm_need_pmc_intercept() seems a little bit misleading
> and make users think this function is used to check if a certain PMC is
> intercepted. Maybe we can rename the function to=C2=A0kvm_need_global_int=
ercept().

Yeah, I don't love kvm_need_pmc_intercept() either.  But kvm_need_global_in=
tercept()
feels too close to kvm_need_perf_global_ctrl_intercept().

Maybe something like kvm_need_any_pmc_intercept()?


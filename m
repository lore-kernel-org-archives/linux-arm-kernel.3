Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185EACAC597
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 00:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pHZG9bcElhtMtIe02tLqtkF2uGVTgQcC3bk12Urlxs=; b=3K5NlXrjhMC9q1u8e+Xtnc6C+g
	Be2LHXiVJxDsA3kep8fkdMPTtmWq+OTDx3zwhi/odXaY884ro4ZwmeNa/lIuSxEZc42pDz/duIXIs
	MNGdNoFSqKAX+hcu6kQ6PMLpTQjPm9qTHHg7wax6Gbsq3Ay7FBzaOkKtNV9Z6yjEF+FXhi2l8KXeu
	bC2FHUHJvMI8gWuwKcBEdWJy/edgnp+Vb8fdkur6oh3cGyjXVw0/+kGJnVWklGGZBrgt7gsI46S7B
	AEKL6YhTh1mCHJ1yYHyPGDkA8SYAhXjnTtMrHccSZ+xvK9jaYP4h9blbfT1wU/HBcI/V/iCKDocTz
	GMYNoxzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOiz-00000001Ux5-33K5;
	Fri, 19 Sep 2025 00:11:41 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOiw-00000001UvT-1gvO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 00:11:40 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7761dc1b36dso2894345b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 17:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758240697; x=1758845497; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5pHZG9bcElhtMtIe02tLqtkF2uGVTgQcC3bk12Urlxs=;
        b=IlMGW6tPvNpk3IW/km8vLsSnW471EIUdbYbWVXknuoRw0PEDTNWaohhCIg/+ANXNQK
         RtsmVmDO7W+BkzT24gXDy6ap0Y2WrrsebjXXEp5GBNZxV0tTMylnTghlgkSyTNSDhBa9
         uhqz6fgh91PIQO9V0P2cj8427tpakgAX+SWweY5aRa25/mY3YP3oZR5vEIpi5wuqLOZk
         MJeZJoFggRxkRuZ7oubTzARYA1xOgVv6sb5RSCgqTd0mm+6GJmMgP4xZd9awrnz059+I
         rjU23A7Br9iDmKiygeG4maB6y/Fx98yYZ8lvIg+k2oby3rZRgUZENccqis8sRu94Af+x
         zE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758240697; x=1758845497;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5pHZG9bcElhtMtIe02tLqtkF2uGVTgQcC3bk12Urlxs=;
        b=rrZGK8ve7JNSWrL3S5JyWRZFTT5ie/xnRbd/gcR/rBtnIWZKHQbBhtXxthJ0dRJXs9
         +3kwsqaDUQIHldIBz/u+ad5bd47zbXAk8F2xndxYDglpj7k90Dw4SXrxBJqTmgZ+wsO7
         i4vTWFXzU9L7i6xLfKDxOW8MCuWo8mSMcZiloXXrAPlpMj/1NV/RdnI441qjEena+nuS
         cgtL1h3dTKxihE/L2KosEqm3IvrV51XKNBpY2gNn/LHVvOxoB5enXLMzwPYIogsryGoY
         2GkiODJSh/V3iuPeiEB6BiXZLDnbRBnJAmDQ2G/aPhSCwANHVJ/p55xxO7mDQ7qSGSCX
         hq1g==
X-Gm-Message-State: AOJu0Yxa16lRHAShBL0WrCZj4i6fp1yJOHVo0ZxBGH7wkKEywua9z/SN
	Rr7AVzvBbC3TRMJRpbEx00NZr5vjoFT3I3iwQc3hvjSmmMpriYuzKbM5XeOQNAvSz1vrtjeoiZB
	yNV3lQA==
X-Google-Smtp-Source: AGHT+IHL6wVIYMVXo/qF+C7m2xAthhi9wrZHJ6iKg3qq/wSUNMfIVTHCzCbvYXSzkHH/AND/3vPqEr/ALak=
X-Received: from pjyf16.prod.google.com ([2002:a17:90a:ec90:b0:330:75c7:341c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:99a8:b0:252:3c5e:45cc
 with SMTP id adf61e73a8af0-2925d5abc4cmr2117916637.19.1758240696687; Thu, 18
 Sep 2025 17:11:36 -0700 (PDT)
Date: Thu, 18 Sep 2025 17:10:50 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <175824021167.1343722.9290387002572827825.b4-ty@google.com>
Subject: Re: [PATCH v5 00/44] KVM: x86: Add support for mediated vPMUs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_171138_437026_830C6CD8 
X-CRM114-Status: GOOD (  16.12  )
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

On Wed, 06 Aug 2025 12:56:22 -0700, Sean Christopherson wrote:
> This series is based on the fastpath+PMU cleanups series[*] (which is based on
> kvm/queue), but the non-KVM changes apply cleanly on v6.16 or Linus' tree.
> I.e. if you only care about the perf changes, I would just apply on whatever
> branch is convenient and stop when you hit the KVM changes.
> 
> My hope/plan is that the perf changes will go through the tip tree with a
> stable tag/branch, and the KVM changes will go the kvm-x86 tree.
> 
> [...]

Applied a subset (roughtly 1/4) of the KVM patches to kvm-x86 misc, as the full
thing is far too late for 6.18.  In a nutshell, all of the random prep work and
cleanups that aren't directly related to mediated PMU support.

I want to get "setup VMCS prior to kvm_x86_vendor_init()" in particular landed
to establish the order of setup operations.  The in-progress CET series moves
the _nested_ VMCS setup later, and I had a moment of panic that I was creating
incompatible patches.

[14/44] KVM: VMX: Setup canonical VMCS config prior to kvm_x86_vendor_init()
        https://github.com/kvm-x86/linux/commit/4687a2c4e6a6
[15/44] KVM: SVM: Check pmu->version, not enable_pmu, when getting PMC MSRs
        https://github.com/kvm-x86/linux/commit/e3d1f2826da6

[17/44] KVM: x86/pmu: Snapshot host (i.e. perf's) reported PMU capabilities
        https://github.com/kvm-x86/linux/commit/51f34b1e650f

[22/44] KVM: x86: Rename vmx_vmentry/vmexit_ctrl() helpers
        https://github.com/kvm-x86/linux/commit/1e24bece2681
[23/44] KVM: x86/pmu: Move PMU_CAP_{FW_WRITES,LBR_FMT} into msr-index.h header
        https://github.com/kvm-x86/linux/commit/cdfed9370b96
[24/44] KVM: x86: Rework KVM_REQ_MSR_FILTER_CHANGED into a generic RECALC_INTERCEPTS
        https://github.com/kvm-x86/linux/commit/6057497336bb
[25/44] KVM: x86: Use KVM_REQ_RECALC_INTERCEPTS to react to CPUID updates
        https://github.com/kvm-x86/linux/commit/5a1a726e68ff
[26/44] KVM: VMX: Add helpers to toggle/change a bit in VMCS execution controls
        https://github.com/kvm-x86/linux/commit/2bff2edf69ed

[29/44] KVM: x86/pmu: Use BIT_ULL() instead of open coded equivalents
        https://github.com/kvm-x86/linux/commit/30c0267f1581
[30/44] KVM: x86/pmu: Move initialization of valid PMCs bitmask to common x86
        https://github.com/kvm-x86/linux/commit/9bae7a086394
[31/44] KVM: x86/pmu: Restrict GLOBAL_{CTRL,STATUS}, fixed PMCs, and PEBS to PMU v2+
        https://github.com/kvm-x86/linux/commit/c49aa9837686

--
https://github.com/kvm-x86/linux/tree/next


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D87D3ABC4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=704FSrHxrLR1ctx2c3pAZj/r3vJEFglglFSFFl0Rh7E=; b=J73J4U0skbi9zx1rgYGy1Qf62s
	yzbZf2luwU8dZqQFK2+EEGoGBWUayJouAlAAtfYfjwi0Zo/DJ4dOumYSoZiqOWyyBqTpMum06BiPt
	giU7h+WOwX+V8kae7Ime1A0W4VmGJwoaU5USIxf6C+in40P9z2a57+0fcUkSYH3pZqPYar/DwYlFm
	AhDhbs3/+14hriVyfHSDhwaQYw44SfGk8eq/8sQBQnM7VDx2b0iaTE8bRlGQX3Kil+M7O3mzhWYG8
	UMPfzOLDVdza77vwnMCNTi552+3QSBG6Ydlxgv/3RrLvY3NXBCYPchKTWVHHNbmspgWSK19lCsYXU
	XBCtG01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0I-0000000AFXO-3nk5;
	Sat, 06 Dec 2025 00:18:26 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzk-0000000AEeJ-3zuc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:17:54 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so2996508b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980271; x=1765585071; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=704FSrHxrLR1ctx2c3pAZj/r3vJEFglglFSFFl0Rh7E=;
        b=Otg6Ilv0qWyg+WDmvHSZQqzb+UhB8ZadCehPoL80T8162Nqgiy73XpGXOUGtvwj0Bm
         eEdpgAA7Gg5l8SBkPxr8IuV9bdPhFmvdDlhBpvDIZtNhwtbDXVa3cD0RIoobWCfpYOLS
         Bj7IJir0Zp1CzqGlSd7KvQaoRdFyWF998wGL2WLrUGoVM4+AuAujdDDglhiJSmhIUm+m
         ORNgzaVZmW6NcjFILQe3cViFd5dCtHy7lv1kqVNA1Fw65X6pHXwFDSA/yoXBkk0qRDXH
         B1MIEINr6OuJCtQ8xvTItIG06NP/X/a9cLpotK5U+l2/GO4HIlSQHqIMixw4Mg55935y
         eBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980271; x=1765585071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=704FSrHxrLR1ctx2c3pAZj/r3vJEFglglFSFFl0Rh7E=;
        b=Vt87HJlQgTWeYVQxm6o/VYMm9knOp0UddlSSeIF5uEsRRN+H7HJvos7CUBQeVGEWxO
         7lEDm1Sv4tytnfON+kl75CZForhRqZxbx/m9rzlML3JWLM3AIpxSpXpGj7peQZmdvrz5
         flSo3ToJ/YzA/1XeTkwj1CN7Jr1IG+xnV661e0SMUncG4yVgBZhHI3rOUU7gRAtAYj+Z
         AaJp7rQPb1YAN9UUp2+axJ08k+4kSXOON2X0Lsn07YVSmRAxtBx+OSIcvKKlJYquybRC
         Fv+gQbQgezA3jiy7wxJg8Lw9Au3dBC6tZknzJ6Uyu5gToW8tuptK2HXjyfukXoRH/cID
         SKAQ==
X-Gm-Message-State: AOJu0YwGeduA/UJIxnIO9ACKpsNSpysTqQk9lZ5hQh2nVQuyWAdmxLfe
	GMDaeB+aMInrXSFzoT9PMb0HtINDqcJBoU8l9LJLwHJuY9nadPqboCRsLdA8ttoXqknnfnnlLF3
	gA6kWQg==
X-Google-Smtp-Source: AGHT+IH7A1gUOgKFKJnzRngtLUVtNHZRNw8i6EgWRT3b89IXq+CAXu6n1GyBnJNQ7qWDwlQy81DLJeMmjzQ=
X-Received: from pfnr5.prod.google.com ([2002:aa7:8445:0:b0:7dd:8bba:639e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2347:b0:7e8:4471:8da
 with SMTP id d2e1a72fcca58-7e8c8924252mr849439b3a.59.1764980270980; Fri, 05
 Dec 2025 16:17:50 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:48 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-13-seanjc@google.com>
Subject: [PATCH v6 12/44] perf/x86/intel: Support PERF_PMU_CAP_MEDIATED_VPMU
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_161753_141203_700A6D88 
X-CRM114-Status: GOOD (  10.45  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Kan Liang <kan.liang@linux.intel.com>

Apply the PERF_PMU_CAP_MEDIATED_VPMU for Intel core PMU. It only indicates
that the perf side of core PMU is ready to support the mediated vPMU.
Besides the capability, the hypervisor, a.k.a. KVM, still needs to check
the PMU version and other PMU features/capabilities to decide whether to
enable support mediated vPMUs.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: massage changelog]
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/intel/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index fe65be0b9d9c..5d53da858714 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5319,6 +5319,8 @@ static void intel_pmu_check_hybrid_pmus(struct x86_hybrid_pmu *pmu)
 	else
 		pmu->intel_ctrl &= ~GLOBAL_CTRL_EN_PERF_METRICS;
 
+	pmu->pmu.capabilities |= PERF_PMU_CAP_MEDIATED_VPMU;
+
 	intel_pmu_check_event_constraints(pmu->event_constraints,
 					  pmu->cntr_mask64,
 					  pmu->fixed_cntr_mask64,
@@ -6936,6 +6938,9 @@ __init int intel_pmu_init(void)
 			pr_cont(" AnyThread deprecated, ");
 	}
 
+	/* The perf side of core PMU is ready to support the mediated vPMU. */
+	x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_MEDIATED_VPMU;
+
 	/*
 	 * Many features on and after V6 require dynamic constraint,
 	 * e.g., Arch PEBS, ACR.
-- 
2.52.0.223.gf5cc29aaa4-goog



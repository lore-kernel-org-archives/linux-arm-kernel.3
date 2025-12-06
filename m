Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE03D3ABC8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EW7FbaDPVd5t9h4ibnQZUOMw78F2xoAgB/he+4U2Bes=; b=B+HsxQDqVjlzthtskMiz9B3V8V
	OcAcvhp0SDnWqBfoORkaqN6Ml3L/tkQINdhlzaFZMHlztWo58nFQJxuRFH0nlzfAVn47i42BbPQaA
	9z1nqqUMpFI/q85RbVqtosrIyMT45VCxSlTDsRpXa9/ibXLgLL6wMjwpU3hu8QpccLH3+dh8mQgE2
	8UekfJTnfaWe/zEaR6WpAB8P3nhnAH682iHfDlmlTiv6oNhA+8YiPp5k0PeScN1xdd0WspcxFKuyw
	9AhrEmJnpa3i22IPnzQFEUagltnzZFosi0GxzReDXCKCR50ofi/a0jhwkQ4A/T5LbEln0GV+iiyVZ
	jB80ijiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg6h-0000000AMPa-0jVT;
	Sat, 06 Dec 2025 00:25:03 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg6f-0000000AMOP-0BxL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:25:02 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso5135998b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980700; x=1765585500; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EW7FbaDPVd5t9h4ibnQZUOMw78F2xoAgB/he+4U2Bes=;
        b=PufYtinjmdWCor9QbJb9SedM/18D4XGrSmUFENt1tm7NSySeDsRd2fD66NPNTDw1x8
         VGsibxWkyzAwzWz1gg27ap+CH9M3grZGk6qs4CVgpGF740UL9qJRU0QS3uwvckP2Okkj
         4UoJtjKj/QsfHBaqrkm0ojMq1orvR/A82UB57I3EOB1v6eejXA2nh+3djnMCZ1YzBw6J
         dRjsCPH0dvlcXLy1oiM1aA1b76x6ZeHhUImIahz9SEjUR70ysTrbyBVOPxeGDjV45o//
         VuVR8RKgtMvr4O4G9BjdpUGbpLnaDtXUBm7nYCwNmkLVn2U+QgiBUXlZ7WhclAIUrWNc
         GofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980700; x=1765585500;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EW7FbaDPVd5t9h4ibnQZUOMw78F2xoAgB/he+4U2Bes=;
        b=MKDWdsMbFjoKstOOna92UKREKz4EODyq+ZE3Hu7WzAuZU/vOGF/mTYFBOyKIzs+O+M
         5zfXAXsmYdNfPWf5Itx8bNmC7ZqtbF1aP9oTGPouBj9h9XDAWTQRlGYOfBJfrMgila4N
         N2A/VfrFm1eT/HMt2NRc2h3jsx2Q0u6XiMJTvtBj8nEtEHHwzF/RS++QSlxAQQCx+lS6
         /SOcgfdGFhfPmU06VWEMLUjIBXMt59iylLLt2cm8LdaqemjZIR0+cIQe2uzwYIJAX6ux
         yXqXUHrWl4pUR1HOg6AGaR+Qvyrau63k6g8RCRn/p8fls8dJsxVpvUoiwY6PcwXOr6Ai
         KZ2w==
X-Gm-Message-State: AOJu0YzdjUjrrcFRx6qHDSt/FsOLqzHLJZNHIQpT69m+9LDNQmlr7Q9a
	2g4pIPgVPi+4EzOESQ9YoZ9pzEklq1dhpNgnqYXuydyFxuifhBcQ6oio3jPDXrH8qad9cVco/nV
	M4i9KAg==
X-Google-Smtp-Source: AGHT+IEzWFttnZLEQAsOaxYvtzWLuPcRq6QltY73DikVd5gmywMn7Yi+CzZHr3S07fvHdxIzVSJyvXKfRes=
X-Received: from plrc6.prod.google.com ([2002:a17:902:aa46:b0:29d:5afa:2de])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:32d0:b0:294:f310:5218
 with SMTP id d9443c01a7336-29df4cb6bfamr6615315ad.0.1764980310360; Fri, 05
 Dec 2025 16:18:30 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:08 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-33-seanjc@google.com>
Subject: [PATCH v6 32/44] KVM: nSVM: Disable PMU MSR interception as
 appropriate while running L2
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
X-CRM114-CacheID: sfid-20251205_162501_081963_6DFCBC8D 
X-CRM114-Status: GOOD (  11.09  )
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

Add MSRs that might be passed through to L1 when running with a mediated
PMU to the nested SVM's set of to-be-merged MSR indices, i.e. disable
interception of PMU MSRs when running L2 if both KVM (L0) and L1 disable
interception.  There is no need for KVM to interpose on such MSR accesses,
e.g. if L1 exposes a mediated PMU (or equivalent) to L2.

Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index ba0f11c68372..93140ccec95d 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -194,7 +194,7 @@ void recalc_intercepts(struct vcpu_svm *svm)
  * Hardcode the capacity of the array based on the maximum number of _offsets_.
  * MSRs are batched together, so there are fewer offsets than MSRs.
  */
-static int nested_svm_msrpm_merge_offsets[7] __ro_after_init;
+static int nested_svm_msrpm_merge_offsets[10] __ro_after_init;
 static int nested_svm_nr_msrpm_merge_offsets __ro_after_init;
 typedef unsigned long nsvm_msrpm_merge_t;
 
@@ -222,6 +222,22 @@ int __init nested_svm_init_msrpm_merge_offsets(void)
 		MSR_IA32_LASTBRANCHTOIP,
 		MSR_IA32_LASTINTFROMIP,
 		MSR_IA32_LASTINTTOIP,
+
+		MSR_K7_PERFCTR0,
+		MSR_K7_PERFCTR1,
+		MSR_K7_PERFCTR2,
+		MSR_K7_PERFCTR3,
+		MSR_F15H_PERF_CTR0,
+		MSR_F15H_PERF_CTR1,
+		MSR_F15H_PERF_CTR2,
+		MSR_F15H_PERF_CTR3,
+		MSR_F15H_PERF_CTR4,
+		MSR_F15H_PERF_CTR5,
+
+		MSR_AMD64_PERF_CNTR_GLOBAL_CTL,
+		MSR_AMD64_PERF_CNTR_GLOBAL_STATUS,
+		MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_CLR,
+		MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_SET,
 	};
 	int i, j;
 
-- 
2.52.0.223.gf5cc29aaa4-goog



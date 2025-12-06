Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9094AD3ABC7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1e8bcRXtuFwsQIbYtccrwhgHSv5SpQkyZPUQMVVAuRI=; b=GjDZuypTc96SmqTnf7uOdFmyQx
	VVr8CbDJxNLTfPJ4Ykl4w+v1rmgVJm65JTTY6FbYkYikN0w0MGUB4XAgEqcNT9mqSZtY8c2vdSZTb
	TS7QjJsatY9CdRU7yE+OqOqDNQKvA5fT8uV7bPKNT7nfWpP+vummzddN2ZPk1gCdA5xgNS0zpXupv
	BuS3RR2zyxLkxJD65FxHnQkFAFZge1KhT3nL4vkfb6Q30kQCOFn1T8zAfu8RVxlZxAMcD6FpQhQaP
	okbnOQCbaHcsrOmc8/pxZCSjBI0qsQqMa2qXeRGk53hpFXraXDB3jgVHguk8h9l3mKgNKRoiEwKWF
	3djDrdcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1c-0000000AHti-1adD;
	Sat, 06 Dec 2025 00:19:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0H-0000000AFTq-2pCK
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1e8bcRXtuFwsQIbYtccrwhgHSv5SpQkyZPUQMVVAuRI=; b=N6Fj7KXyFNNhzqA2dH8mY07DdH
	VLxIsj5mXGAmv3f45EciyA4ZAltShkQvs64SEi4isHaak65koodDTxpfAqKQLuzY2sPq7Zl1y71oq
	Y2NaVYcIGygVB1qV1AIY7iUgOqlp8ntWZXO+SHoqrbkjmOJCU2XukZZ8omPIquvwIFKH7qOUWpswE
	Ta7Z3GTQOjhak+eEHiQA9Vr/YkIZTSlURY6XQcLDbKR/+3K7VXz6UDuJt5pnfp7Lvw/717Mx7/qaY
	QSE8b3+IQWTHvyyBoCOpQhI3PQxqIGaQ+BWvodgD3kPvua9L6jJ8rhmAL5I6kBO8/plwkM7jq7Pd4
	bVbKKtfA==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0C-00000006SS2-3El4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:24 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34943d156e4so6816967a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980297; x=1765585097; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=1e8bcRXtuFwsQIbYtccrwhgHSv5SpQkyZPUQMVVAuRI=;
        b=RrAzfTZIQEGwgFaj14O7Pmc872guadyijxgZxF8DjX9yClPLAyDDOlyKo7QNhsLBEn
         D+8/vmSFNvWpJy1tnJBMWgdsMPruzCRp+qDwBZeuUarMGHVOSJUqHKRtyR4oP0L/9qH+
         2tFyyM+SP7zgUfLigtouKBjumISSSrDiNPMGszvyvb36Py0Vl2Rke3g5g4gpnLU/yZH+
         KLXoEl7x3ra1j0TXBcqbyiEZJ3vEeufFPayZ5gofGzpncz+LClWY7KprZar2h7FCVVof
         cH2pGzFKLhxXbExTb4XaxnXslfYEj6gobFl+n5pcgpOjPzMkKWwIpvLpUObsui3+PBHT
         a1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980297; x=1765585097;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1e8bcRXtuFwsQIbYtccrwhgHSv5SpQkyZPUQMVVAuRI=;
        b=NYT5mDLMHyLtwfI49xFJ9h4E28V1l/PQYOqFKDgP+quQdGBWdJDjRbXFXvk8ZKMj9x
         Br6caHJQbsWtWWX7YyJzXjf+jFearZmrGVZ8i7NAbX1K4O+8kTt7964Oq37CBXMVy5uq
         bL46rvGdyN+l/i8XUvy8vhKM/BiMxJ7Hq5WQVK9sVcO9DD8UjSAfZl5CGBsoSZutidGJ
         gxR5viEckvFN6C5+kfV0bILRdZl444zDyQ/W6xu55sF1pSPSm5Qnez2OsZ+IBYOdF2PJ
         yUxqUUL/b0VdM68nyuYtTQzW9dvzT2an2YeXzQs+E9sLDi/VFXVIKc4YhdbgdHE090dN
         1JIw==
X-Gm-Message-State: AOJu0Yxt0dRYbPYd+bODKqyuSnLNI+ZVbM1oDieUV99+we+PuzjNxRWr
	KgoHeFOAx0EMrhxMQRt60kAc0P7EjUQArs8/Gg+XeqVZM3+ueHfiLs8lf46CPtv3VzbVVe+qAIZ
	yzGYXIw==
X-Google-Smtp-Source: AGHT+IFA+TmENZM8zZH3xQmTmkf0AAav0uZn++oR8JtE8dy0fhXg220AvOxyf1+YRyhWVdU9HyzyXzK52Ag=
X-Received: from pjwo11.prod.google.com ([2002:a17:90a:d24b:b0:33b:51fe:1a89])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5750:b0:330:84c8:92d0
 with SMTP id 98e67ed59e1d1-349a261424emr607582a91.24.1764980296958; Fri, 05
 Dec 2025 16:18:16 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:01 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-26-seanjc@google.com>
Subject: [PATCH v6 25/44] KVM: x86/pmu: Reprogram mediated PMU event selectors
 on event filter updates
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
X-CRM114-CacheID: sfid-20251206_001820_937576_FA8EB4DA 
X-CRM114-Status: GOOD (  12.15  )
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

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

Refresh the event selectors that are programmed into hardware when a PMC
is "reprogrammed" for a mediated PMU, i.e. if userspace changes the PMU
event filters

Note, KVM doesn't utilize the reprogramming infrastructure to handle
counter overflow for mediated PMUs, as there's no need to reprogram a
non-existent perf event.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: add a helper to document behavior, split patch and rewrite changelog]
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 36eebc1c7e70..39904e6fd227 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -522,6 +522,25 @@ static bool pmc_is_event_allowed(struct kvm_pmc *pmc)
 	return is_fixed_event_allowed(filter, pmc->idx);
 }
 
+static void kvm_mediated_pmu_refresh_event_filter(struct kvm_pmc *pmc)
+{
+	bool allowed = pmc_is_event_allowed(pmc);
+	struct kvm_pmu *pmu = pmc_to_pmu(pmc);
+
+	if (pmc_is_gp(pmc)) {
+		pmc->eventsel_hw &= ~ARCH_PERFMON_EVENTSEL_ENABLE;
+		if (allowed)
+			pmc->eventsel_hw |= pmc->eventsel &
+					    ARCH_PERFMON_EVENTSEL_ENABLE;
+	} else {
+		u64 mask = intel_fixed_bits_by_idx(pmc->idx - KVM_FIXED_PMC_BASE_IDX, 0xf);
+
+		pmu->fixed_ctr_ctrl_hw &= ~mask;
+		if (allowed)
+			pmu->fixed_ctr_ctrl_hw |= pmu->fixed_ctr_ctrl & mask;
+	}
+}
+
 static int reprogram_counter(struct kvm_pmc *pmc)
 {
 	struct kvm_pmu *pmu = pmc_to_pmu(pmc);
@@ -530,6 +549,11 @@ static int reprogram_counter(struct kvm_pmc *pmc)
 	bool emulate_overflow;
 	u8 fixed_ctr_ctrl;
 
+	if (kvm_vcpu_has_mediated_pmu(pmu_to_vcpu(pmu))) {
+		kvm_mediated_pmu_refresh_event_filter(pmc);
+		return 0;
+	}
+
 	emulate_overflow = pmc_pause_counter(pmc);
 
 	if (!pmc_is_globally_enabled(pmc) || !pmc_is_locally_enabled(pmc) ||
-- 
2.52.0.223.gf5cc29aaa4-goog



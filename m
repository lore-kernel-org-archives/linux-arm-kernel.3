Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797D8C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 21:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIwiS3b08lZbnfZBzBRHsRLYuS/hl5WgYmD0pyHBLVw=; b=IAtmCVw5OoyPAdbeXT9NjjKz3J
	ZwioeXZ0s1ghFjgbhUbgcIXzIft5HXyqxjdUJlW+SW4GhsPrQlbUiY08iDc+lbUeHBygcU0E6m3Jd
	1s3PVM9U6eAjFvvOQKnGOagWE5JzFJ/OkmI4GNjB5O2Td7iQXgNYHp/yN5BR1v9giFAvILD/SXE/y
	tw5MynI4eySiRtEycjUAELAZmZfklGZGBMQfhAUsfXjBpDd7cQIGq1mOc4LLbUsth3C3wy9PbK1gm
	kf+xLWVrTPtJ+H6Yesz6vzod6jKNdnJPOBY8aGQxZVb3ZH/TDfbcUu4ZAgOIeeBvIlsAMrD+LIBQR
	w+DwQ0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujm1C-0000000GdLa-2qFo;
	Wed, 06 Aug 2025 21:49:54 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHe-0000000GHE3-1RWK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:47 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b423dcff27aso291672a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 12:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510325; x=1755115125; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aIwiS3b08lZbnfZBzBRHsRLYuS/hl5WgYmD0pyHBLVw=;
        b=LPX9/1MoJi/5gLyS79xOQZXXGPaFV/694Ua2h7DbP55TXy1r2yqKc+MIls6r7zSqRT
         d1mjmXb4vS3isAwQvez40s9ECf4SQG2oYM+VPJ+CPgwoSY9Pqp/u/p6xNZptBSP3/obC
         BIcGLOQliR/xFHWnErwb2BzXlIBVTAiCoWZ9WEQNrHG67qLUdMgqz9Ik8Zcr5xSblL59
         mzCrHTtMcGm+xfbZsE0u2TCPzT++Gypop5wzG8siGHoUIZhpcMdQXFD88qGvbH0QIopY
         YnA62C4f3JiHTPRMSTxsMXa9byiqBXRQrHIoER1Mnvl7N4yJNERK+3wWZKC/FFpf/743
         XbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510325; x=1755115125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIwiS3b08lZbnfZBzBRHsRLYuS/hl5WgYmD0pyHBLVw=;
        b=XeDai14CJO1U03FxGnF9MDh4tBZTkltGo+mk10PbqFkSInueaXwN63wTfrVVziH7zb
         Yb6OSNq+GK9eE60AKHkXkZijL0Lhi8Hjrj4Oi8ODYcc5Yn0YbSldwruc1aEq3i1V6mzn
         T/xIoyZ/KUcxwT6wTP+ZdoKzbCAa7FvUrlR091QogbcLYMVD/UdOMINTqB9pwnqCzwjt
         qhGKYmFS5bBirPV6G/Hk7uXRhENywSC0sHLJx6/TfFn055lLpX1zf4oUMlbYWh+qbaof
         xX7c7Wb4vY6R1XPuQkzvX1r+BYchSJjDSgoBy9oRGnXb3+jjp9S+HwpQsaskyeAYNYDJ
         laHg==
X-Gm-Message-State: AOJu0YxwrQdXCav3kvPUvvu2yd6d5Lac9EtjaH/eKdrrAgBHZsG4Z+0j
	721xS0EHuO/AXzouW8mt5G0b9p47h7QnwiKsIgZhis6LF044MbqX9s8rH//e0HM2ugFR8gjcbyJ
	yDPzE3Q==
X-Google-Smtp-Source: AGHT+IEQR+T9dam/zfnLIV/i5izf3PHRRWb6ka2239rbCk7AqXY3VxMNYGaiVe7zhD28m3tT7rq7DHc261E=
X-Received: from pjzd15.prod.google.com ([2002:a17:90a:e28f:b0:312:151d:c818])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f645:b0:240:150e:57ba
 with SMTP id d9443c01a7336-242a0a90e7amr55806795ad.3.1754510324526; Wed, 06
 Aug 2025 12:58:44 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:57:04 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-43-seanjc@google.com>
Subject: [PATCH v5 42/44] KVM: nSVM: Disable PMU MSR interception as
 appropriate while running L2
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125846_392698_191F8D64 
X-CRM114-Status: GOOD (  12.27  )
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index b7fd2e869998..de2b9db2d0ba 100644
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
2.50.1.565.gc32cd1483b-goog



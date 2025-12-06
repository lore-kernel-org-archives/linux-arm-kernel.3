Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB8CD3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvT5QOLTrPlZDM6KRmJviB3G20BHxxiuQcblXVA4XhQ=; b=dwX9Jo8eVFCpdfaZ8x6cZ3+QP9
	EWkm/M8jRuWC1PoYX/wVSUFOQS+MVdBBFzQ5IQIvX9LPs+nUkMxMMbE4cZtrMmUJfsWkfJOIklXPv
	ZnZtyctjn67+oGg/9J+v1VdiQPhDnsY4DE7N2S4GVhan06xfrmYCaFoOgnhq2d3tHcjg/5BremXQ5
	cOQCl72X02QhLu3eeXRl5IPRjFGw4EN7y0b7MpJKZFbCNcABdaSVlRMQfH/GX54hnjRkIDz/8a9D1
	YRIUQT5Kyk7tUjwoqatzg1CqGuZ7eqtEV49ZuAHbsa9iejx0ikHbGWOAyfIk3sE3N8HuWSNjy5zbB
	m2lsNGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0X-0000000AFx8-28Dx;
	Sat, 06 Dec 2025 00:18:41 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzq-0000000AEnd-3NSC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:00 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-29da1ea0b97so53765985ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980276; x=1765585076; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RvT5QOLTrPlZDM6KRmJviB3G20BHxxiuQcblXVA4XhQ=;
        b=QJcWQDW5zDjx31P8Wd4OtSK5KUCV++7V+pbQFtDDR9iHTuZ7QZ3Wr8h8Tf236N8cSn
         SbIK6HrWNwkpa+TFGr/jdrC41Nr4X+IiMpYMW74MFLnr24XRYXP8ybvyYwXkAUPWmzS4
         HVZvcR0awdQW+UMH9KdhT8nc+6mIhIGC/xRHoOGi3CQR0iF575SuaCQ5QiyQp5/m6oPE
         86aZ/EGalhYOcvkbS4SSNGfbIgTwo88F84ldgSTe6Bcy6qvrRpLNPPn9o03ACCfkhwi4
         3nNgh+sm73FnOKU+BpUHPoIgTDyp70URJOi0Iw5IwbPKDWtzbm3papYdZJ+kRvbjtcgt
         XzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980276; x=1765585076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvT5QOLTrPlZDM6KRmJviB3G20BHxxiuQcblXVA4XhQ=;
        b=jvWC/EXVnnJRBH0BIvaWZWsX06d6NpBGpN1318f34aiU1ukGEmmHLDFgT2f4AB/XW6
         AHbeKbAAjBJR+4OCqsSIfYabbXnV4YQcHXKIVs/o/dPSpEXfkz7aVX094Yd8WxJEsXi0
         OIhRkKInXwPduPFHGeQG8KavaRb4hcFCQugq8fTzNDP0TNHAmDQB04bpF1v3HOBka40y
         qWXCKCWZ8ugt3peUrFAADUfRMpJqJCUmTmQ6fCLAIoza8lV26FGifrBS9H9qwpdgudVq
         /KF9u+O/W313K/VrUakMbp6+ymliVmCMzmEZ8GGioSD1qbYMvdMwPV02XDu/O4KD5PJC
         yJAA==
X-Gm-Message-State: AOJu0Yy9vbpQ6CF6GUPTIj0HqiL178KptyetdWd8GdT8sdoxVBkTpIIX
	U64qu1Hp0MCKT0Ly5UmZXVaoFWZNEf8xxIllowWCCgweq+6sDHFFU+iWkbMLzMC26xhVpHLbwje
	HO0wHPA==
X-Google-Smtp-Source: AGHT+IGYBlCmb/gXYXB/w+eLYeN/6lSsoZJHvJE9tm9YKGnjFm45dzt4nCYHuTcqC75ktumYKLC92IIPc9g=
X-Received: from plbko16.prod.google.com ([2002:a17:903:7d0:b0:29d:5afa:2c1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d488:b0:295:5668:2f2e
 with SMTP id d9443c01a7336-29df880d025mr4171385ad.37.1764980276326; Fri, 05
 Dec 2025 16:17:56 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:51 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-16-seanjc@google.com>
Subject: [PATCH v6 15/44] KVM: x86/pmu: Snapshot host (i.e. perf's) reported
 PMU capabilities
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
X-CRM114-CacheID: sfid-20251205_161759_029626_9C8F912E 
X-CRM114-Status: GOOD (  10.18  )
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

Take a snapshot of the unadulterated PMU capabilities provided by perf so
that KVM can compare guest vPMU capabilities against hardware capabilities
when determining whether or not to intercept PMU MSRs (and RDPMC).

Reviewed-by: Sandipan Das <sandipan.das@amd.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 487ad19a236e..7c219305b61d 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -108,6 +108,8 @@ void kvm_init_pmu_capability(const struct kvm_pmu_ops *pmu_ops)
 	bool is_intel = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
 	int min_nr_gp_ctrs = pmu_ops->MIN_NR_GP_COUNTERS;
 
+	perf_get_x86_pmu_capability(&kvm_host_pmu);
+
 	/*
 	 * Hybrid PMUs don't play nice with virtualization without careful
 	 * configuration by userspace, and KVM's APIs for reporting supported
-- 
2.52.0.223.gf5cc29aaa4-goog



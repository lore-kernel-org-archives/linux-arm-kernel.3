Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19BEC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZMeMFDLZr+yCjindHzAam67OkhMlNf3hlQ7J9N+n2w=; b=T0WgWoSc/KVzLbQ7NN2yQD4Gpd
	39D3f6e3p+Rt1rnVYpsEjWKOMwUbr3f8bQJAI33fj6m9esjFWyx8XZzOMhndvCnI/8+h4Y6Pb74Hr
	xJr+8wn6BLbEHd4nkWXQhr+Kec8qEIl0iT1qzkt685TqOZsQuWxmysnaDX5S2jQPep/evZM7E03XN
	3bhCXt6fn15jAkXj49MvpJILxhi59dsnqPySaKvVW77UlFGW0B3TeNVWJHaV68dSZmHNMKmw3f6so
	kOPZt/loaeYH0W9C2ofKzYO0dfAChEy/8EdFOT8VcNTa9XGmr5g+gVAGcXdXC+DSa571ieB9VKrip
	G1wXiAcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkqP-0000000GPi2-218N;
	Wed, 06 Aug 2025 20:34:41 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGn-0000000GGNZ-3LdP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:55 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b4227d86246so128123a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 12:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510272; x=1755115072; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YZMeMFDLZr+yCjindHzAam67OkhMlNf3hlQ7J9N+n2w=;
        b=f87NkBd7OfImcCpQeX3diUmsVfiaFPyYZVPWE7Qrj3mTzjRbbMo3mK6xJp6Ylw3kIx
         Y/FW3i/w75YqRTGZFmczXyk++Q8A8/aKx86X/zwuDu43wYKaRBo1wFvwCBTNS5l/eHb8
         cB1wOGXXG1NvccTnZBzTHuA0PKAhRhgXYbagd0eigxyru8DZ7eBf5QhQLvo3Ylfl42H6
         GWjSQtujBVYaIt1nkk75msPkD5Jl0vstQHjSSI2UEEWlCLWs1jpJyjuKyEyi3vmbVuZD
         Wb7T3Gu9+cpoEyKNluFUQi5TSQdAeWbEQyKhtHuWogfK9p1IRVJRjZ96M4Ejt4+McZko
         7y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510272; x=1755115072;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZMeMFDLZr+yCjindHzAam67OkhMlNf3hlQ7J9N+n2w=;
        b=suKTRdQ4RbDxmf3O3JwMUbB9rN9oQD99RQ0KZ5lEa+2KuXr/sG310+7jYgb08ZCMul
         edJ6Y/L9boN5WYNPNm8Fb9i7wnLF+d2AjHwAm99pOqiXtLm/i4e7wtZ7RRanJPLlE0rX
         nizFsMdHCbOWUPymCisXb2rqQ8e5/YzCBKwZ0mBbVbwjuNyghsLqRB9VDrGJH/7Q1w3O
         WJmj3q1p81qoGg1jgugNRBMcm1i55jg6nG0YDIAaVr9S7OAAZjL66Oxq3F8jdVm50XOv
         FpEccC7UqeWU3DUiW1fx9SywIXU1ThQKipTj5SC/boUj2tX5rMv8jqitbrDKmQIe8CWu
         hl0A==
X-Gm-Message-State: AOJu0YxETu4jSFCTSqdJHJZ/PGCVgZKyyY1LfRyAkBPEUNMxX8jbc198
	miE7BaKrijVWHAALkaWMj8QoMPyMUBHnKcLrY2eN0TKr0Qgeq+sW5gXcSjEF5Ik4EnIgswLnwBF
	Z2geutw==
X-Google-Smtp-Source: AGHT+IFt32OpTUGU6us4Rz359zlOuJVL+j3ifqAbqQAET68s3resGqbQqEcv8vf6Ss5FatBMSRwumXjkA8M=
X-Received: from pjbso3.prod.google.com ([2002:a17:90b:1f83:b0:311:1a09:11ff])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e784:b0:240:9f9:46a0
 with SMTP id d9443c01a7336-242b1aa312cmr4180365ad.38.1754510272385; Wed, 06
 Aug 2025 12:57:52 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:35 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-14-seanjc@google.com>
Subject: [PATCH v5 13/44] perf/x86/amd: Support PERF_PMU_CAP_MEDIATED_VPMU for
 AMD host
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
X-CRM114-CacheID: sfid-20250806_125753_856107_34E5B5AD 
X-CRM114-Status: GOOD (  13.46  )
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

From: Sandipan Das <sandipan.das@amd.com>

Apply the PERF_PMU_CAP_MEDIATED_VPMU flag for version 2 and later
implementations of the core PMU. Aside from having Global Control and
Status registers, virtualizing the PMU using the mediated model requires
an interface to set or clear the overflow bits in the Global Status MSRs
while restoring or saving the PMU context of a vCPU.

PerfMonV2-capable hardware has additional MSRs for this purpose, namely
PerfCntrGlobalStatusSet and PerfCntrGlobalStatusClr, thereby making it
suitable for use with mediated vPMU.

Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/amd/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
index b20661b8621d..8179fb5f1ee3 100644
--- a/arch/x86/events/amd/core.c
+++ b/arch/x86/events/amd/core.c
@@ -1433,6 +1433,8 @@ static int __init amd_core_pmu_init(void)
 
 		amd_pmu_global_cntr_mask = x86_pmu.cntr_mask64;
 
+		x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_MEDIATED_VPMU;
+
 		/* Update PMC handling functions */
 		x86_pmu.enable_all = amd_pmu_v2_enable_all;
 		x86_pmu.disable_all = amd_pmu_v2_disable_all;
-- 
2.50.1.565.gc32cd1483b-goog



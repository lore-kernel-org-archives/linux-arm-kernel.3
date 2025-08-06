Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26219C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 20:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcpMdowVJLAIFzpWUVXDuq4S/gKqPMBYO1OzyYmcx64=; b=oVygJIYvDXtu2QNePNLm0ntwGz
	d2Jjr+EuOOsEQNIFmvqAVJkysZ/RaptOS+peIn2/J+CNrwLlWFxjT3l/lroKrsrnYVbUrZyPC/MJ9
	NJLahhEA8JKYAF6pWWTWLfy/d9X+9x3lJhPedhjqz8+N4rTxlhyZaSHCHzeEPt8XH1ilp4kFYbrFg
	2/KH9P8K+BXDsbaspP3uO4CA4hIzlvodKltxTBpnyZN0el0LyLPmF3fzWP4Qqc5srTwJUjvf0VPNu
	ARf4ltfUUrc322BVq193YnuxcnXjSfrDXRDOzevy6VsgD+lnqwv0/3eDJ5/GE2pNZZAoX5uP8g7YP
	99XfhMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujklP-0000000GP1r-1vs5;
	Wed, 06 Aug 2025 20:29:31 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGj-0000000GGJY-2QA2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:50 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31ea430d543so310734a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 12:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510269; x=1755115069; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zcpMdowVJLAIFzpWUVXDuq4S/gKqPMBYO1OzyYmcx64=;
        b=kRPXIdD0d2+dKvWgDixuTlioX9EGvgM8gqCiJzgzoJZraW97aRCd8VSY0Ef/ezqWIZ
         6R8jkoaby/dh+RGqpRmPTUUSdNcYtPRnefkvnvYkBlo4YnTDdRWdcwB39UhCZhObManX
         n7vtvC2uIf423tBjdF3uK2ZHXel7HVuC0XaiFrhTc15ddG5Kw1PTy1zm862QtM0Yb6CY
         +AmZHNJyogzv+xazLh/E2FzZCXNnhM3pj7d9pfZPvZrMmsT+y2qkWWegOWc2iFe/7MLO
         3hMbZP9koKf9HItq14yEKjOLosJCMcq3W+GfVqccUp/ZUR1WAZZHAuDXdAYjWIPdMc1w
         u9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510269; x=1755115069;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcpMdowVJLAIFzpWUVXDuq4S/gKqPMBYO1OzyYmcx64=;
        b=r5nimQAh3LJGktIrU9sUisJp2WAz25xnV1wfUfeJLOLjHy8UbywRPKLL2+N75JI+2t
         PwEpRyMQDYiXjVwiw31MrS526hPpqNKunV08s6/hBnH1lFoJkEExG/D+WcXv+XBxplTM
         0ANFI4vUatNBFpcqrR8Xx7yYIke1ehRKe2tBdrTewIgXyzowq9o4zA1KVZ2rJF4DTOf0
         kOQ21nO3MtSghHrh4vCFxrzi52UQhWfekcFgRRMobH4tMqXxhlHRD/XeoDZpdkMKs+7y
         WC+qP9+22sE3WiUGPoQlv3Dz3Cv5ChFy3xBIAaYP3eIdnwgBGeJcOdOHgjKvMjp84+se
         GVSw==
X-Gm-Message-State: AOJu0YzeFH7H75mRWAjYr7idkTzNdC5HVWcLzTqJlDxvpsyMxmjBKYLA
	Rq3hthWkkuRXCTC/lNeNF+q4bxRo4h/o/ALS/2QB0fINO25PLb4TH/C2OCVD7eJ+JSSJVD3HiCP
	ynHUK1A==
X-Google-Smtp-Source: AGHT+IEVLR7eG3e1/ODg1GEbzlPUzUDlLQzQgQfsonV4iFGNfX+Tq8xQvuZk8V1U7zslQQy51nOqc0FuQr8=
X-Received: from pjtd2.prod.google.com ([2002:a17:90b:42:b0:321:76a2:947c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:380a:b0:31f:36da:3f85
 with SMTP id 98e67ed59e1d1-32167520ee1mr6465429a91.17.1754510268743; Wed, 06
 Aug 2025 12:57:48 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:33 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-12-seanjc@google.com>
Subject: [PATCH v5 11/44] perf/x86/core: Plumb mediated PMU capability from
 x86_pmu to x86_pmu_cap
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
X-CRM114-CacheID: sfid-20250806_125749_622686_918EF7D7 
X-CRM114-Status: GOOD (  11.77  )
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

From: Mingwei Zhang <mizhang@google.com>

Plumb mediated PMU capability to x86_pmu_cap in order to let any kernel
entity such as KVM know that host PMU support mediated PMU mode and has
the implementation.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/core.c            | 1 +
 arch/x86/include/asm/perf_event.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index b8583a6962f1..d58aa316b65a 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3130,6 +3130,7 @@ void perf_get_x86_pmu_capability(struct x86_pmu_capability *cap)
 	cap->events_mask	= (unsigned int)x86_pmu.events_maskl;
 	cap->events_mask_len	= x86_pmu.events_mask_len;
 	cap->pebs_ept		= x86_pmu.pebs_ept;
+	cap->mediated		= !!(pmu.capabilities & PERF_PMU_CAP_MEDIATED_VPMU);
 }
 EXPORT_SYMBOL_GPL(perf_get_x86_pmu_capability);
 
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 70d1d94aca7e..74db361a53d3 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -292,6 +292,7 @@ struct x86_pmu_capability {
 	unsigned int	events_mask;
 	int		events_mask_len;
 	unsigned int	pebs_ept	:1;
+	unsigned int	mediated	:1;
 };
 
 /*
-- 
2.50.1.565.gc32cd1483b-goog



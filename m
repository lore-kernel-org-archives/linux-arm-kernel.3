Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A72C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 20:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6GitVs58LgSs5T9j7jt8hclUfm0doY6DCHFmJ55L1k=; b=NObfhmf2VoFjbJ40U8CE5+urrg
	5v0HhRyTyHSfM5iiAT0LXvEOxVUbwjRfaCybuBRVTYVpQOHRH/9nlLWN9g7MrGYqBxCrLJGw98mQo
	evMVMs5RQmuZ8g1JaQoL31aMjDWIJQawC9T+4OJ2qdi0bbvKD3UhKMt4/ZtDqt6v8UoX9HUvBTPH0
	WJfJbQiWaK0VGJbpS+pvYbIdqeL/jvPz9pBU1xtCuljhqoyTNDdALGKoMAz2wtBK7AuDceUIUBZfi
	7PaqQpzOZNRQ4lUh9ylDA+Cy9bQSsZ1K7f06TjBXgZN0XDWS53zK2bE0zWUpM5nSr8VRjMJAlYxM6
	aRtT2zDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkiu-0000000GOiF-1QvE;
	Wed, 06 Aug 2025 20:26:56 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGh-0000000GGHI-3L7G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:49 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3215b3229c7so289546a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 12:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510267; x=1755115067; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=V6GitVs58LgSs5T9j7jt8hclUfm0doY6DCHFmJ55L1k=;
        b=jT8M4FuFrhL/Hwk2/iSrfLDWay+Pj18agC5aGdyxvh1aJevHXpqFtODMQTZPrPO30i
         cWKvwOFFrneeMwWgRJ6cKNGRqzjxbabCLsMnbQbP/wkl3R0AMaOOnbchJe2wU5k8Kbbr
         0xEFy/vMUCbW3V0HApO6HGoglZSZv9zewgbUKrg9rGc2o+wBhq5TdSGMHIBrzAzJFhNM
         JCFAj4s/s4bjHCyz8nQslVAdfkUZOyGHbfe3YZMG/seeC1MSUdiDxRl4t9cZ1iAWS/pz
         Lb6wtO21dqjosfCP2zOb/2pblQC7VDSJbaHmLrNbjp8UsY5CZUfB+YPx3l1xP5n5aEbD
         B7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510267; x=1755115067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6GitVs58LgSs5T9j7jt8hclUfm0doY6DCHFmJ55L1k=;
        b=o0+dp/Za139LfEWqI/0mGtrA6uW3ON8AiXKpwkez/79C/Zyry13WgUyy4pfA6LZOL3
         fmXj54oWPBLCgAughJ0AFzRlZQekzvkgZi7LpOsFdJNRYNYUJw1IaYRf/1INJTK1wKOQ
         UvmLoR5WeJ6ofnuwqY2Zq7Vdpf3jkM6UXtT7cAE1KZ5l4EMUj5CEJ7El/scryLWh9FfS
         3cHNngwo7u4J6iC5BtLAVL8ytd5LazPG5szfxYjsVUrPnp0c/Bo+ZvvJYMwLCm4SSW//
         BoO0ppdaIqlB2TSk2XzOA//TGlm8L2gAn9oZ+qAiEPckGxegIMy6dGehTZxZmkHm4wq/
         dd5w==
X-Gm-Message-State: AOJu0Yx22ozQ2zxvgD0wD1HcFsp88UcAPcib8fB3dooAcV0HSkvo9ETd
	Yb6F7pMwfXFMmzjBRMuiaNxQ/EcIRnL3q5kO9kadP45+e0HwV7Q9V9PcLBI4uZ29WjNnJK2ldaa
	t36FWLw==
X-Google-Smtp-Source: AGHT+IEe9aouosNHmFsjzcywZl+bDxrMa7gzbIrywT1O9OJ/U5YazLpsqSIEAJkZctqsm307cXJuaDMPuPY=
X-Received: from pjbee13.prod.google.com ([2002:a17:90a:fc4d:b0:311:462d:cb60])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2743:b0:311:fde5:c4be
 with SMTP id 98e67ed59e1d1-32166d06ed8mr5169966a91.35.1754510266366; Wed, 06
 Aug 2025 12:57:46 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:32 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-11-seanjc@google.com>
Subject: [PATCH v5 10/44] perf/x86/core: Do not set bit width for unavailable counters
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
X-CRM114-CacheID: sfid-20250806_125747_855220_14E23973 
X-CRM114-Status: GOOD (  14.01  )
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

Not all x86 processors have fixed counters. It may also be the case that
a processor has only fixed counters and no general-purpose counters. Set
the bit widths corresponding to each counter type only if such counters
are available.

Fixes: b3d9468a8bd2 ("perf, x86: Expose perf capability to other modules")
Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Co-developed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 9b0525b252f1..b8583a6962f1 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3125,8 +3125,8 @@ void perf_get_x86_pmu_capability(struct x86_pmu_capability *cap)
 	cap->version		= x86_pmu.version;
 	cap->num_counters_gp	= x86_pmu_num_counters(NULL);
 	cap->num_counters_fixed	= x86_pmu_num_counters_fixed(NULL);
-	cap->bit_width_gp	= x86_pmu.cntval_bits;
-	cap->bit_width_fixed	= x86_pmu.cntval_bits;
+	cap->bit_width_gp	= cap->num_counters_gp ? x86_pmu.cntval_bits : 0;
+	cap->bit_width_fixed	= cap->num_counters_fixed ? x86_pmu.cntval_bits : 0;
 	cap->events_mask	= (unsigned int)x86_pmu.events_maskl;
 	cap->events_mask_len	= x86_pmu.events_mask_len;
 	cap->pebs_ept		= x86_pmu.pebs_ept;
-- 
2.50.1.565.gc32cd1483b-goog



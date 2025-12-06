Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE1CD3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDDQncQUzzwpRSzzmwHiRYOU7FF2nSUQYIeQTrnvQK8=; b=1E0kFyW31GEGeM6xRsBaF0xnfr
	b1LQO6RoYOZMQbt/kvbNmJI/H5kYS/dspEIH4y93EAV2DP+Zna1uiA7dP3s4bVUGSsqig1+rvaL2R
	bEPAW1hT5FXMFfX2lgfd9QLO2plF5tARl63McgbHkBS2NNmRvOAg3JmTyR9+Q2cGqjkk1KwuLFSH+
	n4k5Lb1vLs8mnnXnhkUgNuYIz8JMrvGmUGdDzfYvD04yc8jL+hKr/YGHDRUlTVwsM70dTx1aMPHWe
	8JoGbIetBp6f5rNhQmVrewXglQotAjYb/7qX6btEC9W1FTUvr01O6cdoHQTVpeG8/ZDdlbiCCqpcg
	SP1eq7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1i-0000000AI8r-3BEE;
	Sat, 06 Dec 2025 00:19:54 +0000
Received: from mail-pl1-f201.google.com ([209.85.214.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0K-0000000AFYb-3PXL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:31 +0000
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-29b760316a8so36568065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980307; x=1765585107; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wDDQncQUzzwpRSzzmwHiRYOU7FF2nSUQYIeQTrnvQK8=;
        b=0/zturG11mr/1Hq3erScFcUMLeoI//KQSAErHzddY2RsDWzPoaioXb8H5tHB17hq7m
         js6ETdLimjBOY9YArw+RbUvbaEgtQaPX91alU/ZdW9MzbgDiq+T7Jj/b7Dl9+GfM1dIN
         O/a77cyfkRz0rPGtPr4CaCFJPC1sqJWPCvuggFbSs/4ExuXsLbgkQfbRiPZeoPOpOLSm
         Yis9LF6SO6pS+WWIWYAQUCDb71x0f18knbPo7hu7ltkVN/Bx1I68ASsuQKPl9SwPBYEs
         oqM8SJTkKqc0eqjWqZlntmPyFMpMzEyBabiZh5r3jQxV9GCABBzPSQLWJzyD9ChQF0Pc
         UvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980307; x=1765585107;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDDQncQUzzwpRSzzmwHiRYOU7FF2nSUQYIeQTrnvQK8=;
        b=v1LkVL01XNCDQ28J5eIU25MPVgg6682M/pXYzwARufAmQ+XkhpJEDvZkvTL9ByPzjA
         XSYDsgc1fi0CIO/w0wT+H6I936LI++o0Ps9B/NYD2c8xIujdh6JOwCI+/LUZkeM3nVKN
         UJmsV9mqHZGq4VEu1w0xaaAiO9SI/A+o+za667/ZYMZaOBCFhjhiH5ULtVwYYq9/AZ+8
         9ztTGK/XkpVJxMUHNLzmcD6hTCnSK1STR5eg6WE8MaXyeCNGZn/3mfQW7dvWDm58o5eA
         rjxuYOV/d+OQfu3KGcuQrYaMupKDAt6qV67UsCCySzsKvjbKnIUS9zPSDSGzZI9KMCYE
         +hBQ==
X-Gm-Message-State: AOJu0Yx/uNhQAALa22Vau066UTidCzFhdV26WBtp5dJ7DS8o0U9EugtM
	kIocZ+7mQfJUw6LjdX9vN4aYmGmHySvkt84DQ2qQpfCUpf5kaZck1HIq5QKt5hWQG+1VtA5yXzq
	oykAEhg==
X-Google-Smtp-Source: AGHT+IG4vHPmom8LOFsNf9ubPRsWVZC6RkdL55O4HgJ6N06qyh5/Ls7bYlKNT7sQNBmfh9FVeBcsEGoEIG4=
X-Received: from plhz1.prod.google.com ([2002:a17:902:d9c1:b0:298:51f6:847d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f84:b0:294:fc77:f021
 with SMTP id d9443c01a7336-29df5deb193mr7205895ad.49.1764980306541; Fri, 05
 Dec 2025 16:18:26 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:06 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-31-seanjc@google.com>
Subject: [PATCH v6 30/44] KVM: nVMX: Add macros to simplify nested MSR
 interception setting
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
X-CRM114-CacheID: sfid-20251205_161829_060728_7E4CC4E4 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

Add macros nested_vmx_merge_msr_bitmaps_xxx() to simplify nested MSR
interception setting. No function change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 40777278eabb..b56ed2b1ac67 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -617,6 +617,19 @@ static inline void nested_vmx_set_intercept_for_msr(struct vcpu_vmx *vmx,
 						   msr_bitmap_l0, msr);
 }
 
+#define nested_vmx_merge_msr_bitmaps(msr, type)	\
+	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1,	\
+					 msr_bitmap_l0, msr, type)
+
+#define nested_vmx_merge_msr_bitmaps_read(msr) \
+	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_R)
+
+#define nested_vmx_merge_msr_bitmaps_write(msr) \
+	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_W)
+
+#define nested_vmx_merge_msr_bitmaps_rw(msr) \
+	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_RW)
+
 /*
  * Merge L0's and L1's MSR bitmap, return false to indicate that
  * we do not use the hardware.
@@ -700,23 +713,13 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	 * other runtime changes to vmcs01's bitmap, e.g. dynamic pass-through.
 	 */
 #ifdef CONFIG_X86_64
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_FS_BASE, MSR_TYPE_RW);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_GS_BASE, MSR_TYPE_RW);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_KERNEL_GS_BASE, MSR_TYPE_RW);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_FS_BASE);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_GS_BASE);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_KERNEL_GS_BASE);
 #endif
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_IA32_SPEC_CTRL, MSR_TYPE_RW);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_IA32_PRED_CMD, MSR_TYPE_W);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_IA32_FLUSH_CMD, MSR_TYPE_W);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_IA32_SPEC_CTRL);
+	nested_vmx_merge_msr_bitmaps_write(MSR_IA32_PRED_CMD);
+	nested_vmx_merge_msr_bitmaps_write(MSR_IA32_FLUSH_CMD);
 
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_APERF, MSR_TYPE_R);
-- 
2.52.0.223.gf5cc29aaa4-goog



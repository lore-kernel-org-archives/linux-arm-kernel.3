Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A359FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q4E9hh3K2pv4VCZFsG0zDJ0k6GBrQNGUvEBLw2wLUQw=; b=223PxmJDPda7aQOhoaDDw5rWUL
	b/FrOT0GX8WHSiTCW9DqL5vgE15/pcFlNEqg8ZkU6rs4puWuVQVLu3erDZbF/6RdqOhd0ZXn6eW38
	PBDlIpvDHAz/YyWhzdugu+W3k60CSjW7GCynmLRVoPm7qBo/5Ev/c+vRrETZc3IMhW06cZxmJHlWX
	lje5BlSUeVidt+BP8n6vmMs+8SOk8l/5DN6bcqr0ayrU6UkPVwwBjafXos14PxUQ4ObrkS3DULcbN
	MPcbcCEpjhB3N5YRuVDPCG8UFuC4qzbrtXSuLlbWnnvbwYwS20HmxMHpghH4j+d9QX/bZADaLqSVw
	XwY9VMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwGa-00000007a6U-34cj;
	Sun, 12 Jul 2026 15:38:52 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwGY-00000007a68-0H3C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 15:38:51 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-493fd9ce0faso3863915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 08:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783870727; x=1784475527; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q4E9hh3K2pv4VCZFsG0zDJ0k6GBrQNGUvEBLw2wLUQw=;
        b=Nk+bJ9hiSOYhaR5vzpQgMBkodhtMVJACuWG5yaJXAQdy1fYMlYcC7DQgnQRNvntuL7
         XumXjj1Q2csynY2K+h3w+iARVF4Gpe5yqDblMhNvhr41rOxXPBH+uK/BssOEZoGG9IwL
         6gTMq5L3GnNWhjgkNawpTDenKUqYJkDNRMyl1H/XV+iXtqg7yWLc9W3k7xDttiYpW0GA
         goYAa5wD2gRzL6U8NNoKzXhJ8vPqedL0gq58yuemt4yl1N3XxpSNU0NTdX7CWR4dtD45
         WpgoQf7mY0lVUOPyjjNO8AS0WGdqfrpoAwJA5DyZkVQUW8krwPfND4AOvcAkOV6xfzmW
         1wPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870727; x=1784475527;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4E9hh3K2pv4VCZFsG0zDJ0k6GBrQNGUvEBLw2wLUQw=;
        b=S45RmXu+dFiOTwW+sLXs/jWE6RN6n8tBQEjxJMZ2vamxVwa2zcvsVxQUFOhsJ4yz55
         jVILNQ+4lYfXJCAyKyisinomEGTSBdG5/BeaUqTJ68Vrii6gBgavS5KTRXyM5J3V1anb
         MG/2hvxcNQz5fTmxzQ8+9a6WPr960EnIew5CX3N6XmA9xMHMGWlEH1gArlKTKsEzMqi+
         RzyCykWAsAy1Hpb1Fi66KWgTn1sQ38NSxLQcKx7fQM1JGsdueEaVSc3caQqidx+me+Jr
         lhBCu2P1fmW4zjiZPTQTKGcQHc9hrLlDTpIWtrs0KiYQ+iPq08isvw91Is+cN7tdH1/6
         TdOg==
X-Forwarded-Encrypted: i=1; AHgh+RpM/7Bv36YqiQt8cKFiQ2XXMLIB7POahwk/FtGWYn6iUxtdlrkKEp5a/NZltwFIWXEMj8X0n+OF2xKTwKp6Om+R@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4j5nfAj8PZPQXKw+XUrKKBOlIGean9329gvZox/YKcpjUa6nj
	orHeYDK0NQqaHCzkCNpZoY77oKjWx1PB5ACwIkSVsOs+oSxjycELy/2AHT34a6VVqo62zE2LwME
	fik9IAmpKCiQ+Cw==
X-Received: from wmpm32.prod.google.com ([2002:a05:600c:920:b0:493:b55e:f03f])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4688:b0:493:d9f7:a3cf with SMTP id 5b1f17b1804b1-493f87f1ff4mr58578045e9.17.1783870727433;
 Sun, 12 Jul 2026 08:38:47 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:38:35 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260712153835.2264905-1-smostafa@google.com>
Subject: [PATCH] KVM: arm64: Avoid naming collision in tracing
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_083850_132145_D403DC79 
X-CRM114-Status: GOOD (  17.56  )
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

When the hypervisor tracing (CONFIG_NVHE_EL2_TRACING) is disabled, it
defines a static inline stub for trace_clock().

However, trace_clock() is already declared as an extern function in
linux/trace_clock.h which is pulled in EL2 compilation.

If the file <nvhe/clock.h> is included when CONFIG_NVHE_EL2_TRACING
is disabled (by including it manually in setup.c) it will cause:
In file included from arch/arm64/kvm/hyp/nvhe/setup.c:22:

./arch/arm64/kvm/hyp/include/nvhe/clock.h:14:19: error: static declaration =
of =E2=80=98trace_clock=E2=80=99 follows non-static declaration

   14 | static inline u64 trace_clock(void) { return 0; }

      |                   ^~~~~~~~~~~

on GCC and a linker error on LLVM (it seems to change the linkage to
global)

Although that is not a problem at the moment, as no other files
include <nvhe/clock.h>. That does not seem to be the intent of
this code and that will cause issues with more users as the SMMUv3
driver.

Signed-off-by: Mostafa Saleh <smostafa@google.com>

--
I did not add Fixes tag as this is currently dormant and not breaking
anything.
---
 arch/arm64/kvm/hyp/include/nvhe/clock.h | 8 ++++----
 arch/arm64/kvm/hyp/nvhe/clock.c         | 4 ++--
 arch/arm64/kvm/hyp/nvhe/trace.c         | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/i=
nclude/nvhe/clock.h
index 9f429f5c0664..c2ccd0e8bf22 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
@@ -6,11 +6,11 @@
 #include <asm/kvm_hyp.h>
=20
 #ifdef CONFIG_NVHE_EL2_TRACING
-void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
-u64 trace_clock(void);
+void hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_c=
yc);
+u64 hyp_trace_clock(void);
 #else
 static inline void
-trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
-static inline u64 trace_clock(void) { return 0; }
+hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) {=
 }
+static inline u64 hyp_trace_clock(void) { return 0; }
 #endif
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/cloc=
k.c
index a7fc61976fd0..8adefb0b696c 100644
--- a/arch/arm64/kvm/hyp/nvhe/clock.c
+++ b/arch/arm64/kvm/hyp/nvhe/clock.c
@@ -30,7 +30,7 @@ static u64 __clock_mult_uint128(u64 cyc, u32 mult, u32 sh=
ift)
 }
=20
 /* Does not guarantee no reader on the modified bank. */
-void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
+void hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_c=
yc)
 {
 	struct clock_data *clock =3D &trace_clock_data;
 	u64 bank =3D clock->cur ^ 1;
@@ -48,7 +48,7 @@ void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns=
, u64 epoch_cyc)
 }
=20
 /* Use untrusted host data */
-u64 trace_clock(void)
+u64 hyp_trace_clock(void)
 {
 	struct clock_data *clock =3D &trace_clock_data;
 	u64 bank =3D smp_load_acquire(&clock->cur);
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trac=
e.c
index e7e150ab265f..f2a32463c6c2 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -35,7 +35,7 @@ static bool hyp_trace_buffer_loaded(struct hyp_trace_buff=
er *trace_buffer)
 void *tracing_reserve_entry(unsigned long length)
 {
 	return simple_ring_buffer_reserve(this_cpu_ptr(trace_buffer.simple_rbs), =
length,
-					  trace_clock());
+					  hyp_trace_clock());
 }
=20
 void tracing_commit_entry(void)
@@ -290,7 +290,7 @@ void __tracing_update_clock(u32 mult, u32 shift, u64 ep=
och_ns, u64 epoch_cyc)
 	}
=20
 	/* ...we can now override the old one and swap. */
-	trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
+	hyp_trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
 }
=20
 int __tracing_reset(unsigned int cpu)
--=20
2.55.0.795.g602f6c329a-goog



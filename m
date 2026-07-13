Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4912EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8EAfjYCZ+mdecM/2UWmz0mAoe+dOmM9YeKRDVlIVuZo=; b=pFM/6OrrxVkGHcrcpP+glxHNfB
	9ZD6LDnyrfE0s9CmOz71+50ese0zJhRx7xrz8NPPE9HVR2oV4LLwVc058YuiJ2FNPXw/gkGjznlrk
	zh/hvtrM9RHdKQLhtIFlHaZuAmazH5y8lpaALAeDLd36JtvsraAb9+K9G+W801ZmPeOiCGh+V5azz
	+BlE+swPrX0unhazBq5dVHYsKqq8P+PUDUNLgOLUpB4iluFN//+v9Zc0WvpkEURxzYP4e6SD0pLN+
	ig2MqCxUsnsUuhAaNr1+jjl6Cj2nu6fe6fYqriBtG3Wg7p2JzfeNoG8dCia/i2G6BLKMWGxylE7Hq
	qz9prtyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHPa-00000009Yzz-1juB;
	Mon, 13 Jul 2026 14:13:34 +0000
Received: from mail-wm1-f73.google.com ([209.85.128.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHPY-00000009YyL-07jJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:13:33 +0000
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493bc2b376fso24382455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 07:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783952009; x=1784556809; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8EAfjYCZ+mdecM/2UWmz0mAoe+dOmM9YeKRDVlIVuZo=;
        b=X8TxI1owBC0kpnK9ZbFw9cdDZbo3C/8G4S6H9MmbO/Bf+kgoZJdivihVgh3PN4HMc8
         qCNzKtXVk08r1Gj+f7OBD55zkr5YPjZMlY9eDe6NjzPPuDYKQ6rBdzAzmuzWzuxDtPvq
         z9iXMroqPA5Gudzt+ZN665YTdHfgeS0/kqrLNH7oAQTzRtoWG/6Z2fNWK4OmAYhBwqga
         MEGqqzon0sV0h9CQm2EJrF8pQfke4dAEJVwUJEGs/GASeRxCd0OFIAqpcsT7sU0ukqj3
         X0dHsjNQ8J7iU3YFo88U8bn1g5SWBBwwkv6ipr6aKkVta6cV6h8ksXHgNR1Xjw/UPwxY
         zfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783952009; x=1784556809;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8EAfjYCZ+mdecM/2UWmz0mAoe+dOmM9YeKRDVlIVuZo=;
        b=IsbMsHoxQ3+zSOOKcBDc04ACfot1HWSOoxydsTxpjrMMiTvJZPs7l170HXB93dXUik
         ixlQ6ws2Do5JFgs+6sVQjhoBga+G9EYJ951loUhhPIkGvnNrnkheCmDWNKRAgduog6Wm
         deyGti7CYVEDB7WuhQ1t7ebwXqbeoAsRYUecJ0oYPCVWzUDLR0HOIJl2kb/oSuwCFD9p
         BdUKcelaj1JK4atKYD+zc+VZxS3sdDHqa36JsjLakR2YeFz74T7HGMIrgi8rbsY34OgF
         CTufKs+babOYDENXR1n67UhviI1Bc4NqNIz/I8oWip6tHfIRJXm9pEDYdEEnTJKby5Xb
         Iu4g==
X-Forwarded-Encrypted: i=1; AHgh+RqzS4jYK/I3T1fU6v0B5YZJsYCWRDUUCcQOcRCEBp1YiFpjtLKTCwJnjwiPJmAaffcb5GvG1ls2N3Tpxq1/3Vrn@lists.infradead.org
X-Gm-Message-State: AOJu0Yye4TNiHiN2WwLUjU5NqyuU4JSrD63KTFmZ+F9AKOQ8SQEEd/dP
	s7eeLvbB+BoPM55gejGqB+LMg1l3r+12UYt9pFOzCORIaRSztsFWZN6h01U3RTz4IXFuG1Cjyxs
	qOkIXHil+2T5ASw==
X-Received: from wmxt9-n2.prod.google.com ([2002:a05:600d:8649:20b0:493:f85a:3733])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190f:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-493f87e5b7fmr103931935e9.15.1783952008431;
 Mon, 13 Jul 2026 07:13:28 -0700 (PDT)
Date: Mon, 13 Jul 2026 14:13:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260713141320.4065600-1-smostafa@google.com>
Subject: [PATCH v2] KVM: arm64: Avoid naming collision in tracing
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, Mostafa Saleh <smostafa@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_071332_094054_EDDA91FD 
X-CRM114-Status: GOOD (  17.47  )
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
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

---
I did not add Fixes tag as this is currently dormant and not breaking
anything.
---
 arch/arm64/kvm/hyp/include/nvhe/clock.h | 8 ++++----
 arch/arm64/kvm/hyp/nvhe/clock.c         | 4 ++--
 arch/arm64/kvm/hyp/nvhe/trace.c         | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/i=
nclude/nvhe/clock.h
index 9f429f5c0664..ae03ec6965af 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
@@ -6,11 +6,11 @@
 #include <asm/kvm_hyp.h>
=20
 #ifdef CONFIG_NVHE_EL2_TRACING
-void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
-u64 trace_clock(void);
+void trace_hyp_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_c=
yc);
+u64 trace_hyp_clock(void);
 #else
 static inline void
-trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
-static inline u64 trace_clock(void) { return 0; }
+trace_hyp_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) {=
 }
+static inline u64 trace_hyp_clock(void) { return 0; }
 #endif
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/cloc=
k.c
index a7fc61976fd0..f3e2619db4e4 100644
--- a/arch/arm64/kvm/hyp/nvhe/clock.c
+++ b/arch/arm64/kvm/hyp/nvhe/clock.c
@@ -30,7 +30,7 @@ static u64 __clock_mult_uint128(u64 cyc, u32 mult, u32 sh=
ift)
 }
=20
 /* Does not guarantee no reader on the modified bank. */
-void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
+void trace_hyp_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_c=
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
+u64 trace_hyp_clock(void)
 {
 	struct clock_data *clock =3D &trace_clock_data;
 	u64 bank =3D smp_load_acquire(&clock->cur);
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trac=
e.c
index e7e150ab265f..65be6c9fb379 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -35,7 +35,7 @@ static bool hyp_trace_buffer_loaded(struct hyp_trace_buff=
er *trace_buffer)
 void *tracing_reserve_entry(unsigned long length)
 {
 	return simple_ring_buffer_reserve(this_cpu_ptr(trace_buffer.simple_rbs), =
length,
-					  trace_clock());
+					  trace_hyp_clock());
 }
=20
 void tracing_commit_entry(void)
@@ -290,7 +290,7 @@ void __tracing_update_clock(u32 mult, u32 shift, u64 ep=
och_ns, u64 epoch_cyc)
 	}
=20
 	/* ...we can now override the old one and swap. */
-	trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
+	trace_hyp_clock_update(mult, shift, epoch_ns, epoch_cyc);
 }
=20
 int __tracing_reset(unsigned int cpu)
--=20
2.55.0.795.g602f6c329a-goog



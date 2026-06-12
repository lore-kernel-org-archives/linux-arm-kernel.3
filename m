Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05599CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEOgMIo61tN5cbwnLn9iRecU9xGHnAGtn6LC63IksYY=; b=z6K99orvZ1xQfyxVwiRPL5hiMf
	4ssTqrGxE6rFcZcqyOZR/qbRLsNYCDARZ5aX4GlTscwjIXpqRTnFMBBLa+J/9sBZENw3/cWFmpwnz
	0ciNBdNjamtWap/LWvIaZwARLu9wUinJsF22Sjm5J3/6bWFrxvMLp+TjW2PeUa3x/MhCQQFTEi9f+
	JD4II5PlI9j5I5kwzvT+Fj+1b2pTPoFxdWD+/88V/lR0kpCbzDFWxDlnEFt86UrIgK23f2sk1YYck
	xOC9eckaNwSOImxXodUfhszuZfw0eD+aMLRVilCok0LHm60Jzn4EqsGhkoSmgHq0rECsl2EcR2q7X
	x6Fk3S1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Z8-0000000BSMj-3ema;
	Fri, 12 Jun 2026 19:29:18 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Z5-0000000BSK4-39FC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:16 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-486660d2abaso1645760b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292554; x=1781897354; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aEOgMIo61tN5cbwnLn9iRecU9xGHnAGtn6LC63IksYY=;
        b=MlXKF0qvwm+pDv2759EsttucuA7LhG5Xd0WH1R+uOa8NAT+s5PxlWgCEA1wVBdtAUY
         CfkooNgl4uAXiQkDat9Csu4XOwOSvIOcrtGawBQJTSvik/0no+7m8mCOiztzZ6hTJHys
         HtZl4ZbuttAvncpVRn3po6eY9oqU077paKWk/ghGVwvIWOp6T5kViN7A0oKcqnWjyBkZ
         EOx0RcRIrvSQ4dr6PKnfCn9FDO5wIvCnLVRQJvN6spsGfX29LmrLBc+3KvaVAxtJWORW
         ZmU1ymtE8xaQzy3B8Y55Hk71+PGaX4Jsw79xlZsypI4a3bWLnxTW7Y3fltY4d18LYi2l
         IB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292554; x=1781897354;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aEOgMIo61tN5cbwnLn9iRecU9xGHnAGtn6LC63IksYY=;
        b=BKgPcTmrbMlDu5w4EoANf3s9jxDFHiEvPrP+LzslJqGhlwaY8b3fV7v1DpiLlJIEgp
         XYGZEHdtpUSUjnDA+WLS88Q6CRZw90GCd/L3axBMSq0XtczFLiuh8XlGIo63BK//HkfY
         347I2Y6qA7geVLmdDDZjYpkeRR+wPHprCHyOF0s0YKNGX72iZIGQsi2IHfut7dPUCUHh
         yXk5wRqB3HGjB5a95jmfpYIxpYecnJsIb8Oqw33yybeHugXfswvbjIWFjBFEUoV8WgrR
         nWsqMYXN0rqE2sa1tVptSxDXHi7XFM4A6Lo2yIxdmxGnzIeHZZ5ykTzKnVpgQNaHIiF4
         2/Pw==
X-Forwarded-Encrypted: i=1; AFNElJ9S8FdEQ8qUceT55/sSnc116BqwYqEZgN4+PYKssLGRA20olaGL2CmdB2g0S+EX/WHjqrXBkakxP8Y/neiiRcfO@lists.infradead.org
X-Gm-Message-State: AOJu0YyXIQAVKKf26Tnin1YVe5sZCmrWOQr7nEqBU0iNqaEYmW+vr2dG
	JCCWHLF84z5qAtLny2lKXkiILQwjHOiTL54kExZnnGhqLBrrSd6PVBXiHJVTArGm0LhZzWHzUeL
	0fpKay8NEXeVSrT32oQJJRTnsMQ==
X-Received: from ilbeo3-n2.prod.google.com ([2002:a05:6e02:2903:20b0:502:1132:3da5])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6809:d2:20b0:487:4624:71c3 with SMTP id 5614622812f47-48746249e89mr25208b6e.5.1781292553983;
 Fri, 12 Jun 2026 12:29:13 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:28:52 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-5-coltonlewis@google.com>
Subject: [PATCH 04/21] perf: arm_pmuv3: Generalize counter bitmasks
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_122915_798140_6B9B3128 
X-CRM114-Status: GOOD (  12.68  )
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

The OVSR bitmasks are valid for enable and interrupt registers as well as
overflow registers. Generalize the names.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c       |  4 ++--
 include/linux/perf/arm_pmuv3.h | 14 +++++++-------
 tools/include/perf/arm_pmuv3.h | 12 +++++++-----
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 8d3b832cd633a..1cceb1f614515 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -534,7 +534,7 @@ static void armv8pmu_pmcr_write(u64 val)
 
 static int armv8pmu_has_overflowed(u64 pmovsr)
 {
-	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
+	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
 }
 
 static int armv8pmu_counter_has_overflowed(u64 pmnc, int idx)
@@ -770,7 +770,7 @@ static u64 armv8pmu_getreset_flags(void)
 	value = read_pmovsclr();
 
 	/* Write to clear flags */
-	value &= ARMV8_PMU_OVERFLOWED_MASK;
+	value &= ARMV8_PMU_CNT_MASK_ALL;
 	write_pmovsclr(value);
 
 	return value;
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index d698efba28a27..fd2a34b4a64d1 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -224,14 +224,14 @@
 				 ARMV8_PMU_PMCR_LC | ARMV8_PMU_PMCR_LP)
 
 /*
- * PMOVSR: counters overflow flag status reg
+ * Counter bitmask layouts for overflow, enable, and interrupts
  */
-#define ARMV8_PMU_OVSR_P		GENMASK(30, 0)
-#define ARMV8_PMU_OVSR_C		BIT(31)
-#define ARMV8_PMU_OVSR_F		BIT_ULL(32) /* arm64 only */
-/* Mask for writable bits is both P and C fields */
-#define ARMV8_PMU_OVERFLOWED_MASK	(ARMV8_PMU_OVSR_P | ARMV8_PMU_OVSR_C | \
-					ARMV8_PMU_OVSR_F)
+#define ARMV8_PMU_CNT_MASK_P		GENMASK(30, 0)
+#define ARMV8_PMU_CNT_MASK_C		BIT(31)
+#define ARMV8_PMU_CNT_MASK_F		BIT_ULL(32) /* arm64 only */
+#define ARMV8_PMU_CNT_MASK_ALL		(ARMV8_PMU_CNT_MASK_P | \
+					 ARMV8_PMU_CNT_MASK_C | \
+					 ARMV8_PMU_CNT_MASK_F)
 
 /*
  * PMXEVTYPER: Event selection reg
diff --git a/tools/include/perf/arm_pmuv3.h b/tools/include/perf/arm_pmuv3.h
index 1e397d55384ed..d045b0f3b93fe 100644
--- a/tools/include/perf/arm_pmuv3.h
+++ b/tools/include/perf/arm_pmuv3.h
@@ -226,12 +226,14 @@
 				 ARMV8_PMU_PMCR_LC | ARMV8_PMU_PMCR_LP)
 
 /*
- * PMOVSR: counters overflow flag status reg
+ * Counter bitmask layouts for overflow, enable, and interrupts
  */
-#define ARMV8_PMU_OVSR_P		GENMASK(30, 0)
-#define ARMV8_PMU_OVSR_C		BIT(31)
-/* Mask for writable bits is both P and C fields */
-#define ARMV8_PMU_OVERFLOWED_MASK	(ARMV8_PMU_OVSR_P | ARMV8_PMU_OVSR_C)
+#define ARMV8_PMU_CNT_MASK_P		GENMASK(30, 0)
+#define ARMV8_PMU_CNT_MASK_C		BIT(31)
+#define ARMV8_PMU_CNT_MASK_F		BIT_ULL(32) /* arm64 only */
+#define ARMV8_PMU_CNT_MASK_ALL		(ARMV8_PMU_CNT_MASK_P | \
+					 ARMV8_PMU_CNT_MASK_C | \
+					 ARMV8_PMU_CNT_MASK_F)
 
 /*
  * PMXEVTYPER: Event selection reg
-- 
2.54.0.1136.gdb2ca164c4-goog



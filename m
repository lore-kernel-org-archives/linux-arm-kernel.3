Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2745ECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 21:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thCWuABQmlCLQCDjA65mDdmemz/sfk/Mfmpa4HEmTAo=; b=o1czAjadjGGaMC3mrnChGFiG1d
	BEIligscdENZhBEXouDkKcM/kU7+UIs0aRAU1dxXXGrcley6/uH2R3+OPhey1Y86QDSTFMy+AvYHL
	0ViCFBJPA1AIBD877WtDNzByUxW02sCAamcJP1LdX2aPAs3059yanardvMkblJZOyKZJwVZH7YoAY
	0Rw9w5T1qYGl3uJy+iricJKHlRmZeRGyxxpqjqB3NWeSf84u4UD0G6K7xnUTOEISmmsBj1msXTrIW
	0GnAqh5qOnql8iULMquOzB3DJd/batVDCnfzGGaG2W3bfKiU04qrlpXW5A0T2vPYTFqZAqcc+8TrN
	zduAzNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gX-0000000ELJq-0Jla;
	Mon, 04 May 2026 21:18:37 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gU-0000000ELGe-29MW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 21:18:35 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-6961bdde2a1so10392424eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 14:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929513; x=1778534313; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=thCWuABQmlCLQCDjA65mDdmemz/sfk/Mfmpa4HEmTAo=;
        b=vzf7zUU+0/8X9cTaWwIzPG7rLpwz7aLSt1T97J6eZCghyihjkmEUOCr0fTcECeR++5
         aYlcvTQzZhj/HfgDv25evyWQ+CqwgAUVZnRIJK3PyrqQzzjocY9dkNzHBVCdN/LRu0XE
         /QeZnA3NHNjbpOh4gZuv7QYRCXMZwpHY03RE7sJVAvXAgSTg0UyFuENE1FwP4YoLworT
         TZxkwWUs4sQ3ST3qCtYT6qdKhC3M/PmKDJ4M/XCn5kV1RInA7Li4+0SxBotlQ/GUqa/7
         b6cR/Jn8ngijUlMRkTLYPEDHl6/AIUtAJ7bl4UNNyr68BEocDmntuZ76rhY3SLk/uqn0
         TFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929513; x=1778534313;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thCWuABQmlCLQCDjA65mDdmemz/sfk/Mfmpa4HEmTAo=;
        b=qM41rBS494bYWnIwmHRCZtte2yQcWmpFc2Sm2d3/cKunPaTpHX4edX56PI6t46CO3H
         7wriafQODIAZbJlBwCtvzcWrZlIhJRAMVfatoNnyA7IeOvJUVALpI+H54pXa11NTzFsx
         xFwpzYJzXQ2H/wKJUP43pR7oxQAd1h0+WrzCn1r1VzQlTTMcDYdGpLEBHpg1Hft8Qeh4
         cEI8IEfW1ikARKa2sw5wjUoO77KJhHXfqPGTUm3krzFfYz101B7NF4oxzdoYjMCLMbF1
         n1kaB5eDKIMSwCU4bCQq0W1o3hzZm87oQtN2BPRINLZIlcgzCYKeLYvO65GN7eG/hNu1
         a84A==
X-Forwarded-Encrypted: i=1; AFNElJ9a2U4g9ZmYAMfXHXPNxg75x7JC4jb7pWo8FaB1/jVEr6v/NoScdCkjYjIrLtR+O4+2acqqKtZ8CJ+EKrgz56i4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+t8JPy0jNQ119FoDI5HxvJBv143q6TJ9SsYxMyP8q5Gp5sNd+
	Rb1eoKKqzkhh0mR1CXvJb07rAsCzY33TU5OgGm4vyxGshhT1Z2svZVMAsoXCO6cj3sI3SFOGz9M
	lvy9BJNZJSP+OXS1y8GtdT5Js4g==
X-Received: from ilst10.prod.google.com ([2002:a05:6e02:60a:b0:4fc:39c6:a601])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:f08:b0:696:32ad:e894 with SMTP id 006d021491bc7-696979ec5c7mr5763143eaf.23.1777929512987;
 Mon, 04 May 2026 14:18:32 -0700 (PDT)
Date: Mon,  4 May 2026 21:17:57 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-5-coltonlewis@google.com>
Subject: [PATCH v7 04/20] perf: arm_pmuv3: Generalize counter bitmasks
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_141834_556702_A83A318B 
X-CRM114-Status: GOOD (  13.08  )
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
 2 files changed, 9 insertions(+), 9 deletions(-)

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
-- 
2.54.0.545.g6539524ca2-goog



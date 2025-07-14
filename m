Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDBEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LikijBgA9hgJn1z8WT/27yywkDcxcZWUZywAO0Cb1M=; b=J+3iTSUACfNTH2WrzE8k1DMNdt
	rVsKljG6cqsgU1VwT5Wa0OTvKRJP/Azi1Tsujm6KLub06n3klIKyeuIY2jzwHkAMSiMniSZ+/LAL6
	ANjwlpBPDjNo5d/Dlm5Skrvi/BDdCBvcs34w8k+D7AEz3Y6EwcAD9wDnshOJasREtamNvP99fEkKm
	I9c3wXx8OsyYZwTHWRzuz0RIYG0Pr5ZjFomCkuZxM0s8zuhUywC7Y78AZgrtYti3yFSz7ZZUrbZm5
	5iIBCyI2OblR9Kp+nYr5b2XwhCm7WGUTyLnhUO72lSUbgZMwAF1qn5h0qCPNAXCDqm7jkeSJrXxne
	4U+lpLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSOP-00000003WU0-0IYg;
	Mon, 14 Jul 2025 23:15:29 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS92-00000003SQg-1Gat
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:37 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-86463467dddso519843539f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533975; x=1753138775; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4LikijBgA9hgJn1z8WT/27yywkDcxcZWUZywAO0Cb1M=;
        b=FPs7/iYm7/zH1K0YuUaNClWXnoZsIlgiOKfQ0Wd+jN6oKEilQQp0usD0sBQ6PPrTIF
         CHGE8biOybT3X4Pr8psS3vb0SdhcJVr9rjyez8TuQHL0i6mS+NhxlprkZgGOsRqqz8f2
         cMdzCbN7talnrNzWzgQYUstHPonsdIZ5EglzdFP33Zv0T1JRtv+cQPcupaYhkb8suwvN
         cH/Bm/qr+P7pV3JCkH6OD3vYgSdt4Kd+yoHz0zpxhdkHOf0OxH42iRD/AbgbXSdj/zjR
         oXOKxVhj6TAEgD71miWu8Vuvj9iduFN1kyCCjsEnRo1Lx0Znv654QWdjR5AeObCA5D0V
         UrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533975; x=1753138775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LikijBgA9hgJn1z8WT/27yywkDcxcZWUZywAO0Cb1M=;
        b=E1J8O5zUnIX/RdrmVuwr+84N+D9qeHO/yh+WBK3h1K+7BgeqWabxY3iuC1ELjkvQdA
         KlTl/5w9p3JBY/tINCfLl4qmOYw3SNSK8H0FmPfbi5aWewO6Z4CME8iXSS0eNHX58UAi
         F8PxTbRWlaIweoz7fDPLMVyErHqIxPrXwYaaiBxuFfVAHz5+s4VtcYXj+6jzVXAlRM+x
         cuRTGY60VC+G9CtNBbDTuKY9OsxlyKZ6/QuX/5Whal1rX2yg75lbK6Ayww3ySwXn3B/X
         MQASpY5uC7r3ieUOE44cDAl6J1nv1c0YzUUz/sF3FNvNX/ceaFPzJa2uDkpiucU0lI5E
         6L8g==
X-Forwarded-Encrypted: i=1; AJvYcCWcFJmud8AiqKSAv7P99g5M4oPdrni/DBRGB3Cwnl/VfEomY6/tkkXmYtHifniDUeyo8VlOXAlx8D/XVNv1YCpp@lists.infradead.org
X-Gm-Message-State: AOJu0YysKYml/tYaduNQzMIlshGpBh3LVOMxeY7hPaMyo6DtjmQ50L1j
	rNtJ1zk2M5AneS5RZ4hulzv/18a0//+BcnY9/bxBsqnHjHq3P3wpRkeAF/IQn4c5bmMKXyDuP+v
	MpAlSUXXbt7nwqnlgMm0xNUR8qQ==
X-Google-Smtp-Source: AGHT+IEwx9UBGT/8wheREiWV+S0ihYQlL4yh0otkxzUq1va/b8+IqqW7BehvDHYAb7BE/vWyVZofNwSdDr4keaqSbQ==
X-Received: from iove26.prod.google.com ([2002:a05:6602:45a:b0:861:c7b1:d848])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:7402:b0:873:35c8:16f9 with SMTP id ca18e2360f4ac-8797882781amr1351696339f.8.1752533975408;
 Mon, 14 Jul 2025 15:59:35 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:58:59 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-6-coltonlewis@google.com>
Subject: [PATCH v4 05/23] perf: arm_pmuv3: Generalize counter bitmasks
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_155936_346430_AA1042C7 
X-CRM114-Status: GOOD (  12.62  )
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
index 294ccbdc3816..339d3c2d91a0 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -518,7 +518,7 @@ static u64 armv8pmu_pmcr_n_read(void)
 
 static int armv8pmu_has_overflowed(u64 pmovsr)
 {
-	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
+	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
 }
 
 static int armv8pmu_counter_has_overflowed(u64 pmnc, int idx)
@@ -754,7 +754,7 @@ static u64 armv8pmu_getreset_flags(void)
 	value = read_pmovsclr();
 
 	/* Write to clear flags */
-	value &= ARMV8_PMU_OVERFLOWED_MASK;
+	value &= ARMV8_PMU_CNT_MASK_ALL;
 	write_pmovsclr(value);
 
 	return value;
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index d698efba28a2..fd2a34b4a64d 100644
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
2.50.0.727.gbf7dc18ff4-goog



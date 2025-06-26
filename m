Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4DDC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBWQmXlElKRqufKLx0IJBng3uEmJIOP/0SNzHgrfiOQ=; b=JDQShWbjozvlMbwRdAyzII8AJ+
	p5ng25ivKNeiEw8L6K46Ly59u411g2n7I9FlikzpVRDlTRB5iig1XEHH7S4lRuMnIqjvrRJRR/FDC
	jJzqijqysNxlyd8zAmKseabM7dMZUE5JAg6lu9K1xWbeGxGal7O3yV/t5nMpahA2v7Ojwh7xUUQVt
	m0bpxFZJWgSFKpebcyk2fsMTjR8nPlKUNVpvjyr2Fzj4lMrPgHVY3hdrq6ialTeq8QLB8ttPjK2X6
	mI56rnQoZkN+5A6SF5HiDfn64/55dGK+/eTr3oiEoWrbsrKemsOY9M336KFMeZBjQproa8LsrGQN6
	LcDYJ0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuZr-0000000CslN-3Hf4;
	Thu, 26 Jun 2025 21:56:15 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsr9-0000000Cgha-332q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:06:00 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3df393bf5f2so14559145ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968358; x=1751573158; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mBWQmXlElKRqufKLx0IJBng3uEmJIOP/0SNzHgrfiOQ=;
        b=RCPLuN+AngJoOiHaf07OhTyhbMWcfY9uS2VKUrRjBR5RlX5OiJ5GMJpWUJT6LFgNYX
         pI9OgEW2J+2Yu9J8iJrcW9gKwoEKXUI+eoAihmcQ8ILD2LSfMCUfv2OechpBUCmSaKTg
         yuVrbz3iIW/gwPxb5fR1mzMI1bhBleeQI7xuF7hjoS2AcuYADSnTAWbVH0ox8Z15knOO
         7/21ZjCZYHSrBYeH1fQsjM+DCgVfhek8yaW8rqOqj4nbEi4/fZSEf5IBrzuLHL3Dap1V
         lBvGEtbGdq2l5NVc1loNQfm33v5gfLPGXU2Kd7Xwml6WQbYx8QZEEbWdmlpIUineZtle
         KYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968358; x=1751573158;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBWQmXlElKRqufKLx0IJBng3uEmJIOP/0SNzHgrfiOQ=;
        b=QOc5RYJW5VFvtZ9LmAOeFXh7JApfbsBbFZ+pANDpFG4qOGG8aoUSDii/FOEDPnOjj6
         3egL6z+3SX01I/XtWi/rUMDt/ndhTKkR8Xwm1NHaQ62TN1wWVf4djvFKhXUa6biwW3qg
         HalLDIYLhv3pxUaEJI2QHMBmZJ7W1Fazt5odlOt1l759Muam/6HR9EKkO6o+MUANzuxV
         GAKo2e9kQ2Up9FLuwmG1yeKq2WSzB7hmSI2fc1tER4Y4MM+RCyJ7myt2SFSJGZmuj/Fe
         fQepIh31sVd/SvBX77L040qvYTw9XhvKWoPmPOkSKoicms/o5lrwFrxJIQzn6HBVPdwK
         cnVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsiZJddKz6VQoIGVAvlO1//+cgY7PWPazfixBW9bPUjHOW4wVuCBp1EwIVE2Ox3Q5rWXlz6xWVaIOyKqe69YoG@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm21lMrfXgfXAdXoxwEuPNku2xKJlks6HyW+fsztm/BRkEW3gX
	AIe8TNqiQPF2oekuApo7Ma0oQvgK9DDqNFQ163948INgi7WPpKKVOLORW4GFahGUmVZalgnazC7
	d2VAdokCxkZM40CaoMboMgbXvTA==
X-Google-Smtp-Source: AGHT+IGgfwcSnINywDElIvOUq/qNOGZjEQuNJ0HSkOlhtmSxQvzs3JhS67z89W+d6j0EUhWxDQaGOM9wiefkiUhZhQ==
X-Received: from ilbea18.prod.google.com ([2002:a05:6e02:4512:b0:3dd:bec6:9d56])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:2683:b0:3df:385d:50a8 with SMTP id e9e14a558f8ab-3df4ab62001mr10858775ab.6.1750968358575;
 Thu, 26 Jun 2025 13:05:58 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:43 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-8-coltonlewis@google.com>
Subject: [PATCH v3 07/22] perf: arm_pmuv3: Generalize counter bitmasks
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
X-CRM114-CacheID: sfid-20250626_130559_793772_4AA4FFCE 
X-CRM114-Status: GOOD (  12.44  )
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

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c       |  4 ++--
 include/linux/perf/arm_pmuv3.h | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 6358de6c9fab..3bc016afea34 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -513,7 +513,7 @@ static u64 armv8pmu_pmcr_n_read(void)
 
 static int armv8pmu_has_overflowed(u64 pmovsr)
 {
-	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
+	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
 }
 
 static int armv8pmu_counter_has_overflowed(u64 pmnc, int idx)
@@ -749,7 +749,7 @@ static u64 armv8pmu_getreset_flags(void)
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



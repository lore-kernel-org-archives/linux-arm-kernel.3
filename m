Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA8ED3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5yWZRzHwonF0ybTPKNr07gTZcgByeP7H9fiRk7DESE=; b=WV73EJ1Lu1OhiB4kE0snjSPSTI
	NFpMdN98P8yy3WCbE3dV34dKFArCuCmmvODBkKCN7VA882Dyjf4xPPHP+dYfmz/N+E0InKxvZktRK
	NPbDkK4pzqlTnPJku6V2NVdK6VMvW8YSv0faspelqAT5L95J9psL/cD71JEND7WlX8Ft7BkfD76Fr
	pG+xGwKPN+hvr6YSLrgVlSSVdOg7EIVePKR4aRsvPXrVVcwO6ND9W+qH21IAo2ZExf8BQ6MT43HJp
	lZS8PFxhz21R8ZhJYvBLFjG6s260n5YPWLM69UAxmrh/1Tgor0jjN8K0HjODk2Ua43A5RzxKUyV3R
	2iQ1axGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hM-0000000EkjB-1SWC;
	Tue, 09 Dec 2025 20:52:40 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hH-0000000Ekcy-1IRK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:36 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-4538a8bc513so7103686b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313554; x=1765918354; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A5yWZRzHwonF0ybTPKNr07gTZcgByeP7H9fiRk7DESE=;
        b=OSQKrrptUJS+IMVtltTlwQtdn1W9ezdhq1riNRCepP+Rk9X6vN4lO3UbQaNdsW8fLc
         xExwJ51Fi53cOft9JalVNfZ6bktwPtShP5BCp/Sir6COmKAEMgQvskVNae1fNpyl5FHa
         1BibyKH08wzj7oR/JaySQFvrISyoUkn+pD7vDnX3eNnRaowfz2zwQVv3hkoqs18arMsG
         EEhtB4l8F0WgY8p+OVOpjgANE5OU5NtlMa5M9Qrl9H016Wlk9RlFn4yBVpwSc5svadD3
         8THDwV7EJkqXI4JPCSOZRuQ8hVtyOp2mv2ffxchI0G/ek2wOu9//UfYnQgw62hNzkmCc
         heRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313554; x=1765918354;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A5yWZRzHwonF0ybTPKNr07gTZcgByeP7H9fiRk7DESE=;
        b=i/w8ZU2vCd3j4SEeQ280tN5md88/YyHTKWnrPF9xdrxiJrtKcki3RPFR66l0fT3PTT
         anb2C2Rpm0VhB1pnoI/Dt0WoW/o67d1kEXM3mogmEB1X7EsshnBlMq7H35XdN8GVJ7PD
         TM9q2CYKYvPfK51o/znwk5VHWmDXALMjtjkN6xyjw3nlihoy6ey6nwJtFXO3OTMorTd0
         VDpnxUeYCVP2gdp942auN0R1y1PCjN1OrKMJPdYVS4jFE9KnqNx1tjr76QnHBpC1/Vmk
         lmgFLRvDhA8Gbc4gvqN57GKzhytcEer55m3taG0awkeAlLEenWkk2atKpTI5js/aEY7t
         Rfwg==
X-Forwarded-Encrypted: i=1; AJvYcCXrRWSnqH4F/NenqL5Q2UFDeozEMe2yizGNvVPFdJ0bn/7h6PGQUiyNbRiVrlv8MBCpXRhep9JvTl4v5KBOg3jT@lists.infradead.org
X-Gm-Message-State: AOJu0YysC5quboyKpZpHwIm7B9CgNOLrtYwgXfjlQEsLgK/P+oUVR3Nb
	KJpvcGHMtiILqZEXRIZtBR5l0KEW7EImjSls3c1KRAvlHnscK1K0wUm780SSwOOsbDIXkjyO8lp
	HcRri2oyABxHu3dloKcz3bk0MqQ==
X-Google-Smtp-Source: AGHT+IH2y/y/c/VHwW7FsQzg6cEqGCqxyR53g3FW4QbocbYeWU2m/DAvppskfkGhYMkbAciwVFKu+/4Kb6/59MH36Q==
X-Received: from oibbx18.prod.google.com ([2002:a05:6808:1b12:b0:453:f2f:fd82])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:191d:b0:44d:aa8b:58f2 with SMTP id 5614622812f47-45586554d1fmr140748b6e.9.1765313553989;
 Tue, 09 Dec 2025 12:52:33 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:05 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-9-coltonlewis@google.com>
Subject: [PATCH v5 08/24] perf: arm_pmuv3: Generalize counter bitmasks
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_125235_415277_D75D4FDB 
X-CRM114-Status: GOOD (  12.43  )
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
index 379d1877a61ba..3e6eb4be4ac43 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -546,7 +546,7 @@ static u64 armv8pmu_pmcr_n_read(void)
 
 static int armv8pmu_has_overflowed(u64 pmovsr)
 {
-	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
+	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
 }
 
 static int armv8pmu_counter_has_overflowed(u64 pmnc, int idx)
@@ -782,7 +782,7 @@ static u64 armv8pmu_getreset_flags(void)
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
2.52.0.239.gd5f0c6e74e-goog



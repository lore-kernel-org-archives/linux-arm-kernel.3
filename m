Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F20BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4FURCINKr7NX33Z60V+IaJr5vxjm1rQB4e+HJZrgWs=; b=crtlZJNAZm8xv7ag+XOXd8Hc+b
	8goteTnRQZS9YHUP01DYNM5VKvvCCxYNHVxZcVq5gFlciXZv2XeHfSADwyy0H5lpxWw46u/QlmTVf
	94uVGvyZfyzNfRFOgTEBek2qKalh20MzlwNIZe7wBZsaiZbz/37ntXQJPkcIaszpYMeF3ZGSPzqDg
	/RZka2FVWmydfsWebgnaDVBAitW5aNbZaH30Fmy6InLCLNK+9yJwTGCwVUCcGlZDIUX+UrPgPQPlg
	LTAVPBKNOGMQ8+DHi35ROhpmmPG6fzgBQ8tz0PxaNnf+Prdob/mhXevMJqElQbILM4BGnzbXrfaGU
	0WtB/IMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoKu-00000001cSo-069J;
	Mon, 06 Jan 2025 14:44:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo32-00000001Z8f-2P3B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:25:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4361815b96cso95992195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173539; x=1736778339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4FURCINKr7NX33Z60V+IaJr5vxjm1rQB4e+HJZrgWs=;
        b=mH9w/172Z3qsYwv1BdNFwMZOXvTZ9rAKAPiLUeekXYTnQBMYcYzR+4DFe8mMi645sj
         kfLWOQJLSEQ7SV1iV/Yehb0DSPV+mtrKctcPA4nz4C01fYsoxCAUgbpyZ6NnJMcL9Dpn
         o6Obl2K2NbOU/94WMEYsIv6kH8k5xWRb2D3sOEDwoPrwutwvJJ7vFgDI0lYgWq14Xvp3
         8rmg95hMmMADGJXNHvwHzzzA/L6T5T9hw5UE2RpCoacQsN/vxsL1dKeSSZyfGqltl/Xt
         T1MXO1K3OhhjayhQbgXbO/TLnjAJXxxszcBT6wX8w9mbjYitBqX/Zm3fVTdm0be13QU7
         JHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173539; x=1736778339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4FURCINKr7NX33Z60V+IaJr5vxjm1rQB4e+HJZrgWs=;
        b=jZv0ZRx/Doi6dLmhQMDYrSjg08V4zwDqUHxR7oL55hZh+vSYAdcTn0AzBhYMaaI9w3
         SKSa3WGOHMFyUlj6JzCfsjNgWeHXS5vxx/GopimgfroJn4dLmXzjYe0eDXnbxaRCroCA
         eTjUOdVD1uOI86lyL1Q2Gtx7JzzX7lUXBQUx9W61Dlvg41wW56DGAel9gHyNr+ZCoCl6
         0fsJcv3l5n62duoh321hmoD2PWDxA68Fm/3uoKBb8yopyV/x45/1/3mumxZ/dTdpotIp
         s8R7w9mzJW7HAvBvIRCrmMUItq4RHdGmaz9elmN9NdpcU7qgF6eTeTkM/nCEVmWds94d
         Ez6w==
X-Forwarded-Encrypted: i=1; AJvYcCW74nAXu7dpR8kO0ypfKTauvTdyiKO6K8OKlDlpez4mjjtX2MXGeDGPa8EAg+zLzeq/nTexl7hzuCc2NJ1MraCw@lists.infradead.org
X-Gm-Message-State: AOJu0YxN98t3GnOnd4zGBOMRWQWB03pJ1bMIXJBHFK+DKMZ8KnofJNx/
	6yR6xhOfdb6hKv/ubsn69GRnQTIJwj07qqbzdcNS2aRnzuZElt2i7rW2cZANCkk=
X-Gm-Gg: ASbGncux9PeBi7atV8NjPsS3IMUpvJKzIMibho6S83nPEOOGOBuvlEjX3m60hJ5V1Ui
	Q0Yf1KfDmE2EM/3NicgUE8EGntZy6VhwdBbPAl3DINLOzp7PAlqEPl32U56ZDm3XAuOHXrHR7lN
	bpl1BQIn0drZjuAnd5mtRnWHnu8GHvtH/hiFf9YKPVlYHqVi4H2od+xesj/wR7tFIjdiGk2LKuB
	G4GRqeCVGKsWMmBTEnxsq0OrE42G9UgjR5S91dzTd4qd1raZSwibW9x
X-Google-Smtp-Source: AGHT+IHNLnyVmlKkbLfI/PDeuk5rdMd8f/IeyvUgQFVnOZ9/TBhF1qyUczOTkIZZk0UX9aboKEWy9A==
X-Received: by 2002:a05:6000:1f88:b0:386:4034:f9a0 with SMTP id ffacd0b85a97d-38a22408cbemr45911323f8f.52.1736173539166;
        Mon, 06 Jan 2025 06:25:39 -0800 (PST)
Received: from pop-os.. ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4365d116d8fsm577295045e9.17.2025.01.06.06.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:25:38 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Brown <broonie@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	James Morse <james.morse@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 7/7] coresight: Pass guest TRFCR value to KVM
Date: Mon,  6 Jan 2025 14:24:42 +0000
Message-Id: <20250106142446.628923-8-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250106142446.628923-1-james.clark@linaro.org>
References: <20250106142446.628923-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_062540_615542_C62700EE 
X-CRM114-Status: GOOD (  25.86  )
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

From: James Clark <james.clark@arm.com>

Currently the userspace and kernel filters for guests are never set, so
no trace will be generated for them. Add support for tracing guests by
passing the desired TRFCR value to KVM so it can be applied to the
guest.

By writing either E1TRE or E0TRE, filtering on either guest kernel or
guest userspace is also supported. And if both E1TRE and E0TRE are
cleared when exclude_guest is set, that option is supported too. This
change also brings exclude_host support which is difficult to add as a
separate commit without excess churn and resulting in no trace at all.

cpu_prohibit_trace() gets moved to TRBE because the ETM driver doesn't
need the read, it already has the base TRFCR value. TRBE only needs
the read to disable it and then restore.

Testing
=======

The addresses were counted with the following:

  $ perf report -D | grep -Eo 'EL2|EL1|EL0' | sort | uniq -c

Guest kernel only:

  $ perf record -e cs_etm//Gk -a -- true
    535 EL1
      1 EL2

Guest user only (only 5 addresses because the guest runs slowly in the
model):

  $ perf record -e cs_etm//Gu -a -- true
    5 EL0

Host kernel only:

  $  perf record -e cs_etm//Hk -a -- true
   3501 EL2

Host userspace only:

  $  perf record -e cs_etm//Hu -a -- true
    408 EL0
      1 EL2

Signed-off-by: James Clark <james.clark@arm.com>
---
 .../coresight/coresight-etm4x-core.c          | 49 ++++++++++++++++---
 drivers/hwtracing/coresight/coresight-etm4x.h |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h  |  3 ++
 .../coresight/coresight-self-hosted-trace.h   |  9 ----
 drivers/hwtracing/coresight/coresight-trbe.c  | 10 ++++
 5 files changed, 56 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index dd8c74f893db..fbc4aa378527 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -6,6 +6,7 @@
 #include <linux/acpi.h>
 #include <linux/bitops.h>
 #include <linux/kernel.h>
+#include <linux/kvm_host.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/types.h>
@@ -268,10 +269,28 @@ struct etm4_enable_arg {
  */
 static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
 {
+	u64 trfcr;
+
 	/* If the CPU doesn't support FEAT_TRF, nothing to do */
 	if (!drvdata->trfcr)
 		return;
-	cpu_prohibit_trace();
+
+	trfcr = drvdata->trfcr & ~(TRFCR_ELx_ExTRE | TRFCR_ELx_E0TRE);
+
+	write_trfcr(trfcr);
+	kvm_tracing_set_el1_configuration(trfcr);
+}
+
+static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
+{
+	u64 trfcr = drvdata->trfcr;
+
+	if (drvdata->config.mode & ETM_MODE_EXCL_KERN)
+		trfcr &= ~TRFCR_ELx_ExTRE;
+	if (drvdata->config.mode & ETM_MODE_EXCL_USER)
+		trfcr &= ~TRFCR_ELx_E0TRE;
+
+	return trfcr;
 }
 
 /*
@@ -286,18 +305,28 @@ static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
  */
 static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
 {
-	u64 trfcr = drvdata->trfcr;
+	u64 trfcr, guest_trfcr;
 
 	/* If the CPU doesn't support FEAT_TRF, nothing to do */
-	if (!trfcr)
+	if (!drvdata->trfcr)
 		return;
 
-	if (drvdata->config.mode & ETM_MODE_EXCL_KERN)
-		trfcr &= ~TRFCR_ELx_ExTRE;
-	if (drvdata->config.mode & ETM_MODE_EXCL_USER)
-		trfcr &= ~TRFCR_ELx_E0TRE;
+	if (drvdata->config.mode & ETM_MODE_EXCL_HOST)
+		trfcr = drvdata->trfcr & ~(TRFCR_ELx_ExTRE | TRFCR_ELx_E0TRE);
+	else
+		trfcr = etm4x_get_kern_user_filter(drvdata);
 
 	write_trfcr(trfcr);
+
+	/* Set filters for guests and pass to KVM */
+	if (drvdata->config.mode & ETM_MODE_EXCL_GUEST)
+		guest_trfcr = drvdata->trfcr & ~(TRFCR_ELx_ExTRE | TRFCR_ELx_E0TRE);
+	else
+		guest_trfcr = etm4x_get_kern_user_filter(drvdata);
+
+	/* TRFCR_EL1 doesn't have CX so mask it out. */
+	guest_trfcr &= ~TRFCR_EL2_CX;
+	kvm_tracing_set_el1_configuration(guest_trfcr);
 }
 
 #ifdef CONFIG_ETM4X_IMPDEF_FEATURE
@@ -655,6 +684,12 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 	if (attr->exclude_user)
 		config->mode = ETM_MODE_EXCL_USER;
 
+	if (attr->exclude_host)
+		config->mode |= ETM_MODE_EXCL_HOST;
+
+	if (attr->exclude_guest)
+		config->mode |= ETM_MODE_EXCL_GUEST;
+
 	/* Always start from the default config */
 	etm4_set_default_config(config);
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 9e9165f62e81..1119762b5cec 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -817,7 +817,7 @@ enum etm_impdef_type {
  * @s_ex_level: Secure ELs where tracing is supported.
  */
 struct etmv4_config {
-	u32				mode;
+	u64				mode;
 	u32				pe_sel;
 	u32				cfg;
 	u32				eventctrl0;
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 05f891ca6b5c..76403530f33e 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -42,6 +42,9 @@ extern const struct device_type coresight_dev_type[];
 
 #define ETM_MODE_EXCL_KERN	BIT(30)
 #define ETM_MODE_EXCL_USER	BIT(31)
+#define ETM_MODE_EXCL_HOST	BIT(32)
+#define ETM_MODE_EXCL_GUEST	BIT(33)
+
 struct cs_pair_attribute {
 	struct device_attribute attr;
 	u32 lo_off;
diff --git a/drivers/hwtracing/coresight/coresight-self-hosted-trace.h b/drivers/hwtracing/coresight/coresight-self-hosted-trace.h
index 53840a2c41f2..303d71911870 100644
--- a/drivers/hwtracing/coresight/coresight-self-hosted-trace.h
+++ b/drivers/hwtracing/coresight/coresight-self-hosted-trace.h
@@ -21,13 +21,4 @@ static inline void write_trfcr(u64 val)
 	isb();
 }
 
-static inline u64 cpu_prohibit_trace(void)
-{
-	u64 trfcr = read_trfcr();
-
-	/* Prohibit tracing at EL0 & the kernel EL */
-	write_trfcr(trfcr & ~(TRFCR_ELx_ExTRE | TRFCR_ELx_E0TRE));
-	/* Return the original value of the TRFCR */
-	return trfcr;
-}
 #endif /*  __CORESIGHT_SELF_HOSTED_TRACE_H */
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index a728802d2206..d6eb0d525a4d 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1113,6 +1113,16 @@ static bool is_perf_trbe(struct perf_output_handle *handle)
 	return true;
 }
 
+static u64 cpu_prohibit_trace(void)
+{
+	u64 trfcr = read_trfcr();
+
+	/* Prohibit tracing at EL0 & the kernel EL */
+	write_trfcr(trfcr & ~(TRFCR_ELx_ExTRE | TRFCR_ELx_E0TRE));
+	/* Return the original value of the TRFCR */
+	return trfcr;
+}
+
 static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 {
 	struct perf_output_handle **handle_ptr = dev;
-- 
2.34.1



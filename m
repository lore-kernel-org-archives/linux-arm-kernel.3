Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C89BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4FURCINKr7NX33Z60V+IaJr5vxjm1rQB4e+HJZrgWs=; b=g70zyhO2fYtgroqTllCWka4nHe
	iOWZLjLXuQLv2OuEPEulLNhFmfH2TDDfHD+C3mEP6ITtUvHDBrx+I2AaADoWtJGofOarZHpUxW4fM
	RBbj37Fn+mqiEG5lZ6/LKZ6YbCd2DBTut0Ybyyt56R5mcIEb74U+R4fZ7NtaEtZ2ieRdpWfrBxapt
	93vsBFVsfnY6MRf+nevOXEcsaMbH8PMYm86UPrZDWl/vbGLfMS8i1NUE0Q4tzZHTVOQGmbNTcjihi
	RMxtHLfdCNnGcQrs08PSfFBQNS20kM/mPeHIJGAiX3/PzQbVEo5xBTvxoDZsdFL41O4YF7K9lhu1Q
	162CkyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV89k-00000004e9T-28ao;
	Tue, 07 Jan 2025 11:53:56 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7rr-00000004a3Y-3W7E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:35:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso95431325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736249726; x=1736854526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4FURCINKr7NX33Z60V+IaJr5vxjm1rQB4e+HJZrgWs=;
        b=n+QEfuYE26rZpNxC3ycfIH05MnBVcoVnzAS24UvD8OHC+dJ37HaeqWCvJKW/7ehQaU
         oqe2Wi5Bq/i6AVF0/o2zFFFlDLFhUTXlaEjAB6131jTc/W8w0q20wBnEuWcjxNBR3dHF
         jWLr09gaiFyuapRa7ZALo7v6vCl9JlNZBw+d2a3d7qY5vq33WpYmNMNJLNn7IoVglEeq
         QxA0U/BbXw/LKTKukQUohIKzIfQPVcKy/zjInLrutcKd2qtFn2woz4BsC7fYbPlvCSDI
         av+QKV2IZb5OWktBJAa/GAQrRhK4aev16VcRP+UDF9Jk5EV8AmaaaQrl8p+dyuaPclJ9
         aBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249726; x=1736854526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4FURCINKr7NX33Z60V+IaJr5vxjm1rQB4e+HJZrgWs=;
        b=v2qbtjewe7wUYFuVmgDKjf6uEtEL9NZwi4DfYq02Uku4+L0vMyzgxqBNuurAmUm+he
         ED41GdBUHcrKESAjMjEd0rVAogdkpqpy+aGESLTIbAb5UJ28EEBfUIwX1UDXzFmuhwZp
         gvjV592bri8kaiVNykUti4VU+54IbzepdTpOQ7y1gyQ51g8LnSSOmVoQvvhqIE2jI+6g
         Cm2C/syKV4Dckn24GhYBS9+vLRwz9SehrAIAEACIX8C21ytGr5fPqlIBI48dBw9zjHQv
         dYQRXd2+ABlhzG0FC1yB0MwqYeqlmVvCvmdQ8kxqiX5vKQPRHRCcGOHluikER3HZwDmA
         RLdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9VPijHDIaBNiQBkvJTvmhgnIuQwsnXF7GMk2WovBCVkddYa2QkcpEmwG7g99ibjvsoa1sSLUhUv6vl+LqWK9b@lists.infradead.org
X-Gm-Message-State: AOJu0YyhnJa3IX9cJ84O3YDudhaf/C6XykfegJXV98wVupKfEBs2jbn1
	dGU1TIgbD2vxbyOFjfGEf33uh9tghfz9Qbz9erej218EqlV59oE/Oht+dX8fNnM=
X-Gm-Gg: ASbGnctT9JaZsg4pAVT4yP7tGasHCOSflmd8jD5xrJfmDlLj5dtU7oyz9BapQjuZmy8
	wgxON4msk2yBzvA96ve+Pg6gHADaVf/jNhAFyTLifKDOfSxfnsLGijQmnT6+W4NMcM47pp7AC8u
	0T65clqRUuVWYXvIUX0phZkXP7tSBElj2JvOkbF+IDtT6AAgB3PQxXdzMApCr/3DOPuM7pT9f2z
	Cwt9ddqeiI8TsMTcLqxHHBIl8eeCdwKWZdv4TgNSblOI17hYbjTm38G
X-Google-Smtp-Source: AGHT+IEH29RMdYlOmIr/teZDq42S20d3YAI2pbz+RQf7IWI1JVotICYgQnNFDbF65Xs29g0Y40tGeg==
X-Received: by 2002:a05:6000:402b:b0:385:faf5:ebb8 with SMTP id ffacd0b85a97d-38a7913498cmr2345876f8f.7.1736249726462;
        Tue, 07 Jan 2025 03:35:26 -0800 (PST)
Received: from pop-os.. ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1acsm50299218f8f.68.2025.01.07.03.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:35:26 -0800 (PST)
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
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 10/10] coresight: Pass guest TRFCR value to KVM
Date: Tue,  7 Jan 2025 11:32:47 +0000
Message-Id: <20250107113252.260631-11-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107113252.260631-1-james.clark@linaro.org>
References: <20250107113252.260631-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_033527_883495_8D38E4E7 
X-CRM114-Status: GOOD (  26.04  )
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



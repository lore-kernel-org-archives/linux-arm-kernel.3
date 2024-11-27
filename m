Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231ADD609C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBSQENuLPfogqNhh0dno3u0E0BaTL1Weh6wKo3FlqE4=; b=Ie+3wHsa54L0ucnrlcE7uUTz2Q
	TvfFMubqClCLe4NrbmwNTavnFUAfT817GDQGggIARGq+3W80PJGzdEUmAWIAKSPf2YfZsjdjKKAAd
	naT5WFygRLCqsWOmCv1Mx86rJTxMi10irJN2V5RV5GxHYLQiPJjErAruaI4mnPLNeUdDhT/pi4s1y
	uc7b56goTlgL5W6csWVScZvsK5DPpBi9ZU88thIY/nk246OIDKsoQSY0qM3peq1fVf2bXy3jcuedP
	4LPdffkfp0vuuNmiEucSB9k+clYoi04en028C1Xs1n30lfALj/T99HjU4rJOsQZkA/b6hiaP8IKm1
	e5XtFOyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGF0B-0000000CnJc-1SIg;
	Wed, 27 Nov 2024 10:10:31 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEsb-0000000ClsJ-0TXg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:02:42 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa52bb7beceso548243966b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732701760; x=1733306560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBSQENuLPfogqNhh0dno3u0E0BaTL1Weh6wKo3FlqE4=;
        b=GuZ8ViDvL+N6XWS0TGWRJohr+yMhzcTzh/vZHDU7ALAquspNuV3lKfaRB+3niQk9gO
         mOBKNFGce+kRlqtYhWMa31aJrZ1qXA7Yoo7NvsqwnLVk38xsmzBcDvbEYmSkqg18HKep
         OIOLG/qQRYBXJcR7osRw8q3dkZmkuQZylXwoUTzzLHkyyS3El0fvoaqdRo6OT8o6+ylu
         mzrgfEilXSJqEjyC9Q0pgfoSzoA10bExZ6vZn6/Vgv1jBxDxwDeNODsCYZvsuiPx6sO+
         j6eWnJrr4uOveFSlpcH+FKiWdQudkFms8UGxvvGvro4KHLZORS64gdjExOiaVNoYB0RM
         VBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701760; x=1733306560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBSQENuLPfogqNhh0dno3u0E0BaTL1Weh6wKo3FlqE4=;
        b=S4YNvSPchqMP8EcqVtOV1SkvADggvnmT+XxXbbU+KlZF1LhbFZoAyznu1NQ2ptX4vB
         Ll5WgkfOm1sCAp2PxqQULLRtU9yZFKx2SIkeTah2oQ0lOfKn3ZOv/9rhix2gSqLqwO/3
         tygzlX9JOtRwhm/x/rzssP5ngZM8TVKUA+tLjbpM6I7K6p+AI+CPM8hok5KzEnsrK9ja
         1Yuwf9Jpxtncpi/2P40LF5JwrQooUFT7RtRVOePcL/PM5hR6uNJtmBqhbmy7OL/+5o7s
         4FMUO1nsClh2sZqJuehiQwFQ7eDrj5suh5LVJ5sMofmmtspuZdRPBpM17b9Lv0/O693F
         rlJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5fDXUQQpfEuex4U9WgDYi4J05M/uXUBAs+bxowx6v7ub5mwF7TegAS0FEAmLGuPsdCcpZQEZWyrq2ydEPyMO+@lists.infradead.org
X-Gm-Message-State: AOJu0YzDHHc2ANzVpICjX9964SgikidxHVdngaVekVfNrXxiNZfvmqsx
	LvrUmXqUvI1JbbLCKMLfaxSvGizgkvJdWNaLWJLdiXngllOEBLjMcs/HzeGK/r8=
X-Gm-Gg: ASbGncu6zabwo9aikhgumVkTurJGpMAcydnIOajRdfJRlM1RkV7nwGsNcc9udcaG58o
	Ryxv7+0t3qQHyjJw/9s6YuliAgcycuyATPCWBqp4TqiiH5bTjwP7pdx6TktGrJAKJryNtHYhAnH
	1zw7xIgOJ+2DC4YYsLTjWwfQljGKPAZqeVn1CT7ZGqHUBTrF/kptCPb2OMrPgxgsN67gI0AQwmh
	L/6r2uWTrYCG6bhcyKjvkETnJJe6sbwI7xXDoWYSOzAkmoPzA==
X-Google-Smtp-Source: AGHT+IHqOxkrSEz0HJyXpwM0CcWfCEkT50w7pUcr6dYwlxQ8Y59TC1jt2D2TiNSkkhVgmFR8omZUGA==
X-Received: by 2002:a17:907:2858:b0:aa5:29b8:15ce with SMTP id a640c23a62f3a-aa581062cc2mr147125166b.56.1732701759774;
        Wed, 27 Nov 2024 02:02:39 -0800 (PST)
Received: from pop-os.. ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa547ffb152sm421887466b.62.2024.11.27.02.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:02:39 -0800 (PST)
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
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	James Morse <james.morse@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 8/8] coresight: Pass guest TRFCR value to KVM
Date: Wed, 27 Nov 2024 10:01:25 +0000
Message-Id: <20241127100130.1162639-9-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127100130.1162639-1-james.clark@linaro.org>
References: <20241127100130.1162639-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_020241_166560_9CA73503 
X-CRM114-Status: GOOD (  20.84  )
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

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: James Clark <james.clark@arm.com>
---
 .../coresight/coresight-etm4x-core.c          | 43 ++++++++++++++++---
 drivers/hwtracing/coresight/coresight-etm4x.h |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h  |  3 ++
 3 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 66d44a404ad0..afe56e1b9364 100644
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
@@ -271,9 +272,23 @@ static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
 	/* If the CPU doesn't support FEAT_TRF, nothing to do */
 	if (!drvdata->trfcr)
 		return;
+
+	kvm_clear_trfcr();
 	cpu_prohibit_trace();
 }
 
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
+}
+
 /*
  * etm4x_allow_trace - Allow CPU tracing in the respective ELs,
  * as configured by the drvdata->config.mode for the current
@@ -286,18 +301,28 @@ static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
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
+	kvm_set_trfcr(guest_trfcr);
 }
 
 #ifdef CONFIG_ETM4X_IMPDEF_FEATURE
@@ -655,6 +680,12 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
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
-- 
2.34.1



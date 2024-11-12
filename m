Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A982DD32D96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ypieNLjv9hoDv5n/xchGDgtSOzf0gFSsJH7dIkvwXY=; b=xezDvn+EfVHiCHQ8k6fvL3WL+B
	8ZiTzJqw7xBzlqpfFWSWlzm0dMFVMu7Ta4NVDN6LolKR0WwfL85zdOyYGd9PcVWUHF2rU1Uul4KrP
	ayTkX+u3r+nQXp2W/8DUSMNlv1pDrMgYPM0izmXPJHRStDCVdpUIaz9FRWnH0SfMdamY2xHw/Lymc
	ToTeXuaCbh70Tq83hha/sqXI+TAEnBTbOvBlzkXyoDfnaVl+PvBYx2wZGIzYDFvk7e0jj4gCz6P0X
	UTflrSVRiAxbB1MOmp1H8vj5CB8YQS2hIVFjpPmly1+OJqBPC/Hhx77iBZKfgiiRJhBttzsv/pxSz
	hPxtWU9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApGc-00000003GDW-1bGp;
	Tue, 12 Nov 2024 11:41:06 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoIi-000000034x2-1sJm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:39:13 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso5987002e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731407950; x=1732012750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ypieNLjv9hoDv5n/xchGDgtSOzf0gFSsJH7dIkvwXY=;
        b=UFQ1EFJd4zkV+MibcN13Yb5OWRVL+sOEaXoQxX+KyIVqtfV6pAPZ2JOjZ81Xrc+uUm
         ujpCItkbqP/eg2nPe4CiU890dy+TM+KbT7f1F5GODs9tW6BXUzcrToW4OlS70gR4thKB
         ErVm8ZWzYGTtpIFPGRyirHGbXZbPsNOQk2kayABw1uEd2tI8UfDvbXVcEchaLpW/8pBg
         udiPMmf7BWpuKls65gQb90ACzm4RiOu4BqLu4IrvbSm9ejSzhskCDrmPYSn5vs/piM+a
         jP3ZE6mW+9m/TWagsdz1YklCm2igI/YlOWf555Fo9xcTIFu9sKZxJMdZXdhaN2mr2FEw
         dMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407950; x=1732012750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ypieNLjv9hoDv5n/xchGDgtSOzf0gFSsJH7dIkvwXY=;
        b=cylJvEuhapnqnteEdsHvHzGtUrSFqa2SR83z80g2eaRuL5dHV4XbWhqh75IqcQt321
         vRH0EEaRXxwAE+FhbatKGoCKpWDc2IfYPPjk7YJcY1GsOwD0OMxL4FzmvcJ9ZOyJ85RD
         Bv7YvXzS0s8jwHkAdsaU1O6KAFnDbG+XnA5yJ7YrnpMaf0bj7l/7Uqkr/U/1TtuUQ//H
         b2CMzlaOURyEZI039jp3vhJsM+bnbcfXEt7Pq+9aCdklXJaDWrFfudnTIVZOL7erd33q
         crp+sM9qtrKDVUx4E+cNCDyurdmgxDcufCEEmmlWGzMZEN8gtGz1Nrm/ChrtXXwmiiEO
         89wg==
X-Forwarded-Encrypted: i=1; AJvYcCX8q3oJ8J/7AvljZRRdwmqDqBqh7AmrD9PKMe/AB5KOEX6mxaTYgR/Nb7YMd2KKD+Gq4Jh00IVbs0Nk4qLktlU5@lists.infradead.org
X-Gm-Message-State: AOJu0YxIoBzYSdJHm72DesTpwSh0iNAGBQFw1wWgjqDTh7zuAKH5Q+Au
	okX6Mz+xygHQtoAmhitA90akf6Mqllk+AoFAsO+yy2/rvx8DqSwQB1MDmtXtyRY=
X-Google-Smtp-Source: AGHT+IHSYTMPa2/VMqq86Adc2dUVIbc8G1yKZTl0omP+kqjQjHeg+DHnbhm+3rJYolYmdWgjyHudRg==
X-Received: by 2002:a05:6512:1395:b0:539:959e:f0e8 with SMTP id 2adb3069b0e04-53d862d3f7dmr8300391e87.21.1731407950470;
        Tue, 12 Nov 2024 02:39:10 -0800 (PST)
Received: from pop-os.. ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432bbf436ffsm142270955e9.44.2024.11.12.02.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:39:10 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: suzuki.poulose@arm.com,
	oliver.upton@linux.dev,
	coresight@lists.linaro.org,
	kvmarm@lists.linux.dev
Cc: James Clark <james.clark@arm.com>,
	James Clark <james.clark@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	James Morse <james.morse@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 12/12] coresight: Pass guest TRFCR value to KVM
Date: Tue, 12 Nov 2024 10:37:11 +0000
Message-Id: <20241112103717.589952-13-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112103717.589952-1-james.clark@linaro.org>
References: <20241112103717.589952-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023912_521202_07301961 
X-CRM114-Status: GOOD (  21.35  )
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
Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../coresight/coresight-etm4x-core.c          | 43 ++++++++++++++++---
 drivers/hwtracing/coresight/coresight-etm4x.h |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h  |  3 ++
 3 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 66d44a404ad0..347dea49a996 100644
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
+	kvm_set_trfcr(0, 0);
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
+	kvm_set_trfcr(trfcr, guest_trfcr);
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



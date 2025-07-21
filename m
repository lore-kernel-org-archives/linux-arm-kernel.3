Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78665C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55PgdiB+GN4B/bQE+c0k9cxCNgbWScuraMcZpMP7YeE=; b=o1wDkIRS7hOrSSPHn0QcNI9vbu
	YCmyjeko4BGPR6eCJMhNmhJkjanMirZAzin29Qdq6ZYADq2Ls9T/Xg+UqhOaMiFylUefrkKtKt2hG
	5tFLrOknQqrawVqSCldW75dv/4FtY/67NmHBpbJM4Q72TgUNl4/KZ7Zu7kMPNUOgbaYj1F8Z4PFcL
	gH3BSa94Mg3Y2ynu4Hvw3K5p25cbKApo2R1XI0dL/V+THta+75a6tlaXBOZC4gq81/ECUM/YKHscT
	rTCGG7LkfiyOavXLTWJX6EjUQHRufGNTH3+9yHJaGy2ryj4paqOe/QSvb62oa3H1B+B6b38ehxoOr
	uLIY26uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uds0W-000000001cJ-1HFo;
	Mon, 21 Jul 2025 15:00:48 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq23-0000000HIdF-21XY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:54:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so3207542f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102454; x=1753707254; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55PgdiB+GN4B/bQE+c0k9cxCNgbWScuraMcZpMP7YeE=;
        b=bfNQ3NAyT1ZomRND57daiJtMCc5PSWGyEGCq9s+1RU2enV56SWey2t8llwV4lche+i
         jUcdPV+AQPyRlCgMjtp67yO+LZMRGPKBSHsnvUI1/K9NsWXq2+BYjP4AzE16TX6qDBDU
         MrhmcQgYkynvwET6CmFOJkl5VXEMjhi9sXkxsH0Ak3NJDrTaEhR3cpBTG8BM2KAu4UL7
         K077ScqRNwcS2H+cHpcaLUrN3aE1HeQo7eYcK2cc5gVepRNGdCYMAz4iEsDQBhtDW9k1
         /K2Y1l4iNosxntXEQCvs3otrxz0ieSi+1P/9YN6eKCpcgkdMrW7uxZC8O9P/WUcTCZ9B
         KEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102454; x=1753707254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55PgdiB+GN4B/bQE+c0k9cxCNgbWScuraMcZpMP7YeE=;
        b=K+nKpgztp0s1GqZTQGlUCqalbsV+kHuniCfugZIt/A/ag15Ph44HO+6LmWBSO51685
         REaOOZc8/NxvmNqH+PPpFw4T3vHa+I7l2QYqqD7EIjsqgHouWjWZ4l4Q9gtWiuo5DaNp
         QqhYJ6rwU7fXx3jEOROnm+5W3LimW9SRupRQHynDWtnUyOREKtiKKwDtCs/PT/n2p24p
         zCm6xWXCA8bLH29Z9MbSlATxjmsaibLzDfHTthTIZALi8GnMCXvRa7YUsc3Gfb/2w3Hf
         1LKNDpdqKszasozm2Wjn39VYcbbqlaZf8TV+3ChIJEjTXWHRjXIIKOkRZyiYM8xqoIqd
         /71w==
X-Gm-Message-State: AOJu0YzIcGlybiLkhF+7Mh1+VBjLP8tAwCsZGtmiReqmll2QUSnR0za1
	SWtDLqfxVgZMYJV1IsKe/E4qKf1GJGkISRJMeDvoxsPKTVtEuM+uoHZoiRRyHD3k5z8=
X-Gm-Gg: ASbGncvPKR3T5gUW2P87uBuCwIKRXRTMCKzdxHGLtKrmINciwGctLRbypv1FAVr6qlv
	tVjWKW8N6UOHguh+X9/jGu+8eQeSFHITGQI65vjq3VAUmcfJN391pyIMvm6eHhZSHMgk00U9yfS
	5E71oKBjn8HGlTeNypQYnQ+MRXARneB+wD3J/mlLYW6/hdZfSZmkndvOq8MGdFHEcrFO+c1PXbi
	mI594KzcETnLVygdOiLQd9aPpYf98AYIAwOyAfQEaaZVfJpENJ3LtlT6OYLaoWnlbaBD/DeHLKP
	H4mGzxHXlCugDLXBjtIVC64NkcfexhlLz6WBOSFfW6X0RQeq4VeCu0UTTkujK+9LTpzXqOeTImB
	27srsoLnj4Soko5k2ht4rpXJmhBDiN24=
X-Google-Smtp-Source: AGHT+IEL8PHgJ4SopjgITysCZQMBksfX7qBSxWXMtzthfbfPyv1+5wLWmZAb1M4QE19p4pJCh7/Zmg==
X-Received: by 2002:a05:6000:402a:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3b60e50ff6amr16938260f8f.48.1753102453767;
        Mon, 21 Jul 2025 05:54:13 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:13 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 13:53:34 +0100
Subject: [PATCH v4 03/12] perf: arm_spe: Expose event filter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v4-3-0a527410f8fd@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_055415_530670_266BDDA0 
X-CRM114-Status: GOOD (  15.47  )
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

From: Leo Yan <leo.yan@arm.com>

Expose an "event_filter" entry in the caps folder to inform user space
about which events can be filtered.

Change the return type of arm_spe_pmu_cap_get() from u32 to u64 to
accommodate the added event filter entry.

Signed-off-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 051ec885318d..3e9221a22a61 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -116,6 +116,7 @@ enum arm_spe_pmu_capabilities {
 	SPE_PMU_CAP_FEAT_MAX,
 	SPE_PMU_CAP_CNT_SZ = SPE_PMU_CAP_FEAT_MAX,
 	SPE_PMU_CAP_MIN_IVAL,
+	SPE_PMU_CAP_EVENT_FILTER,
 };
 
 static int arm_spe_pmu_feat_caps[SPE_PMU_CAP_FEAT_MAX] = {
@@ -123,7 +124,7 @@ static int arm_spe_pmu_feat_caps[SPE_PMU_CAP_FEAT_MAX] = {
 	[SPE_PMU_CAP_ERND]	= SPE_PMU_FEAT_ERND,
 };
 
-static u32 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
+static u64 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
 {
 	if (cap < SPE_PMU_CAP_FEAT_MAX)
 		return !!(spe_pmu->features & arm_spe_pmu_feat_caps[cap]);
@@ -133,6 +134,8 @@ static u32 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
 		return spe_pmu->counter_sz;
 	case SPE_PMU_CAP_MIN_IVAL:
 		return spe_pmu->min_period;
+	case SPE_PMU_CAP_EVENT_FILTER:
+		return ~spe_pmu->pmsevfr_res0;
 	default:
 		WARN(1, "unknown cap %d\n", cap);
 	}
@@ -149,7 +152,19 @@ static ssize_t arm_spe_pmu_cap_show(struct device *dev,
 		container_of(attr, struct dev_ext_attribute, attr);
 	int cap = (long)ea->var;
 
-	return sysfs_emit(buf, "%u\n", arm_spe_pmu_cap_get(spe_pmu, cap));
+	return sysfs_emit(buf, "%llu\n", arm_spe_pmu_cap_get(spe_pmu, cap));
+}
+
+static ssize_t arm_spe_pmu_cap_show_hex(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct arm_spe_pmu *spe_pmu = dev_get_drvdata(dev);
+	struct dev_ext_attribute *ea =
+		container_of(attr, struct dev_ext_attribute, attr);
+	int cap = (long)ea->var;
+
+	return sysfs_emit(buf, "0x%llx\n", arm_spe_pmu_cap_get(spe_pmu, cap));
 }
 
 #define SPE_EXT_ATTR_ENTRY(_name, _func, _var)				\
@@ -159,12 +174,15 @@ static ssize_t arm_spe_pmu_cap_show(struct device *dev,
 
 #define SPE_CAP_EXT_ATTR_ENTRY(_name, _var)				\
 	SPE_EXT_ATTR_ENTRY(_name, arm_spe_pmu_cap_show, _var)
+#define SPE_CAP_EXT_ATTR_ENTRY_HEX(_name, _var)				\
+	SPE_EXT_ATTR_ENTRY(_name, arm_spe_pmu_cap_show_hex, _var)
 
 static struct attribute *arm_spe_pmu_cap_attr[] = {
 	SPE_CAP_EXT_ATTR_ENTRY(arch_inst, SPE_PMU_CAP_ARCH_INST),
 	SPE_CAP_EXT_ATTR_ENTRY(ernd, SPE_PMU_CAP_ERND),
 	SPE_CAP_EXT_ATTR_ENTRY(count_size, SPE_PMU_CAP_CNT_SZ),
 	SPE_CAP_EXT_ATTR_ENTRY(min_interval, SPE_PMU_CAP_MIN_IVAL),
+	SPE_CAP_EXT_ATTR_ENTRY_HEX(event_filter, SPE_PMU_CAP_EVENT_FILTER),
 	NULL,
 };
 

-- 
2.34.1



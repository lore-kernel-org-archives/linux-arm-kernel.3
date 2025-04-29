Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3CBC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 23:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9GFiJRsSYTyPAXrhNaWQT1b/jnx69ee7FboyvHeBQWw=; b=KCcYojtUg/qJNSlc2KJVFDid73
	gYzjBn+owSx50hmlBZxmOwWgVsV2XMyg6oOfmobAZG/KJptqhnqMeVPq7qXXfzG4uj1PQsLwqPg5j
	io7bGlZENOL4wq0bpgphNrNf9HmINIuzdYhO7BcIr6dlJYO9IcGuHRVKmUbRcyUulbKx1/Ov1OfPb
	AM4iRWunqFdF5xfvsQbkU9Dss5Qhu1nWj1KkmMU+MvUEymFb+F2BNugeLRp39hIJlKp0gbTAKYlCb
	Svdjq8xSWmA887SJxizfNHdUe09fXNnWkHIHnkItzaT7vEF+mRNUZnEk/6dNgdvF3r7eHe0viyGA5
	tC04DlaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9u2q-0000000B2Ul-2Rzh;
	Tue, 29 Apr 2025 23:07:20 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9u0u-0000000B2Fw-3YSS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 23:05:22 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b19226b5f7dso215115a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 16:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745967919; x=1746572719; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9GFiJRsSYTyPAXrhNaWQT1b/jnx69ee7FboyvHeBQWw=;
        b=AWem6hEvM0c0f3L0yXOyb69CjncK7/ELXCTbbxoTJyuASeYXFNsrvbhgNAt9xyt1u5
         4li50gW+43Tp6MN7WDocm3YmTYGpEWras/qV9NH0bclpFbhKXSFn2iKb+axDUwb+VmnC
         Mhg5Dix8iljKOpKe4BDulyJWnOLSC1sxa/qJ4aeeU43vV4wuvCiTBcM2tlfRpFQz9ZRE
         nw0mHUjOLnHJ5B7lNXtK/JFUo6FRw15Udx5HanJ9Qw64jSntgwf0x1Qfa1TSu5J5Ly0e
         sJDIrLyvbSgTYoeBCgdq0rWPbp3FiiK0f4vV8PuqWr7mL79Ir1+hnLS6rILgLOajZUvx
         pmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745967919; x=1746572719;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GFiJRsSYTyPAXrhNaWQT1b/jnx69ee7FboyvHeBQWw=;
        b=lzeefNmX4Grv8PflCigPoIUKxK7Rk88HGAo9/yBWNRSgM7Mh+OxYfgn04EMVk/DXnY
         t4Z2pyvCg6YBRs0ptCC/94/OPHEzyGMEWeDP7IjPvUVRABGNsxHaSJw4RFKVlyGm5v5B
         Jru0mCufWfTtzxaawbBWW4xQGEf66Yhn777uccc4slxGJUca1Fit30FrW9clma2+UmTo
         EOZtepRtXI7PHVWREUIhELBtcGNt7qEo8O04gmU3gOD94u4zyMGemDjsaFVDhIcxlPZR
         lJWNgHLDj3IoGzlmJkXI/n3ahYwkGtE1hy6tLnlECX+yjUMZhObJtmUB5eE/47pxFq8H
         XVSA==
X-Forwarded-Encrypted: i=1; AJvYcCXHZejj5wTD0jJ0uD6S/XWUMPNoZ92f06VLz1qmWDr5WVEwF7M9GnfZgYii/ERISVEdWWLEbtqF4JoETQBUYbS1@lists.infradead.org
X-Gm-Message-State: AOJu0YyrtOwPtWtGUvFqL7DE8oZzqdSlm3V3ip9WRoZFui11rMidn4Iq
	1Ss4WCE0ZzmLfKEFJW5pT5h009nUKcnQXXCQ3hMHYhKA2KvBzTix+FrX/FVlIsg7bEx0Y90iR9L
	h
X-Google-Smtp-Source: AGHT+IE0PWA7WS7Lu00x6+TazDT2LPv2nCnsOi9/Lrjv+V/EJAq9DaNIm6TCSJBFMF+6b3GjArs3Y5cEKfA=
X-Received: from pgba24.prod.google.com ([2002:a63:4d18:0:b0:aee:900e:e3d6])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:439f:b0:1ee:c830:abdc
 with SMTP id adf61e73a8af0-20a90c09495mr788906637.15.1745967918935; Tue, 29
 Apr 2025 16:05:18 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:05:15 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250429230515.1906253-1-yabinc@google.com>
Subject: [PATCH v2] coresight: trbe: Save/restore state across CPU low power state
From: Yabin Cui <yabinc@google.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Leo Yan <leo.yan@arm.com>, Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_160520_887566_A0E7ACED 
X-CRM114-Status: GOOD (  22.00  )
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

Similar to ETE, TRBE may lose its context when a CPU enters low
power state. To make things worse, if ETE is restored without
TRBE being restored, we have an enabled source device with no
enabled sink devices, which can cause CPU hang on some devices
(Pixel 9).

This patch adds sink operations to save and restore state for TRBE,
and calls them when saving and restoring state for ETE. This is
to ensure that we always restore the state of TRBE before ETE.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
 .../coresight/coresight-etm4x-core.c          | 13 ++++-
 drivers/hwtracing/coresight/coresight-trbe.c  | 58 +++++++++++++++++++
 include/linux/coresight.h                     |  6 ++
 3 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2b8f10463840..aaabbda97afc 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1863,6 +1863,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
 	int ret = 0;
+	struct coresight_device *sink;
 
 	/* Save the TRFCR irrespective of whether the ETM is ON */
 	if (drvdata->trfcr)
@@ -1871,8 +1872,14 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	 * Save and restore the ETM Trace registers only if
 	 * the ETM is active.
 	 */
-	if (coresight_get_mode(drvdata->csdev) && drvdata->save_state)
+	if (coresight_get_mode(drvdata->csdev) && drvdata->save_state) {
 		ret = __etm4_cpu_save(drvdata);
+		if (ret == 0) {
+			sink = coresight_get_percpu_sink(drvdata->cpu);
+			if (sink && sink_ops(sink)->percpu_save)
+				sink_ops(sink)->percpu_save(sink);
+		}
+	}
 	return ret;
 }
 
@@ -1977,6 +1984,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 
 static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 {
+	struct coresight_device *sink = coresight_get_percpu_sink(drvdata->cpu);
+
+	if (sink && sink_ops(sink)->percpu_restore)
+		sink_ops(sink)->percpu_restore(sink);
 	if (drvdata->trfcr)
 		write_trfcr(drvdata->save_trfcr);
 	if (drvdata->state_needs_restore)
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index fff67aac8418..d94d1a7a2330 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -115,6 +115,20 @@ static int trbe_errata_cpucaps[] = {
  */
 #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES	256
 
+/*
+ * struct trbe_save_state: Register values representing TRBE state
+ * @trblimitr	- Trace Buffer Limit Address Register value
+ * @trbbaser	- Trace Buffer Base Register value
+ * @trbptr	- Trace Buffer Write Pointer Register value
+ * @trbsr	- Trace Buffer Status Register value
+ */
+struct trbe_save_state {
+	u64 trblimitr;
+	u64 trbbaser;
+	u64 trbptr;
+	u64 trbsr;
+};
+
 /*
  * struct trbe_cpudata: TRBE instance specific data
  * @trbe_flag		- TRBE dirty/access flag support
@@ -123,6 +137,8 @@ static int trbe_errata_cpucaps[] = {
  * @cpu			- CPU this TRBE belongs to.
  * @mode		- Mode of current operation. (perf/disabled)
  * @drvdata		- TRBE specific drvdata
+ * @state_needs_restore	- Whether TRBE state has been saved and can be restored
+ * @save_state		- Saved TRBE state
  * @errata		- Bit map for the errata on this TRBE.
  */
 struct trbe_cpudata {
@@ -133,6 +149,8 @@ struct trbe_cpudata {
 	enum cs_mode mode;
 	struct trbe_buf *buf;
 	struct trbe_drvdata *drvdata;
+	bool state_needs_restore;
+	struct trbe_save_state save_state;
 	DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
 };
 
@@ -1187,12 +1205,51 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static void arm_trbe_cpu_save(struct coresight_device *csdev)
+{
+	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
+	struct trbe_save_state *state;
+
+	if (cpudata->mode == CS_MODE_DISABLED)
+		return;
+
+	state = &cpudata->save_state;
+	state->trbbaser = read_sysreg_s(SYS_TRBBASER_EL1);
+	state->trbptr = read_sysreg_s(SYS_TRBPTR_EL1);
+	state->trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
+	state->trbsr = read_sysreg_s(SYS_TRBSR_EL1);
+	cpudata->state_needs_restore = true;
+}
+
+static void arm_trbe_cpu_restore(struct coresight_device *csdev)
+{
+	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
+	struct trbe_save_state *state;
+
+	if (cpudata->state_needs_restore) {
+		/*
+		 * To avoid disruption of normal tracing, restore trace
+		 * registers only when TRBE lost power (TRBLIMITR == 0).
+		 */
+		if (read_sysreg_s(SYS_TRBLIMITR_EL1) == 0) {
+			state = &cpudata->save_state;
+			write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1);
+			write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
+			write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
+			set_trbe_enabled(cpudata, state->trblimitr);
+		}
+		cpudata->state_needs_restore = false;
+	}
+}
+
 static const struct coresight_ops_sink arm_trbe_sink_ops = {
 	.enable		= arm_trbe_enable,
 	.disable	= arm_trbe_disable,
 	.alloc_buffer	= arm_trbe_alloc_buffer,
 	.free_buffer	= arm_trbe_free_buffer,
 	.update_buffer	= arm_trbe_update_buffer,
+	.percpu_save	= arm_trbe_cpu_save,
+	.percpu_restore	= arm_trbe_cpu_restore,
 };
 
 static const struct coresight_ops arm_trbe_cs_ops = {
@@ -1358,6 +1415,7 @@ static void arm_trbe_probe_cpu(void *info)
 	cpudata->trbe_flag = get_trbe_flag_update(trbidr);
 	cpudata->cpu = cpu;
 	cpudata->drvdata = drvdata;
+	cpudata->state_needs_restore = false;
 	return;
 cpu_clear:
 	cpumask_clear_cpu(cpu, &drvdata->supported_cpus);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index cfcf6e4707ed..098c04c4a59d 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -362,6 +362,10 @@ enum cs_mode {
  * @alloc_buffer:	initialises perf's ring buffer for trace collection.
  * @free_buffer:	release memory allocated in @get_config.
  * @update_buffer:	update buffer pointers after a trace session.
+ * @percpu_save:	saves state when CPU enters idle state.
+ *			Only set for percpu sink.
+ * @percpu_restore:	restores state when CPU exits idle state.
+ *			only set for percpu sink.
  */
 struct coresight_ops_sink {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
@@ -374,6 +378,8 @@ struct coresight_ops_sink {
 	unsigned long (*update_buffer)(struct coresight_device *csdev,
 			      struct perf_output_handle *handle,
 			      void *sink_config);
+	void (*percpu_save)(struct coresight_device *csdev);
+	void (*percpu_restore)(struct coresight_device *csdev);
 };
 
 /**
-- 
2.49.0.967.g6a0df3ecc3-goog



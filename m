Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD9EC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 23:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B5OuSnRYmxjKGp/xme4xK/kJBvItahOTY4ca9GtiV/U=; b=0XPRyrfmFE4ZxkhqSiSSdg/5cW
	261UEwid1WG4y9yMhzWk94P2fvwG9ajN47o0d40pL4HHqf0gF6OQEfbxtiIzCciCZK1ulYHZnw6/m
	/fMhJ7kmJfF7fOQlxyU6GWeqUxu1EWSXNARityc+JIruHPeuFW+P/m56Zm7b2zt79EC25sRaCi2cL
	NrvM4/4+u0mgHF9/Zawgclxn2kq77wqwW6NoMudLDR8S44pxIQAXt6sMnPg9tNFbdXGZlEB2OnBl3
	Wx/un/gG5WE4jIKolaoFdOC8LTFtCFXax6rKngccjEV/uR8E3g5vgEDq15qNcIDDwLhb/5D02ducC
	Uk11A09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7j8E-0000000CEzY-0L8r;
	Wed, 23 Apr 2025 23:03:54 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7j5G-0000000CEom-2Nar
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 23:00:51 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-73dff14aa55so234408b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 16:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745449249; x=1746054049; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B5OuSnRYmxjKGp/xme4xK/kJBvItahOTY4ca9GtiV/U=;
        b=WDSZ1ZMdGjjKWbStWjVzAif32ZbjpEIa+gx2EzNmrBLqZ7iwL5xzwbs8pBCsGbSLVF
         d8EGQF3tULPuU0UcD8v1f1h27NWg8iDx6i9hpzwXbUoCK6TFgdfgBmmgcoEUkpMet2Hv
         zgr1OoniQBkOrA3L4RgCEQrg8Y813vbDWTebtJSjnObSsMYb8THPi9x7+vOoRC9cGg/x
         hHks8WpRFvcQQZpe8awyusWTuwt4/prakhrclGq7UOQBUkMqpzRIGDj2RV9t4QBb0R6r
         6YHknA3Hmz/ktcWPPbpWwUZQknb1T2Zgv/RfMGBv0qv0iC5i6DRpkpuFr1gAYOKYUmDx
         OJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745449249; x=1746054049;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5OuSnRYmxjKGp/xme4xK/kJBvItahOTY4ca9GtiV/U=;
        b=EIpnddovUlJ5gL/tpVdsFqvfAniXDXmyZha7vcGXldez2YG/B8Y3ojIEh2/RBA+ITz
         SVrymay3C3/inF3VE3QHHmaeXFFKdIdwKMVVPHLf4W6ArIijMR/Mnck95/EW36GdSRoO
         izfgQALlOc4Oqo7o7rabrP/XfAv5EaCwxzCiDP9efcEZlB1akFqkRUJgkweVBpPLPq0h
         N6tLG5V7uJglOCWwfcd+lSmrd/uA+UkcfsG2HHP9d5b57DEl+/Cu/nVfn0NLzLWWwUqT
         nCBNJkEoI5BtMrWZR9mXzD3/tj4OYZykBCJPlWsFF/R6pGpHOSdihbuK5PbWNyUYnFPz
         dZtg==
X-Forwarded-Encrypted: i=1; AJvYcCUs3cXtCjDNUzKLGyy/QiHs6yCuaoOaiCxL7KPYGkIrS87c2/CDtz6DL5FirxJowQINm7ONoWk0wxZh9Joex5p4@lists.infradead.org
X-Gm-Message-State: AOJu0YzmNc4vXy5C1wRdY+KaKu34ibO3ZIzL90ZqA+nDyqy5/owZdGGu
	00YrGCnh74EzLH12eio9qIgBBqGCo2Kju0vo588JyUDz2pfaCE4qTqi+7I7Co/F07LP5sC2yFJK
	j
X-Google-Smtp-Source: AGHT+IErwK2DT1KoeJM4yorZNa4fi9TPavX8qddUeghqZq9oScAgB1pOM+1uuM5QkwJ1g/JwW/wt1CJLkK8=
X-Received: from pgzz2.prod.google.com ([2002:a63:3302:0:b0:af0:e359:c50a])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:181a:b0:1f5:80a3:b006
 with SMTP id adf61e73a8af0-20444ebe0aamr449684637.21.1745449249463; Wed, 23
 Apr 2025 16:00:49 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:00:46 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250423230046.1134389-1-yabinc@google.com>
Subject: [PATCH] coresight: trbe: Save/restore state across CPU low power state
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_160050_610072_3195D69F 
X-CRM114-Status: GOOD (  21.49  )
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
power state. To make things worse, if ETE state is restored without
restoring TRBE state, it can lead to a stuck CPU due to an enabled
source device with no enabled sink devices.

This patch introduces support for "arm,coresight-loses-context-with-cpu"
in the TRBE driver. When present, TRBE registers are saved before
and restored after CPU low power state. To prevent CPU hangs, TRBE
state is always saved after ETE state and restored after ETE state.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
 .../coresight/coresight-etm4x-core.c          | 13 ++++-
 drivers/hwtracing/coresight/coresight-trbe.c  | 53 +++++++++++++++++++
 include/linux/coresight.h                     |  6 +++
 3 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index e5972f16abff..1bbaa1249206 100644
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
index fff67aac8418..38bf46951a82 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -115,6 +115,13 @@ static int trbe_errata_cpucaps[] = {
  */
 #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES	256
 
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
@@ -123,6 +130,9 @@ static int trbe_errata_cpucaps[] = {
  * @cpu			- CPU this TRBE belongs to.
  * @mode		- Mode of current operation. (perf/disabled)
  * @drvdata		- TRBE specific drvdata
+ * @state_needs_save	- Need to save trace registers when entering cpu idle
+ * @state_needs_restore	- Need to restore trace registers when exiting cpu idle
+ * @save_state		- Saved trace registers
  * @errata		- Bit map for the errata on this TRBE.
  */
 struct trbe_cpudata {
@@ -133,6 +143,9 @@ struct trbe_cpudata {
 	enum cs_mode mode;
 	struct trbe_buf *buf;
 	struct trbe_drvdata *drvdata;
+	bool state_needs_save;
+	bool state_needs_restore;
+	struct trbe_save_state save_state;
 	DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
 };
 
@@ -1187,12 +1200,49 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static void arm_trbe_cpu_save(struct coresight_device *csdev)
+{
+	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
+	struct trbe_save_state *state = &cpudata->save_state;
+
+	if (cpudata->mode == CS_MODE_DISABLED || !cpudata->state_needs_save)
+		return;
+
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
+	struct trbe_save_state *state = &cpudata->save_state;
+
+	if (cpudata->state_needs_restore) {
+		/*
+		 * To avoid disruption of normal tracing, restore trace
+		 * registers only when TRBE lost power (TRBLIMITR == 0).
+		 */
+		if (read_sysreg_s(SYS_TRBLIMITR_EL1) == 0) {
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
@@ -1358,6 +1408,9 @@ static void arm_trbe_probe_cpu(void *info)
 	cpudata->trbe_flag = get_trbe_flag_update(trbidr);
 	cpudata->cpu = cpu;
 	cpudata->drvdata = drvdata;
+	cpudata->state_needs_save = coresight_loses_context_with_cpu(
+		&drvdata->pdev->dev);
+	cpudata->state_needs_restore = false;
 	return;
 cpu_clear:
 	cpumask_clear_cpu(cpu, &drvdata->supported_cpus);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d79a242b271d..fec375d02535 100644
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
2.49.0.901.g37484f566f-goog



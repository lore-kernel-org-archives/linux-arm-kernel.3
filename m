Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1B1C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdFUB2zH6KQ2jS1Qeu0n7oVNGn5pzmET1AhmT2Fra+g=; b=w27KzhtGFbO1KigRdQfyr0e+wD
	Bm6lGMakt+6mP40byphhW4nB3tFvvTUn3llOA5fVvD8H0vIShjwG+tAiflxvj9zz5dz81IRUY9cC5
	Z6z/2HIxplrpAvTOLG6w+F2j1bqKO2sYe1as9CmrPkXpsHiu6eKVo3+SYWPWHmRnd0mkE8NV2n8He
	PN71u0+GCfUYXVyut2gSm3lRZNCvdAARJ4KuWxXLT17JSw2bAzWG9rK2PyCtjdtJGxDTf9WnsSO8g
	nUhQZRBDRcwvqT8VRG5mac70z9UpvdGK5Cco/UivCX5TbOEBpNTd+X/n2zX6JEJ72hCR2EBbXVsvI
	XjlBMR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrd8b-000000048Kg-0joF;
	Wed, 05 Aug 2026 15:02:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrd8W-000000048Hh-20dr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:02:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49548e01d02so6195235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785942146; x=1786546946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdFUB2zH6KQ2jS1Qeu0n7oVNGn5pzmET1AhmT2Fra+g=;
        b=TMkM+xYnS4bWNxvqj9TW435TYYnr1UMay3oGYQ1PYI8P7rdoXLMnVYHTzUX6qP+JMT
         BK0CskUqmZRRSlppRPnCsNpzqJefWOXvtYMfWQpW6T1CG73zubPxvvD/e+1eLzoBGUmm
         VCZkOaMNdTqfw5UjliUS4dnU5fpgw2d1ZDrbkXJOGtyTfJ7u+OQnPtCx4DSVo3iiO93G
         f4NfFPrZ/dql0zJ2zpfDbOE/7e346iSBZZmTm2znyCsB4XdYMhwd/GXZ30wRRGd+i6AD
         o8/BHg0rVP1ZouOqgYVHu3ypVmZ+LiHP8nCj6BJqqnG+S1jAuLiBlg/frfF8+kqH/08l
         zEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785942146; x=1786546946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdFUB2zH6KQ2jS1Qeu0n7oVNGn5pzmET1AhmT2Fra+g=;
        b=Hinek3oUvsrv00Ghwob6+XPu/4BMj3ocLhmqYZlQX1Sr6FJQ3qJl8mpdHpXkse/ob+
         1abMgHcXiLHC9lqgk0bncqW6OmJHqrC3dnFSkGd+xchY0w8OURQ4IP6g2yMA4zYxZviR
         gVQvMYLb9BavbF8/E9sgJhD7TBHQPkVKYrR2164mY6w2QfoXOhO0xhrsaj/HyE28CGXO
         /cSmGweU8NdW98Yejb8pE8nr6CnzNO9oKYaTGHcCJuiUxI3GE8NFQQCJDMW2dCsA8iZB
         ZFKIx42rxXFhtOCxZVAJq4lYB+rI9hWeaUABXQCmrynoZCRTUsPTwpML66XJlv2Sdkrn
         ctWg==
X-Gm-Message-State: AOJu0YyCR6lzFkqZmQqfZ2Kjz3anCXCA1H1f+99VtflVStMWDyFVco3T
	m76D7lZIJVPJdR+5+JOfyhPoqI7qZcuCbV3Lpk4vol396iyMqSjo0yh/z0ZbGAyeXjE=
X-Gm-Gg: AR+sD11Lt7DvZ9NWpVbgxvl32rAoQgqBgGcV8Rl92jFzLwVuyUPsHQT0jp2fXADbDjL
	SXCiM8MmiWlI4Fwe7xEHdGaCxPL0/oFH6xxDXO46dZbs9U9eeAEU7eK2LlWd5HTBWmXjQ1WCA/H
	bBHlbbLysiyahZnOaSsyJ1zJ++vAI8m+G/GXtnNV/kqJnyiXDUwhZKxlXRq1Km38w3Ga+srSdV8
	y8graZUL7dp9zSVV6hpAJjGmB4yO1AQtv22fjDJKH2hG5ZZ9mQObAeX+TxiwhIZHdSDL5DcOMTI
	UekZA109sN70NEi9hXDgWYZtxdcBUobiLywZXkeISe8ue3mgr3q4F1OvNSXlwvKX2/1xM2evfyR
	sZLifPuTeNmt/7XmV9PnZxcUIkFF+sjHSn1Lh/1ErKy6mKrNhu4ZmHamRY4hpo5AlOX2zZPjFwD
	6ll/Ooxq2AC09BjKlo+iaOeiGBm29hYjUiGLMdKf/ukjeu17Fa4we5nSRcENFdOULpPNatrUZBv
	b4=
X-Received: by 2002:a05:600d:4448:20b0:495:5e3d:15e1 with SMTP id 5b1f17b1804b1-4994e7d21fdmr85868895e9.16.1785942146401;
        Wed, 05 Aug 2026 08:02:26 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23ede6sm10308695f8f.30.2026.08.05.08.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:02:25 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 05 Aug 2026 16:01:51 +0100
Subject: [PATCH 1/3] perf: arm_spe: Factor aux output and flags out of
 buffer fault handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-james-spe-software-discard-v1-1-0ff0e44c4c92@linaro.org>
References: <20260805-james-spe-software-discard-v1-0-0ff0e44c4c92@linaro.org>
In-Reply-To: <20260805-james-spe-software-discard-v1-0-0ff0e44c4c92@linaro.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
 Al Grant <Al.Grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_080228_629938_04BEFA74 
X-CRM114-Status: GOOD (  20.93  )
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

Software discard mode will still want to handle buffer faults, but
doesn't have a real aux buffer to set flags or call
perf_aux_output_end() on. Factor the aux buffer parts out of
arm_spe_pmu_buf_get_fault_act() so it only decodes the fault, which
better matches the name and can be used by the new mode later.

This makes the arm_spe_pmu_stop() handling a bit simpler because it
doesn't need to conditionally call arm_spe_perf_aux_output_end() anymore
to handle the case when the fault handler didn't do it.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index dbd0da111639..10d28ad81256 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -677,11 +677,12 @@ static void arm_spe_pmu_disable_and_drain_local(void)
 
 /* IRQ handling */
 static enum arm_spe_pmu_buf_fault_action
-arm_spe_pmu_buf_get_fault_act(struct perf_output_handle *handle)
+arm_spe_pmu_buf_get_fault_act(u64 *aux_flags)
 {
 	const char *err_str;
 	u64 pmbsr;
-	enum arm_spe_pmu_buf_fault_action ret;
+
+	*aux_flags = 0;
 
 	/*
 	 * Ensure new profiling data is visible to the CPU and any external
@@ -703,12 +704,11 @@ arm_spe_pmu_buf_get_fault_act(struct perf_output_handle *handle)
 	 * flag to indicate that the last record is corrupted.
 	 */
 	if (FIELD_GET(PMBSR_EL1_DL, pmbsr))
-		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED |
-					     PERF_AUX_FLAG_PARTIAL);
+		*aux_flags |= PERF_AUX_FLAG_TRUNCATED | PERF_AUX_FLAG_PARTIAL;
 
 	/* Report collisions to userspace so that it can up the period */
 	if (FIELD_GET(PMBSR_EL1_COLL, pmbsr))
-		perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
+		*aux_flags |= PERF_AUX_FLAG_COLLISION;
 
 	/* We only expect buffer management events */
 	switch (FIELD_GET(PMBSR_EL1_EC, pmbsr)) {
@@ -727,8 +727,7 @@ arm_spe_pmu_buf_get_fault_act(struct perf_output_handle *handle)
 	/* Buffer management event */
 	switch (FIELD_GET(PMBSR_EL1_BUF_BSC_MASK, pmbsr)) {
 	case PMBSR_EL1_BUF_BSC_FULL:
-		ret = SPE_PMU_BUF_FAULT_ACT_OK;
-		goto out_stop;
+		return SPE_PMU_BUF_FAULT_ACT_OK;
 	default:
 		err_str = "Unknown buffer status code";
 	}
@@ -738,11 +737,7 @@ arm_spe_pmu_buf_get_fault_act(struct perf_output_handle *handle)
 			   err_str, smp_processor_id(), pmbsr,
 			   read_sysreg_s(SYS_PMBPTR_EL1),
 			   read_sysreg_s(SYS_PMBLIMITR_EL1));
-	ret = SPE_PMU_BUF_FAULT_ACT_FATAL;
-
-out_stop:
-	arm_spe_perf_aux_output_end(handle);
-	return ret;
+	return SPE_PMU_BUF_FAULT_ACT_FATAL;
 }
 
 static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
@@ -750,14 +745,18 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
 	struct perf_output_handle *handle = dev;
 	struct perf_event *event = handle->event;
 	enum arm_spe_pmu_buf_fault_action act;
+	u64 aux_flags;
 
 	if (!perf_get_aux(handle))
 		return IRQ_NONE;
 
-	act = arm_spe_pmu_buf_get_fault_act(handle);
+	act = arm_spe_pmu_buf_get_fault_act(&aux_flags);
 	if (act == SPE_PMU_BUF_FAULT_ACT_SPURIOUS)
 		return IRQ_NONE;
 
+	perf_aux_output_flag(handle, aux_flags);
+	arm_spe_perf_aux_output_end(handle);
+
 	/*
 	 * Ensure perf callbacks have completed, which may disable the
 	 * profiling buffer in response to a TRUNCATION flag.
@@ -927,6 +926,7 @@ static void arm_spe_pmu_stop(struct perf_event *event, int flags)
 	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 	struct perf_output_handle *handle = this_cpu_ptr(spe_pmu->handle);
+	u64 aux_flags;
 
 	/* If we're already stopped, then nothing to do */
 	if (hwc->state & PERF_HES_STOPPED)
@@ -944,10 +944,12 @@ static void arm_spe_pmu_stop(struct perf_event *event, int flags)
 		if (perf_get_aux(handle)) {
 			enum arm_spe_pmu_buf_fault_action act;
 
-			act = arm_spe_pmu_buf_get_fault_act(handle);
-			if (act == SPE_PMU_BUF_FAULT_ACT_SPURIOUS)
-				arm_spe_perf_aux_output_end(handle);
-			else
+			act = arm_spe_pmu_buf_get_fault_act(&aux_flags);
+			perf_aux_output_flag(handle, aux_flags);
+			arm_spe_perf_aux_output_end(handle);
+
+			/* Assume PMBSR only needs clearing for real faults */
+			if (act != SPE_PMU_BUF_FAULT_ACT_SPURIOUS)
 				write_sysreg_s(0, SYS_PMBSR_EL1);
 		}
 

-- 
2.43.0



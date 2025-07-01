Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56312C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrLv8E2JzJaKuEQhctmJvd3DUiMTxFOf1wZ25rSjEVo=; b=b4HWCc8mlATM/cVsWEXmbTnBxK
	dUCUZ+XxOMwzsRzRAxuBkWze+wXa9X+FFnaunX3fVR3/EEokFOpO6ibzHs8J9wdsc/974yTDOjDS9
	MzXb0G3VV6brddZ4tLj7TtYYFPs3EIBGQI5K1EHrz3Uet+zDQKuadzK2T+9Mrc8M8K5xW30bYyPTr
	n+Dv3w3fF0nQ4mPQiz5B84zyd0dKF9jihbBgRwpA2lf+5gcUdmctHvDVdPmQ1AJImaTxDfIzRNVH7
	rHxLVwIPGUflSrOGkbozlUorGTgAa1dIfFVb9RCHlodXgq2PsrlwSV9ipuzRsXh3O0w64FOnE2CK8
	YpHogzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWflK-00000006KmF-2EaN;
	Tue, 01 Jul 2025 18:31:22 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcyk-00000005ttS-0yte
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 15:33:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so2941618f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751383980; x=1751988780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrLv8E2JzJaKuEQhctmJvd3DUiMTxFOf1wZ25rSjEVo=;
        b=ShAXN9KVgWtL4ZoDmGGVuW8H5mQa6Oe6ytUfeybBG11iwadbNlYiKXsgNla0/ai+oo
         o6isS19qhAoFSjjHsSJkd6eRkUB8/WxY//pcbt/rUkD9FNe9GpMZybTYj0h1+1gLOuBk
         wdD4XRnobo9jdZVfMotUx3MftOhlPGS3dvYTbmROINEsEOpQgsWcRfdZqlsod+LMAnh4
         zX7e2FiLuze2NN+E+1lOtSpeeyOvnp+lPwoT0fUkmaYNIo5Xq3kL1bd4cV3DaRbv0WL8
         Z7MCxpu/NwgBmD3X7BKlvza9aNVomsYbxnvWafqjq7sXXViMqMsTXjUZK7CilkM28omD
         AAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383980; x=1751988780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrLv8E2JzJaKuEQhctmJvd3DUiMTxFOf1wZ25rSjEVo=;
        b=YfqtL1qL+EWHaA4RPEvw/VwFIvZQGA9NYhrVb2cS6W8pXuFhlxtPFBP5M8RDLtLrXi
         UMIU++uAoklVQy28cppsJ2T50msVeLNDnDEeqEHJgbtUF19YXJ7JOK8IPhdE4XkN1kGX
         OBBPTsW2bAqvmDqNx+8pxjyStMsczavpomnSlDLYMLHPgKjwqsHBGLWLXcjMKhsJKBtZ
         HTby0jPqcXb7bk5YIO1t1iTJDscNkDf3VtwCJpcJy8GIw2sv2/SEoQdGq6hMYZRy8ebb
         c3hSoWYT8PIf2GGaBV8LIx/eVuMS3LE5jZ9GVwHNaLWZKzm96VyMURQThotUQOIGloPP
         Lo+g==
X-Gm-Message-State: AOJu0YyUL6DpzxR6RU50lamAaQP8mNdHpJh2jESBtn8J8kn6X931B+eK
	w91PZv6igmGARY4VMMc8YLjYMMSd3MpbSVJ/FmM4uCJWOF6if9io0H1H6Nei/LDnkDU=
X-Gm-Gg: ASbGnctvUlxJdfkwmMr+Qm78WIo75ZtmewAtmldQI/8Ur3ArK/Glo5gOJ6/5cmJaBID
	nZbzZ+m8NqujwL1MQiDF1nfNX/Y6GmJ8tjbzbxk/x0pVjqjg4/xpdbUjq3pgZ18h1gaOx1AMITG
	nujIuSTnUEur4U5youxOI28fP2oXA6A42eEoD53+IGUt6sLbRelG4kY4h8nPYdPJDAI4xphnB8a
	8Ep9KkU0/bPCQTHFVHSydnyb7Esb8tucmwQOm+pVCydgKkc8Y6MbzNVOSMbvzaU/N+PCNicMwOt
	x0VZLxys/jVuj39BG/t84HpcyCCfAVhqvwDi45lsh/Pa2GTSvRcDI9WnzR8/qAjco8TaoX2wAnB
	mpWmErQ==
X-Google-Smtp-Source: AGHT+IGhfDvVLxXK0g4NeIbM0C+Rf8R4M1m1N7M8/7K4QfeNkwE1w4jj6lEbfgM0B+KT2OK6Dd4PJA==
X-Received: by 2002:adf:9dce:0:b0:3a4:d6ed:8e00 with SMTP id ffacd0b85a97d-3a8fdeffa19mr14766121f8f.33.1751383980385;
        Tue, 01 Jul 2025 08:33:00 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b5a3sm13435002f8f.40.2025.07.01.08.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:33:00 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 01 Jul 2025 16:31:58 +0100
Subject: [PATCH 2/3] perf: arm_spe: Disable buffer before writing to
 PMBPTR_EL1 or PMBSR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
In-Reply-To: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Alexandru Elisei <Alexandru.Elisei@arm.com>, 
 Anshuman Khandual <Anshuman.Khandual@arm.com>, 
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
 Robin Murphy <Robin.Murphy@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_083302_290927_D2E96047 
X-CRM114-Status: GOOD (  20.19  )
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

DEN0154 states that writes to PMBPTR_EL1 or PMBSR_EL1 must be done while
the buffer is disabled (PMBLIMITR_EL1.E == 0). Re-arrange the interrupt
handler to always disable the buffer for non-spurious interrupts before
doing either.

Most of arm_spe_pmu_disable_and_drain_local() is now always done, so for
faults the only thing left to do is clear PMSCR_EL1.

Elaborate the comment in arm_spe_pmu_disable_and_drain_local() to
explain the ramifications of not doing it in the right order.

Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 6235ca7ecd48..5829947c8871 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -559,7 +559,12 @@ static void arm_spe_perf_aux_output_end(struct perf_output_handle *handle)
 
 static void arm_spe_pmu_disable_and_drain_local(void)
 {
-	/* Disable profiling at EL0 and EL1 */
+	/*
+	 * To prevent the CONSTRAINED UNPREDICTABLE behavior of either writing
+	 * to memory after the buffer is disabled, or SPE reporting an access
+	 * not allowed event, we must disable sampling before draining the
+	 * buffer.
+	 */
 	write_sysreg_s(0, SYS_PMSCR_EL1);
 	isb();
 
@@ -661,16 +666,24 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
 	 */
 	irq_work_run();
 
+	/*
+	 * arm_spe_pmu_buf_get_fault_act() already drained, and PMBSR_EL1.S == 1
+	 * means that StatisticalProfilingEnabled() == false. So now we can
+	 * safely disable the buffer.
+	 */
+	write_sysreg_s(0, SYS_PMBLIMITR_EL1);
+	isb();
+
+	/* Status can be cleared now that PMBLIMITR_EL1.E == 0 */
+	write_sysreg_s(0, SYS_PMBSR_EL1);
+
 	switch (act) {
 	case SPE_PMU_BUF_FAULT_ACT_FATAL:
 		/*
-		 * If a fatal exception occurred then leaving the profiling
-		 * buffer enabled is a recipe waiting to happen. Since
-		 * fatal faults don't always imply truncation, make sure
-		 * that the profiling buffer is disabled explicitly before
-		 * clearing the syndrome register.
+		 * To complete the full disable sequence, also disable profiling
+		 * at EL0 and EL1, we don't want to continue at all anymore.
 		 */
-		arm_spe_pmu_disable_and_drain_local();
+		write_sysreg_s(0, SYS_PMSCR_EL1);
 		break;
 	case SPE_PMU_BUF_FAULT_ACT_OK:
 		/*
@@ -679,18 +692,14 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
 		 * PMBPTR might be misaligned, but we'll burn that bridge
 		 * when we get to it.
 		 */
-		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)) {
+		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED))
 			arm_spe_perf_aux_output_begin(handle, event);
-			isb();
-		}
 		break;
 	case SPE_PMU_BUF_FAULT_ACT_SPURIOUS:
 		/* We've seen you before, but GCC has the memory of a sieve. */
 		break;
 	}
 
-	/* The buffer pointers are now sane, so resume profiling. */
-	write_sysreg_s(0, SYS_PMBSR_EL1);
 	return IRQ_HANDLED;
 }
 

-- 
2.34.1



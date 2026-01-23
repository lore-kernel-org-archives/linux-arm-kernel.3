Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E10D74EF8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HRaAyzpQLD9z0tMt/n74ydmpLXpoLNEfmnc5Kofzl7k=; b=uLllaHhpyL2orB3xILPHsCT1v0
	8HoQrKfVb0m0ezllr4nUp0p/FTQCumyHRjwCOWlH1pZBzakWhFRv2kduFX4UFLZ4d1XM2KGyeu0zF
	Dv25xRO8BimFmzl4fP7wgZvGDO+OHAf2+E/IXbF2nqDlwDXex+r7Odxox3I3NeesqCf+O3sNNzpcO
	7uI6H9/ThQnTaGlnO9eNy9ucgITkpMA+5ApLFgvdUisYA+pvTySGVXdF7gxO5H0Vl2tVPgANm3sME
	xxM0h3Zd3su+IR5dCIe62GRljsbYMhqM37EWfxAEi/J9G2ohjv72ABAziLv5Z2VkDhtEoVxnORuKZ
	cLAiifaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJe1-000000098s0-24Kx;
	Fri, 23 Jan 2026 16:04:21 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJdy-000000098re-0kBu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:04:19 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso24102735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 08:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769184256; x=1769789056; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HRaAyzpQLD9z0tMt/n74ydmpLXpoLNEfmnc5Kofzl7k=;
        b=pScLfRR4029VNt6bFh6mh2ghlUpF4I0er7xqjkhgyjEdJBba23CHRPIdF8wQKgY0YF
         Ql0HtYePT2PSVBL3LCZmAWiOeLSjZkXvBJm3O8qmpmIK4inQv1uAJX1sYYUw5Lzz0jyx
         wLgVtv48ENGYMW8GM9WQlCITmzGgyZ37leb15hkrB8Xp50yYPswQNbi7MVwP493pP8vt
         Z90pnEL0QMdT39eGJlaZZHqMC80GYLiaFXJ2m8hwAgtaUbJc5hlBH5mfphzlTXIEUiRi
         cT4gMaJtQpM1H3lvcHn61fdpun4+h0UNc4MNnaI0fmaTFhrH+PW4tAiCp7Q6uMpJ+aTc
         LLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769184256; x=1769789056;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRaAyzpQLD9z0tMt/n74ydmpLXpoLNEfmnc5Kofzl7k=;
        b=Fi5rjeVJqS6jh/JjLCdBACy1A+MNFT/mSmywRx9DM3O0UAsSwJU1NlNxYV4X/D+cke
         Y43GmN4+u0UpsAoiuY1vQl0bfBlbnSjdW8gqzUwjzsOQs/cgY4YGvMeSLcju/EpXFRl7
         NxCDuMvipRlbFmDPL8F6R5YXsrL4MoSrXMjX9r5helj0lvsf8iS7LyO/5GkoulbHiugZ
         B37DlwncDgrDQ3b9g8qKC9ZybtWCbNej+LO7IOXhTXVXKWH7TLDF0DTkUUePXGdaQAzI
         km7q2nn80QNLsENQvXXGKv8KU+Zz638zbqSsNIvdmOnCZk4MG6nIxBzjyftsFHdhCCnd
         6+6w==
X-Gm-Message-State: AOJu0YxNWjU1KkbTn34S8ZgYyN+SQGlDdC8XZ9EhxILA5fdWXSOpBcH0
	S7LMUlZ/arFTD1ZAiGAJhIh8jMz4samUC+agPB6qXhEVIq0kf4dzCrsrN8Ted+GVus8=
X-Gm-Gg: AZuq6aJPoTSu4+pLHUM1D8q2azvDEldhEYknTrKbM5P46EhCcHxg3Lw9G7haEiMMufX
	8alzy2NqJM23+PBcIeytiY73Ue5Z5/40uVrts9uFe+7m2XNdaCQTGa2Cy3w7jWpVNUNCUCiEWqf
	pomCW1IreNHPVHpCD/a4rXLPUBnHWDrBoIHlrOncVmD9QJE/R/OS25LTu1R+BBkd/x+VBJuPmvV
	PnasFz1IgLUypqkDSjpLC8guTdU86mULnY+C070R93MtF4uIiZ7mUUOJm/ZbR2TgSEx0xcY1PFG
	c8eljlOCHVk5sJMuPCSO8Z0Hi6vUJgbFAo6XHd0qX4HJeWSjp0U0njfnd5/V2Qjo4G0NMZsC8oh
	/X4MAaWPN4G7T5u7dy3MCTt1Vw8L1Hhc2lgmqfS495F9BByHF5wJFzXXwO28c2rZ22ADLfT4YSE
	svJdd8BPH2V3M8rQ8dnvL8
X-Received: by 2002:a05:600c:638e:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-480511f42d4mr29154775e9.13.1769184256022;
        Fri, 23 Jan 2026 08:04:16 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7b4d8sm7382016f8f.38.2026.01.23.08.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 08:04:15 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 23 Jan 2026 16:03:53 +0000
Subject: [PATCH] perf: arm_spe: Add barrier before enabling profiling
 buffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOibc2kC/x3MSwqAMAwA0auUrA3YClW8irgImmrET2lEBPHuF
 pezePOAchJWaM0DiS9ROfYctjAwzLRPjDLmBlc6X1pX4UIbK2pkTLzSTWcGOHrv7FCTb0KATGP
 iIPe/7fr3/QABhG0pZgAAAA==
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Alexandru Elisei <Alexandru.Elisei@arm.com>, 
 Anshuman Khandual <Anshuman.Khandual@arm.com>, 
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
 Robin Murphy <Robin.Murphy@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_080418_258421_81EA4265 
X-CRM114-Status: GOOD (  22.39  )
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

The Arm ARM known issues document [1] states that the architecture will
be relaxed so that the profiling buffer must be correctly configured
when ProfilingBufferEnabled() && !SPEProfilingStopped() &&
PMBLIMITR_EL1.FM != DISCARD:

  R24557

  While the Profiling Buffer is enabled, profiling is not stopped, and
  Discard mode is not enabled, all of the following must be true:

  * The current write pointer must be at least one sample record below
    the write limit pointer.

The same relaxation also says that writes may be completely ignored:

  When the Profiling Buffer is enabled, profiling is not stopped, and
  Discard mode is not enabled, the PE might ignore a direct write to any
  of the following Profiling Buffer registers, other than a direct write
  to PMBLIMITR_EL1 that clears PMBLIMITR_EL1.E from 1 to 0:

  * The current write pointer, PMBPTR_EL1.
  * The Limit pointer, PMBLIMITR_EL1.
  * PMBSR_EL1.

When arm_spe_pmu_start() occurs, SPEProfilingStopped() is false
(PMBSR_EL1.S == 0) meaning that the write to PMBLIMITR_EL1 now becomes
the point where the buffer configuration must be correct by, rather than
the "When profiling becomes enabled" (StatisticalProfilingEnabled())
from the old rule which is much later when PMSCR_EL1 is written.

If the writes to PMBLIMITR_EL1 and PMBPTR_EL1 are re-ordered then a
misconfigured state could be observed, resulting in a buffer management
event. Or the write to PMBPTR_EL1 could be ignored.

Fix it by adding an isb() after the write to PMBPTR_EL1 to ensure that
this completes before enabling the buffer.

To avoid redundant isb()s in the IRQ handler, remove the isb() between
the PMBLIMITR_EL1 write and SYS_PMBSR_EL1 as it doesn't matter which
order these happen in now that all the previous configuration is covered
by the new isb().

This issue is only present in arm_spe_pmu_start() and not in the IRQ
handler because SPEProfilingStopped() is true in the IRQ handler. Jumps
to the out_write_limit label will skip the isb() but this is ok as they
only happen if discard mode is set or the buffer isn't enabled so
correct configuration is not required.

[1]: https://developer.arm.com/documentation/102105/latest/

Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
Signed-off-by: James Clark <james.clark@linaro.org>
---
A previous version of this was posted here [1] bundled with other
changes to support running in a guest. Since then the known issues doc
linked in the commit message has been released so this is a resend of
only the critical part that also needs to be fixed for hosts.

A redundant isb() has also been removed in this version which is not
present in the previous version.

[1]: https://lore.kernel.org/linux-arm-kernel/20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org/
---
 drivers/perf/arm_spe_pmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 4801115f2b54..62ae409fd5b4 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -639,6 +639,7 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
 	limit += (u64)buf->base;
 	base = (u64)buf->base + PERF_IDX2OFF(handle->head, buf);
 	write_sysreg_s(base, SYS_PMBPTR_EL1);
+	isb();
 
 out_write_limit:
 	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
@@ -780,10 +781,8 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
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

---
base-commit: c072629f05d7bca1148ab17690d7922a31423984
change-id: 20260123-james-spe-relaxation-d6621c7a68ff

Best regards,
-- 
James Clark <james.clark@linaro.org>



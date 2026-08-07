Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7B4C5AC9E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEmQtgL1Jg9eS21ZoU2L12+hHWs75lQjzuzUo6aM1mc=; b=IhqNkCTjO9NS2kUAU39LNLkfq3
	NbQzQR6BAfQR9uWaaw0SA9oJtvN++eZbGjKxd04qrePEQ8HNFlvIzUe9xrg8Rs5BZZmyKIbdI3IBp
	uTrjbkdMAFXz+qP/SPTpW2hrjjWiV0A14g+Bl22qZvJLk7y4kDT3C+/vF3MTWOddzj7w411wGe7Gw
	HzO3GhKrh2N6SYNgDNMhC3gDVt2ohTJ55ZBZ2n9c5EEDkcyYpvvp1DDG3vXovake/um3df9lGo/zi
	WliFhbHUVRo9maTSIp1VCXzJO8ZKvOtW9dvit5KIFObjmNBqLDoBY4VOTxky5aWFgDAXgFSrkzpux
	ZEFxRRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFf5-00000007MdV-37JJ;
	Fri, 07 Aug 2026 08:10:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFf0-00000007MUY-3zXT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PEmQtgL1Jg9eS21ZoU2L12+hHWs75lQjzuzUo6aM1mc=; b=U6Yws07w3bHKNSAdIZ0KB5Og8n
	z2oq/LnBWN98JRgN9opUjW94+4+u4T1peFl+1Rf3pFFJ1ZAlJrZp1IKDPuCqDkIs62qkwvO+sLlbx
	dE82m3WPolU5CxpeI7qncCiAWeEOBR6O8l2vj00wCjUDGp1UCjLNbyzwId38ytMDoxED3tnwH1MgG
	nc6w7Y+4rjz04d8PxlEdwhGlDkmVFiGimBVPHSK4kUOMgnfSJ/D+pKLIHmdS+LrXNTfowb1HDWiYA
	VEY5CeyY/yYrndpGs8wi873pQB3YhnHdxwAXqx4StfxgRPPWonUFhcAVwX8CnHEMm1xKniKCQvjrr
	VkLJfZRA==;
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFev-0000000CAvC-22mm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:10:33 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEmQtgL1Jg9eS21ZoU2L12+hHWs75lQjzuzUo6aM1mc=;
	b=aLCs3n2NejlRTfLETAKXw7OmbjOXKceBHkS6DLJBKv11BFbmrahQRfrXqvdf/hgP4jmg4H
	5CCxw3MyVB1qJz5M4ubUYUbNOcUUWNdr+SN35KRpUcFc4VThbpauqUV1bvRo/9qDGAe/fE
	1OMaaTxwB4YyfYwMRnEbo5OkXG75ZWs=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:09:11 -0700
Subject: [PATCH v9 16/20] RISC-V: perf: Use config2/vendor table for event
 to counter mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-counter_delegation-v9-16-58658104e487@meta.com>
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
To: Will Deacon <will@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Ian Rogers <irogers@google.com>, 
 Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091030_637917_C2DB1CDB 
X-CRM114-Status: GOOD (  29.03  )
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

From: Atish Patra <atishp@rivosinc.com>

The counter restriction specified in the json file is passed to
the drivers via config2 paarameter in perf attributes. This allows
any platform vendor to define their custom mapping between event and
hpmcounters without any rules defined in the ISA.

For legacy events, the platform vendor may define the mapping in
the driver in the vendor event table.
The fixed cycle and instruction counters are fixed (0 and 2
respectively) by the ISA and maps to the legacy events. The platform
vendor must specify this in the driver if intended to be used while
profiling. Otherwise, they can just specify the alternate hpmcounters
that may monitor and/or sample the cycle/instruction counts.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 94 +++++++++++++++++++++++++++++++++++-------
 include/linux/perf/riscv_pmu.h |  2 +
 2 files changed, 80 insertions(+), 16 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index f0b8b6eff2ea..ee0c07785927 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -76,6 +76,7 @@ static ssize_t __maybe_unused rvpmu_format_show(struct device *dev, struct devic
 	RVPMU_ATTR_ENTRY(_name, rvpmu_format_show, (char *)_config)
 
 PMU_FORMAT_ATTR(firmware, "config:62-63");
+PMU_FORMAT_ATTR(counterid_mask, "config2:0-31");
 
 static bool sbi_v2_available;
 static bool sbi_v3_available;
@@ -120,6 +121,7 @@ static const struct attribute_group *riscv_sbi_pmu_attr_groups[] = {
 static struct attribute *riscv_cdeleg_pmu_formats_attr[] = {
 	RVPMU_FORMAT_ATTR_ENTRY(event, RVPMU_CDELEG_PMU_FORMAT_ATTR),
 	&format_attr_firmware.attr,
+	&format_attr_counterid_mask.attr,
 	NULL,
 };
 
@@ -1522,24 +1524,85 @@ static int rvpmu_deleg_find_ctrs(void)
 	return num_hw_ctr;
 }
 
+/*
+ * The json file must correctly specify counter 0 or counter 2 is available
+ * in the counter lists for cycle/instret events. Otherwise, the drivers have
+ * no way to figure out if a fixed counter must be used and pick a programmable
+ * counter if available.
+ */
 static int get_deleg_fixed_hw_idx(struct cpu_hw_events *cpuc, struct perf_event *event)
 {
-	return -EINVAL;
+	bool guest_events = event->attr.config1 & RISCV_PMU_CONFIG1_GUEST_EVENTS;
+	int idx;
+
+	/* event_base is 0 on the delegation path; match via the original perf attrs. */
+	if (guest_events) {
+		if (event->attr.type != PERF_TYPE_HARDWARE)
+			return -EINVAL;
+		if (event->attr.config == PERF_COUNT_HW_CPU_CYCLES)
+			idx = 0; /* CY counter */
+		else if (event->attr.config == PERF_COUNT_HW_INSTRUCTIONS)
+			idx = 2; /* IR counter */
+		else
+			return -EINVAL;
+	} else if (event->attr.config2 & RISCV_PMU_CYCLE_FIXED_CTR_MASK) {
+		idx = 0; /* CY counter */
+	} else if (event->attr.config2 & RISCV_PMU_INSTRUCTION_FIXED_CTR_MASK) {
+		idx = 2; /* IR counter */
+	} else {
+		return -EINVAL;
+	}
+
+	/* Take the fixed counter only if delegated and free, else fall back. */
+	if (!(cmask & BIT(idx)) || test_bit(idx, cpuc->used_hw_ctrs))
+		return -EINVAL;
+
+	return idx;
 }
 
 static int get_deleg_next_hpm_hw_idx(struct cpu_hw_events *cpuc, struct perf_event *event)
 {
-	unsigned long hw_ctr_mask = 0;
+	u32 hw_ctr_mask = 0, temp_mask = 0;
+	u32 type = event->attr.type;
+	u64 config = event->attr.config;
+	int ret;
 
-	/*
-	 * TODO: Treat every hpmcounter can monitor every event for now.
-	 * The event to counter mapping should come from the json file.
-	 * The mapping should also tell if sampling is supported or not.
-	 */
+	/* Select only available hpmcounters */
+	hw_ctr_mask = cmask & (~0x7) & ~(cpuc->used_hw_ctrs[0]);
+
+	switch (type) {
+	case PERF_TYPE_HARDWARE:
+		temp_mask = current_pmu_hw_event_map[config].counterid_mask;
+		break;
+	case PERF_TYPE_HW_CACHE:
+		ret = cdeleg_pmu_event_find_cache(config, NULL, &temp_mask);
+		if (ret)
+			return ret;
+		break;
+	case PERF_TYPE_RAW:
+		/*
+		 * Mask off the counters that can't monitor this event (specified via json)
+		 * The counter mask for this event is set in config2 via the property 'Counter'
+		 * in the json file or manual configuration of config2. If the config2 is not set,
+		 * it is assumed all the available hpmcounters can monitor this event.
+		 * Note: This assumption may fail for virtualization use case where they hypervisor
+		 * (e.g. KVM) virtualizes the counter. Any event to counter mapping provided by the
+		 * guest is meaningless from a hypervisor perspective. Thus, the hypervisor doesn't
+		 * set config2 when creating kernel counter and relies default host mapping.
+		 */
+		if (event->attr.config2)
+			temp_mask = event->attr.config2;
+		break;
+	default:
+		break;
+	}
+
+	if (temp_mask)
+		hw_ctr_mask &= temp_mask;
+
+	if (!hw_ctr_mask)
+		return -EINVAL;
 
-	/* Select only hpmcounters */
-	hw_ctr_mask = cmask & (~0x7);
-	hw_ctr_mask &= ~(cpuc->used_hw_ctrs[0]);
 	return __ffs(hw_ctr_mask);
 }
 
@@ -1579,10 +1642,6 @@ static int rvpmu_deleg_ctr_get_idx(struct perf_event *event)
 	u64 priv_filter;
 	int idx;
 
-	/*
-	 * TODO: We should not rely on SBI Perf encoding to check if the event
-	 * is a fixed one or not.
-	 */
 	if (!is_sampling_event(event)) {
 		idx = get_deleg_fixed_hw_idx(cpuc, event);
 		if (idx == 0 || idx == 2) {
@@ -1602,10 +1661,13 @@ static int rvpmu_deleg_ctr_get_idx(struct perf_event *event)
 		goto out_err;
 found_idx:
 	priv_filter = get_deleg_priv_filter_bits(event);
+	if (test_and_set_bit(idx, cpuc->used_hw_ctrs))
+		goto out_err;
 	write_deleg_hpmevent(idx, hwc->config, priv_filter);
+	return idx;
 skip_update:
-	if (!test_and_set_bit(idx, cpuc->used_hw_ctrs))
-		return idx;
+	set_bit(idx, cpuc->used_hw_ctrs);
+	return idx;
 out_err:
 	return -ENOENT;
 }
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 3c64151cb038..b23b71cb4e66 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -30,6 +30,8 @@
 #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
 
 #define RISCV_PMU_DELEG_RAW_EVENT_MASK GENMASK_ULL(55, 0)
+#define RISCV_PMU_CYCLE_FIXED_CTR_MASK 0x01
+#define RISCV_PMU_INSTRUCTION_FIXED_CTR_MASK 0x04
 
 struct cpu_hw_events {
 	/* currently enabled events */

-- 
2.53.0-Meta



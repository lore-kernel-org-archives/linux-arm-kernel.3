Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB45C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Unst9+FN4mg5CbM6AsDlSUXG1OgVFlSrNMGKLNQM9fc=; b=YWFyOh/sD5cLHkA7kEcjwRYwmU
	AwAAQ3wuWY+kc8PM1XB+aFgjBUsmplIWmqMNCAcxMMqn+bPQNyKqbEjP2hst1IGR1jhzVWT3Fa1vU
	Q+ESKAzRooWe90qR7saerCoDwoKd1qTc78N/3P2cpYm/5uF2khcIaE4gVWiC7iyAx5ohzLy5CBcKy
	r9z69x/19mKuzsLN8LIXH2Lbrhvgn+Ri+Ejvn214/Y+6ZTPPSm5wUfiHdNF+7Mhq4uS0o7TQ1z6dq
	86jXueKUXtHilWIhqnW0Ak4ujV/pNnKEVcUy5XxFG93rHk8haSosdgOOJFiTLIUoKxgCjfR5c5+E5
	kxpnoF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrd8b-000000048LW-2r6l;
	Wed, 05 Aug 2026 15:02:33 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrd8Y-000000048IL-17dZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:02:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47fdd674e17so688097f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785942148; x=1786546948; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Unst9+FN4mg5CbM6AsDlSUXG1OgVFlSrNMGKLNQM9fc=;
        b=iQ2JhdkUfhWpHCioqdtqDNodBoeJAShBBA8r9Uzj1U9RBKHJQyy5wJP/AZXLyuda8D
         /EkrjawKH3/Ew6SYlAfh2zR45az2Pk3kxWAEozhTlSJmiX9RYB01+SljW2S/YQLOwYUY
         ESqGjcweBog/Pcj5EA7l6SEP8N00LlEytShcAk2s5PhohpUxaY8/dpSNKhCWE3ssXNMw
         7cXzfCEamAAJYsHlEbq7T9C6FVubmzCAeCdHaUVkIwFhlhbqm6rb08CqvGoxknAsyCB4
         SLPTMmRYB5vSjEfrKkOnrcsM+oJmf+LroUe66bl4X65rZvnA24LNrSfXjglhxD7eMHKd
         AMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785942148; x=1786546948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Unst9+FN4mg5CbM6AsDlSUXG1OgVFlSrNMGKLNQM9fc=;
        b=oKz48bWAZBE5EcET5zwMFmJN02HSUqQ0yx/77h5iqikkEuLBGB+aawxL0yTvb7ST7K
         hpfmqp14/zGpxvHsRMqK/T4r9dAbDaF69l23zSIzClNzTazJvcYIFK918Kgv6UyPLRc+
         LkOmHkw5MN7/TN8FBIrWRBnJbV47oN0ehZ6SrbBKtXdSLggCbfSwT/LCLcegIEeVRgPx
         uRMqO5cDNm+flYZx4VS00PHXPUnBzyMrL++hN834iY4FcOlNrmEhXERd9HQG8ZGXmL+9
         Ql9R92d54XoQ9UL673oGIdxxWpA5ER6xwwIbeDK2E1E/0AOqokB+RL/JEPstYQX16Azq
         boIw==
X-Gm-Message-State: AOJu0YxtjrPzm+mU2cjvdo5J1rSh48DT2vEDQlawzQFa4M6O6y8Ao4/f
	5VkTND0mPjtHrWscB5tUNWnEsLG+3Wb4NR4KU/huWN6oo8nH5aE92TAOMW3nrQUhxAo=
X-Gm-Gg: AR+sD11QvptzpT8LC1BfjjoidpxORmR18K9UmnGJDT4fwZVDoilrUDVUoycPoeLNPh7
	bGS5YosB2pp5Xy2otuO+4d43S63Il0AhJO8AFWZlZncT2fKSVrGeYZc2wT5b2TrGRn6OI6SUiYY
	VTGTTzGbs2tuckMd4Qns0v68pOuOdsyd5Te8vI5oyUXUf86vIiyobnFMJwrx0pX7TH67HQseokX
	eurG+5yXOpsZ48QgiA9glGnhxLFXiDZJ4EBtW7ebEQo1bKl5xbMJOgRlSV7GdqabxTq/d2N6UwP
	meRC5VrKvsXs9//OrsKBHwUTkksXtKSHAAYO71EiF8hEdRqToWEmUNA3whWIENRRNNeRstD8yuf
	e9rwKNFc6umcZcdv+Wmkm9wUjEpgEyzw265964OBUchpdD81bVXRhg035Vs6yoy6lNVDLBwx3lF
	6/PtWzoc0T0m0Z9wJtRkQC4LuRr+EqXFJ6T3R9F2rCeY04sgLW1zmUr7g/RQHzSm6R
X-Received: by 2002:a05:6000:41d0:b0:45e:73eb:5119 with SMTP id ffacd0b85a97d-47fec62ea74mr13867635f8f.22.1785942148094;
        Wed, 05 Aug 2026 08:02:28 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23ede6sm10308695f8f.30.2026.08.05.08.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:02:27 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 05 Aug 2026 16:01:53 +0100
Subject: [PATCH 3/3] perf: arm_spe: Add support for a 'software' discard
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-james-spe-software-discard-v1-3-0ff0e44c4c92@linaro.org>
References: <20260805-james-spe-software-discard-v1-0-0ff0e44c4c92@linaro.org>
In-Reply-To: <20260805-james-spe-software-discard-v1-0-0ff0e44c4c92@linaro.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
 Al Grant <Al.Grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_080230_391386_B69BE2C2 
X-CRM114-Status: GOOD (  30.89  )
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

Currently discard mode needs hardware support, but we can get something
that appears pretty similar to userspace by writing to a single page
allocated by the driver and not emitting aux records.

Remove the -EOPNOTSUPP, as now we use the same discard mode format attr
as with HW support but fall back to the software version.

Don't call perf_get_aux() in discard mode as it unconditionally
dereferences a NULL event->rb when handle->event exists, which can now
be true.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 160 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 134 insertions(+), 26 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 562a1d3be39f..093fa3cc5084 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -60,6 +60,7 @@ static bool get_spe_event_has_cx(struct perf_event *event)
 }
 
 #define ARM_SPE_BUF_PAD_BYTE			0
+#define ARM_SPE_DISCARD_BUF_SIZE		SZ_4M
 
 struct arm_spe_pmu_buf {
 	int					nr_pages;
@@ -67,6 +68,12 @@ struct arm_spe_pmu_buf {
 	void					*base;
 };
 
+struct arm_spe_pmu_sw_discard_buf {
+	struct page				*page;
+	void					*base;
+	refcount_t				refcount;
+};
+
 struct arm_spe_pmu {
 	struct pmu				pmu;
 	struct platform_device			*pdev;
@@ -85,7 +92,7 @@ struct arm_spe_pmu {
 #define SPE_PMU_FEAT_LDS			(1UL << 4)
 #define SPE_PMU_FEAT_ERND			(1UL << 5)
 #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
-#define SPE_PMU_FEAT_DISCARD			(1UL << 7)
+#define SPE_PMU_FEAT_HW_DISCARD			(1UL << 7)
 #define SPE_PMU_FEAT_EFT			(1UL << 8)
 #define SPE_PMU_FEAT_FDS			(1UL << 9)
 #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
@@ -218,7 +225,8 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
 #define ATTR_CFG_FLD_store_filter_CFG		config	/* PMSFCR_EL1.ST */
 #define ATTR_CFG_FLD_store_filter_LO		34
 #define ATTR_CFG_FLD_store_filter_HI		34
-#define ATTR_CFG_FLD_discard_CFG		config	/* PMBLIMITR_EL1.FM = DISCARD */
+/* PMBLIMITR_EL1.FM = DISCARD, or scratch buffer if no HW support */
+#define ATTR_CFG_FLD_discard_CFG		config
 #define ATTR_CFG_FLD_discard_LO			35
 #define ATTR_CFG_FLD_discard_HI			35
 #define ATTR_CFG_FLD_branch_filter_mask_CFG	config	/* PMSFCR_EL1.Bm */
@@ -309,9 +317,6 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct arm_spe_pmu *spe_pmu = dev_get_drvdata(dev);
 
-	if (attr == &format_attr_discard.attr && !(spe_pmu->features & SPE_PMU_FEAT_DISCARD))
-		return 0;
-
 	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
 		return 0;
 
@@ -368,6 +373,82 @@ static bool arm_spe_discard_mode(struct perf_event *event)
 	return ATTR_CFG_GET_FLD(&event->attr, discard);
 }
 
+static bool arm_spe_uses_sw_discard_buf(struct perf_event *event)
+{
+	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
+
+	return arm_spe_discard_mode(event) &&
+	       !(spe_pmu->features & SPE_PMU_FEAT_HW_DISCARD);
+}
+
+static void arm_spe_pmu_free_discard_buf(struct perf_event *event)
+{
+	struct arm_spe_pmu_sw_discard_buf *buf = event->pmu_private;
+
+	event->pmu_private = NULL;
+	if (!refcount_dec_and_test(&buf->refcount))
+		return;
+
+	vunmap(buf->base);
+	__free_page(buf->page);
+	kfree(buf);
+}
+
+/*
+ * Map a single page multiple times to make up ARM_SPE_DISCARD_BUF_SIZE.
+ *
+ * This reduces the number of interrupts that have to be serviced in software
+ * discard mode, but at the same time only uses a page of memory. We don't need
+ * to worry about samples being overwritten because they're never read.
+ */
+static int arm_spe_pmu_alloc_discard_buf(struct perf_event *event)
+{
+	int node = (event->cpu == -1) ? -1 : cpu_to_node(event->cpu);
+	int nr_pages = ARM_SPE_DISCARD_BUF_SIZE / PAGE_SIZE;
+	struct arm_spe_pmu_sw_discard_buf *buf;
+	struct page **pglist;
+	int i;
+
+	if (event->parent) {
+		buf = event->parent->pmu_private;
+		refcount_inc(&buf->refcount);
+		event->pmu_private = buf;
+		event->destroy = arm_spe_pmu_free_discard_buf;
+		return 0;
+	}
+
+	buf = kzalloc_node(sizeof(*buf), GFP_KERNEL, node);
+	if (!buf)
+		return -ENOMEM;
+
+	buf->page = alloc_pages_node(node, GFP_KERNEL, 0);
+	if (!buf->page)
+		goto out_free_buf;
+
+	pglist = kvmalloc_array(nr_pages, sizeof(*pglist), GFP_KERNEL);
+	if (!pglist)
+		goto out_free_page;
+
+	for (i = 0; i < nr_pages; i++)
+		pglist[i] = buf->page;
+
+	buf->base = vmap(pglist, nr_pages, VM_MAP, PAGE_KERNEL);
+	kvfree(pglist);
+	if (!buf->base)
+		goto out_free_page;
+
+	refcount_set(&buf->refcount, 1);
+	event->pmu_private = buf;
+	event->destroy = arm_spe_pmu_free_discard_buf;
+	return 0;
+
+out_free_page:
+	__free_page(buf->page);
+out_free_buf:
+	kfree(buf);
+	return -ENOMEM;
+}
+
 /* Convert between user ABI and register values */
 static u64 arm_spe_event_to_pmscr(struct perf_event *event)
 {
@@ -617,10 +698,26 @@ static u64 arm_spe_pmu_next_off(struct perf_output_handle *handle)
 static void arm_spe_pmu_begin_discard(struct perf_output_handle *handle,
 				      struct perf_event *event)
 {
-	u64 limit;
+	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
+	struct arm_spe_pmu_sw_discard_buf *discard_buf = event->pmu_private;
+	u64 base, limit;
+
+	if (spe_pmu->features & SPE_PMU_FEAT_HW_DISCARD) {
+		limit = FIELD_PREP(PMBLIMITR_EL1_FM, PMBLIMITR_EL1_FM_DISCARD);
+		limit |= PMBLIMITR_EL1_E;
+	} else {
+		base = (u64) discard_buf->base;
+		limit = base + ARM_SPE_DISCARD_BUF_SIZE;
+		limit |= PMBLIMITR_EL1_E;
+		write_sysreg_s(base, SYS_PMBPTR_EL1);
 
-	limit = FIELD_PREP(PMBLIMITR_EL1_FM, PMBLIMITR_EL1_FM_DISCARD);
-	limit |= PMBLIMITR_EL1_E;
+		/*
+		 * Track the event so we can access the discard buffer through
+		 * event->pmu_private. perf_aux_output_begin() normally handles
+		 * this, but we can do it manually if that's not being used.
+		 */
+		handle->event = event;
+	}
 
 	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
 }
@@ -757,15 +854,20 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
 	enum arm_spe_pmu_buf_fault_action act;
 	u64 aux_flags;
 
-	if (!perf_get_aux(handle))
+	if (!event)
+		return IRQ_NONE;
+
+	if (!arm_spe_discard_mode(event) && !perf_get_aux(handle))
 		return IRQ_NONE;
 
 	act = arm_spe_pmu_buf_get_fault_act(&aux_flags);
 	if (act == SPE_PMU_BUF_FAULT_ACT_SPURIOUS)
 		return IRQ_NONE;
 
-	perf_aux_output_flag(handle, aux_flags);
-	arm_spe_perf_aux_output_end(handle);
+	if (!arm_spe_discard_mode(event)) {
+		perf_aux_output_flag(handle, aux_flags);
+		arm_spe_perf_aux_output_end(handle);
+	}
 
 	/*
 	 * Ensure perf callbacks have completed, which may disable the
@@ -819,6 +921,7 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
 static int arm_spe_pmu_event_init(struct perf_event *event)
 {
 	u64 reg;
+	int ret;
 	struct perf_event_attr *attr = &event->attr;
 	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
 
@@ -880,14 +983,16 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	    !(spe_pmu->features & SPE_PMU_FEAT_EFT))
 		return -EOPNOTSUPP;
 
-	if (arm_spe_discard_mode(event) &&
-	    !(spe_pmu->features & SPE_PMU_FEAT_DISCARD))
-		return -EOPNOTSUPP;
-
 	set_spe_event_has_cx(event);
 	reg = arm_spe_event_to_pmscr(event);
-	if (reg & (PMSCR_EL1_PA | PMSCR_EL1_PCT))
-		return perf_allow_kernel();
+	if (reg & (PMSCR_EL1_PA | PMSCR_EL1_PCT)) {
+		ret = perf_allow_kernel();
+		if (ret)
+			return ret;
+	}
+
+	if (arm_spe_uses_sw_discard_buf(event))
+		return arm_spe_pmu_alloc_discard_buf(event);
 
 	return 0;
 }
@@ -954,23 +1059,26 @@ static void arm_spe_pmu_stop(struct perf_event *event, int flags)
 	arm_spe_pmu_disable_and_drain_local();
 
 	if (flags & PERF_EF_UPDATE) {
+		enum arm_spe_pmu_buf_fault_action act;
+
 		/*
 		 * If there's a fault pending then ensure we contain it
 		 * to this buffer, since we might be on the context-switch
 		 * path.
 		 */
-		if (perf_get_aux(handle)) {
-			enum arm_spe_pmu_buf_fault_action act;
-
-			act = arm_spe_pmu_buf_get_fault_act(&aux_flags);
+		act = arm_spe_pmu_buf_get_fault_act(&aux_flags);
+		if (!arm_spe_discard_mode(event) && perf_get_aux(handle)) {
 			perf_aux_output_flag(handle, aux_flags);
 			arm_spe_perf_aux_output_end(handle);
-
-			/* Assume PMBSR only needs clearing for real faults */
-			if (act != SPE_PMU_BUF_FAULT_ACT_SPURIOUS)
-				write_sysreg_s(0, SYS_PMBSR_EL1);
+		} else {
+			/* Discard mode tracks event outside of perf_aux_output_X() */
+			handle->event = NULL;
 		}
 
+		/* Assume PMBSR only needs clearing for real faults */
+		if (act != SPE_PMU_BUF_FAULT_ACT_SPURIOUS)
+			write_sysreg_s(0, SYS_PMBSR_EL1);
+
 		/*
 		 * This may also contain ECOUNT, but nobody else should
 		 * be looking at period_left, since we forbid frequency
@@ -1180,7 +1288,7 @@ static void __arm_spe_pmu_dev_probe(void *info)
 		spe_pmu->features |= SPE_PMU_FEAT_ERND;
 
 	if (spe_pmu->pmsver >= ID_AA64DFR0_EL1_PMSVer_V1P2)
-		spe_pmu->features |= SPE_PMU_FEAT_DISCARD;
+		spe_pmu->features |= SPE_PMU_FEAT_HW_DISCARD;
 
 	if (FIELD_GET(PMSIDR_EL1_EFT, reg))
 		spe_pmu->features |= SPE_PMU_FEAT_EFT;

-- 
2.43.0



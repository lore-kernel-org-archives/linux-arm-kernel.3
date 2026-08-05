Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77739C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Flg4QZQ4xZBxdFqtD7yG7JFgD80sYwr4xDNIvMLPrJw=; b=vpXDeMg0Jki1LhnxMZw7KXDUzV
	J+goo+egHsDDRUQ0Al7UpdLw4weDXdtu9va6Rmy2RX8KjRUSxK0aRq+3UgyxtGSVH3KifHNTxH2o2
	LWHd1LPC3IHCIEBou71PRiwbdHTadhQIFcBGBUcAowUHbCXMX+yBdbWPf44IUTTAbTDFbpgXPWPcY
	m7NcZgSuHjH0dbiQ67nvb+7CxTecfvFRLxu2jb4pRNaYkgpXtxfY8JfVI4V4loc9bYqrTu1c3VyTW
	uTrqaYMS6uEAS0QzQMBQ0B2OPfXN5mPwa9XHNdL4+jaBVh1e2BxPKMHvaSvW1ki4AYO/hISNXNnqi
	zUSKaP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrd8b-000000048Kq-1EGW;
	Wed, 05 Aug 2026 15:02:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrd8X-000000048Hy-0ong
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:02:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1478819f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 08:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785942147; x=1786546947; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Flg4QZQ4xZBxdFqtD7yG7JFgD80sYwr4xDNIvMLPrJw=;
        b=gJDwOnXl37WTMeJwun/ZcZZW+GxXyIVQk6wDDgiaX6xwBDbzkO+RRsyFddMy9Q7Aa1
         48tadCsuRPOaYJLJUQ9sWMVp4ZwYbirM7b9ZBeghYmzQVn3AQb2+ovHofa5Md/K56sNZ
         +nTzStEgnwcJmp3/AMAx2Yx4/4OfL4ZRhcCS+MFNunZivdF2QeRwMoliV9HWKTbUaNYY
         SGFsGHl6liD1FRT+JYphGCC1WUfC8ighnOC02Fe6ee77vCbQW8YK0vBUpDdT7PYnuibA
         3nNK94s2AmlZWVpB5KTLwgT1zUi2+5d2myvVbsb1dxDoNGBc8qJf3GqE14BFxn/zwNqr
         Oq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785942147; x=1786546947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Flg4QZQ4xZBxdFqtD7yG7JFgD80sYwr4xDNIvMLPrJw=;
        b=SHtIJHYZpYG14hU3bOQqIsedRluetL6Htw2vYIArvfXpKgdqn9LYT3RDZcNuKuKg9K
         XZzN4jKQuOlmu9S29TLTO4TyeTIvV6rKmxMXxfd4DQ2a0RjEiIfuDWu07v2CTsvKi9U3
         GATls+4WDWBF/jiGOagb7jXh7HbRr3rprj49vjxvVvh0WYMOoI0EMSB+48eCspdsuKC+
         hs0b8tp0xDbrCvMtjWm0RIwdT4HGxC306tIq5VwTjAJ3SYWWTXEHmzPQHC+oynYd4o+7
         sr5lFeG6A4c7t3aOMqkfMkJiNB8jnFh9XZEBRErbBg+5wcnNWWJGaWFh+MYauLfjGLLk
         wqSg==
X-Gm-Message-State: AOJu0YzMEg2x0AOvZfNS7PLeyiokezkGkA5liccr5/Cf4jKA6lbK4qJw
	GNknIsmxmT5LDXYy3vzWvxURuc73Y5n0Xb7TF691gM0BvioroDveNDKPSjEFqui4H6XCSJImLO1
	z5QXjGPQnVg==
X-Gm-Gg: AR+sD11Db+XVBy57KzGsgsyb5iFZN2FpPSTbvQBY2mmQdlRVChSNtaZxbspTadJ82m0
	nIN1a48UBcvaQHY31KtKQUCpR1vFNPen25bu2+l60fK9B/dVwjnKR9s5Bs9j5NZxAFKXdQhthFv
	XIMIPqBsaGiKfJQmMWPQ3ieYJfQq2xhAJLwxqcXvFmmsU9jzY7XXXeaa5SEmhEUOSnj6Ep9OJ27
	30QF5s5M5A+6tJK1HqZCNqMJsiUpau1A1Zhmq8HJ/vCyOyJH9oyUztpgpTAjlJBovG22np5YvFW
	GWiTudMGiJq50pQYr9loGp7y7ac6CkSerG5GbhEnKfhmQ9qmgkADoKNGf+nu+2hJoWkcb2d1rCc
	u0U37yQalytIe0HC073CsU/Fo8rgPaBV0tep/NZIkSeyRzHA8KuAnC0QK9d1LK3HRgWSyS58Fd0
	iD6zNF7u8i8wKIamd4eH84ht4Ge1O3/OlM7h05YzrO5KRcguUEzjWNWFE8Vf4SbBlE
X-Received: by 2002:a5d:64e3:0:b0:47f:f002:3656 with SMTP id ffacd0b85a97d-47ff011797dmr8776881f8f.12.1785942147253;
        Wed, 05 Aug 2026 08:02:27 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23ede6sm10308695f8f.30.2026.08.05.08.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:02:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 05 Aug 2026 16:01:52 +0100
Subject: [PATCH 2/3] perf: arm_spe: Factor HW discard mode out of
 arm_spe_perf_aux_output_begin()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-james-spe-software-discard-v1-2-0ff0e44c4c92@linaro.org>
References: <20260805-james-spe-software-discard-v1-0-0ff0e44c4c92@linaro.org>
In-Reply-To: <20260805-james-spe-software-discard-v1-0-0ff0e44c4c92@linaro.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
 Al Grant <Al.Grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_080229_256488_D4A7F874 
X-CRM114-Status: GOOD (  17.65  )
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

Discard mode doesn't call perf_aux_output_begin() or emit aux records,
and enabling it never fails. We'll add a second discard mode in the
next commit so it will be cleaner if there is a separate begin function
just for discard mode.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 10d28ad81256..562a1d3be39f 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -363,6 +363,11 @@ static const struct attribute_group *arm_spe_pmu_attr_groups[] = {
 	NULL,
 };
 
+static bool arm_spe_discard_mode(struct perf_event *event)
+{
+	return ATTR_CFG_GET_FLD(&event->attr, discard);
+}
+
 /* Convert between user ABI and register values */
 static u64 arm_spe_event_to_pmscr(struct perf_event *event)
 {
@@ -609,18 +614,23 @@ static u64 arm_spe_pmu_next_off(struct perf_output_handle *handle)
 	return limit;
 }
 
+static void arm_spe_pmu_begin_discard(struct perf_output_handle *handle,
+				      struct perf_event *event)
+{
+	u64 limit;
+
+	limit = FIELD_PREP(PMBLIMITR_EL1_FM, PMBLIMITR_EL1_FM_DISCARD);
+	limit |= PMBLIMITR_EL1_E;
+
+	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
+}
+
 static int arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
 					 struct perf_event *event)
 {
 	u64 base, limit;
 	struct arm_spe_pmu_buf *buf;
 
-	if (ATTR_CFG_GET_FLD(&event->attr, discard)) {
-		limit = FIELD_PREP(PMBLIMITR_EL1_FM, PMBLIMITR_EL1_FM_DISCARD);
-		limit |= PMBLIMITR_EL1_E;
-		goto out_write_limit;
-	}
-
 	/* Start a new aux session */
 	buf = perf_aux_output_begin(handle, event);
 	if (!buf) {
@@ -775,6 +785,12 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
 		arm_spe_pmu_disable_and_drain_local();
 		break;
 	case SPE_PMU_BUF_FAULT_ACT_OK:
+		if (arm_spe_discard_mode(event)) {
+			arm_spe_pmu_begin_discard(handle, event);
+			isb();
+			break;
+		}
+
 		/*
 		 * We handled the fault (the buffer was full), so resume
 		 * profiling as long as we didn't detect truncation.
@@ -864,7 +880,7 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	    !(spe_pmu->features & SPE_PMU_FEAT_EFT))
 		return -EOPNOTSUPP;
 
-	if (ATTR_CFG_GET_FLD(&event->attr, discard) &&
+	if (arm_spe_discard_mode(event) &&
 	    !(spe_pmu->features & SPE_PMU_FEAT_DISCARD))
 		return -EOPNOTSUPP;
 
@@ -884,7 +900,9 @@ static void arm_spe_pmu_start(struct perf_event *event, int flags)
 	struct perf_output_handle *handle = this_cpu_ptr(spe_pmu->handle);
 
 	hwc->state = 0;
-	if (arm_spe_perf_aux_output_begin(handle, event)) {
+	if (arm_spe_discard_mode(event)) {
+		arm_spe_pmu_begin_discard(handle, event);
+	} else if (arm_spe_perf_aux_output_begin(handle, event)) {
 		arm_spe_pmu_stop(event, 0);
 		return;
 	}

-- 
2.43.0



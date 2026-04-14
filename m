Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1768AF531E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbsDVJkTRMx0qswgCm9IniTVkJpsMJgpoF58GIGXMdg=; b=RBiL7vqLwzVeZtcvsZYsSvIL6D
	YFR8bYa4XRo3VkGTnbps/Q18ahdb2kzJ/KPsRdwgGWALmcVlX8wRlBpnlGDyESBtI3en896N2pnAI
	ZIzIba+6niIFRyG2d0hp77cVp7P5HS+BAhRsa446MJPPHPrcNVyFObl1UcDcLCUj8PSjregX/YbmN
	d90Zvc6/fQ66rvV8CK3XaODWRcAI7ub3oxOMwHNAidF6LOBzEJE32p9Hn6HJH/6G1R+W/EWP3VHWx
	0iuBowfukSEwF8CBwevNQAFZZGghYf9VzN3L2rEuSgIQHP9B0524DNjsZKX2LdehCtyE+wQuGThUT
	q/C+uQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbbF-0000000HCS0-2exk;
	Tue, 14 Apr 2026 11:06:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbbD-0000000HCPz-1GGv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 11:06:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so38482715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 04:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776164789; x=1776769589; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbsDVJkTRMx0qswgCm9IniTVkJpsMJgpoF58GIGXMdg=;
        b=b7muu/DsdlnrJMu9VAvE4QsmKT5xTsJekGqDqpIS8UuDnA9OpNvG2ZWkOUe2pWe7A0
         6jI+ssfmjkZjCD6fz9/Kn6HwCzTSHceepMmvT/auoyJJeW8rH5Mq09N7L+3um9ug2FQS
         Iu5zNJwq+iSa2dL+YK3T2TyCXMc01T5+nkB5Sx4ZEq9K6cXtR6o/B2OD/5EKF4yiJpiU
         6x1lhhwKG23aOk7+EvAIimYnfncDiace96uuT9036wTPRYLSV92zv87IdWQlCr4Q/n/i
         Jq6WCKYyrM0rUUYgCw2O3KtOJwYIz6m299/KpRgiwzwVVfOf/Sbu0IjqxzLqDCCJr194
         2p+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776164789; x=1776769589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wbsDVJkTRMx0qswgCm9IniTVkJpsMJgpoF58GIGXMdg=;
        b=EVRrKJt7i+53RkxmNI4JrWlQz9Y6YR/BcJej2ia9pNkR4SLGutVLJXOeYEjh2TPz20
         dps+aYyiexqLi64+vm5B6rktbGiOAhaU8xP0D55RmGaJ59J0ny536e1q99oK8jnn4XKf
         ubpKylYLQ233u8V6WLNRAyDaMgirdHlmI6Bx5lh/qpX1OQex+CobrSdKYrL5KRvL4JBz
         93C6pfn7LTwAWF17fsK4nSmIPsAnbfLR8IEwI+TcLZ0fBgvaM/Ge5DPO3LJuFx31bAhh
         +LtiyYXGM1arJl4gX2e7JgH19PamHBAD1e9d9EGxMNTDHOGrKHc2H0H5GX4HwRaazWV1
         ttRA==
X-Gm-Message-State: AOJu0Yx27OU8+LKA33cINkWuNb5VbhJfa8p6tiHlpRmOWIkwmb7WbUy8
	NtQmM4iaW3I8rvDHyEqsJ/vHTk383jpY7unvO4I4C4jEE6VlfDKyxXB16PkL5Ybnua0=
X-Gm-Gg: AeBDiesTE9bYA7jYLFfxRE8mva3SJQKv2tMv+mewIXuWK1tnnFc5nmKhGoO0O3J98GG
	GqsguNy6958cJBelFCX0nPhOvO7UPj9DjM27qRhz0updWhIcc2TUOXBoUMi0lz1FCQpLBKsvcOP
	0x+UXeG+528Stdnh695P1D8d76QCICkhK7OzKPEfA4EQ6UdxuEARLzD62J75S9QqH1NiXwbPWll
	hTyH/ODvc/O6zGPCAJHrtCwksol7QPwNyp2nqkjXGhmWN2MrMY3yDYR2WwLIn210ffUjC1weud8
	XmxrgMDefY0YjIBNC8gX7v1Wd9jz0gM6wa0Dorv3UgP4VW8/nZU81a+BUYaTUSLWUfLHZENRIdu
	b7jalnXj74D/vdtQ/Y9EJ9IwVKF4uy0b+lf78JKQqsWEAv/l98HKH3sblVUYCGBJ3zvNcJYlATc
	qDJSAmGovEMPvvlY3qCN2uEqICDjCbRmQ4EpCQkhPizA==
X-Received: by 2002:a05:600c:8710:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-488d67bbd1dmr248340235e9.4.1776164789177;
        Tue, 14 Apr 2026 04:06:29 -0700 (PDT)
Received: from e133063.arm.com ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d9dd86sm183254655e9.4.2026.04.14.04.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:06:25 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 14 Apr 2026 12:04:50 +0100
Subject: [PATCH v3 4/6] perf arm_spe: Turn event name mappings into an
 array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-james-spe-impdef-decode-v3-4-63baf9c893b1@linaro.org>
References: <20260414-james-spe-impdef-decode-v3-0-63baf9c893b1@linaro.org>
In-Reply-To: <20260414-james-spe-impdef-decode-v3-0-63baf9c893b1@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_040631_380881_FC56C59D 
X-CRM114-Status: GOOD (  14.21  )
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

This is so we can have a single function that prints events and can be
used with multiple mappings from different CPUs. Remove any bit that was
printed so that later we can print out the remaining unknown impdef
bits.

No functional changes intended.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 88 +++++++++++-----------
 1 file changed, 43 insertions(+), 45 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 718022aecec30bf30a51ba3d2bca9cf6465259a7..67ca356100e53aaf6d47489717537ba27aa2b98e 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -277,6 +277,48 @@ static int arm_spe_pkt_out_string(int *err, char **buf_p, size_t *blen,
 	return ret;
 }
 
+struct ev_string {
+	u8 event;
+	const char *desc;
+};
+
+static const struct ev_string common_ev_strings[] = {
+	{ .event = EV_EXCEPTION_GEN, .desc = "EXCEPTION-GEN" },
+	{ .event = EV_RETIRED, .desc = "RETIRED" },
+	{ .event = EV_L1D_ACCESS, .desc = "L1D-ACCESS" },
+	{ .event = EV_L1D_REFILL, .desc = "L1D-REFILL" },
+	{ .event = EV_TLB_ACCESS, .desc = "TLB-ACCESS" },
+	{ .event = EV_TLB_WALK, .desc = "TLB-REFILL" },
+	{ .event = EV_NOT_TAKEN, .desc = "NOT-TAKEN" },
+	{ .event = EV_MISPRED, .desc = "MISPRED" },
+	{ .event = EV_LLC_ACCESS, .desc = "LLC-ACCESS" },
+	{ .event = EV_LLC_MISS, .desc = "LLC-REFILL" },
+	{ .event = EV_REMOTE_ACCESS, .desc = "REMOTE-ACCESS" },
+	{ .event = EV_ALIGNMENT, .desc = "ALIGNMENT" },
+	{ .event = EV_TRANSACTIONAL, .desc = "TXN" },
+	{ .event = EV_PARTIAL_PREDICATE, .desc = "SVE-PARTIAL-PRED" },
+	{ .event = EV_EMPTY_PREDICATE, .desc = "SVE-EMPTY-PRED" },
+	{ .event = EV_L2D_ACCESS, .desc = "L2D-ACCESS" },
+	{ .event = EV_L2D_MISS, .desc = "L2D-MISS" },
+	{ .event = EV_CACHE_DATA_MODIFIED, .desc = "HITM" },
+	{ .event = EV_RECENTLY_FETCHED, .desc = "LFB" },
+	{ .event = EV_DATA_SNOOPED, .desc = "SNOOPED" },
+	{ .event = EV_STREAMING_SVE_MODE, .desc = "STREAMING-SVE" },
+	{ .event = EV_SMCU, .desc = "SMCU" },
+	{ .event = 0, .desc = NULL },
+};
+
+static u64 print_event_list(int *err, char **buf, size_t *buf_len,
+			    const struct ev_string *ev_strings, u64 payload)
+{
+	for (const struct ev_string *ev = ev_strings; ev->desc != NULL; ev++) {
+		if (payload & BIT_ULL(ev->event))
+			arm_spe_pkt_out_string(err, buf, buf_len, " %s", ev->desc);
+		payload &= ~BIT_ULL(ev->event);
+	}
+	return payload;
+}
+
 static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
 				  char *buf, size_t buf_len)
 {
@@ -284,51 +326,7 @@ static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
 	int err = 0;
 
 	arm_spe_pkt_out_string(&err, &buf, &buf_len, "EV");
-
-	if (payload & BIT(EV_EXCEPTION_GEN))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " EXCEPTION-GEN");
-	if (payload & BIT(EV_RETIRED))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " RETIRED");
-	if (payload & BIT(EV_L1D_ACCESS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L1D-ACCESS");
-	if (payload & BIT(EV_L1D_REFILL))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L1D-REFILL");
-	if (payload & BIT(EV_TLB_ACCESS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " TLB-ACCESS");
-	if (payload & BIT(EV_TLB_WALK))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " TLB-REFILL");
-	if (payload & BIT(EV_NOT_TAKEN))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " NOT-TAKEN");
-	if (payload & BIT(EV_MISPRED))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " MISPRED");
-	if (payload & BIT(EV_LLC_ACCESS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " LLC-ACCESS");
-	if (payload & BIT(EV_LLC_MISS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " LLC-REFILL");
-	if (payload & BIT(EV_REMOTE_ACCESS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " REMOTE-ACCESS");
-	if (payload & BIT(EV_ALIGNMENT))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " ALIGNMENT");
-	if (payload & BIT(EV_TRANSACTIONAL))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " TXN");
-	if (payload & BIT(EV_PARTIAL_PREDICATE))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-PARTIAL-PRED");
-	if (payload & BIT(EV_EMPTY_PREDICATE))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-EMPTY-PRED");
-	if (payload & BIT(EV_L2D_ACCESS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L2D-ACCESS");
-	if (payload & BIT(EV_L2D_MISS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L2D-MISS");
-	if (payload & BIT(EV_CACHE_DATA_MODIFIED))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " HITM");
-	if (payload & BIT(EV_RECENTLY_FETCHED))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " LFB");
-	if (payload & BIT(EV_DATA_SNOOPED))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SNOOPED");
-	if (payload & BIT(EV_STREAMING_SVE_MODE))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " STREAMING-SVE");
-	if (payload & BIT(EV_SMCU))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SMCU");
+	print_event_list(&err, &buf, &buf_len, common_ev_strings, payload);
 
 	return err;
 }

-- 
2.34.1



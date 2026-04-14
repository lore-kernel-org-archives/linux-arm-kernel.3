Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E2FF9D0C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbsDVJkTRMx0qswgCm9IniTVkJpsMJgpoF58GIGXMdg=; b=p6sI8nLnHDKnfkyxUmXd7Nwv7O
	yBzZrNZGA5u94Q4Ii7DQY+hIDXERwBfTrgn6+cnyIXv/X8lQ7jkHabaIniDrNgoxPGLcpBnkN6Fcw
	DLhG0uIg2vZ0MXKRIQeGec8Dk42lIspIa79WMx7Buz1alcNnwwGwx1QiuaPAjGQdX0f4PVS972Q4w
	QFs37wJoPzwXO3+zHvmTyUjMidjz2M99+TwIrjqM4lZVx0QNd1tIaP4U1r1t4wsmOte79JasafAxr
	lf35CERRSj0uVubUFkBYmwfEo7IktMLbE+9hR8VZUa0UMhT7xIq9qh9SoQ3fik+WYwUtt1S/0+/YQ
	NypMWTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBo-0000000HJxp-2Xfa;
	Tue, 14 Apr 2026 12:48:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBk-0000000HJtL-0TNz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 12:48:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so36487805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776170898; x=1776775698; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbsDVJkTRMx0qswgCm9IniTVkJpsMJgpoF58GIGXMdg=;
        b=QZZtZgKpaQEEgsGg2pRVfnBdcTvNE6kXajdj+E9cFdfYKmWtIXlW7w+rAXio7ls426
         aWZqE92vZ3uWIxAHxDzi0o97Un4mCkd6qkmd7QV65obDaztlR2URkuRc/QYT5P/wFUUv
         XbsOYavvEZO9wBatqPlMfZnrMUW6UAVjkM09C32g2v260m3xg6l9mylrOttNckzxqpXS
         3oqDuQhX16iYEjl+wj+kMSGafAaIVAypMkgNsbF5PodQzd3lfwM8nsOsvbBOgXx7e1PA
         uzHHlRi3WwC5FHNr83Qvs4OB6XTkNHXl80mOfB1g8wtpG/4XcGqfTUgwSpkj9u1hZAPV
         MBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776170898; x=1776775698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wbsDVJkTRMx0qswgCm9IniTVkJpsMJgpoF58GIGXMdg=;
        b=N1qAR3aH/ffRLn258Q+utSCnLexYYWQpfDH/6uWEp8mduYwJUFXs6QUCUWrX6aVBQE
         mBHKCt+WYf9KJ6WDdbxk5Lf5xy7Ri8KJtSKZpBP84afvRh2KoX4cfu1Yoxub7cc85o0R
         zxQ7npCtol3sDT3+G3h4SYZ6lYIceEJqe/6Kvit0JED9hB67QVwpqvA5iwdV863fetMJ
         geJ9n7oZkgCE7qvzFuSecjEoM1FzAPMfAklKCyOk3F7HYQSs8ILFDaJsWIooQZR+HR0W
         GOCP58GSbdhA/YbzBP33+ScS1+qeaPrsYgxeVzR8LmapItMkT6hCytASeAnx0y2gESbz
         57pg==
X-Gm-Message-State: AOJu0YwtFrEz0MtU1NCED2M2FSG6Bxbkj0ar/Y7+/hQ4XfyQPqi1glOe
	0g29sBznZb+fWD6OpcoTGCpT973+pBI+/K7dVkZr7faxmC0Cb8mQSJNrSIe1Xnoixps=
X-Gm-Gg: AeBDieuNtnuc5Jpa8TdgjLbu0AYwDuBhWsgcSHvEOUz76Ug5vsANXtIw9plKmSFmpRk
	sNS0bheJB3pPP//YAaWJU4/duBMa0YoYpU6MQ18yH6J7oS61flY92n0jh9h0gg4jDiHTvwqOEAt
	iZ/9Z3MpBKavh5itlej27H5NLJFqAsltP4LhczFnPGrsLcftSxyypAWxDlxdJI2ZupZrLRL2BAQ
	RMuritBs4CaxIvaDmYMa8KwJvpu3w0jNW16R+urPtApG2XbLHxsvZg/gUAXone7nSW8fBnFbdbI
	Ok++iGw6FIsE8q3h/Kl5F0sTKmJVuD7DmEBKw5/ZxbmNqELk2aLBBuhsearqTRkMI+yd63KGFKT
	6f722oSq4HKFz1IXhHxI2zcxyQjSDJXWMwm4+N6REL2HRgzEAiHpYUYMWW1wBsbJWb2S94kF0ro
	xWZa34VBgdESmgusdW+TKeZZouQGQ5NUyGhMVMwGVNAw==
X-Received: by 2002:a05:600c:c10c:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-488d68cb8demr145699165e9.12.1776170898153;
        Tue, 14 Apr 2026 05:48:18 -0700 (PDT)
Received: from e133063.arm.com ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e05bsm81185285e9.6.2026.04.14.05.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 05:48:17 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 14 Apr 2026 13:48:02 +0100
Subject: [PATCH v4 4/6] perf arm_spe: Turn event name mappings into an
 array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-james-spe-impdef-decode-v4-4-1dd30783a33b@linaro.org>
References: <20260414-james-spe-impdef-decode-v4-0-1dd30783a33b@linaro.org>
In-Reply-To: <20260414-james-spe-impdef-decode-v4-0-1dd30783a33b@linaro.org>
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
X-CRM114-CacheID: sfid-20260414_054820_175731_CC8DC184 
X-CRM114-Status: GOOD (  14.14  )
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



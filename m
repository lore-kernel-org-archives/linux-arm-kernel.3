Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE98FEEF4F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7a5dHlK5ecPt6xckcJpPIY0VEGI+9frdQ7qhWf9R0sQ=; b=0HfYDdT97VwreU2aWgQ0W7w5Ry
	BR1SfoWtDyY01MapcazMxOtPoVcMqPBTUN5SiwixA74kYdov/V8SMVxo7buCA7SzKEjIN5Vt3cdtH
	aBWKGYbPaaZin8JBKRH8y5IMjBIBMIxXYbJ42EskPQFChgE6lYOtWsPYSc0VNCNsrsXtEJXSgkKah
	ZWXNFsdmYKINbdQDixWk4Ykdk037gJh+PsHl3KbaxbatyOuCA0SzzJ87S+M/+2TdHPXa1BgHk4bu3
	D6TFfVUNXxohFJukur1+nK/TPjYCy4OIOesqDTyGvqsdxVEk7Dwbr22/jt1xgszEuECnvATryefmG
	1W/DZsWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA749-00000006Z0E-2095;
	Tue, 07 Apr 2026 14:06:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA744-00000006Yw6-1ap8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:06:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48896199cbaso45373075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775570758; x=1776175558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7a5dHlK5ecPt6xckcJpPIY0VEGI+9frdQ7qhWf9R0sQ=;
        b=P83Aajly+u5+ctJnxYMmZwu4jA83BuXvTuuxMuO9ZpERd8VXfyjST+NBsRkCuJQQSY
         QnAVeGswK0ixJjVMyqBlwsJVIsEbHDNfem8TUybsvQHJVOV5UWZSN1hISq50Vklhqhll
         ItH8iKTuVuaN7uqzXjvE1JHUhdjUj+OWxJe3oouyM8WpSKD/s4+VQ6h1hFkjTKdMhn4e
         yA/7tFJMt3MyYclq8xVBPNDRDM/Q+Age7UrP37ayuAGdXKG4w1KEOB4kS3BoO1LUVR5D
         NatjUfvKsEc8MeGgbMPIwHhx5Qtwk897yI3tb/LDft+RjC6zQkBa/3bt8l/8nNdEOq39
         8ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570758; x=1776175558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7a5dHlK5ecPt6xckcJpPIY0VEGI+9frdQ7qhWf9R0sQ=;
        b=HmmTKcxQhKpGi9U0JXwt4K/yG7AtUjrjLcJe0+dEwiSgKZabfTYt9aIPzBXxqOt3CQ
         1A5UqrUsXgJnkwQ8s+Y2nM2e70jGOa/GaeUOD9NvqU0hgYLrxLp3Yb8yfqO3hd3YcBSO
         JFPZwPptT0dHL1HLGlza869ksuJnmJOYslOiuf1gm8I2Hytph5T5+ZmayDNV0lr103Ph
         9EFAQBERB5JDhMWH6UP9Gn2h2cNIhDXtzWgj6zxw+pNqlG0E/Cc21HgBGDzGWC2IRVNF
         EtVEQnnrgxq6tyLwQNf3gUZlRSAjJi4H/5dCpX6zgIjtDFvQIZBqb/+huQuLrXw4c7Kr
         Zljw==
X-Gm-Message-State: AOJu0Yy+iG5kJFSLE6gXZRSl8DM9BvQnJo3s+URpc8H1q2n/zuzdynKL
	fIm3JJjO25CT5wEH4wVFE3rBAbbdj1zFrQq0CwJCjVgFpg8IAls42W/TgL/cX7uG8pE=
X-Gm-Gg: AeBDietXIx+5LR1282wcE7LaZSAlYsDd5xhoM2A0E1Vm4UUN95mjCz9QJv8mZxdZgzh
	QSrGeLnVdsfdh8ny5Oz+dATJgZ8/26kFMYYG+pXv3GuP8IZIY/a3yCZiUiYFBXGakIXqrfT0Gxf
	+K4yAVklSButpiBLYbC1BJkpJ/HNzowxhdg4jG6lu6T8NpgrPckQY/YQ36ErVf1tYE+CT6dp6sZ
	pslcnX0PNyR2Cf1lPNe6oI4ExJcpl5QmjSrz/G6gDbV6jY45z6vIg4rJH2nR1Nzvq0z3+UkHQ3r
	6NIpzYMMN+HgQ3A0jr1yaecg+e1kp/cPEOYhrK02E4KK1y9/+iTvlu9SouvTCqz21OJDb1QQQKe
	GyV/iWF8sJ869k99DKt6uF1yRJAkm+asVocbWvwFTNWtZZZOavqnfaY50vldp02skqI3Qy0bcp0
	6BV5fY2R9MQzn2WyH6vDJ0VcAXlAsQqeUUJWd/wMv9fHM=
X-Received: by 2002:a05:600c:1990:b0:488:a82f:bbb6 with SMTP id 5b1f17b1804b1-488a82fbdeemr154986695e9.27.1775570758405;
        Tue, 07 Apr 2026 07:05:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm626876145e9.4.2026.04.07.07.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:05:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 07 Apr 2026 15:05:18 +0100
Subject: [PATCH v2 4/6] perf arm_spe: Turn event name mappings into an
 array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-james-spe-impdef-decode-v2-4-55d3ef997c48@linaro.org>
References: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
In-Reply-To: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_070600_463046_7CF8B4E3 
X-CRM114-Status: GOOD (  14.67  )
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
index 718022aecec3..67ca356100e5 100644
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



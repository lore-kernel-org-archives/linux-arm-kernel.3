Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D02FEEF4E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLZ04h5XV7RbRTSYEuzKScz0bb5tSDren7EYv5i83Is=; b=EGqircJIc5hUNybag5Gmtz3GIg
	T6vWcPHO0hWHuT54xGdyQp7XODGV6wrf2noNPKVDbx6yvKndpAjtnlPvjcIJIzqK7/L85GFlau7+/
	8U1TlP2jyajV5c+f8kgY7+azvx0XYsDzlm2wmvQPZYnAdoXe7ZBuoJeLYCXlhJVrSt5QJgZahUMUX
	jsR0Yw/dPYH3i/TntSY9ILZPh+IA+kv34jgWj0Jkd6EMD9ENi4w4zDNsGnQS3qWZs2fDuV6U5n0tG
	pHUSFNimJZpfUlLV8yLZvGu75+P6zHw8UJD0ReqB5bl7r4zgsQX6o1uKU4SlOlqlYIkMqyEyss0/p
	Awyx7jRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA749-00000006Z0b-3PVS;
	Tue, 07 Apr 2026 14:06:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA745-00000006YwN-1PDu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:06:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso30545235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 07:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775570760; x=1776175560; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLZ04h5XV7RbRTSYEuzKScz0bb5tSDren7EYv5i83Is=;
        b=HW76f8oqr+zvKn93X0v4tQvPZ8q4jJbI0uIHaBI0+eid94gxiasFcaENa7gVsNAwAU
         bLyfDGAO/HMKBO/6Hx6yukBy6sldnPQxXSy5XL+F6Yt/n3HwW3ownluxSBc3Yt73dZuW
         v8YIhTePqj2yfGANi0EmUIpJl4NFLb+kRsbR+jS7APxEQUAnBQeF9PAzVdCsk1Jk8Du5
         OJPYvgWPpY7+vGHBBAD2W8rQoomK4btMwphdKP2Ui+cgv+TLQ/bvVAXEgBk7Sfubfy/R
         arqAJwU4UtD4jgh6fbJNpKk+fQkRedPkSEgolaNyJ2U98cRPSTjCaEGEDmdN0KIZaxMv
         ckJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570760; x=1776175560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eLZ04h5XV7RbRTSYEuzKScz0bb5tSDren7EYv5i83Is=;
        b=dirrvpsTk9nlAfBP8FX0AAgwIz7onUrm04bDn9Obky8pkNGOsI1uT+UR1CoAmABmwh
         DIEsEPTXSu8Me/f+XanbMe0liezMSiTDxHwu70ZFHHsYLbuQRLQ1j5PTConKj1Wvle88
         rU2aA2vPGJtJ6vwFhgG1NmCIsbHt+gISuF3Pzo6WIPv9DDeolaJnGWp72CZJo8kG0gzv
         OtoSy3ILLlcD/bFcT3OuLZj274aiMwX4qDyPyhkO9LcPQyghSsMFdo2jy+6m06ziNOF+
         FaOPbMSS9g4fQhBPtiQVHqYZJj0Vj34YVjFu8PrqgQ1hf0bSTueHrdP89EE0mxX1eFkx
         XiYA==
X-Gm-Message-State: AOJu0YxnHP1PhjM3LhIOWynIJL6qLAEFUynmwjrXoBo9BLW7iFHDdqky
	wPmNNZQQCjdPXA7vWz8fh5H0LpilkX/SP0cWELnLOQHuq/jxxh5I6SeEYXSGJrS23HQ=
X-Gm-Gg: AeBDiev8OsPJhu987k6TardxuPMXoa6eZ40hwU+dt+l88tECJM9g4wODnfTobyFLh+R
	E6VDJJUpV6073K+WpaXRQGR7LL9CJIFkesR3me1V02ulEV26kOtQiiTAS8juBwp+SupRUg23IXm
	8MyUP4pMlXvdOXgetmjznOw2fRKQi9W+eEFis1aB03toqZSeijIe6btFHajFtd0t7rLj55YBQQl
	uQCdDBlacA7fp0gfGbiRlvLCxEGm0K4XzaAI0mbp4Vu8Wh/2kWg9E3JzOQgFpw/MrxUicJTg83M
	JMf0+wmWqoXalscNk70WijIUfmgk6mt6WcimabE8Eon3xVQchtoXfOf+jeNeH+hwpABDO/qaral
	sy118/QEXXWgfGfIach68vma1EInUf3tIRe0mNVKr+Mi8qxL97TE2n/GoIZ9zCLM4RbFsLM8gQo
	hISe94Lrf51C8G6qJICNF/nF0mAC3QdufFFzBH0xiuVFk=
X-Received: by 2002:a05:600c:181b:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-488a8820213mr94479095e9.25.1775570759631;
        Tue, 07 Apr 2026 07:05:59 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm626876145e9.4.2026.04.07.07.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:05:59 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 07 Apr 2026 15:05:19 +0100
Subject: [PATCH v2 5/6] perf arm_spe: Decode Arm N1 IMPDEF events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-james-spe-impdef-decode-v2-5-55d3ef997c48@linaro.org>
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
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_070601_422051_024C9D55 
X-CRM114-Status: GOOD (  20.45  )
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

From the TRM [1], N1 has one IMPDEF event which isn't covered by the
common list. Add a framework so that more cores can be added in the
future and that the N1 IMPDEF event can be decoded. Also increase the
size of the buffer because we're adding more strings and if it gets
truncated it falls back to a hex dump only.

[1]: https://developer.arm.com/documentation/100616/0401/Statistical-Profiling-Extension/implementation-defined-features-of-SPE
Suggested-by: Al Grant <al.grant@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe-decoder/Build              |  2 ++
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 39 +++++++++++++++++++++-
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |  2 +-
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/Build b/tools/perf/util/arm-spe-decoder/Build
index ab500e0efe24..97a298d1e279 100644
--- a/tools/perf/util/arm-spe-decoder/Build
+++ b/tools/perf/util/arm-spe-decoder/Build
@@ -1 +1,3 @@
 perf-util-y += arm-spe-pkt-decoder.o arm-spe-decoder.o
+
+CFLAGS_arm-spe-pkt-decoder.o += -I$(srctree)/tools/arch/arm64/include/ -I$(OUTPUT)arch/arm64/include/generated/
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 67ca356100e5..b74f887a48f2 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -15,6 +15,8 @@
 
 #include "arm-spe-pkt-decoder.h"
 
+#include "../../arm64/include/asm/cputype.h"
+
 static const char * const arm_spe_packet_name[] = {
 	[ARM_SPE_PAD]		= "PAD",
 	[ARM_SPE_END]		= "END",
@@ -308,6 +310,11 @@ static const struct ev_string common_ev_strings[] = {
 	{ .event = 0, .desc = NULL },
 };
 
+static const struct ev_string n1_event_strings[] = {
+	{ .event = 12, .desc = "LATE-PREFETCH" },
+	{ .event = 0, .desc = NULL },
+};
+
 static u64 print_event_list(int *err, char **buf, size_t *buf_len,
 			    const struct ev_string *ev_strings, u64 payload)
 {
@@ -319,6 +326,26 @@ static u64 print_event_list(int *err, char **buf, size_t *buf_len,
 	return payload;
 }
 
+struct event_print_handle {
+	const struct midr_range *midr_ranges;
+	const struct ev_string *ev_strings;
+};
+
+#define EV_PRINT(range, strings)			\
+	{					\
+		.midr_ranges = range,		\
+		.ev_strings = strings,	\
+	}
+
+static const struct midr_range n1_event_encoding_cpus[] = {
+	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
+	{},
+};
+
+static const struct event_print_handle event_print_handles[] = {
+	EV_PRINT(n1_event_encoding_cpus, n1_event_strings),
+};
+
 static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
 				  char *buf, size_t buf_len)
 {
@@ -326,7 +353,17 @@ static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
 	int err = 0;
 
 	arm_spe_pkt_out_string(&err, &buf, &buf_len, "EV");
-	print_event_list(&err, &buf, &buf_len, common_ev_strings, payload);
+	payload = print_event_list(&err, &buf, &buf_len, common_ev_strings,
+				   payload);
+
+	/* Try to decode IMPDEF bits for known CPUs */
+	for (unsigned int i = 0; i < ARRAY_SIZE(event_print_handles); i++) {
+		if (is_midr_in_range_list(packet->midr,
+					  event_print_handles[i].midr_ranges))
+			payload = print_event_list(&err, &buf, &buf_len,
+						   event_print_handles[i].ev_strings,
+						   payload);
+	}
 
 	return err;
 }
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
index a457821f3bcc..a3300bec4990 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
@@ -11,7 +11,7 @@
 #include <stddef.h>
 #include <stdint.h>
 
-#define ARM_SPE_PKT_DESC_MAX		256
+#define ARM_SPE_PKT_DESC_MAX		512
 
 #define ARM_SPE_NEED_MORE_BYTES		-1
 #define ARM_SPE_BAD_PACKET		-2

-- 
2.34.1



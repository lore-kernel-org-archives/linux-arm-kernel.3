Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12525F9D0CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9CYFRKleV99FYE5YRfSxRGUGOIShzVFADPCbQgmgLs=; b=dazC6Fv4aCStpUaeFrVPuQyK5U
	XX/idYyBtAZtaXLqc6jL6JyOJXkiLpwrFgEFc7H79HjsCQTKui83fDczhDsVgrCJVaWB24oBFd2R5
	W2ZtCKObarhGX5L5eDPOshQAGUpH0YHKNeZvrB7TdDJtUQI0F9XH4bGCaq7dSlwnOVNU6qWS7Zwtj
	0VVn+63DoqZHhHKR9rfN1o2faoyN/qdr8lmiAbOcv3KB8GZ6y8aAtr/qiT01YDTf2x/tFQ1PDIOK7
	xsYpNOi5A2OmL+2S5Rcd/s0FBb8q77id6P8gfkurLZCSILuoMO8b7Ox7n8pGTPULajlO4V0CynePw
	OSSFz2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBs-0000000HK1T-2msb;
	Tue, 14 Apr 2026 12:48:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBn-0000000HJvt-1Kcm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 12:48:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488971db0fdso54982325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 05:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776170902; x=1776775702; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9CYFRKleV99FYE5YRfSxRGUGOIShzVFADPCbQgmgLs=;
        b=g0dpJZ2zwRHQGPYjkuQBQnVoE/V71o6JH7kSvp7i2AV+7lfRztn1OLo8NHBJI8M6v9
         Wo7i7wt1XzKiQo+O78V9J8jBVd5d/E97JNpNKn5KXsbnjywlmCjv96NWpuNch6gjsZ9Q
         z7Ovog1uVOnRgG080r3vPbe/91UotqcMR9/j0BmlcoIqdAzy0dpH1dB/TlRtsql1gwJc
         yJadWjdmZ/l9qU8uQmCAx/WRpYI8bGgs2rDF6988GskkYnvk0W2EQFw2vXf6jb3z55sA
         ZL1nrlR+m/FPrN403jXOFnRM9UaytCwKZkKih8ueL7zAIbOkJDAXv4y/X5hV7LbQ8Cx3
         g++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776170902; x=1776775702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h9CYFRKleV99FYE5YRfSxRGUGOIShzVFADPCbQgmgLs=;
        b=TYEBsyzNTgtGvn1kNbL8Hmu+PLKpjNMgaQkwagFdcIROio3nEbkB4KWb0K+e7ubXKL
         /77/bVclvGkGd9XqI2xTaGiDn1B/9tFmhSmOGo6jt00oBwKaPr8wJB/6U/2T/oxyELYF
         FwBm88jrxnQol006E0XZ798BWb3S/Me5GocQ1CqjbDZxkPfa2/DrE8cJMScyXX/7yw0R
         24Y+B6ZV0Sbii1ocWTP6KMCXOKGQWr8QtkK01lagyr5AM9xpdU2TZyrh8QE3LhVYKGYe
         ZFoI5Pxnl+Ysb3oFc2vwSV9xQXhW3PFfwvWEi+wqXdzz97QKbb9dbIfvR5jbw+9jgEIg
         SYhg==
X-Gm-Message-State: AOJu0YyxyooTnU/8na/TOK2ZQD+gE895oOg1Z7qYemz4HcfpHjVpb9xC
	vx8T8w8c5lb3fTXES5jqY7MKpm2dMGCxI4cP6OCRV0WjSn6Rr6bj4lXgADbjJcvIIKA=
X-Gm-Gg: AeBDiesfHPQObomhczuA4EXTLdMqV+37l2BOnMFVWlVqygRCEgr/he25qeycfO5IBkp
	s3RNiqmimhfedhTmLO7b0wboraL/ppiABGinIwuqmklBO21Fd63s41DybjSEBGIfAqGZy0fao1i
	9TROitENKhdvy7+nO9oyHu3fIbkv2D1xES6GN1TWlIyU7MOpdWEPMgs8JYMn83WUBsPLXEOODPJ
	tVZRlUxJnr9FTimSborGMqkcb0kB1mY5lQlVmVldNb/HP0rTyG8C8YMSGsO0UJcNxzbnuzhZdGo
	loCvT7/0nZEBERsckWq82sWc+PArWBCwqTiu3ZnZMc9Q0ZWPWKP/48VBaj8hIXuw90fMFBUgr+/
	9gtC+TxFqOO22UDnAoqLi6dzMTavYnwyXybO+Cm5A8RAQaX0sJht/PvM4mhM74xh0aiEl3O10hu
	lTlk9WFWkNaXeV491xaqzmly6UJRYHsNeAKo9KTZQftA==
X-Received: by 2002:a05:600c:8585:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-488d684bcb0mr179229125e9.14.1776170901671;
        Tue, 14 Apr 2026 05:48:21 -0700 (PDT)
Received: from e133063.arm.com ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e05bsm81185285e9.6.2026.04.14.05.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 05:48:21 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 14 Apr 2026 13:48:03 +0100
Subject: [PATCH v4 5/6] perf arm_spe: Decode Arm N1 IMPDEF events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-james-spe-impdef-decode-v4-5-1dd30783a33b@linaro.org>
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
 Al Grant <al.grant@arm.com>, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_054823_378568_BDF1B950 
X-CRM114-Status: GOOD (  19.98  )
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

>From the TRM [1], N1 has one IMPDEF event which isn't covered by the
common list. Add a framework so that more cores can be added in the
future and that the N1 IMPDEF event can be decoded. Also increase the
size of the buffer because we're adding more strings and if it gets
truncated it falls back to a hex dump only.

[1]: https://developer.arm.com/documentation/100616/0401/Statistical-Profiling-Extension/implementation-defined-features-of-SPE

Suggested-by: Al Grant <al.grant@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe-decoder/Build              |  2 ++
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 39 +++++++++++++++++++++-
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |  2 +-
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/Build b/tools/perf/util/arm-spe-decoder/Build
index ab500e0efe2449fa2535d6efae2a30bc2690cb9e..97a298d1e2791bb9556cf893bd170ef938bfe631 100644
--- a/tools/perf/util/arm-spe-decoder/Build
+++ b/tools/perf/util/arm-spe-decoder/Build
@@ -1 +1,3 @@
 perf-util-y += arm-spe-pkt-decoder.o arm-spe-decoder.o
+
+CFLAGS_arm-spe-pkt-decoder.o += -I$(srctree)/tools/arch/arm64/include/ -I$(OUTPUT)arch/arm64/include/generated/
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 67ca356100e53aaf6d47489717537ba27aa2b98e..b74f887a48f2a13b1be165947b4e3293f9987bd4 100644
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
index a457821f3bccb67691cfd530de2f1c5bf9d8d50c..a3300bec4990a76608d23e34368d6146c9f4a5b5 100644
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



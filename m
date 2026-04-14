Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CB9F531DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9CYFRKleV99FYE5YRfSxRGUGOIShzVFADPCbQgmgLs=; b=zoOShp8RXeUMKz3WSYXXfJN/Ev
	g+g8wKXyfM6n0Zb0ajo+i2S07G2ONIoVoZlCxv1hJjmLaU3eI66rhYlSRXa6neh3KchvXiO2vQZ+F
	KQ6DYxR2WTUDsRVFQda/jgF1kxKtunvIqVXxMEMEG80v/8YQP0D0vFgl4puhyHxaV5yR7Hv2fYuLF
	GEch/+OeOirYQGhpR6N1tSpYN1Iv/WBXqk634cyh/qlY/5YBbJ1vTp0G5G2M5Qutfz9J1M7f/PBGh
	vEFe//KhMAQuEvjBdp3VhNqg9eRVYlaMCaoPf3vYJI5MTP7FpeBJGqstIJmlQWkE72BluRIorumGz
	seFSs0Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbbJ-0000000HCUf-3yhG;
	Tue, 14 Apr 2026 11:06:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbbH-0000000HCS4-0Akw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 11:06:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488c21c636dso32675325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 04:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776164793; x=1776769593; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9CYFRKleV99FYE5YRfSxRGUGOIShzVFADPCbQgmgLs=;
        b=nmgERy4y4glEtHLozE8a/q7wxwodEkU95VjcJacFOiAoRR4Uz3WPyKeVBtc4lMk7SU
         yNDZMn1y7hl4yNIOG9gZZob2NcLLijmMHFoNi1BaOv+eZNT+C0i2f5j+NRYRJyJgtXOF
         JJPmU3G/v0TT6Z3WW8WaqAGk8ZSWg+F74pU/zKlcODsGeHpfZolk6fJZpM4RYr8URMhV
         uxJdCz0JgfMCPj2a8WtUd47+M9MV1ecFITTRYQnLWmXv/bYIj8qAs90y1SAv7J3OSVLD
         I1FqouH9hI2MNAtdSjD34CocmusriHwmwgwG2JRWCWEFvyf7bTg4cKTngPsVxxibyyvE
         zzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776164793; x=1776769593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h9CYFRKleV99FYE5YRfSxRGUGOIShzVFADPCbQgmgLs=;
        b=qtlO0PNXXduaprIDVuP9Y9jml+drosKusmqhsj6ivWshvBO1htc1G6XfobTgTrb577
         Xwk5X6muBKrl/4Z83FrEXuKL+bAegj61Nyygi+AEH7CYirTEGpBgFqvF6eIAvhIOsgUp
         GAAI/zRHJ+2bMx78WYKKn/yVBWAw7l9tv5y6vyX9iLKk18Oeob+W1Frh/tvi1MWu7JTQ
         lXU+6sJQyz7qJAmch24a0AgPOVcK14GmI12+LElGNQTze1ZBj/4kND5rnRGSL1X3MGd0
         uXwCn028Khl3ilO2HyXQlb5sNjX/VC1HhC/ia0dz5Uy/jh5FEsHwNC10erYGXXOdj9+m
         H1Yg==
X-Gm-Message-State: AOJu0Yygf+rPQQ/YN/s5zUu74e5axoq10gumBbLK+kZqhMPAIh/JiP9q
	Ta/5t0pYa4QnKvbiQYABKI1r82fy3mdeRaBVhAa32K/Su1I+f6EGfzydtDMaF8Atano=
X-Gm-Gg: AeBDievUNFHhXY0og2MeHIcQIszHSmo/zWbZyQ8Ql/ntFH5f9jdekuS3Jh8gUnEVAWr
	85zTJx2H0XrE1xI0hH4vyRFUS0thz5ErS6DhCoHWXunizqgEgm56I8GU75CukYtA/kKb31Eu1jG
	EOHpiI0a/LFYh+woFVctHeKCTFAVcelmSZ5RavxhtleFM4nmWayVREeMmot2/chNa7VQT/KTI3Z
	eHoTMCd++FWhkfYAruGJMr/aKtmCDCGhi3g+NmfAoU19R16MHdpXvGuQC5d9bjZNwV1L252RvQ2
	1ADgXY6v23OLblDgx6KTwJ/pqsnEoG8AJZ0g7WUAKly2CypqOE8au15TzanNICuCTV/6mE2oVsS
	o/1blYXl8pwWmcWgBQsC5hVIvkHENM4zxU/TNzmwy6sZjRtGwv9pY5eIK9pmdcuGYjj/p58aFd3
	T8m4Myt3PPmpkLX5SVrWbV3usxfFnNXQcRavYdxotwsw==
X-Received: by 2002:a05:600c:8585:b0:488:ba19:da25 with SMTP id 5b1f17b1804b1-488d6822a0bmr168820335e9.12.1776164792947;
        Tue, 14 Apr 2026 04:06:32 -0700 (PDT)
Received: from e133063.arm.com ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d9dd86sm183254655e9.4.2026.04.14.04.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:06:30 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 14 Apr 2026 12:04:51 +0100
Subject: [PATCH v3 5/6] perf arm_spe: Decode Arm N1 IMPDEF events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-james-spe-impdef-decode-v3-5-63baf9c893b1@linaro.org>
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
 Al Grant <al.grant@arm.com>, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_040635_140796_EEC7C9D1 
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



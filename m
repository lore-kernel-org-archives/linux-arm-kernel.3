Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FAB1076381
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osWrxEAqmZXiuVvpI8iKF9LeT8juwh9RdnQ1+Y4xO5c=; b=V63x6cO9SKy6Cnq/3yA8Hp6jPR
	wdkDyIUklARM8wlanrcYgiLzyLs6NsvqxDIk9MsJIEVbnybYz3ZKWAg63rhxAXlL8FIx8DkHgaDhN
	y1MpBUk0n8xF5UqXAiDhykVTvGAHMvuNje4NK7PHoi4Gf3y1rRbpQ9/8cngMgshUSy1lUj5/ccgBK
	dzIq+FATetCd/LkvyMezU5kBs8g05C1fZCgq7vXhFGOtrYTFwV9oekRVGcBj4J0dojV5IA+CP0g8q
	zlPGUFC4TwGhSPUMoWftlPMkdjScE/RXE6iYux2dzZwaMsUnp0zHzFgyVG0JDHCnKMF6vOoTRCEeL
	PXdIXarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWd-0000000FU9p-0VN5;
	Wed, 01 Apr 2026 14:26:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWa-0000000FU8u-35JF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 14:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=osWrxEAqmZXiuVvpI8iKF9LeT8juwh9RdnQ1+Y4xO5c=; b=LkO37AGkj9WfU18EMbpd5Yeeyq
	x/Jg4ifMp9+UroP9ZPKFLas0GZs6uddGTc374UqD96fyB6nPF0sW3bZ55ghgSAYEqmZRK69hJ/De3
	YbBrJkOA3cbsQXR/8a9xBZUgru3F167hXsFFqHwvUmuovFxOYG2vfdi56dAflsGm41UsJga8vzKkC
	JaWQ2OwMQ0UeqlX/0ruqInunhLGpU0U3qOPPQHNKrrGATjrSVfoVhOCUDBX2xQ2AAjO6CebH9XQ5o
	sE3xr5IKlAIm/lvBiGZ+0Y32kQ/VeyW4TdP7KYAtqc7+IUvRV0wN3c1EVOCfQerBXL/LN+JhKwh6c
	aqmaMhrA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWX-00000000biO-39DM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:26:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so64125225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 07:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775053584; x=1775658384; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=osWrxEAqmZXiuVvpI8iKF9LeT8juwh9RdnQ1+Y4xO5c=;
        b=cUb93WtWtsMiZDGZTBqGnObs+0UGUChIQqscycFajaGya/zJM6q+C7ucnBa2AV1ONm
         W8K5ml6BSmPd9JYbg6QWMcKhVA5yTp/L4aZoNRjdqA1fRuvBKhdT2xBwFLf/p6+L1+ao
         HVySqd/6chICqxDWTfUeHU1/cVg51vpFMGuc61FyuLqtj+L0eD5NdOLrjyFAAeArk8vI
         9gwuDbhLa3hcN/4FuXxA+SrseQJ4HQSFOYo5u3p6n1QY46VuW+6jJ4nvgD7OQxv5hvve
         sLG+QPin1M1scGKOrIyvd8/39I/6Orej8hGCIj7zWK8uaCSnHeTOIAHkZ8RFdkn83s9B
         KGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053584; x=1775658384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=osWrxEAqmZXiuVvpI8iKF9LeT8juwh9RdnQ1+Y4xO5c=;
        b=IwJOC8Mx3zJKkPNotOy5dnxU/0zlkZozNqTzR+vWzjk7050SqM3qQaP/T+OnGiblPj
         VFbLyqrF1xjU7Y54LB/gyiMb5vj94crP4R49hk5hfsdqwLZDDl6b+JqDWFRrJRSYO82R
         qf2bH98DWD7tuRfKmBvu/OdXk5vAFQxv9o7dCXjNSFeUd96mWKknsLFzEtJsmCADvoD7
         /nQyYMufUWF1PzPI0TzqOcrZ9yI0A0spoCWsM5D+d7+nFnE+Fjin/bu5JDZkfNnSuC62
         NV4vbNtc8bLvr7ePsJEEuGA5OP2hbjgbJAbkDfOxuwCZzftdMQn7G9e7lo1mSDjMUxw9
         HvFA==
X-Gm-Message-State: AOJu0YyahjMcW9yxTKIBIc7c4niHoIrmfiLapfv8jILkB+wCsaypzJU/
	ucEU1E2tTP7g7SnMJf3/CC+Osl9OfT3eTDJYdtlG60m9IIbhVHlnjMNOpuk5l+P/ZEc=
X-Gm-Gg: ATEYQzz0Cq+X7uPcscyKFNre6pJUgVr4D0y7YcaA8UuDMGsiGUKeNJcEYR+BSxrv+02
	05IecK60SaeQlfX2cRaq6CHV1raz6/cfcy4aPALmLTtIeVqGqTr1M2Ar9utt8SRA4lzK3I64yhS
	MX2wpzp9GWMOPEeFwK8Im6yRZfuS4cPlf0yzI4IVY0XXqzAYhuFiDyofI1HJ4lMEJ4DabLspNMW
	Qe/DnKx+9qwDL0BN1Uvcn0mCSmMQ/WsuRjIsZHLcNDCPro3vF3zcK/yJw7ONUgyZ7tEQNTJL8mg
	zsqK8j/be/vWM2/nDXQXx+5sXQZ+Vzd/0lEZPDUrBI+kaE2H77l3LYOcm7NgjwX39a3Y+rVP5DS
	ywvtNAcnNckRwfGkQvYy8iIlS2Upikcb2i8adQQKzQ3+FciuRhFYJNBqhj6dus7UzkQ4FO++etp
	Xd+Wq586HSeTYBgHKTQC4vYsVVfKlAgXmf
X-Received: by 2002:a05:600c:4508:b0:485:3949:e5c6 with SMTP id 5b1f17b1804b1-4888355ec76mr66836565e9.3.1775053584032;
        Wed, 01 Apr 2026 07:26:24 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a63c9b1sm2305595e9.5.2026.04.01.07.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:26:23 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 01 Apr 2026 15:25:51 +0100
Subject: [PATCH 3/4] perf arm_spe: Decode Arm N1 IMPDEF events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-james-spe-impdef-decode-v1-3-ad0d372c220c@linaro.org>
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
In-Reply-To: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
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
X-CRM114-CacheID: sfid-20260401_152625_805885_F4921D1C 
X-CRM114-Status: GOOD (  23.81  )
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
 tools/perf/util/arm-spe-decoder/Build              |  2 +
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 45 ++++++++++++++++++++--
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |  5 ++-
 tools/perf/util/arm-spe.c                          | 13 ++++---
 4 files changed, 54 insertions(+), 11 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/Build b/tools/perf/util/arm-spe-decoder/Build
index ab500e0efe24..97a298d1e279 100644
--- a/tools/perf/util/arm-spe-decoder/Build
+++ b/tools/perf/util/arm-spe-decoder/Build
@@ -1 +1,3 @@
 perf-util-y += arm-spe-pkt-decoder.o arm-spe-decoder.o
+
+CFLAGS_arm-spe-pkt-decoder.o += -I$(srctree)/tools/arch/arm64/include/ -I$(OUTPUT)arch/arm64/include/generated/
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index c880b0dec3a1..42a7501d4dfe 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -15,6 +15,8 @@
 
 #include "arm-spe-pkt-decoder.h"
 
+#include "../../arm64/include/asm/cputype.h"
+
 static const char * const arm_spe_packet_name[] = {
 	[ARM_SPE_PAD]		= "PAD",
 	[ARM_SPE_END]		= "END",
@@ -307,6 +309,11 @@ static const struct ev_string common_ev_strings[] = {
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
@@ -318,14 +325,44 @@ static u64 print_event_list(int *err, char **buf, size_t *buf_len,
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
-				  char *buf, size_t buf_len)
+				  char *buf, size_t buf_len, u64 midr)
 {
 	u64 payload = packet->payload;
 	int err = 0;
 
 	arm_spe_pkt_out_string(&err, &buf, &buf_len, "EV");
-	print_event_list(&err, &buf, &buf_len, common_ev_strings, payload);
+	payload = print_event_list(&err, &buf, &buf_len, common_ev_strings,
+				   payload);
+
+	/* Try to decode IMPDEF bits for known CPUs */
+	for (unsigned int i = 0; i < ARRAY_SIZE(event_print_handles); i++) {
+		if (is_midr_in_range_list(midr,
+					  event_print_handles[i].midr_ranges))
+			payload = print_event_list(&err, &buf, &buf_len,
+						   event_print_handles[i].ev_strings,
+						   payload);
+	}
 
 	return err;
 }
@@ -506,7 +543,7 @@ static int arm_spe_pkt_desc_counter(const struct arm_spe_pkt *packet,
 }
 
 int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf,
-		     size_t buf_len)
+		     size_t buf_len, u64 midr)
 {
 	int idx = packet->index;
 	unsigned long long payload = packet->payload;
@@ -522,7 +559,7 @@ int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf,
 		arm_spe_pkt_out_string(&err, &buf, &blen, "%s", name);
 		break;
 	case ARM_SPE_EVENTS:
-		err = arm_spe_pkt_desc_event(packet, buf, buf_len);
+		err = arm_spe_pkt_desc_event(packet, buf, buf_len, midr);
 		break;
 	case ARM_SPE_OP_TYPE:
 		err = arm_spe_pkt_desc_op_type(packet, buf, buf_len);
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
index adf4cde320aa..17b067fe3c87 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
@@ -11,7 +11,7 @@
 #include <stddef.h>
 #include <stdint.h>
 
-#define ARM_SPE_PKT_DESC_MAX		256
+#define ARM_SPE_PKT_DESC_MAX		512
 
 #define ARM_SPE_NEED_MORE_BYTES		-1
 #define ARM_SPE_BAD_PACKET		-2
@@ -186,5 +186,6 @@ const char *arm_spe_pkt_name(enum arm_spe_pkt_type);
 int arm_spe_get_packet(const unsigned char *buf, size_t len,
 		       struct arm_spe_pkt *packet);
 
-int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf, size_t len);
+int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf, size_t len,
+		     u64 midr);
 #endif
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 7447b000f9cd..46f0309c092b 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -135,7 +135,7 @@ struct data_source_handle {
 	}
 
 static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
-			 unsigned char *buf, size_t len)
+			 unsigned char *buf, size_t len, u64 midr)
 {
 	struct arm_spe_pkt packet;
 	size_t pos = 0;
@@ -161,7 +161,7 @@ static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
 			color_fprintf(stdout, color, "   ");
 		if (ret > 0) {
 			ret = arm_spe_pkt_desc(&packet, desc,
-					       ARM_SPE_PKT_DESC_MAX);
+					       ARM_SPE_PKT_DESC_MAX, midr);
 			if (!ret)
 				color_fprintf(stdout, color, " %s\n", desc);
 		} else {
@@ -174,10 +174,10 @@ static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
 }
 
 static void arm_spe_dump_event(struct arm_spe *spe, unsigned char *buf,
-			       size_t len)
+			       size_t len, u64 midr)
 {
 	printf(".\n");
-	arm_spe_dump(spe, buf, len);
+	arm_spe_dump(spe, buf, len, midr);
 }
 
 static int arm_spe_get_trace(struct arm_spe_buffer *b, void *data)
@@ -1469,8 +1469,11 @@ static int arm_spe_process_auxtrace_event(struct perf_session *session,
 		/* Dump here now we have copied a piped trace out of the pipe */
 		if (dump_trace) {
 			if (auxtrace_buffer__get_data(buffer, fd)) {
+				u64 midr = 0;
+
+				arm_spe__get_midr(spe, buffer->cpu.cpu, &midr);
 				arm_spe_dump_event(spe, buffer->data,
-						buffer->size);
+						buffer->size, midr);
 				auxtrace_buffer__put_data(buffer);
 			}
 		}

-- 
2.34.1



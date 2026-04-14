Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C12CF9D0CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+Xe3V/IHAK7tYUKXkEGJ5jpMYrvIkuA0BtXyooehrM=; b=VK2XBOQnhAyjDydVWQbnl7GJ4A
	ASQFbW/Vky3WRh1iTajv+kp0phpjeu2WppgU3D1KGRPPzEEVWCnamhNPsVONmMl7TfuOETCVmlBS+
	NBbszgsIjicn/zmXVbPzRdZjevUIIeRBjEbakR6b3x+K8gflSGLwjodNKojCIk+b16+tEap2ReNB0
	RcyGzFpCVDJR6zUlWzrcx54mW+F6k3ywkXf2OpgIYdZcBcabS2YXPVKj3IAwSrmhZHIY5DiQoTv9q
	/6SAIiaaQcADSy486tDPtXhAdqGYmJTBhSGRyq2Qyxjsm6VvPbgWhNq6SWAcTPKqO7TGDAXnT0Uyt
	VxXJrrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBo-0000000HJx1-10Rq;
	Tue, 14 Apr 2026 12:48:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBi-0000000HJsc-1OBh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 12:48:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so74471165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 05:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776170896; x=1776775696; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+Xe3V/IHAK7tYUKXkEGJ5jpMYrvIkuA0BtXyooehrM=;
        b=Hw4hy1sWbQ1xwm5SE3c5JsKfqsTMPaW9LbaPse4JeVssYPML1cPopaFpC8JVve84WA
         6jkDLO6lvgveODQh2/JoRTNwMRU7VIwxjOHWDU4X/mBwrDFDug6tMTWYMLC8r5DVZo+U
         q+McCzNAhcX9t4tGTWhQTsZV5rK8Z2yPjxOkprmPvUfNXqBc6euje7dJ/e6CzWlDtOrw
         hQYqPWEnImOVFeeP2sgaGXLFnLL9U+Ij4hu9PiizaIoMSM0h4ixdr2iB1rApVxUpBx3Y
         clE7raJJRidY94XCXTrc+OUkiFkDsVywUG88a1L1vBr80PFrWTx81rz8n+C5tQjTKioj
         tRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776170896; x=1776775696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A+Xe3V/IHAK7tYUKXkEGJ5jpMYrvIkuA0BtXyooehrM=;
        b=a+na3+MYu0x1PLeSmJkzx3wxSnTUmeOEH7SFl0Rx19RwLZO2lILaXg5HETldulAoTt
         PVRCVpEahfPuxtfzdMn9uV3I6qcFPJKW/3CldrosXWFEYfa26YwFitiz1TOvD7iTNsfi
         U+em7WVXxuCcD6fiLZEKVv1E4wvnlhJ/K01L6NfnT6LJWGfh+pq3eDQ2DJ2LWjT1wPGI
         E1hXAkle3XVfmZ3UF1xabTs3hqsBGEvVz6fhYK5HQ+hz5K92Vv3/eCvWdYjivbLOCNHS
         9/98O1KeYCl3oGiLpNCtu9QXTcsfgtyAhlmci80bSmnscSpptP+/oWmw3VD6QAydsLV7
         ffHw==
X-Gm-Message-State: AOJu0Yz7pTdMToQ/NxtIKVX+kk8LVyFGQcQF1dwa15e9WBnMIhw5/7i5
	jYJbbde7/7gKvOhoMAq3hlA+xiGeXgcnEIbb/ApNNyejjfn0euY8Pqi2ZQLEYpoT1uc=
X-Gm-Gg: AeBDiesU89t5HpfLo2p83QtxBoScXmxhhQ3tCxbt8gBThWYs7UUhG2f8M+WAaK2Qu3K
	XFu3zVxF4gQAHz+57Wx/yd6W4pTqGJTq+xCc421yr+VecBGlpUYLOkb3IiGRLt7D24Dl0iBF6Q2
	jL0Kw7u4uPGpUq+U0rw3m/jdJot1qcU74EdEGs4C751pbbxMfnr209P0ZycM7j1AKlD1LEVuHBn
	/I5KY8TfeVeN3NS9PcBlZEs8iO8tkQkpIyd8ftAeJpbV26Lvel1vrbYOEsN9SGZuq/CjHlUckSm
	PbBy0sGxYIGQt+PykaOxYO07vQs++J6EjG7xbDo5Phwy05vt6o8kIYv8g+UQN0TFBFACK3xmpBY
	CCuyMVJTj9RBTCy0CNzzpv5Oz2BUTC1LOjYpLaXwpvQt4EF5130JHRZd1EqnXo+zVnAwIQeq0Yq
	jq0n4E1F1UvEr0dh2qGEv25heVIxFgfYgs3QPa5wpe3Dk6pS/0Lm10
X-Received: by 2002:a05:600c:19c8:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-488d68ab2ccmr236905995e9.29.1776170896420;
        Tue, 14 Apr 2026 05:48:16 -0700 (PDT)
Received: from e133063.arm.com ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e05bsm81185285e9.6.2026.04.14.05.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 05:48:15 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 14 Apr 2026 13:48:01 +0100
Subject: [PATCH v4 3/6] perf arm_spe: Store MIDR in arm_spe_pkt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-james-spe-impdef-decode-v4-3-1dd30783a33b@linaro.org>
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
X-CRM114-CacheID: sfid-20260414_054818_471040_09914A23 
X-CRM114-Status: GOOD (  23.40  )
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

The MIDR will affect printing of arm_spe_pkts, so store a copy of it
there. Technically it's constant for each decoder, but there is no
decoder when doing a raw dump, so it has to be stored in every packet.
It will only be used in raw dump mode and not in normal decoding for
now, but to avoid any surprises, set MIDR properly on the decoder too.

Having both the MIDR and the arm_spe_pkt (which has a copy of it) in the
decoder seemed a bit weird, so remove arm_spe_pkt from the decoder. The
packet is only short lived anyway so probably shouldn't have been there
in the first place.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c   | 17 ++++++++++-------
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h   |  3 +--
 .../perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c |  3 ++-
 .../perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h |  3 ++-
 tools/perf/util/arm-spe.c                           | 21 +++++++++++++++------
 5 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 9e02b2bdd1177193996d071dd88f969e25b1ad86..7a3a4815fd37b7f57687189c09c618aaf7ac9801 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -120,7 +120,8 @@ static int arm_spe_get_data(struct arm_spe_decoder *decoder)
 	return decoder->len;
 }
 
-static int arm_spe_get_next_packet(struct arm_spe_decoder *decoder)
+static int arm_spe_get_next_packet(struct arm_spe_decoder *decoder,
+				  struct arm_spe_pkt *packet)
 {
 	int ret;
 
@@ -134,7 +135,8 @@ static int arm_spe_get_next_packet(struct arm_spe_decoder *decoder)
 		}
 
 		ret = arm_spe_get_packet(decoder->buf, decoder->len,
-					 &decoder->packet);
+					 packet, decoder->midr);
+
 		if (ret <= 0) {
 			/* Move forward for 1 byte */
 			decoder->buf += 1;
@@ -144,7 +146,7 @@ static int arm_spe_get_next_packet(struct arm_spe_decoder *decoder)
 
 		decoder->buf += ret;
 		decoder->len -= ret;
-	} while (decoder->packet.type == ARM_SPE_PAD);
+	} while (packet->type == ARM_SPE_PAD);
 
 	return 1;
 }
@@ -154,19 +156,20 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 	int err;
 	int idx;
 	u64 payload, ip;
+	struct arm_spe_pkt packet;
 
 	memset(&decoder->record, 0x0, sizeof(decoder->record));
 	decoder->record.context_id = (u64)-1;
 
 	while (1) {
-		err = arm_spe_get_next_packet(decoder);
+		err = arm_spe_get_next_packet(decoder, &packet);
 		if (err <= 0)
 			return err;
 
-		idx = decoder->packet.index;
-		payload = decoder->packet.payload;
+		idx = packet.index;
+		payload = packet.payload;
 
-		switch (decoder->packet.type) {
+		switch (packet.type) {
 		case ARM_SPE_TIMESTAMP:
 			decoder->record.timestamp = payload;
 			return 1;
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 3310e05122f02e8ef32f79f8ed3c6932cc43eecc..0cbcb501edc9965d34cfd3ede79cab3fd9b318f8 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -147,8 +147,7 @@ struct arm_spe_decoder {
 
 	const unsigned char *buf;
 	size_t len;
-
-	struct arm_spe_pkt packet;
+	u64 midr;
 };
 
 struct arm_spe_decoder *arm_spe_decoder_new(struct arm_spe_params *params);
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 5769ba2f414049161f271fd8b8f40c440d15a75a..718022aecec30bf30a51ba3d2bca9cf6465259a7 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -222,11 +222,12 @@ static int arm_spe_do_get_packet(const unsigned char *buf, size_t len,
 }
 
 int arm_spe_get_packet(const unsigned char *buf, size_t len,
-		       struct arm_spe_pkt *packet)
+		       struct arm_spe_pkt *packet, u64 midr)
 {
 	int ret;
 
 	ret = arm_spe_do_get_packet(buf, len, packet);
+	packet->midr = midr;
 	/* put multiple consecutive PADs on the same line, up to
 	 * the fixed-width output format of 16 bytes per line.
 	 */
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
index adf4cde320aad01265b5232b0d6ff6b1f752f35f..a457821f3bccb67691cfd530de2f1c5bf9d8d50c 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
@@ -35,6 +35,7 @@ struct arm_spe_pkt {
 	enum arm_spe_pkt_type	type;
 	unsigned char		index;
 	uint64_t		payload;
+	uint64_t		midr;
 };
 
 /* Short header (HEADER0) and extended header (HEADER1) */
@@ -184,7 +185,7 @@ enum arm_spe_events {
 const char *arm_spe_pkt_name(enum arm_spe_pkt_type);
 
 int arm_spe_get_packet(const unsigned char *buf, size_t len,
-		       struct arm_spe_pkt *packet);
+		       struct arm_spe_pkt *packet, u64 midr);
 
 int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf, size_t len);
 #endif
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 037c7aa150c1efeda6e8e956a5b1db733e6ea74a..2b31da231ef3ec84a37b5a314ab1fc1151dca907 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -134,8 +134,10 @@ struct data_source_handle {
 		.ds_synth = arm_spe__synth_##func,	\
 	}
 
+static int arm_spe__get_midr(struct arm_spe *spe, int cpu, u64 *midr);
+
 static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
-			 unsigned char *buf, size_t len)
+			 unsigned char *buf, size_t len, u64 midr)
 {
 	struct arm_spe_pkt packet;
 	size_t pos = 0;
@@ -148,7 +150,8 @@ static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
 		      len);
 
 	while (len) {
-		ret = arm_spe_get_packet(buf, len, &packet);
+		ret = arm_spe_get_packet(buf, len, &packet, midr);
+
 		if (ret > 0)
 			pkt_len = ret;
 		else
@@ -174,10 +177,10 @@ static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
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
@@ -302,8 +305,10 @@ static void arm_spe_set_pid_tid_cpu(struct arm_spe *spe,
 
 	if (speq->thread) {
 		speq->pid = thread__pid(speq->thread);
-		if (queue->cpu == -1)
+		if (queue->cpu == -1) {
 			speq->cpu = thread__cpu(speq->thread);
+			arm_spe__get_midr(spe, speq->cpu, &speq->decoder->midr);
+		}
 	}
 }
 
@@ -1248,6 +1253,7 @@ static int arm_spe__setup_queue(struct arm_spe *spe,
 
 	if (queue->cpu != -1)
 		speq->cpu = queue->cpu;
+	arm_spe__get_midr(spe, queue->cpu, &speq->decoder->midr);
 
 	if (!speq->on_heap) {
 		int ret;
@@ -1490,8 +1496,11 @@ static int arm_spe_process_auxtrace_event(struct perf_session *session,
 		/* Dump here now we have copied a piped trace out of the pipe */
 		if (dump_trace) {
 			if (auxtrace_buffer__get_data(buffer, fd)) {
+				u64 midr = 0;
+
+				arm_spe__get_midr(spe, buffer->cpu.cpu, &midr);
 				arm_spe_dump_event(spe, buffer->data,
-						buffer->size);
+						   buffer->size, midr);
 				auxtrace_buffer__put_data(buffer);
 			}
 		}

-- 
2.34.1



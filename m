Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BECBFEEF49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9LL9PwPypWvbniXtyE+RR5RtoAnIbsZcQ38eiczBSY=; b=EfOTWbBneESy6dahecRHnV3+vr
	UKLj4suYFy3pqmrbruNfLUeV83vNJGSdszVtDKSTvawCoMLWqg+dYCprJgVxvZjW1jxodBG5+AtlU
	Cjl6sq7cHfcSmpnQ5FQNKkW5bY20aqOv8wrVuJH9ni5/7jfIrAWYwAcLSPsqjjYpiN7ytM7yBHj30
	d3wDwiiSu1ZJd+LQCiVg7IccbLJrPGEPaZeYuDbTdp70UsiLB5Htt03vTW/TShEc3vNgnT5NVC6pa
	pP+t0cPZnd+4ESL+MHSl+Zz8CMCoKxsVvyWdUnB2IFsiLm5swYURr5e4V9EoJ3uWMPX2gNyVIXzav
	75K25rtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA745-00000006Yxo-2PoX;
	Tue, 07 Apr 2026 14:06:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA742-00000006Yv9-28hS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:05:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4887eca00c4so34574495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775570757; x=1776175557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9LL9PwPypWvbniXtyE+RR5RtoAnIbsZcQ38eiczBSY=;
        b=EK4Uf+MSXuy9Zv2utzRPRu+yNd4fiTsdfSZPp7wBM8Tt72JSKDXjevsQZjqjxA6XgF
         02TLKR97dZPVMVqv4VVESvUuXoNM2pvRfuVawR6Gg5Nw0lpwgUB5lF4SPjcFXAlFpVDO
         NZMMvWaVBB8cyYr7NsNtgRWFifpx4gW+LAcfFirfFYLekv7jZoEZJI0cfa07PS9EnnDI
         XW/LK/jvptC7GxrsUZm+q/BWyZCEtkLwiRKlMESPmqZD8HozS++xeBIibuRkihG9EU2m
         9AAytGXYRR/xgm2/YbwDK8odfsM8O7ZpDgGz0LBeOd+5eLK8iPSR8xPsp7v19aXfBOF+
         trtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570757; x=1776175557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U9LL9PwPypWvbniXtyE+RR5RtoAnIbsZcQ38eiczBSY=;
        b=kHHwVyyVyk0DWg3OY9yHnkjtncJtDjZlqKn1j2AbkjIVnpr5LMuoyRDcatQNCXPeoF
         LDoyvGpJ8wuDapnw3zsWy/TriXwLCucEIJ8seShDhXODpUqA0up0ecHNynsT39Btme71
         eaw2kbaO6S8T1Y4sJ/WuI9u36H9YtEYFTS7hjDI9aOlYq/09q1hV37HwFOud+7Ve2Maf
         1+4FeZALta8kfHkxxdXIGbsiArv+Er2Iug54OfjN2e3Qv5fb7cU6urOLc7NEdere02jW
         z9Eyj/tFOH6SQ083sJWbA+iXLpxhiPC5Oli78v7ux8o3ba5HriBy5NtkfWgOamFa1aX7
         SA/Q==
X-Gm-Message-State: AOJu0YxBlqSrjr91v5I6UhaqH0hsiU/0jwCNehgXs7eMWx6hnQ8g9PD/
	OZO7KpcCR8d6hzu1bgblhDKylm0iXOss34pddcWK+Voce7P4XIfxbbZnw2NR62lzT7A=
X-Gm-Gg: AeBDiesss+TMOPj0o7L365tMD5TxYJtqsEoCxPuvC4+VDzeZuXts6euF6dJU4u85rZ3
	90gw9S+xoWkchSQ8lyDA2RPiaZbca7N/ZX77vDLnDy6QvFG2UpCqrwydDFDhDk7ZiHXR2IRCx1v
	GhY/7gTXXyODHIgJpvgiiid8mCbdKqu4IaF7ijW2TOKx1ZqH0PZ8GuUq9uyShvWhqx6jvOqhUwM
	13F8wzGuVuXhB3n2n+akH96ys2mhYccKPmMAg7kHWe76fvsuzgRgeH8kWfQah6ZIxzq15WW+XiG
	y7XB2Q7atgNP1zRhYWklpzyzkm2fOpYCM6W3xjbIdPenf05k16PyItg/vH4OXgcLt4YYAt6mnxz
	Qs/Jn2Gt4pcB1Q+wGmBWXUkrG+xN4resAczaqtcU+P1t3DSUdBGTA2I6PN1gbl6oTrJLlbXct5h
	No2zfA9u7We8Vs6vKzCZLqjpehEkTWIhLX
X-Received: by 2002:a05:600c:64c7:b0:488:a8f0:35bd with SMTP id 5b1f17b1804b1-488a8f037c4mr188433225e9.8.1775570756530;
        Tue, 07 Apr 2026 07:05:56 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm626876145e9.4.2026.04.07.07.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:05:56 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 07 Apr 2026 15:05:17 +0100
Subject: [PATCH v2 3/6] perf arm_spe: Store MIDR in arm_spe_pkt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-james-spe-impdef-decode-v2-3-55d3ef997c48@linaro.org>
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
X-CRM114-CacheID: sfid-20260407_070558_601360_F684317D 
X-CRM114-Status: GOOD (  23.83  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c   | 17 ++++++++++-------
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h   |  3 +--
 .../perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c |  3 ++-
 .../perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h |  3 ++-
 tools/perf/util/arm-spe.c                           | 21 +++++++++++++++------
 5 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 9e02b2bdd117..7a3a4815fd37 100644
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
index 3310e05122f0..0cbcb501edc9 100644
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
index 5769ba2f4140..718022aecec3 100644
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
index adf4cde320aa..a457821f3bcc 100644
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
index fc11f32e4911..7fb33fe27693 100644
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
 
@@ -1234,6 +1239,7 @@ static int arm_spe__setup_queue(struct arm_spe *spe,
 
 	if (queue->cpu != -1)
 		speq->cpu = queue->cpu;
+	arm_spe__get_midr(spe, queue->cpu, &speq->decoder->midr);
 
 	if (!speq->on_heap) {
 		int ret;
@@ -1476,8 +1482,11 @@ static int arm_spe_process_auxtrace_event(struct perf_session *session,
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



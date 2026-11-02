Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999AD606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1f+c8zba;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wyLlA+kJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5E7haAucu6qfiv2l5VpOzqA9ji1qzQ0GwblIaMBQnLU=; b=1f+c8zbavBqUlE
	ekOyIdXDwUOSl+40AUPdPAORpJJJ77/zazgxoaumkZ12UTcKEqxPifY1xxk6Ej6+MIiHIWi+jdcEY
	sUcBxNL9dYhn8K4GBI+kNkPytSXuYfUbSM9kJ9Xz+yEdasYRHVRN5BWZgY0mxPY/FZpeBMqFdOJlO
	iKjBYWyrrtn22I0E8ejyyWNF3bv4G/tQXGHEqJ7bPZDW2OLTEIqNBavfW3PGJCfHTHEvs1VpyHOOo
	BjEa1ezYkyzLljhHkQHBek//WHSdQEcN2ReQRji0swKAGe+BappaAMJsoEVENB/XNFRfWxMD0hCWC
	Y8J+KziQ1C40v7QkE11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxN-0000000GQov-0VJt;
	Mon, 02 Nov 2026 12:16:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxG-0000000GQYw-09mV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:16:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so18448805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621760; x=1794226560; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5E7haAucu6qfiv2l5VpOzqA9ji1qzQ0GwblIaMBQnLU=;
        b=wyLlA+kJExg6MuFEAii1gGJRpeJM8hWa0QSmzOhqE7aFa/o/Ul511Y1EKaMf7ue9ZC
         XwEWG91ekODkK/U/UQy0zoApmDhoAwTRqufGYrKGqcIT7aru0Lhx45qN4e5pZti4K6SF
         j8qRjlgzUjTNaP8NO20OS7mDNClAbeN51EMjVnt6arpAxZdfQdjOYKtqWewPryBOkpBn
         oa8l/ttDic6rosDE3dFdPiDWnBM7A3JLinKKdXNEpUrmF8aaTgZRqjomyScmXTs2yuqE
         9Q7IRiyPdnLCA07LMGUrAYJcSkrBnrE+4MO27b1OHR0oZilWnleBAztddG15o7peRq/t
         fW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621760; x=1794226560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5E7haAucu6qfiv2l5VpOzqA9ji1qzQ0GwblIaMBQnLU=;
        b=aht0DN0BB1PsU1RdpPa3GZZKTvY5Nk1gwQUWrT7Yp+iFkNlsI4mhL0CLf/K1uqT2Ed
         1cTGfERCkpUJoNxXupQTElONRV+J5hNDbWKVE10BLY2LR7bMHQC+ldJwghkFtDo00lcA
         4MGgOEjQ+LJ9I2Fu7NEsS+0C3yaFo3l6pZ0VgB1tnHxOqyVKmFYdR+Ov5LUNIKQNgkLJ
         EaIffXWB0wRpeZbWKCiiY3F1JoeAWudis6TEXVUrgcBwGPFEqQKnTs6Kr75EYS3hCFVy
         tMqhvXh5eYrNegvMoTusKO21XNeZYC13JrM7/XxYmUOaYFjXYtaq+9lWvqOksGK1RkEw
         OerQ==
X-Forwarded-Encrypted: i=1; AKwUvBymdVbZVvIgFAycpVs1HeMbo7dNhldEPuwq+nE7x83ZtUsmf6T7AmwGAAGIcbzBfMYrq0WwO9wfbrWu23XIqmXm@lists.infradead.org
X-Gm-Message-State: APuU4Z8fVrniPTNnqG22cKuIYd22mwNpdKOSPimfAQlh9PPsCFr0UDSk
	O89uG3heOSKnKd7ZgH3FaZs9ghx32bresyk6HxtCTTF6SojYBFi2yeU5Q9l/chUZsfk=
X-Gm-Gg: AYBFou0zU2CRzGlvA6NGJygQrcMlVkYLrKfNoFezLGppyaGKqtRzCpMXlyhAlesG2Xu
	1zKSW2ru71KK+LVHjUyDb/XOfeGNiwkBPjGWE5sNM/J2gGEqD2KgVtquHKO31SiQJne/WCzzPCj
	E6/TBovLmycEaKeIXR1D74n+I2CW+C/pK/GOWjj+b9+guFGvDDbAGHOv3w6U0VoSPk1NniQYG+P
	yx7v39Z7KzEuDx2pI8K0cIP9koh5GoGG0fumPA5xnBZVUR4B/I/DL3m4YBfioofW9YWrxrEhnE4
	PirzTUouwr84TQJlD7gMFiKTieluVee8HkT0MmcV0ctARlKq4ABK6OqR4JH3Y00VxxHO4LljwYl
	oP/z+c0Ysg2xa2jbUQO7w6FhFzh98iSeWJ+A4o64ApYMCD3rkjMni6nY4wXp7hvl3ZldTHPoy7d
	YbtPJqayphCjO9LwH0SkV4NvpPSz+vF31t4W4rPgFha5DVrm6cOc8IKsxQUX00Zb/H1zt4B6NmA
	x+lyx+hgLzfy9WxALWNLSQvsfpOVxii4UcS1WjdeAl0nX+vJUvOxX4uIJkPsUpzW0/u7piuVZYF
	NF0OPisr4DhIRkU//G26Cb6ggSHvLkZq
X-Received: by 2002:a05:600c:1d1c:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4ac1709a1f5mr235402515e9.12.1793621760385;
        Mon, 02 Nov 2026 04:16:00 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:59 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:27 +0000
Subject: [PATCH v3 13/18] perf cs-etm: Queue partial AUX records
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-13-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_041602_126700_A666CB11 
X-CRM114-Status: GOOD (  21.52  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In snapshot mode AUX records may straddle the boundary of multiple trace
buffers. Currently we only queue AUX records whose range is contained
wholly within a single buffer.

Fix it by queuing any partial AUX range that overlaps any buffer.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 54 +++++++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index f19aa4f787fa..e899d82b7c93 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3238,7 +3238,8 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 	union perf_event *auxtrace_event_union;
 	struct perf_record_auxtrace *auxtrace_event;
 	union perf_event auxtrace_fragment;
-	__u64 aux_offset, aux_size;
+	__u64 aux_start, aux_end, auxtrace_start, auxtrace_end;
+	__u64 frag_start, frag_end, frag_size;
 	enum cs_etm_format format;
 
 	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
@@ -3286,25 +3287,23 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 	}
 
 	if (aux_event->flags & PERF_AUX_FLAG_OVERWRITE) {
-		/*
-		 * Clamp size in snapshot mode. The buffer size is clamped in
-		 * __auxtrace_mmap__read() for snapshots, so the aux record size doesn't reflect
-		 * the buffer size.
-		 */
-		aux_size = min(aux_event->aux_size, auxtrace_event->size);
-
 		/*
 		 * In this mode, the head also points to the end of the buffer so aux_offset
 		 * needs to have the size subtracted so it points to the beginning as in normal mode
 		 */
-		aux_offset = aux_event->aux_offset - aux_size;
+		aux_start = aux_event->aux_offset - aux_event->aux_size;
+		aux_end = aux_event->aux_offset;
 	} else {
-		aux_size = aux_event->aux_size;
-		aux_offset = aux_event->aux_offset;
+		aux_start = aux_event->aux_offset;
+		aux_end = aux_event->aux_offset + aux_event->aux_size;
 	}
 
-	if (aux_offset >= auxtrace_event->offset &&
-	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
+	auxtrace_start = auxtrace_event->offset;
+	auxtrace_end = auxtrace_start + auxtrace_event->size;
+	frag_start = max(aux_start, auxtrace_start);
+	frag_end = min(aux_end, auxtrace_end);
+
+	if (frag_start < frag_end) {
 		/* Old per-thread files have no CPU (before v6.4) */
 		int queue_idx = sample->cpu == (u32)-1 ? 0 : sample->cpu;
 		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, queue_idx);
@@ -3313,18 +3312,19 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 			return -EINVAL;
 
 		/*
-		 * If this AUX event was inside this buffer somewhere, create a new auxtrace event
-		 * based on the sizes of the aux event, and queue that fragment.
+		 * If this AUX event overlaps this buffer, create a new auxtrace event
+		 * for the overlapping range and queue that fragment.
 		 */
+		frag_size = frag_end - frag_start;
 		auxtrace_fragment.auxtrace = *auxtrace_event;
-		auxtrace_fragment.auxtrace.size = aux_size;
-		auxtrace_fragment.auxtrace.offset = aux_offset;
+		auxtrace_fragment.auxtrace.size = frag_size;
+		auxtrace_fragment.auxtrace.offset = frag_start;
 		auxtrace_fragment.auxtrace.idx = etmq->queue_nr;
 		auxtrace_fragment.auxtrace.cpu = etmq->queue_nr;
-		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
+		file_offset += frag_start - auxtrace_start + auxtrace_event->header.size;
 
 		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64
-			  " tid: %d cpu: %d\n", aux_size, aux_offset, sample->tid, sample->cpu);
+			  " tid: %d cpu: %d\n", frag_size, frag_start, sample->tid, sample->cpu);
 		err = auxtrace_queues__add_event(&etm->queues, session, &auxtrace_fragment,
 						 file_offset, NULL);
 		if (err)
@@ -3364,6 +3364,7 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	struct auxtrace_index *auxtrace_index;
 	struct evsel *evsel;
 	size_t i;
+	bool found = false;
 
 	/* Don't care about any other events, we're only queuing buffers for AUX events */
 	if (event->header.type != PERF_RECORD_AUX)
@@ -3397,11 +3398,14 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 			ret = cs_etm__queue_aux_fragment(session, ent->file_offset,
 							 ent->sz, &event->aux, &sample);
 			/*
-			 * Stop search on error or successful values. Continue search on
-			 * 1 ('not found')
+			 * Stop search on error values. Continue search on
+			 * 1 ('not found') or 0 ('queued')
 			 */
-			if (ret != 1)
+			if (ret < 0)
 				goto out;
+
+			if (!ret)
+				found = true;
 		}
 	}
 
@@ -3409,8 +3413,10 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	 * Couldn't find the buffer corresponding to this aux record, something went wrong. Warn but
 	 * don't exit with an error because it will still be possible to decode other aux records.
 	 */
-	pr_err("CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
-	       " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
+	if (!found) {
+		pr_err("CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
+		       " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
+	}
 	ret = 0;
 out:
 	perf_sample__exit(&sample);

-- 
2.43.0



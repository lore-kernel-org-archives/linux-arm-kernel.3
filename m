Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66D4C5DF92
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIEqHB2kupPj+LJwStZlpRLPHkBGU+WfDNFf0olHiVQ=; b=DppRGwZpMj5OZr1Yr4N8jt4jJY
	ZDjt/8JZiJbhZRUvpm7tcX7GVYau6ZEbknKlxPasdTUoVQb0/WLhHd8YSNTJO+YFtlyEXj2yDtMJO
	71NeCUodY6mpO+pvbrnESGVxDdVFr2ZT4hP2RLABZK6Ieebvn4/VmVD0ARfNZcUInDvb/tx4ZuGbL
	+eUmvPvIzCLP0JhFgyClUXP+/2Nwl7dHuoUA06RyM4g7HqOUpS8oDK/+6NUnzNiwk8WfMsZYBM06J
	mwaViRDpw5/M7QOAbF3MHusINV6uiz/XepjBJvC2didETXVeR/UhEYQ4k499yoEdbHtNYAVlJuEl8
	6f34xu9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLtD-0000000CxcY-2kPH;
	Fri, 21 Aug 2026 09:50:19 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsc-0000000Cx2M-2MZX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47de008b020so413670f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305781; x=1787910581; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIEqHB2kupPj+LJwStZlpRLPHkBGU+WfDNFf0olHiVQ=;
        b=LS6XNjAS2sV5VMICTJk2oCsJWngLIctqwmq9hB5hz59HaIyJpaFpo44FFhlImfSU7D
         INe6IAmWaltA45Qevudykc9J09prvJ2Abo42FfXXqqYvqVVWy4wQdSRIp4u3NLsopJNO
         0oshUc+i1P7ALB+kDRzMmcutdQI1Jz6yHvyX2VauxJo5Fs5z4J5AMTepTPVYLxZK/up1
         7qAl9XHFwkWPwo7W5AcQxQ+5pfhuH4SOP6pM15JMUWBgdeQx9cl6EwZe7u8VdVsgg0/q
         LdNDZbL0xwZzDXLUc81AVjFHOlruWcHWgXdVGDTMPDgmp+6sVavigf8vJfIuz2SDNiTp
         Q+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305781; x=1787910581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIEqHB2kupPj+LJwStZlpRLPHkBGU+WfDNFf0olHiVQ=;
        b=mAhSOgLfbAFhKB/Hd0ucVBzu/c6hTKAWmkb9AxOeM2BRpb25OOnjUATwy71DCMuW9P
         q+3cmJnu3RBfROKt45QVWZQ3n7uiRGECE3leKPpk0L+8h0chHDPfS/xx9c2SR8iuYb0k
         wkLNAPKRjoS529Tr9l3Do42xmVBvIMrUQPmfTfUMAqcoE44JlUAcv1HzaPpHw9Jm34Tf
         4SqDamflY2RHhzmqMw3GU+brfx2ZUCUIDinya7BReooB78JhziTAMUZ7+mtPK95M3iij
         Hr/m+ZHqHHyQZp2CyZps/AZvmRyHAo8fb+9IlpyBvC+pKcaj864xvWnYXyV/I7rtONdx
         RhsA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6tbsAE2YJ5eUDEhQeDjQDzE9ZR9wQPi1lMdiD8ATnJtmhOMEsRj5gMdkdh8agYNs4kEaXsF2sJhAMgOynP8w8@lists.infradead.org
X-Gm-Message-State: AFuF++kNefiJD4LC3HnHyLhr7ODBpGYHDIsJlMRC+8CSW9wIZyAA8oXa
	/vDJ3F80b1pl4xI+cijTUWz5zUQaHPpdV/OYFcY29ncMF0u0r4xf9X2mviiCSO7xbv4=
X-Gm-Gg: AR+sD11keYHl6J2bJ5AleDvVPxEGIRcnA9XLKk1dE+M1dmhGwEotsYSzH3zm/jU/4sZ
	eE2HOkIK9/EQN9hZXt4iSY4RXYpSBLGwDIFnzco3v9FUErRAf5YodhzhAa5a2TIVi53lD1YT3IR
	nXEXCTOuVp43hKjaeYN2+tvwxOClitlQlUIsDaggnbdaHu3pnp1sYUIOzRjpB6GR0kBsofA/NaE
	FbeQw+GNp1e00iV+kFPmMvzGO/vpnBUUQ/aUXJinvDklMM5ZjYaLaVBxSFBVuzPtgFwP1uN5+25
	y+Dk9leGFEttAvSzZTIMAx0gw7Z04x1shN9Ylc9D1msxyCmm3RphpLATZ+hW+a8lIE/0RrhpIhr
	XntAJuE/G77pIgqc/dHPLZJ9XUJC4UdKfGaFD2N6GTOxiBfO0k+EA6s7qbtRBzcs51YoqfMG659
	cR8D3XKnXx0OhmyUh5AlzlhDI8fZoHkPuPm72DALkv0RuHc/qwxIszRBu8X2O3m1ho
X-Received: by 2002:a5d:6f06:0:b0:475:da0e:744d with SMTP id ffacd0b85a97d-482c117267emr5590675f8f.8.1787305780785;
        Fri, 21 Aug 2026 02:49:40 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:09 +0100
Subject: [PATCH v2 11/14] perf auxtrace: cs-etm: Capture wrapped snapshots
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-11-00c4fd0701b4@linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_024942_648659_A4534FB4 
X-CRM114-Status: GOOD (  24.21  )
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

snapshot_has_wrapped() isn't implemented for Coresight, so when a wrap
occurs we only save from offset 0 to current head, modulo buffer size,
rather than capturing the whole buffer. Coresight drivers currently use
a monotonic head pointer even in snapshot mode, which gives a lot more
information for taking snapshots than a wrapped pointer. It means we
don't need to search for data at the end of the buffer to guess if a
wrap has occurred, and we can go back to saving partial buffers after a
wrap by checking if the next size to take is less than the buffer
size.

The drivers will always be able to generate a monotonic head because
TRBE has a bytes written counter, so even if we stop generating an AUX
record on every overflow, we can check if the counter indicated an
overwrite and offset head by a whole buffer size if it wrapped. This
forces userspace to read the whole buffer rather than between last and
current head. ETR and other sinks use software double buffering, so can
continue as they are.

Add a much simpler 'monotonic_snapshot_head' path for tracers to use,
and use it for Coresight.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c                  |  1 +
 .../perf/tests/shell/coresight/raw_dump_stress.sh  |  5 -----
 tools/perf/util/auxtrace.c                         | 22 ++++++++++++++++------
 tools/perf/util/auxtrace.h                         |  2 ++
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d36b7e41399b..dbf76dd3349e 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -918,6 +918,7 @@ struct auxtrace_record *cs_etm_record_init(int *err)
 	ptr->itr.info_fill		= cs_etm_info_fill;
 	ptr->itr.snapshot_start		= cs_etm_snapshot_start;
 	ptr->itr.snapshot_finish	= cs_etm_snapshot_finish;
+	ptr->itr.monotonic_snapshot_head = true;
 	ptr->itr.reference		= cs_etm_reference;
 	ptr->itr.free			= cs_etm_recording_free;
 	ptr->itr.read_finish		= auxtrace_record__read_finish;
diff --git a/tools/perf/tests/shell/coresight/raw_dump_stress.sh b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
index bea70d825596..c9459ded4cbe 100755
--- a/tools/perf/tests/shell/coresight/raw_dump_stress.sh
+++ b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
@@ -48,11 +48,6 @@ read -r size offset last_idx <<< "$(awk '
 # everything was dumped. Allow 48 bytes difference to cover 3 frames: current
 # frame length, a partial frame and a final empty one, all of which aren't
 # dumped.
-#
-# TODO: for a single snapshot, offset should always be zero. However, we
-# currently output AUX records in snapshot mode when we shouldn't, which
-# increments the offset. Allow for that until it's fixed so we can test raw
-# dumping.
 decode_size=$((1 + last_idx - offset))
 if [ "$decode_size" -gt "$((size - 48))" ] && [ "$decode_size" -le "$((size))" ]; then
 	echo "PASS: AUXTRACE buffer length matches dumped packet index"
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 8ca872e6d465..e3c770b46e94 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -2051,9 +2051,9 @@ static int __auxtrace_mmap__read(struct mmap *map,
 				 bool snapshot, size_t snapshot_size)
 {
 	struct auxtrace_mmap *mm = &map->auxtrace_mmap;
-	u64 head, old = mm->prev, offset, ref;
+	u64 head, old = mm->prev, offset, ref, size;
 	unsigned char *data = mm->base;
-	size_t size, head_off, old_off, len1, len2, padding;
+	size_t head_off, old_off, len1, len2, padding;
 	union perf_event ev;
 	void *data1, *data2;
 	int kernel_is_64_bit = perf_env__kernel_is_64_bit(env);
@@ -2061,10 +2061,20 @@ static int __auxtrace_mmap__read(struct mmap *map,
 
 	head = auxtrace_mmap__read_head(mm, kernel_is_64_bit);
 
-	if (snapshot && itr->snapshot_has_wrapped) {
-		err = auxtrace_find_snapshot(itr, mm->idx, mm, data, &head, &old);
-		if (err)
-			return err;
+	if (snapshot) {
+		if (itr->snapshot_has_wrapped) {
+			err = auxtrace_find_snapshot(itr, mm->idx, mm, data, &head, &old);
+			if (err)
+				return err;
+		} else if (itr->monotonic_snapshot_head) {
+			size = head - old;
+			/* Force a full buffer read if a wrap has occurred */
+			if (size > mm->len) {
+				pr_debug3("%s: wrap detected, adjusting old from 0x%"PRIx64" to 0x%"PRIx64"\n",
+					  __func__, old, head - mm->len);
+				old = head - mm->len;
+			}
+		}
 	}
 
 	if (old == head)
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index a9d0c84184c5..971b817d3396 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -385,6 +385,7 @@ struct auxtrace_mmap_params {
  * @evlist: selected events list
  * @snapshot_wrapped_len: number of bits in @snapshot_wrapped
  * @snapshot_wrapped: bitmap indicating if each aux buffer has wrapped
+ * @monotonic_snapshot_head: driver doesn't wrap head pointer on overflow
  */
 struct auxtrace_record {
 	int (*recording_options)(struct auxtrace_record *itr,
@@ -412,6 +413,7 @@ struct auxtrace_record {
 	int snapshot_wrapped_len;
 	unsigned long *snapshot_wrapped;
 	int snapshot_search_bytes;
+	bool monotonic_snapshot_head;
 };
 
 /**

-- 
2.43.0



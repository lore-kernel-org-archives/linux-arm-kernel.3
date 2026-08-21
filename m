Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419E2C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqfzZM8zBnaNvy70ESgvPXpjemsAbMaxUvbbfAWEGvA=; b=kHYT0/RG9uTHSt7pByzivz0K/R
	AakqIOdlozWbAhM+pvx7IbCxFAsU6t33D90T4bJOdTWNB2ZXpS/LWBx3vewCZlgSfLesE3OK5Gne8
	iF01KBdNiRyieLimuOI0FBgc/zUH7a/IAB1sner+vbJk12s6UWy3D9XbKHbj6mEqn34XZosYEHke9
	I5+eVBIAN+xtgRGllSyxzr8RiG0V4lLSnfq0679wiUVcfdhWpAxoyW2UwCC7LfMeQx7KXrsqdJKeu
	eIduhLGJdOP64KiWccYrTJywlJeo4etDf+SWxMJ8LB75f1NjbvEyDOBTVL1jzXgzMVL4HW/WuwBMw
	AatuX4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLse-0000000Cx6O-0buz;
	Fri, 21 Aug 2026 09:49:44 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsX-0000000Cx0m-3t28
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:39 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47fd4531020so473052f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305776; x=1787910576; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BqfzZM8zBnaNvy70ESgvPXpjemsAbMaxUvbbfAWEGvA=;
        b=NySN60L+V2MAqwK6DGQMMp/3ruguzojHSLtoDjMpg3PUHuFJZjBcuQO22L1YXzaRII
         g6BYHkLygWi1fKOMv/v0SeBIdK5/5204rSDhrDC1bD4yw/qOB90ssP79A+KbW8ahM3KP
         6dFNBhHZ/rzV+gHSF5dseQrJQ49ttuHiMvUx8cQOqYguFT5c4OlXt7GJwIgJxyzWVUsx
         ZixQ9ZxYQcA2ObgDxTF43PjYPejBGr7Ef5iJSKj575q6JSEAYO31yTQ75fN7hAx8eoU2
         a/D9ouFM+dSyLp5KpzZqRLXpqJaZyXY7R98U/hBSX1cSEbYvBGd006cFfL5SGHR/F0rJ
         cmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305776; x=1787910576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BqfzZM8zBnaNvy70ESgvPXpjemsAbMaxUvbbfAWEGvA=;
        b=ckO7QjYztDDLkRBPorTIR99sGQaePz/54npnNKDpEruiW5JmEuNtpF2iBGQbFFpZSP
         oWkMWO57hqhA5T676qc0Yp/FNPlkwJRAOzslxHVTUHEIKYkwvGz+/hwoa4jZExmuRtgt
         zXcIGwZldjrGa/NlsBURgpKAdy4gfhz1+Larhd9M+gQGOaT6HUWxPmDyNk4abcRCDgmo
         aqX9yepU4AAHQjK638BVegxKLSrG8orzaOnlCVWMUQ3JCx34/rOJp2KZBLjPQu2i0nds
         amK5AaLWuE2OHD/7Vnc4u/A+t0vLDeO5QJbVdpYprgOb5qDehfjUp9GWXNyM6SYHJ/TN
         Fb5w==
X-Forwarded-Encrypted: i=1; AHgh+RrkvxG3bkb8busbLfDH7L7Xqaqm/slhk4UhEuYDRUugc0iN5sj5421N8MmDrQPSEhBISr5DU/xgPq2QNxxzrWZY@lists.infradead.org
X-Gm-Message-State: AFuF++nUQOejAKzZCY9v4ejIUYHT+xpUnH2qp9gRsMqxxbyQyxcMWgkW
	RSBcjBDh4gfQ5UStmLNSF9n3yLzzN610N+ST4C5HikHr1dGcbeW9o+XTzYxUPMMNYDA=
X-Gm-Gg: AR+sD11yP3Hf/LpfL0hiepeRYGRlcFTj7v61Ui6BcqRZEwrwUupwl6zkUrnY8bF4wvf
	Mqfq3SA98IAIr6L3y1DhITTmDkFhSUVDWzTU6MUnCnG33gO3CQ7ZuXOgCXFrJgWdNyDsQ4G+y0u
	ONRyOxFelbW0PdHfJbeJuQ6/TzE3Jlp83EbVHL1Yapxgdp2ENk+h1OvRsbnjV0zUklhsVDUs21P
	MkySVXKrLMCuqYpO5GBs+ZHVno+PGponF2ATPhmQQFhIuJB3ozn+lyy+l9n5CLCegrmcR4mAyJA
	j47luZB58Di075IvRolEXZuEAyXVrfemL2Cdv89ifwZA2/BXlPr1aREiMzo24GLXTBtUQZIMIir
	wGnK/5t+ThQc3srg5JIUWs6oTGE4YeHlzGvlpEpIzGvmvTl2GDInH5foOUM2yZWxGEEAvbCOL18
	tHY4Vym3mii/zJ1c1YRcP5ZHu24HzpxlKJUrU0TF3Zc1UxEC8awFNlC+lh7MJ5ICNB
X-Received: by 2002:a05:6000:40d9:b0:47f:f43e:f0cd with SMTP id ffacd0b85a97d-482c0b4230fmr7267629f8f.4.1787305776005;
        Fri, 21 Aug 2026 02:49:36 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:35 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:06 +0100
Subject: [PATCH v2 08/14] perf auxtrace: intel-pt: Use new
 snapshot_has_wrapped callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-8-00c4fd0701b4@linaro.org>
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
X-CRM114-CacheID: sfid-20260821_024938_010384_05559D4F 
X-CRM114-Status: GOOD (  18.78  )
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

The new callback is only for the search, and auxtrace.c fixes up the
pointers after a wrap is found. Update Intel PT to use the new callback
and finish removal of the old one now that there are no more users.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/x86/util/intel-pt.c | 58 ++++++++++---------------------------
 tools/perf/util/auxtrace.c          | 14 +++------
 tools/perf/util/auxtrace.h          |  7 -----
 3 files changed, 19 insertions(+), 60 deletions(-)

diff --git a/tools/perf/arch/x86/util/intel-pt.c b/tools/perf/arch/x86/util/intel-pt.c
index a533114c0048..b8de129a218e 100644
--- a/tools/perf/arch/x86/util/intel-pt.c
+++ b/tools/perf/arch/x86/util/intel-pt.c
@@ -1080,17 +1080,17 @@ static void intel_pt_copy_ref(void *ref_buf, size_t ref_size, size_t buf_size,
 }
 
 static bool intel_pt_wrapped(struct intel_pt_recording *ptr, int idx,
-			     struct auxtrace_mmap *mm, unsigned char *data,
+			     size_t size, unsigned char *data,
 			     u64 head)
 {
 	struct intel_pt_snapshot_ref *ref = &ptr->snapshot_refs[idx];
 	bool wrapped;
 
 	wrapped = intel_pt_compare_ref(ref->ref_buf, ref->ref_offset,
-				       ptr->snapshot_ref_buf_size, mm->len,
+				       ptr->snapshot_ref_buf_size, size,
 				       data, head);
 
-	intel_pt_copy_ref(ref->ref_buf, ptr->snapshot_ref_buf_size, mm->len,
+	intel_pt_copy_ref(ref->ref_buf, ptr->snapshot_ref_buf_size, size,
 			  data, head);
 
 	return wrapped;
@@ -1113,69 +1113,41 @@ static bool intel_pt_first_wrap(u64 *data, size_t buf_size)
 	return false;
 }
 
-static int intel_pt_find_snapshot(struct auxtrace_record *itr, int idx,
-				  struct auxtrace_mmap *mm, unsigned char *data,
-				  u64 *head, u64 *old)
+static int intel_pt_snapshot_has_wrapped(struct auxtrace_record *itr, int idx,
+					 unsigned char *data, size_t size,
+					 u64 head)
 {
 	struct intel_pt_recording *ptr =
 			container_of(itr, struct intel_pt_recording, itr);
 	bool wrapped;
 	int err;
 
-	pr_debug3("%s: mmap index %d old head %zu new head %zu\n",
-		  __func__, idx, (size_t)*old, (size_t)*head);
-
-	err = intel_pt_snapshot_init(ptr, mm->len);
+	err = intel_pt_snapshot_init(ptr, size);
 	if (err)
-		goto out_err;
+		return err;
 
 	if (idx >= ptr->snapshot_ref_cnt) {
 		err = intel_pt_alloc_snapshot_refs(ptr, idx);
 		if (err)
-			goto out_err;
+			return err;
 	}
 
 	if (ptr->snapshot_ref_buf_size) {
 		if (!ptr->snapshot_refs[idx].ref_buf) {
-			err = intel_pt_alloc_snapshot_ref(ptr, idx, mm->len);
+			err = intel_pt_alloc_snapshot_ref(ptr, idx, size);
 			if (err)
-				goto out_err;
+				return err;
 		}
-		wrapped = intel_pt_wrapped(ptr, idx, mm, data, *head);
+		wrapped = intel_pt_wrapped(ptr, idx, size, data, head);
 	} else {
 		wrapped = ptr->snapshot_refs[idx].wrapped;
-		if (!wrapped && intel_pt_first_wrap((u64 *)data, mm->len)) {
+		if (!wrapped && intel_pt_first_wrap((u64 *)data, size)) {
 			ptr->snapshot_refs[idx].wrapped = true;
 			wrapped = true;
 		}
 	}
 
-	/*
-	 * In full trace mode 'head' continually increases.  However in snapshot
-	 * mode 'head' is an offset within the buffer.  Here 'old' and 'head'
-	 * are adjusted to match the full trace case which expects that 'old' is
-	 * always less than 'head'.
-	 */
-	if (wrapped) {
-		*old = *head;
-		*head += mm->len;
-	} else {
-		if (mm->mask)
-			*old &= mm->mask;
-		else
-			*old %= mm->len;
-		if (*old > *head)
-			*head += mm->len;
-	}
-
-	pr_debug3("%s: wrap-around %sdetected, adjusted old head %zu adjusted new head %zu\n",
-		  __func__, wrapped ? "" : "not ", (size_t)*old, (size_t)*head);
-
-	return 0;
-
-out_err:
-	pr_err("%s: failed, error %d\n", __func__, err);
-	return err;
+	return wrapped;
 }
 
 static u64 intel_pt_reference(struct auxtrace_record *itr __maybe_unused)
@@ -1221,7 +1193,7 @@ struct auxtrace_record *intel_pt_recording_init(int *err)
 	ptr->itr.free = intel_pt_recording_free;
 	ptr->itr.snapshot_start = intel_pt_snapshot_start;
 	ptr->itr.snapshot_finish = intel_pt_snapshot_finish;
-	ptr->itr.find_snapshot = intel_pt_find_snapshot;
+	ptr->itr.snapshot_has_wrapped = intel_pt_snapshot_has_wrapped;
 	ptr->itr.parse_snapshot_options = intel_pt_parse_snapshot_options;
 	ptr->itr.reference = intel_pt_reference;
 	ptr->itr.read_finish = auxtrace_record__read_finish;
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 9586989e645e..8ca872e6d465 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -2061,16 +2061,10 @@ static int __auxtrace_mmap__read(struct mmap *map,
 
 	head = auxtrace_mmap__read_head(mm, kernel_is_64_bit);
 
-	if (snapshot) {
-		if (itr->find_snapshot) {
-			err = itr->find_snapshot(itr, mm->idx, mm, data, &head, &old);
-			if (err)
-				return err;
-		} else if (itr->snapshot_has_wrapped) {
-			err = auxtrace_find_snapshot(itr, mm->idx, mm, data, &head, &old);
-			if (err)
-				return err;
-		}
+	if (snapshot && itr->snapshot_has_wrapped) {
+		err = auxtrace_find_snapshot(itr, mm->idx, mm, data, &head, &old);
+		if (err)
+			return err;
 	}
 
 	if (old == head)
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index c2342d0f4afb..a9d0c84184c5 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -375,7 +375,6 @@ struct auxtrace_mmap_params {
  * @free: free this auxtrace record structure
  * @snapshot_start: starting a snapshot
  * @snapshot_finish: finishing a snapshot
- * @find_snapshot: find data to snapshot within auxtrace mmap
  * @snapshot_has_wrapped: callback to check if the buffer has wrapped in snapshot mode
  * @parse_snapshot_options: parse snapshot options
  * @reference: provide a 64-bit reference number for auxtrace_event
@@ -400,9 +399,6 @@ struct auxtrace_record {
 	void (*free)(struct auxtrace_record *itr);
 	int (*snapshot_start)(struct auxtrace_record *itr);
 	int (*snapshot_finish)(struct auxtrace_record *itr);
-	int (*find_snapshot)(struct auxtrace_record *itr, int idx,
-			     struct auxtrace_mmap *mm, unsigned char *data,
-			     u64 *head, u64 *old);
 	int (*snapshot_has_wrapped)(struct auxtrace_record *itr, int idx,
 				    unsigned char *data, size_t size, u64 head);
 	int (*parse_snapshot_options)(struct auxtrace_record *itr,
@@ -595,9 +591,6 @@ int auxtrace_record__info_fill(struct auxtrace_record *itr,
 void auxtrace_record__free(struct auxtrace_record *itr);
 int auxtrace_record__snapshot_start(struct auxtrace_record *itr);
 int auxtrace_record__snapshot_finish(struct auxtrace_record *itr, bool on_exit);
-int auxtrace_record__find_snapshot(struct auxtrace_record *itr, int idx,
-				   struct auxtrace_mmap *mm,
-				   unsigned char *data, u64 *head, u64 *old);
 int auxtrace_record__has_wrapped(struct auxtrace_record *itr, int idx,
 				 unsigned char *data, size_t buf_size,
 				 u64 head __maybe_unused);

-- 
2.43.0



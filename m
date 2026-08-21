Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEC4C5DF92
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YA8YrDL1uH8EMoAnO7TYw3jh/MqqDQQTE9sn5mADtM=; b=V/jKKsDxQBteCssW3T1SB3lH1x
	ge4iREjrSUyOQkctepGC80iNMLPMW0lZq1TaqUhw2Y2fTAfczmMN4prsxMnn3T1hlbu57YEJhyXJh
	L6+I+lSLXObjw0+ygl/S35yg/AlqUkOzVaUJB83x6HM+AF7Bwj7vEJmqizHdr/6oaLKpXuphRnA9m
	i/CgZL7vjxdtfowERQH7VvyiecNS5/vZa8Xi8rPZSqjt+En0GlR3+vIx0viD712CqmuNIT14f7JO1
	YGep8KbFOtdv6dEtrzT2YLT5ODkB9ZzDkSGIDmO0LLPqqVZr4qRTzNyrstYrsgc9XcEX9HXW6Oy0Y
	z3j+qL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsd-0000000Cx5B-2XG7;
	Fri, 21 Aug 2026 09:49:43 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsU-0000000CwyL-2FLH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-471eeac43bfso747790f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305772; x=1787910572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YA8YrDL1uH8EMoAnO7TYw3jh/MqqDQQTE9sn5mADtM=;
        b=N1tafvVmMvz36Bfyojz25D2JtNbvomkLW7f1k7U8Iomcs6lHb8mk+x4I5pMqP6K/ne
         DU3TagvFWMmMXI01LrdsovZAO4LjDu0GXSBlcjURpAGX59v4yX1shspRMjEorOIgfK5l
         7I28249+ZkuieMgT1894otsQzxNJr/JKvdaNLeIWmq6INSWGFEF427PodFrvdg3+DuRr
         DGwlSxL5nquybjbxB13SRIM3ofY7UVktAAUer0l8x5t/Ea8snJ5cIJizWPp69TxcbgtH
         Zangg0J2NzVeMjEzR7d99SHhkkuXIEUkQtyBLUXqEH2zF7LEG6OqWEw4MoAvJANWI3vW
         58gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305772; x=1787910572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YA8YrDL1uH8EMoAnO7TYw3jh/MqqDQQTE9sn5mADtM=;
        b=lRLYK4UvYD3VIyXhKuo+2URtCR/5cd/trAAB+KAl5hgOycqOk1zqlgvXGvD4nqIliq
         P3k1tJNp+XBYiNJNewqCstXlCCiSuBxh1VK4/yYcCD2kzFZelIADxyK8L4SJUPbIZsJC
         9RdCyK+H4vRC/3wc0in8HdHfpVdbL5eNSRTSA3Y1zzNd89PuL7CmrYIKUHDS8fdzVXhl
         2i1/5z5JPub0lipKpkzI7EvqG8zyysdOaouhbcJ1gMz7duz8Z11XCl/bes3Qovb3cX9V
         BiaoUSjZSBfKM6cEdt3dJ+tIM7xGrlq86sPB7TOSsGVodF+Fllqb+BskyKjFBGmRyEM8
         6cCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2Ayz2kkB0Cw7qyofMtBgWzmMyfg5DeWIifp3S5MLl4uLVvvODAFn7cv1/5CrhnStpM5EbvTtgskKpMdOtgwan@lists.infradead.org
X-Gm-Message-State: AFuF++mY3gKzPxpNmqjqeTqLKgWMY0taTy//VFwauMeempGwx6fofxOx
	lHfgM0c7VpuMXevX+28/gZt6nEZPBavTtDL46uUnA3debMsYZ4C6q7UHy4UvO79qxfg=
X-Gm-Gg: AR+sD11/v8yu1qLlOPlluXiRELqe+fgI5z8e1qX5JL7WvydAW5X64BPQ5Xhq1FrRvSd
	MOTIvJj76cNXVx2Qpz8e8GjmDCLfR6XNVYeWccAQE8dybYfdo83p/ZWiQUKFHPickSITq8gk2IF
	ROFWFlagzTroo5tK01fKeD2b+Xnt711tZEG0RAlhhRDHWBW7zH/e3zq19jneyfFS+eS0C+KgMpZ
	Hvqe2axW1Y3+lE+rUHi31iAuTDazzagxCCiN997kqzefHzZDFMhqGifOZdKEWKOGnNMLeXpZYmb
	kjes6w4kMcc3gw30IGfniJPF8MYhI++walwOIljLqmjaKAOOnjt+gWLCvjB0ON6U+BNGDi5VIQJ
	yCuDWtmFGEQ5KNjCna5jVn+R3aAdJlQWsOyRGdfsw6tPBr16JXwSiJK9wWrC5gpy3pwR/7ZH3C9
	Tx5pbh95St4ZAWBZhsyYhE2WHihY7zbhSugjEKcTb0FqiacgJHr1lx4RFzW61d/wePHl9HMWHdO
	qw=
X-Received: by 2002:a05:6000:22c6:b0:481:5021:33cd with SMTP id ffacd0b85a97d-482c0b5482cmr6699145f8f.3.1787305772510;
        Fri, 21 Aug 2026 02:49:32 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:31 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:04 +0100
Subject: [PATCH v2 06/14] perf auxtrace: Turn Intel BTS snapshot search
 into a generic one
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-6-00c4fd0701b4@linaro.org>
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
X-CRM114-CacheID: sfid-20260821_024934_874000_AAF83924 
X-CRM114-Status: GOOD (  31.41  )
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

Currently each auxtrace user has to implement both the snapshot search
and the logic to fixup the 'head' and 'old' values after finding a wrap.
IntelPT and BTS have the same fixup logic but different wrap searches.
BTS and Arm SPE have the same search but SPE modifies head differently
(although it probably shouldn’t), and Arm Coresight doesn't have a
search at all, but later it will want its own search and same fixup
logic.

Start moving towards a system where the pointers are always fixed up in
the same way by auxtrace.c, and users only have to provide a search
function or can use the generic one without reimplementing it.

The new auxtrace_find_snapshot() calls the search callback if it's
implemented, handles pointer fixup in a consistent way and is based on
intel_bts_find_snapshot(). auxtrace_record__has_wrapped() is the generic
search function based on intel_bts_has_wrapped() and includes the
caching from intel_bts_find_snapshot(). The old find_snapshot callback
will eventually be removed.

No functional changes intended apart from changing the pr_debug3()s
to print hex to match __auxtrace_mmap__read() and no longer leaking
snapshot_refs when expanding the array length.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/userspace-api/perf_ring_buffer.rst |   6 +-
 tools/perf/arch/x86/util/intel-bts.c             | 115 +-------------------
 tools/perf/util/auxtrace.c                       | 128 +++++++++++++++++++++--
 tools/perf/util/auxtrace.h                       |  11 ++
 4 files changed, 133 insertions(+), 127 deletions(-)

diff --git a/Documentation/userspace-api/perf_ring_buffer.rst b/Documentation/userspace-api/perf_ring_buffer.rst
index dc71544532ce..687c95a738f7 100644
--- a/Documentation/userspace-api/perf_ring_buffer.rst
+++ b/Documentation/userspace-api/perf_ring_buffer.rst
@@ -796,9 +796,9 @@ The perf only accesses the head pointer ``perf_event_mmap_page::aux_head``
 in snapshot mode and doesn’t touch tail pointer ``aux_tail``, this is
 because the AUX ring buffer can overflow in free run mode, the tail
 pointer is useless in this case.  Alternatively, the callback
-``auxtrace_record::find_snapshot()`` is introduced for making the decision
-of whether the AUX ring buffer has been wrapped around or not, at the
-end it fixes up the AUX buffer's head which are used to calculate the
+``auxtrace_record::snapshot_has_wrapped()`` is introduced for making the
+decision of whether the AUX ring buffer has been wrapped around or not, at the
+end Perf fixes up the AUX buffer's head which are used to calculate the
 trace data size.
 
 As we know, the buffers' deployment can be per-thread mode, per-CPU
diff --git a/tools/perf/arch/x86/util/intel-bts.c b/tools/perf/arch/x86/util/intel-bts.c
index d44d568a6d21..1b1df0003435 100644
--- a/tools/perf/arch/x86/util/intel-bts.c
+++ b/tools/perf/arch/x86/util/intel-bts.c
@@ -34,20 +34,12 @@
 #define KiB_MASK(x) (KiB(x) - 1)
 #define MiB_MASK(x) (MiB(x) - 1)
 
-struct intel_bts_snapshot_ref {
-	void	*ref_buf;
-	size_t	ref_offset;
-	bool	wrapped;
-};
-
 struct intel_bts_recording {
 	struct auxtrace_record		itr;
 	struct perf_pmu			*intel_bts_pmu;
 	struct evlist		*evlist;
 	bool				snapshot_mode;
 	size_t				snapshot_size;
-	int				snapshot_ref_cnt;
-	struct intel_bts_snapshot_ref	*snapshot_refs;
 };
 
 struct branch {
@@ -280,46 +272,11 @@ static u64 intel_bts_reference(struct auxtrace_record *itr __maybe_unused)
 	return rdtsc();
 }
 
-static int intel_bts_alloc_snapshot_refs(struct intel_bts_recording *btsr,
-					 int idx)
-{
-	const size_t sz = sizeof(struct intel_bts_snapshot_ref);
-	int cnt = btsr->snapshot_ref_cnt, new_cnt = cnt * 2;
-	struct intel_bts_snapshot_ref *refs;
-
-	if (!new_cnt)
-		new_cnt = 16;
-
-	while (new_cnt <= idx)
-		new_cnt *= 2;
-
-	refs = calloc(new_cnt, sz);
-	if (!refs)
-		return -ENOMEM;
-
-	memcpy(refs, btsr->snapshot_refs, cnt * sz);
-
-	btsr->snapshot_refs = refs;
-	btsr->snapshot_ref_cnt = new_cnt;
-
-	return 0;
-}
-
-static void intel_bts_free_snapshot_refs(struct intel_bts_recording *btsr)
-{
-	int i;
-
-	for (i = 0; i < btsr->snapshot_ref_cnt; i++)
-		zfree(&btsr->snapshot_refs[i].ref_buf);
-	zfree(&btsr->snapshot_refs);
-}
-
 static void intel_bts_recording_free(struct auxtrace_record *itr)
 {
 	struct intel_bts_recording *btsr =
 			container_of(itr, struct intel_bts_recording, itr);
 
-	intel_bts_free_snapshot_refs(btsr);
 	free(btsr);
 }
 
@@ -349,75 +306,6 @@ static int intel_bts_snapshot_finish(struct auxtrace_record *itr)
 	return -EINVAL;
 }
 
-static bool intel_bts_first_wrap(u64 *data, size_t buf_size)
-{
-	int i, a, b;
-
-	b = buf_size >> 3;
-	a = b - 512;
-	if (a < 0)
-		a = 0;
-
-	for (i = a; i < b; i++) {
-		if (data[i])
-			return true;
-	}
-
-	return false;
-}
-
-static int intel_bts_find_snapshot(struct auxtrace_record *itr, int idx,
-				   struct auxtrace_mmap *mm, unsigned char *data,
-				   u64 *head, u64 *old)
-{
-	struct intel_bts_recording *btsr =
-			container_of(itr, struct intel_bts_recording, itr);
-	bool wrapped;
-	int err;
-
-	pr_debug3("%s: mmap index %d old head %zu new head %zu\n",
-		  __func__, idx, (size_t)*old, (size_t)*head);
-
-	if (idx >= btsr->snapshot_ref_cnt) {
-		err = intel_bts_alloc_snapshot_refs(btsr, idx);
-		if (err)
-			goto out_err;
-	}
-
-	wrapped = btsr->snapshot_refs[idx].wrapped;
-	if (!wrapped && intel_bts_first_wrap((u64 *)data, mm->len)) {
-		btsr->snapshot_refs[idx].wrapped = true;
-		wrapped = true;
-	}
-
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
-}
-
 struct auxtrace_record *intel_bts_recording_init(int *err)
 {
 	struct perf_pmu *intel_bts_pmu = perf_pmus__find(INTEL_BTS_PMU_NAME);
@@ -444,7 +332,8 @@ struct auxtrace_record *intel_bts_recording_init(int *err)
 	btsr->itr.free = intel_bts_recording_free;
 	btsr->itr.snapshot_start = intel_bts_snapshot_start;
 	btsr->itr.snapshot_finish = intel_bts_snapshot_finish;
-	btsr->itr.find_snapshot = intel_bts_find_snapshot;
+	btsr->itr.snapshot_has_wrapped = auxtrace_record__has_wrapped;
+	btsr->itr.snapshot_search_bytes = 4096;
 	btsr->itr.parse_snapshot_options = intel_bts_parse_snapshot_options;
 	btsr->itr.reference = intel_bts_reference;
 	btsr->itr.read_finish = auxtrace_record__read_finish;
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index aa749e1c3036..9586989e645e 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -603,8 +603,10 @@ int auxtrace_record__info_fill(struct auxtrace_record *itr,
 
 void auxtrace_record__free(struct auxtrace_record *itr)
 {
-	if (itr)
+	if (itr) {
+		zfree(&itr->snapshot_wrapped);
 		itr->free(itr);
+	}
 }
 
 int auxtrace_record__snapshot_start(struct auxtrace_record *itr)
@@ -621,12 +623,109 @@ int auxtrace_record__snapshot_finish(struct auxtrace_record *itr, bool on_exit)
 	return 0;
 }
 
-int auxtrace_record__find_snapshot(struct auxtrace_record *itr, int idx,
-				   struct auxtrace_mmap *mm,
-				   unsigned char *data, u64 *head, u64 *old)
+static int auxtrace_alloc_wrap_bitmap(struct auxtrace_record *itr, int idx)
+{
+	int len = itr->snapshot_wrapped_len;
+	unsigned long *new_bitmap;
+	int new_len = len * 2;
+
+	if (!new_len)
+		new_len = BITS_PER_LONG;
+
+	while (new_len <= idx)
+		new_len *= 2;
+
+	new_bitmap = realloc(itr->snapshot_wrapped, bitmap_size(new_len));
+	if (!new_bitmap)
+		return -ENOMEM;
+
+	itr->snapshot_wrapped = new_bitmap;
+	bitmap_clear(itr->snapshot_wrapped, len, new_len - len);
+	itr->snapshot_wrapped_len = new_len;
+
+	return 0;
+}
+
+/*
+ * Generic auxtrace_record::has_wrapped() implementation that returns 1 if non
+ * zero data exists within auxtrace_record::snapshot_search_bytes of the end of
+ * the buffer. The result is cached for each buffer idx so the search is not
+ * repeated.
+ *
+ * Writes at the end mean a high chance that trace would have continued past
+ * this search area and wrapped to the beginning. It's not a perfect heuristic,
+ * but it's only to avoid saving mostly empty buffers into the file. A false
+ * positive results in saving up to snapshot_search_bytes zeros before the
+ * actual data, which a decoder should be able to skip over.
+ */
+int auxtrace_record__has_wrapped(struct auxtrace_record *itr, int idx,
+				 unsigned char *data, size_t buf_size,
+				 u64 head __maybe_unused)
+{
+	u64 *wide_data = (u64 *)data;
+	s64 i, a, b;
+
+	if (idx >= itr->snapshot_wrapped_len) {
+		int err = auxtrace_alloc_wrap_bitmap(itr, idx);
+
+		if (err)
+			return err;
+	}
+
+	if (test_bit(idx, itr->snapshot_wrapped))
+		return 1;
+
+	b = buf_size / sizeof(u64);
+	a = b - (itr->snapshot_search_bytes / sizeof(u64));
+	if (a < 0)
+		a = 0;
+
+	for (i = a; i < b; i++) {
+		if (wide_data[i]) {
+			__set_bit(idx, itr->snapshot_wrapped);
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+static int auxtrace_find_snapshot(struct auxtrace_record *itr, int idx,
+				   struct auxtrace_mmap *mm, unsigned char *data,
+				   u64 *head, u64 *old)
 {
-	if (itr && itr->find_snapshot)
-		return itr->find_snapshot(itr, idx, mm, data, head, old);
+	int wrapped;
+
+	pr_debug3("%s: mmap index %d old head 0x%"PRIx64" new head 0x%"PRIx64"\n",
+		  __func__, idx, *old, *head);
+
+	wrapped = itr->snapshot_has_wrapped(itr, idx, data, mm->len, *head);
+	if (wrapped < 0) {
+		pr_err("%s: failed, error %d\n", __func__, wrapped);
+		return wrapped;
+	}
+
+	/*
+	 * In full trace mode 'head' continually increases.  However in snapshot
+	 * mode 'head' is an offset within the buffer.  Here 'old' and 'head'
+	 * are adjusted to match the full trace case which expects that 'old' is
+	 * always less than 'head'.
+	 */
+	if (wrapped) {
+		*old = *head;
+		*head += mm->len;
+	} else {
+		if (mm->mask)
+			*old &= mm->mask;
+		else
+			*old %= mm->len;
+		if (*old > *head)
+			*head += mm->len;
+	}
+
+	pr_debug3("%s: wrap-around %sdetected, adjusted old head 0x%"PRIx64" adjusted new head 0x%"PRIx64"\n",
+		  __func__, wrapped ? "" : "not ", *old, *head);
+
 	return 0;
 }
 
@@ -1958,12 +2057,21 @@ static int __auxtrace_mmap__read(struct mmap *map,
 	union perf_event ev;
 	void *data1, *data2;
 	int kernel_is_64_bit = perf_env__kernel_is_64_bit(env);
+	int err;
 
 	head = auxtrace_mmap__read_head(mm, kernel_is_64_bit);
 
-	if (snapshot &&
-	    auxtrace_record__find_snapshot(itr, mm->idx, mm, data, &head, &old))
-		return -1;
+	if (snapshot) {
+		if (itr->find_snapshot) {
+			err = itr->find_snapshot(itr, mm->idx, mm, data, &head, &old);
+			if (err)
+				return err;
+		} else if (itr->snapshot_has_wrapped) {
+			err = auxtrace_find_snapshot(itr, mm->idx, mm, data, &head, &old);
+			if (err)
+				return err;
+		}
+	}
 
 	if (old == head)
 		return 0;
@@ -2042,8 +2150,6 @@ static int __auxtrace_mmap__read(struct mmap *map,
 	mm->prev = head;
 
 	if (!snapshot) {
-		int err;
-
 		err = auxtrace_mmap__write_tail(mm, head, kernel_is_64_bit);
 		if (err < 0)
 			return err;
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 6947f3f284c0..c2342d0f4afb 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -376,6 +376,7 @@ struct auxtrace_mmap_params {
  * @snapshot_start: starting a snapshot
  * @snapshot_finish: finishing a snapshot
  * @find_snapshot: find data to snapshot within auxtrace mmap
+ * @snapshot_has_wrapped: callback to check if the buffer has wrapped in snapshot mode
  * @parse_snapshot_options: parse snapshot options
  * @reference: provide a 64-bit reference number for auxtrace_event
  * @read_finish: called after reading from an auxtrace mmap
@@ -383,6 +384,8 @@ struct auxtrace_mmap_params {
  * @default_aux_sample_size: default sample size for --aux sample option
  * @pmu: associated pmu
  * @evlist: selected events list
+ * @snapshot_wrapped_len: number of bits in @snapshot_wrapped
+ * @snapshot_wrapped: bitmap indicating if each aux buffer has wrapped
  */
 struct auxtrace_record {
 	int (*recording_options)(struct auxtrace_record *itr,
@@ -400,6 +403,8 @@ struct auxtrace_record {
 	int (*find_snapshot)(struct auxtrace_record *itr, int idx,
 			     struct auxtrace_mmap *mm, unsigned char *data,
 			     u64 *head, u64 *old);
+	int (*snapshot_has_wrapped)(struct auxtrace_record *itr, int idx,
+				    unsigned char *data, size_t size, u64 head);
 	int (*parse_snapshot_options)(struct auxtrace_record *itr,
 				      struct record_opts *opts,
 				      const char *str);
@@ -408,6 +413,9 @@ struct auxtrace_record {
 	unsigned int alignment;
 	unsigned int default_aux_sample_size;
 	struct evlist *evlist;
+	int snapshot_wrapped_len;
+	unsigned long *snapshot_wrapped;
+	int snapshot_search_bytes;
 };
 
 /**
@@ -590,6 +598,9 @@ int auxtrace_record__snapshot_finish(struct auxtrace_record *itr, bool on_exit);
 int auxtrace_record__find_snapshot(struct auxtrace_record *itr, int idx,
 				   struct auxtrace_mmap *mm,
 				   unsigned char *data, u64 *head, u64 *old);
+int auxtrace_record__has_wrapped(struct auxtrace_record *itr, int idx,
+				 unsigned char *data, size_t buf_size,
+				 u64 head __maybe_unused);
 u64 auxtrace_record__reference(struct auxtrace_record *itr);
 int auxtrace_record__read_finish(struct auxtrace_record *itr, int idx);
 

-- 
2.43.0



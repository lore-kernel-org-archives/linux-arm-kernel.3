Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52216C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbdOfomTAI7oLSknzQNqLoWXfzHYXHRHempsJBX4UAA=; b=l7ajezBEIUR71egpMZSLmvHPE6
	pXK9Xz2RHKFXfaD9gNfCdyrIvBLw19cDhyHtcP0JVn2MVIW3CJoxgTHCtCBCUOvaqS68l7wxCM5kg
	qeQEC4XNOYOffQTPUlHo0/AAidIDVW2SDo/ggIgUuxjQfYAlFNDwt5m5g/zeF6v+5wBS27YG+P2/c
	Hi3Mmy05Mh/ISXd5j5IqDEkdJIsfpn/N7zelVFlDBqXOp2WqUXkkyGrJDRtbMXYjqd/sbn4/iAjEw
	2VgkNFmrkK4QVbuBFiNU3b/UChJkDBSVZaUP1nZpFFTOwuHI/r7FzBKep27P7qoK6TXIl/7Rtav7w
	OeDHAEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRZ-0000000EKLO-3v1p;
	Tue, 11 Aug 2026 15:31:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRQ-0000000EKD2-0WVE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:31:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49557167508so26998235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462258; x=1787067058; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbdOfomTAI7oLSknzQNqLoWXfzHYXHRHempsJBX4UAA=;
        b=Pj9XJ7b6MSVXtHUaKkpNS1JDLLyPR6/GQtBeMmRTuHNmpt39sOF+ahKz+0DUqMyKbP
         GDhxlKpDX2ODjOo3UUyxCzPYJKr8XCPkZMYdNyO5eQxmQ+HvS4Q6oumNwZrWV8uK0rcM
         XDj/8Bu+MZGaQuBxXsdTRFaaW3ExeRRea7fqoqfp134MOJoqXnpC0wfC/sLRxqdXSpqJ
         f84Ns+lrTgHYZF7xGm89g737jpp8A+YhbJJrn5j4zzB+5MAAnc4yNqGkOmR/4vv83ALu
         M9LK6So1XD8ANXCdoVI90J7kHqj+w/M6NtSHv3psw9gy1EZgYhotfNhrzCQhOBaH3Nvx
         46Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462258; x=1787067058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbdOfomTAI7oLSknzQNqLoWXfzHYXHRHempsJBX4UAA=;
        b=UPoT1HUUIupJXcc2Z5m9vNYejY/fiXPkZMfY+YzzfgcxoaSfCa3y8LFfvVus33OKVr
         AlGz+Mk6wQMfZzQucpTqwMk+DZ1K7b3ZJVy6XfDvYxMT668JZ9VJiMqS13A/R40TiHZo
         DHq6/OdjHQlmEvhh+HQnoGkAF9zqQTQ+vCWMBOYKtO3kKCfC1kjJ2LNL1sF4tJoZwxUL
         glX/DFWecSlJMWtyv90kpE8flWXx5og8PHIh+YdmYuGnW/2WnJEIYQ8QoTrGwAdZ0ubO
         n26FAo5M1RprATRR2ADH99feW7UxV9kEzcIUXLzT7OubDl+8YBd088eqmOyYz1qWHUEl
         PHfA==
X-Forwarded-Encrypted: i=1; AHgh+RrqMsYmm8Q96Dz6Y9XIlGkgccAMT4IsNcwkMZskxU579SviIcMIQWSzLpYBy5Sg+iKQxX3Oojc25f1hX/z+kAqH@lists.infradead.org
X-Gm-Message-State: AOJu0YwgZQMD8Vipg7lqwB5XjYWei1uJyMWbvnWLuQBw13wsPUdqfEnY
	AXrd7rrS28FuK6OC8+u3Li0IGmuzsaevRJ6ErVhO6pBcLer6C2dvQNHVwo6wV7u4iew=
X-Gm-Gg: AR+sD11nHmsziHEAAi8zJ4j9pwgauTSpMgZnf6SLai2ay+rZK6TtkRiFLma9scX01Fd
	kUO5v1h1y0G4cJBIVLAfpxHo/5tBA0Pktaw+pxM9mWEA6Bu46TBc2zatZyBBUU+4k+RekRZw35j
	/QbC7sHRWZ4tn7zD1puXGMVvQo8mU/lCyCyHQCLJ0JU3T30o1nqygie84LOTGT0zIEJWsE8ZcbQ
	swBmU3cNOrJfqOtMTLUkWdAgWlOBPsbbAKchC+fsbNHOmaen5wlwJexsKbnFlbEuRZHlOWc8OAQ
	pb1+6+eTEWINSZxLi6NMKn7gQo26KNobuqlPwuNkmjU/oBdsLIxYMUYtIfQACZWHJ97RRVtMbwK
	S8TlCA8W8h+q09DSgmSYdZIb+GlGC7ZdZ44I2Oq6Z+lAqqPKOQ43p8xDucbLo0/ca9roTh8xJ4R
	EdeNa2UeRdwhB1XFsHpu1jVCmhiZM9c1qiFoNpQ76cAzAVS6lobtE7MG0jESX4aKEYmemFFlzIL
	ik=
X-Received: by 2002:a05:600c:4594:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-4997aa7eaafmr2747295e9.15.1786462258292;
        Tue, 11 Aug 2026 08:30:58 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:30:57 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:10 +0100
Subject: [PATCH 07/14] perf arm-spe: Use generic snapshot search
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-7-90565318f5f8@linaro.org>
References: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
In-Reply-To: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
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
 Suyash Mahar <smahar@meta.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_083100_230906_EE53A88E 
X-CRM114-Status: GOOD (  32.96  )
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

The new generic snapshot search gives a similar result as the
reimplemented version of it here. One slight difference is in the
pointer fixup. SPE has:

  *head += mm->len;
  *old = *head - mm->len;

Which gives exactly the same result but written in reverse order to the
generic one:

  *old = *head;
  *head += mm->len;

SPE also had a special fixup case for head pointers greater than the
buffer length, which is not needed because the SPE driver always wraps
them, and __auxtrace_mmap__read() handles that anyway. It also didn't
have the special case for old > head for when the wrap heuristic fails
but the pointers showed a wrap had happened.

The other feature lost is that this search only looked from head to the
end of the buffer, rather than always at the last 512 bytes. This was
flawed because once head is close to the end, it's likely it could
contain zero padding from actual SPE data and a wrap would be missed.
It's better to err on the side of caution and mark as a wrap, rather
than trying to optimize by limiting the search from head onwards.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm64/util/arm-spe.c | 147 +----------------------------------
 1 file changed, 2 insertions(+), 145 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 1ba803a8d9b4..d8c4a1d6c621 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -26,7 +26,6 @@
 #include "../../../util/record.h"
 #include "../../../util/header.h"
 #include "../../../util/arm-spe.h"
-#include <tools/libc_compat.h> // reallocarray
 
 #define ARM_SPE_CPU_MAGIC		0x1010101010101010ULL
 
@@ -37,8 +36,6 @@ struct arm_spe_recording {
 	struct auxtrace_record		itr;
 	struct perf_pmu			*arm_spe_pmu;
 	struct evlist		*evlist;
-	int			wrapped_cnt;
-	bool			*wrapped;
 };
 
 /* Iterate config list to detect if the "freq" parameter is set */
@@ -497,146 +494,6 @@ static int arm_spe_snapshot_finish(struct auxtrace_record *itr)
 	return ret;
 }
 
-static int arm_spe_alloc_wrapped_array(struct arm_spe_recording *ptr, int idx)
-{
-	bool *wrapped;
-	int cnt = ptr->wrapped_cnt, new_cnt, i;
-
-	/*
-	 * No need to allocate, so return early.
-	 */
-	if (idx < cnt)
-		return 0;
-
-	/*
-	 * Make ptr->wrapped as big as idx.
-	 */
-	new_cnt = idx + 1;
-
-	/*
-	 * Free'ed in arm_spe_recording_free().
-	 */
-	wrapped = reallocarray(ptr->wrapped, new_cnt, sizeof(bool));
-	if (!wrapped)
-		return -ENOMEM;
-
-	/*
-	 * init new allocated values.
-	 */
-	for (i = cnt; i < new_cnt; i++)
-		wrapped[i] = false;
-
-	ptr->wrapped_cnt = new_cnt;
-	ptr->wrapped = wrapped;
-
-	return 0;
-}
-
-static bool arm_spe_buffer_has_wrapped(unsigned char *buffer,
-				      size_t buffer_size, u64 head)
-{
-	u64 i, watermark;
-	u64 *buf = (u64 *)buffer;
-	size_t buf_size = buffer_size;
-
-	/*
-	 * Defensively handle the case where head might be continually increasing - if its value is
-	 * equal or greater than the size of the ring buffer, then we can safely determine it has
-	 * wrapped around. Otherwise, continue to detect if head might have wrapped.
-	 */
-	if (head >= buffer_size)
-		return true;
-
-	/*
-	 * We want to look the very last 512 byte (chosen arbitrarily) in the ring buffer.
-	 */
-	watermark = buf_size - 512;
-
-	/*
-	 * The value of head is somewhere within the size of the ring buffer. This can be that there
-	 * hasn't been enough data to fill the ring buffer yet or the trace time was so long that
-	 * head has numerically wrapped around.  To find we need to check if we have data at the
-	 * very end of the ring buffer.  We can reliably do this because mmap'ed pages are zeroed
-	 * out and there is a fresh mapping with every new session.
-	 */
-
-	/*
-	 * head is less than 512 byte from the end of the ring buffer.
-	 */
-	if (head > watermark)
-		watermark = head;
-
-	/*
-	 * Speed things up by using 64 bit transactions (see "u64 *buf" above)
-	 */
-	watermark /= sizeof(u64);
-	buf_size /= sizeof(u64);
-
-	/*
-	 * If we find trace data at the end of the ring buffer, head has been there and has
-	 * numerically wrapped around at least once.
-	 */
-	for (i = watermark; i < buf_size; i++)
-		if (buf[i])
-			return true;
-
-	return false;
-}
-
-static int arm_spe_find_snapshot(struct auxtrace_record *itr, int idx,
-				  struct auxtrace_mmap *mm, unsigned char *data,
-				  u64 *head, u64 *old)
-{
-	int err;
-	bool wrapped;
-	struct arm_spe_recording *ptr =
-			container_of(itr, struct arm_spe_recording, itr);
-
-	/*
-	 * Allocate memory to keep track of wrapping if this is the first
-	 * time we deal with this *mm.
-	 */
-	if (idx >= ptr->wrapped_cnt) {
-		err = arm_spe_alloc_wrapped_array(ptr, idx);
-		if (err)
-			return err;
-	}
-
-	/*
-	 * Check to see if *head has wrapped around.  If it hasn't only the
-	 * amount of data between *head and *old is snapshot'ed to avoid
-	 * bloating the perf.data file with zeros.  But as soon as *head has
-	 * wrapped around the entire size of the AUX ring buffer it taken.
-	 */
-	wrapped = ptr->wrapped[idx];
-	if (!wrapped && arm_spe_buffer_has_wrapped(data, mm->len, *head)) {
-		wrapped = true;
-		ptr->wrapped[idx] = true;
-	}
-
-	pr_debug3("%s: mmap index %d old head %zu new head %zu size %zu\n",
-		  __func__, idx, (size_t)*old, (size_t)*head, mm->len);
-
-	/*
-	 * No wrap has occurred, we can just use *head and *old.
-	 */
-	if (!wrapped)
-		return 0;
-
-	/*
-	 * *head has wrapped around - adjust *head and *old to pickup the
-	 * entire content of the AUX buffer.
-	 */
-	if (*head >= mm->len) {
-		*old = *head - mm->len;
-	} else {
-		*head += mm->len;
-		*old = *head - mm->len;
-	}
-
-	return 0;
-}
-
 static u64 arm_spe_reference(struct auxtrace_record *itr __maybe_unused)
 {
 	struct timespec ts;
@@ -651,7 +508,6 @@ static void arm_spe_recording_free(struct auxtrace_record *itr)
 	struct arm_spe_recording *sper =
 			container_of(itr, struct arm_spe_recording, itr);
 
-	zfree(&sper->wrapped);
 	free(sper);
 }
 
@@ -674,7 +530,8 @@ struct auxtrace_record *arm_spe_recording_init(int *err,
 	sper->arm_spe_pmu = arm_spe_pmu;
 	sper->itr.snapshot_start = arm_spe_snapshot_start;
 	sper->itr.snapshot_finish = arm_spe_snapshot_finish;
-	sper->itr.find_snapshot = arm_spe_find_snapshot;
+	sper->itr.snapshot_has_wrapped = auxtrace_record__has_wrapped;
+	sper->itr.snapshot_search_bytes = 512;
 	sper->itr.parse_snapshot_options = arm_spe_parse_snapshot_options;
 	sper->itr.recording_options = arm_spe_recording_options;
 	sper->itr.info_priv_size = arm_spe_info_priv_size;

-- 
2.43.0



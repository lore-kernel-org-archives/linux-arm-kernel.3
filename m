Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F80AC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbdOfomTAI7oLSknzQNqLoWXfzHYXHRHempsJBX4UAA=; b=D7ZSN8V4reag4i941Z7kam4hAi
	kmtIgBSHpelAsaoa3xz9VnSxA0+P9/xJgJb0q2ofic/df9SDSb6jzeHWZpm6dN7fyCp7iasAVFkF+
	mMbuQr7f1HHxh1RZOu9ch6LVOZONxWtSwl4CkHEwMuWgYNCJu4NoxlJL/a9Db2YiKvWE9a+SC3AaP
	e5eRU60kUPgkwZ3tyLM7uof4kbGlydMPWtJ4bJBSTdYWyo6kxih7Mcg+m1RIKyX5885DwJicuN5QO
	FPMCHhgsWTFGRvTHpBQvZDlksJ0eDG8zzeFPTfbKtZliH7APXK5dEH7pW/QG8H6Iny/cTvPkz9hRV
	U51fiapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsd-0000000Cx5u-3kID;
	Fri, 21 Aug 2026 09:49:43 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsW-0000000Cwzn-1RPb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso726725f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305775; x=1787910575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbdOfomTAI7oLSknzQNqLoWXfzHYXHRHempsJBX4UAA=;
        b=X0KntMgKPBp9nisgOORh4CknMhWiaqMAhGENs89RIPhWZCTs5m15SmIrdhIA2ypDo1
         Q3oV6nbxbxbPDcdz2C+fq3XQrY5WNQk5yfi3lWLhZOM8eYLDGyvFPCzpMr8giKIcs64x
         1VisqQspOqbq//gRWUaeZHxrwP6KqMaJ4qlhNz0XfzEr4spv0uHTjnYUg9ecoLeyI5Yd
         KyBqwgYYnQDbmruceHpyiRMmm8iQY/sO06fBd/2pxjWcrBWW/7RGlg6jj6tH49tbH2rR
         OT297RML+vtSw6bfwz3LqLDPtMPeBSeoVtbnfodsAzpos2v6O3iHqA0w2EAiar3FFuj5
         hngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305775; x=1787910575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbdOfomTAI7oLSknzQNqLoWXfzHYXHRHempsJBX4UAA=;
        b=Ew0RCjd0h6wODUh8EJZBVzI6hkH5iM1U53XYBRCORgAvpV0322/LjtORKrs8kl0v3L
         LPeLRwABlTh7eR5ibfEarUd9XH73uDksLgjqo5iLylhUwu/b5A4BJM7JM7tTHv3i/My1
         SJzU8Co/W/XvEUTw1vzf9psnPug4YA1xNQnv40ZDyIc0npvcEQQa+pIEc50WgSKt/qqq
         4p3Ms3zqClw2dnsrSDyWgf5AJvjzvxnK3Ft7uUAwZfJl8Z/Q09WqYMFFQmBHOkNt1inD
         vkuA9JrD/iyKcGVkv63QO3kFWGzQPMULBS0T+EYlCm0IdAt3++5/Zoxzvlr6lq9yq5TP
         m0vw==
X-Forwarded-Encrypted: i=1; AHgh+Rqhy03J0Sf2zoWSqa2V0uAxMjdaTTTDbzVqO2t1ODvlH0rAvQcN/xJu0IDPwMLHN4PMsOMpb89ntVFncN6l8D4L@lists.infradead.org
X-Gm-Message-State: AFuF++kogtLr7VTqV7kmCvvHE+3feNL4WSqhxHYzsmuiMM9fqCoOiRNL
	wsmw3AYEEcQsJYJSaL01ZrNX5Pn9wBhgiuav0DANA3KIp/3kpSbqNkj46G14ciRrgYs=
X-Gm-Gg: AR+sD12vmlvuM1xQMnWonFlIGVaE/f3vxrJd+0uaDKaZdr61euI7MZapVkdjqxTGPPi
	HqAwG+BGLdtfjvCh5ghyAjITejPatkvKm7ljfDALyHK+UiL7a0Jua2RjRvTGCqF/wJanUAXOmRS
	fgSAL0aYajQCbh+nWAniVB8G5HN/3dPfR8geMz7pGp+be35zfSFaPZrOI9+gUm6ihyNYd8w7QS3
	jytQ4jTHrwIvrRfmPc3V+89PmCTS8UpJNjQRMDHtkhI12VyA3i6DFJ5Xw/9cbXEN0JzaPdQHNL5
	vUho5osARHJFu8byXYrkjjpnNHiPu2381Qam8vL5Cfjeo7+uw1zjVMeWhqIbkYnSKf2EukyG1/P
	02zeeW+UVjhZT0mmqYf+/7Wca+/FWLd0rXgNDwezc3kaqDUxbo2bW7riqqRCeDW9O0UiRautNHR
	jg6W31iNlk/jELzI9ftX8lS+XZ+5MFBtM+iEwC2XLoDpZmzK+++9JH+S1Ea84ybf6W
X-Received: by 2002:a05:6000:2305:b0:481:573d:9d29 with SMTP id ffacd0b85a97d-482c0b96bf7mr7076525f8f.14.1787305774666;
        Fri, 21 Aug 2026 02:49:34 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:33 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:05 +0100
Subject: [PATCH v2 07/14] perf arm-spe: Use generic snapshot search
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-7-00c4fd0701b4@linaro.org>
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
X-CRM114-CacheID: sfid-20260821_024936_473357_3C125158 
X-CRM114-Status: GOOD (  33.08  )
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



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06496075F0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CvS6dTyg;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IErtBBDg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0h6WPoIHtebuZtai11cK1SScVPN57oWYqBqF0QVqU/0=; b=CvS6dTygiIiBMI
	sQ4JTqMjALP7mv3xt+/xJJckMWk/2hR9zgQ26RHcFlPtGt0HaUK1+N5iBFBQLmD2/Bs6xEdT08/Ss
	evn+v2+in4ivXZEH5BbJZJ8kR0h5BnDwnGzG1GAIHerR+zL+JHmqsWwIM+S6hYVRTHPL+TdAepiMg
	W3I/ryGfK1gisTEmBd7iyQijm/8EmlZXG6OCcS9wlNzzRDbBBWGIugPjjhHh/5lwPWRJTeKmiJSsr
	TAL2LCSXaxJLIiBwNqQJDa+keGCwGdIBM4FBygku9eGsnm3g9aXf9T23XlPr+VaoTbmVFA7EN7LDe
	mRlDCFHUqkRRuRYLYBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuX-00000008j48-223I;
	Thu, 05 Nov 2026 11:45:41 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuR-00000008isp-1kJT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:36 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so10753125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879134; x=1794483934; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0h6WPoIHtebuZtai11cK1SScVPN57oWYqBqF0QVqU/0=;
        b=IErtBBDgOXSdmFN7PlmzqDFoRaJkZHEcFdEveu8XB7rom45eiTZTble3j37HXjom3c
         o38qMEdjg0o7doLGAbD1w3d+IX1/HMDltDWViDtnLHrxRG3Vv2Bh+FLuNW1MEI+kYoCj
         SfRHScPaFAkzo+jc6hU/Ypk3do3bVZjV0Dm2kHwNRGidsVI91mBiNaiNTdIbNA0U9WQt
         /nupRmmKa4ZJvarhuzuZJQ6BzfOyRJ3uO0dXxBaUkMUvFCr3+Z+JvX+gqxa1GildL/a0
         +0FIQ2Z645YegeBWHtw9l7dVYUgd23hxLiO8kqFBdvY4Aj8WVjYeh7EUI0WhKc3/2gqw
         DIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879134; x=1794483934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0h6WPoIHtebuZtai11cK1SScVPN57oWYqBqF0QVqU/0=;
        b=qDsK0bvoD0ZEEy2eeV2auo4EDp5aELX0Xh35QwXk3KQKDeC5E3JkmQHyf32GnvTXCh
         9tHk+psa8NzyxU8AeRp5WnxUJmcvv5sb5KZOnX0tHW2ObciE1dKe2osbf4oEOYBuJrN7
         pMjRN/rnYNaMjeAal3B+QZKFwS8ek3WzqpPZRjp8JAXczaMAFzaR31+OWnwyRJ0i0sQW
         6ecOvOLVSxjDgDekLCZIogIdX62PRR0VntGPtqCytqwZbLR6k60YqfRCZzWZCcIzy2BT
         GHngM6ToQtruJ2lfn6PCPwrOWMcSOTY8B9Uxf4Fkvjys2RxpDr8r4eUessCAMVl/rMmH
         vM2g==
X-Forwarded-Encrypted: i=1; AKwUvBxxWcfIAHmeAXPVtzAy7z8BtB/1vxQkm3BL5gv+HKRtp7P01i6l8b9Q5wjf0HB/tkeAJl6hDxGUhhLpN6FN229b@lists.infradead.org
X-Gm-Message-State: APuU4Z+1Y8STKNGJtq0Lbq4JvXFOpSb3v1kTcCWAPFt2LvHpQYumay0B
	IvRGQFVACz0fNOSDsdR8bRmyYFwse8iK7Bh3020WKoO76UA6NwML3AAxoC6RL31Ge94=
X-Gm-Gg: AYBFou0fVj6akXvgVAK1DZDimQBAw3LVsks6zGTlpNc/UpLUcurAg0y/rUNZaU64JQf
	SHoKLthSwTfLsI6T4zWkCcaZmWindClwwS8iI0oUDevOLyw01mV3dGEBlB2CNZZwy5RkZWqRzU2
	xj4LrS2n1QaOhsJ3vWUEABrqhAiSnH8wFIy223eO2i13spiJmsmNOvBEsKgFTo/7q2MkSr44plP
	K40Ii6aVDnDxMpfMYfpTxJ1Iy5F4nR5vOc9ptjGtZe4xZh6vEajfT+Zk+NuN7dnHYc2a+Np0M1k
	Za44Id8ZFAvJH6opsYfx/GDA/Lv4y1Cp67epceM2eLEHsq07d9zOW/YAKNfisEpSh39nDUMQ23N
	kHC55NJdLR8YzvUtrS5hzg7FL6XEkCAgF+fShNYZdCZHVSgCLVb7ZJdNLMdeiTgXeqr493/Wm7B
	GAb5RkncSKf4YhQJ8tq7KhTjW04ZAnRiiRJ1E1VsQ+CeQwgIW8f4C/6cWMzK7td/ITIZzCBSMig
	BOeud8B3QxeAsxANlvICiW8LSd05HnV/gKo7srC9sPystgO1WAZTGaDoOkXtNKf1/Nj0PYByLwA
	U6s8K6yuapuq4OwJp60xNWdwVywFx7Dm
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr414154955e9.18.1793879133683;
        Thu, 05 Nov 2026 03:45:33 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:33 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:59 +0000
Subject: [PATCH v4 11/19] perf arm-spe: Use generic snapshot search
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-11-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_034535_502775_5CBA56F8 
X-CRM114-Status: GOOD (  34.18  )
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

The new generic snapshot search gives a similar result as the
reimplemented version of it here. One slight difference is in the
pointer fixup. SPE has:

  *head += mm->len;
  *old = *head - mm->len;

Which gives exactly the same result but written in reverse order to the
generic one:

  *old = *head;
  *head += mm->len;

SPE also had a special fixup cases (if (head >= buffer_size)):

 * head > isn't needed because the SPE driver always wraps them, and
   __auxtrace_mmap__read() handles that anyway.
 * head == buffer_size isn't wrapped by the driver, but it just
   indicates 'full' which doesn't mean wrapped any more or less than any
   other index in the buffer.

Both of these cases are covered by the 512 byte search.

It also didn't have the special case for old > head for when the wrap
heuristic fails but the pointers showed a wrap had happened.

The other feature lost is that this search only looked from head to the
end of the buffer, rather than always at the last 512 bytes. This was
flawed because once head is close to the end, it's likely it could
contain zero padding from actual SPE data and a wrap would be missed.
It's better to err on the side of caution and mark as a wrap, rather
than trying to optimize by limiting the search from head onwards. This
can mistake old data as evidence of a wrap, but for false positives
[head..mm->len] contains zero data. This should be fine, as zero data
are treated as PAD packets and discarded during decoding.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm64/util/arm-spe.c | 147 +----------------------------------
 1 file changed, 2 insertions(+), 145 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 1ba803a8d9b4..8d6a2bde2892 100644
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
+	sper->itr.find_snapshot = auxtrace_record__default_find_snapshot;
+	sper->itr.snapshot_search_bytes = 512;
 	sper->itr.parse_snapshot_options = arm_spe_parse_snapshot_options;
 	sper->itr.recording_options = arm_spe_recording_options;
 	sper->itr.info_priv_size = arm_spe_info_priv_size;

-- 
2.43.0



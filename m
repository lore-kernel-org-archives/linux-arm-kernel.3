Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93958C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIEqHB2kupPj+LJwStZlpRLPHkBGU+WfDNFf0olHiVQ=; b=lpZ8O8HwJxTv1QUGpOzC3NK1xp
	ZaSGM6gENr+mshEjXxXaXOm/6uQEgEEvI0z7MweqMMfzgJOfDr+x5n8w58RAsRyrutqw/fodIo0vz
	wmRrcKtfblzfJALa7XlN7pYX+G1rAd7kCoeBi4raRG1XiVhxdiCJGIOw7kfq7my8onhtV4ese5pPn
	PmM/U/y6R32S64q8JnqKmrC3IzsrmDi0/LoLCo1CvrzaLkg2SS64MrNLjgFaUpGK47iMuWaxaknRd
	MRLkp/4nTqjT/tejHwDrV9v7OgAZAGnxU79qISkouTfKspqCbjmsvKdbs45x1N+4qHIzmiFmNglYJ
	zhMQO/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRq-0000000EKbO-0S06;
	Tue, 11 Aug 2026 15:31:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRY-0000000EKJA-0m66
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:31:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49557167508so26999235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462266; x=1787067066; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIEqHB2kupPj+LJwStZlpRLPHkBGU+WfDNFf0olHiVQ=;
        b=ontw8ryrC6hgDEnBpJe81G8TUSqPwWcmURfyCxUm6Q51i93GDWTdSRnX0ERaVTnziJ
         bSJW6GBZJHL/HJnaxHwKl17vncOY3KoYrzE5vWu5aHhUQNi76Iy8sXgii062zvWubskR
         YAEDgspCBLsX3P3X9IXZNbiTOxiOsu54qSOczvpdTDJqbdNq7eO7WNslQX5u+RL6kRq1
         CEu/wPB1j2hiK3zQXszDbz2Aj/GUTB7efFMQwClHTUwWE/ncFEPLL4bne0BJcwOj/yxt
         4GroL7/yMm8SYYE6cpumOqC0UBNTbsCsC7yUP6rBkOsPgEpbOG48LKjIb6PR+0h33UD5
         1HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462266; x=1787067066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIEqHB2kupPj+LJwStZlpRLPHkBGU+WfDNFf0olHiVQ=;
        b=nwvttFdppxleqBSeTvQEWey/jTJf+zoPrT08wcm+X8ERZAuP9C/oAoRNxn2c3oDdVy
         xRGg+jjZuNVLhIgTJHQiC750n9Ls6auKceTfpulEXsRgrsSsE3ImUyjf680Dg+UUuTsO
         LWDVbjjPc/zSTYg3eTYFwiwCvukeAbIwWtt/jkdKRESuEySA4k7Bb+P8r2xR5liAgtms
         B0kGiaSHXOGHWNm9S+4CXHzAz6jierxtMIreRki+MxFJhG7w0qlBm0AlzHqlpgc99D68
         3A1BYRYAhLTpXDK3mcAvtU6C9JV6Xmzp8qReMciSSzalYUTLVo/vr41z9jtAzjSmTFKo
         Pd2g==
X-Forwarded-Encrypted: i=1; AHgh+RrEiT+6pJvCAjxEhwTBJRIzSOyUvpddbMaLrulUfG5LWQ79BNL9NeH54Je/qjgzQ/FwGp+v18ro6bfHA0uZzF7R@lists.infradead.org
X-Gm-Message-State: AOJu0YyqV5zwGo/armFqlMPEdPKdLJ+UBJ9LzoGg9vCSSg5XCneGGNF5
	RLYxz8eQA2toTC2sB5NMwkiB7Sn5Av+ib3ezk/g54sRG7kbr/QVfU4q1LzXUvnthykA=
X-Gm-Gg: AR+sD13lKo0wUoZ4zfaLagXEKTYgA/XZpZrPTMuG5laXnyKsY5CfeESrctRvvzdetkc
	dMpeJ9xMa8APgbvZ91DNKQpWZtny+JhYV46R5dg1WUJHAy+VNlnOysDsAYI5pLie36Jm5BX/kZr
	M1DQvmIwqRVZOuOXhMBvjp2odLYaw0BNOjtOMOivtFf6a/cId03+yYp13z9cjVJeVlMRB0mn9qI
	VM5tj6EnrhUEVWFpGTVhmx3Dy7lsdGxCPZBk/CrBsnnw40sIHBTDHogxEDo/yitPi6lL1ryIkH5
	MgQ2qgj6yeZKRJAneXzCsPRasZur9wjXXKATZlVbigP3H7D9pCajPVw7Y7VjC7Qhz1r+9OG73gu
	WjZu+xjaSgUixBGEi2jokD5D/1cmNNyJqftpPPPqm0f0UyhcXTdBhgvmkIEt+TRBH84FdlT2FzW
	J0EHL04fPKHufeRdJq0rY7CnRlxdjheXOc7m3s2KS2EZoHf6fAYcTizZ1IafcZeaZZ
X-Received: by 2002:a05:600c:4709:b0:499:5220:db3d with SMTP id 5b1f17b1804b1-4997a65ef59mr12003705e9.16.1786462266487;
        Tue, 11 Aug 2026 08:31:06 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:31:05 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:14 +0100
Subject: [PATCH 11/14] perf auxtrace: cs-etm: Capture wrapped snapshots
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-11-90565318f5f8@linaro.org>
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
X-CRM114-CacheID: sfid-20260811_083108_292349_25B6D9AF 
X-CRM114-Status: GOOD (  24.20  )
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



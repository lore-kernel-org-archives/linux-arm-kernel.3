Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D25606A926
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t/JKpZyc;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EsUIt984
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6POGoe9GP/LfncNNPmyOb3NHHZhyrYu1RabNz3eag4o=; b=t/JKpZycg17+h9
	3ag2owkivRPJ6m8Ei/JLdMk38lER0Rrg8FSQ2LalgHZlNrXgFnREUD/kQU6prB04t7J+UqwoWeI3e
	vv6A21YzQQht5vZTqA3Pate0jxbYQMPoRdmKScMx7qanGFgBXSxoEKZufR+fe86m8AIbhmWiZqR6Z
	+bWTVDb7EgoJuRQvUDBv2TsJz4EL1TTWjNNarhbOT+bnY1EUiDUd+BHbFPvsuMF8ZIquFuN88VrMn
	RA1zd4NdUmvIDVGGvtPUKstYC7WWX2SSenEDbLbWVMt5m6rgqtuC1bSSG7Eq5dyC6I3RZrzQZhYfv
	qUKf612s3LItmgBOZHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvul-00000008jVR-35tQ;
	Thu, 05 Nov 2026 11:45:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuZ-00000008j5l-1jbF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so6046975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879141; x=1794483941; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6POGoe9GP/LfncNNPmyOb3NHHZhyrYu1RabNz3eag4o=;
        b=EsUIt9840J0UDvnGf+dzWd+ZI1j7UaHWB2zg+FMgq8Ym6qESLMsNO/12HeXvmFXu+Z
         ch8rIWoiiXn7Jq4bXwa5F65roHjmUFL882D+fG9uxT/COmYCxSwzwlDeP0HP4Ipv5s/O
         i+Odlz6D77biBWx9oNH/FL92+t4+hkZAYZQE8TdUZ15iwU1oXMtx23Jcl1iphW7cTUy2
         dyoG0TtODn9tLsA3A14MmAfMlNx+xe/s0eKXhHk0ebJ194rKutW3xUPLkIfO18dhJ6ZR
         yuxzQxjEAXuKIN0FDZ1kI7r7e6BngOKzYTYDxgZUeaxKqU3Gu7GcX+ySyxapb1suo3WG
         Dy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879141; x=1794483941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6POGoe9GP/LfncNNPmyOb3NHHZhyrYu1RabNz3eag4o=;
        b=q2sApfma/a8PXijhokCEYu3QDEJsGF+extW7cXDJehIEFme4QAHOywl1rJ2HiRN/Vl
         ZZL3WvC/G2VyC6KZzVjRPzSZw+RTAKnamY24u5PomO7YSyYBqwxx/WJ+wKyS+mkqr0VF
         dQZVCoSuaXCjDK+JuyqzyDQMR4xejyg2mTWWwn9UgOO0nlMSuyZfkk2v3fZtHjrrCyne
         MH1QQqeRFwjgek3phWymVA+IEc4+icm5kOT5V3r01nMoKGT1MeOZWhXUmArljlE28sW+
         ufduTb2Gyu0HAy1sgX9aRsOtcrUHbYy1OLClIzdgiCCQaoffWm5M2xa5dROFhRzXYzpx
         AGWA==
X-Forwarded-Encrypted: i=1; AKwUvBxwlY/aPMyeCA1PkrRHW3gs2kxPTZDlmf56vPkE4tIxPQ6/gSS87RgNAzu5oMLvXJjop67w0hCqg6D9RKU2k3jG@lists.infradead.org
X-Gm-Message-State: APuU4Z+YtuVICBNMJkFeH0exjbLmTgj8/OTtrZaDp4CXa254xX4Q6mDK
	0fHzwKqGSbgfTT4wOiyeDq590leH5P1wPe4EQ55Hz3SQYn8r7et+k68RDNnmrzxgiAk=
X-Gm-Gg: AYBFou2c2NMClwfwlArKmBiRaS2grAGqeuEbKELonOQqhVyz8rA+xOR8gARmamRFiY/
	XY+311xs9005MsHWCK2x/Y3TvSO6TrWKdM9Jy8cc7jTK1cOGBbVhJcliRLM8mU4lLSB5W8Wz28p
	gGOsdmbGfZWaRn1cKOdTufxiBdL/PYrLdS4dbGm8lfk7uVVcJsS7aSdR2+e2Uu5IFRcYTQkULHQ
	hVqNg02P4mGD+ShwT88mnFwhwEdAKoPWFIImO6er8j63neHrfsoj7xRgBFUD3UaG9vb4z9jpLYC
	bkxBiM1fwCHFAmRleeQN1/seSN8xcDozLCq90mW89PmSNq9y+l80tM8gmPusWS7m0ZhXVU+BV5L
	iSS63nhP8NdJzCNRZtEV9jYtw3aeZNtvKmQLFvM1zP6Gdw5E6RdoGlR5FOQBueUUxijRMKHpPkb
	PGNOeKyBz0BudI3kpSxqogrzpZ/o9ZeJLxP01wvm1onf1yJ0GB59R7rgdCzfaECXTByDMVzMGV3
	ZpAZfOjQWcEUKF2HdqmmhgRsF6N2pAoSy5wQc18CGN3n2hWN4zHeU/0w7FNsq2pmDfbpJjb/Hm5
	+xiZEw47UMNzqoOON0aKBoXcC8Ze3BAswZrRCCbcEN8lj43N+cCtiZY=
X-Received: by 2002:a05:600c:34d2:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4b55e07e6d5mr40258725e9.16.1793879141088;
        Thu, 05 Nov 2026 03:45:41 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:39 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:03 +0000
Subject: [PATCH v4 15/19] perf auxtrace: cs-etm: Capture wrapped snapshots
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-15-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_034543_506958_1AD6D8F5 
X-CRM114-Status: GOOD (  24.20  )
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

find_snapshot() isn't implemented for Coresight, so when a wrap occurs
we only save from offset 0 to current head, modulo buffer size, rather
than capturing the whole buffer. Coresight drivers currently use a
monotonic head pointer even in snapshot mode, which gives a lot more
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

Add auxtrace_record__monotonic_find_snapshot() and use it for Coresight.
A monotonic head can't be auto-detected in the default find_snapshot()
by checking if head > buffer size, because before the first wrap a
monotonic head looks the same as a wrapped one. The search would then
falsely detect a wrap when head is near the end of the buffer, and the
wrapped pointer fixup moves 'old' and 'head' a whole buffer ahead of the
driver's head. With a wrapped head that doesn't matter because only the
offset within the buffer is used, but with a monotonic head the next
snapshot would either save already saved data again or drop up to a
buffer's worth of new data.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c                  |  1 +
 .../perf/tests/shell/coresight/raw_dump_stress.sh  |  5 -----
 tools/perf/util/auxtrace.c                         | 23 ++++++++++++++++++++++
 tools/perf/util/auxtrace.h                         |  4 ++++
 4 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 5e7d09b7170c..84a5d7392a5f 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -922,6 +922,7 @@ struct auxtrace_record *cs_etm_record_init(int *err)
 	ptr->itr.info_fill		= cs_etm_info_fill;
 	ptr->itr.snapshot_start		= cs_etm_snapshot_start;
 	ptr->itr.snapshot_finish	= cs_etm_snapshot_finish;
+	ptr->itr.find_snapshot		= auxtrace_record__monotonic_find_snapshot;
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
index c613efd83223..3aabf2f4bd47 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -750,6 +750,29 @@ int auxtrace_record__default_find_snapshot(struct auxtrace_record *itr, int idx,
 	return 0;
 }
 
+/*
+ * auxtrace_record::find_snapshot() implementation for drivers that don't wrap
+ * 'head' in snapshot mode, so it's already monotonic like in full trace mode.
+ * No search is needed, only force a full buffer read if more than a buffer's
+ * worth of data was written since the last read.
+ */
+int auxtrace_record__monotonic_find_snapshot(struct auxtrace_record *itr __maybe_unused,
+					     int idx, struct auxtrace_mmap *mm,
+					     unsigned char *data __maybe_unused,
+					     u64 *head, u64 *old)
+{
+	pr_debug3("%s: mmap index %d old head 0x%"PRIx64" new head 0x%"PRIx64"\n",
+		  __func__, idx, *old, *head);
+
+	if (*head - *old > mm->len) {
+		*old = *head - mm->len;
+		pr_debug3("%s: wrap-around detected, adjusted old head 0x%"PRIx64"\n",
+			  __func__, *old);
+	}
+
+	return 0;
+}
+
 int auxtrace_record__options(struct auxtrace_record *itr,
 			     struct evlist *evlist,
 			     struct record_opts *opts)
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 9d86f8366ad7..980acb2dc687 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -607,6 +607,10 @@ int auxtrace_record__default_find_snapshot(struct auxtrace_record *itr, int idx,
 					   struct auxtrace_mmap *mm,
 					   unsigned char *data, u64 *head,
 					   u64 *old);
+int auxtrace_record__monotonic_find_snapshot(struct auxtrace_record *itr,
+					     int idx, struct auxtrace_mmap *mm,
+					     unsigned char *data, u64 *head,
+					     u64 *old);
 void auxtrace_record__snapshot_fixup(struct auxtrace_mmap *mm, bool wrapped,
 				     u64 *head, u64 *old);
 u64 auxtrace_record__reference(struct auxtrace_record *itr);

-- 
2.43.0



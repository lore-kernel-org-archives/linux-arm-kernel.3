Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02E3C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqfzZM8zBnaNvy70ESgvPXpjemsAbMaxUvbbfAWEGvA=; b=P/+Xe4iJEh4LQwHoR1bicZteqt
	SYxEitr+Fjgkfunna8zmvVrjD8OoTdz5cEsYykGZQ1SwhKXhXfQ0YxeizlaQ5VjLuS892rzYbUHiE
	/01fAPJH5S2cdbrLvk+htL62iixJoPn1M0K73V7fbWfWzqgaDVQtDnaNOs3XrL9cjJmolH2RfyuhU
	Zgee269SKVg3Lye1WEMoe8aAIvVJb3UCXQ8kJPjJlEQQK+TbjXA8XjUfVeAJTymwTYAztfX+vst6j
	uqRHQ1JIj8y7jJ8biKGuh5jrWW+GQQZdtjYVepxdgZyDHXa5Av3NXw/hwvAjCr36PLhGdZjWRfpzB
	nCcAPumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRa-0000000EKMA-0dGI;
	Tue, 11 Aug 2026 15:31:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRS-0000000EKFK-1Fap
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:31:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4954d29264cso5493655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462260; x=1787067060; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BqfzZM8zBnaNvy70ESgvPXpjemsAbMaxUvbbfAWEGvA=;
        b=GMFs2wgiyf5MgZIsvm5V/L9gUaSpWklAprPMUmdZ8TNlH2h9qStA+WCGmeuWRBYXCe
         TY7OUz3MvZoU2y4lKj+v12jv0oBiem+6/cKmXgq8hI0xsQ7sWGF6d/LW04ZVdj6ocUo+
         sOQs6VucqDpWwy7l7OTDDbTl1tAHp9ey6mEkNQyGDX4o0YGIKBEAfz0OIdvwuieq1llJ
         EsqrItSve3JgWodod0LOb1m1DBe42S1EDI2e1dafUmDX7kHWaG68BAQPwbV/xsCj7eMi
         etmCLD85zjjqkhU/e9p0Mr+xmR/8k8q5SzNCUHz9547s4aLWxSUlOhONrf+Q/fumvytx
         HN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462260; x=1787067060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BqfzZM8zBnaNvy70ESgvPXpjemsAbMaxUvbbfAWEGvA=;
        b=sxa/7+y1UnN+gk3JC68v+qiHuFYq09jGaCRXbfI7ZN/Kd16pXXk5TrfpLXew4NOz3c
         7y+yVR7Y33RlctzL2wId5k2LHw1wQcC0TCNoEQNFLS+5T+D7cePJKh5E6DbgE4D0Fztv
         eDofVsHUPcdigTBY6oopOCZ1B0pCnGZeaTEhIBCpiQygtPrNvgmpy2I4v4IPDnzFa80h
         ilvOlYufgWfipoX3ZltfntZc4KoojCMLMOgix61AvgmE+9oo5bEpMyB+lhhiNk5wDlEu
         8/EY+G4QVA/oN4qJj3sbk4D5KIPQSPqRiAnNCCn4H5ps32m/iMWeOjVKDbTkt9SZdM1V
         Vk7g==
X-Forwarded-Encrypted: i=1; AHgh+RpeTREg2+5j/3KkrJATZfkp8qfZDVtC/zsJg9wOpKdcFnUw2zB0K2tseMDogZbwCgE++9JOxl2OSQZ3WrQkWQDT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3zu8NNNvUES0ElDT4GR4rtqebCITqxCFDRjeCZY/6OSNub1Qr
	CsaHI9cntNMDZMIr6OtzJMn0Myjk7gD5OtG8Hmnw7sxRVFFIY74Fx2OeBoKsn8U/JLA=
X-Gm-Gg: AR+sD13T0ROSjcYvpau1HIEJPRZlMdDcGJbxGJR7w0Sn7/n+VpEdhtDCEzxuUQroqbW
	6IH3f0OmWm7TL60VqLKaj1cr+Rs9lwbqWJJRsSsqcxD6eYXE/c0NpZ6v24rwVcYMyI7f6tNX+2i
	vGuZrG/BqcSqJ0cmSwbDRtOBBkIpIK9rBHowi18M1F2UYv87LWQhEhcOJtutZGUiBOcdoN6kGIn
	i/N1mgjrjIS5Ku1B7bS2PAF+Mz44J0ehvDiP+GvyDzdt/eoz+ZnyAVLEMxkqUJVDuUfay/ARIun
	uD4T98MsBm5UxVPYOTXHCuwLBx+YH1Ga9oBejRc+8zK+YeekRwK+pWq1BJernznujye8o7sybQH
	urWf6Ny9O+khNYEgGQRkxgsTepsiCCP4SJNSl+1hvCgQdSZQMAaVKqaiAI8a393dB/+OV85luWC
	I1UWKENiPeRnL4lSpkoxadx9PbVpx7kSMZ52fmczoZeYI+MkjyATZcuroRIPTWlr/t
X-Received: by 2002:a05:600c:6305:b0:495:7a5a:d96c with SMTP id 5b1f17b1804b1-4997aadefb7mr1062005e9.18.1786462260473;
        Tue, 11 Aug 2026 08:31:00 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:30:59 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:11 +0100
Subject: [PATCH 08/14] perf auxtrace: intel-pt: Use new
 snapshot_has_wrapped callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-8-90565318f5f8@linaro.org>
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
X-CRM114-CacheID: sfid-20260811_083105_623322_D2DCD84A 
X-CRM114-Status: GOOD (  18.70  )
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



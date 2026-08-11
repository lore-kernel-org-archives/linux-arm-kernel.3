Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6265C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ne4dLz1fWz978dK33mNbt0k4ckMaGsbkZeA7j/BD+8s=; b=OJ51XHBxYsg8t6lwMvYtNlqwr7
	Pbq/BH42omYCB/mBniITweHPKgxKTzKDXwu7H0vNckwNEt9E/NQeSAORbGgf5bwesLXd7naNkqAHK
	3dbDCG+lyis4tSfoXe3hwJCmPXyDIyE4y9e6mRXe2kioS7H3aBcvyEDKBkUJEawylalUaY7ysgV/8
	YFBu80K5xnS6PYDXRiEh5GMgPKsNkAn7kZM3irXbZUUxHZKsgsuzTyEiatgPJwcRuzgcOug/cWzhf
	bI6zX3QxfDbwnx3T2uPiaQQOw7eFD6u2RcIYWpgD99huQFC21J4LOmLQH78dHSPe5qpzqQ5WbyeeR
	m0zM//uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRQ-0000000EKDx-1iKv;
	Tue, 11 Aug 2026 15:31:00 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRJ-0000000EK9c-2ieF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:30:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4957eefd361so25126075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462252; x=1787067052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ne4dLz1fWz978dK33mNbt0k4ckMaGsbkZeA7j/BD+8s=;
        b=DdhA+vFkgNJYxeC3UCNnkjw33SGVjeUPKrkxDu+eFC2q+4eyuZboHKVxtEQOQqk9++
         xoY7OYTjTDhVvEVOsP6Ca58RHQp1D5k1LS4/pGQOtjBeThm5cno7QrNr28W98le1xO4a
         gdxUWp0MFQLVsIpLDEURPiL/LLdErZu898ExURmROdc+B8y+RBM8S2Myk2s2JZKQX1dL
         FR4FKXDfhWFoNVEb+hFwjIu+79DafoT8mmAEKXNfUwPkv6FehAAVdn2vqAs5yAqiuhhr
         YYsC5U9EVJkCui2RYQu62x1SQHSC64E2N9LJdDltGBPcJhq+7bwAR7T6YwN754IU6A6i
         eztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462252; x=1787067052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ne4dLz1fWz978dK33mNbt0k4ckMaGsbkZeA7j/BD+8s=;
        b=tAtH+8tT7zBnlmQGQ7sDZzvXLTcHkrmG9wtjBU7PfWLMJYCwVWokKE/bFiGhhBnstY
         AxnBVnUXXiEVMpK/gK9kZTDe61Mu/o+liyCwDG2UCbfsZ3FfgGRxkLx3RxZx5VFiOyY3
         SeMkYRwp7WvqjSnIq45loGQVx4RnPBGzagXqP71GxuZcJJ60wuqgoV6BexGjfnv7+5ip
         /9A/4NbhgljlidcYC8cB792JQ1liffCD5+bUe4Vp/RwSUG5dYW3KPSfz8MdttAK7J4UG
         /Pvn23zDl+3+e7nQu69xOcAZ+uX3dV24lhS9rS4uzAAd/Vya21CwHDDTb0snFiDg0B5a
         ZmMg==
X-Forwarded-Encrypted: i=1; AHgh+RoXjH47KKzc2Lba0c7LjYJM2TDSq06qGZFu0I0+ZkHjxkw7qwvqq6hI6d9om/HupUp5B493K1J+DateIAVPjRee@lists.infradead.org
X-Gm-Message-State: AOJu0YyW27j2kZug+rhGJICp9r/SfX/YGCuAh/NPC/21kn9ukjWBoo5x
	joovRFArE7Pp/AQRJB2CQNP9QI32FrqqrUC/r3M+DujHaea/LfMRPitD4ES6xeown6s=
X-Gm-Gg: AR+sD11lN2Y0a7z7oFgC97iIab/6W926FZIpM+YzS0RPbSyiTjp0cnlWPnIrRid39+W
	zK1RJ/Scu3QFS7jPXRAXcOdRGXSvlQlCyenVw7QhLLeoNcjWEv622AWWzw0frqJNOXlVfO971/d
	Eoi2Ha3MklzBQRQZkPpAQb79YIgfgbwoQR/+GM+T+uyXMwir6pPfaN1oUo1cfhc+88jU/bB4lDi
	NIxHgr3VpdMfl6fC7kYXt/78pm3J0BeVUkbR8Mikr7ClhV0HFi/egNr/YdDTm8CIdEOXVx0Tgfi
	JDWlX6QtIIDWfr9VAJHuNuYz7wI1a33DFiXXr0Yfyyz4NMKWtpZtOJmNe2wAeehCPBtJTkhu7U9
	+fRPagXBPTiYtCNeKrevaJyyd2Hfhr5Fnlyw0/6Skx2cu62vKG3/CZSjmDAJ/wg7vEZ01SRTMeH
	3rCMFtdibAzJA1LMilFtYtPnDHRTjXXuMsZDO9rCa+V4OeS5OlgkONbxcLj60fGpSqTAd2JgMLX
	xA=
X-Received: by 2002:a05:600c:190d:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49978e1a90emr57210825e9.6.1786462251684;
        Tue, 11 Aug 2026 08:30:51 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:30:51 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:07 +0100
Subject: [PATCH 04/14] perf cs-etm: Use per-CPU queues for per-thread mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-4-90565318f5f8@linaro.org>
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
X-CRM114-CacheID: sfid-20260811_083053_719272_09AFBAED 
X-CRM114-Status: GOOD (  21.23  )
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

This fixes two problems, firstly per-thread mode didn't support multiple
threads well or at all because we always use queue 0 and assumed it was
for a single thread. However, Perf attaches to all child threads of one
process or allows multiple threads to be specified on the commandline.
This meant that trace before a context packet could use the wrong MMAP
for decoding, and threads running concurrently wouldn't be interleaved
properly.

The second problem is that we'd put all HW_IDs into queue 0, so if a
thread runs on multiple CPUs then it would receive multiple HW_IDs and
trigger the assert that unformatted trace should only have 1 decoder
per-CPU:

  $ perf record --per-thread -e cs_etm//u -- taskset --cpu-list 0 \
     taskset --cpu-list 1 true
  $ perf script

  perf: util/cs-etm.c:3381: cs_etm__create_queue_decoders: Assertion `decoders == 1' failed.

Fixes: 9182f04a85b2 ("perf cs-etm: Pass unformatted flag to decoder")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index d423f1cb408f..28f5ce63ba80 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -295,9 +295,6 @@ static int cs_etm__insert_trace_id_node(struct cs_etm_queue *etmq,
 
 static struct cs_etm_queue *cs_etm__get_queue(struct cs_etm_auxtrace *etm, int cpu)
 {
-	if (etm->per_thread_decoding)
-		return etm->queues.queue_array[0].priv;
-
 	if (cpu < 0 || cpu >= (int)etm->queues.nr_queues)
 		return NULL;
 
@@ -2160,6 +2157,7 @@ static void cs_etm__flush_all_stack(struct cs_etm_queue *etmq)
  */
 static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 {
+	struct cs_etm_auxtrace *etm = etmq->etm;
 	int ret;
 
 	/* The current block is not finished */
@@ -2188,6 +2186,27 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 	 */
 	cs_etm__flush_all_stack(etmq);
 
+	/*
+	 * Per-thread mode still uses a queue for each CPU, but that CPU can run
+	 * different threads. When the TID from the AUX record on a CPU changes,
+	 * re-initialize the thread using the AUX record/buffer fragment TID so
+	 * we can start decoding even if the context ID packet was cropped or
+	 * they're disabled.
+	 */
+	if (etm->per_thread_decoding) {
+		struct cs_etm_traceid_queue *tidq = cs_etm__etmq_get_traceid_queue(etmq,
+							CS_ETM_PER_THREAD_TRACEID);
+
+		if (thread__tid(tidq->decode_thread) != etmq->buffer->tid) {
+			thread__zput(tidq->frontend_thread);
+			thread__zput(tidq->decode_thread);
+			tidq->frontend_thread = machine__findnew_thread(&etm->session->machines.host,
+									-1, etmq->buffer->tid);
+			tidq->decode_thread = machine__findnew_thread(&etm->session->machines.host,
+								      -1, etmq->buffer->tid);
+		}
+	}
+
 	return 1;
 }
 
@@ -3245,7 +3264,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 
 	if (aux_offset >= auxtrace_event->offset &&
 	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
-		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);
+		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, sample->cpu);
 
 		if (!etmq)
 			return -EINVAL;

-- 
2.43.0



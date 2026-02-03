Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4954E87852
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4Lo69Fl4f1ujd/UcQ8IKUv7cnjD0QPa0txh8j6kiRg=; b=n2AR2mS3AR0lva2MQqH/+OCnWC
	GqyBHptYr4+mW4RZBml7bfkhw+lqnrDgqI5thUMctZj9SGw5f+Wwkkp00mHYXEfIqymjRgGYDahLJ
	tIou8+NGynKV5HMTsiizWQhmfwfF4/pLH/5Tq11jQ9VUmUqo2bisNEArjwYAJbZ6UTms8WQ70tqYk
	Vp3A5Uk8KIfexKcITXTyJEdSm90Y6agjDDFOAxkM3mxSZc4GmR7BXODFqPFJr4P+LCvhom2bGisaG
	Io8Vj5N7A/urpLHBFXlBKQIeMWW9AX/lGL9+4YU5pFL14tKy+Zvds8f6DklDj05/+IFJfe0IyjYrY
	NogYJmBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL7c-000000078iF-0CnS;
	Tue, 03 Feb 2026 18:27:32 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL7Z-000000078eC-0tQS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:27:30 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2b8295e5703so4121044eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 10:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770143248; x=1770748048; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b4Lo69Fl4f1ujd/UcQ8IKUv7cnjD0QPa0txh8j6kiRg=;
        b=j7LfkICwLXBj+glKfU/3csrxTHWlnBWNTQ2ZWvS2w2IjTrYPFGdTzejgr5uHLaLcWb
         yXCqxy+s5OsNbBzsThPS6YRTW7gbJRLVbbO3+1rWj2eEJXARTCnOich2nLSlqiLiVAUm
         ZTNGWar0QP4use4XIJiGYC8r/Xeb0R3iL1yDopP83q5E3/KuureCkv9GtDek53sj12r9
         EQVmPWC1BQK5K1+T3T698eEcLIaV/jWC2DnHY1lEHNk1YLHLwMUEx8pa0gMc8DN1fkEd
         TG23/9pMcXdb7XtBvRLRbBeUMw35KPEIR/amEQzb2sVjR57VZZ9J+Z+dxdZvAabe2/IY
         lOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770143248; x=1770748048;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4Lo69Fl4f1ujd/UcQ8IKUv7cnjD0QPa0txh8j6kiRg=;
        b=Q6iIkdFPnQgbDE3hp8a2AWJsuzwmtSu5yn+mWBIE3bv2kYI7lxbfuwBjm4VqA6dJhe
         CFMTMjGSPrK4H00VDOgJs6fHWK5jDCBdd2TQ2MDHO9IGTd4Kl+HkbHV9KAl5/cPgHgZV
         +K7oGM0wKQ6torXQ2SIlROhjI5YLz79Bv4eyHa47IhapFYOuYojB7av9qBB/Iq+Y84R4
         /BK5IyNoe6BBGIuK8zFcJ1rHHky1x6n7AuNtGeGJ7034OXs6iqeAlUUdUo7n0USA8nrw
         l/zqQbESM1t9fihPj5hOeH1MvKC8aoOGXi8ADy95c8r51W/NNQfVJ/vRDUwUfrqzpMDC
         ZFTw==
X-Forwarded-Encrypted: i=1; AJvYcCWOb55dlCOJAMStPFGDFxnd1fSs9QO8OR6sheXgE9TCCRcv6KX6mHalWQtnJ1pq5+Wj0zflYT6q1cmWWkvx2lVq@lists.infradead.org
X-Gm-Message-State: AOJu0YzcBxmE+m5+a780VXNWwRWXTktR3ASEUkKwh4NQdDPbAaigs6Rp
	x8YZ4km8pyqfLH01AtX4o7HnH/VvohFtNiUhuCoEOHhB7+EZtrrMopGwc28hw/VUgCfr6hnd9ap
	iGWkyyvzqdQ==
X-Received: from dybmd11.prod.google.com ([2002:a05:7301:180b:b0:2a4:6ffc:87c9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:a287:b0:2b7:f522:9964
 with SMTP id 5a478bee46e88-2b83296f2f4mr186503eec.7.1770143247875; Tue, 03
 Feb 2026 10:27:27 -0800 (PST)
Date: Tue,  3 Feb 2026 10:26:40 -0800
In-Reply-To: <20260203182640.3911987-1-irogers@google.com>
Mime-Version: 1.0
References: <aYIOMWb2sijXzSDm@x1> <20260203182640.3911987-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260203182640.3911987-6-irogers@google.com>
Subject: [PATCH v3 5/5] perf thread: Don't require machine to compute the e_machine
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org
Cc: aditya.b1@linux.ibm.com, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	ak@linux.intel.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, ashelat@redhat.com, 
	atrajeev@linux.ibm.com, blakejones@google.com, ctshao@google.com, 
	dapeng1.mi@linux.intel.com, dvyukov@google.com, howardchu95@gmail.com, 
	irogers@google.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, mingo@redhat.com, namhyung@kernel.org, 
	palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, swapnil.sapkal@amd.com, thomas.falcon@intel.com, 
	will@kernel.org, ysk@kzalloc.com, zhouquan@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_102729_285770_FB30B467 
X-CRM114-Status: GOOD (  13.36  )
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

The machine can be calculated from a thread via its maps. Don't
require the machine argument to simplify callers and also to delay
computing the machine until a little later.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/scripting-engines/trace-event-python.c | 8 +++-----
 tools/perf/util/session.c                              | 3 +--
 tools/perf/util/thread.c                               | 5 +++++
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
index 62c9c73daef5..2b0df7bd9a46 100644
--- a/tools/perf/util/scripting-engines/trace-event-python.c
+++ b/tools/perf/util/scripting-engines/trace-event-python.c
@@ -837,7 +837,6 @@ static PyObject *get_perf_sample_dict(struct perf_sample *sample,
 					 PyObject *callchain)
 {
 	PyObject *dict, *dict_sample, *brstack, *brstacksym;
-	struct machine *machine;
 	uint16_t e_machine = EM_HOST;
 	uint32_t e_flags = EF_HOST;
 
@@ -926,10 +925,9 @@ static PyObject *get_perf_sample_dict(struct perf_sample *sample,
 			PyLong_FromUnsignedLongLong(sample->cyc_cnt));
 	}
 
-	if (al->thread) {
-		machine = maps__machine(thread__maps(al->thread));
-		e_machine = thread__e_machine(al->thread, machine, &e_flags);
-	}
+	if (al->thread)
+		e_machine = thread__e_machine(al->thread, /*machine=*/NULL, &e_flags);
+
 	if (set_regs_in_dict(dict, sample, evsel, e_machine, e_flags))
 		Py_FatalError("Failed to setting regs in dict");
 
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 53f51c3f9603..4b465abfa36c 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -2972,9 +2972,8 @@ struct perf_session__e_machine_cb_args {
 static int perf_session__e_machine_cb(struct thread *thread, void *_args)
 {
 	struct perf_session__e_machine_cb_args *args = _args;
-	struct machine *machine = maps__machine(thread__maps(thread));
 
-	args->e_machine = thread__e_machine(thread, machine, &args->e_flags);
+	args->e_machine = thread__e_machine(thread, /*machine=*/NULL, &args->e_flags);
 	return args->e_machine != EM_NONE ? 1 : 0;
 }
 
diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
index 618f29afb160..22be77225bb0 100644
--- a/tools/perf/util/thread.c
+++ b/tools/perf/util/thread.c
@@ -499,6 +499,11 @@ uint16_t thread__e_machine(struct thread *thread, struct machine *machine, uint3
 		return e_machine;
 	}
 
+	if (machine == NULL) {
+		struct maps *maps = thread__maps(thread);
+
+		machine = maps__machine(maps);
+	}
 	tid = thread__tid(thread);
 	pid = thread__pid(thread);
 	if (pid != tid) {
-- 
2.53.0.rc2.204.g2597b5adb4-goog



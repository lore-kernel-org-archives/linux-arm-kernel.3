Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81112C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYjd0xAS1cNSY6XVrkyFUu4UCXh5rU8Z/1PEhyvhecM=; b=gJgNf8k2c/rmPAhO3ywviBgxc+
	IbZ3Fwf5n6P8FArjeti/URPqPow28vwuiHNssPCkke2FwnBoKECe1yXlmb7UDE1BIwU59DdWhvg76
	dIggrOipxLC3JwRBZIRV0AJ1w9D5o1RtsdD512E4UdhNTNj/bnCgSmEIs0FtTJFNZlAAcs/qwMex3
	INPRd/T8ldPIYEZufCCIanp6J9nsv4pZWiI/+Sjo9H6izCXYjPy7g73SALXY7/FSRKV/iFECWPpYC
	DWLY3RaV+ccwpLwItCQuH+BugSgjqdunoLNN4Z/HshPihNL7EA4lyAcQNyOiFFDsCCNmr4ciR5SBP
	0WFeQd+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLtj-0000000Cy1T-0rv1;
	Fri, 21 Aug 2026 09:50:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLtc-0000000Cxwd-3PPs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:50:50 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso8840385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305843; x=1787910643; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYjd0xAS1cNSY6XVrkyFUu4UCXh5rU8Z/1PEhyvhecM=;
        b=TyfFhQQHscH+KkjIrf3q6FAr0TdIrwKmaDnFHFu0RKR1LNLFzvv9FEubfm5PXPhBNt
         ydYgp8M3jErR58f2tmQSLph2iMDiGGvJFnZGKop4OzM3rkl6fdbGT74kyYcgEEoQoC1S
         8MTuT7Y/id6tPlE/p87E5VsGPAWEHTJp6hdgTiHgsgVYDs0mw9AV0+E2Yfr3R52JHzx9
         +H69j3Zs5pkWxi4WRWSCtdJfamTCoVBjQ+WjK1N9zrHutOie/fC14a00U4EJTE7n7HKi
         bi3moZyyC+ncypqanwQoYpc9fi8NZTJTq8sEVi4HMqsszGgAG+d7kaq34d0sDTZHMMwF
         4P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305843; x=1787910643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYjd0xAS1cNSY6XVrkyFUu4UCXh5rU8Z/1PEhyvhecM=;
        b=H8KYy3L6HW88KIq1C4remhgeESYawnrtX6MCKJA3ADrcVI7wj6QvINcQiOy/4CgCI+
         IIN7wTiOGQIi0QihMu7zf03lloYEONJCPivLzm4TP++qFmNCbWE/Z2vsGY5OXCb8vA22
         aY9q/3YBQYFjAa0jMKxXjbCSYNs3kxhc2qL+YNhdjVsY/ukPNbLguKZcDv/gqOgrn0yH
         Ay26/y2X6Xh47JXdg+mjvKkdSHRw+dgMFCAuxA31hYPYzN0um3oC1XEfvxVXZyqYSJNN
         kNJxDnD2qh7naSeG6SLIebUxpb8s+a4QMD1ev4gtblhDaX5MlS4brEk2LErGXXBi1NG7
         EHCw==
X-Forwarded-Encrypted: i=1; AHgh+RpUNGLVTcqVjwydYMHXNi6mWx85dsjsi2lhnoiNTFuYOa97WWFj3McrlOvMEDD72ji8dFCAGu7SWCn4AtyZy4OJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/luyMGCGsbr6CO1A/WnAbdxgpAd1CcF04ohotFedua6Kal7sL
	WE64g67gmIXGAU+BFItwlSNYM/qVrV2jl/6N/2GkJuIHiKz7HJamx/l1hWAga6KDMZs/xHT/Dgh
	FAYgk+RM=
X-Gm-Gg: AR+sD11bv6Ig1fFDAsN17MhI3Z9nu1pTB9tZXonxj5TRUBW60jY0VwL5olAMYv7mJtJ
	ieuVB2fC1gZySWlEMCdwcToyF7pvNqrNIRbQcrQbhijZZRQJY2oK3YGT1cqBwoX71R300SREus2
	9pXObh4U2ajzVZ97gN51cRot+f+cvQFJg4jJKLH9cBSuMCE0gnlCs5DIKPfuBKxCMQmZq2SQQo7
	tBkhNPRTieSNolcZtH157WMxNd8wiU/13E+iJII1V+B7VDQ9zOA6xoCphke8bhY5YVzCfKLVAuF
	+NH+tKuaQXLpiSZRVAVKs7h5tsHVd9B8nyzpTL5S2lp7XaA76KjG7UoDroQYYwXtZSD+KmWevOi
	SUO/1loEJAm22oa/U2+QZYG80BPqhtQQd4EPs0tUbZ5M3tv0aF5jwQlIVVkra93QSOULPD3Yih9
	L88mUrxZyG1qtiY+JgSr4FcQjxXZ/NmeHYklXqo7QKSmks9HIubPLPvBkUcO7OWhG8JsYHXA5gV
	88=
X-Received: by 2002:a05:600c:c4b7:b0:499:900c:9c68 with SMTP id 5b1f17b1804b1-499b8310653mr65038535e9.6.1787305842976;
        Fri, 21 Aug 2026 02:50:42 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm14474284f8f.26.2026.08.21.02.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:50:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:50:30 +0100
Subject: [PATCH 2/6] perf cs-etm: Free partially created queues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-hw_id-output-failure-v1-2-9d532ddabcc3@linaro.org>
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
In-Reply-To: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_025049_093913_1EC2E469 
X-CRM114-Status: GOOD (  13.83  )
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

cs_etm__create_decoders() can fail half way through and the
err_free_queues label won't free them. Call the full queue free function
here instead. If no decoders were created it's a nop.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 8dfafd389066..44e20067da1f 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1014,13 +1014,10 @@ static void cs_etm__free_queue(void *priv)
 	free(etmq);
 }
 
-static void cs_etm__free_events(struct perf_session *session)
+static void cs_etm__free_queues(struct cs_etm_auxtrace *etm)
 {
 	unsigned int i;
-	struct cs_etm_auxtrace *aux = container_of(session->auxtrace,
-						   struct cs_etm_auxtrace,
-						   auxtrace);
-	struct auxtrace_queues *queues = &aux->queues;
+	struct auxtrace_queues *queues = &etm->queues;
 
 	for (i = 0; i < queues->nr_queues; i++) {
 		cs_etm__free_queue(queues->queue_array[i].priv);
@@ -1030,13 +1027,23 @@ static void cs_etm__free_events(struct perf_session *session)
 	auxtrace_queues__free(queues);
 }
 
+static void cs_etm__free_events(struct perf_session *session)
+{
+	struct cs_etm_auxtrace *aux = container_of(session->auxtrace,
+						   struct cs_etm_auxtrace,
+						   auxtrace);
+
+	cs_etm__free_queues(aux);
+}
+
 static void cs_etm__free(struct perf_session *session)
 {
 	int i;
 	struct cs_etm_auxtrace *aux = container_of(session->auxtrace,
 						   struct cs_etm_auxtrace,
 						   auxtrace);
-	cs_etm__free_events(session);
+
+	cs_etm__free_queues(aux);
 	session->auxtrace = NULL;
 
 	for (i = 0; i < aux->num_cpu; i++)
@@ -3520,6 +3527,7 @@ static int cs_etm__create_queue_decoders(struct cs_etm_queue *etmq)
 
 out_free_decoder:
 	cs_etm_decoder__free(etmq->decoder);
+	etmq->decoder = NULL;
 out_free:
 	zfree(&t_params);
 	return -EINVAL;
@@ -3801,7 +3809,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	return 0;
 
 err_free_queues:
-	auxtrace_queues__free(&etm->queues);
+	cs_etm__free_queues(etm);
 	session->auxtrace = NULL;
 err_free_etm:
 	zfree(&etm);

-- 
2.43.0



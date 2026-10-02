Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0DECA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEiJjq6Jc7fnijCf7RLJfnGkUIPBSRhorQ+d3FhIqF8=; b=tr/uw93T6M51dLrqzIUm2GKZ3D
	6p/gWUUQe8HG/XV52gHm/EjlWQoSKeMwNe4h9QcLsGr4vwPUFwQ8dMv8pKpfauFxRdUMUaTi10Bmn
	I8twsuXd2vqMx6ybJqvUcijhUWqw9Ba7+2QhZCygOAwDWjSjqcTdkmyu2WMiCFRwvp1tcw01U/+f4
	LleItnv+4ELQdMuV3d3ok88K/dLdh5yga2juvaUY1Npft/nw0mnvcUn3Xdz/r7Jsw6yUq/T/cNC25
	5133kdbVMXp89T6jZHY98pYOslj8w2RDEF0qw+5RgYC2L23iSDIUuNJ2HC3Sp716EqhJUCbFZvz1u
	vaXwxnZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbEh-0000000BS5X-0h0r;
	Fri, 02 Oct 2026 11:15:31 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbEf-0000000BS51-1AY1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:15:30 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a00713639cso42415305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939727; x=1791544527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEiJjq6Jc7fnijCf7RLJfnGkUIPBSRhorQ+d3FhIqF8=;
        b=Kk16X6x6jN6vCBQSI396am111shrsVghm2ktdPGGRUOWfCGbORhCUt+Ojm5OjGfk7K
         /Jg29KwSYdRa/a5IFmWk+/faAQ+dvOsSvIOmbpvmQcvlG3H4zl5pb//J3emCm4p3jOJq
         OHHtppa3EpNHbdKO7ZhRAgCtyigZ40LjjY0WcFBnaeelT4Y0vwtMK24iEWjLRtLvrz6G
         ulVMdqmUCgwBg//61puBIsW8FheYooA0YGxPU1pMm0KbIRa4rhE7ZtazKdQROM9atlrO
         99tmao3krYlqhLY6GTOOabC7scqO2DzKdhtTvCGWo3+IBwELJrhkIMLLaRjGy4Nj6+RW
         BcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939728; x=1791544528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEiJjq6Jc7fnijCf7RLJfnGkUIPBSRhorQ+d3FhIqF8=;
        b=XkVOtLAndtseSSHYp+TkqaaaxA0f5sGkRw31bY4VAwMJPDmQyF5ijX3vlYE2zGhkhV
         fBK2zv4lOvxcJU2J5k0wQiwcreY5Y5sMRrSqQLTRfkRfg/agC9tghOgZYoo0HQoEDl8F
         ORPLOUeHxbySiOZRLT2+ioa124g9Vjao76zp1mcxQ8kHl0BMC+vItiyT2mRceNTk8BfM
         qgSyfA5VZKAk+2K//SwSi32jWGLrYG/IlT5kL0/u/EKu2LasKR9f96V5QE0YcAzI2kXp
         352ln8HlvJeY8jR2TqHO9+5rDRH7pVMCkAJswWq5saLI+mVgcZKunr18eRB5rgeALArq
         90hg==
X-Forwarded-Encrypted: i=1; AKwUvBxybYJKz3dOu6ozy49XHWUi/ZFLXiL9rOd46dQggtsUGHCZVdS5Vd+jPMDXFX/4T6Dbzxe6AbEB35rNBbkUnY42@lists.infradead.org
X-Gm-Message-State: AFuF++nAaqp5kDWQISBGPM7MioiunaHlfk5ALujOWSdTjoUSrYT7/K3q
	iHUB+cxYYDzD79Xv97JA0RvnuazvHJVycF0LtsLZxRStdFHSe6ygrcyfIJOxe9Uyopw=
X-Gm-Gg: AYBFou1tTFHdzCErYNOwhnIQ1G84a9+VwcCiqqeAr9i1svrHeibLxSAxHq9lqbDQtc3
	C8tRcTbXOcoyLBLfkuczkHMzip1yxJDV8ZSJ6n1nZJh2NOvX8+dqI2d+vYzgxf6x1LrKIIoQPkJ
	o8d4UjBLE0mmxLUhrW58FrXPE/YVrQY9RCnesfztf885hS7pT0tkZvlzM20iZTmgtfl0+VieGrS
	xH/PaZVFJEiLMUMXTFz0/3MC6f0ocQOx13bUUpliloYado4ISqnj3GdzzOTSzOLynZ1hVeHdIPs
	JE+JGTIGTpaJ3tDm+m2Epa45t8ciCKwsbWD/ULaOiHEIShmJpiEKVY4/rv0Dwt9I6VaBY8T/gLC
	sDrb0qntyJJluGP/XWGLgMMHW0o17XGzt5IJAJA88YkQfL4ACHHzOgBMROy3QE7VMGBo4JV20qF
	DITpgUWK/1ynKsFBUYqrkITJ4tGWnSTZ132LEQE7rHeIanaxSjFW6MdMu/93yuJ231299Ar1wMV
	2ZbkukPHqmY
X-Received: by 2002:a05:600c:4f04:b0:4a0:a34:6e7d with SMTP id 5b1f17b1804b1-4a027564c91mr48663925e9.18.1790939727443;
        Fri, 02 Oct 2026 04:15:27 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38306dd4sm4752986f8f.43.2026.10.02.04.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:15:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 02 Oct 2026 12:15:11 +0100
Subject: [PATCH v3 1/4] perf: cs-etm: Don't add global v0 HW_IDs to
 unformatted queues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-james-cs-hw_id-output-failure-v3-1-1d8b6ef339c8@linaro.org>
References: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
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
X-CRM114-CacheID: sfid-20261002_041529_327431_CB679B51 
X-CRM114-Status: GOOD (  16.63  )
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

In the case of mixed formatted and unformatted trace with v0 HW_IDs, or
no HW_IDs at all resulting in the cs_etm__map_trace_ids_metadata()
fallback, formatted queues will write their HW_IDs to unformatted
queues. This will result in an assert because of multiple decoders on an
unformatted queue.

Fix it by not inserting trace ID nodes on other unformatted queues. This
isn't an issue for v0.1 HW_IDs because they aren't global so will only
add to their own queue.

Fixes: 19c3e4db38c5 ("perf: cs-etm: Create decoders based on the trace ID mappings")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 2d1ab34f7b6b..fda6b6c02e26 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -309,27 +309,27 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
 {
 	struct cs_etm_queue *etmq;
 
-	/*
-	 * If the queue is unformatted then only save one mapping in the
-	 * queue associated with that CPU so only one decoder is made.
-	 */
 	etmq = cs_etm__get_queue(etm, cpu_metadata[CS_ETM_CPU]);
 	if (!etmq)
 		return -EINVAL;
 
+	/*
+	 * If the queue is unformatted then only save one mapping in the
+	 * queue associated with that CPU so only one decoder is made.
+	 */
 	if (etmq->format == UNFORMATTED)
 		return cs_etm__insert_trace_id_node(etmq, trace_chan_id,
 						    cpu_metadata);
 
 	/*
 	 * Otherwise, version 0 trace IDs are global so save them into every
-	 * queue.
+	 * formatted queue.
 	 */
 	for (unsigned int i = 0; i < etm->queues.nr_queues; ++i) {
 		int ret;
 
 		etmq = etm->queues.queue_array[i].priv;
-		if (!etmq)
+		if (!etmq || etmq->format == UNFORMATTED)
 			continue;
 
 		ret = cs_etm__insert_trace_id_node(etmq, trace_chan_id,

-- 
2.43.0



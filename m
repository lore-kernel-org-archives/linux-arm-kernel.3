Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955E9CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkedwrzQI0rdKjNe52sGXdchQDXaBvZiPmkIP1sVIaA=; b=Oy42YVZDJiZdH6mS4azH1KjSdD
	qh+SCTK2n+Xizc7oYui5LLvixbaKzcuPrlZ7ub+zVnZuqYy8qWqSli44pbfgyjUIas0dvsC2miiXs
	/P2WjOKV2oJW9n56Iwv5zoRIUS5ZmN4f/HYmnQma7ff3c1LAxrUKqMkVEL+Bm1VGFVtQSsNZ+IxTg
	Q3pWgOhc8tmJL3e/KBvIUAIdZFqI7KJM1FEk5P81AhUtBGRZGPy7ZmVaZ70j7lbxPXfH6+fUAcu+P
	iDuJ6xRK20q3/7UDv1Oqev6qGbgKqYlKaFj4Frxq3Avdam/rlRb0kzZjxI8TE9ejeECdaALv+geHp
	eVFpZFUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfLW-000000010QL-11Rq;
	Mon, 08 Sep 2025 17:08:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaho-0000000GvBV-3hTm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:10:46 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so3378821f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 05:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757333443; x=1757938243; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkedwrzQI0rdKjNe52sGXdchQDXaBvZiPmkIP1sVIaA=;
        b=DHD4Uepzm6oATC2aTHKPzCQzoildIsiclrAh4F/yqhAQZ1Mk1FXc1ZjXtizzm2yYQS
         bx/UAvYEJ12cH44vl5taTIMQOn3ydqpLcLpbQtXPSC7i/gFVWkMep2ImNFmg2M4MSVVm
         0BCYSups4ZBH8mDgBsLuc/xKYMCk4H/Cr93OJGQdMgWbmiHa0RXnCB+UmaddQwNqa1ad
         ElCDKchrToMtluGHubwOyku6ipgvpgmAtumIULNCrjrN8GBQR3NNTa2kFTR7jE8j2nM8
         gehdV1coDV14JUSn5riqvUuRKK1vWDrUHLQ3CR85BZusy8XExk6voyezQiT9OfVjTIGB
         n/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757333443; x=1757938243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkedwrzQI0rdKjNe52sGXdchQDXaBvZiPmkIP1sVIaA=;
        b=cvpN1/FyXxc8pZJtkHEXHy+fC181vYM6gnnSnshp6Fvm/fgNx/s08nzfHnY0ITzGZ1
         /MYI0d8WJwSmYxlp7+ypw7m4s8JmCkXa1OAvfSae50TxNvfAzLXvMDvK3N/9wJEBG8di
         wWOkDETShZcfrIPyBkueE9k36JpwKRkiIqJlh8vs+1McVLOvSmZBXJZXe7x/Bq+zYazp
         TLy+8NzGCz5NJ4y35RuJ1fW2E4zQ+9QqBKzC+fAIbBbyNeeHcsRhiKUyEfNuwtEaVcbE
         bGCYhKlzwXmjoHrQGsvLgqMbw2Khj38EV0InKNINZTsLLZuxwZzqlcqM4fjGZAmuExSp
         t3kw==
X-Gm-Message-State: AOJu0Yyh+CXtkRYUYwoW8m1LD87ILTonDJKgVkaIyTjVCEVVPk32e9a5
	spRfUy1MltLKcYYzQmvCURKkJ9JBtdFVvU/v3+Kabksxpq70bHnoVcNKAdpZDKG1VV0=
X-Gm-Gg: ASbGncuM2S9zZOXtxN5fAshkbxjva1LJ26AKNFxApB33Fv2BXghxZqPS42Dvqcm0j9q
	URshmdvBM9t2bWo4I03JigHTkFoDHsot6EVZrRhqJEp1t4UtvsNHsT84kEwSgAMsYVOCI9UGuLx
	y6d8PFGYheIFdb4XHDyPBR9ICiU90GvL5qs41aJ7Mu89sHHWCf4Xc+xY5nJQzpofQ2R4+4AMeeR
	tb8pCnX3vx+uACX78GdK8+kdhdwRvhQ1I8Zhl/4wy7yPc+mTR7caz+jxxciaRI9xbhBF/fZNcvz
	c1mzac1yUXj+Z+KZQRuS/wJ0GxzFSzAHtbntsimHUmchYLgsfYyKdTrIZvW3IxxnDsh5L4zXDGZ
	uhfC4eVFMo9taoAKEPjXiRMtrc/vBD7BBNbhOznq4Jw==
X-Google-Smtp-Source: AGHT+IGak0uuuS5pIGUifYYsbhCa22YIqe9IhScFSAOd21dRmiIc9QfW//Nsn1rfDOPnEaB1ex4tYg==
X-Received: by 2002:a05:6000:2385:b0:3e1:a74f:f847 with SMTP id ffacd0b85a97d-3e627a7c83cmr6685253f8f.6.1757333443258;
        Mon, 08 Sep 2025 05:10:43 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fba9fbsm41397825f8f.50.2025.09.08.05.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 05:10:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Sep 2025 13:10:20 +0100
Subject: [PATCH 3/4] perf arm-spe: Display --itrace period warnings for all
 sample types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-james-perf-spe-period-v1-3-7ccd805af461@linaro.org>
References: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
In-Reply-To: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, George Wort <George.Wort@arm.com>, 
 Graham Woodward <Graham.Woodward@arm.com>, Ben Gainey <Ben.Gainey@arm.com>, 
 Michael Williams <Michael.Williams@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_051044_957669_8B4E0FF0 
X-CRM114-Status: GOOD (  16.16  )
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

Currently we only display the warning when the instructions group is
requested. Instructions are on by default, and the period applies to all
sample types anyway so always check the options and show the warning.

Reword the messages to be more explicit about which flags the warnings
apply to.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 4c81518a033a..228ed52e653d 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -1742,14 +1742,6 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
 	}
 
 	if (spe->synth_opts.instructions) {
-		if (spe->synth_opts.period_type != PERF_ITRACE_PERIOD_INSTRUCTIONS) {
-			pr_warning("Only instruction-based sampling period is currently supported by Arm SPE.\n");
-			goto synth_instructions_out;
-		}
-		if (spe->synth_opts.period > 1)
-			pr_warning("Arm SPE has a hardware-based sample period.\n"
-				   "Additional instruction events will be discarded by --itrace\n");
-
 		spe->sample_instructions = true;
 		attr.config = PERF_COUNT_HW_INSTRUCTIONS;
 
@@ -1759,7 +1751,6 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
 		spe->instructions_id = id;
 		arm_spe_set_event_name(evlist, id, "instructions");
 	}
-synth_instructions_out:
 
 	return 0;
 }
@@ -1877,6 +1868,15 @@ int arm_spe_process_auxtrace_info(union perf_event *event,
 		spe->synth_opts.period = 1;
 	}
 
+	if (spe->synth_opts.period_type != PERF_ITRACE_PERIOD_INSTRUCTIONS) {
+		ui__error("You must only use i (instructions) --itrace period with Arm SPE. e.g --itrace=i1i\n");
+		err = -EINVAL;
+		goto err_free_queues;
+	}
+	if (spe->synth_opts.period > 1)
+		ui__warning("Arm SPE has a hardware-based sampling period.\n\n"
+			    "--itrace periods > 1i downsample by an interval of n SPE samples rather than n instructions.\n");
+
 	err = arm_spe_synth_events(spe, session);
 	if (err)
 		goto err_free_queues;

-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFADE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 12:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52uSj8E/aVB15WhaSRtD8CBQxo0ybh/UWrgjS+bPGCI=; b=pG0jXMlJUgmRMmZtO7z4jFPz2d
	pxsglqXBknmnAIV7qdVjraIjSi5mlZgsA4Bkr43fJBD85/6Kx9g8JSyY2g+RGvPwrEXYP7zUpR3Ca
	cN8OGUPuDjrqWkwQiEywolXx4xEnbKffjbPwQ0Ed+PUVgAqY4kL5NtJVWH4gL46Cyh4naNJ6QmL0s
	UHKJZcP5PHT9HGVgYuV7NgGhcw07VkKJvu8CFIe6X9Cz9Zl4VgD6PFkFuE6QxCwYG0COBztsRQjzy
	pAq3YtnB3WvxaCue/Gu2JB1238+MJwhnL5meS8+82oqVHMKUzXGc5Co0RjsA2XQeKXpFUln8ro/+P
	Aru8I8cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWFq-0000000DKiU-0uDM;
	Tue, 17 Dec 2024 12:00:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWBm-0000000DJkN-3GIX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 11:56:35 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-434e3953b65so36359315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 03:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734436593; x=1735041393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52uSj8E/aVB15WhaSRtD8CBQxo0ybh/UWrgjS+bPGCI=;
        b=tbBqZ5za4aEw+OjtekjCXsJPilaGvHfMIIlmSCgXCYeMigAX1YujZa6DDM8UKjdrgW
         mI/rSRDQxwEVQ+WjIVByeT9xoznFDQHL6UgXAYlXSAiKuq3UYUu5BGgZnIO+puJy/2Ks
         QSz+oKNUmR9VxKV4NOhw0bgx7fuVb5zbZdCgiACNPRVqTmei6bCAaIFGFtBvGNAn0Sok
         iSd5OvBvcnMfjTyXZecoIHRPTV1qeRF+yZw1Q9YpmfdX93hbH6TGB98SphIJSXI/HnHX
         v5X6Gx/sHzGmofe7P3DpYfVVGIbkRgepM5nqQX1/2WuQF3/gE1dXyZkpjGQADLDtylSa
         In2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734436593; x=1735041393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52uSj8E/aVB15WhaSRtD8CBQxo0ybh/UWrgjS+bPGCI=;
        b=ogI3lEI8X1Z2OCNVm2KnyAsY+yKa1QfC5PVy6ZcG2IbpHy7LcJPr98im2iLEM4Ctya
         1DLzGU5kxeUtd7gB1W/xZQcTonLEZeLh3iSFnG1Ben5Bd2L5fDtkdYCjLZVvdIKXOJ36
         M46fKZM4QDkYLYGqV+wxxf2bezn4ekTY42b3COKIRBaQkUWDsLtBzApRcSMD7KRfAiJz
         2fGR+VZQ2/TZv8+G+w0D+2/uRo4TPcxBm7KUYZwy9ogHmFRVaaFr5N8TuXsqNuP0FQy2
         YoaA9UHlBJ4JimN/dmG57aSrbrm2/uOtIXL2cj8qg0tUrnXY324iwsfS44RmCLorc6ev
         Q6GQ==
X-Gm-Message-State: AOJu0Yye420JG414yQOBpY4b04j7N6TghmtmzZ/Fv3L4PTvsPMFuW4JV
	hDfu8LP36cMsISP8AXs3i4NAD+2Cilnt4nXmRJrS6Mp6DUGT7HYHz0Xuze8023dPGZVfP1QvOge
	C
X-Gm-Gg: ASbGncvskNEQqe4vJEaPhOyEoPCKokpbt3Ox9YnsfBdUUjRpK5mHuQbce5LxvpqU7qd
	i40T2crmQpTYshL7RASWVjpbrByL+F24fs+T6U+n0vS9JAVS9EkXPNhbSemytHvvTUtD4b8tTT+
	v6Jj7HCz9x6RoZXkhKtVtYAXLdA4wEEDnvvtEKzbVHX/z1X8nGHTQa3qnXKP0HplXS34Urlsw7Q
	+V5tgYGKUFPk00zKUzdEFlCQAOEUjj92SG6DJISpxh9id2NWWz70Zdm
X-Google-Smtp-Source: AGHT+IH2s5qUAf+fpkuqgPU2+mVf7/GWHrtm3hb2i29uW1limYKT3R5Wn/YlSCwzGGbUSzG/NCKU+A==
X-Received: by 2002:a05:600c:b95:b0:434:9c1b:b36a with SMTP id 5b1f17b1804b1-4362aa2e539mr159531685e9.13.1734436593037;
        Tue, 17 Dec 2024 03:56:33 -0800 (PST)
Received: from pop-os.. ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436360159aasm114935825e9.6.2024.12.17.03.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:56:32 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 3/5] perf tool: arm-spe: Don't allocate buffer or tracking event in discard mode
Date: Tue, 17 Dec 2024 11:56:06 +0000
Message-Id: <20241217115610.371755-4-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217115610.371755-1-james.clark@linaro.org>
References: <20241217115610.371755-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_035634_821617_CE005A3B 
X-CRM114-Status: GOOD (  14.25  )
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

The buffer will never be written to so don't bother allocating it. The
tracking event is also not required.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm64/util/arm-spe.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 1b543855f206..4301181b8e45 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -376,7 +376,7 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 			container_of(itr, struct arm_spe_recording, itr);
 	struct evsel *evsel, *tmp;
 	struct perf_cpu_map *cpus = evlist->core.user_requested_cpus;
-
+	bool discard = false;
 	int err;
 
 	sper->evlist = evlist;
@@ -396,10 +396,17 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 		return 0;
 
 	evlist__for_each_entry_safe(evlist, tmp, evsel) {
-		if (evsel__is_aux_event(evsel))
+		if (evsel__is_aux_event(evsel)) {
 			arm_spe_setup_evsel(evsel, cpus);
+			if (evsel->core.attr.config &
+			    perf_pmu__format_bits(evsel->pmu, "discard"))
+				discard = true;
+		}
 	}
 
+	if (discard)
+		return 0;
+
 	err = arm_spe_setup_aux_buffer(opts);
 	if (err)
 		return err;
-- 
2.34.1



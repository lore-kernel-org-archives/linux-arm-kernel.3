Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC62DE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 14:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmWclsqjoRWfqPrE0WD8+jPpX9G+TTRqhb+EOtWuV1I=; b=uREwfE3geZL8Sk+d0/4sDJ4YKT
	RCb9B60rPRrGSGM0jGxE5afVk/mHrxq6bS00PeW+d8NcL8YYevl7aU6fEnequ1td+WNELzZtjZrn/
	97ZU2npLsdoaHFI7pjZXMTxNTzHtuI7w+CukEpjSVcmRHqgKSfYv7YcuYC8lKHYGFvSzq6O7Xe9MP
	oeLSAxvNc6eefkYK7fsbq+8HLaJUVwhlXQFVwtUAfJJswnpMlSleGJJaEyBxrGULW2C3TI0WW4R/T
	ELWGaKHBJoFM3TV5OpddvX9ZSwMl5fe493cTSRnUOd+qaJZblhKSyDaMG3hJEkFMn2eCjSkc6tQp2
	+qLDX+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVXAV-00000008oXM-1jSU;
	Wed, 08 Jan 2025 14:36:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX4o-00000008nIw-2RrJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 14:30:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so6465449f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736346629; x=1736951429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmWclsqjoRWfqPrE0WD8+jPpX9G+TTRqhb+EOtWuV1I=;
        b=AwC5ow7fflttVjKBKU8tmKB4WkPjy/IU6ifHRzeAcHg9KloUF50BCWIOhihZVHqYYT
         lPpo1PaDiSFjdNW+f3wT/CL+D70Ey2i03KNDPTrkh7kB6nY2ZzTntVA3I1pLczbz6c+6
         zMbZZgOph7BxrioGEr0GNjO3PeAP1bK3dnAoQ/lfQtMe/q0H03EVGPrfR5WpzUoeIaz1
         rVYVA4M9mO4VE31VaZI26z/edgFk+2mQw0rifCMaupqQ29+lrdogo+sbZm81+MiVX86S
         FfO2a8seTnO2DEOKv6p1Dge37i87WVdOyNn19blnoxj7Zpbj38ZgYt7/DYRciwY/o0zC
         S1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346629; x=1736951429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmWclsqjoRWfqPrE0WD8+jPpX9G+TTRqhb+EOtWuV1I=;
        b=k9rjqQDKIXAM72WyeEPRAipHtxnubqW/8TyFNwuIqQ9pc6UU50UoN4G8lBHY871fi0
         /sTqHvBW9fT/uBUy8EOivWOD68McEY1j37RReJ179876hRuZq4kE//FbUYRHKy0UyZAd
         X/CFR0UNP4h93/Nuem+/Ka9Y9JdIVSukNG6SpWTPrHx/7LjgIAc8RJp/JUXmiv9gqASg
         TAN17DxEJBBEDcYixlJh4Ts8d/48Z1NwTX+jckMG9iMiue0TfPIiIZBpTxSHztzaOtZd
         lZm9h404JZa9D6L49uiQutA1PU/+7XSJ+/sEdPEdwLkSiygddSkpJ3+2sCgj1EBLLnF5
         WGZA==
X-Gm-Message-State: AOJu0YzLl3NOkHLZbDgWCMwt9h4Eus7sx7i11WQCP1h/JmsfMJBsfJb2
	854tnG1fiTlWfnHC5wWDgrpNuFjB67PXf1iJzjJXQZjl+yFmw9NTgmBH5lhyTZyDtYPIatbbXCR
	3
X-Gm-Gg: ASbGnctxo/gIlNRzr+YSD6/SpRMsNf/e2msrgACgAb2Y8gDsr6hQgBueC+RdGNyNrDq
	s8uWUQXlX/dXxYu53Tx6MoofVYh3gjdPG+2uUKEO42SlSdge/ObYiT5pnkQWh/UshQ5AHPy+XTs
	l4BYm1lXPo/b7YNr+zSEZtwxC87FLwqnrcT0orVjP545OfUwCK3nQQ2YJLOlH53RjZtmuT8xluf
	av+X7ZHeg9RTKCBmENx8FseVRXZacVwooxc2UjvZ3nxScvECjrZiDKw
X-Google-Smtp-Source: AGHT+IFpLlgT8rIizotjQJSiOIRTNt4ClYlj0TJvrmATLoOgZqttqZSvaAwtMedep20NBlyPDrMhRg==
X-Received: by 2002:a5d:5848:0:b0:385:f7a3:fea6 with SMTP id ffacd0b85a97d-38a872da433mr2572275f8f.13.1736346628653;
        Wed, 08 Jan 2025 06:30:28 -0800 (PST)
Received: from pop-os.. ([145.224.90.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddccf4sm22836965e9.19.2025.01.08.06.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:30:28 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	namhyung@kernel.org,
	acme@kernel.org
Cc: robh@kernel.org,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Michael Petlan <mpetlan@redhat.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v3 4/5] perf tool: arm-spe: Don't allocate buffer or tracking event in discard mode
Date: Wed,  8 Jan 2025 14:28:59 +0000
Message-Id: <20250108142904.401139-5-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108142904.401139-1-james.clark@linaro.org>
References: <20250108142904.401139-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_063030_613978_384BA67D 
X-CRM114-Status: GOOD (  13.33  )
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

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
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



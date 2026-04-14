Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D91F9D0CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkEHFh887Es+jtZSLZuibHtBrvBj/V7mtq/pJJpeMMk=; b=zJvyprJb5bQxZqa0fb/KU7z8kI
	C4tdEfYf33TzKgq4lFPCKlwDYtfX9S21Jgca1h/PoKcGVUzWzKh5lKKO+69VH02iCzRd/Za5dD16k
	8nB7vxAjgowgPBsL0xDkFlUwir8h4EHlXjqX6Qrf91flEJf/4JBvgsITg4fpXTJyhSrRiZfQ0Nqzr
	JwyAT2+pK9sIAMx6QoLMfoS7vlmsb8h9oXyDjda7VITd5BDd1E7IBMuz0zYwHzID4FISUBGD9Az0e
	WR//PlvvPk0M2roPpTnbi1j5xJdI6sMzgmUjgH3Aj+1otwt6i9Atwc+od4hqqaxdu+TuRcZzh1kXw
	+TridyNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBj-0000000HJts-37hq;
	Tue, 14 Apr 2026 12:48:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBf-0000000HJrd-2mGH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 12:48:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso30678125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 05:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776170894; x=1776775694; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkEHFh887Es+jtZSLZuibHtBrvBj/V7mtq/pJJpeMMk=;
        b=chzqG/2/eWVc78ihgNJNlqKMX0roUDcwQSQO/vAQhu/M/FrnZB4qgng2Ej1e15gU0h
         jLZ7pc42C/drWnZrL59vK/TToRNA4iExVqW2jpEcyKmML6EeipP/M/jru9XQ37ZHpzlP
         OEBFPvWZ567WhJ2k81zu5wEatvsYpPuQfvGSkGrk/oSkp9qOfqE+bngyXAQ8eIh8kix8
         +4Z3FSXGT8sM0+HRoaRXvlJK7U2PDeHeAMRTdtfn0Xo+QPpcBj6uSgfGJkd7WLk7TbXg
         dGJxCBuEI2IMcyTb4uz4v2I7RWj36nVC1SZ2JX6EYqR4yPZocJXKNAt1dVo0GIYRzeg5
         5p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776170894; x=1776775694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LkEHFh887Es+jtZSLZuibHtBrvBj/V7mtq/pJJpeMMk=;
        b=jni3AXjqIbOy4WwFjKrp6ENeU4TvEcpyCAlMznYq1afB3ZXnQ0vWo7TISx4E5WUDlH
         2db6VT0XktKRNmTXLOrFLZHAEk3NwxYmDkh8i3OEOSDrfgyYQQlhExEj6EXL0ibLTH86
         boZgn8aCTzwQqE1No3zefiUFwFiS+NP9FkJNKXYrVN5thA9HzNm1uxUDx+ay04xROGcY
         FZsEe+rGn9Fu2thNV19zL2ivW8n5h/nZjvM8pK/QPFvSrk0kDjvf9WUO+RBgniPiEBJO
         24J/4pkUzPkoLKgObW1VFkMg+iiNovUu4thDYNS3D3sszxB62ymB48HNHd0mYcpHPKq+
         ObFQ==
X-Gm-Message-State: AOJu0Yy+MsNkAgp1yZ/7JQjkvPLTA6ONsmSWT9w6sB7iPaB+xKe9KUZU
	cdxsVx1ZcvyqMzUuvr+5LX7yochjSZGblFKEsFKJjhvK08sFEpJ1//z+VreFezHUafw=
X-Gm-Gg: AeBDiesVR462d8g4ZDA4Y9xNwRKSn42/0SZ6l3wrE0129JjP276LtwLXrObaAKIa9MX
	0zvOLwD6lyLObi/wCyZi4tBcTSrTlaLCTZL5QjoDsUqKgA3fP+2Ey+w3vjO2t/hQDihSzzihkbT
	wazZoU5xkPPtnq6ACCKNOEQ6umer08m8zsRkctKBVHd/1HGXBiwQ8UbrVEOz+yV0vDuusySsokR
	GiLPVO4Y3RpcFQ7MdV0weCB2jtTaazhbBANG1eKl1fuhYRiu1mbvz+fm+Gq+fVCzryskvbgoPTn
	b6pWm2C03yERew2e0TeXnRRPvHbWVc6UI0S4O87bV9wYe9x2ukl2GwBOndriH1ghDlLu3z8IvGX
	miTcQR49QabbHr7/+K4CLs4GD1rWaMhH869bHbzkzMaPz6IsiQZz6ESiyaec7FoMxvi9gimodUJ
	OedOuXwiX/WCfzBTEw8N5FU7ZqRwYVN+fL5Ve0sAf7UA==
X-Received: by 2002:a05:600c:c10d:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-488d683982dmr166085705e9.15.1776170893726;
        Tue, 14 Apr 2026 05:48:13 -0700 (PDT)
Received: from e133063.arm.com ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e05bsm81185285e9.6.2026.04.14.05.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 05:48:13 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 14 Apr 2026 13:47:59 +0100
Subject: [PATCH v4 1/6] perf arm_spe: Make a function to get the MIDR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-james-spe-impdef-decode-v4-1-1dd30783a33b@linaro.org>
References: <20260414-james-spe-impdef-decode-v4-0-1dd30783a33b@linaro.org>
In-Reply-To: <20260414-james-spe-impdef-decode-v4-0-1dd30783a33b@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_054815_709077_F899BB36 
X-CRM114-Status: GOOD (  17.20  )
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

We'll need the MIDR to dump IMPDEF events in the next commits so extract
a function for it.

No functional changes intended.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index e5835042acdf7685f95e19665cd45f97ed868275..39046033e1433cff82ef0668074867aba4a462a4 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -972,14 +972,9 @@ static void arm_spe__synth_memory_level(struct arm_spe_queue *speq,
 	}
 }
 
-static void arm_spe__synth_ds(struct arm_spe_queue *speq,
-			      const struct arm_spe_record *record,
-			      union perf_mem_data_src *data_src)
+static int arm_spe__get_midr(struct arm_spe *spe, int cpu, u64 *midr)
 {
-	struct arm_spe *spe = speq->spe;
-	u64 *metadata = NULL;
-	u64 midr;
-	unsigned int i;
+	u64 *metadata;
 
 	/* Metadata version 1 assumes all CPUs are the same (old behavior) */
 	if (spe->metadata_ver == 1) {
@@ -987,15 +982,28 @@ static void arm_spe__synth_ds(struct arm_spe_queue *speq,
 
 		pr_warning_once("Old SPE metadata, re-record to improve decode accuracy\n");
 		cpuid = perf_env__cpuid(perf_session__env(spe->session));
-		midr = strtol(cpuid, NULL, 16);
-	} else {
-		metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
-		if (!metadata)
-			return;
-
-		midr = metadata[ARM_SPE_CPU_MIDR];
+		*midr = strtol(cpuid, NULL, 16);
+		return 0;
 	}
 
+	metadata = arm_spe__get_metadata_by_cpu(spe, cpu);
+	if (!metadata)
+		return -EINVAL;
+
+	*midr = metadata[ARM_SPE_CPU_MIDR];
+	return 0;
+}
+
+static void arm_spe__synth_ds(struct arm_spe_queue *speq,
+			      const struct arm_spe_record *record,
+			      union perf_mem_data_src *data_src)
+{
+	u64 midr;
+	unsigned int i;
+
+	if (arm_spe__get_midr(speq->spe, speq->cpu, &midr))
+		return;
+
 	for (i = 0; i < ARRAY_SIZE(data_source_handles); i++) {
 		if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
 			return data_source_handles[i].ds_synth(record, data_src);

-- 
2.34.1



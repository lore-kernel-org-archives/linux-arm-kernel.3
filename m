Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F51D107637F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oqas3u7UM5z91PWtBVrB+LRpDVECVVS14S5CCLaW82w=; b=i3QyNnRuWCAnqm+fXT+ldpdZmF
	MSXvtwl+bvhZ8GBWkd0yBuTSNiGex2xhG0x6RstxUg6SRyv5j+1rM4Lic01ycv/C3C4eQdYwuPcc+
	VbP+BX8PTSI9Q5oTdjTqtjIG6sp+0xCIAMSDB+bVXSuWtvY01b6Dl/lfEifMQ47GRdWaRIW00ujNo
	zxnwmHBAhalR4jdIKkZJkLCLrPXR6AZtzdsh9sFBGOk4BFSMK2+jBCeG1KufXzXMjMjfecxCIZ6v6
	XaWJHvEhltTbQRqlN5zbr0cCv32W2yTz6ag24AUE2D58rEQHWrjeYsE5KqHL4GLiKk49ODcsU0G+X
	4i/uHsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWP-0000000FU5x-0hBD;
	Wed, 01 Apr 2026 14:26:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWM-0000000FU5F-3o2d
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 14:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Oqas3u7UM5z91PWtBVrB+LRpDVECVVS14S5CCLaW82w=; b=ot9sK+MSbF4cYg0kwTgey+aikK
	F7YkkngfMVN5NbpgPWLjuHSz84Ylv8lrqHl7Yjq0F6Tie0WWEE4U6U9z2kn9jex0CCeKkc39eLmCc
	Vavq40nTsI2AVJQr1CcPnoyscEpK/8+RZbgseVKmbkuQBGJkRJvpygGyHSkbLc3LoLSc9cGh+6LIm
	8BUbMlnCyj3gxCaNyjNGsw09EEvUkUGqzMu9GQHJMhkiycXn9lt11zqQRSK+AII11ZPzWkBnLe/H0
	l/XCmqLLRwNqigThD7eQ2MkDtdLb6bUmJO6vS5dDEib0iOeQ4HWJJvOkjaPcacDfpil+RiRG3xD7c
	19QINS9A==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWJ-00000000bfW-3mPj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:26:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-486fb439299so65359695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 07:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775053570; x=1775658370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oqas3u7UM5z91PWtBVrB+LRpDVECVVS14S5CCLaW82w=;
        b=Y7gNwjRE1QysZOYDXnp4YiXrHKyIbPxXiOO0HUgPMjm46/n/bsyvkM6lIQ0KKgMggR
         VESthnemdwVnnyiOt8lij02mvphwr3fZ1VThyxCJl7QLTkdrZ7jDZLtuV51Ih9zSjxLm
         6QjkUgDjV4v6vv5jHuiyJ+09rXsOE3bO6TywQn+XdX/n8ZXNHeiKT8lRvidLz9DGV/DV
         eph46hu9hPoyoLpV1in+fuGmsZPrJO9QdjPywQaYHFXtdmhuqx6q4t+Np/DCbcA5+1M8
         y4IZ/hvx7JCTe8PTAH45jgXyHR3cUFQ6gNT2NOlWERlpNUDPC0221jk+jsHOyOe5WydW
         dKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053570; x=1775658370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oqas3u7UM5z91PWtBVrB+LRpDVECVVS14S5CCLaW82w=;
        b=DL3HbHlhnoikoJWFUwlSP4no8Sr9BC+gmT04wYtmbv66phpt2N34aiDgfJHn7H5m87
         W/yiBp6lyTSmUz2hhHUo0sloKCh6G2rBIQjPDXjo6JibWzPJGxvA3w4EvOZwAwvJkV9Q
         lFXT6bLxY72+r4L+1a9ErFuCw7y4YluyIfaTQkas3wSpZm1mSML5z7tVXkri+uwHp+FK
         TyMaMZfi2LzaeE06NxiU5mFwW3mYoYVyJSeabEY/ANYrJOdl9/N40+4YJ7v4xBOfWGdo
         QjxRdMzzSBliKBoJ6EdULn/8NmHaBIG+wFc7fo+kgFJpdR/XcDBxo0nXrLlLkxpGI0qW
         Ep0g==
X-Gm-Message-State: AOJu0Yw3xrpvXO2Gu7k5eyn70Dz10ADpWWBauZua2Atg/0fMw55+OOAu
	bDBPuCA4VIP6XPh2bfM9YFqAGBaNNnuJZ0Ii/0z9rFADJQKxXfCIgu3EvRfh2a/FHqg=
X-Gm-Gg: ATEYQzw0vzuylErR/b7D8/F5RfpdQrz/+YUjiEDbougBGkZP3FsL+ADVix4QCFjYhsX
	tKpHhlOb/Wc5DMlLBxcpBsO5OhMEh7deb+2aCM7EcVUYbMcQObFrj5RwbqkDoMKUSlNS1ImoJwk
	Od7xNuqTKCkqRkezyL9FbXDCS9PKwB4KCiB80lZ0WK+8sG5mMvDF+nwPmUJrm8R6nLfpIh5DbOW
	bfOGkJZjm4dwpSJJBkaEsUmqD36WYBuIxooJa71zPpkl2Iq+lWKhJqJV0AX2INUvcE48HnRH+vc
	uk9g0jDv6yLaXqB8IMiwjeJYGLukvunVEhyl4UneSz7W1CamZwx/QDnB3Qute9G9QRfzib3PRIW
	SEY5m9LTwILROV5qpMGIOtEnlGr0i38uecFTrBGEi/w5Hz8hUBk0Gl0wwDWQCaJZsswDq+RJGM6
	JORuMCo6Unqg5itH8Y4RyXhQM7dPYnqXPx
X-Received: by 2002:a05:600c:c04a:b0:486:f9aa:2b57 with SMTP id 5b1f17b1804b1-48883597e39mr46789365e9.16.1775053570170;
        Wed, 01 Apr 2026 07:26:10 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a63c9b1sm2305595e9.5.2026.04.01.07.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:26:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 01 Apr 2026 15:25:49 +0100
Subject: [PATCH 1/4] perf arm_spe: Make a function to get the MIDR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-james-spe-impdef-decode-v1-1-ad0d372c220c@linaro.org>
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
In-Reply-To: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_152611_988148_9A9B6C29 
X-CRM114-Status: GOOD (  17.59  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 70dd9bee47c7..7447b000f9cd 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -958,14 +958,9 @@ static void arm_spe__synth_memory_level(struct arm_spe_queue *speq,
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
@@ -973,15 +968,28 @@ static void arm_spe__synth_ds(struct arm_spe_queue *speq,
 
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



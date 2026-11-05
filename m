Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6511E606AB2A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DbOJV8f/;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jUOseVso
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oqj2T0WXB8ZBG5xgwGVwwKzGsMQkmNW87CSFX8dkW1c=; b=DbOJV8f/40zlxp
	4RMYVjGTFS4KEBpSy8ox2Kmnm9OwLedsmAKa8FF8u2+fEWcbxOOfHo/qE0Egb1EWAtdHLO/KuE+fW
	JoDQOodG6hzDSVgsJ/3IWEuvMla6b2N2hFx5806jq6RNaIrPiXp2BHc1HWOaGPJb9nGRuHEo5COdB
	tr9pP4NeyQP8C+/RDdE3aTeB4qvxGztWtAtZweQ7VQt/A14IIvGmJXUbdiXHzszJInEXhn0pY62JV
	X94/yc/VVxFonYiiUlROcMq8rebdGTl1LoUor7/miYz7Vyjna04i2yrsOUqySXyUCopGHNXYeEvk0
	tcDVvnaVpfHoq/b35LVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuX-00000008j2y-0G6i;
	Thu, 05 Nov 2026 11:45:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuO-00000008iq2-2ylt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so10724735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879131; x=1794483931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqj2T0WXB8ZBG5xgwGVwwKzGsMQkmNW87CSFX8dkW1c=;
        b=jUOseVsogAtCbjxUT/0KxmWjuVr6fWbEfrNQGbewi9c60iygAXL4O4H8Xo9kb4V18e
         6J/NhHDCg3u+dvdoxl3q0q6N9X3It9Yry0bJMsyWuQ6bzy+sVunQ0ue3f9CT4onE/XT0
         IEb8h6Lu9HEdCB62qZUFMWZlj3bZULfGmYZT2MJ/xM9Gu8W5urDdMrqaiQNtIVJTrS63
         Xe9WYXyVYKUZ2kmVE4MMRa99r8+WErdwTXlx3rMrhTbP1V9AtMaCEJrFsqgV7CcUAc8B
         I7CHTaYXrQ1Kc+LNx02RaNW+JGq5QsnAm+WHYX0gziBSg0JA8kqNNpAajItFguIVgThq
         uK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879131; x=1794483931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqj2T0WXB8ZBG5xgwGVwwKzGsMQkmNW87CSFX8dkW1c=;
        b=vKqCSLAzLNPQFtyOJj1Ahmq4NHtkXJN+AtqcU/2MQw0TnsWCwyVMqHngxskhQrZpNm
         VsBA/ylTzJUlg+CJ1SmNVFUJMxBAdMcShVPRoxKuSpPNpGTMINkbUqE0v0RVN7/wgO0d
         zg4ssoxiazXdzgKQdr3/2LqQur7fbpvecUVXKaqOMakXiS0zkOkO9uLcezhKgVzCZh4L
         z2Cl7Xr0LEDFY/Z8M5y0n5CtZjGPHwF7gaolyOEN4nZYhrKvcy4jDL1pU7BYi1Rh/bfu
         8EEP6Td7hKJ1t8kiSRivOd1zRGBU/uPNo1OjHhCktHxnD7AHlCsbfX1T07pkdC2MvsXN
         0Fig==
X-Forwarded-Encrypted: i=1; AKwUvBx84mLnicPblo+6n2mslbjTdgpyhW3pd9a0ipSLr57ZGTAGMQiB5q7MS8D4fwfZbR3o7TTQMdZwcRjMvzfmDiET@lists.infradead.org
X-Gm-Message-State: APuU4Z+sSi8XCpwHcU+/G45pDcCsB7yhF4PVMtvoK1K1X6BfcWXdLcJB
	pmRk379iZrgMZ54UY2+6fxbOZNvxsvyvBbvgt+IvKAdQ4cjgO0OJDRSNhtDtKhnKj78=
X-Gm-Gg: AYBFou1xJyddtTq0WHp+HcBDmVeot2mwneQJlQpdlVZn7bD9/kvJIDGfUIfMIejvp+x
	Ig2TX1NlubYHaCcYqQqU3UMYFmZQEYjSDNcUCsAygpr39GvWJFD0IXOAHl8evBwFQsj4ME+TQCW
	m998GgFvQW8R6peYnDUVxNLn+wqBYZjHPQQQR8UA7Gzj3m24MMuAM15q25D9bG5zRT0tpH12VFo
	uUJvo0hN2VVEvQDaEROUBtL061Ikm+KqjYld6hfMFty7t0651EAqpX23o+deWdVwLTN+RnxTGl+
	AnqqXYL4AVKtHOeE0+VwAYztYP6tvbMTFoX6tSgENL2MrM+ffsAcCtU7ChrsxyGXuNMtLZBAsQj
	vcjA+5409UtXEutypr5Zryx59Nwe0yxq48aTFu8N8Ka192vMsPk3kqiBDNclyEdeWtnADjA1pI6
	3YehCimM6gejCJrMCwNRLW/Orco6C1Fp6TGgRWf6zHp6NfiBfG19eaGjdCHqtx1whwoYlav1698
	kXetuHZW9QYguVveA3hUCLCCZBj2TUcphzSGahnX+6tcMguoab+atjFXk3MnzWfhvCCDh19yjWV
	FB2NnVrsTakTV3M4pNIN7D0tnzItLG0Y
X-Received: by 2002:a05:600c:a4e:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4ac187a766bmr411694955e9.21.1793879131015;
        Thu, 05 Nov 2026 03:45:31 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:30 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:57 +0000
Subject: [PATCH v4 09/19] perf cs-etm: Increase default timestamp
 generation period
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-9-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_034532_778479_32C81BAB 
X-CRM114-Status: GOOD (  15.60  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The original purpose of timestamps in per-CPU mode was to roughly emit
samples in the order they occurred across multiple CPUs, rather than
emit all the trace from CPU 1 followed by all from CPU 2 etc.
Previously there was no way to change the interval from the minimum of 1
cycle, but custom intervals are now supported by the driver.

Drastically reduce the number of timestamps emitted by increasing the
interval, which is more than enough to interleave sample generation.
This reduces the size of the trace generated.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 47b4e386cc53..5e7d09b7170c 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -70,6 +70,9 @@ static const char * const metadata_ete_ro[] = {
 
 enum cs_etm_version { CS_NOT_PRESENT, CS_ETMV3, CS_ETMV4, CS_ETE };
 
+/* Default timestamp period of 256 cycles (2 ^ (9 - 1) = 256). */
+#define DEFAULT_TS	9
+
 static bool cs_etm_is_ete(struct perf_pmu *cs_etm_pmu, struct perf_cpu cpu);
 static int cs_etm_get_ro(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path, __u64 *val);
 static bool cs_etm_pmu_path_exists(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path);
@@ -458,7 +461,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 		 * Timestamps are required to interleave samples from different
 		 * CPUs.
 		 */
-		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
 		/* Context IDs are required to associate trace to a process */
 		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
 	} else {
@@ -481,7 +484,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 * timestamp tracing.
 	 */
 	if (opts->sample_time_set)
-		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
 
 	/* Add dummy event to keep tracking */
 	err = parse_event(evlist, "dummy:u");

-- 
2.43.0



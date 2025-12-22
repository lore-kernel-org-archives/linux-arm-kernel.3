Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1708CE677E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHuJ8xIDoo5vqekEsW8kb8XOXUQ7JU8mQQu2ivsjyMg=; b=dI0HezHDvzFVBrlWyHGEzJ3USm
	bUCV9pGpn13XAASk8KBZ4OF6w84L62gKLkLFJNDYWGyYwxVfGt9XcJwDm3ePfZyJJwJBAnozK7G+J
	P/sjBYNIZPvG96XigOEDI/A+R1Qiu3Z2dvLPYflYpzHTasiC5Ms/pC3jmjFq+DpiI/IcyDOEi7jeW
	2mbgqXaEa6zombXZYffb4eUzOkWwjGIDW+LUVrPBTdDUVulNZQc7HFIzceW0qPVYqIpfGhKTGJD0p
	m5qneWphMK6fEnyP8lkNQWkAVa4irnTFKci1rPK1uYQcljQVGsBsCojCWNyJ+my+lKdZIREeTQ1p3
	4ZAA1jrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcv-0000000DtwH-20Ey;
	Mon, 22 Dec 2025 15:15:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhch-0000000Dtkh-3SdO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:15:02 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so3081498f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416498; x=1767021298; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHuJ8xIDoo5vqekEsW8kb8XOXUQ7JU8mQQu2ivsjyMg=;
        b=ARjCVrn/Qi4sK8DWqpmq8MN/utgNGJ126QqIZY+ajlh+kzNhFpVb+FimfJYGkgjcN9
         5fPSK8Q7iQKOvolVHDAYgBCGJQjLPA0GI9cIcmgsCD31XoZCOlVRRHWQCshuG55xjvcR
         glr8hOCIw7EkPIST/J9rVnJshmU/em4LrH5/0j21q/CtsyY+2NTX4GfIEYfQHK0WLnSo
         wP7qBicY/L1D4QfxyJaTVxVeRId3xWYpKodZguE3YYPKfV9aq5Vm3f6+wcz/xxGjEHyv
         y+D6CVr2OJfe/phNE1whcl8U0LfiCkBcv+PrSICjD9LIPBPRHmaStkMan74Qre8OddVM
         IJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416498; x=1767021298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IHuJ8xIDoo5vqekEsW8kb8XOXUQ7JU8mQQu2ivsjyMg=;
        b=FEY1ZOOsIqzUviJhjf9mcRR5MoPsjua3e4lWuqTq00YLeEVvArSycO+rw+PbaBL0m3
         End5TNQ9znPN3guJOCXYJYtWqjIuZm5HIKUfoszMD2JrZK/ffmCyPVmfgUOpm9ConSWY
         Zk/6zs4xlQIC/jo9+nKKb2Iiumsi6XinhzFIvodInoqmC3kK0FImJPfFTXRhX0JiJokz
         uPHAjEb5uGpWz5C/PHZM/jsUshxA5jJPwmNZZQ8fnpjber9fQEKoLrIhOkPY7F3jYHkm
         A4gg3I47k87vnIpwPvAqHJaB2nLkVa+xe+nQuNQhMBYuALRN/CVKUZ5B19uyozbfSJcA
         lGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBqwmE+L76lx0HcsM1V798/SiTJWg7sVlr6f4Iy/RYwXxgXN1J92k3NpthnlBQE5q883f+KJvEAwM0SxIO4eCM@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ2n2uP/r8g2IsY+bjUjNOrVIoGqob6ASywXIVCauSPIB1ogxw
	FdmRPNNzcBvwRVquQa4lSvQgE+UEWTysfy93DKxP0YwPAvEavB6W/PviYxrjZ3rSG3o=
X-Gm-Gg: AY/fxX59AI7O9FcwvDsOuGmM5kEjMf8MtULQ0x/qTHK8y3F8smBQPpXJATOgUab9Gmb
	MPa4ZmZAICn02Wz0qQj9w462rxgZk7T3xM5gOZ4Bhi04wQK8HyeHo70+ciDCQ5zj19KpaVm+HpF
	lIPlr3fa+S0ugPVjyK7s4p/bC56D7z4IZhvwxRiO3JkPf8gSsbfWORptuVMY+sLC/CgdWizhtoW
	eB0pjB7KRv6vlT5iZKBWQLBWxkUURSnqcRZagXzCjl8Uh8MIqJSNMj/OYaobHFnS7QtCmLSLcCh
	YeJy2SrmmQii/ZHJDBGrnifKEmxdmHJ1Bh49SEWlXZaneuV3EHcNHosDpmOC8rd3TiFUo5AC92+
	SfRQdC74P1F4SaBKkpjygxcH7vuIWht+Tl0a+kw25v1YS+Fpq+Ah4NRGi5DJHTt2mz/UToIq/3x
	BD2T0m7m/dJQswUU7DszRy
X-Google-Smtp-Source: AGHT+IGRZvc9aknIZPTTtyXV/B0ua6X8t/YbFs3N1GKO4vbSwiO8gsbcX+wj/sriPf9bBic/0iVCfA==
X-Received: by 2002:a05:6000:2c01:b0:431:92e:1d44 with SMTP id ffacd0b85a97d-4324e4cbc63mr11599219f8f.20.1766416497736;
        Mon, 22 Dec 2025 07:14:57 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:14:57 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 22 Dec 2025 15:14:35 +0000
Subject: [PATCH v4 10/14] perf cs-etm: Make a helper to find the Coresight
 evsel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-james-perf-config-bits-v4-10-0608438186fc@linaro.org>
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
In-Reply-To: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_071500_895690_65930148 
X-CRM114-Status: GOOD (  16.49  )
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

This pattern occurs a few times and we'll add another one later, so add
a helper function for it.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 50 +++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index c28208361d91..a49753f0d20f 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -302,6 +302,19 @@ static int cs_etm_set_sink_attr(struct perf_pmu *pmu,
 	return 0;
 }
 
+static struct evsel *cs_etm_get_evsel(struct evlist *evlist,
+				      struct perf_pmu *cs_etm_pmu)
+{
+	struct evsel *evsel;
+
+	evlist__for_each_entry(evlist, evsel) {
+		if (evsel->core.attr.type == cs_etm_pmu->type)
+			return evsel;
+	}
+
+	return NULL;
+}
+
 static int cs_etm_recording_options(struct auxtrace_record *itr,
 				    struct evlist *evlist,
 				    struct record_opts *opts)
@@ -473,29 +486,21 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 
 static u64 cs_etm_get_config(struct auxtrace_record *itr)
 {
-	u64 config = 0;
 	struct cs_etm_recording *ptr =
 			container_of(itr, struct cs_etm_recording, itr);
 	struct perf_pmu *cs_etm_pmu = ptr->cs_etm_pmu;
 	struct evlist *evlist = ptr->evlist;
-	struct evsel *evsel;
+	struct evsel *evsel = cs_etm_get_evsel(evlist, cs_etm_pmu);
 
-	evlist__for_each_entry(evlist, evsel) {
-		if (evsel->core.attr.type == cs_etm_pmu->type) {
-			/*
-			 * Variable perf_event_attr::config is assigned to
-			 * ETMv3/PTM.  The bit fields have been made to match
-			 * the ETMv3.5 ETRMCR register specification.  See the
-			 * PMU_FORMAT_ATTR() declarations in
-			 * drivers/hwtracing/coresight/coresight-perf.c for
-			 * details.
-			 */
-			config = evsel->core.attr.config;
-			break;
-		}
-	}
-
-	return config;
+	/*
+	 * Variable perf_event_attr::config is assigned to
+	 * ETMv3/PTM.  The bit fields have been made to match
+	 * the ETMv3.5 ETRMCR register specification.  See the
+	 * PMU_FORMAT_ATTR() declarations in
+	 * drivers/hwtracing/coresight/coresight-perf.c for
+	 * details.
+	 */
+	return evsel ? evsel->core.attr.config : 0;
 }
 
 #ifndef BIT
@@ -829,12 +834,11 @@ static int cs_etm_snapshot_start(struct auxtrace_record *itr)
 {
 	struct cs_etm_recording *ptr =
 			container_of(itr, struct cs_etm_recording, itr);
-	struct evsel *evsel;
+	struct evsel *evsel = cs_etm_get_evsel(ptr->evlist, ptr->cs_etm_pmu);
+
+	if (evsel)
+		return evsel__disable(evsel);
 
-	evlist__for_each_entry(ptr->evlist, evsel) {
-		if (evsel->core.attr.type == ptr->cs_etm_pmu->type)
-			return evsel__disable(evsel);
-	}
 	return -EINVAL;
 }
 

-- 
2.34.1



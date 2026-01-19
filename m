Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E209CCF2D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQboqiyM1bMVlCd/3rehrhWCEvcz3KFGOF/fcvtDHSE=; b=anM5Mf1Rn+PgnBNgf72UbiaZM4
	Y5oJVLoePWLKEZBzxRhX0XMD3VFugkGUaKQuU6qkggQTZYqeWIUeAq/Z3Wpc2l3gWO63fYFumEE1z
	Lrf4zJy1oUljpHhfl3rK9kn1BzBe20f2m8at5lvSzaJ8Abc9PhDx8ciJlrJkyUj4nWVWJXOJ2WMLA
	xt6NVka4vU+KQ5m3TsWMppFE70E+P7JSupNBYT/eomQUthymLeYksu/ktk1v2MMz7ZBszHwFCDDOD
	/zgg/PWYMBnSDsps3t+X8ZKDvxzd99jtxYFz2TRLxYjj5yNkq2+gM4njQqY5ExnLPzMf/wNNwmyTj
	tdTRPouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmCK-00000001imi-2O1W;
	Mon, 19 Jan 2026 10:09:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmCF-00000001ikC-36hy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:09:20 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso2081347f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768817358; x=1769422158; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQboqiyM1bMVlCd/3rehrhWCEvcz3KFGOF/fcvtDHSE=;
        b=xgkS7t5/kpbBkNS4RrOqYYKIByZqFDHruWW2mwvqSG4VydiXNEscPj1FMTNTpplNmz
         D61JIVH+2h2hA190nU1st98VkHrWFE4eMwKDf8K/3JrL6G6h8pFLx76By7RdVNUAsDTg
         03uNbgPptlEvO/samR7EmicmNmc1eSCwEkaQHfJMTlF5xGMA27GGTa7i+8zjsqcWMz+4
         MVxzQVVTOJNUEVMv5UI+PsKcxMrS0Bw/uPhskAOODOJS8UoPUYsTbzqrka/AyK2LB+OR
         NRVinWzx9qcLFR+eFRI60SkjQ1xQxQYVKU2aVFxnI4XEClaq6cvtN1JBDA4QuONyOgOi
         bI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817358; x=1769422158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rQboqiyM1bMVlCd/3rehrhWCEvcz3KFGOF/fcvtDHSE=;
        b=soKOn24NuxMFD898muCZI3ELDajzvxxmRPYmp8VYk+uxss7M7W5gNgpZ27RpXoXq9E
         dfv4EweS5awZr7DynVcDrDNaNKraR8N/oLpoDQHck1etSq4E+tJwNQu+m7TJbAcEP5r2
         xbuOyneqnjnhC1PRia2cBUNKNkVEs69cSuizYK0f1YDpPUUGSQguMiQahpgPpmLin4je
         zYGI5arNc78cwVTTyTjnatVo2UaC7IHdsg57JJRGdp7+hlTNYQ9UF3UXfxDn/7pONNuj
         LdyoeoA+Ma5CYtVHoHNB8OgYO9k05K06hNNA/xv6fNpzhdbFlgFMVXxJvDbJ7IbTs1f5
         fxWw==
X-Forwarded-Encrypted: i=1; AJvYcCUNuZ81dcJGZmD1HAHyrrjx93+QpPqFNelhP/4sEqLCVJTrau41waeVJHd2w/crfzUn3AbPpEIgu7qLQ6JYMJzS@lists.infradead.org
X-Gm-Message-State: AOJu0YxPQIcgfRsOi1Gs+Z2u8fBOY/hS455gWVcZ2H5DzU81btpBvDCY
	8f7kPX5VVerRfPFc688ebQ7viPSTbMukulwjM9f2XF6Q8rmzN75gGCZBkKVkVRFT/V0=
X-Gm-Gg: AY/fxX7EqpJ/cYOCeP8nQLq5SQLdJ++CFqzFKVz3FvL0KufRoBDUZm2ST7lctYQV8yR
	1GLbpHb1BFMocHdDCpYSa6ddco3TKtLrZKmAQSWF11XeUBbFaLb+wDdnbEPNUKdYgPHze/kvQVR
	+T2q2clmunCOiapL+ITAQ3oNS0W9Sj1CdHDQ45UBsuv96959roTT4zl7w0IUUfoqGrsB01hrUkk
	dHkWp1mlZIDWJps5lu8rBy5Vojlg88uq11QJNIW7L6JSotkZNgAn9iIFvm387PexXXYualarDQD
	MWaVIEPxfPYIAHC8yOMcepKQ5lM69hj37c8JzMKL4hzTrFlKgvIcvet5erkGUV/+8r3TNhvvePA
	dEuMgQxqzhZkwehrEgfF46/5aFaLVFlw1J8VK81/TAihVutk4tuxE71nDt56Ni8EGhch35Thvic
	Cvqj/sTynXn+ECtlLWpFiA
X-Received: by 2002:a05:6000:144b:b0:432:586f:2a9d with SMTP id ffacd0b85a97d-43569bbffa4mr14213616f8f.32.1768817358124;
        Mon, 19 Jan 2026 02:09:18 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm23234802f8f.31.2026.01.19.02.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:09:17 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 19 Jan 2026 10:08:17 +0000
Subject: [PATCH 2/2] perf cs-etm: Test sparse CPU maps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-james-perf-coresight-cpu-map-segfault-v1-2-a9cfd67653ae@linaro.org>
References: <20260119-james-perf-coresight-cpu-map-segfault-v1-0-a9cfd67653ae@linaro.org>
In-Reply-To: <20260119-james-perf-coresight-cpu-map-segfault-v1-0-a9cfd67653ae@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Thomas Falcon <thomas.falcon@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_020919_798263_544316D9 
X-CRM114-Status: GOOD (  14.11  )
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

We only currently test with default (all CPUs) or --per-thread mode.
Different permutations of the "-C" option can affect decoding so add
tests for some of them.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight.sh | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/test_arm_coresight.sh
index 1c750b67d141..bbf89e944e7b 100755
--- a/tools/perf/tests/shell/test_arm_coresight.sh
+++ b/tools/perf/tests/shell/test_arm_coresight.sh
@@ -198,6 +198,58 @@ arm_cs_etm_basic_test() {
 	arm_cs_report "CoreSight basic testing with '$*'" $err
 }
 
+arm_cs_etm_test_cpu_list() {
+	echo "Testing sparse CPU list: $1"
+	perf record -o ${perfdata} -e cs_etm//u -C $1 \
+		-- taskset --cpu-list $1 true > /dev/null 2>&1
+	perf_script_branch_samples true
+	err=$?
+	arm_cs_report "CoreSight sparse CPUs with '$*'" $err
+}
+
+arm_cs_etm_sparse_cpus_test() {
+	# Iterate for every ETM device
+	cpus=()
+	for dev in /sys/bus/event_source/devices/cs_etm/cpu*; do
+		# Canonicalize the path
+		dev=`readlink -f $dev`
+
+		# Find the ETM device belonging to which CPU
+		cpus+=("$(cat $dev/cpu)")
+	done
+
+	mapfile -t cpus < <(printf '%s\n' "${cpus[@]}" | sort -n)
+	total=${#cpus[@]}
+
+	# Need more than 1 to test
+	if [ $total -le 1 ]; then
+		return 0
+	fi
+
+	half=$((total / 2))
+
+	# First half
+	first_half=$(IFS=,; echo "${cpus[*]:0:$half}")
+	arm_cs_etm_test_cpu_list $first_half
+
+	# Second half
+	second_half=$(IFS=,; echo "${cpus[*]:$half}")
+	arm_cs_etm_test_cpu_list $second_half
+
+	# Odd list is the same as halves unless >= 4 CPUs
+	if [ $total -lt 4 ]; then
+		return 0
+	fi
+
+	# Odd indices
+	odd_cpus=()
+	for ((i=1; i<total; i+=2)); do
+		odd_cpus+=("${cpus[$i]}")
+	done
+	odd_list=$(IFS=,; echo "${odd_cpus[*]}")
+	arm_cs_etm_test_cpu_list $odd_list
+}
+
 arm_cs_etm_traverse_path_test
 arm_cs_etm_system_wide_test
 arm_cs_etm_snapshot_test
@@ -211,4 +263,6 @@ arm_cs_etm_basic_test -e cs_etm/timestamp=1/ -a
 arm_cs_etm_basic_test -e cs_etm/timestamp=0/
 arm_cs_etm_basic_test -e cs_etm/timestamp=1/
 
+arm_cs_etm_sparse_cpus_test
+
 exit $glb_err

-- 
2.34.1



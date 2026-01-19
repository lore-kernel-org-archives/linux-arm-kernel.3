Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1CFCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQboqiyM1bMVlCd/3rehrhWCEvcz3KFGOF/fcvtDHSE=; b=YlHoIxGi/YY3WCElVekXXQ7qpS
	fgWPbA327W83xYnSIxKO8K/OLLjAQpeF03ISxTbLQ5SQNpecpEl4JUdJm5rIaKr7UlObEu4o1DGn0
	BQm+bRKS6MvVzRyTim/il3ART1PueQma/ZMPJ2zoa+Uon8Hx8hTVBSHnuco7oQX5yjhu9CLKHOVan
	tfTHvhEelRwzgDi6He9Wx89SVRvusZU4MGqUQt3ppZH4bG6LdTP38C6OcSwWtEwhqQsXA9F4jqd/5
	avoVrSof1Os1bCZpLF+6dZHKsjHDsAU5/MuMfAJ1DeQA9PYUvlwtval75ctv4LnHuvByTHbe+bo+C
	mPx3Rodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmLa-00000001kAB-0GhH;
	Mon, 19 Jan 2026 10:18:58 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmLW-00000001k81-3Dfd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:18:55 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so2048758f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768817933; x=1769422733; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQboqiyM1bMVlCd/3rehrhWCEvcz3KFGOF/fcvtDHSE=;
        b=MkMoPN6/5/n6DaaqLyQhOYXDRTEqneRy/KplyJAlTA+hL1zN0X8m9u4hFLtK8TeNol
         cjaICAhOfGJlVJOpqdx8JVOwuIRMQv8h3fx7VIC4mlMGBZ5Fvk9wrhmPLyr0Qt04ylhl
         qRe+l8AXCbq8d84Vv/GAHBOEGVwDHPP/uZt/YIzSPBSi5dF8JVg/8LfU3hht5JUoGhy/
         U9En1qsGcDZd+wU/8dN8wrJceityhmmRFxGQlVeMLjrL74Z8iQt9//xvcPR9mn5BMd+v
         uVp0K5yeaSzmJQHEZZxGKEvuddg4DUtRILwkKbO2INeLp/E5xcGYauVOacssfYh/+4Ta
         RbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817933; x=1769422733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rQboqiyM1bMVlCd/3rehrhWCEvcz3KFGOF/fcvtDHSE=;
        b=WIKUKc44RMSfRHB2d5byy85fjBuMHx62C2LgyBwzZPEuO2GgFao7W88kHjMsdyHhle
         Lk89uhVuVjYdIRvwe37d9yUWeKbjlOIot1sp2wgJ8zMQPT9iFu7l7W1Jam+wEucm8ZDy
         vfzzFQVrS4ZninUKKDZzdk9RIg1MiI3W9Td81DWs52V5bPOraZSyznLw2SI4Rk1to3X+
         Lj/dnLgWzJMuSzgh9Y9qUjLMKE6QkSIdjoj5W1Q9hQRa7MFvFRojiTlZ8vkGIfvDiyuX
         cAep7Gu1sb1oH7C52A6JFO15ucSXLFG6WnaKQl03/hNwefpLfrzzQG6lNot26cFmphJx
         RZFg==
X-Forwarded-Encrypted: i=1; AJvYcCXn9nIPDARZjXYyoDOPE9vlnUWBgz6snXYvFSw9E0zruhsR1MyqUZJKlXM3R46maCGq/0oLtKeCCeVgW3UkxrkJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu5uoQJprCIaSIlE1rh/aamyiQFQJfr/toC2YchzN0TEzcmwai
	7o5gat4vk7MjQkkP+zMOyeKfGlCdwYYtrh7qk43T9DmVSVW4eilOzYHvht+s0qncGIk=
X-Gm-Gg: AY/fxX4xzxlCt1GCqkZY5QB3jxEIOQyoFGp+DKeqmWS+inwmUFh8SeRh87xQKowWZzZ
	sGsXTaXTSOsLKboYSvxWR45kQ7HCmCI6/No4cUHVudZopmnYNfk5vspnOoFF0xPndskmov/xbs7
	GT+vVxmgzCvKWzHzkKJkX5gSlOATM4xWRKDRA0dYT6QGwMeOqrydwtTWcshug4fAenqjYlkneWV
	IvQ5BxHZJfiTk9g0PV2NaA2ycBe6yuLER0gWCYOghOYOd1RLU0HdaWJ6/n0bD4I0Bqs/nu+Jm/M
	XIm3kNAJpqZIJ+9piQqKOyXBNVN1YFrFEqUIRTIWYNb9UW+z4/z4yN4y9NOK6AoXaXQCNefUfef
	bXy4GqZMht8nWGs8z87Ed34wkpA/aEuvyxBlLKgd2boOkAJHdYApSiel2DwtcAfn2nzWRINFN4e
	dLMYJNmlDXjvcrreIU8Et5UVpXC/byWr0=
X-Received: by 2002:a05:6000:288c:b0:431:2b2:9629 with SMTP id ffacd0b85a97d-43569bc7d95mr13515115f8f.51.1768817932877;
        Mon, 19 Jan 2026 02:18:52 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm23286150f8f.31.2026.01.19.02.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:18:52 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 19 Jan 2026 10:18:36 +0000
Subject: [PATCH v2 2/2] perf cs-etm: Test sparse CPU maps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-james-perf-coresight-cpu-map-segfault-v2-2-56b956a629ee@linaro.org>
References: <20260119-james-perf-coresight-cpu-map-segfault-v2-0-56b956a629ee@linaro.org>
In-Reply-To: <20260119-james-perf-coresight-cpu-map-segfault-v2-0-56b956a629ee@linaro.org>
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
X-CRM114-CacheID: sfid-20260119_021854_816312_A036EBD1 
X-CRM114-Status: GOOD (  14.42  )
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



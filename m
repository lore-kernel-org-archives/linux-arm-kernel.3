Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42649E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwqWh99mkwgFG4i731gC0ut6m4bysgrlep8nFs6msoA=; b=0UbvWuhTaLq/IEgvY0g/IUCAl+
	x/06f6ZRaFJEyZxPm7McJVGaMy65bgfJ8oaPqEofaMZaKrhtMHLwd6I8PiV8mtzTTWiI4LLSSjuIs
	o9kREt3C0NQfJQpJAczkR0D6NwSo/MryMbHHPpzUSzQZZbhs4ZEQMUtllWSnmZw5mAOQ3UOG3i3HI
	leB6g/Sp2ezrmE9nPwFWweAkfTLT9rCx58H9UhEZVoHUnCk0JWXvaF2+vphET+XbM4U6mZA64Nhi7
	OonCbQcamaGYEtaoXXTJgO0UbVJJLBw44rrhHRVwoQPYXdb45JwndiWfLdEogLaF9B/v6oXnYKf8U
	f21ZRsVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWGt-0000000DKtT-3WK5;
	Tue, 17 Dec 2024 12:01:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWBq-0000000DJlg-2Agi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 11:56:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43635796b48so20317215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 03:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734436597; x=1735041397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwqWh99mkwgFG4i731gC0ut6m4bysgrlep8nFs6msoA=;
        b=CDGCekjcQvZBBWDc3Sr/8yediuDJ8EAxjV2H7+nTIyuqlwcuVjZhKpccciGpqlQa4R
         iYtCbll49Iq7uYgLCemREQa+n1SVsMLkCkHSwwZ4EbSG8QrcCqW0flOrGsGnxb1tFSja
         miCS1HRPLBnpFP83zPF3qDKtR1IZcgntgHIu5lwdzuxKuigG1cBcKN7Bg5Z0Cub3Muqm
         4siRe8IZoTJGB+kc3Pe6KlKgGw4/3SJSgLNducMj8Ij/ZD7jQpFbGrLz7y09v3X5riK+
         58GSbQs9kKesh2NlTwtMk46wNE2jPQ5poHa0yK2olPKV7igEpGXQxZawbYP19yUCHt+i
         QHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734436597; x=1735041397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwqWh99mkwgFG4i731gC0ut6m4bysgrlep8nFs6msoA=;
        b=EXbnYWT+NlK1o1UHPgQzxULKKqvMIYP+4hn5ENSESqw9ZDwxA3XqzG0IFwsyLFrwFO
         9/AAaf9S/P5ECFhwKCTaEFY44OC28XACcGBCRdQtNKkJq/MX37bvt83GXtVFzH5TETS8
         h+TFTNgyOSikdw08ykOduVmp2SBawF2dGafUCwBf9vFCkcCZKoOnHt8R92eF7kd7m/3y
         rpjKisQ9TQNpMCpTBdiBbGLGn120wk8h2NneNWKS+WkYHJY4m388SGFwhqTNMxQMvzyb
         tE+UsVyaWI3V03Upjt65RjXWP3/dT5m1WJyoYW50Q1WTqwvEGRIElUi+HBDEuIC12xky
         5COg==
X-Gm-Message-State: AOJu0YwSR9fbHBgWdilwxpbE/8mbvYOyEONAsk2tEQuug38gTlxidJWT
	lXNd31oCcEGv5VN/zgEkSBR8cB4rld8tRsFsVkYqYoYNtHdPw3UcSQfiZCKVvnroqEUj013M0XR
	G
X-Gm-Gg: ASbGncvqQP/5fpTLoJ2/DkfIjggVHrEdI6phvG8uKX5sDCbnkxwpRhEhi/ZHi0Nt8HU
	Ka9MZWCuKpMirGVt4Wn2BasFT1RiV4ZgGWpe2sgZ0JxAthIU2gg7SeRBCOxakZJbdRXTmHtr3Xq
	IT6+WQbzQ9GfQqbHusTxBAOyxvjamwCrzxbg4XQGpfzGqGDdotnM53CeUkfeAE6x8Q0n+78hXP1
	CaPm3kTPY3w6FJcmqSlUNzk5P0wQUvqHmewUvgqGiBQAbWd2YrxcggO
X-Google-Smtp-Source: AGHT+IGwdSY4bxXI25oDz+FWewMmRHe9+KuuRiSPfZFzGZSjSm8Hi3QlFSfDLHoAEpYFbRs2avKTiw==
X-Received: by 2002:a05:600c:3b22:b0:434:fa73:a906 with SMTP id 5b1f17b1804b1-4364814eefdmr23438715e9.4.1734436597154;
        Tue, 17 Dec 2024 03:56:37 -0800 (PST)
Received: from pop-os.. ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436360159aasm114935825e9.6.2024.12.17.03.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:56:36 -0800 (PST)
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
Subject: [PATCH 4/5] perf test: arm_spe: Add test for discard mode
Date: Tue, 17 Dec 2024 11:56:07 +0000
Message-Id: <20241217115610.371755-5-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217115610.371755-1-james.clark@linaro.org>
References: <20241217115610.371755-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_035638_557021_BC0B4A05 
X-CRM114-Status: GOOD (  13.20  )
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

Add a test that checks that there were no AUX or AUXTRACE events
recorded when discard mode is used.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_spe.sh | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/perf/tests/shell/test_arm_spe.sh b/tools/perf/tests/shell/test_arm_spe.sh
index 3258368634f7..a69aab70dd8a 100755
--- a/tools/perf/tests/shell/test_arm_spe.sh
+++ b/tools/perf/tests/shell/test_arm_spe.sh
@@ -107,7 +107,37 @@ arm_spe_system_wide_test() {
 	arm_spe_report "SPE system-wide testing" $err
 }
 
+arm_spe_discard_test() {
+	echo "SPE discard mode"
+
+	for f in /sys/bus/event_source/devices/arm_spe_*; do
+		if [ -e "$f/format/discard" ]; then
+			cpu=$(cut -c -1 "$f/cpumask")
+			break
+		fi
+	done
+
+	if [ -z $cpu ]; then
+		arm_spe_report "SPE discard mode not present" 2
+		return
+	fi
+
+	# Test can use wildcard SPE instance and Perf will only open the event
+	# on instances that have that format flag. But make sure the target
+	# runs on an instance with discard mode otherwise we're not testing
+	# anything.
+	perf record -o ${perfdata} -e arm_spe/discard/ -N -B --no-bpf-event \
+		-- taskset --cpu-list $cpu true
+
+	if perf report -i ${perfdata} --stats | grep 'AUX events\|AUXTRACE events'; then
+		arm_spe_report "SPE discard mode found unexpected data" 1
+	else
+		arm_spe_report "SPE discard mode" 0
+	fi
+}
+
 arm_spe_snapshot_test
 arm_spe_system_wide_test
+arm_spe_discard_test
 
 exit $glb_err
-- 
2.34.1



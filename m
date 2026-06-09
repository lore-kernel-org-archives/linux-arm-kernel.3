Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CF7CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 21:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joR1akmty7bWKs2aos/a2r2cuYEn9MQeFTvwKeRRZg8=; b=qmUOrowNV1LXhK95O43L2g0Hn0
	fFgDBksJ4tk+w8/UDsmvpLEi/iXU2sN4IiwDnQyPmnP7JwxrbLCO9/tv/8QlpJ4NzWnecvk5Mg7Fq
	ET77GuDoH+wqRPGYUV8jkRsV+9mzPZWugH9ysq4XlQ13BZ7CZy55RDc9xABmnR23deHHOr9Y0eNnC
	X0CAhG7qlQBuHu8TnI1do3/d2RFu29wjYraibyJp6vCDZv5kqsdsBWmj+A5CGSmrhKAg3WJiLh0IO
	OLJhPT8bP2GzquCAkpPMcd8M0LgHCVcJnJsQ6F86I8RB1X15g+hUJxTMmXsZzQyHd19IKNyz+L2Re
	cNMMFDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4Ll-00000006Psv-0WXI;
	Tue, 09 Jun 2026 21:51:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4Lf-00000006PmQ-2n0n
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 21:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=joR1akmty7bWKs2aos/a2r2cuYEn9MQeFTvwKeRRZg8=; b=YWwtwhpr/lDfmRozMiF6gsCR/y
	j6xWb6XKDlzkXhdoGQN+PNBt++1KnBQADLKv9QI45IsF7xMptmxsts85ib30aKNgwIffxL0rhmWGv
	h4H/yNZdblNNGoWrQrxMvAblbM2RqW+pHr7uRyE3tYd0y93DQyU76DasO7W/hn42RPJIhbkoXLPcs
	Zz3SLdKbxJ8hDhjMZ250sZA9HSEs//K7HPgkNTR9MA+vMx5JaB8/7BDlRH0Ri9r9Nv8269mEscRb7
	lmWM6wDaB8gvdJxapUrIX17YmZnwWgWGQ/HqHM/AZMAnUMRt8EudwbRQBd2F7JOxqcpJ15h/UoS6R
	1pZyjBpQ==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wX4LZ-000000036Rm-1mzL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 21:51:00 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso3609448a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 14:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781041852; x=1781646652; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=joR1akmty7bWKs2aos/a2r2cuYEn9MQeFTvwKeRRZg8=;
        b=PolOmHzgKQn6FlREOQw+SD4zB+0rrWvnjEC6kneRmhuAXAY0dOj4Ll4Lcpb7JHt0k+
         anKZLWNyYbZ0cftLMp9ZBCc5PxCHhqHtKeuOcgzOTvGbIJnL9eQaXIYVs6GUrMz8jkzi
         JbM5/VSjKE/DETV/BoqhUYj1VhVuYCJtrbm0MYKfrQFBZXVsKPZkE+YTdmWwXn4LDcv/
         ja8Bwf/IVgpiMhOD78Opo4dVQIXwIGch1q3qU9f4yj2jt1aJJ6Q+t7lYKXwgp3W/dhYb
         gi48r2go8Rn+3QKsJQWmMv+fFArdhIXnfrmhT/BOwIwUJkQhjhZt4TC+nKI9N4UZjfA5
         HmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041852; x=1781646652;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=joR1akmty7bWKs2aos/a2r2cuYEn9MQeFTvwKeRRZg8=;
        b=MuMCrbrDQqBOEWt1X8ryZNfYqyN/60PvSkKWRkNf8qPApePd+OPO8i4rk0EHU4NFkG
         5zuL3+0roWhenMZmYWTQvykX+EbTIpV4bRJYVvVnaYNpxLo1su+Sqa7O6QvXEoh+gFSw
         bgPU8v36JhiM/+NzpCDvMPOG4OXFjf2YUZ4zOj3SMdcSN6XQ7S57NcONDO52MFwObz9v
         +VuM7stQvrDMwwlxwY0FycOSmMO82gSjgX9nYzH8/zFplsGvD0qWzKZpMG0t0uS0ABCG
         yCt0dHgThUEhpOAr66zWBQMyliiDbU6DyvlcFQsIt22Mwaeu6prGgmdw87K/dUgbeh84
         ansg==
X-Forwarded-Encrypted: i=1; AFNElJ8CWRuirij7INYdxdxo/+n4sr+ZWTJgP1szlpas+3iWLsEhvRW91v8mCHgPPzZxHkcrgbST1P/Ug1vRxVN/ibf1@lists.infradead.org
X-Gm-Message-State: AOJu0YwsYtH746EgnrBBwQoYzEZsCjzw2QmyzLHIWULVql5se/CXbKy0
	VI4htRNpLnWY0uPk94BxneGYo4CBGad0QExc34pE+hLQBYMcAVk7qKHq5doLf26Aosy/BYwXx8s
	JJ/54Lw==
X-Received: from pgam4.prod.google.com ([2002:a05:6a02:2b44:b0:c80:2987:4220])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d80d:b0:398:7df5:2dae
 with SMTP id adf61e73a8af0-3b4ccd3a845mr27121760637.9.1781041851840; Tue, 09
 Jun 2026 14:50:51 -0700 (PDT)
Date: Tue,  9 Jun 2026 14:50:42 -0700
In-Reply-To: <20260609215046.2391903-1-ctshao@google.com>
Mime-Version: 1.0
References: <20260609215046.2391903-1-ctshao@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260609215046.2391903-4-ctshao@google.com>
Subject: [PATCH v1 3/6] perf vendor events intel: Update graniterapids events
 from 1.18 to 1.19
From: Chun-Tse Shao <ctshao@google.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org
Cc: alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, james.clark@linaro.org, afaerber@suse.de, 
	mani@kernel.org, dapeng1.mi@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, Chun-Tse Shao <ctshao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_225058_339335_4C9995FD 
X-CRM114-Status: GOOD (  10.88  )
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

The updated events were published in:
https://github.com/intel/perfmon/commit/875354c88686ef50387d9601f52354a6da8f24cc

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
 .../arch/x86/graniterapids/uncore-interconnect.json    | 10 ++++++++++
 .../arch/x86/graniterapids/uncore-memory.json          |  2 +-
 tools/perf/pmu-events/arch/x86/mapfile.csv             |  2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/graniterapids/uncore-interconnect.json b/tools/perf/pmu-events/arch/x86/graniterapids/uncore-interconnect.json
index 5eb1145f204f..9f0c4c7198b0 100644
--- a/tools/perf/pmu-events/arch/x86/graniterapids/uncore-interconnect.json
+++ b/tools/perf/pmu-events/arch/x86/graniterapids/uncore-interconnect.json
@@ -808,6 +808,16 @@
         "PerPkg": "1",
         "Unit": "IRP"
     },
+    {
+        "BriefDescription": "Counts Timeouts - Set 0 : Cache Inserts of Write Transactions as Secondary",
+        "Counter": "0,1,2,3",
+        "EventCode": "0x1E",
+        "EventName": "UNC_I_MISC0.2ND_WR_INSERT",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "UMask": "0x8",
+        "Unit": "IRP"
+    },
     {
         "BriefDescription": "Counts Timeouts - Set 0 : Fastpath Rejects",
         "Counter": "0,1,2,3",
diff --git a/tools/perf/pmu-events/arch/x86/graniterapids/uncore-memory.json b/tools/perf/pmu-events/arch/x86/graniterapids/uncore-memory.json
index f559e27e2815..9cd2905726fd 100644
--- a/tools/perf/pmu-events/arch/x86/graniterapids/uncore-memory.json
+++ b/tools/perf/pmu-events/arch/x86/graniterapids/uncore-memory.json
@@ -539,7 +539,7 @@
         "Unit": "IMC"
     },
     {
-        "BriefDescription": "DRAM Precharge commands. : Precharge due to (?) : Counts the number of DRAM Precharge commands sent on this channel.",
+        "BriefDescription": "DRAM Precharge commands. : Precharge due to page table : Counts the number of DRAM Precharge commands sent on this channel.",
         "Counter": "0,1,2,3",
         "EventCode": "0x03",
         "EventName": "UNC_M_PRE_COUNT.PGT",
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index 0f39073805ba..b8ea72b99c52 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -13,7 +13,7 @@ GenuineIntel-6-CF,v1.24,emeraldrapids,core
 GenuineIntel-6-5[CF],v13,goldmont,core
 GenuineIntel-6-7A,v1.01,goldmontplus,core
 GenuineIntel-6-B6,v1.12,grandridge,core
-GenuineIntel-6-A[DE],v1.18,graniterapids,core
+GenuineIntel-6-A[DE],v1.19,graniterapids,core
 GenuineIntel-6-(3C|45|46),v36,haswell,core
 GenuineIntel-6-3F,v29,haswellx,core
 GenuineIntel-6-7[DE],v1.24,icelake,core
-- 
2.54.0.1099.g489fc7bff1-goog



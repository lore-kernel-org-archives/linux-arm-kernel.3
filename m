Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA04C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 03:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBMFXrG1xOekg4HmZGvQhV+SxD43VvAIrVyKbopoMYE=; b=oDIkdYTeI8aRQ2gU+evtmqpadQ
	fGL/HHvk6XAuGj8Q+2uYOwAPLNjVY7O7fqDoyvuUh9kjOzu/nQ3kDHzrnnysoEL821yh7OpUvZdcf
	RTdP4MI4ZZEsnWUR3jiKUZr8Zzdywr6ksKkkPJ0pqRajCOjcK83AoGJ+Rtosvt8J76UpoPcMoVNix
	ru76sN1zHwJmi7Nwb3fUINdcgKt7QNLaSM0qG5o5cBhh3EbkUQw1inDK9XM7dfZa4r3FfOss1S9N+
	n6+t/80XVW78sWMyOTMCXBlyZ8yULJyriPHOZM4EPmHfR1innxYDadu/VEGOyhNAGz3HNKBqSz1El
	3uga2DOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyfm-0000000DpyH-25Be;
	Sat, 19 Jul 2025 03:55:42 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyW1-0000000Dopy-2GJt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 03:45:41 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31332dc2b59so2311232a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 20:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752896736; x=1753501536; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EBMFXrG1xOekg4HmZGvQhV+SxD43VvAIrVyKbopoMYE=;
        b=HLaDi1lTn66EnNWj/iusZHAF99b7a0cflfTH2Le/IalGwrnbfFu+p1c185Qep8NpOu
         f4s+QC/3wFy/6VZtq8hhPEQbvzC8aUV6D9gUGebGfZJSa5Kr9iloN9SzCVFjozmSX6Gl
         W3UaIWnXUY3q7Y6fdmcUioTc6iCE0wSsOkcjGOVxZEYSsROyHz/nNo/1rkSme0ar2PhV
         ljriccKGRF5H10e9XCncNxglR7vmCZWmjObjNLxA7Z55Re9GjyN4C4uIOaJNUf8/3U63
         xAQ73+9JTuKj46qmieKQFTRLbAOomPCzDQCQlPYZ7a5qnzVdEutro60umafi/7rJQhRA
         8qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752896736; x=1753501536;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBMFXrG1xOekg4HmZGvQhV+SxD43VvAIrVyKbopoMYE=;
        b=jX8oNkqI85n5oA+8PpH6HjTxm88zk++NXygmqmXfhheM+oBLQQ02qwvj3kaiXWtQXo
         0fwjHB6st+g96Oh+l9h0VJwz4kYTg8CvroCrX1jJG7A9NxzIy7Sf6vbJt38qWx6u8j99
         33+fzztoH9Lf+dQ4ih6ZjhsBsCK6vQ3kaOvQRPwUHMu8ZZKbzwME0PDbge8bQqqY/ID5
         YwbVEraxsM4/WR+ZKxcdKB/ZSnS413TwTvb3gUY0DtSepRPWpAFSILGRW/Nxn9/f2kd+
         5VgUOVRXAWL0KJdRAeH0qB1pgH74bIT7bQAbNtgsY6wNrVn6+DcWb4n0090fvsy9ygKt
         NyyA==
X-Forwarded-Encrypted: i=1; AJvYcCXmXEEEt/Hcf+crKxn5L6v0PquKwL4jCXp7F3fiw4RPz8LBMyzUQT1qAEeKSBoZUum+E1JkiRcp8++Q2XvI58Cd@lists.infradead.org
X-Gm-Message-State: AOJu0YyG0D1LVa2L5hB8qAPxfkCxXJVcJ5q/Zc5F6gGZQ09clMedLn5J
	Yq4B1JwkNCwx6BgveqGbmMFwXnWyqK7gkSrroPAMO9TijhtZKoDgcw1rFGlv4dWyBcPqxKsixzl
	3SlBpd2ktIA==
X-Google-Smtp-Source: AGHT+IEo18BE4QLvAw1/92EVXaYrWdaNlYSyBsOVRiEX/tG+V2krErJPgtF5SmI3YJNMFye5tO/kkwnXwrG7
X-Received: from pjvv4.prod.google.com ([2002:a17:90b:5884:b0:311:b3fb:9f74])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dc4:b0:311:e8cc:425d
 with SMTP id 98e67ed59e1d1-31c9e6f7177mr20111314a91.10.1752896736426; Fri, 18
 Jul 2025 20:45:36 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:45:02 -0700
In-Reply-To: <20250719034515.2000467-1-irogers@google.com>
Mime-Version: 1.0
References: <20250719034515.2000467-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250719034515.2000467-7-irogers@google.com>
Subject: [PATCH v1 06/19] perf vendor events: Update grandridge metrics
From: Ian Rogers <irogers@google.com>
To: Thomas Falcon <thomas.falcon@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Caleb Biggers <caleb.biggers@intel.com>, Weilin Wang <weilin.wang@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_204537_605300_A4615BB6 
X-CRM114-Status: GOOD (  10.38  )
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

Update metrics from TMA 5.0 to 5.1.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../arch/x86/grandridge/grr-metrics.json      | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/grandridge/grr-metrics.json b/tools/perf/pmu-events/arch/x86/grandridge/grr-metrics.json
index 878b1caf12de..a0d637a24c1b 100644
--- a/tools/perf/pmu-events/arch/x86/grandridge/grr-metrics.json
+++ b/tools/perf/pmu-events/arch/x86/grandridge/grr-metrics.json
@@ -1,56 +1,56 @@
 [
     {
         "BriefDescription": "C10 residency percent per package",
-        "MetricExpr": "cstate_pkg@c10\\-residency@ / TSC",
+        "MetricExpr": "cstate_pkg@c10\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C10_Pkg_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C1 residency percent per core",
-        "MetricExpr": "cstate_core@c1\\-residency@ / TSC",
+        "MetricExpr": "cstate_core@c1\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C1_Core_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C2 residency percent per package",
-        "MetricExpr": "cstate_pkg@c2\\-residency@ / TSC",
+        "MetricExpr": "cstate_pkg@c2\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C2_Pkg_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C3 residency percent per package",
-        "MetricExpr": "cstate_pkg@c3\\-residency@ / TSC",
+        "MetricExpr": "cstate_pkg@c3\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C3_Pkg_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C6 residency percent per core",
-        "MetricExpr": "cstate_core@c6\\-residency@ / TSC",
+        "MetricExpr": "cstate_core@c6\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C6_Core_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C6 residency percent per package",
-        "MetricExpr": "cstate_pkg@c6\\-residency@ / TSC",
+        "MetricExpr": "cstate_pkg@c6\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C6_Pkg_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C7 residency percent per core",
-        "MetricExpr": "cstate_core@c7\\-residency@ / TSC",
+        "MetricExpr": "cstate_core@c7\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C7_Core_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C8 residency percent per package",
-        "MetricExpr": "cstate_pkg@c8\\-residency@ / TSC",
+        "MetricExpr": "cstate_pkg@c8\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C8_Pkg_Residency",
         "ScaleUnit": "100%"
@@ -633,7 +633,7 @@
     },
     {
         "BriefDescription": "Average CPU Utilization",
-        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / TSC",
+        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / msr@tsc@",
         "MetricName": "tma_info_system_cpu_utilization"
     },
     {
@@ -645,7 +645,7 @@
     },
     {
         "BriefDescription": "Fraction of cycles spent in Kernel mode",
-        "MetricExpr": "cpu@CPU_CLK_UNHALTED.CORE_P@k / CPU_CLK_UNHALTED.CORE",
+        "MetricExpr": "CPU_CLK_UNHALTED.CORE_P:k / CPU_CLK_UNHALTED.CORE",
         "MetricGroup": "Summary",
         "MetricName": "tma_info_system_kernel_utilization"
     },
-- 
2.50.0.727.gbf7dc18ff4-goog



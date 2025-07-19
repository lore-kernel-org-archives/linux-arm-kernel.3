Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3E2C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 04:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyoHqHO0xSjLFu8zTnBCBlfDgc3kXoP6K9OnCFzAIxc=; b=zQX1mIa5S+bzM3f3OmdQ4D/WP+
	I7fTNKRf0vv0gA2YlHXDvtIPicZteVuk/Uq4+WIvnqhW/98NxGDEyuB/YuSgBDnR3JRyrThwH87tR
	HaxFPTmB0/2ck4b5N63O8rPuK9NPFcn9P6f6wSEeVR8bfj84yxFybeslb50TVUPICPo29BeXiGVVP
	gZ46uWn2Ot/qMaLwWFWFTAyVmHNKewPNEiB5AARXZxEEoJd6tPR9xA/+BHwFKzMPSKgapkS6RH19j
	2GKzKtgHKK4VbNEbHJOM4+/UGD5gCSBOKw+fxxMKdiEoIGTIlEOEaXd4DYQsymwDDhtXcHZi2iItB
	d78qa07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucysP-0000000DqwU-49nc;
	Sat, 19 Jul 2025 04:08:45 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyWI-0000000Doyk-01cL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 03:45:56 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7494999de28so3598666b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 20:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752896753; x=1753501553; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wyoHqHO0xSjLFu8zTnBCBlfDgc3kXoP6K9OnCFzAIxc=;
        b=niIgu/le4E+8uQpmhRGcOzwTWTxgdxUSAXL33hX0rH8pD0Vgea8PdCjRykwUjFbPl9
         8H7c3w2XJUXJp/TeueZiRXW9xrcio0t2RYoh7jc73kihpUZ40sHu2KnPBffpUwuvtQNz
         4tsdR/gXVK+H5+14KiIrt+YHebKkl32TNVpP67oodvJ/fVVNu1iZxsAXl2yjbb33fDes
         Ivc4oGYK4NRUyU9cxX4nGjCsBpKGvsSsiMmoouA4e9NRN9FISfz7DQy2Q5hNyQn5Atrp
         8EzLf9VlfMSmvGjTk59mh0dhWfSEcm0b1JbDxZoRisrHWN0JVSmFwuJkAhi2xb2Fzco8
         UaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752896753; x=1753501553;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyoHqHO0xSjLFu8zTnBCBlfDgc3kXoP6K9OnCFzAIxc=;
        b=W1hjRXKASZkT9XyK2GDNYlsTSZ954k+kvfnTwvFBgM9FHW8vqortbDuBlgcFXi5TbL
         RksI0kjYUPr1dQF3TzFg8NF9SONgJvOTX8ArvNebcAauthOtlxRj0PdUgZjSpzkWnwy8
         bg/v8OSUm4l4wy93LpA8CCBglkPPrEGftBytF45LBPkZZsiK15OJbCIbl/NBOIK+EzBh
         m5BYGBHP4Aiz2mqhmz7t9/+Cl24Ht2u/fqlAflcPL+KMMFAgDlvmQO2I0OMDH6BE7RQu
         SCPKN6gigKqnDVz6uwZN3WZlGEl9C1oK2eXz1B8jy0tXXd8J7w+G4k55fW3Xd9FAiJ3Z
         0gUA==
X-Forwarded-Encrypted: i=1; AJvYcCXl0VxDFarewwZIgGDpmobVIKbZkiCtaEE8VvP4mMrH5J1lquAHuuUfBPyZKwchqm22IxiQKlxX7Caoh434jbZs@lists.infradead.org
X-Gm-Message-State: AOJu0Yylby8HoJaK8uhTcVYzByYVVzCOXbtrUSM3UwJMsvHhEehyUGXJ
	9a6AuYHJgXJuQUFUZ7aqIZyi3aaBrrkCTkcGqdpb+yjipfydjHNx8IXmyJFaHY/qBekWNi1xfNT
	Yga9sKMXtXw==
X-Google-Smtp-Source: AGHT+IEvlwMx6OUGmBObZryfm2N5mH9c5xFv7x/kAdQ364gVL3wMAsr/DibD/iPCp5oqD1mn0gDliHeWG5du
X-Received: from pfuv16.prod.google.com ([2002:a05:6a00:1490:b0:74a:cccf:5726])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b45:b0:746:26fe:8cdf
 with SMTP id d2e1a72fcca58-758492e296dmr13889782b3a.7.1752896752680; Fri, 18
 Jul 2025 20:45:52 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:45:11 -0700
In-Reply-To: <20250719034515.2000467-1-irogers@google.com>
Mime-Version: 1.0
References: <20250719034515.2000467-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250719034515.2000467-16-irogers@google.com>
Subject: [PATCH v1 15/19] perf vendor events: Update sandybridge metrics
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
X-CRM114-CacheID: sfid-20250718_204554_065454_261CFAD5 
X-CRM114-Status: GOOD (  10.77  )
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
 .../arch/x86/sandybridge/snb-metrics.json     | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/sandybridge/snb-metrics.json b/tools/perf/pmu-events/arch/x86/sandybridge/snb-metrics.json
index 823d8b7c4224..d40761903429 100644
--- a/tools/perf/pmu-events/arch/x86/sandybridge/snb-metrics.json
+++ b/tools/perf/pmu-events/arch/x86/sandybridge/snb-metrics.json
@@ -1,49 +1,49 @@
 [
     {
         "BriefDescription": "C2 residency percent per package",
-        "MetricExpr": "cstate_pkg@c2\\-residency@ / TSC",
+        "MetricExpr": "cstate_pkg@c2\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C2_Pkg_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C3 residency percent per core",
-        "MetricExpr": "cstate_core@c3\\-residency@ / TSC",
+        "MetricExpr": "cstate_core@c3\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C3_Core_Residency",
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
         "BriefDescription": "C7 residency percent per package",
-        "MetricExpr": "cstate_pkg@c7\\-residency@ / TSC",
+        "MetricExpr": "cstate_pkg@c7\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C7_Pkg_Residency",
         "ScaleUnit": "100%"
@@ -71,7 +71,6 @@
     },
     {
         "BriefDescription": "This category represents fraction of slots where no uops are being delivered due to a lack of required resources for accepting new uops in the Backend",
-        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
         "MetricExpr": "1 - (tma_frontend_bound + tma_bad_speculation + tma_retiring)",
         "MetricGroup": "BvOB;TmaL1;TopdownL1;tma_L1_group",
         "MetricName": "tma_backend_bound",
@@ -296,7 +295,7 @@
     },
     {
         "BriefDescription": "Measured Average Core Frequency for unhalted processors [GHz]",
-        "MetricExpr": "tma_info_system_turbo_utilization * TSC / 1e9 / tma_info_system_time",
+        "MetricExpr": "tma_info_system_turbo_utilization * msr@tsc@ / 1e9 / tma_info_system_time",
         "MetricGroup": "Power;Summary",
         "MetricName": "tma_info_system_core_frequency"
     },
@@ -308,7 +307,7 @@
     },
     {
         "BriefDescription": "Average number of utilized CPUs",
-        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / TSC",
+        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / msr@tsc@",
         "MetricGroup": "Summary",
         "MetricName": "tma_info_system_cpus_utilized"
     },
-- 
2.50.0.727.gbf7dc18ff4-goog



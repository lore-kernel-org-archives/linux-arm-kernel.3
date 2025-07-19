Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C71C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 04:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwbCpczO77l0xiPSlOdCxGpiGz3+duVbPCBhW+nDRFA=; b=kYZf2mGtQOoJicLpTjFt1HXMu5
	FTw95jQcTacbY0WCuPWw/Mwxh43Zp0f9DW7KZajnVeu1BUk0DgZooKZTl395LQtlaNOeb3w1FB/OS
	HCvT2uOrLYfS3UNByVs5t4YwobZocWfsL0cUk8/6x13oITEd/nqgusUhN9E2RdIb2JIBCgsprX+WX
	xc4yaVsZcUkxFU9RtTjBRjbW/NVVJfvEW2s2lfLc4xaocUwL/4ci1gguC7Rg0uotOftEy4qTDePDm
	GEFAX0iQ6IAvfyGdhSuuwxA3U6IVaut9l9f0rlvpfyIRHuYz/1hGSh/5GgyycjpgSMZQrqp8hkTte
	zkEiuQdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyus-0000000Dr4G-43ga;
	Sat, 19 Jul 2025 04:11:18 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyWL-0000000Dp0a-2E5F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 03:45:59 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-235f6b829cfso21989875ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 20:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752896756; x=1753501556; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwbCpczO77l0xiPSlOdCxGpiGz3+duVbPCBhW+nDRFA=;
        b=mDWlBRhMQnlD2uwfcmhbhGqPepKR3mhHDMaD/MbtKgTZmKQXLZRi9fM/tW9EhzHEH8
         IC1ourzLFX0m0Zm4HUCLj5axWnECLLVwIveLuAHRe4EyqHq+dRUEvAPUkq7+iMf6hAE/
         5f0gJKM+046Tyj8hUNSfTgqKUsrZbVyhS433fzQKA0xl/0qluH7lAbizLqcpH85B849n
         Wd+++awMqrtvurV3t+RDrFGqNMdYdqGS5ztCPmHhqg19AY5X2IGTNUs7TtRUaOv9dEsO
         KcvrkweFm1W2fRa/3Tk3B23igqo4vM+7BO2KfmV4gqes92ASD2iTpa76BAAhwDQXqTaN
         LdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752896756; x=1753501556;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwbCpczO77l0xiPSlOdCxGpiGz3+duVbPCBhW+nDRFA=;
        b=X4AHkuaRvlg8uJakGMt5qINfO5IC2FQNq5jXlnx0XHXPjeSXXm4BeJMAVVym7MTbkN
         fwkP5gb1uOOlP+X4X5SQObfW4/1yoghJCT37lg5oLLMAP+VjnqxWZ0lhrAWUtb15Myh5
         xhXE9QBjqR21POZmzFgayfwEi973QxQDEcmYBierarWZa/GAZvdGKIQu/+kXBxuEfrtl
         fRGk0oBYWBqAzKsaQlODBYSngDSW4USsr2PtKEYXiCr6cRIgs8t5+uuE04QjPsN2YBZO
         5C+H5J2hO621pL6FhUY/QecZx9yWLnQXna8hmWcURVcDOl0dk8wj8qNTJNggm/FTDYO3
         iATw==
X-Forwarded-Encrypted: i=1; AJvYcCVFcyqWo5MhhAOk9QevcJFEilyVEzIcJxUs6CeIH6AcRIUPTOIlSavjQFij3oUR0zd8fklA7P+zNbmOedajzAZ3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw9z2QpRWQ89arpdZWFD97JXmSoVOh990XV7lSF1qn+EELRiFO
	PSE1+SmIyE/+6dgC4GDB0tVuQ3YcXrWzftCl7BozXh8tbOwOD+fbzLrXzmTv2j2t4Wv3HePMM+E
	Mbi3z1jAmxw==
X-Google-Smtp-Source: AGHT+IG9zb3O4YDYA+FzRpT+cFBELwmC1bv45iR6dsLUNQDetbmplXcLS/ZYZ/XjTEEAd3LxKlhmIjMpuHwi
X-Received: from pjbnc8.prod.google.com ([2002:a17:90b:37c8:b0:312:26c4:236])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:50ce:b0:312:f2ee:a895
 with SMTP id 98e67ed59e1d1-31c9f45b0abmr17336572a91.31.1752896756497; Fri, 18
 Jul 2025 20:45:56 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:45:13 -0700
In-Reply-To: <20250719034515.2000467-1-irogers@google.com>
Mime-Version: 1.0
References: <20250719034515.2000467-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250719034515.2000467-18-irogers@google.com>
Subject: [PATCH v1 17/19] perf vendor events: Update sierraforest metrics
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
X-CRM114-CacheID: sfid-20250718_204557_631103_2979F00E 
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
 .../arch/x86/sierraforest/srf-metrics.json    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/sierraforest/srf-metrics.json b/tools/perf/pmu-events/arch/x86/sierraforest/srf-metrics.json
index b9f3c611d87b..ca2c55917e55 100644
--- a/tools/perf/pmu-events/arch/x86/sierraforest/srf-metrics.json
+++ b/tools/perf/pmu-events/arch/x86/sierraforest/srf-metrics.json
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
@@ -735,7 +735,7 @@
     },
     {
         "BriefDescription": "Average CPU Utilization",
-        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / TSC",
+        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / msr@tsc@",
         "MetricName": "tma_info_system_cpu_utilization"
     },
     {
@@ -747,7 +747,7 @@
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



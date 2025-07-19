Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1979CC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 03:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oq/QPsklHyhVb1UgtWbIgHrWCqKuRIA4cR3xOVT8HWY=; b=k1TF7ZnV1ULNdY5Or0mVIA+sjp
	HrnFjfMJ2YRIdAlbXZdFEfENqqwnx0FL8U7Zfe+ERJN8pV14PXclf5m3WZEKwZrIqlTr3z0kuFexM
	vQwul7AvEDIcKd43EMWiTmpqyMsdabOFoG8Lkx0SkIndJ9qy5aRQKORT0g4T8ruaGI+iiGJ5wcBAT
	9Dwbf5j5rGa8yIgv8l0gIn06BvcV6483nz3MsrY2whTRFD1spDS+em8ctzBq6wTLp7FQGY2NQ6ty2
	QqrPs8iKtOI6q76vEuCvsde1Q6Qa111TezjbEcKe1lH9RT27ao3TEnFF8KsjRrMeL+/82SUzN/KU+
	hf0bpAUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyiD-0000000Dq8V-34iz;
	Sat, 19 Jul 2025 03:58:13 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyW5-0000000Dos3-2tXZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 03:45:45 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b3beafa8d60so3210261a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 20:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752896740; x=1753501540; darn=lists.infradead.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oq/QPsklHyhVb1UgtWbIgHrWCqKuRIA4cR3xOVT8HWY=;
        b=jpu75jqqzqeFlSlvjYbeIVh+c6GhipONCfKwyxBOris7wIZSJuqwdFD2ywLxV4EtXW
         hWTp6Q5Q6W4tsyKVeeKXcjPOagbY3t8pAzPJ1mWfrwVRQx+DOrHJKlcSoVGcFBy8ndV5
         1u9nHz8ii2QQ7gWaMXL+Qm+7okNdAjT3tg9bOMgy9Wss5j9Ip2KG/3bobjLIiAs9lEW7
         P3yxeUHGgukACPGgTe8lRrjTr2fcSfSxhduJZ0xYr/xcJZy5/EpCvCdFkfTyrfZ0XAip
         VohaLGFpWUqAQuLEwNQNHpY2BwkyrrVtxeei7usqOEZl0kMgAk0rKlDo28A92YhNqNul
         yXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752896740; x=1753501540;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Oq/QPsklHyhVb1UgtWbIgHrWCqKuRIA4cR3xOVT8HWY=;
        b=hasQ+3fMZ1ef6DLVfGLvqecxwjmiWBkGnYBH9HXh3gFphpGApmJfjz8zIJr9slXK0m
         XJapwwl0Zroe1NpAwSaCUxkYB1KEhUpYpzPLfqYSoH4izfmRm5fcsNiq/DorGWifPt3/
         ZsZsoRL1dQqdhIkxOmT5VY73GIE4BFrdfn9YbuXNZ4b/xatqotcCJ5QEsrhu979R90Jq
         SokFjrSMMRK1fuX51C5YpXwWM+lC29VReipBcLtjwUR5PImqredplj/aPF+Ayom9F99K
         fvwY4lxPjf/BuL4Yx1nKHkGSw7RMVxpmNrY68C45xVMsFpBz5N/eu9HCsW/0ujU5zXGD
         iCJw==
X-Forwarded-Encrypted: i=1; AJvYcCUVOUP672yHaXcgIZ0efYU+T6QAPSZlW9/pwjJBztFZGwZ+7DP4mgeaUFyVMqkaA0ACsLITByV0H7niZCuzLlnh@lists.infradead.org
X-Gm-Message-State: AOJu0YxX+XYn1US24rt+L4CJ43pc1gUZO7BNBKe3nBXwkLK5UdRZE6MB
	wZ3sl/4qThndaSJUdgZMYxMe++hZ12Aq7JdYeh/9+JOGMGc7XoiFm9rqeLdiekAJebYTlWt2T84
	Hk+d3glcLqg==
X-Google-Smtp-Source: AGHT+IEv2l18L0ZhkdFtfo16oi6E8iLas+G2yXT8Dwzbcv0gVoVu1uRvcB9htUL9TcDscGlYg0VQVqB5YjE0
X-Received: from pgcn11.prod.google.com ([2002:a63:720b:0:b0:b2f:5d02:68e9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:1594:b0:21f:4f34:6b1
 with SMTP id adf61e73a8af0-23811055c32mr21777199637.14.1752896740246; Fri, 18
 Jul 2025 20:45:40 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:45:04 -0700
In-Reply-To: <20250719034515.2000467-1-irogers@google.com>
Mime-Version: 1.0
References: <20250719034515.2000467-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250719034515.2000467-9-irogers@google.com>
Subject: [PATCH v1 08/19] perf vendor events: Update haswell metrics
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_204541_757158_FC31B7BD 
X-CRM114-Status: GOOD (  12.77  )
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
 .../arch/x86/haswell/hsw-metrics.json         | 32 ++++++++---------
 .../arch/x86/haswellx/hsx-metrics.json        | 35 +++++++++----------
 2 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/haswell/hsw-metrics.json b/tool=
s/perf/pmu-events/arch/x86/haswell/hsw-metrics.json
index b26ea70a3628..aebd82ced1cf 100644
--- a/tools/perf/pmu-events/arch/x86/haswell/hsw-metrics.json
+++ b/tools/perf/pmu-events/arch/x86/haswell/hsw-metrics.json
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
@@ -80,7 +80,6 @@
     },
     {
         "BriefDescription": "This metric represents Core fraction of cycle=
s CPU dispatched uops on execution ports for ALU operations.",
-        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
         "MetricExpr": "(UOPS_DISPATCHED_PORT.PORT_0 + UOPS_DISPATCHED_PORT=
.PORT_1 + UOPS_DISPATCHED_PORT.PORT_5 + UOPS_DISPATCHED_PORT.PORT_6) / tma_=
info_thread_slots",
         "MetricGroup": "TopdownL5;tma_L5_group;tma_ports_utilized_3m_group=
",
         "MetricName": "tma_alu_op_utilization",
@@ -98,7 +97,6 @@
     },
     {
         "BriefDescription": "This category represents fraction of slots wh=
ere no uops are being delivered due to a lack of required resources for acc=
epting new uops in the Backend",
-        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
         "MetricExpr": "1 - (tma_frontend_bound + tma_bad_speculation + tma=
_retiring)",
         "MetricGroup": "BvOB;TmaL1;TopdownL1;tma_L1_group",
         "MetricName": "tma_backend_bound",
@@ -139,7 +137,6 @@
     },
     {
         "BriefDescription": "This metric estimates fraction of cycles the =
CPU retired uops originated from CISC (complex instruction set computer) in=
struction",
-        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
         "MetricExpr": "max(0, tma_microcode_sequencer - tma_assists)",
         "MetricGroup": "TopdownL4;tma_L4_group;tma_microcode_sequencer_gro=
up",
         "MetricName": "tma_cisc",
@@ -509,7 +506,7 @@
     },
     {
         "BriefDescription": "Measured Average Core Frequency for unhalted =
processors [GHz]",
-        "MetricExpr": "tma_info_system_turbo_utilization * TSC / 1e9 / tma=
_info_system_time",
+        "MetricExpr": "tma_info_system_turbo_utilization * msr@tsc@ / 1e9 =
/ tma_info_system_time",
         "MetricGroup": "Power;Summary",
         "MetricName": "tma_info_system_core_frequency"
     },
@@ -521,7 +518,7 @@
     },
     {
         "BriefDescription": "Average number of utilized CPUs",
-        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / TSC",
+        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / msr@tsc@",
         "MetricGroup": "Summary",
         "MetricName": "tma_info_system_cpus_utilized"
     },
@@ -696,7 +693,6 @@
     },
     {
         "BriefDescription": "This metric represents Core fraction of cycle=
s CPU dispatched uops on execution port for Load operations",
-        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
         "MetricExpr": "(UOPS_DISPATCHED_PORT.PORT_2 + UOPS_DISPATCHED_PORT=
.PORT_3 + UOPS_DISPATCHED_PORT.PORT_7 - UOPS_DISPATCHED_PORT.PORT_4) / (2 *=
 tma_info_core_core_clks)",
         "MetricGroup": "TopdownL5;tma_L5_group;tma_ports_utilized_3m_group=
",
         "MetricName": "tma_load_op_utilization",
@@ -746,7 +742,7 @@
     {
         "BriefDescription": "This metric represents fraction of slots the =
Memory subsystem within the Backend was a bottleneck",
         "MetricConstraint": "NO_GROUP_EVENTS",
-        "MetricExpr": "((min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.STALL=
S_LDM_PENDING) + RESOURCE_STALLS.SB) / (min(CPU_CLK_UNHALTED.THREAD, CYCLE_=
ACTIVITY.CYCLES_NO_EXECUTE) + (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ - (cpu=
@UOPS_EXECUTED.CORE\\,cmask\\=3D3@ if tma_info_thread_ipc > 1.8 else cpu@UO=
PS_EXECUTED.CORE\\,cmask\\=3D2@)) / 2 - (RS_EVENTS.EMPTY_CYCLES if tma_fetc=
h_latency > 0.1 else 0) + RESOURCE_STALLS.SB) if #SMT_on else min(CPU_CLK_U=
NHALTED.THREAD, CYCLE_ACTIVITY.CYCLES_NO_EXECUTE) + cpu@UOPS_EXECUTED.CORE\=
\,cmask\\=3D1@ - (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D3@ if tma_info_thread_=
ipc > 1.8 else cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@) - (RS_EVENTS.EMPTY_CY=
CLES if tma_fetch_latency > 0.1 else 0) + RESOURCE_STALLS.SB) * tma_backend=
_bound",
+        "MetricExpr": "(min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.STALLS=
_LDM_PENDING) + RESOURCE_STALLS.SB) / (min(CPU_CLK_UNHALTED.THREAD, CYCLE_A=
CTIVITY.CYCLES_NO_EXECUTE) + (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ - (cpu@=
UOPS_EXECUTED.CORE\\,cmask\\=3D3@ if tma_info_thread_ipc > 1.8 else cpu@UOP=
S_EXECUTED.CORE\\,cmask\\=3D2@)) / 2 - (RS_EVENTS.EMPTY_CYCLES if tma_fetch=
_latency > 0.1 else 0) + RESOURCE_STALLS.SB if #SMT_on else min(CPU_CLK_UNH=
ALTED.THREAD, CYCLE_ACTIVITY.CYCLES_NO_EXECUTE) + cpu@UOPS_EXECUTED.CORE\\,=
cmask\\=3D1@ - (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D3@ if tma_info_thread_ip=
c > 1.8 else cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@) - (RS_EVENTS.EMPTY_CYCL=
ES if tma_fetch_latency > 0.1 else 0) + RESOURCE_STALLS.SB) * tma_backend_b=
ound",
         "MetricGroup": "Backend;TmaL2;TopdownL2;tma_L2_group;tma_backend_b=
ound_group",
         "MetricName": "tma_memory_bound",
         "MetricThreshold": "tma_memory_bound > 0.2 & tma_backend_bound > 0=
.2",
@@ -856,7 +852,7 @@
     {
         "BriefDescription": "This metric estimates fraction of cycles the =
CPU performance was potentially limited due to Core computation issues (non=
 divider-related)",
         "MetricConstraint": "NO_GROUP_EVENTS",
-        "MetricExpr": "(min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.CYCLES=
_NO_EXECUTE) + (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ - (cpu@UOPS_EXECUTED.=
CORE\\,cmask\\=3D3@ if tma_info_thread_ipc > 1.8 else cpu@UOPS_EXECUTED.COR=
E\\,cmask\\=3D2@)) / 2 - (RS_EVENTS.EMPTY_CYCLES if tma_fetch_latency > 0.1=
 else 0) + RESOURCE_STALLS.SB if #SMT_on else min(CPU_CLK_UNHALTED.THREAD, =
CYCLE_ACTIVITY.CYCLES_NO_EXECUTE) + cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ -=
 (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D3@ if tma_info_thread_ipc > 1.8 else c=
pu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@) - (RS_EVENTS.EMPTY_CYCLES if tma_fetc=
h_latency > 0.1 else 0) + RESOURCE_STALLS.SB - RESOURCE_STALLS.SB - min(CPU=
_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.STALLS_LDM_PENDING)) / tma_info_thread=
_clks",
+        "MetricExpr": "((min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.CYCLE=
S_NO_EXECUTE) + (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ - (cpu@UOPS_EXECUTED=
.CORE\\,cmask\\=3D3@ if tma_info_thread_ipc > 1.8 else cpu@UOPS_EXECUTED.CO=
RE\\,cmask\\=3D2@)) / 2 - (RS_EVENTS.EMPTY_CYCLES if tma_fetch_latency > 0.=
1 else 0) + RESOURCE_STALLS.SB if #SMT_on else min(CPU_CLK_UNHALTED.THREAD,=
 CYCLE_ACTIVITY.CYCLES_NO_EXECUTE) + cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ =
- (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D3@ if tma_info_thread_ipc > 1.8 else =
cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@) - (RS_EVENTS.EMPTY_CYCLES if tma_fet=
ch_latency > 0.1 else 0) + RESOURCE_STALLS.SB) - RESOURCE_STALLS.SB - min(C=
PU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.STALLS_LDM_PENDING)) / tma_info_thre=
ad_clks",
         "MetricGroup": "PortsUtil;TopdownL3;tma_L3_group;tma_core_bound_gr=
oup",
         "MetricName": "tma_ports_utilization",
         "MetricThreshold": "tma_ports_utilization > 0.15 & (tma_core_bound=
 > 0.1 & tma_backend_bound > 0.2)",
@@ -865,7 +861,7 @@
     },
     {
         "BriefDescription": "This metric represents fraction of cycles CPU=
 executed no uops on any execution port (Logical Processor cycles since ICL=
, Physical Core cycles otherwise)",
-        "MetricExpr": "(cpu@UOPS_EXECUTED.CORE\\,inv\\,cmask\\=3D1@ / 2 if=
 #SMT_on else (min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.CYCLES_NO_EXECUT=
E) - (RS_EVENTS.EMPTY_CYCLES if tma_fetch_latency > 0.1 else 0)) / tma_info=
_core_core_clks)",
+        "MetricExpr": "(cpu@UOPS_EXECUTED.CORE\\,inv\\,cmask\\=3D1@ / 2 if=
 #SMT_on else min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.CYCLES_NO_EXECUTE=
) - (RS_EVENTS.EMPTY_CYCLES if tma_fetch_latency > 0.1 else 0)) / tma_info_=
core_core_clks",
         "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_ports_utiliza=
tion_group",
         "MetricName": "tma_ports_utilized_0",
         "MetricThreshold": "tma_ports_utilized_0 > 0.2 & (tma_ports_utiliz=
ation > 0.15 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2))",
@@ -874,7 +870,7 @@
     },
     {
         "BriefDescription": "This metric represents fraction of cycles whe=
re the CPU executed total of 1 uop per cycle on all execution ports (Logica=
l Processor cycles since ICL, Physical Core cycles otherwise)",
-        "MetricExpr": "((cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ - cpu@UOPS_=
EXECUTED.CORE\\,cmask\\=3D2@) / 2 if #SMT_on else (cpu@UOPS_EXECUTED.CORE\\=
,cmask\\=3D1@ - cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@) / tma_info_core_core=
_clks)",
+        "MetricExpr": "((cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ - cpu@UOPS_=
EXECUTED.CORE\\,cmask\\=3D2@) / 2 if #SMT_on else cpu@UOPS_EXECUTED.CORE\\,=
cmask\\=3D1@ - cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@) / tma_info_core_core_=
clks",
         "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_issueL1;tma_p=
orts_utilization_group",
         "MetricName": "tma_ports_utilized_1",
         "MetricThreshold": "tma_ports_utilized_1 > 0.2 & (tma_ports_utiliz=
ation > 0.15 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2))",
@@ -883,7 +879,7 @@
     },
     {
         "BriefDescription": "This metric represents fraction of cycles CPU=
 executed total of 2 uops per cycle on all execution ports (Logical Process=
or cycles since ICL, Physical Core cycles otherwise)",
-        "MetricExpr": "((cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@ - cpu@UOPS_=
EXECUTED.CORE\\,cmask\\=3D3@) / 2 if #SMT_on else (cpu@UOPS_EXECUTED.CORE\\=
,cmask\\=3D2@ - cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D3@) / tma_info_core_core=
_clks)",
+        "MetricExpr": "((cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@ - cpu@UOPS_=
EXECUTED.CORE\\,cmask\\=3D3@) / 2 if #SMT_on else cpu@UOPS_EXECUTED.CORE\\,=
cmask\\=3D2@ - cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D3@) / tma_info_core_core_=
clks",
         "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_issue2P;tma_p=
orts_utilization_group",
         "MetricName": "tma_ports_utilized_2",
         "MetricThreshold": "tma_ports_utilized_2 > 0.15 & (tma_ports_utili=
zation > 0.15 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2))",
diff --git a/tools/perf/pmu-events/arch/x86/haswellx/hsx-metrics.json b/too=
ls/perf/pmu-events/arch/x86/haswellx/hsx-metrics.json
index 8245a98ad4b9..b8845f8a28b9 100644
--- a/tools/perf/pmu-events/arch/x86/haswellx/hsx-metrics.json
+++ b/tools/perf/pmu-events/arch/x86/haswellx/hsx-metrics.json
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
@@ -282,7 +282,6 @@
     },
     {
         "BriefDescription": "This metric represents Core fraction of cycle=
s CPU dispatched uops on execution ports for ALU operations.",
-        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
         "MetricExpr": "(UOPS_DISPATCHED_PORT.PORT_0 + UOPS_DISPATCHED_PORT=
.PORT_1 + UOPS_DISPATCHED_PORT.PORT_5 + UOPS_DISPATCHED_PORT.PORT_6) / tma_=
info_thread_slots",
         "MetricGroup": "TopdownL5;tma_L5_group;tma_ports_utilized_3m_group=
",
         "MetricName": "tma_alu_op_utilization",
@@ -300,7 +299,6 @@
     },
     {
         "BriefDescription": "This category represents fraction of slots wh=
ere no uops are being delivered due to a lack of required resources for acc=
epting new uops in the Backend",
-        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
         "MetricExpr": "1 - (tma_frontend_bound + tma_bad_speculation + tma=
_retiring)",
         "MetricGroup": "BvOB;TmaL1;TopdownL1;tma_L1_group",
         "MetricName": "tma_backend_bound",
@@ -341,7 +339,6 @@
     },
     {
         "BriefDescription": "This metric estimates fraction of cycles the =
CPU retired uops originated from CISC (complex instruction set computer) in=
struction",
-        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
         "MetricExpr": "max(0, tma_microcode_sequencer - tma_assists)",
         "MetricGroup": "TopdownL4;tma_L4_group;tma_microcode_sequencer_gro=
up",
         "MetricName": "tma_cisc",
@@ -711,7 +708,7 @@
     },
     {
         "BriefDescription": "Measured Average Core Frequency for unhalted =
processors [GHz]",
-        "MetricExpr": "tma_info_system_turbo_utilization * TSC / 1e9 / tma=
_info_system_time",
+        "MetricExpr": "tma_info_system_turbo_utilization * msr@tsc@ / 1e9 =
/ tma_info_system_time",
         "MetricGroup": "Power;Summary",
         "MetricName": "tma_info_system_core_frequency"
     },
@@ -723,7 +720,7 @@
     },
     {
         "BriefDescription": "Average number of utilized CPUs",
-        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / TSC",
+        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / msr@tsc@",
         "MetricGroup": "Summary",
         "MetricName": "tma_info_system_cpus_utilized"
     },
@@ -756,6 +753,7 @@
     },
     {
         "BriefDescription": "Average number of parallel data read requests=
 to external memory",
+        "MetricConstraint": "NO_GROUP_EVENTS",
         "MetricExpr": "UNC_C_TOR_OCCUPANCY.MISS_OPCODE@filter_opc\\=3D0x18=
2@ / UNC_C_TOR_OCCUPANCY.MISS_OPCODE@filter_opc\\=3D0x182\\,thresh\\=3D1@",
         "MetricGroup": "Mem;MemoryBW;SoC",
         "MetricName": "tma_info_system_mem_parallel_reads",
@@ -918,7 +916,6 @@
     },
     {
         "BriefDescription": "This metric represents Core fraction of cycle=
s CPU dispatched uops on execution port for Load operations",
-        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
         "MetricExpr": "(UOPS_DISPATCHED_PORT.PORT_2 + UOPS_DISPATCHED_PORT=
.PORT_3 + UOPS_DISPATCHED_PORT.PORT_7 - UOPS_DISPATCHED_PORT.PORT_4) / (2 *=
 tma_info_core_core_clks)",
         "MetricGroup": "TopdownL5;tma_L5_group;tma_ports_utilized_3m_group=
",
         "MetricName": "tma_load_op_utilization",
@@ -928,6 +925,7 @@
     },
     {
         "BriefDescription": "This metric estimates fraction of cycles whil=
e the memory subsystem was handling loads from local memory",
+        "MetricConstraint": "NO_GROUP_EVENTS",
         "MetricExpr": "200 * (MEM_LOAD_UOPS_L3_MISS_RETIRED.LOCAL_DRAM * (=
1 + MEM_LOAD_UOPS_RETIRED.HIT_LFB / (MEM_LOAD_UOPS_RETIRED.L2_HIT + MEM_LOA=
D_UOPS_RETIRED.L3_HIT + MEM_LOAD_UOPS_L3_HIT_RETIRED.XSNP_HIT + MEM_LOAD_UO=
PS_L3_HIT_RETIRED.XSNP_HITM + MEM_LOAD_UOPS_L3_HIT_RETIRED.XSNP_MISS + MEM_=
LOAD_UOPS_L3_MISS_RETIRED.LOCAL_DRAM + MEM_LOAD_UOPS_L3_MISS_RETIRED.REMOTE=
_DRAM + MEM_LOAD_UOPS_L3_MISS_RETIRED.REMOTE_HITM + MEM_LOAD_UOPS_L3_MISS_R=
ETIRED.REMOTE_FWD))) / tma_info_thread_clks",
         "MetricGroup": "Server;TopdownL5;tma_L5_group;tma_mem_latency_grou=
p",
         "MetricName": "tma_local_mem",
@@ -977,7 +975,7 @@
     {
         "BriefDescription": "This metric represents fraction of slots the =
Memory subsystem within the Backend was a bottleneck",
         "MetricConstraint": "NO_GROUP_EVENTS",
-        "MetricExpr": "((min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.STALL=
S_LDM_PENDING) + RESOURCE_STALLS.SB) / (min(CPU_CLK_UNHALTED.THREAD, CYCLE_=
ACTIVITY.CYCLES_NO_EXECUTE) + (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ - (cpu=
@UOPS_EXECUTED.CORE\\,cmask\\=3D3@ if tma_info_thread_ipc > 1.8 else cpu@UO=
PS_EXECUTED.CORE\\,cmask\\=3D2@)) / 2 - (RS_EVENTS.EMPTY_CYCLES if tma_fetc=
h_latency > 0.1 else 0) + RESOURCE_STALLS.SB) if #SMT_on else min(CPU_CLK_U=
NHALTED.THREAD, CYCLE_ACTIVITY.CYCLES_NO_EXECUTE) + cpu@UOPS_EXECUTED.CORE\=
\,cmask\\=3D1@ - (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D3@ if tma_info_thread_=
ipc > 1.8 else cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@) - (RS_EVENTS.EMPTY_CY=
CLES if tma_fetch_latency > 0.1 else 0) + RESOURCE_STALLS.SB) * tma_backend=
_bound",
+        "MetricExpr": "(min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.STALLS=
_LDM_PENDING) + RESOURCE_STALLS.SB) / (min(CPU_CLK_UNHALTED.THREAD, CYCLE_A=
CTIVITY.CYCLES_NO_EXECUTE) + (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ - (cpu@=
UOPS_EXECUTED.CORE\\,cmask\\=3D3@ if tma_info_thread_ipc > 1.8 else cpu@UOP=
S_EXECUTED.CORE\\,cmask\\=3D2@)) / 2 - (RS_EVENTS.EMPTY_CYCLES if tma_fetch=
_latency > 0.1 else 0) + RESOURCE_STALLS.SB if #SMT_on else min(CPU_CLK_UNH=
ALTED.THREAD, CYCLE_ACTIVITY.CYCLES_NO_EXECUTE) + cpu@UOPS_EXECUTED.CORE\\,=
cmask\\=3D1@ - (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D3@ if tma_info_thread_ip=
c > 1.8 else cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@) - (RS_EVENTS.EMPTY_CYCL=
ES if tma_fetch_latency > 0.1 else 0) + RESOURCE_STALLS.SB) * tma_backend_b=
ound",
         "MetricGroup": "Backend;TmaL2;TopdownL2;tma_L2_group;tma_backend_b=
ound_group",
         "MetricName": "tma_memory_bound",
         "MetricThreshold": "tma_memory_bound > 0.2 & tma_backend_bound > 0=
.2",
@@ -1087,7 +1085,7 @@
     {
         "BriefDescription": "This metric estimates fraction of cycles the =
CPU performance was potentially limited due to Core computation issues (non=
 divider-related)",
         "MetricConstraint": "NO_GROUP_EVENTS",
-        "MetricExpr": "(min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.CYCLES=
_NO_EXECUTE) + (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ - (cpu@UOPS_EXECUTED.=
CORE\\,cmask\\=3D3@ if tma_info_thread_ipc > 1.8 else cpu@UOPS_EXECUTED.COR=
E\\,cmask\\=3D2@)) / 2 - (RS_EVENTS.EMPTY_CYCLES if tma_fetch_latency > 0.1=
 else 0) + RESOURCE_STALLS.SB if #SMT_on else min(CPU_CLK_UNHALTED.THREAD, =
CYCLE_ACTIVITY.CYCLES_NO_EXECUTE) + cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ -=
 (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D3@ if tma_info_thread_ipc > 1.8 else c=
pu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@) - (RS_EVENTS.EMPTY_CYCLES if tma_fetc=
h_latency > 0.1 else 0) + RESOURCE_STALLS.SB - RESOURCE_STALLS.SB - min(CPU=
_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.STALLS_LDM_PENDING)) / tma_info_thread=
_clks",
+        "MetricExpr": "((min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.CYCLE=
S_NO_EXECUTE) + (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ - (cpu@UOPS_EXECUTED=
.CORE\\,cmask\\=3D3@ if tma_info_thread_ipc > 1.8 else cpu@UOPS_EXECUTED.CO=
RE\\,cmask\\=3D2@)) / 2 - (RS_EVENTS.EMPTY_CYCLES if tma_fetch_latency > 0.=
1 else 0) + RESOURCE_STALLS.SB if #SMT_on else min(CPU_CLK_UNHALTED.THREAD,=
 CYCLE_ACTIVITY.CYCLES_NO_EXECUTE) + cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ =
- (cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D3@ if tma_info_thread_ipc > 1.8 else =
cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@) - (RS_EVENTS.EMPTY_CYCLES if tma_fet=
ch_latency > 0.1 else 0) + RESOURCE_STALLS.SB) - RESOURCE_STALLS.SB - min(C=
PU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.STALLS_LDM_PENDING)) / tma_info_thre=
ad_clks",
         "MetricGroup": "PortsUtil;TopdownL3;tma_L3_group;tma_core_bound_gr=
oup",
         "MetricName": "tma_ports_utilization",
         "MetricThreshold": "tma_ports_utilization > 0.15 & (tma_core_bound=
 > 0.1 & tma_backend_bound > 0.2)",
@@ -1096,7 +1094,7 @@
     },
     {
         "BriefDescription": "This metric represents fraction of cycles CPU=
 executed no uops on any execution port (Logical Processor cycles since ICL=
, Physical Core cycles otherwise)",
-        "MetricExpr": "(cpu@UOPS_EXECUTED.CORE\\,inv\\,cmask\\=3D1@ / 2 if=
 #SMT_on else (min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.CYCLES_NO_EXECUT=
E) - (RS_EVENTS.EMPTY_CYCLES if tma_fetch_latency > 0.1 else 0)) / tma_info=
_core_core_clks)",
+        "MetricExpr": "(cpu@UOPS_EXECUTED.CORE\\,inv\\,cmask\\=3D1@ / 2 if=
 #SMT_on else min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.CYCLES_NO_EXECUTE=
) - (RS_EVENTS.EMPTY_CYCLES if tma_fetch_latency > 0.1 else 0)) / tma_info_=
core_core_clks",
         "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_ports_utiliza=
tion_group",
         "MetricName": "tma_ports_utilized_0",
         "MetricThreshold": "tma_ports_utilized_0 > 0.2 & (tma_ports_utiliz=
ation > 0.15 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2))",
@@ -1105,7 +1103,7 @@
     },
     {
         "BriefDescription": "This metric represents fraction of cycles whe=
re the CPU executed total of 1 uop per cycle on all execution ports (Logica=
l Processor cycles since ICL, Physical Core cycles otherwise)",
-        "MetricExpr": "((cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ - cpu@UOPS_=
EXECUTED.CORE\\,cmask\\=3D2@) / 2 if #SMT_on else (cpu@UOPS_EXECUTED.CORE\\=
,cmask\\=3D1@ - cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@) / tma_info_core_core=
_clks)",
+        "MetricExpr": "((cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D1@ - cpu@UOPS_=
EXECUTED.CORE\\,cmask\\=3D2@) / 2 if #SMT_on else cpu@UOPS_EXECUTED.CORE\\,=
cmask\\=3D1@ - cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@) / tma_info_core_core_=
clks",
         "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_issueL1;tma_p=
orts_utilization_group",
         "MetricName": "tma_ports_utilized_1",
         "MetricThreshold": "tma_ports_utilized_1 > 0.2 & (tma_ports_utiliz=
ation > 0.15 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2))",
@@ -1114,7 +1112,7 @@
     },
     {
         "BriefDescription": "This metric represents fraction of cycles CPU=
 executed total of 2 uops per cycle on all execution ports (Logical Process=
or cycles since ICL, Physical Core cycles otherwise)",
-        "MetricExpr": "((cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@ - cpu@UOPS_=
EXECUTED.CORE\\,cmask\\=3D3@) / 2 if #SMT_on else (cpu@UOPS_EXECUTED.CORE\\=
,cmask\\=3D2@ - cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D3@) / tma_info_core_core=
_clks)",
+        "MetricExpr": "((cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D2@ - cpu@UOPS_=
EXECUTED.CORE\\,cmask\\=3D3@) / 2 if #SMT_on else cpu@UOPS_EXECUTED.CORE\\,=
cmask\\=3D2@ - cpu@UOPS_EXECUTED.CORE\\,cmask\\=3D3@) / tma_info_core_core_=
clks",
         "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_issue2P;tma_p=
orts_utilization_group",
         "MetricName": "tma_ports_utilized_2",
         "MetricThreshold": "tma_ports_utilized_2 > 0.15 & (tma_ports_utili=
zation > 0.15 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2))",
@@ -1141,6 +1139,7 @@
     },
     {
         "BriefDescription": "This metric estimates fraction of cycles whil=
e the memory subsystem was handling loads from remote memory",
+        "MetricConstraint": "NO_GROUP_EVENTS",
         "MetricExpr": "310 * (MEM_LOAD_UOPS_L3_MISS_RETIRED.REMOTE_DRAM * =
(1 + MEM_LOAD_UOPS_RETIRED.HIT_LFB / (MEM_LOAD_UOPS_RETIRED.L2_HIT + MEM_LO=
AD_UOPS_RETIRED.L3_HIT + MEM_LOAD_UOPS_L3_HIT_RETIRED.XSNP_HIT + MEM_LOAD_U=
OPS_L3_HIT_RETIRED.XSNP_HITM + MEM_LOAD_UOPS_L3_HIT_RETIRED.XSNP_MISS + MEM=
_LOAD_UOPS_L3_MISS_RETIRED.LOCAL_DRAM + MEM_LOAD_UOPS_L3_MISS_RETIRED.REMOT=
E_DRAM + MEM_LOAD_UOPS_L3_MISS_RETIRED.REMOTE_HITM + MEM_LOAD_UOPS_L3_MISS_=
RETIRED.REMOTE_FWD))) / tma_info_thread_clks",
         "MetricGroup": "Server;Snoop;TopdownL5;tma_L5_group;tma_mem_latenc=
y_group",
         "MetricName": "tma_remote_mem",
--=20
2.50.0.727.gbf7dc18ff4-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61289C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7xR4SiGV/Zsrl53/7fnJi2BlyWRQB9CJi1ByTsZgto=; b=HNl/IXWrIiEr4qoUDm6aE0MBzT
	P1aBAzkHWRXv/TlJi+euisy0dECZX5eBvnTVHBqLhpTbhxSFGtFMkHMVn0NzfDb0zjYuaI6Y69KzL
	6Mjt2pRgm2ssYE3IFFTnxrA73qQn02houF//NKz0iwMU59P9RapHeCjV2i3qht3W06AiLjMUAtyls
	lvwS3EyXeiPxJJJZ5tKFCa02m/VO2y7L5/oaGgg0MyizUHFWHkmMgeLD3MZxMtpX9DuiPai15yzG+
	/yJBhC/C4pzXEE1VICAG1ZPd/tKIEj0SEJwm2BVbE6sMeuRkV5L6AjpBb9tD3RyQ7ZD0bisAJsjlA
	mbzDS1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbGi-00000002QeK-0a5n;
	Mon, 10 Mar 2025 11:26:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1traha-00000002JNH-40yy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:49:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AB15153B;
	Mon, 10 Mar 2025 03:49:54 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E299F3F5A1;
	Mon, 10 Mar 2025 03:49:40 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 7/8] Documentation: coresight: Document AUX pause and resume
Date: Mon, 10 Mar 2025 10:49:18 +0000
Message-Id: <20250310104919.58816-8-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310104919.58816-1-leo.yan@arm.com>
References: <20250310104919.58816-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_034943_118312_6B25C1EA 
X-CRM114-Status: GOOD (  13.33  )
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

This adds description for AUX pause and resume.  It gives introduction
for what's AUX pause and resume and how to use the configuration terms.
As last, it records several usage examples.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../trace/coresight/coresight-perf.rst        | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/trace/coresight/coresight-perf.rst b/Documentation/trace/coresight/coresight-perf.rst
index d087aae7d492..c49aa05c51eb 100644
--- a/Documentation/trace/coresight/coresight-perf.rst
+++ b/Documentation/trace/coresight/coresight-perf.rst
@@ -78,6 +78,56 @@ enabled like::
 
 Please refer to the kernel configuration help for more information.
 
+Fine-grained tracing with AUX pause and resume
+----------------------------------------------
+
+Arm CoreSight may generate a large amount of hardware trace data, which
+will lead to overhead in recording and distract users when reviewing
+profiling result. To mitigate the issue of excessive trace data, Perf
+provides AUX pause and resume functionality for fine-grained tracing.
+
+The AUX pause and resume can be triggered by associated events. These
+events can be ftrace tracepoints (including static and dynamic
+tracepoints) or PMU events (e.g. CPU PMU cycle event). To create a perf
+session with AUX pause / resume, three configuration terms are
+introduced:
+
+- "aux-action=start-paused": it is specified for the cs_etm PMU event to
+  launch in a paused state.
+- "aux-action=pause": an associated event is specified with this term
+  to pause AUX trace.
+- "aux-action=resume": an associated event is specified with this term
+  to resume AUX trace.
+
+Some Arm CoreSight sinks (e.g., ETR, ETB) do not support interrupt
+mechanism. As a result, trace data might be lost if it cannot be copied
+to the user space tool in a timely manner. To mitigate trace data lose,
+a configuration term "update_buf_on_pause" can be used for the cs_etm
+PMU event. As its name suggests, it directs the driver to update the
+buffer when the AUX trace is paused. By default, this feature is
+disabled until users explicitly specify "update_buf_on_pause=1".
+
+TRBE has interrupt handling.  To avoid the race condition between the
+AUX pause or resume invoked in NMI and TRBE interrupt handler, the
+driver reports a failure if users try to use "update_buf_on_pause=1" on
+TRBE.
+
+Example for triggering AUX pause and resume with ftrace tracepoints::
+
+  perf record -e cs_etm/aux-action=start-paused/k,syscalls:sys_enter_openat/aux-action=resume/,syscalls:sys_exit_openat/aux-action=pause/ ls
+
+Example for triggering AUX pause and resume with PMU event::
+
+  perf record -a -e cs_etm/aux-action=start-paused/k \
+        -e cycles/aux-action=pause,period=10000000/ \
+        -e cycles/aux-action=resume,period=1050000/ -- sleep 1
+
+Example for updating buffer on AUX pause::
+
+  perf record -a -e cs_etm/aux-action=start-paused,update_buf_on_pause=1/ \
+        -e cycles/aux-action=pause,period=10000000/ \
+        -e cycles/aux-action=resume,period=1050000/ -- sleep 1
+
 Perf test - Verify kernel and userspace perf CoreSight work
 -----------------------------------------------------------
 
-- 
2.34.1



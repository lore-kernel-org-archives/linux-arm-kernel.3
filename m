Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270E6C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7xR4SiGV/Zsrl53/7fnJi2BlyWRQB9CJi1ByTsZgto=; b=eJkjymX+wwAyRSvNT+ghaxyBgP
	m9UXAEsoyf11B7cpYc49Y03Ny4Cm0TCGAbF621qPfoiE1usv94+nDeT5TVHAlguNP4bHdCn4NhDK9
	G0jME12E6PkfBoL5L2mun4s3VEJshoTovt0AdapDcaL7F8X/Ejzg234fdhly8nSz3M2oSMgLxSGx9
	XKKN9Jb6S8h2LYbEwpDM3MWD94WPTYQE4LtHgVJv4iQI62c+v9h2sgM30CtH8COs9J/Um4r0wiZiX
	EjJb2HF5uAUh65V74l8YDsebypnmX8QECY7LK/XehhKp25Z5OHjWQVv2S+eoqorfCG+UeprS/2ows
	peSj1ttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaWF-0000000EIq8-1C8R;
	Mon, 24 Feb 2025 15:37:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaAh-0000000EFJf-0BE0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Feb 2025 15:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=j7xR4SiGV/Zsrl53/7fnJi2BlyWRQB9CJi1ByTsZgto=; b=aNVWvxTTxn3MuxdYt40BbovXSi
	CNR6Z44+LAyQgF1gKy5aI1nCspJ0lg5HnZc4od4EfLtv8m5u1xP6jL2Xzi19pkqTf5DV47q7ZVw0o
	sWRagjeHLlmhnDe1Wtjo4m1w4SAF21uCt3fPAseXveF+asmxrNWgrbTsx3jYqVPVRZPDO+BK01Sbq
	bgdfYZz58QnaLpdhO+YW6P82ABC9Pst1Vw1q9OSxm2X8bE+J6b10F0l4UHt6SiDZ7jR2WJaIb7f2i
	g435kTM22gGFSjU9z/hmnom5csgqRJEbX5hw9Pd4aTOY9REuDbXOlUoj0A/zhD1hATKLir1tkXFUc
	PpQmGEOQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaAd-00000003DZ9-3pfg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 15:15:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22BAF26B9;
	Mon, 24 Feb 2025 07:15:14 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2FAA3F6A8;
	Mon, 24 Feb 2025 07:14:55 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 7/8] Documentation: coresight: Document AUX pause and resume
Date: Mon, 24 Feb 2025 15:14:22 +0000
Message-Id: <20250224151423.1630639-8-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224151423.1630639-1-leo.yan@arm.com>
References: <20250224151423.1630639-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_151500_339457_89665BD8 
X-CRM114-Status: GOOD (  12.80  )
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



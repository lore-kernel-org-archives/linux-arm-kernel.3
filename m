Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBFAC982C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=palhLwTnxmx+3knOYeXtmMH8KG1BCauXXBUx/sh7huQ=; b=JUiOTAy9GwoaIVkiIlvy0g9Vo0
	CR0QJg7KmwCIWApWPv9D3v5GnoM7btxcdKXVvR8JISgHYbEoIv5DDTDB4EPV8BOZS9dn0As2X67pY
	bclcfPC9CA+VeuFhmGtg+vLv9uODDU7mpy2ZSu0vIkoMo0n+sVCn27uqFi3TVoJFoLM4sfqIxVCJf
	zavHgpuQ3ThMgTypFlFtqdkOxENdduMedlico3/N+Fml+qXm+lvMb1G+iHlcM8nVwycwuBZxXD8pw
	9xAJ1PMmv6bywm+haqzEwHJxoJxMNB1RfcEswXCg51B3GCKRPxg+NP/PQUpsWnDZZJd5E1qyiuUb0
	1295HqZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VQg-00000007IpA-0xzN;
	Tue, 15 Sep 2026 15:50:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VQE-00000007ISc-1O2K
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=palhLwTnxmx+3knOYeXtmMH8KG1BCauXXBUx/sh7huQ=; b=hFWnGJ+cyUKjH6kKu0+DPzriXh
	QUbadeWJarDZHg7LAhvmya6Ps+RWyAcE9m1bFVjt5LQNhBxhm4al7XUYDGMCOGpvhKU6vE3XWzuLa
	UdnC+R0MWb+uxp2UdRSZAziC7U/M4uf5aVP0OiU/PrT4JnsGGH/U5l0IRS3W/Ysm3YvFdlKwLD/0g
	7QIZn9EnhzcmZy2zFCDfFyjCHSDsk0tm771u+Qrn1rKr22flrruSD0muQbGwaHQTBtPKiDDM+kZQp
	xo4K1PKzqUpvIDCTzFCSkI4IoKvnPVszutkAv91GFPuk4SjPP1kgMKcSP8NiqY4RY385hnBgQvGr+
	MqEv8etg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VQB-00000006ydD-0GZu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:50:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EE711570;
	Tue, 15 Sep 2026 08:50:06 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93D623F882;
	Tue, 15 Sep 2026 08:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487409; bh=lVZAl+1VuCBKIxAJbqmvv4H5T5nJSZSgCMMDFerPAQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ExkSaBJoAMNwxm+ZhzKUfYC/Xcf5kDN8atZv3BhBSawhhHcZEzSSuetTJ3ClfUsEK
	 eKuGkiPPqRWVlERgQQbO49QhRWlo9s28Y/2v/I8SiSTHhWQDfpOXe4S9IXrTIJBlpN
	 JCuQsUDmbi6Q6Y1gOoMGPZpKSuPrlz50Y95hw66Q=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:49:11 +0100
Subject: [PATCH 25/25] Documentation: coresight: Document AUX sample
 decoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-25-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487341; l=3171;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=lVZAl+1VuCBKIxAJbqmvv4H5T5nJSZSgCMMDFerPAQM=;
 b=XjxNu2wRoGrUaTZHtHM2Yf1eAsTXNzo+4/Umo08aBPRMMhqEKSEPnPqtp1q9c0Kfj7e3hWMIc
 KXpp1K5QzZrDEQ7FZ4kRoP89qkLuUIUk355gwdtfbw/ZpJbg6jXuNjk
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_165011_622743_BA48728C 
X-CRM114-Status: GOOD (  14.49  )
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

Describe recording AUX trace in PMU samples and generating callchains
and branch stacks with --itrace=G and --itrace=L.

Explain the default decoding behavior, preservation of recorded stacks,
context ID requirements and decoding limitations.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 Documentation/trace/coresight/coresight-perf.rst | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/trace/coresight/coresight-perf.rst b/Documentation/trace/coresight/coresight-perf.rst
index c0c82b3d26ea88dad7143afdb047c4d8f502b4a6..59eda2a5b6473ed1cb6bade5d281a12bdde76bb0 100644
--- a/Documentation/trace/coresight/coresight-perf.rst
+++ b/Documentation/trace/coresight/coresight-perf.rst
@@ -171,6 +171,45 @@ no branch history at all, for example samples from a thread that was never
 traced, or samples recorded before the first or after the last trace window.
 It is built and installed with perf's other dlfilters.
 
+Decode branch stack and callchain from AUX samples
+--------------------------------------------------
+
+With a kernel that supports CoreSight AUX sampling, record an AUX trace
+window inside each cycle sample::
+
+  perf record --aux-sample=8192 -e '{cs_etm//u,cycles/period=100003/u}' \
+        -- ./workload
+  perf script --itrace=G16L64 -F comm,pid,tid,cpu,event,ip,brstack
+
+``G16`` adds a reconstructed callchain and ``L64`` adds up to 64 branches.
+Either option can be used alone. Existing callchains and branch stacks are
+preserved. Without an explicit ``--itrace`` option, both are enabled for AUX
+samples. Decoded history is available in ``perf script`` and ``perf report``.
+
+AUX sampling supports unformatted, per-CPU sink (TRBE) trace. Each sample
+selects its CPU's decoder and starts a fresh trace window. The window already
+belongs to the sample, so ETM timestamps are not required for attribution.
+Samples without decodable history receive no reconstructed stack. CPU-wide
+recordings must enable context IDs to distinguish tasks within a window; the
+default recording setup enables them.
+
+Callchains cover only calls visible in the captured window; callers before
+the first synchronization point cannot be recovered.
+
+When kernel tracing is enabled, AUX samples can include PMU interrupt-handler
+execution before the trace source is paused. The late-sample helpers trim
+this using instruction addresses, which may not uniquely identify the sample
+boundary for kernel samples.
+
+Formatted sinks such as ETR are not supported. They can collect trace from
+sources on multiple CPUs in a shared buffer, mixing execution from unrelated
+threads into the AUX sample. Context IDs can distinguish these threads, but
+trace from other CPUs can consume the limited sample window, leaving little
+history for the sampled thread.
+
+Guest samples, synthesizing instruction events, and saving reconstructed
+callchains with ``perf inject`` are also unsupported.
+
 Perf test - Verify kernel and userspace perf CoreSight work
 -----------------------------------------------------------
 

-- 
2.34.1



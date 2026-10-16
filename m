Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E81CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYnNFfmtNv8ZoXewo/PrE49LSB6uf/99lfqKQher7aY=; b=cUVgCk0YLqysR7mYsXCobMRcL/
	gi1DZzKY063PWMf8trFnmOjeNfCPip6on1AKuecsnk3IwIr0g0DChNfKhBVvpyaeV7YeiZ4C/Nt9e
	fh9TsrdQl0qBa4LWkYvrUoHQER1gsar7SVL93hpdZgs8a5vOU84LHFAm0R+vjxBRjhDKZgE1zyApI
	Jly522MKwFPArQCqVZJeT4jZn1UCXtNm0FWFpoOO3Gpt4JLZ3+nfgvn/nS9H2kSi5fKESIN4Gn8VO
	rMJjMS1fGSHge6mTUMwFtSW5f01UOYbDDg865SlVszEHrGgmbL8hZIM0b4Ex7OrHqx4hmmu4H1L7G
	zl03pcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDz-00000003UPo-35tL;
	Fri, 16 Oct 2026 16:56:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDd-00000003U4Y-36BE
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZYnNFfmtNv8ZoXewo/PrE49LSB6uf/99lfqKQher7aY=; b=MXUx2aq2Y2yU0D4VQBLc0rR/Ll
	U9hddtN/oy8ky0e0qeMmeZjy3e+A+MI1yZS23DQudJvanFUxQEmnksI9ICGl6Yl9+cggioVGNsM3f
	OjNxraWnKwpVmXxFZjIogV1ZFpzGiLB7g/NRrHau/ffwDzgpxZhxlimgj1xendkuS2uWTiJpcsk6j
	5X8ZKrYE/xtkp1Q1Y4eRn2ks+9n7kwGYmtHrO41mFuUB0ZZQk8yilVCHziOsl5Gr5tksCBIED4x6b
	H6AYAvCUcorsL8B/2u4V9qVJNJUFzySeSqDEtOcnN+bizlBrKeLB9pgM45+wl2i41YZ0D+dkfRg3T
	hRtrnYug==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlDa-00000001lLn-3JjS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 206BE1477;
	Fri, 16 Oct 2026 09:55:38 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBFFD3F7B4;
	Fri, 16 Oct 2026 09:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169741; bh=yWcMQrJ3DBzynGtO8A/EkzjEPEYj/c5Q1ImidAgitGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UkORsnD8vOoc0ygorycTnWUM9PzAGQJxcxG3Dl8j5RPUJ3dxlE+o4dr1Z2lHLYB31
	 /vNji6DEz3bBNwOBFIVmo6CBSoZ0D4abqsu1F5dsOCeGvDOqtmH+96KYM5+wKmAVON
	 2zgCOoD8PtrSWaVZlQhakviZTcPtr9IE9KFDqMt4=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:14 +0100
Subject: [PATCH v2 16/23] coresight: trbe: Always classify TRBSR when
 updating buffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-16-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=2929;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=yWcMQrJ3DBzynGtO8A/EkzjEPEYj/c5Q1ImidAgitGc=;
 b=N2IcP89/ynF6Y+HXtEcyjSRV3HhA3DmguaPBS50vwyHMcNl4eSfqlsgJbWLrnltijRcTrJW11
 O5HX38akGFcDjV5Bd//4ye0p+EN+WpsLp33Mkv4/wvNATRvPYqhti1y
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_175543_203690_7CC78519 
X-CRM114-Status: GOOD (  15.92  )
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

arm_trbe_update_buffer() must account trace when perf stops a session,
even if no maintenance interrupt has been handled. Prepare it for
trigger and wrap modes by making the trace-size decision from the
drained TRBSR status rather than gating classification on IRQ.
Acknowledge IRQ only when it is set.

In FILL mode, reaching LIMIT sets WRAP and IRQ and returns TRBPTR to
BASE. Interrupt delivery can be delayed, so update_buffer() may run
before the IRQ handler. The existing IRQ-gated path uses WRAP to size
through LIMIT in that case; preserve this while also classifying
updates without a pending IRQ.

With classification on the no-IRQ path, a normal software stop can
have TRBSR.S clear and an ignored detected trigger can set TRBSR.TRG.
Neither should warn or discard valid trace. Mark fatal status as
truncated and return zero. Use LIMIT for a filled WRAP and TRBPTR
otherwise.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index ac49098aa08412a23a20d32f84c2e1977ee4a223..661f4a78e67c30652de8c834e4773819fa67b5ac 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -662,8 +662,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 	int ec = get_trbe_ec(trbsr);
 	int bsc = get_trbe_bsc(trbsr);
 
-	WARN_ON(is_trbe_running(trbsr));
-
 	if (is_trbe_abort(trbsr)) {
 		err_str = "External abort";
 		goto out_fatal;
@@ -844,7 +842,6 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
 	enum trbe_fault_action act;
 	unsigned long size, status;
 	unsigned long flags;
-	bool wrap = false;
 
 	WARN_ON(buf->cpudata != cpudata);
 	WARN_ON(cpudata->cpu != smp_processor_id());
@@ -896,23 +893,20 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
 		 */
 		clr_trbe_irq();
 		isb();
+	}
 
-		act = trbe_get_fault_act(handle, status);
-		/*
-		 * If this was not due to a WRAP event, we have some
-		 * errors and as such buffer is empty.
-		 */
-		if (act != TRBE_FAULT_ACT_WRAP) {
-			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
-			size = 0;
-			goto done;
-		}
+	act = trbe_get_fault_act(handle, status);
 
+	/* If an error occurred, the buffer may be empty */
+	if (act == TRBE_FAULT_ACT_FATAL) {
+		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
+		size = 0;
+		goto done;
+	} else if (act == TRBE_FAULT_ACT_WRAP) {
 		trbe_report_wrap_event(handle);
-		wrap = true;
 	}
 
-	size = trbe_get_trace_size(handle, buf, wrap);
+	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
 
 done:
 	local_irq_restore(flags);

-- 
2.34.1



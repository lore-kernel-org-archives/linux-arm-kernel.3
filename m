Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E740BCCF2C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0DNGFQanoerREPC327p+1kdXR89lF8nqt11hgW9DAk=; b=h43BCbIhhCKi6g6eB/3goIJicJ
	BE6I3NaECS9kr613WbuLNW4qOslWtrHTF9yNEtCgm25hmfRcE1tYuS29/KPGccaOwQJj61cJXTLqZ
	ZxeOsSO40ADR3XpREX1xGaih6Egm+J6oxssaHk78KCp7+Nmbz9d8X4wErgGl+US7i8/STtHpKsUkH
	xAEL+q/mcK2UGwO4EWDr0DlN1+ta1XIqkmj31h2a66ziQLKBhfS1ngr7jkQWLa1U4jUeUKwOAkYa/
	zTat+XLMXz/CZVCKy3MnhJJFib057N5OMFjoaqADKdKOYUOcn4Ri1DGd/R/rr+WUDo1Y0WmKYM3Z/
	eJFI+3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlE3-00000003UWx-0MlC;
	Fri, 16 Oct 2026 16:56:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDq-00000003UGa-1bc9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=M0DNGFQanoerREPC327p+1kdXR89lF8nqt11hgW9DAk=; b=CNdGdc1mMPWjbdS/sa2FBIvhc2
	rUJUGrs9fcyTTnTnhMuXSWxw0DK/HdLkJmWmm30sM/E53TRyALoYbjDZjvi2SYjKggA+VfXJ4SUag
	hlKJvKpLcIgyEWvfn5docDq8kWsITMonfTdq2W1TEsdf30IudJ2mm9swqYsHY5mx1XXLCXmabK87J
	tcx42YlBkOQnpOzu1X5BWAB3VfAzS0jxXyhl9RuY1KeJWB02hKaDluCSD33RIE1jM1fUxNw5MDOiU
	XOSEyfdeC/jaqB/te1utAuUhYtIimZOdLTHaad48qFAlG+XR0kqIV0pxuwvjdWzNWzHd5MmWpoydR
	gDtLFR7Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlDn-00000001lLn-1x39
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED5EF175D;
	Fri, 16 Oct 2026 09:55:50 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9B243F7B4;
	Fri, 16 Oct 2026 09:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169754; bh=heLyCzP1OgFt+fIxgZTcGvWkmEm4xEc14PmqM7fQv9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MZNK9mBUe9kCsPgtWkV1BZFie4DV9HzyIrE3N0fF7ZU+87JlD4oqMUWBNTOs/4r+y
	 llHMR3GFNAKSqtQZVcq7usYmiEFxfryLlLSZ3eU1kpr8AGIxTPJwz7+4B49g4cxRBD
	 R5tn41tTSj9PtO+3uDnEXu2140pds6KVgYklUBHI=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:21 +0100
Subject: [PATCH v2 23/23] coresight: trbe: Report trace gaps with PARTIAL
 instead of COLLISION
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-23-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=3130;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=heLyCzP1OgFt+fIxgZTcGvWkmEm4xEc14PmqM7fQv9o=;
 b=dbGqZUyaDLNBTHx4jK+djoBtF4nEgp1sIJbFz3bMeMLfoLtgMew6Ecf1iItF83agWnFh26J3p
 P9eIoNmg232BTNmWbG314KQ8tVGm9DegVTDh+U46AqHws4KkMdYvXUL
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_175555_891717_77E49121 
X-CRM114-Status: GOOD (  18.79  )
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

When a fill-mode wrap stops TRBE, the trace source can continue running
until software handles the stop. Trace generated during this interval
may be lost.

The overflow path now stops and restarts the trace source around buffer
reprogramming. This emits ASYNC packets so the decoder can synchronize
with the next trace segment. Use PERF_AUX_FLAG_PARTIAL to report the
possible gap instead of PERF_AUX_FLAG_COLLISION.

Set PARTIAL in both the overflow handler and the buffer update callback.
This also preserves the gap indication when event shutdown handles a
pending wrap, even if no further trace segment follows. Limit the flag
to stopped buffers.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 29 +++++++---------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 6bc82d5b55539795059da37039d2929b4ea504e3..29a1882b1f3c2eb7166f71eeef37badece67039c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -285,25 +285,6 @@ static void trbe_reset_local(struct trbe_cpudata *cpudata)
 	write_sysreg_s(0, SYS_TRBSR_EL1);
 }
 
-static void trbe_report_wrap_event(struct perf_output_handle *handle)
-{
-	/*
-	 * Mark the buffer to indicate that there was a WRAP event by
-	 * setting the COLLISION flag. This indicates to the user that
-	 * the TRBE trace collection was stopped without stopping the
-	 * ETE and thus there might be some amount of trace that was
-	 * lost between the time the WRAP was detected and the IRQ
-	 * was consumed by the CPU.
-	 *
-	 * Setting the TRUNCATED flag would move the event to STOPPED
-	 * state unnecessarily, even when there is space left in the
-	 * ring buffer. Using the COLLISION flag doesn't have this side
-	 * effect. We only set TRUNCATED flag when there is no space
-	 * left in the ring buffer.
-	 */
-	perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
-}
-
 static void trbe_truncate_event(struct perf_output_handle *handle)
 {
 	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
@@ -917,10 +898,12 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
 		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
 		size = 0;
 		goto done;
-	} else if (act == TRBE_FAULT_ACT_WRAP) {
-		trbe_report_wrap_event(handle);
 	}
 
+	/* Trace may have been lost before the source was stopped. */
+	if (act == TRBE_FAULT_ACT_WRAP && !is_trbe_running(status))
+		perf_aux_output_flag(handle, PERF_AUX_FLAG_PARTIAL);
+
 	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
 
 done:
@@ -1246,7 +1229,9 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
 	if (buf->snapshot)
 		handle->head += size;
 
-	trbe_report_wrap_event(handle);
+	if (is_buffer_stopped)
+		perf_aux_output_flag(handle, PERF_AUX_FLAG_PARTIAL);
+
 	perf_aux_output_end(handle, size);
 	event_data = perf_aux_output_begin(handle, event);
 	/*

-- 
2.34.1



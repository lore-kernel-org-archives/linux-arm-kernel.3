Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C20CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqhwNwRGlvktH8g4e9ONdSrPFXHTY4WjbSIhlgpD0h8=; b=ajmau5r18WZH/hkvR+QCP1Wvrj
	CZtLf2nlMScUPBNixDIvRytxOhQSkMV1QUxK3DiDhvEjy0zyiFqWfaALCn/KN0dZRF24KXpTolp49
	s9EEs08yfp2tLNLttY9BekrhJd+YfZHUj+HkpOgINSK8gxwxa+pzHUWvoJtUxTmBpR5WZP6x3tOyD
	jHmszNL6y+lZlAyXmvqkEf6TY/R0xw+K3CUGvBvW8hPVB38M90TnLhu3DkmGpzZOcXCzvfC8S7RWt
	lyRBrfuWFVVkHobgNZmHAP/wSpfVcQsTTM9m0NyeXoM3LlRgMvLCpcGuoHkbh+TbgekLqrs66/WBh
	pA6z4vRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDz-00000003UQQ-41Q4;
	Fri, 16 Oct 2026 16:56:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDg-00000003U7U-02VL
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XqhwNwRGlvktH8g4e9ONdSrPFXHTY4WjbSIhlgpD0h8=; b=d4x8iJaM9fTx9UvrV7Cfwko07s
	pay9Zf9pPCjIPw39w6/qrk+h5D9NIo5YM6ajSjLLd6H+itWxpygcNuIxoLUR8ontK9Y0cs8sU30L2
	SNZb7ELtU/N6wc+YR3OSX3AUvB0Wj9TMSqaynPAzmS3zASq7uVdCZblVXm5X2w06afTs1drCOovkb
	LGm3qoD/A60awlvKDfGry80R/1OHpU+Xd007Eld87KJvWA6IUjmX1JxGlc9Dyawn+xgrlNdwPrLYK
	Ixd4Q/L+eog22MtThI70qpkBG7iXoXAFKEtOP3uQdXTBBQMVxnMPNrc0rakC3TcEOJSkiwjxNBZ2S
	D0fj7BRA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlDc-00000001lL7-2eHw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFDB81691;
	Fri, 16 Oct 2026 09:55:39 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5ED33F7B4;
	Fri, 16 Oct 2026 09:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169743; bh=xWOfM2JxhW8k1I5NjNuuL5MN3cqFbmprf5JA+C66BDc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SD6yXz3LQKh1IqjgArlPGsyU7HrPdqNZvoKSSCzvoZXXbbsD/V64/UlcMI9mAYdJb
	 Skusi7C3BFawsDGlESvGdeVXq3kWy6EZ4Kl6Ez5aRChE3AukXNHV1eO+kgCbIXI0ea
	 5j9bmMMSx824ZTHy4IpOY9SjAzbRzoNzV3TrkVfA=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:15 +0100
Subject: [PATCH v2 17/23] coresight: trbe: Calculate trace size across
 buffer wrap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-17-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=4357;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=xWOfM2JxhW8k1I5NjNuuL5MN3cqFbmprf5JA+C66BDc=;
 b=HC6011WXYVwcJ+m/L3PIyxQJXH9yObGUggmTEsnYVgyPvAT5tPCfeAB9mlY4tpC9PnDvtce/L
 RmkbE+3ztwdDaqfw9c6mYrGlYwSaaULwROyEtf6b5YtE/YQI4Klu/Cj
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_175545_155035_B76ED352 
X-CRM114-Status: GOOD (  21.01  )
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

trbe_get_trace_size() assumes that the TRBE write pointer is always ahead
of the perf AUX head. That is not true after a WRAP event, where the write
pointer can move back to the start of the programmed TRBE span.

Calculate the size in two parts for WRAP: the bytes from the current AUX
head to TRBLIMITR_EL1, plus any bytes from TRBBASER_EL1 to the current
TRBPTR_EL1. Keep the non-WRAP path strict and reject an unexpected write
pointer below the AUX head.

For CPUs affected by the overwrite-fill-mode or write-out-of-range errata,
continue to ignore TRBPTR_EL1 on WRAP and account data only up to
TRBLIMITR_EL1, since bytes beyond the programmed limit are uncertain.

Apply this fallback before validating the write pointer so a WRAP report
with a pointer outside the programmed range still publishes the trace
from the AUX head to the programmed limit.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 62 +++++++++++++++++-----------
 1 file changed, 37 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 661f4a78e67c30652de8c834e4773819fa67b5ac..9a469c8009ce8a8a8b804c2b63a68e741f1dceaa 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -730,43 +730,55 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
 					 struct trbe_buf *buf, bool wrap)
 {
-	u64 write;
-	u64 start_off, end_off;
-	u64 size;
 	u64 overwrite_skip = TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES;
+	u64 base = buf->trbe_base;
+	u64 start_off = PERF_IDX2OFF(handle->head, buf);
+	u64 write = get_trbe_write_pointer();
+	u64 limit = get_trbe_limit_pointer();
+	u64 limit_off, write_off, size;
 
 	/*
-	 * If the TRBE has wrapped around the write pointer has
-	 * wrapped and should be treated as limit.
-	 *
 	 * When the TRBE is affected by TRBE_WORKAROUND_WRITE_OUT_OF_RANGE,
-	 * it may write upto 64bytes beyond the "LIMIT". The driver already
+	 * it may write up to 64bytes beyond the "LIMIT". The driver already
 	 * keeps a valid page next to the LIMIT and we could potentially
 	 * consume the trace data that may have been collected there. But we
 	 * cannot be really sure it is available, and the TRBPTR may not
-	 * indicate the same. Also, affected cores are also affected by another
-	 * erratum which forces the PAGE_SIZE alignment on the TRBPTR, and thus
-	 * could potentially pad an entire PAGE_SIZE - 64bytes, to get those
-	 * 64bytes. Thus we ignore the potential triggering of the erratum
-	 * on WRAP and limit the data to LIMIT.
+	 * indicate the same.
+	 *
+	 * Also, affected cores are also affected by another erratum
+	 * TRBE_WORKAROUND_OVERWRITE_FILL_MODE, which forces the PAGE_SIZE
+	 * alignment on the TRBPTR, and thus could potentially pad an entire
+	 * PAGE_SIZE - 64bytes, to get those 64bytes. Thus we ignore the
+	 * potential effects of the erratum on WRAP and limit the data to
+	 * LIMIT.
 	 */
-	if (wrap)
-		write = get_trbe_limit_pointer();
-	else
-		write = get_trbe_write_pointer();
+	if (wrap &&
+	    (trbe_may_overwrite_in_fill_mode(buf->cpudata) ||
+	     trbe_may_write_out_of_range(buf->cpudata)))
+		write = limit;
 
-	/*
-	 * TRBE may use a different base address than the base
-	 * of the ring buffer. Thus use the beginning of the ring
-	 * buffer to compute the offsets.
-	 */
-	end_off = write - buf->trbe_base;
-	start_off = PERF_IDX2OFF(handle->head, buf);
+	/* Should never happen ... */
+	if (WARN_ON_ONCE(write < base || write > limit))
+		return 0;
 
-	if (WARN_ON_ONCE(end_off < start_off))
+	limit_off = limit - base;
+	write_off = write - base;
+
+	if (WARN_ON_ONCE(start_off >= limit_off))
 		return 0;
 
-	size = end_off - start_off;
+	if (!wrap) {
+		if (WARN_ON_ONCE(write_off < start_off))
+			return 0;
+
+		size = write_off - start_off;
+	} else {
+		size = limit_off - start_off;
+
+		if (write != limit)
+			size += write_off;
+	}
+
 	/*
 	 * If the TRBE is affected by the following erratum, we must fill
 	 * the space we skipped with IGNORE packets. And we are always

-- 
2.34.1



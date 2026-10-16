Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FEACCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ma9n40PrHYxAJ1JIzoWY1yP1AtpSc1ksCHNdgaDzul4=; b=ktoy3/wRIstiI9/u661RzkQ2Ic
	fM8iWVNpW72r+IIF6unsqiBavf+tGN/vUsadT0u3qkZc8TnbBce+ER482FBS1uFU19YQlCTFo50OR
	5EybqCVJ1RO2pkgjMrdBx9DIcXn6x7qU/76/VdJnfG+0bRWXBgbkpXUYMwlppzMj/YQ/657Z/k+5m
	fwQ6FXxw+VlBUxum0jbaq0H5PlutH6B4zHxqNDSLNeuP25DUjR2d3qR+W/xq+/U3SZAClwnGzS3GO
	ao3HKEjb8juZSM91uv9PNVr8/WobbgpI+eYV4gU2vhb1jJERcOD9Ge2715GI0jBKYZHfdquuoLvFJ
	KPLOVqfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDY-00000003TxK-2Wn5;
	Fri, 16 Oct 2026 16:55:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDT-00000003Ts6-3UNo
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ma9n40PrHYxAJ1JIzoWY1yP1AtpSc1ksCHNdgaDzul4=; b=Ptkpv88pqaMrGpd8xBD8Sb8f/+
	A1XvsGIoFX8g2nkeFy3gHHSgsPGnb+K8W2/N1sIsGp9mIdrh2Hq78YoMS3lENukegdJfNMtgwQAMY
	mi2+LOPaRV7C+rWoqHXo24dkaLTYOtZjpUsYUvcqXWkTAJ0RhvbPS3bEKyGAgawuwgxHB6L4NhBpl
	LKsYghaTWXnwp60U0xBjRB/lre5g9Gir2FpDSf2tfICAYSCG67rHbmGNb2WJRyU5VtypNtG+57+xI
	jiGClvG6nx/bHjdElc6xaOWgieFBu869M1QxL53oVQBzL2Vd7ix4LCPHXuRcVfUdra8v+LVS2EV7X
	jXovr4Qg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlDR-00000001lJZ-01pi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E74131691;
	Fri, 16 Oct 2026 09:55:28 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FE513F7B4;
	Fri, 16 Oct 2026 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169732; bh=Ci4jQGVodjiB+/z/lfOy/LyT2edA351Qgh0wmsig4rY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KVLOmbDVKubejrK78neacC+V0Rhbz32I/P1WLQo5Sm2j3hTtKwIEHrvWSi/hhmbfI
	 7KoXZhLTw2EJhGaWXbo78cGyLmGkLUlN1Hp/x8V+N4AP2yx5NIuBdqp16BR7TBvgoV
	 LB7rWLiwzW/mANW71CMsyPbIEfzes8k6lR5QaXEU=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:09 +0100
Subject: [PATCH v2 11/23] coresight: trbe: Assign the perf handle in enable
 and disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-11-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=3418;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Ci4jQGVodjiB+/z/lfOy/LyT2edA351Qgh0wmsig4rY=;
 b=7cpRKItxfN8/08ZsQgsas0Sp4YJg0iK/kZoIm4+dwIdfR1CjzvzPJQnQE/dSZfI2f95+JNrvi
 DO4P7w50Qm6Acd0Sco+V4JidJzI2sfQU6kwEMVjO5ckHF+188ABUIZ/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_175533_335786_A8EF7080 
X-CRM114-Status: GOOD (  14.34  )
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

etm-perf owns the perf output handle embedded in its per-CPU etm_ctxt and
passes it to TRBE through arm_trbe_enable(). TRBE binds that handle after
successful sink enable and unbinds it in arm_trbe_disable(). The handle
object remains valid throughout this interval, even if the current AUX
transaction ends or a new transaction begins.

The inner enable helper currently publishes the handle, while truncation
and failed rollover clear it. Sink disable leaves the handle installed
after dropping the buffer association. These assignments track the AUX
transaction rather than the enabled sink session.

Publish the handle only in arm_trbe_enable() after successful setup and
clear it in arm_trbe_disable() before dropping the buffer association.
Remove the assignments from the inner enable, overflow and truncation
paths so the handle association follows the enabled sink session.

A valid handle object may have no active AUX transaction, so the IRQ
handler continues to check perf_get_aux() before accessing the
transaction's configuration.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 4a041bbc6e970d72a7d735e15f7221037cb091d6..1f51c33de83638479436683fd96e31d69c3b860f 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -303,11 +303,8 @@ static void trbe_report_wrap_event(struct perf_output_handle *handle)
 
 static void trbe_truncate_event(struct perf_output_handle *handle)
 {
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
-
 	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
 	perf_aux_output_end(handle, 0);
-	*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
 }
 
 /*
@@ -1012,7 +1009,6 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
 	if (ret)
 		goto err;
 
-	*this_cpu_ptr(buf->cpudata->drvdata->handle) = handle;
 	trbe_enable_hw(buf);
 	return 0;
 err:
@@ -1042,6 +1038,7 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
 		return ret;
 	}
 
+	*this_cpu_ptr(drvdata->handle) = handle;
 	cpudata->buf = buf;
 	cpudata->mode = mode;
 	return 0;
@@ -1062,6 +1059,7 @@ static int arm_trbe_disable(struct coresight_device *csdev)
 	trbe_drain_and_disable_local(cpudata);
 	clr_trbe_status();
 
+	*this_cpu_ptr(drvdata->handle) = NULL;
 	buf->cpudata = NULL;
 	cpudata->buf = NULL;
 	cpudata->mode = CS_MODE_DISABLED;
@@ -1102,16 +1100,12 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
 	trbe_report_wrap_event(handle);
 	perf_aux_output_end(handle, size);
 	event_data = perf_aux_output_begin(handle, event);
-	if (!event_data) {
-		/*
-		 * We are unable to restart the trace collection,
-		 * thus leave the TRBE disabled. The etm-perf driver
-		 * is able to detect this with a disconnected handle
-		 * (handle->event = NULL).
-		 */
-		*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
+	/*
+	 * If trace collection cannot be restarted, leave TRBE disabled.
+	 * The etm-perf driver detects this through handle->event == NULL.
+	 */
+	if (!event_data)
 		return -EINVAL;
-	}
 
 	return __arm_trbe_enable(buf, handle);
 }

-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF07BD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEtAg86Ft3XWDtN6yHCi+WA9JlLgxE1J1SlWKIduR8Y=; b=4N1P9REI/mCfKRnJ6gqmxk8A1G
	4itWyfKLqum5CWmuutzN6gxPDbQl90Vz14TPVLHbe2vA9nUxBccKsP8Qlw7F5pGWgdOwl2OvmxUtD
	Fn9F/FAqS6NE969OUXtApDt3sxaIwHaz+uJrhV3EkqmKm2k+CYdu/slIinlFjoI44/ykqejYKGuhz
	EFBYevq/82Ne5eE2V4TE0vqQE3cvBh6VXM1XLeufsMgnsee7qTGptH05R2adCpjMiFCii+IJ4nopP
	pi1N4fCv9ZpXK7u8e24Y4Hiv2pXHH6IEoXJ1jpKOWuxkh5koMLhVJ01mpoL8GFFkGrwjwirHBhVcV
	lWHzjyvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zL-00000003R8y-1ZaP;
	Mon, 01 Dec 2025 11:22:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zI-00000003R4g-3MMw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00A921595;
	Mon,  1 Dec 2025 03:22:29 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D600E3F59E;
	Mon,  1 Dec 2025 03:22:33 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:22:00 +0000
Subject: [PATCH 10/19] coresight: trbe: Always check fault action when
 updating buffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-10-7da32b076b28@arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>, 
 Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=1745;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=19hsKtZvm/XjHbnhnNNNKO3wE2KHI7/1sDLKvI2Gz50=;
 b=8n4+DTzS10CUKp2NbJ+DyZWEvFEL1+PXV1SpJ3BDr6n+4wRuWUa2C6q2/hZ1eCDj8o28E+q7i
 EPgYQV4HJPCA/CzTRI0GK1JPf7SF2cokf8x2mWVYtalawIGlx/dXa2q
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032236_896409_390FE86C 
X-CRM114-Status: GOOD (  12.17  )
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

The current code checks the fault action only via the IRQ status bit,
which is unreliable due to possible hardware latency.

Move the fault action check out of the IRQ status condition.  This also
causes the buffer size to be calculated for non-WRAP and fault cases,
which is fine since the write pointer is trusted for the calculation.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index f56ecdeaa6596afb440e4d53732e08a85f9bf89d..e579ea98523c24d23a0cd265dcdd0a46b52b52da 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -806,7 +806,6 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
 	enum trbe_fault_action act;
 	unsigned long size, status;
 	unsigned long flags;
-	bool wrap = false;
 
 	WARN_ON(buf->cpudata != cpudata);
 	WARN_ON(cpudata->cpu != smp_processor_id());
@@ -858,21 +857,11 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
 		 */
 		clr_trbe_irq();
 		isb();
-
-		act = trbe_get_fault_act(handle, status);
-		/*
-		 * If this was not due to a WRAP event, we have some
-		 * errors and as such buffer is empty.
-		 */
-		if (act != TRBE_FAULT_ACT_WRAP) {
-			size = 0;
-			goto done;
-		}
-
-		wrap = true;
 	}
 
-	size = trbe_get_trace_size(handle, buf, wrap);
+	act = trbe_get_fault_act(handle, status);
+
+	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
 
 done:
 	local_irq_restore(flags);

-- 
2.34.1



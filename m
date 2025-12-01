Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19FDD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNDn0K4hgMTmPxzfh3PVQKAJG4HjaHLTfupuZJyVYDM=; b=vLO+QkTCLkfsqhOA6sGlOWnMHk
	zFynk1netLnf8MaNCa0j9xZfOBh9uN9zmFrTfpGzGXrOiVpqJclw1bfaXdl6laGEU2Xi1b7v/EjOy
	UdM4ZjmZ/tyrV2SSVNI2XhlX71+bidcBTvE+bEtqNDmGNBam4N+tCeOtYUWrdSJme46fwpum+99hy
	W0SIDLf9L/06PxRxChzhN9ZEqb6EZSJT6vwm4yqS3v/+jEgZspuuyAWFu3SYHriEs35t+2JuqyNBs
	Y6Fn7OmJHFHzeEUo0/gFZkx4n+f5mN2/luvV+HZwT85gtE8RgXeuA5ZURllHjwl9kSNbRNCDS9IHF
	hjaB2ZNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1z7-00000003QtM-0HUg;
	Mon, 01 Dec 2025 11:22:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1z5-00000003Qs0-1rVU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04AC9153B;
	Mon,  1 Dec 2025 03:22:15 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB5B23F59E;
	Mon,  1 Dec 2025 03:22:19 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:21:55 +0000
Subject: [PATCH 05/19] coresight: trbe: Refactor status clearing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-5-7da32b076b28@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=1736;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=lB/NC74zZrDVCqfwFSRLgRpttiHzTgZXwBAD9mmFzVM=;
 b=IeoS+fXPb5TGOyYZgypSVdCG859ipU9WOW5rq3/di9udWyJqYqCiH3YljHwdz/NfPitGMPKfa
 nqSNvOFWDvrCzkIpXQ5osHvR5/dWyClsHnW/Tnr+sdyCr4DvqEBKZBH
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032223_547512_6E4F7581 
X-CRM114-Status: GOOD (  12.53  )
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

If the driver does not clear the status when disabling the trace buffer
unit, stale state will carry over to the next enable, though the driver
clears it again on enable.

Explicitly clear status after the trace is disabled in the interrupt
handling and when a perf session ends.  Keep the status for spurious
interrupts for continuous tracing.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index e426991e2c2c398a9d3982e9d0f7f542e404cbab..9e565122816949b37b8ff5e4ba04cfbc317c6f25 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -629,7 +629,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
 	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
 	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
 	WARN_ON(buf->trbe_write >= buf->trbe_limit);
-	clr_trbe_status();
 	set_trbe_base_pointer(buf->trbe_hw_base);
 	set_trbe_write_pointer(buf->trbe_write);
 
@@ -1036,6 +1035,8 @@ static int arm_trbe_disable(struct coresight_device *csdev)
 		return -EINVAL;
 
 	trbe_drain_and_disable_local(cpudata);
+	clr_trbe_status();
+
 	buf->cpudata = NULL;
 	cpudata->buf = NULL;
 	cpudata->mode = CS_MODE_DISABLED;
@@ -1151,6 +1152,10 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 		return IRQ_NONE;
 
 	act = trbe_get_fault_act(handle, status);
+
+	if (act != TRBE_FAULT_ACT_SPURIOUS)
+		clr_trbe_status();
+
 	switch (act) {
 	case TRBE_FAULT_ACT_WRAP:
 		truncated = !!trbe_handle_overflow(handle);

-- 
2.34.1



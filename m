Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F6CC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mN/7RGS8T4D22Tq3LBBwJsmVTAU6yGCArzWFSNVkfEE=; b=FXOKpskuuhYce5hHY1xd1Jhpwy
	QtIzMYVdu6YtOn87VSCNlY5PMgQK6Pgq3EbPeCThvU0yIIpef/pPsXi+lCOZG2Ua6j5+PFi/8OZ8d
	6TniDIR/47J72hbIyHMUqmOsTaoY/nVIWLJMR0UyKPPkbPNAWMZcMmLHk416r+qyNqokkT5zKo6Kr
	mjKEikQUJIvbMMMHUsvvh90z+VDjF0NY4bPUg48l9pXofVCl4esIX8BNS+6yay9mnuK2enYtXh+gx
	EaA45DXh60jMWK9Ac9GAvbjGQT459N3vuM9fypgb8RvKb11njzoo876kJu15+/JzK3E9RaD3rMyeC
	5N2cdTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPn-00000007I0N-1cb4;
	Tue, 15 Sep 2026 15:49:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPe-00000007Hrb-3VPv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 813841D70;
	Tue, 15 Sep 2026 08:49:34 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B80203F882;
	Tue, 15 Sep 2026 08:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487378; bh=goYiVNAh7k6LrTB80GAwHLKvpuHR7WeoPkl/mqvmd2I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VDu+61nacaNq62c+Y4fyqJUKJh0gegijVuObVTnfmfQcF7eQGvM6tpV/52nb8UUpi
	 ATAWZFQfTn4LYJlaohsrQzEzkAehS1YaKMmdKqv2fcQbPmUOKH18QuHjdAxZyBYknp
	 s2GQ5gKXdM1YxWd/z3F5Yb3eKO2jJPNLuhPhaYug=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:48:59 +0100
Subject: [PATCH 13/25] coresight: trbe: Handle an already disabled sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-13-35cf6f297d20@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=1564;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=goYiVNAh7k6LrTB80GAwHLKvpuHR7WeoPkl/mqvmd2I=;
 b=1WIYqNYiThALBMj8kG5F4TrNuDDUl31UG37XqvGx0yGPWo0Z05JjSFFwCnQfQd+VJeYGU9hDV
 u623GE8RbunDL+u+YzcnNxXZyS96GY9YwNxS7cwu7g+Ga1JkzGy7oTB
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084938_979214_597778AF 
X-CRM114-Status: GOOD (  14.39  )
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

arm_trbe_disable() detaches the trace buffer and clears cpudata->buf. A
subsequent disable dereferences this NULL pointer in the buffer consistency
check before testing whether the sink is still in perf mode.

Check the mode before accessing the buffer and return success when the
sink is already disabled. This allows deferred event cleanup to revisit a
path that an AUX snapshot has already disabled after a failure.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 8eb625d3fc99db57a18e35ef59ef814dacf20a09..6da89a890712d32e87a15f7c564ff4dc4d197bb1 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1098,11 +1098,15 @@ static int arm_trbe_disable(struct coresight_device *csdev)
 	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
 	struct trbe_buf *buf = cpudata->buf;
 
+	/* A failed AUX snapshot may have already disabled the sink. */
+	if (cpudata->mode == CS_MODE_DISABLED)
+		return 0;
+	if (cpudata->mode != CS_MODE_PERF)
+		return -EINVAL;
+
 	WARN_ON(buf->cpudata != cpudata);
 	WARN_ON(cpudata->cpu != smp_processor_id());
 	WARN_ON(cpudata->drvdata != drvdata);
-	if (cpudata->mode != CS_MODE_PERF)
-		return -EINVAL;
 
 	trbe_drain_and_disable_local(cpudata);
 	buf->cpudata = NULL;

-- 
2.34.1



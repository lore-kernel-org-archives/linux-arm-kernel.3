Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCC9D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DuQs7xqHai8GAlsZLLrLi6f+FQ2ozqnmNg5hGuTvaM=; b=g7shbuaK425wLmNgxHTJh8dgd3
	UnNkY8sUyqd1uq8UNr+Y4RiR3nNNRCRqyDHZQVCJEGwpKJDNF6xxRzUNF+/rr+yXsWaGOe33khYqf
	h4tRRhuAvIBspar8DdbDPm7hFjdk4uQJ6E4+HHGXdBqVU4BIUBmNSiAGUoVcly+vzvTVV8Nca4ZCD
	+LDoWtbQimM7WAn2F+CDX4ly4jwkajboPsgqINdEukRKtOqdmxT4cC3XcS7uNcFmLyIERKwslSJhn
	rXQYUAU1z74RECX7TIuomxdziMmA2VkKPhwCoOYZ17ghC8YaPyJkgJaWz2z3ZjW2J/U0GeiktOTft
	40XpwsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zZ-00000003RSz-1CCV;
	Mon, 01 Dec 2025 11:22:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zW-00000003ROm-3Suf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1ADF153B;
	Mon,  1 Dec 2025 03:22:42 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2D583F59E;
	Mon,  1 Dec 2025 03:22:47 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:22:05 +0000
Subject: [PATCH 15/19] coresight: trbe: Add static key for bypassing
 trigger mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-15-7da32b076b28@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=1845;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=f8fiAsWWNi9eG7kzbI25lHuMO+0SEpBi2vesAPCLkBQ=;
 b=siS5jicoBJRIEarVYCG4OsMb2IDUFmciW/1Nkg+AM25TbL8IlrHgAYVJqIIaH1u9S9Qal+dNp
 i8heRWCOmCKDw3rmu9hdz7xMe10PTYu9LJWEPrKBPdbZbxF3IFKX7PQ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032250_926660_1B4D190A 
X-CRM114-Status: GOOD (  12.71  )
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

To avoid complexity, if any CPU in the system has the fill mode erratum,
the driver will not use trigger mode, it simply rolls back to fill mode
only and apply the workaround on it.

Add a static key to control trigger mode bypassing.  During each CPU
probe, the key is enabled when the relevant erratum is detected.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 941aa46e9b11f60c707eb40093964de454a3fd83..8390d0a8fe23d35945610df15f21751279ee37ee 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -17,6 +17,7 @@
 
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
+#include <linux/jump_label.h>
 #include <linux/kvm_host.h>
 #include <linux/vmalloc.h>
 
@@ -147,6 +148,12 @@ struct trbe_drvdata {
 	struct platform_device *pdev;
 };
 
+DEFINE_STATIC_KEY_FALSE(trbe_trigger_mode_bypass);
+
+#define trbe_trigger_mode_need_bypass(cpudata)		\
+	(trbe_may_overwrite_in_fill_mode((cpudata)) ||	\
+	 trbe_may_write_out_of_range((cpudata)))
+
 static void trbe_check_errata(struct trbe_cpudata *cpudata)
 {
 	int i;
@@ -1306,6 +1313,14 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
 
 	dev_set_drvdata(&trbe_csdev->dev, cpudata);
 	coresight_set_percpu_sink(cpu, trbe_csdev);
+
+	/*
+	 * If any CPU cannot use trigger mode, bypass the mode globally for
+	 * consistent tracing behaviour.
+	 */
+	if (trbe_trigger_mode_need_bypass(cpudata))
+		static_branch_enable(&trbe_trigger_mode_bypass);
+
 	return;
 cpu_clear:
 	cpumask_clear_cpu(cpu, &drvdata->supported_cpus);

-- 
2.34.1



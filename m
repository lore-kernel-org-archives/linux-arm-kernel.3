Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8448CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3S0tT4y8CKe4q86fkRXB29qxDrT+lYfYaHou/Uummk=; b=KtjejDIUxba45nPuWYLotRnut+
	QfQKn3nFBfIi+B9SkOPtRwm1K9kdNMydAVngiupet2yeW3kFsaRjprV5uQ89016tGiKzDjmpmD+fR
	Zj3yPTxpedcv1S9LFOCNAkW07y4EMl/4eaUFDm2ggjMRwp/1as5+qtpIfyaKxDbCfzEe3bdVorJfl
	/R0F2aR+ge6yCu75llAj7R9qJjlXeaHz1UIj87x6xSHWPRgItiTT8tzEzo69onklXY5viRXBtI5qX
	NXIpY2gjAkjlxVMsLMR/W3fbQBBZg4fKA285v1RSC+QaDfB+mBoO534NgECYsLyq7biv3hX9IEWjo
	PTphqw1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDH-00000003Thd-2tmV;
	Fri, 16 Oct 2026 16:55:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDA-00000003TeB-3XEF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6784B1691;
	Fri, 16 Oct 2026 09:55:12 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2017D3F7B4;
	Fri, 16 Oct 2026 09:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169715; bh=9Vg1KwTsPnGP0rd+0YO3fvy/Cq8edx+YmEonMySYO+s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EgI7HuLZsApO3MM+ecCNknPLh3fTuUxWvXtIM5632PMu3WaATDGrN3B+V6xTs4rmE
	 6aqo7qsv8R66caTjDSxpyu34cz3zCj7Jf+h7WYgCcNGfKw/l0yHchMSlxmYjHZ202o
	 zH+eKlzy9cH96ysyjq8m72T5yQK1kZEabAp2PoZg=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:00 +0100
Subject: [PATCH v2 02/23] coresight: trbe: Make watermark range check
 overflow safe in __trbe_normal_offset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-2-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1341;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=9Vg1KwTsPnGP0rd+0YO3fvy/Cq8edx+YmEonMySYO+s=;
 b=MZyhAr29SMEIn2620PIxOjTVLznCFoBunZS90a3WNKuIUkGrCJXlnqPQc4rh+6xwwme9Tir1M
 u7ESq1hhX3VA/7RpczwEgM1o3WF/tuEvnJijQUO6mB1+Fum+YlGPtPT
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095516_927203_E266CC66 
X-CRM114-Status: GOOD (  11.53  )
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

The current code checks whether the wakeup point lies before the current
tail by comparing against handle->head + handle->size. That addition can
overflow when the monotonically increasing perf AUX head is close to
ULONG_MAX, causing a valid wakeup point in the current writable range to
be missed.

Use unsigned subtraction to compare the distance from head to wakeup
against the buffer size instead. This keeps the check correct across
potential wrap.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index eca8e13a97447b46a4b383049aacb3fa7ad3c329..02d12445763a86d58c79bdf5143f761827456bc3 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -526,7 +526,7 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 	 * +----|---------------|-------|-------+
 	 * trbe_base		limit		trbe_base + nr_pages
 	 */
-	if (handle->wakeup < (handle->head + handle->size) && head <= wakeup)
+	if ((handle->wakeup - handle->head) < handle->size && head <= wakeup)
 		limit = min(limit, round_up(wakeup, PAGE_SIZE));
 
 	/*

-- 
2.34.1



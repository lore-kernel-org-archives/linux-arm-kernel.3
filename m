Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90C8CCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7C5XCknT24grCMl5hYL97m60TRY7ENbsiIvxQN7uLeY=; b=kirVgPW/LEpQVMrUbhLSKsw6PW
	Ut5UyoUWdDAOUCze3Qe1zJNkqLQ8pbkcPBRN0nk2qZD7Upw6D3c8jPYjqlb9aVhDx7wOmlmwf0QTV
	JkP/xpYPK1U2GoLnC4bW45kZxsqdxgOK52pdaJjSbQ8xHX6+F/bbqUO4WkNz5WEGjaFsq26EyJMsq
	O6YJysC2/AwN5lLkBbGJx4IkrgKN8Zv+PHWymGx3DjFYwBVLU4ohkDo/bp9meZymHkHN+bByEu0fm
	wvxnDjjcHBk3U4yl9iVvTRrhlbpXEnBJPS0wjTHWFjHvGD1INm9H/94HJh5oFzfvpOUoPXdLfELlf
	oMDongPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDI-00000003TiQ-0Dta;
	Fri, 16 Oct 2026 16:55:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDE-00000003Tfz-15xX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14E9D1477;
	Fri, 16 Oct 2026 09:55:16 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C40933F7B4;
	Fri, 16 Oct 2026 09:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169719; bh=BQnVzx45dLwktCWppCQITl2/9OmBRkvh1ThhzFT93O0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MN7Yxs8+MvNwV9LH6ztqB5TqK2dPaw/993Q+acsgtKYMlIy6qusDbZ6iIBYGgPlm9
	 8xUZTdPdKfXLY1DMnyqCIl1lS0uO/0VKRmrS1SoBayZyXiyzy+xoiPAiNCWN/584UC
	 KLMVciWr8Dt9EgMisZ2bISkv1C8A7Urd5CimOqXk=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:02 +0100
Subject: [PATCH v2 04/23] coresight: trbe: Check the buffer association
 before IRQ validation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-4-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1534;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=BQnVzx45dLwktCWppCQITl2/9OmBRkvh1ThhzFT93O0=;
 b=59eZUh7H+BmqdJco1rMWNKh0LUP5VH2FLq6f5rtq0E0JBoPE/c0V86QEeHBOek+EzKXMuuj7k
 VtsCXQUuembDslgdY4xavgJybWW1ABVOF6DA//LMWklaD2HVXHjMkv0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095520_346581_A0A38ECF 
X-CRM114-Status: GOOD (  11.18  )
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

is_perf_trbe() obtains the sink buffer from the output handle and
dereferences buf->cpudata before validating either pointer. A live AUX
transaction does not guarantee that the selected buffer has a CPU
association.

Reject a missing buffer or CPU association before reading CPU driver
data or checking the hardware buffer addresses. Treat these configurations
as an invalid perf TRBE session.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 8ec0b4c4987f25d10ee0b2f80c27e10f76357387..91fbdbad3676ffae399df0b4d4ddcd603a40e86c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1111,10 +1111,16 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
 static bool is_perf_trbe(struct perf_output_handle *handle)
 {
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
-	struct trbe_cpudata *cpudata = buf->cpudata;
-	struct trbe_drvdata *drvdata = cpudata->drvdata;
+	struct trbe_cpudata *cpudata;
+	struct trbe_drvdata *drvdata;
 	int cpu = smp_processor_id();
 
+	if (!buf || !buf->cpudata)
+		return false;
+
+	cpudata = buf->cpudata;
+	drvdata = cpudata->drvdata;
+
 	WARN_ON(buf->trbe_hw_base != get_trbe_base_pointer());
 	WARN_ON(buf->trbe_limit != get_trbe_limit_pointer());
 

-- 
2.34.1



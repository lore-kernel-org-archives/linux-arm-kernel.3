Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967D1CCF2C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTF7Xye8x0nAemdYBYS94FNR44XfZ1OncEvYyh52AS0=; b=WToAoSjNQYUZPML6Ygv6jwIny6
	QWpqGxRFMRJJ3LLMRvQZT198Y5BNgUR/wm0VKFjYvDi4IlFQItr/83dg5EPmg+mX7dbCI2BIzVM2d
	QZlIAuxRgVMf9/wdZixGvHSy9rU6aywWcahtJZGsI5G9++DVfoZjRXwB8eq1woqtsCyf5AxX7tco4
	RhVjx4CbStoHnuPMxJumkZi1zjqOmiIqG1qhDJtIb0/EcN1TuOUTjkXAq7b6fmWk2vt7chkPS3558
	byrTOFRSX4M2MSiqe+iyYjoyd6s8Vq5yhGhzOTbMzYpk5+R67AYoSLWTM/snyG/Lokj606UKVoqAT
	iAUZmmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlE0-00000003URU-186e;
	Fri, 16 Oct 2026 16:56:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDh-00000003U9s-33My
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 731CD1691;
	Fri, 16 Oct 2026 09:55:45 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DA293F7B4;
	Fri, 16 Oct 2026 09:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169748; bh=GQRU9DFvAxcogjfhIENbBt6INOxd1HytQUmpWyWEfRE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bEM8qECskA4mbmm+3PxnZ7rrV8bNyLdf/0L5uUfgn93fEdpUixwvYjklB9qLZuad8
	 fxazEPugZ5NPUKKK5jxXFTW6KfGrOk7caEcEsPek5LEaYtvl95l8b/m2EGlTEigvoN
	 VwXc8doira51QgRChYgmiwc5cklzJLiLgfjcLshg=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:18 +0100
Subject: [PATCH v2 20/23] coresight: trbe: Add fault action argument to
 trbe_handle_overflow()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-20-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1741;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=GQRU9DFvAxcogjfhIENbBt6INOxd1HytQUmpWyWEfRE=;
 b=GRFWx5MtpRGZ6KTGxd6mRZGFkmMpkY23N0YTyZHahDGJnGJtTyN2XyZuxMQlO9UGo+M8YQOuH
 uS8KEHffl16ABa39VbAKDsEUeIEowkjGLck7OM8cMMnj2FvZOwWfbrR
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095549_823972_55773C9B 
X-CRM114-Status: GOOD (  10.80  )
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

Add a new argument to trbe_handle_overflow() for the fault action, which
is used to compare the wrap event for trace size calculation.

No functional change intended; this is preparation for a later update.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index f1f102df6c387f53feaa12b89d3df89f734afcdb..c83c440d4ac13c346bc2a7f9093951c186c90157 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1132,7 +1132,8 @@ static void trbe_handle_spurious(struct trbe_cpudata *cpudata)
 	set_trbe_enabled(cpudata, trblimitr);
 }
 
-static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
+static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
+				enum trbe_fault_action act)
 {
 	struct perf_output_handle *handle = cpudata->handle;
 	struct perf_event *event = handle->event;
@@ -1147,7 +1148,7 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
 	 */
 	clr_trbe_status();
 
-	size = trbe_get_trace_size(handle, buf, true);
+	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
 	if (buf->snapshot)
 		handle->head += size;
 
@@ -1253,7 +1254,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	act = trbe_get_fault_act(handle, status);
 	switch (act) {
 	case TRBE_FAULT_ACT_WRAP:
-		truncated = !!trbe_handle_overflow(cpudata);
+		truncated = !!trbe_handle_overflow(cpudata, act);
 		break;
 	case TRBE_FAULT_ACT_SPURIOUS:
 		trbe_handle_spurious(cpudata);

-- 
2.34.1



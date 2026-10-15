Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75704CC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCOhz3Wt0IBSuhz9trpFOD+pDHm76mOA/Vo1u0No8Wc=; b=HD0ezEmDRqYDQZGXSJLmcvF+OL
	V+xI92phlxfqIbcjvBchmSv/Cnr28VrLChgVk0dCWNn4T+6JZq+tLpBAGw1Xjqw25L2gQofY7i7Md
	fv+nQpZSqwX+l0Poy5J5KC9QO5+Vz+7HtSXP7C2Q2lK2mz3t6LRReem214RENoKYxj+YrfwjKoWqP
	NZHwtVAI4MwFD2NkSsMVqrUDeYW2M039jkmHkuYEezASIhDQDXd9JLO6xbraObV/vLEiqLVGUg8oU
	l0QkePl1m3oqrNsaDFzxv1Cde3hm4+JA7udCnJEtRqua501O3M3UyWuHUSD6SsAflPHacIqwzxOc5
	FYp36rog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNkh-00000000ccG-0kr3;
	Thu, 15 Oct 2026 15:52:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNkc-00000000cay-11Fa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 15:52:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50D2C1576;
	Thu, 15 Oct 2026 08:52:09 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EB783F7B4;
	Thu, 15 Oct 2026 08:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792079532; bh=UsCucnKFbKHlnk/F6TLrWSk1K2rkrN5p17L2rucxR3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WhjEwxub1G+PVPhg1zi/d1OtUzMMy7qscvqNVR6KMwWueipE8B4+N/UmcaYhPoHIa
	 00tnBxL3UkhC1lQ6gcVZiXbD6bSiV5pHMpTUg2HeSmXEJsXFYl7LyzuFwujos+6wJu
	 fquc4F0tqJzlRm7OP4hEeEd3Am872iuCs0q6gtUg=
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 15 Oct 2026 16:51:59 +0100
Subject: [PATCH 2/2] coresight: trbe: Order padding before publishing AUX
 head
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-add_barriers_for_perf_aux_output_skip-v1-2-5847d0578859@arm.com>
References: <20261015-add_barriers_for_perf_aux_output_skip-v1-0-5847d0578859@arm.com>
In-Reply-To: <20261015-add_barriers_for_perf_aux_output_skip-v1-0-5847d0578859@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792079527; l=1351;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=UsCucnKFbKHlnk/F6TLrWSk1K2rkrN5p17L2rucxR3s=;
 b=gsloEepkVMtNNVQxOuyaX8g3lCODtKFXXcVigyk6awxiHlk2ZhtSAsvT3+ZV2vqvTxD88hV7d
 UrzDuPHy3rHCNDzJ9dbwX3PuXAN87mSg/TXtPdKHCOhEJqZG+jzmiTL
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_085216_096203_4AEEAEAF 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

TRBE fills gaps in the AUX buffer before advancing aux_head. Neither
perf_aux_output_skip() nor perf_aux_output_end() guarantees ordering of
these CPU stores before publishing the new head.

Add smp_wmb() after memset() in __trbe_pad_buf(). This covers alignment
padding published by perf_aux_output_skip() and the overwrite erratum
padding written by trbe_get_trace_size() before perf_aux_output_end().

Fixes: 3fbf7f011f24 ("coresight: sink: Add TRBE driver")
Assisted-by: LLM
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index c7cbca45f2debd4047b93283ea9fe5dd9e1f2ebf..b605121b1dcfed9837c15cd92ff4c42515f39eaf 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -362,6 +362,8 @@ static void trbe_stop_and_truncate_event(struct perf_output_handle *handle)
 static void __trbe_pad_buf(struct trbe_buf *buf, u64 offset, int len)
 {
 	memset((void *)buf->trbe_base + offset, ETE_IGNORE_PACKET, len);
+	/* Order the padding stores before publishing the new aux_head. */
+	smp_wmb();
 }
 
 static void trbe_pad_buf(struct perf_output_handle *handle, int len)

-- 
2.34.1



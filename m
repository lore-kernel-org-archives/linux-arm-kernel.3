Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B47D339A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aaLNCMNaFimB0K/xunkdj1iuQaXv9EHXa7EW+W6gvF8=; b=35tSurCcS80AJW8ucQQ+UXL9vG
	agk1u+MerOAeUHX86H7AqOlFk95dwN3eOJF8SYgT1j/QuVXkTdShHzab8NEwfiaPeq3Uzdl3VcgXM
	xtf6z6/7pWFrEiUMWL4DWLOpXh9Vw2cVc8ThLH0sjaQZDDNXGYtvisq0jqz9ygpYbRkS50REWFPRk
	VcAOwp3uK9jmvYUExo7AEJcsLf8ZI4u0O51HMsy5yQT6l4wQbsOx5Gq4OsacuvcKB1AzT0NMzrTQL
	JHl8YD6OGLoZKZKFQv7GauvgKiD8QpHTZ6Nrfy0U1tZGAWkwXJ3RqYDtbzyw3EA3j2FJOMJ0XBNVA
	5lGyKPZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TK7-0000000Bcu0-02dB;
	Mon, 28 Oct 2024 17:14:35 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TEP-0000000Bc4j-2yeX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aaLNCMNaFimB0K/xunkdj1iuQaXv9EHXa7EW+W6gvF8=;
  b=jsX2pJ3M0tK/FweOBSR4BNUwvFvboZYyqlnhH1WjZitDMT2BAabtksrQ
   2FgOjQenmOl5ly7+k2NpNy0euTVjTCZmzAfikx32zpYeyk/bs6Lmxm4zI
   VLKLovGX3hCYTtF2+MZbH4cO6sicAeyvyqWpu/JzrKA2N7+2BBNYSxAK3
   A=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,239,1725314400"; 
   d="scan'208";a="191112265"
Received: from dt-aponte.paris.inria.fr (HELO keisuke-XPS-13-7390.tailde312.ts.net) ([128.93.67.66])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 18:08:26 +0100
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
To: Vinod Koul <vkoul@kernel.org>,
	Sinan Kaya <okaya@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>
Subject: [PATCH] qcom_hidma: fix memory leak of kfifo
Date: Mon, 28 Oct 2024 18:06:19 +0100
Message-Id: <20241028170618.203023-1-keisuke.nishimura@inria.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_100842_143032_709F663B 
X-CRM114-Status: GOOD (  11.24  )
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

The memory region allocated by kfifo_alloc() should be freed using
kfifo_free(). There are two possible cases that could result in a memory
leak:
- When hidma_ll_setup() fails, the initialization does not complete.
- hidma_ll_init() succeeds and the lldev is then uninitialized.

Fixes: d1615ca2e085 ("dmaengine: qcom_hidma: implement lower level hardware interface")
Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
---
 drivers/dma/qcom/hidma_ll.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/hidma_ll.c b/drivers/dma/qcom/hidma_ll.c
index 53244e0e34a3..6da611c61f8c 100644
--- a/drivers/dma/qcom/hidma_ll.c
+++ b/drivers/dma/qcom/hidma_ll.c
@@ -788,8 +788,10 @@ struct hidma_lldev *hidma_ll_init(struct device *dev, u32 nr_tres,
 		return NULL;
 
 	rc = hidma_ll_setup(lldev);
-	if (rc)
+	if (rc) {
+		kfifo_free(&lldev->handoff_fifo);
 		return NULL;
+	}
 
 	spin_lock_init(&lldev->lock);
 	tasklet_setup(&lldev->task, hidma_ll_tre_complete);
@@ -812,6 +814,7 @@ int hidma_ll_uninit(struct hidma_lldev *lldev)
 
 	lldev->initialized = 0;
 
+	kfifo_free(&lldev->handoff_fifo);
 	required_bytes = sizeof(struct hidma_tre) * lldev->nr_tres;
 	tasklet_kill(&lldev->task);
 	memset(lldev->trepool, 0, required_bytes);
-- 
2.34.1



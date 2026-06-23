Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C774CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lhYDY/oGh1x20M8STDeHhSgFj7e0F2TfJzpcUG3q/j8=; b=kgTkFbzjfPEiESvgucurfpbAjb
	xyDBIYt6oigNItcjhUWsiA7IEKNHYI4UVHwgVauNHMnj5j/vxJLqjf2dUOfIUQkKkK3MkVfdjFsXD
	IOkXBviH73YfUet/Yy2JwbDsU6//lkZl0wx8KhKJFSNkN/Qg7vG6+r4/bSI8jhX/INtYId2dusc1T
	g26/IdfCpVEsslwaAvAZ4w5uQtr4rxGBKl4LI7sHS90h5eQtKmbdmzNzyFoxJBoe7URETx+F86+qY
	RfxLiN+C8W7Zxa8eI74vpcXAoaRdvCqtTLnzGb+wfHZdjPwT+3aNjq8iBIcr6ttKw1yu2MKWwXqJE
	mbBfcFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1LU-00000006LnN-170Z;
	Tue, 23 Jun 2026 13:39:20 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1LR-00000006Ln1-3iS8;
	Tue, 23 Jun 2026 13:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lh
	YDY/oGh1x20M8STDeHhSgFj7e0F2TfJzpcUG3q/j8=; b=cA2ZtEN36qzmUHUBYS
	rgGGDT+6icfpsvztBXkCTVfmpSQPsTFZkLcHNWgFfqPM56nn6I4cUhxRq7kPgjVE
	f34ZiBu9nd7LVRi/izIGo/qh+Po0iqdl3VJfXJHCg2D1gZkTutVnYVmvqFCzlkz/
	bZUuNyduUDJBgXIaQIU/JnMmM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3H5FkjDpqLOjlFQ--.48199S2;
	Tue, 23 Jun 2026 21:38:46 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	olivia.wen@mediatek.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] remoteproc: mediatek: Unregister init IPI on share buffer failure
Date: Tue, 23 Jun 2026 21:38:44 +0800
Message-Id: <20260623133844.2255072-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H5FkjDpqLOjlFQ--.48199S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr4rCryUCryUXF1xtFW5ZFb_yoW8XF13pa
	43Kay3Kr48KFsrXrsrC3W8Z3W3ua18G3y29w4fJwnFvw1UJr92qas5tFyjvFWDCFWxXFW3
	ZFWaqrWruFWUCaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piMGQDUUUUU=
X-Originating-IP: [240e:604:311:e68d:298a:1bbc:177b:53c8]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7gZl02o6jGbYUgAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_063918_332998_04655EB1 
X-CRM114-Status: UNSURE (   9.73  )
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

scp_rproc_init() registers the SCP init IPI before allocating the IPI
share buffer. If the share buffer allocation fails, the error path jumps
directly to release_dev_mem and leaves the init IPI registered.

Route that error path through the IPI unregister label so the registered
handler is cleared before unwinding the remaining resources.

Fixes: c08a82494500 ("remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/remoteproc/mtk_scp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 85a74c9ec521..648b69f96624 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1227,7 +1227,7 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 	if (!scp->share_buf) {
 		dev_err(dev, "Failed to allocate IPI share buffer\n");
 		ret = -ENOMEM;
-		goto release_dev_mem;
+		goto unregister_ipi;
 	}
 
 	init_waitqueue_head(&scp->run.wq);
@@ -1248,9 +1248,10 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 
 remove_subdev:
 	scp_remove_rpmsg_subdev(scp);
-	scp_ipi_unregister(scp, SCP_IPI_INIT);
 	kfree(scp->share_buf);
 	scp->share_buf = NULL;
+unregister_ipi:
+	scp_ipi_unregister(scp, SCP_IPI_INIT);
 release_dev_mem:
 	scp_unmap_memory_region(scp);
 	for (i = 0; i < SCP_IPI_MAX; i++)
-- 
2.25.1



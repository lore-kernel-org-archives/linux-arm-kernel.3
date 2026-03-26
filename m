Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BF9106F30C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sBZvrl17LJVgndfRmNLh3jn7Ox1aE5BRM1rxx8ZuhU4=; b=rkxLk9lWZJhFtqsz8hLc1+a1W6
	vqzLluiE4q+bTwbzn6yo9dB/KMVYrihXy+baIYFClHtAoPplo685XYw81ONp5AOBwipG7gGnz8kiC
	3BTVC4dsDcLWGfemmCV+MUdTH56icANbAjSnx5rC67LKhxffmIu3e0wNiycmtv99Tt/VJ1syj3c+o
	P7itXB7WtrIFNmV/TKVK7VSf3MP78SnMycbRnoIn+wZoRto58/kILY/zvfcjcigu8x7YJ1o5ZvfFq
	EAfX1zSv/1+hWYhuk0fleha0P2PqOBr2HqdrBKhvGcNiES941BxqEro5FDrBMgJRXaoxRsCql9JnX
	P6dIkN9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gjC-000000057HQ-38yo;
	Thu, 26 Mar 2026 09:10:10 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gj8-000000057Gz-31u4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:10:09 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowACXQW3m98Rp5tI6Cw--.4094S2;
	Thu, 26 Mar 2026 17:09:58 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: will@kernel.org
Cc: robin.murphy@arm.com,
	mark.rutland@arm.com,
	ilkka@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] perf/arm-cmn: Fix incorrect error check for devm_ioremap()
Date: Thu, 26 Mar 2026 17:08:56 +0800
Message-Id: <20260326090856.644136-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACXQW3m98Rp5tI6Cw--.4094S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF4ruFWrXF17Xry5ZFyDtrb_yoWDXrX_Cr
	4fuFnxCFykCF1qvr13Gw1rZ34Syr1v9FWxXFs8KasxZw4UJw17WrW7Z3s3Zr4xuw4rJr1q
	gryUAFySvr4xGjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
	ZEXa7VUj9a93UUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_021007_124369_E0CD196A 
X-CRM114-Status: UNSURE (   9.92  )
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

Check devm_ioremap() return value for NULL instead of ERR_PTR and return
-ENOMEM on failure. devm_ioremap() never returns ERR_PTR, using IS_ERR()
skips the error path and may cause a NULL pointer dereference.

Fixes: 5394396ff548 ("perf/arm-cmn: Stop claiming entire iomem region")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/perf/arm-cmn.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 1ac91cda6780..9fe00d0f4deb 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2573,8 +2573,8 @@ static int arm_cmn_probe(struct platform_device *pdev)
 
 	/* Map the whole region now, claim the DTCs once we've found them */
 	cmn->base = devm_ioremap(cmn->dev, cfg->start, resource_size(cfg));
-	if (IS_ERR(cmn->base))
-		return PTR_ERR(cmn->base);
+	if (!cmn->base)
+		return -ENOMEM;
 
 	rootnode = arm_cmn_get_root(cmn, cfg);
 	if (rootnode < 0)
-- 
2.25.1



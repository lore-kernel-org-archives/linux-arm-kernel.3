Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493C8EF06EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 02:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=++iN1TV5Opch23pgRphWkKkE4kuONCUY4uzUgTOLNLM=; b=XeQUtpGgGXs5wbJdtFQ0cuGQfL
	oNB/Ej29CJ9Zq+VydAmba9SX+nTUKApMcSXFZpIhKwAtybsJfff94+r6Mk36bYBySd2cDrMXIUXZH
	wFOsHOAj5FZzby/lHfN3qRH9drJGICtiSjfrlOknxjqt4GjLs28xrR6bV+cb3p9FNrUo+4Em/r4Kn
	eTDM/9uctAQPEqGa8FB9+Z28ZoQ0G2exrk8Q3d/KZZ1Q8tPHOqFD+HKBIHUtGziDpTEljWXwzmSCb
	HI37/8N6QdZVBwj4iXd2Xw4qULUYEpFgeanaRauFl1s95thXiKTLFOhDsff1e10oc4f2fMA3SstHZ
	TO8zQ7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpGZ2-0000000Efp4-3GcV;
	Mon, 09 Feb 2026 01:59:48 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpGYy-0000000EfoC-3vh4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 01:59:47 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowADHVQmLP4lpCfXYBw--.38725S2;
	Mon, 09 Feb 2026 09:59:39 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: herve.codina@bootlin.com,
	qiang.zhao@nxp.com,
	chleroy@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] soc: fsl: cpm1: qmc: Fix error check for devm_ioremap_resource() in qmc_qe_init_resources()
Date: Mon,  9 Feb 2026 09:59:04 +0800
Message-Id: <20260209015904.871269-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADHVQmLP4lpCfXYBw--.38725S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyUtw1DGw43uF4fZr1DKFg_yoWDArX_Gw
	4UtF13Xry8WFyayFW5Kw45Zry093ZFgw4xG3yrta4rA3yUJw4xA3y5Zr93Xa1rXa18AF9r
	KrWUAFWYvw13ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
	ZEXa7VUbaLvtUUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_175945_341321_8CD4696A 
X-CRM114-Status: GOOD (  10.30  )
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

Fix wrong variable used for error checking after devm_ioremap_resource()
call. The function checks qmc->scc_pram instead of qmc->dpram, which
could lead to incorrect error handling.

Fixes: eb680d563089 ("soc: fsl: cpm1: qmc: Add support for QUICC Engine (QE) implementation")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/soc/fsl/qe/qmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index c4587b32a59b..672adff8e35f 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1790,8 +1790,8 @@ static int qmc_qe_init_resources(struct qmc *qmc, struct platform_device *pdev)
 		return -EINVAL;
 	qmc->dpram_offset = res->start - qe_muram_dma(qe_muram_addr(0));
 	qmc->dpram = devm_ioremap_resource(qmc->dev, res);
-	if (IS_ERR(qmc->scc_pram))
-		return PTR_ERR(qmc->scc_pram);
+	if (IS_ERR(qmc->dpram))
+		return PTR_ERR(qmc->dpram);
 
 	return 0;
 }
-- 
2.25.1



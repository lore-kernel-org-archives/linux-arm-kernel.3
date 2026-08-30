Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CDEC61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PPviRxULCR9XobqSlLuAjKkYCfW9qjkKvl+5jP1S4pg=; b=v8CLADZaIs60sR409FkAEoi+NG
	qzxJTA7obrqUwcRAoevAXpkT+UmCwFin0CBUbtFcahaPWkkTvkNuZhKxqxBn4m+3qfgtY+drTYesi
	PY3Q3qqApvQ2CglDWI7jUPYkRkphWNaQUZK3ji1LZRB/572lIhRbg5QbWsFXXDnpUit69XH37usRJ
	euDplRMi9OPv1tFQ2eTGN3yCJWtxeVnlbJwbiuixoiidQrgwqtV/iRz9+noDTxzl5LL9frSMsIb0W
	0oJlJjGLFK7n8Se5gBgRBiOkEpLdS5tS4IRsjT12XvMxhN9pdDlB235q7gclamf5X77a6B3MeD4W9
	qfcgVzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fLJ-00000007k4I-2jAA;
	Sun, 30 Aug 2026 13:13:01 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fLG-00000007k3d-13za
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 13:12:59 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowABXXDpXLJRqpeeaBg--.33442S2;
	Sun, 30 Aug 2026 21:12:55 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Olivia Mackall <olivia@selenic.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-crypto@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwrng: imx-rngc: propagate clock enable errors
Date: Sun, 30 Aug 2026 21:12:53 +0800
Message-ID: <20260830131253.2718-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABXXDpXLJRqpeeaBg--.33442S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zry8tF45AF47JrWkWF47twb_yoW8GFy7pF
	W5G3yF9r4DXrWUtFWDJFWxJ3ZYkw43CFWxK3y5Ka4xZFn5AF97tFySyFyvqF45ZFW0yF1a
	qF4rJFykCas0vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r
	4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
	IYCTnIWIevJa73UjIFyTuYvjfU5dgADUUUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_061258_671689_78CF88A1 
X-CRM114-Status: GOOD (  12.09  )
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

imx_rngc_probe() reads hardware registers after enabling its clock without
checking the result, and the runtime resume callback always reports success
after the same unchecked operation.

Propagate clock-enable errors before accessing the RNG and to the
runtime-PM
core on resume.

Fixes: 1d5449445bd0 ("hwrng: mx-rngc - add a driver for Freescale RNGC")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/char/hw_random/imx-rngc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
index 7693328f10564..00a21d62c79c3 100644
--- a/drivers/char/hw_random/imx-rngc.c
+++ b/drivers/char/hw_random/imx-rngc.c
@@ -266,7 +266,9 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	clk_prepare_enable(rngc->clk);
+	ret = clk_prepare_enable(rngc->clk);
+	if (ret)
+		return ret;
 
 	ver_id = readl(rngc->base + RNGC_VER_ID);
 	rng_type = FIELD_GET(RNG_TYPE, ver_id);
@@ -338,9 +340,7 @@ static int imx_rngc_resume(struct device *dev)
 {
 	struct imx_rngc *rngc = dev_get_drvdata(dev);
 
-	clk_prepare_enable(rngc->clk);
-
-	return 0;
+	return clk_prepare_enable(rngc->clk);
 }
 
 static const struct dev_pm_ops imx_rngc_pm_ops = {

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1



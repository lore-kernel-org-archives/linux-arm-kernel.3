Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58812D2C11B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 14:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QA9Z6DlABQAh/zHFAwCMIMgA9gtG670bOQgehg6enAk=; b=y/PeSm2TGp0jaZfCuldw05eJRD
	C0Un0ntrwsTCx5X6lJvXuGNef84bCJbaOznfqGEmcbliTtYb25oP3cAJC1tV5Yry3JCZ4pg/RboOS
	jUFYKXgtm3LzG18pugG67stVQLt0gMg/cxvLGAgLbRmPY4VND9TGwlbR1J1BfsUCTDRdb3Oeqfw7z
	0h5X2kuiuo2UGG5X5oNm8bMvIebLRBgxbl6JnOsYUu1JKBoO8Zd/sOWAtnA9lStADmq8PSLsisFs/
	ajjXF9IxdEEDE2Q/3XElUM0I9KnDomtbH33QWxVbwQ9L2s/d4dpMysJEZ+RotjU6ssxjevjhJg/Sb
	Y7lMcbkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8L17-0000000HM3m-1xuG;
	Tue, 05 Nov 2024 14:58:49 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8KzK-0000000HLZE-3F80
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 14:57:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 200CE40010;
	Tue,  5 Nov 2024 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730818609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QA9Z6DlABQAh/zHFAwCMIMgA9gtG670bOQgehg6enAk=;
	b=KWaTZyu3vLcDyz9FWyowSmBHC3XiZrmKJULGPtt9hzaqj0+xJODq0QR1ihReN61VqnwxCk
	cyoakzjNknp34vXM3mBZCHBYo0gmRejGd4PWdqrQoDSwYqgeQGazh5ofxOpKDGc6x7zm8X
	kSgyKuZ0UDNSmVFqo+CFEGNa+MY+IsX8tKInCVCBVJh6Y73IoUTL2hHCZUv5yZeg+3gDmY
	CP5ktynlkskg3ruNt8nCELLrlhibV7PF6UGal945LwEqulLbG5vGsWom8qQx5vINJf/c9s
	QAXF8i1kCKMsokbKbWKwXiIEQqqY6emQ3dSvWkcVoiJ0juZ/S7e689/sACCY+g==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mark Brown <broonie@kernel.org>,
	Li Yang <leoyang.li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] soc: fsl: cpm1: qmc: Set the ret error code on platform_get_irq() failure
Date: Tue,  5 Nov 2024 15:56:23 +0100
Message-ID: <20241105145623.401528-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_065659_229891_4F9A5958 
X-CRM114-Status: GOOD (  13.73  )
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

A kernel test robot detected a missing error code:
   qmc.c:1942 qmc_probe() warn: missing error code 'ret'

Indeed, the error returned by platform_get_irq() is checked and the
operation is aborted in case of failure but the ret error code is
not set in that case.

Set the ret error code.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202411051350.KNy6ZIWA-lkp@intel.com/
Fixes: 3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 19cc581b06d0..b3f773e135fd 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -2004,8 +2004,10 @@ static int qmc_probe(struct platform_device *pdev)
 
 	/* Set the irq handler */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
+	if (irq < 0) {
+		ret = irq;
 		goto err_exit_xcc;
+	}
 	ret = devm_request_irq(qmc->dev, irq, qmc_irq_handler, 0, "qmc", qmc);
 	if (ret < 0)
 		goto err_exit_xcc;
-- 
2.46.2



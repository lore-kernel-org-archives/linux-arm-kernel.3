Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081E1C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u56UvOMtNFwTEkpB4tij+Y0DkppGFXqA7XZx7fKlDwA=; b=MAp/xc7GSscNT5XkiPqPzB4b/r
	O323mNH04RVjGHOMW28opauXbgLDknr8L50QaA+8WMLfak67BJsFFc0Or7jaJzxbOevQwvZSN+hbS
	/CoKLEzfysbRl8PR3tnOJFzMWe6qSCH9Bps0NCOlAPN9UQ+wopxQkMt6i8IRfs5fW6guU00fBlLzQ
	ZTsdEZNbsOAKgPcpzagX4oCLW5QJxNFdNi29+AvbF78gmdfeHncbVjogycqvVAZDgq6pnJqSXYiJI
	Sp/gJVgmk/PnKrM0hvlmouT7iGn7c4oqyloEz/qYh6uE3p+9JE0U7oMJWWcrYLw3e2QCvOH5xEi8I
	KBz7taiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jgY-00000001fjt-1K2F;
	Sun, 13 Sep 2026 12:51:54 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jgV-00000001fj8-1I0i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 12:51:53 +0000
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d907a3de;
	Sun, 13 Sep 2026 20:51:45 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH] crypto: atmel-sha: reject initialization without a device
Date: Sun, 13 Sep 2026 20:51:43 +0800
Message-Id: <20260913125143.109897-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09ad2db4903a1kunm3fb934b6251186
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTEtJVkIYGR5LSEpOQh1OHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=SAUv33o3N0M2U3MEQ98jrETLPHgCQDktyroJKoOmzGE2qUrUNNC0WZKZ8CCEk86B5mH8PdpflSDu3D+i6ybXeDT3USPuWvgPW6UC0gnAsj8kcfgQmj+PyzYfjEQNpkwPwPEuHwUVkTiB9DqAZalEsfjlnoH7otGwZQQrPIv7/DI=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=u56UvOMtNFwTEkpB4tij+Y0DkppGFXqA7XZx7fKlDwA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_055151_949383_8F327F22 
X-CRM114-Status: UNSURE (   9.08  )
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

A transform may be initialized for the first time after the last
device has been removed from the driver list. Return -ENODEV when the
lookup is empty, before the debug message reads dd->dev.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: ebc82efa1cd6 ("crypto: atmel - add Atmel SHA1/SHA256 driver")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/crypto/atmel-sha.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
index 48f54b615504..d2338e731d56 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -422,6 +422,9 @@ static int atmel_sha_init(struct ahash_request *req)
 	struct atmel_sha_reqctx *ctx = ahash_request_ctx(req);
 	struct atmel_sha_dev *dd = atmel_sha_find_dev(tctx);
 
+	if (!dd)
+		return -ENODEV;
+
 	ctx->dd = dd;
 
 	ctx->flags = 0;


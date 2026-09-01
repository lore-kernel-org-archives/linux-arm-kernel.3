Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F1FC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ifjEpv0OpaPqvPhZfHyatOOmfJhWqJigF07DwVGfQz4=; b=pfz9MolngXciqEXpOSJI1ouvHf
	zUpW+DRZigH4GFGieDrpyKe3OCs0jeWaBjXdlK5LWpTX8XWT97kKzUomfaoPlOBp9WvbDUM+39kDj
	juq3eC1nQ7MIWABhZLS2maA7B5KQhNT/selwtU0ge8NJutM9FRGy9jaLyx1DGep1WS3zVNVG8CneK
	bO8l2THt0wcV+z28cfR/x6EJ7mItGx4vMjpiK2mLxzrWbYVIJkaMfwpwZlumDBUr2JuycEp1PwtNX
	QRapYyVXwpJmToN++di8kC0JBH462ioMeJ9Lf9YKteZiqgCtSfFsTR4d+WvDgsMa80pgiA6NdnDu3
	LeYJyQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jbb-0000000BEUc-1bqH;
	Tue, 01 Sep 2026 08:12:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jba-0000000BEUN-0Zbb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:12:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 926A160209;
	Tue,  1 Sep 2026 08:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2034D1F000E9;
	Tue,  1 Sep 2026 08:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788250349;
	bh=ifjEpv0OpaPqvPhZfHyatOOmfJhWqJigF07DwVGfQz4=;
	h=From:To:Cc:Subject:Date;
	b=YbQjDD1fvsxnh58EmpHbX59P2uesxx1/1452O70uZILJ5WGE4NJsb+UvxamAvIZYH
	 +pXdMX+bC7qAEGpnIvInPTFHdqACwfmRXTIiTsSpyuE7LFf9H/nTTG3yJirPamTEnU
	 qtx2LUFmFDpeVEGtXqZHABA1k4YrGfAAOVEd7T3c4B4WZDsOKJuMmBtmcN8kKOG/UY
	 aT0ExUai2x2uu2rMz9RBCnNarvSxYrB7sBKYk6QHrF2zBHx36wZqMnlH5UATRGrtBR
	 sXDrSj3kdtg74SCsJWUxht5u45qN+f/aPrhg1pekuuCpw8SxNbGdBr7nkv10v4zc3R
	 ZOUgCdyaBymFA==
From: Thorsten Blum <blum@kernel.org>
To: Thorsten Blum <blum@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-ecc - simplify atmel_ecdh_compute_shared_secret
Date: Tue,  1 Sep 2026 10:11:27 +0200
Message-ID: <20260901081126.44790-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=897; i=blum@kernel.org; h=from:subject; bh=lP4IcbhOCso8ldkbTMrdVP7Oezs/Fqa6rR5XKkHkloY=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnTOtZ5dJ1VWaCx+earuw39E7IPXE0OcJnNfFc9+c/T8 Ouc5yq7OkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAi5qsY/pl9mcTds676y3rW ml9eotrbW7Za3ZvSPkFJS/33z5+sDF6MDNNcW/PdrjXe6+T49Pnsw/TeS9qnbWW22JgxrhSPt1r JxgkA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
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

Free work_data and return ret directly to simplify the control flow.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/crypto/atmel-ecc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 075f38a67935..ad9f031cbc29 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -177,16 +177,14 @@ static int atmel_ecdh_compute_shared_secret(struct kpp_request *req)
 	work_data->client = ctx->client;
 
 	ret = atmel_i2c_init_ecdh_cmd(&work_data->cmd, req->src);
-	if (ret)
-		goto free_work_data;
+	if (ret) {
+		kfree(work_data);
+		return ret;
+	}
 
 	atmel_i2c_enqueue(work_data, atmel_ecdh_done, req);
 
 	return -EINPROGRESS;
-
-free_work_data:
-	kfree(work_data);
-	return ret;
 }
 
 static struct i2c_client *atmel_ecc_i2c_client_alloc(void)


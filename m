Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D21CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 10:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5fZ0Pbkodc7PSHQ6BqzpKM2cdMLGYSys0q5hgxO3YM=; b=I6sut6rnd3loKWoahbPbQynSjT
	D1PN3zpVBF/WZwgXu/6cPKEPH2ZVn2VjUFvhnQkXa2c25k+u+5PTxFBjx2nnOO1p2KEybLu+HuhER
	Wr7Z7YFdp1eB1JQQyUs7uewKytxjUgQCsbzbCDIrHkj2MgTZyFmFmQvzW+PSli8xmZ3c8irFZ/Lka
	sEscKi/a00hG89nv/+9gjAASJbKDq1FaCsvFxwFJE6YzyOyzVooXF2trqwcJH37hOgR5ag1EM33a8
	kDaqxPAMgTqpveni1prYdJ9/ogb0t2PzELHdnDjEAL3lPFKrKIWW42iI4NzJBv04RJZZNof7xadAb
	7Ws6phRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLeff-00000008jOq-0uYX;
	Sat, 09 May 2026 10:12:31 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLefb-00000008jN3-2vwU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 10:12:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778321543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b5fZ0Pbkodc7PSHQ6BqzpKM2cdMLGYSys0q5hgxO3YM=;
	b=pp8/aychRiUvzmEmRbLPvRbPH/399vrW17t7CkmSDUVjkXvEgKJdfq0Cf3/bhXX/D2ypA8
	Y+mKA93XxkaRBo2AxXJRmblA0nwnjeRPnqOa2gIjRu7pVgsQgqLAzRUiOMUuMDBAO0fZGR
	LXf5rDgWrMpfbp3Ot81yUqVgm+xStPY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] crypto: atmel-ecc - drop CONFIG_OF guard and of_match_ptr
Date: Sat,  9 May 2026 12:11:56 +0200
Message-ID: <20260509101155.2095-4-thorsten.blum@linux.dev>
In-Reply-To: <20260509101155.2095-3-thorsten.blum@linux.dev>
References: <20260509101155.2095-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372; i=thorsten.blum@linux.dev; h=from:subject; bh=QgJ75jFnjL7d1sl4OoWG5P0JzmlOcIc6pkH89CkMwNk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJn/OQoP/LjUcEaOkXntm20ulZ+mViu8vsZ8UEn716fJy w2/r3h7vKOUhUGMi0FWTJHlwawfM3xLayo3mUTshJnDygQyhIGLUwAm4niE4Q+34LrXcfxHPc0b LvzXff2F/5CukaaM2h2D3XMWb1x8T3AnI8PlY/diF76f0q24eyfz9DrDGUtUQrmCrn4WUCiIPt+ 5Yy8PAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_031229_128250_7466FE08 
X-CRM114-Status: GOOD (  11.16  )
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

Drop the CONFIG_OF preprocessor guard and remove of_match_ptr() because
OF matching is stubbed out when CONFIG_OF=n.

Reformat atmel_ecc_dt_ids for consistency.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-ecc.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 3738a4eb8701..c15096676ac5 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -368,18 +368,12 @@ static void atmel_ecc_remove(struct i2c_client *client)
 	spin_unlock(&driver_data.i2c_list_lock);
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id atmel_ecc_dt_ids[] = {
-	{
-		.compatible = "atmel,atecc508a",
-	}, {
-		.compatible = "atmel,atecc608b",
-	}, {
-		/* sentinel */
-	}
+	{ .compatible = "atmel,atecc508a", },
+	{ .compatible = "atmel,atecc608b", },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, atmel_ecc_dt_ids);
-#endif
 
 static const struct i2c_device_id atmel_ecc_id[] = {
 	{ "atecc508a" },
@@ -391,7 +385,7 @@ MODULE_DEVICE_TABLE(i2c, atmel_ecc_id);
 static struct i2c_driver atmel_ecc_driver = {
 	.driver = {
 		.name	= "atmel-ecc",
-		.of_match_table = of_match_ptr(atmel_ecc_dt_ids),
+		.of_match_table = atmel_ecc_dt_ids,
 	},
 	.probe		= atmel_ecc_probe,
 	.remove		= atmel_ecc_remove,


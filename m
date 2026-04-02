Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3643D3941E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 13:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XboYRvZ1sjYhyAoBa5TPLfYewPrhv3xPgmAMGkkGk/o=; b=l8m0nBx1JzeoG6W96Wk3H74A1i
	PGPxlCvnT59y1JL1BC0hTiNMayn4Q9CI43BPfaVUzySw4I7aU3F5PRKvksYuOaNNt/CnN7u5fQNhR
	Qn0fu2hGQA4efZrILPQuaYzopyQKUYvmlLXLJWDSWPWJ3/xbCnRUgvU/OE0aCfNh5HKO3SsIgZ+6n
	rcGHxi3aNhGBVN2fRxJd3Ha1YS9gOGKKG/eLiNNkyGcC/WAfIeMWGPCA9GG+5q9rKt0IPIR4egE0i
	MGkJ9ekOkmKb6Iln8e8cIlqNJgH5P7aMC+L4b5sMqL1G35v8w+9eQgRpTYVEqnu7VgXalJn2P9vFu
	CYYqg4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Hl8-000000008hF-2FDd;
	Thu, 02 Apr 2026 13:06:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Hl7-000000008h2-0R6E
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 13:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=XboYRvZ1sjYhyAoBa5TPLfYewPrhv3xPgmAMGkkGk/o=; b=GeBmlC+j9S9c+x6Xq7okKIeQTE
	cEIqzMxG/Yv6fATH21/leYCxW692vJRonxueoZs5NOoZghskc5Ribm/RoOXlLR9r/600x0zLuCJGg
	XtZoUhLOO4gykKgBl9tu0f4egGj3Q5pTo+IZKsklJPWHjLd7YSBvSnd3lUy4Im2QP8Fft8l8YuVU9
	asTy1bQHc95PDUQU3HQPdXIIVCN6V5+cwRULGI2sgCnkLM4hCqTuzz9zUc88TxXMoRfDCiCHD/1+4
	mOTJzSPScmFO1EXibdOgSXn1opz8p3+2U+j1XIVusHA7Lo8twL+2WJNPxuon+y911tnFXvalsBKHD
	AhpaxfEw==;
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Hl3-00000002V0U-0EqH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 13:06:51 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775135205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XboYRvZ1sjYhyAoBa5TPLfYewPrhv3xPgmAMGkkGk/o=;
	b=spFekU9lXZZRDPDs2lxIlWAnB+B+iSR4L3So790w2OTxVKsH+yrp144YMXVpedX4zeO1bA
	89thoQj4D2yqq2vsaI8McjojulCu0jRfiipVcN68CtqTLv5c9+lj/9FvAZMea/eqDrOi5y
	3fg99F5szxQTfpMUNSLwIYEMB6osyP4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-ecc - fix potential use-after-free in remove path
Date: Thu,  2 Apr 2026 15:05:38 +0200
Message-ID: <20260402130536.892838-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=thorsten.blum@linux.dev; h=from:subject; bh=3mEkNNBAXT/4sit0JHlFgeh1aJsvdLOLsQ/a+hbFXz8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnnMheENJrmbZmbEWt7Pzc8OXyBgl/xjrhvRVdT21gzO XgTZzN2lLIwiHExyIopsjyY9WOGb2lN5SaTiJ0wc1iZQIYwcHEKwEQKvjAyPDBom7f2zeo3Tje3 /1T8qfnD3nj73bR0Dq643vd+z+uW8DMyPP1YKsFRc8LvW3TMiZO3zqwr6+CuYf3KOiVKzm5zdKM cCwA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_140649_205507_16A83828 
X-CRM114-Status: GOOD (  14.32  )
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

Flush the Atmel I2C workqueue before teardown to prevent a potential
use-after-free if a queued callback runs while the device is being
removed.

Drop the early return to ensure the driver always unregisters the KPP
algorithm and removes the client from the global list instead of
aborting teardown when the device is busy.

Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel ECC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-ecc.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index b6a77c8d439c..6dbd0f70dd84 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -346,21 +346,8 @@ static void atmel_ecc_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
-	/* Return EBUSY if i2c client already allocated. */
-	if (atomic_read(&i2c_priv->tfm_count)) {
-		/*
-		 * After we return here, the memory backing the device is freed.
-		 * That happens no matter what the return value of this function
-		 * is because in the Linux device model there is no error
-		 * handling for unbinding a driver.
-		 * If there is still some action pending, it probably involves
-		 * accessing the freed memory.
-		 */
-		dev_emerg(&client->dev, "Device is busy, expect memory corruption.\n");
-		return;
-	}
-
 	crypto_unregister_kpp(&atmel_ecdh_nist_p256);
+	atmel_i2c_flush_queue();
 
 	spin_lock(&driver_data.i2c_list_lock);
 	list_del(&i2c_priv->i2c_client_list_node);


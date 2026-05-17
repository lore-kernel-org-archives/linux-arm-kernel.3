Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5E6CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 12:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B+3cXlV3mYWAhcoAJ4yQz6I0dSdgiSUgD9AaORo5moI=; b=detIBxsy9nDVnwSm3llywVYGav
	RPKW3ZNkXYtYZ+jAyvjID2WdisGguxDOMlF2mWuhSD79I3bgZNPSf+YmYS/lZCMNxIuxqcQ2skiml
	o4lVzNVR2JwZ98Jn0aBGwGH1UmM/bRvaqthLqIGQ2zNLP0INH6W8hctLACy710B806+F9BWd+K7b3
	73hWYmKoAx0S3ezoLqE655UgWJ5xTfjizgUbGmp0Xocl5Gzb5PkN2TqgU8WnRHK1rcaDwnkEdAKNU
	POnYBLb3W4nKcRluu3zuTsMF4xQSyV0rH+N4iggOhzBK/HnBIJG8lxQfRRipx2eMYRynCf3hGLunA
	mcf5V5Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOakG-0000000Chos-41Rc;
	Sun, 17 May 2026 12:37:24 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOakD-0000000ChoA-3TcC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 12:37:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779021437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B+3cXlV3mYWAhcoAJ4yQz6I0dSdgiSUgD9AaORo5moI=;
	b=gT+fU88q/T7/ZPVmcUuWgxbjrl4XsDdYjnH00DpMS5APwxp+W0N/a7hdi6pmSxC8WG8mH9
	G02hOAROG/6trkWgDv4TnH5S3GkupW318Y2O3XZLPMY5jAF+4++uHaEpso81LNu9ECB8/3
	gahPuVeaHmBGwzhXYehxJbWwr+wDIBA=
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
Subject: [PATCH] crypto: atmel-sha204a - remove sysfs group before hwrng
Date: Sun, 17 May 2026 14:37:07 +0200
Message-ID: <20260517123706.1182427-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=963; i=thorsten.blum@linux.dev; h=from:subject; bh=yIr3ddKu0XfiqPI1PUw8cCy/5rppI05Skg71kfhHso8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmc24o2iuvESVgenGi1f+fp/HtTdFnrb25nzk88f+DHl KbH5izbOkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAivSwM/93PqEyvPDf39r0J a3TuKPbkMWhZaT4R8ws6qpbvk1nst4fhf+C/FdYT+bTqUq6qdvvarf177h9XhegT2+0bdVb+eLQ niB0A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_053722_017841_7831344E 
X-CRM114-Status: UNSURE (   8.40  )
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

atmel_sha204a_probe() registers the hwrng before creating the sysfs
group. Mirror this order in atmel_sha204a_remove() by removing the sysfs
group before unregistering the hwrng.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-sha204a.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 6e6ac4770416..37538b0fd7c2 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -199,11 +199,10 @@ static void atmel_sha204a_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
+	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
 	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
 	atmel_i2c_flush_queue();
 
-	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
-
 	kfree((void *)i2c_priv->hwrng.priv);
 }
 


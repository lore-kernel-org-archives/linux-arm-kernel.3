Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E45105F79E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 19:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1y6+a9hP8kEfCSdJXdEzyPlBatUJQdOrQGIEsbPLPCI=; b=CWaADg+/Gi0IqD6lbvmUL7Q8R9
	0NBcVl1+1tXfuIj7ou/0qzqwZLCnKsg2HVHKmFYD8jQXXPaq6hgi7H5xIlmfTcg5mkRN1Y9u+2FXT
	+X4yn2vdpQU9aszKIwi6XskyhYdA6wcprBCfhSSgIUml34np17MmPTJdb41rXq/Nd719BziH+9RmA
	xHQXaJlF4FarCofVt08bhLY2ejSLZvglkGICT3WojvlE9pLfxUsUEblmIZXtHsqK+heZdVJHx1gz5
	r9HJOACC5OzLD9TbA7VSx4BMvTjnVrgYxX3wQcXPqHLukzyDV4JbRleSznTS7tMdqGU8VGSpUGDUj
	Z7h2knGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1UoV-000000027Jm-3850;
	Sat, 14 Mar 2026 19:38:19 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1UoS-000000027JQ-2YFG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 19:38:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773517089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1y6+a9hP8kEfCSdJXdEzyPlBatUJQdOrQGIEsbPLPCI=;
	b=A3V02oBykMZFjJkvFdBTU8UsKKvRxTIgCvPWDEvhTMMlcsLr6W+uFUVAy9doWxfVVoecpR
	3I433k6t7LirJaul8QEZuRQQZ4Wa4+bLobvVZnbE6mI1P+qbqJBcb+4UMrBR37ih/ccmpR
	ni8Qqj9hk9YB7SGvUBLR6Z4sWicitQg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Linus Walleij <linusw@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] crypto: atmel-sha204a - Fix potential UAF and memory leak in remove path
Date: Sat, 14 Mar 2026 20:36:29 +0100
Message-ID: <20260314193627.728469-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=thorsten.blum@linux.dev; h=from:subject; bh=BHatjBYmMqWDoVSJLpd9wA/cae++1PKscmXrKmMopf0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJlbd+xedn693PdS6WdfZ39YtTi9wcJ6nYnS65CH37tEm 7jf3XdM7yhlYRDjYpAVU2R5MOvHDN/SmspNJhE7YeawMoEMYeDiFICJpAozMrw+ZHPk7bm2vVHL /lQVZSs9aatY9YTVYf0kfY2SP+tMN+gx/C/Iy6tm5F/vv/FEorbcxh02qbenfN+3y8Hu9VuvmwV imbwA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_123817_038492_0BCEF0C2 
X-CRM114-Status: GOOD (  11.03  )
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

Unregister the hwrng to prevent new ->read() calls and flush the Atmel
I2C workqueue before teardown to prevent a potential UAF if a queued
callback runs while the device is being removed.

Drop the early return to ensure sysfs entries are removed and
->hwrng.priv is freed, preventing a memory leak.

Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Unregister hwrng to avoid new ->read() calls and then flush the queue
- Drop the ->tfm_count check and error logging after flushing (Herbert)
- Link to v1: https://lore.kernel.org/lkml/20260221190424.85984-2-thorsten.blum@linux.dev/
---
 drivers/crypto/atmel-sha204a.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 98d1023007e3..aeadbc9a2759 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -191,10 +191,8 @@ static void atmel_sha204a_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
-	if (atomic_read(&i2c_priv->tfm_count)) {
-		dev_emerg(&client->dev, "Device is busy, will remove it anyhow\n");
-		return;
-	}
+	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
+	atmel_i2c_flush_queue();
 
 	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
 


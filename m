Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE02EB7EA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W8iP5iIpjfhqtiGCtP0Z9gtiRw2K8cNyOMqPJ6maOv4=; b=ygUiw4lEUr2DarhMdjgTSt83BR
	0/p+lP9Y/xKGjjdchK1k8PMDFfAqxtkB7uqFHCg0gMiOjDAo87A3gjqHF8HxzGl40RVs9SnHCzKkr
	HLXqoeAkOYir+yva6zzLs9Kg/G34V7CMUBWxz3GEmGZaC24uM5HdOUCVJu6LLOkhLqcsFx3fUWzM/
	I0zv4No7lz8u4OcjFAxiI8UKKuxunq6rk5bskQly69unbT/qfbsfwIKJMyGbDkvjrU0cNDma/iceT
	64Tg9PXDBQ9ZrCyYn9aRn3r1FNdcK09EHhPx4wfyAIc9egi0YcBiLIynJUWjDsRIlEiIJUTm1zHMH
	3hZWBmmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhWq-0000000Gjov-2Vf4;
	Wed, 04 Mar 2026 08:24:24 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhWn-0000000Gjnd-34yt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:24:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772612658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W8iP5iIpjfhqtiGCtP0Z9gtiRw2K8cNyOMqPJ6maOv4=;
	b=FXfpAiTo06Rg/ywv0JoRSpy1E3nECXs5Q3ceIXa4YuIiCWroJEinxpkYSNTQyWeIC5lj45
	s1XxinJAjZP8zh9KiYdMO+MlATCFtrP2bb7O8LqVHCCMUMMI1IVm1+3BbkvenMwF7rVm4w
	iDtqwgdmk8D0NW4o83bmKb+ioFASBYo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-sha204a - Drop redundant I2C_FUNC_I2C check
Date: Wed,  4 Mar 2026 09:24:02 +0100
Message-ID: <20260304082402.89237-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_002421_921486_E655C7DB 
X-CRM114-Status: UNSURE (   8.54  )
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

atmel_i2c_probe() already verifies I2C_FUNC_I2C - remove the redundant
check in atmel_sha204a_probe().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-sha204a.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 6a065779b0db..2081a4d538d0 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -180,10 +180,6 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 	if (ret)
 		dev_warn(&client->dev, "failed to register RNG (%d)\n", ret);
 
-	/* otp read out */
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
-		return -ENODEV;
-
 	ret = sysfs_create_group(&client->dev.kobj, &atmel_sha204a_groups);
 	if (ret) {
 		dev_err(&client->dev, "failed to register sysfs entry\n");
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4



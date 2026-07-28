Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8C5C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 20:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hHfDxtXRviIyVvBGh7Iys+RpSMSujoxdzUaAudT4Lqg=; b=KQE3i7gmNEnpXhk/KKaUlpHXMY
	q2qM0VKFDjmPl3bkEoydgnP0fdl67OzI8+68bs0qOndhAx3UzNodjmFo+l90jnXu8te1DYEHuqnVg
	ZjFs9gC7fdQ+ZQby3VmBov5wZeaJ11/OBDnRPkjxC1FNs3uhMemUTwo2b99ePpqYLCEafaJYj3f+w
	fFMwOCAJ5PBVLGieYXWPotO1jHRrs1pIeM0O2yw4qLHLuW5pTeUjtnNpU66xgORcgp4nKZEg8gsOF
	CUWZt+4bcpFCwXqEFlV8hNmulLb6xqOTYXRkOHnjb6ipbleM6n4/Co3DDbLuCXrr1v7vDuv7A+9Kk
	4NdsitTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woot1-00000006FBk-1SnP;
	Tue, 28 Jul 2026 20:58:51 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woosy-00000006FAm-0LGD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 20:58:49 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785272323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hHfDxtXRviIyVvBGh7Iys+RpSMSujoxdzUaAudT4Lqg=;
	b=URnoggRLAi//Yn8I0oChl2VmZb3x2JvAVNV34sJNohP3Y1cDtn0TezrBeSMv8DmJDZr8JR
	3IyZXXn5GnAGFcnXunvc91g64lUi1G0h2CCrKXFtCGs4OJbpWHTi6p5fgRNZJybXE/UwT/
	1n4ZtPuyU21bEq8okCUr+SOZ8A4PtaQ=
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
Subject: [PATCH 1/2] crypto: atmel-ecc - simplify control flow in atmel_ecdh_set_secret
Date: Tue, 28 Jul 2026 22:58:26 +0200
Message-ID: <20260728205825.471233-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=thorsten.blum@linux.dev; h=from:subject; bh=lD5H0k2lSGSVpGxnOKY3vZo2BDaBYInh+gMUWUUxkRk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmZ4p8kLCtKbWq+z6+wiJDt2OOnY7DipFH91ofzIguvC n37YSPcUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABPJ92D4Hycr3Bb4QaazbcON XxtWS6ZuWCq60To3UeFxXWi37wOGIob/uZtubF/p9+Ybx6JHW3O2rI3nMn08YwsHh6VIqcCiNX/ 38AAA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_135848_726016_A00B01F8 
X-CRM114-Status: UNSURE (   9.76  )
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

Free the public key directly on I2C transaction failure and remove the
free_public_key label to simplify the code.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-ecc.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 21192a042fa2..f98782f0a2c6 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -107,17 +107,14 @@ static int atmel_ecdh_set_secret(struct crypto_kpp *tfm, const void *buf,
 	atmel_i2c_init_genkey_cmd(cmd, DATA_SLOT_2);
 
 	ret = atmel_i2c_send_receive(ctx->client, cmd);
-	if (ret)
-		goto free_public_key;
+	if (ret) {
+		kfree(public_key);
+		goto free_cmd;
+	}
 
 	memcpy(public_key, &cmd->data[RSP_DATA_IDX], ATMEL_ECC_PUBKEY_SIZE);
 	ctx->public_key = public_key;
 
-	kfree(cmd);
-	return 0;
-
-free_public_key:
-	kfree(public_key);
 free_cmd:
 	kfree(cmd);
 	return ret;


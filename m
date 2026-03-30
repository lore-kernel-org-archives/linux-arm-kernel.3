Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140C8FB3CF7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o6343OGuJL2cSO3CZkyoIBOVLXRYBOtEAFU3KFNUOKA=; b=BcqyDtuWdk495A0lk6R6BOy8+2
	6HXOMKDQ/cVMeelNBWAWj/MfIUe0r1gYspMsSP1DI1fsGDdVu1chXVQOzVo3sS8/pXSNZWNvyZU0O
	22I78g98ASecZhXV+U4WGJL0J6vAjhj+alymVNe+VcdhymR137t5fkeaVkh7Pi8fojheUvxut1M6r
	Zyc+K30J9zDfkES9jeyLIIGa+HN1pRobtemdab6RKDxJ0m9hYGRRQvJtIabLEtwdQuC7Lb3Hb+Rrk
	ZDI4lQeRBiyOxE6V3gbyEKNlkc7Xe9jR7MPQf3DGE2z6xWxzyKZKCEkRd3lmyIiMuhRDkSAecBsL8
	5aQ/rdjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79Xo-0000000B1YQ-3AOr;
	Mon, 30 Mar 2026 10:08:28 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79Xm-0000000B1X2-1DUp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:08:27 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774865301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o6343OGuJL2cSO3CZkyoIBOVLXRYBOtEAFU3KFNUOKA=;
	b=RA1RMxsqSoXFLSuaIPcxt1aaRrM9bxvbVuaCrfGG8LaNT1nLSikaijdBJ8v3BIj4DIpZc9
	iEO/KniXFgauGLghTEtmKpTALQ0EVLRtSP7fIdf1lQfgD9UMl2IJI/6wJrgHkqfNsHMZ/5
	5/WJg0LwESHEqoJ/xu87LkM2cOuxz4g=
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
Subject: [PATCH 1/2] crypto: atmel-ecc - add support for atecc608b
Date: Mon, 30 Mar 2026 12:08:00 +0200
Message-ID: <20260330100800.389042-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=thorsten.blum@linux.dev; h=from:subject; bh=RtnjTAxLWWtDJPmVNJ2E9HhoOT8h44xIvv6Mlx1+lMc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJmnvBvuX5nQeP+yjt+qHZOrnirmPz2hpnLqm3iGm/fec w7qGmkFHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCR0FZGhrXpK5wDv2Sd5OM5 e18mqKr3ijiT1LnbvQ8rRNoa2a46cTL8FcpZVLm7/IVUOK/Yad1GDmO3mpie7+fn/8pStOIza5J lBgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_030826_626164_F4E2DE07 
X-CRM114-Status: GOOD (  10.18  )
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

Tested on hardware with an ATECC608B at 0x60. The device binds
successfully, passes the driver's sanity check, and registers the
ecdh-nist-p256 KPP algorithm.

The hardware ECDH path was also exercised using a minimal KPP test
module, covering private key generation, public key derivation, and
shared secret computation.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-ecc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index b6a77c8d439c..5793e0c44113 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -371,6 +371,8 @@ static void atmel_ecc_remove(struct i2c_client *client)
 static const struct of_device_id atmel_ecc_dt_ids[] = {
 	{
 		.compatible = "atmel,atecc508a",
+	}, {
+		.compatible = "atmel,atecc608b",
 	}, {
 		/* sentinel */
 	}
@@ -380,6 +382,7 @@ MODULE_DEVICE_TABLE(of, atmel_ecc_dt_ids);
 
 static const struct i2c_device_id atmel_ecc_id[] = {
 	{ "atecc508a" },
+	{ "atecc608b" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, atmel_ecc_id);


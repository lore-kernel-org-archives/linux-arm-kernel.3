Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91C7CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 10:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=61oGxBAoiQU9iEBw4v4XAgABJgwFZGOsQf7ibrEj0qk=; b=HQ1SNM1p/ZPfTG1Tlo664/wPF1
	UH4WvRdJvELFTCQudppSv6Baod4yyTcpDEWAJyQXIBi6csrz4VStPkK1th9S2M9t72W91dCpaDBYF
	VMaEfuSrx16tt1ghgV6dJLAgw2oUKqUF5vchN+sW9MaMbJmPbWKkIQZJLQIqc5D/cwpZhRIAMGKYQ
	2nRftRBHO3bKCyVoNAYfWC45d2Ub7FJvWqgUoQH/p5eOqCzAoV9LJsjufQj2b/o83cmGaeDsj8J2n
	sp7GyzsPju2Dj+9bQi7HZBD9xo2flCd1UNi1DLFRJAGyYlfKX+moLxin0OvUzZH9rJkA6bLGlZDE6
	+1vO0FBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLefb-00000008jNl-2tBk;
	Sat, 09 May 2026 10:12:29 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLefX-00000008jMf-0qAS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 10:12:25 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778321538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=61oGxBAoiQU9iEBw4v4XAgABJgwFZGOsQf7ibrEj0qk=;
	b=LsvMYuDXbkPd11NP/xoDQaeJComKTLV7p7QVmj8mFazNwOvW3E5aUwWGHt9r8Kg7s9MVlS
	GD0RBs1u94UJ2Yq8IXWfjfeRpxD+Zrg5/xwiEc3BvF9lqVAAdf+XgsMXbo2ZhZo5K62IA2
	zFhLs3ZM2f5nro+v+WrgDhoWb+zUB4U=
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
Subject: [PATCH 1/2] crypto: atmel-sha204a - drop __maybe_unused and of_match_ptr
Date: Sat,  9 May 2026 12:11:55 +0200
Message-ID: <20260509101155.2095-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=thorsten.blum@linux.dev; h=from:subject; bh=LIGm6IfeAOjLe+aNZQ+2T5UbI0Y/Q+X6zrfFX8yPCsg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJn/ObL7OxceiO3doJt77Eff27tlIbs3cL2e9illZfir4 2J+25yaOkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAixYcZ/ieei6+f+sWtf/Lh 0Fuvur5FTVp7KCO+XV5K+4bKqeebZasZ/goLGD41CMw+saZ/uprn+p0ZIkJN1bqSxxay+3YFSDx p4wUA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_031224_349299_51710310 
X-CRM114-Status: GOOD (  11.33  )
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

Since MODULE_DEVICE_TABLE() keeps atmel_sha204a_dt_ids referenced, drop
the unnecessary __maybe_unused annotation. Also remove of_match_ptr()
because OF matching is stubbed out when CONFIG_OF=n.

Reformat atmel_sha204a_dt_ids to silence a checkpatch error and
atmel_sha204a_id for consistency.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-sha204a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index ed7d69bf6890..6e6ac4770416 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -207,17 +207,17 @@ static void atmel_sha204a_remove(struct i2c_client *client)
 	kfree((void *)i2c_priv->hwrng.priv);
 }
 
-static const struct of_device_id atmel_sha204a_dt_ids[] __maybe_unused = {
+static const struct of_device_id atmel_sha204a_dt_ids[] = {
 	{ .compatible = "atmel,atsha204", .data = &atsha204_quality },
 	{ .compatible = "atmel,atsha204a", },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, atmel_sha204a_dt_ids);
 
 static const struct i2c_device_id atmel_sha204a_id[] = {
 	{ "atsha204", (kernel_ulong_t)&atsha204_quality },
 	{ "atsha204a" },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, atmel_sha204a_id);
 
@@ -227,7 +227,7 @@ static struct i2c_driver atmel_sha204a_driver = {
 	.id_table		= atmel_sha204a_id,
 
 	.driver.name		= "atmel-sha204a",
-	.driver.of_match_table	= of_match_ptr(atmel_sha204a_dt_ids),
+	.driver.of_match_table	= atmel_sha204a_dt_ids,
 };
 
 static int __init atmel_sha204a_init(void)


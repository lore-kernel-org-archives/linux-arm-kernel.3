Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FCCE64009
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 09:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PB2wIVal0knNRH3IHxGDNzU1l0k9OBTjBH/yfZTe3bo=; b=VcRKcFkcaz2hQlo8kfxjCgraTO
	TQAPcWwO9G8R2anVfMgfMv4n4xFqJ5NtRRypdI10po5dWetWnOeQocQ48HuLUa1Wb9Q7if5CFxeVK
	AWfVfx0qz72GHptu/o3S/7BjAZ5NQPCxpHu8v6f0iNhPh5qZyfF92xvKmsRCmHWVonsyTqAluAY7T
	77Exvv5C0RoczDHpWwSPHwmz5UZS1bzVoxVja0WZeAvYOsAJFr2hO8giDNdjqbDLH47/QFJkEz+oE
	+WhBp7OSPvufxt6N7Mj5zVILW/gZwkR0LNDlHot+HujhiKteUViJYXr2bpr+YBErSmEo2cbK+BEJ6
	VaQABL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBrZ3-0000000EE0I-2jJc;
	Sun, 12 Apr 2026 09:57:13 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBrZ0-0000000EDzi-1uth
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 09:57:12 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775987826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PB2wIVal0knNRH3IHxGDNzU1l0k9OBTjBH/yfZTe3bo=;
	b=ZNUZT6Yg9k3SkxNbn+yFQEiQmMPJckZuGM87mew6So1NGo30Uvb4FylHI/bkM3aRBvEeEo
	FldqUO6R45huHuVT6cYgNtJvLqChDbFOo+dwwVqyYH2Yl/B64yFa1fK1eOtnp/Os0OzdBn
	1EBR49YOOh29G+Re5SX9PB32GB4NBsU=
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
Subject: [PATCH RESEND 1/2] crypto: atmel-ecc - add support for atecc608b
Date: Sun, 12 Apr 2026 11:56:43 +0200
Message-ID: <20260412095642.120815-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=thorsten.blum@linux.dev; h=from:subject; bh=HB3s4feq30/s1R2bwwVv+aAdLnzAoOYlnjVAKPryZjw=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJm3c6Jzl+TqXJo85+TDPJaevacOp25pKhRM9Obb+7Ry7 8Iy/jChjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZiIki/D/4qCHa/8lrbM4j/U OUts5v+kRH9/XUXvNa8sFkXLsr68ncbIcOsU+1KWM/YyL932Rb96zXV72yf7O4ciV++U8Yj9xL5 rAyMA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_025711_053180_644286A2 
X-CRM114-Status: UNSURE (   9.66  )
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

Tested on hardware with an ATECC608B at 0x60. The device binds
successfully, passes the driver's sanity check, and registers the
ecdh-nist-p256 KPP algorithm.

The hardware ECDH path was also exercised using a minimal KPP test
module, covering private key generation, public key derivation, and
shared secret computation.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Resending to include linux-crypto in patch 2/2.
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


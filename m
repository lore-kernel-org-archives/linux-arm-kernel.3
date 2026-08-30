Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFED8C61DE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 22:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=My24ANp40jmBDq80Z0CdsIMh6prDFOBZaleFla7Ra20=; b=SQqeajJKLxzhNXX1XwoBws6faL
	c0WMppG3GN+TCz/XWtxy6s7pWocwqtyQqEYgKAXgRpzA5K1S0LmssxLlm117rGFlRGKYMwRM3tmEJ
	mj3CkuqmINq8Lq8ZVXMyXwimhy32AuXkzCcECflCQrgysEYqybSE1r0tu7DusSsBjReMHXf5B5yP6
	EVa7OCTvgaRmeu/hGp3PjeQ3M6GYFPRJZYBe+NgSy0s2An7oD59uFsNkeR85BF0AHozwhx5IdOeeh
	TxyD2oiwayLhbVnrQojdy6/BcFG7RTZ6/yqPWvikPWVogCsLukAIHrQRpZLgJsLfM/3pA4xg7NCdj
	QGEE5X8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0nby-000000089Ur-0vho;
	Sun, 30 Aug 2026 22:02:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0nbw-000000089Ug-1ZH9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 22:02:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E75960120;
	Sun, 30 Aug 2026 22:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2061F00A3D;
	Sun, 30 Aug 2026 22:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788127363;
	bh=My24ANp40jmBDq80Z0CdsIMh6prDFOBZaleFla7Ra20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BPTQ2HWgnKry00xuyO+whUv0zKJ5o3zp0UvxnBjU088YABthtBbXcOX2U8SQDAQ2C
	 dWtw6crlivEywLpejrNXtfKtFX0jHo58rvTunD0zrBMvQFjjpSLq88sJhJdVLqVL6A
	 o9SH4LPoskjT6Ct+enirH1CGrlPo723JfN4sHsJeKKkGTWfGkgjXH7i13SRYRlxTqN
	 Agqmp0KF2OGBI3YhLQhcKobpGV3a2uzUqifK0L8y4ZfDbAuqBq9pa59pBeCwOdS3WY
	 iKXtEhglMqbGi3W50tXJAKlUsiBV29fTbEzhf4guZ3+AsKoTyJWHK2TPWi9gyLadkX
	 NykFhRJei6hJQ==
From: Thorsten Blum <blum@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thorsten Blum <blum@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Wensheng Wang <wenswang@yeah.net>,
	Frank Li <Frank.Li@nxp.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Colin Huang <u8813345@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] crypto: atmel-ecc - add support for atecc608a
Date: Mon, 31 Aug 2026 00:01:52 +0200
Message-ID: <20260830220151.21469-4-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830220151.21469-3-blum@kernel.org>
References: <20260830220151.21469-3-blum@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293; i=blum@kernel.org; h=from:subject; bh=Mqkb2QdjsRcFTzYR7WIzAtuJXRfrfDnrycy2XpUQ+Vs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlTVgT8FBbP3yItpTBRZbaCTOf0uCutB+q2LGtNvM1SV z7/nMfPjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZjIwy+MDGefTsh37LjwYOsK 0cqGs6YGvy8WqO56kHKkduqbr/f03YoY/kr92+B67xL3jtJm87LPX255HU5+UsOgzbWqUNVQOMH 3EhcA
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

The driver already supports the ATECC508A and ATECC608B and uses only
commands shared by these devices.

Microchip documents the ATECC608B as a backwards-compatible, functional
drop-in replacement for the ATECC608A, with the same device structure
and command interface [1]. Therefore, add support for the ATECC608A.

ATECC608A hardware was not available for testing.

Signed-off-by: Thorsten Blum <blum@kernel.org>
Link: https://ww1.microchip.com/downloads/en/Appnotes/Migrating-from-the-ATECC608A-to-the-ATECC608B-DS40002237A.pdf [1]
---
 drivers/crypto/atmel-ecc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 075f38a67935..0904bb47fd0a 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -348,6 +348,7 @@ static void atmel_ecc_remove(struct i2c_client *client)
 
 static const struct of_device_id atmel_ecc_dt_ids[] = {
 	{ .compatible = "atmel,atecc508a", },
+	{ .compatible = "atmel,atecc608a", },
 	{ .compatible = "atmel,atecc608b", },
 	{ }
 };
@@ -355,6 +356,7 @@ MODULE_DEVICE_TABLE(of, atmel_ecc_dt_ids);
 
 static const struct i2c_device_id atmel_ecc_id[] = {
 	{ .name = "atecc508a" },
+	{ .name = "atecc608a" },
 	{ .name = "atecc608b" },
 	{ }
 };


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B25EFD006E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 17:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHfEgbR0Kww6WJ39GY6+X1+4NNdMoWeXAl5PBALtTg4=; b=caX6QBtcSJ7/XGrGi+IzlE0wPL
	pueGMwYSPWxkVrCM1QUzpLUPOsuUBBF28GdXMA8VKifHPw+rBmsYQrZ72GuizGy5NTjBllYnZV4qx
	rMcn9qPEcikXt1yPobabIfDBb4kkx58KmpXCOUK02gPsVrpvnoAlJ+05pIemFj1ueFj2y+UmkZ3L4
	AEiUuhKpbuc/JAvGDZeP3IpddPqI7we64vlp7vaHLA4MlzcfEm4kmluSPypJoUbUiFSpXFwo7osBj
	VyXKodcBz23AQyVFQai2IDv5vn6hBLOYjrcyp1bJVriFahnWCXTpAgDcPZ1GuoEzaUy+c9RH7LjOT
	p6u2BZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkws-0000000Bjqj-3m2D;
	Sun, 01 Mar 2026 17:51:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkwq-0000000BjoW-3suD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 17:51:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E901960133;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83773C2BCB7;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772387479;
	bh=2RcZ1YrtLk3LFD+fkggSEgyijYJUi2tSNAB95o1MrT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IBja9dwv8Wb9Q+0XLAl4w+PrfuisazmmSVNGe02N03sUrDTzJAU8QYBneofUbNj+c
	 NZN+cTeJAnfzAGDxf1SafBOtW9Gco0IBHNb5EAXsKtBQ2r0L4ZmoIjZAHKltRYyUkM
	 d0cCnLjAh8I00rlfUiZTxnvoj9o7z8T4PBxukjvLj6Kb//jpGRR/8MW5+w0d/+ODjI
	 Mkh9Jy0LYxXVO82EQWQYzxlVQqnQUbsgzkodHZdCeEaISJts5cqNgG6EKkHpLqIqXF
	 UtyvIF4lnKgJ4pnVbWAtwGEx5uefshJxTX8b6rNuTISbRi+DkpiVc0cpfi3Bl/r49a
	 oodUgrHjme58A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F27FD0074;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:18 +0100
Subject: [PATCH 04/10] Input: stmfts - disable regulators when power on
 fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-stmfts5-v1-4-22c458b9ac68@ixit.cz>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
In-Reply-To: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Z29IokqtA9ULVf4cQSlm3q9NJhfdPu/mSq+nU9M0a4M=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyU9u/DZ1GreqI2xQDH8VFabq8lVGipnGV6u
 YblMQC0S3WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lAAKCRBgAj/E00kg
 cuLzD/45dchsfZkaDN8R4+2qYOi2IqahkhRBhZymvtMYZ+qXaWMz652M3IZpAy59eOOwkGO5B6j
 qfvIu57Qipc1I+UeTxkmepghYsA+E46SSYff8toz8tUAsOJBEY01FgLX4VSKV4hXPGR438LipBg
 2TjRUk5+jlm9sHdaOYdBQuGqejUnD/oL14qi4yYtOoGqLbqWs8wzDXFRTMS6YvT2GjnFOlDRqcB
 5DC+Idb7rWxyNtJdbOdH/ht3R5CCrpsq6YhK4KVub9rrCuRKAT/qQYMeXiSQVBr0eu4elXnm2Cy
 qZV/1QwsbgVwL5IiysQdp8T5Wu1ESmCMKB59jeR2QAmflZ0R3AkEsI69TK9akDlFEzsfFUm7mrz
 om83TzDnVnLrOZPYYMOzWNVLEPjSgpYWsBYK7U674/cEfRDFOkqdew6tw70v2GJm3Oio5VEzGVL
 O1SuQ+WaaVzCxEy9aqtNNxpy/FTnSsgcLc2xfFY4zgsS/Uxvgm83J7unPbfnaKxxizEy5w3NJ+A
 nHsF5XzVxS3APrLPRfLwnO5G4g4UVLw2lcJvsTp45CHzjthuOZiqZxvd177P52lkivJE//X4bnK
 02GDVbH9OLze8pxZBwDyrQLrbleT1JV1CuEywAlZwe9uk6weDvJTYTiPatc0US27Zw5CMDd9/tc
 9S68x3aBfA3/spQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

We must power off regulators after failing at power on phase.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index db2dd0bb59fcc..f4e5f1b3ce796 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -558,7 +558,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 
 	err = stmfts_read_system_info(sdata);
 	if (err)
-		return err;
+		goto power_off;
 
 	enable_irq(sdata->client->irq);
 
@@ -566,11 +566,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 
 	err = stmfts_command(sdata, STMFTS_SYSTEM_RESET);
 	if (err)
-		return err;
+		goto power_off;
 
 	err = stmfts_command(sdata, STMFTS_SLEEP_OUT);
 	if (err)
-		return err;
+		goto power_off;
 
 	/* optional tuning */
 	err = stmfts_command(sdata, STMFTS_MS_CX_TUNING);
@@ -586,7 +586,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 
 	err = stmfts_command(sdata, STMFTS_FULL_FORCE_CALIBRATION);
 	if (err)
-		return err;
+		goto power_off;
 
 	/*
 	 * At this point no one is using the touchscreen
@@ -595,6 +595,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	(void) i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);
 
 	return 0;
+
+power_off:
+	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
+			       sdata->supplies);
+	return err;
 }
 
 static void stmfts_power_off(void *data)

-- 
2.51.0




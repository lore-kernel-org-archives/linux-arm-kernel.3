Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48917CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 22:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoTuR9u/S7BS3l0dt8ueu9k+dX7v2fjdA6MLehy70Ow=; b=brS5ncFaYoDkn2WdsUkrMej7sg
	ky7XEK/w5zoooAEDCVokvd/QHJ2K1yt3aWlk8mAq/ZTxLdJYFe/WpfMAMt2Ubu3gRe1yPip6aoW9T
	hlYtXggBxpBLFOJbbkbx4T0nkGCS9HD3C6WFUv/+/sxQ1dqvcmMLPHUcAT0tWCumV7d6e5cuUnSZP
	QiipP1nrqE5aBuW97SD7u2TS7QdgiuzuTzK7eICra/a/geq+vAxxEEHJjE1pS9BEQfdCHFQj690Mf
	4LPjHCbRjezS1M2ZrQdyNfju2mzjeQGP9bv0kILozkoeRdn9z1jUmJBVivTJajTuT91l+ewlqEnTi
	ZiQJd+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpn-00000000bxN-0e1v;
	Tue, 12 May 2026 22:44:15 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpk-00000000bv6-24Tp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 22:44:13 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-445ae03198eso303507f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 15:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625850; x=1779230650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoTuR9u/S7BS3l0dt8ueu9k+dX7v2fjdA6MLehy70Ow=;
        b=cpfVaofIPxXLssgT/XhLJGlBTk+RvmnYtNuZ6mGSIVQ31tSCmr03XDJuyE5afVOpvj
         VHeFYk7JaCIGG1/RcbUwPj2UtTX9/aHGE6qfPR+xUjfveS3hEPJ8XWqY6b8Dwj3cN5W+
         7hgDrduIho4PujFoXTjffEen483JEpCXRe8PbrgVPKtyuZDCMA61AEV6mZaxlvCcHZiq
         p4SEeSvEQPR3nwFnXiuLAMxagAqCEzTxFomj29JiFhOHl6OSZrQFkEMaYBxdZFoq+0oa
         PAmup/oJDkCTmcWqufpj2R0Rq9yJvgx7RCc0RQwRYoV2DWzqRFJG1fkE4l0IL2vOUXO0
         jWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625850; x=1779230650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WoTuR9u/S7BS3l0dt8ueu9k+dX7v2fjdA6MLehy70Ow=;
        b=AVKIYdMndH9cX3GpgkDBwQcoOR+MsU2y9I4PHJzWjpI+fldjUQmRPGLkyGYdM6oGAT
         c4GbSFR2elMRtkMCeU44kQC/r/nMqGe6xoapBmkhKr5spsyltxeaRznrofmuGc0flzWj
         XGLXofhrRxvsvDCWp4BZOunWz3DxpA45nFZnFg05WhoMNLfd3iTF+yGo9zey3gQCJXST
         WitQ3TTPfHgWAdwsINmX1PgkVMG0hSACL5BRK6odwAAw0texLWgWLY0U/1n5mQMDDAEy
         mtU1J55px1YGyfJzYyrQv4e74v2Vq3gc9m1DeiF+i8T7B2Ko0U9dz2u5n8Gd1GMFFWhP
         dReg==
X-Forwarded-Encrypted: i=1; AFNElJ+GJ8/WhSoFU+1BCz0kj2+66FJSTJH+qjYSg8hSmiRlpxbd48GQJ/YJ7l0O3unmTp1UBDsPWlAww8okZtOxFKZV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx30IoC4isOdCyes2bAX6lXotrznDNMO1ppcENZQ8UqOP+4piAO
	CjQrpxpJDrB78/v/rnmFlfmduCumOhcjzmn+ig7nY2Jh2gBNNHrB/rLJ
X-Gm-Gg: Acq92OHHUrwVf1J9LidWVqtEy8yF4g0KepSUu7674yhyPzGERZ19TJP4X8iY9EOIkx+
	DuqL/LijCxwHlv+CWFw91ZRAH+9IdFVcRIjQpQOtbWXq5FEzJKsB2JwXY7Fj3FF+9SStaUWjYhh
	Oqevp+IST46hqyrNRePkjBvj1PYie08I/uASRdxRXh7Q/ylELpFurvmvDdvm5sU4Fn5DfHlBUjt
	vB7gOo919jJTFqDCJhV52A1NBi2L8k0LuMZzit9pXHs60/OfLH8AgswqPlzf6VK+jmLEK0ZEz9d
	Q/i2tuOv6l9mEcf3f79aYpRSFtg2Vv75qzmyyHTPz8kzzFCZPEAyOyTwWfphoH+JQ4FdPoX+UpF
	40dZUAvJQ4szRjbVuA0m12WN8OJLnm7BAzYwHwwsQCNz7PuP/h/c26eIlZrGtMY91V4AV8xpj3H
	b/89azAQjCTOzizme5jC8SXSTzzIVlO1TWUIUR88KgT35V9anj9gZypkiYQulS/Pg=
X-Received: by 2002:a05:600c:35c5:b0:48a:797f:24f8 with SMTP id 5b1f17b1804b1-48fc99a8965mr6254295e9.0.1778625850432;
        Tue, 12 May 2026 15:44:10 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce385ea5sm3194025e9.14.2026.05.12.15.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:44:10 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH 03/12] crypto: atmel - remove obsolete CONFIG_OF guard
Date: Tue, 12 May 2026 22:43:40 +0000
Message-Id: <20260512224349.64621-4-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512224349.64621-1-l.rubusch@gmail.com>
References: <20260512224349.64621-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_154412_536693_2382E22A 
X-CRM114-Status: GOOD (  11.72  )
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

Remove the CONFIG_OF preprocessor guard around the OF device match
table in atmel-ecc.

OF match tables are expected to be present unconditionally and the
MODULE_DEVICE_TABLE(of, ...) handling already accounts for
configurations where OF support is disabled. Keeping the additional
guard provides no benefit and only adds unnecessary conditional
compilation.

Also compact the match table formatting while touching the code.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index c63d30947bd7..0dede3707b73 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -339,18 +339,12 @@ static void atmel_ecc_remove(struct i2c_client *client)
 	crypto_unregister_kpp(&atmel_ecdh_nist_p256);
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id atmel_ecc_dt_ids[] = {
-	{
-		.compatible = "atmel,atecc508a",
-	}, {
-		.compatible = "atmel,atecc608b",
-	}, {
-		/* sentinel */
-	}
+	{ .compatible = "atmel,atecc508a", },
+	{ .compatible = "atmel,atecc608b", },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, atmel_ecc_dt_ids);
-#endif
 
 static const struct i2c_device_id atmel_ecc_id[] = {
 	{ "atecc508a" },
-- 
2.53.0



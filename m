Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B500AC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jMDExVgbOXk0VFPubyBaAIODXmgYxAMyHC4myKb7xfk=; b=zN+O7eW+jzr7KULTaH7ckMSNaM
	fHaUmBKd9vQi4SGKezlOPq4Bs+jq5yCU2GO5JOY3RNlR45DEvvuy1pjeQDyFa+dfYpfSxB9FRVXgY
	fyFRaLcrNdQxEEDWlghhP6WXxVx2k4I/Lj8siU9bgnenjzOAAur2ySxRMzwJsMTPXCkbKs0spzmNs
	LR734rl21lJNDdvpUU5gK6OQTWii/pBHSZxLlXJUU3UiTEG1u89gqboNcqzzujUYtIBpwn5roZJjB
	Hfrky62s6YwHdyPKChY1h/MKDN9q4cSH0jI0zLnITjCDZ5snxEGWs8xEQ5fsi6VFRS1qFhws8Ref5
	ruip3dPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjik3-0000000D2Ih-2aAJ;
	Tue, 14 Jul 2026 19:24:31 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjijz-0000000D2IE-49Aw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:24:29 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso1196831a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784057067; x=1784661867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMDExVgbOXk0VFPubyBaAIODXmgYxAMyHC4myKb7xfk=;
        b=iy/NznPqBRyYPvSvOFDI1bscIF5YOuiYDD7Xc91j9Uu9VTtLvaeyxTP9oZ+Oq8MV0E
         xotiZ4wXCt9AdTcsdCYsm0fFarAlvYCsqAVxXXyRGfqLXhWP8em2+XRRFhoCDmn9Gpue
         x8IVoircqG9CfVVz1hhbZX5uGDUQbnotND5psb3Lq4qpNsZ2XN98hZetUaVsIAE5Krfz
         y07LFTvXbh7peeI+Do6A1i2sPpC5nmXPcxrY+pxbt87pkO/KL7Ui0cRQRwb9UzGCURTd
         Kz4Y7kggqm/fh4xFBVPxld3RwxYlTD5INtaQ7CArs3WpL5Pw7xi1YymHbRdaee+QEBky
         Fe7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057067; x=1784661867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMDExVgbOXk0VFPubyBaAIODXmgYxAMyHC4myKb7xfk=;
        b=Z+Y00/u/NPLmQD2Y3rbpR+TpZM6DNeN0x6OFwRnkHSEMzcWkkS4cPdgzuf98KmUtT2
         3RR251sgS0Hw8x0+EnuzwhBanX5RPn/IOn448oI92IdFzj2iV2L0PiGEPUnNuYJrqKOk
         /OpgyTFToBLKHiQwUW6AGsCA3YO1t6AC6kX3guYRkwA0OLBOKuoY7Mqu7gyVrk7SuMXh
         PSaPqWEgbCJvJKdywqgEFvAObk1W0gtWYoNle5Nx4LdpeWsfS7wLEmTEIGVmCb5phsM1
         gQwOEe/Cocn7zMPiDn6FsV+UHYzLTco3lHHqnyo5YG3AQb/CDJa2IdZnD2KCclaxHSZ7
         5hNw==
X-Gm-Message-State: AOJu0Yyd0a4JTL53D13pEd+EVopa4TWSU9k7TUPi15qDoviMTI319U2B
	IOpqEL3rdMgOCTtGgqkkOYkpXWudlBTlKDgperearroG2Op+RIGbHwsb
X-Gm-Gg: AfdE7ckAgAgtrfTf0m7JHetjOVMGpKiqI+2DflXhVPh3u4sSd2E8ttlKvIt8QK45gzi
	u93cSeL0Ci/tffAbtW421wUAj0OR5nqIoPZKqdHdLcFD2+aDiUgeTthnRhsZa5VDV+jBOUiMiIB
	CEzcFMby62dTwC/NEF0cUtjhWY40yXe/THnsRZXxN+kgk3UgthgJU/OEp1Ezlrmige8SytO7z1i
	QYz7NWBsEsuTIm3PHWI8oHt6d9dD0xL+eAx/mXq1fXcuNIHGm/27UMT3fq7OEX+McjBwiBxFc/n
	SqS2YARyVwJBs/hklJL5OEyBvJyGAAZS6qov6ieJ5hdbOA2L3tXFJJmPzcs80sSfI9wLcp6FBIa
	nZsn9VVoDKI3OPivGc5cNLraDgyIWIsXYxYMQJWKzmPUBD18NV4v0UHMEcW3llbUIzrCRpRXu2f
	asD4MVGgzbXzgqujPlXnGKGrNqRDy/OAw8bTNxTblRpyeikajxx0AvtE6qRUtsEtZsT8ddP7CnA
	VDUYJd1FQIzUpC1GECKXynJ9B1V
X-Received: by 2002:a05:6a20:9150:b0:3aa:c93b:6266 with SMTP id adf61e73a8af0-3c11060a51bmr16770901637.19.1784057066941;
        Tue, 14 Jul 2026 12:24:26 -0700 (PDT)
Received: from fedora ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b8fc7c088sm31983224c88.2.2026.07.14.12.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:24:26 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: claudiu.beznea@tuxon.dev,
	andrei.simion@microchip.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] regulator: mcp16502: Convert to dev_err_probe() in mcp16502_probe()
Date: Wed, 15 Jul 2026 00:52:28 +0530
Message-ID: <20260714192228.1639768-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122428_038068_99C2112E 
X-CRM114-Status: GOOD (  12.63  )
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

The mcp16502_probe() currently uses dev_err() for logging errors.
However, functions like devm_regmap_init_i2c, devm_gpiod_get_optional
and devm_regulator_register can return -EPROBE_DEFER. Using dev_err()
in these situations can cause unnecessary error spam in dmesg.
As a result, convert to dev_err_probe(). It also simplifies the print
and return operations into single statement. The 'ret' variable is no
longer required and has been removed.
Originally detected by Coccinelle with this warning "Consider using
%pe to print PTR_ERR()"
Compile-tested only.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 drivers/regulator/mcp16502.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/mcp16502.c b/drivers/regulator/mcp16502.c
index b34ae0bbba6f..fea0f6a2f21b 100644
--- a/drivers/regulator/mcp16502.c
+++ b/drivers/regulator/mcp16502.c
@@ -508,7 +508,7 @@ static int mcp16502_probe(struct i2c_client *client)
 	struct device *dev;
 	struct mcp16502 *mcp;
 	struct regmap *rmap;
-	int i, ret;
+	int i;
 
 	dev = &client->dev;
 	config.dev = dev;
@@ -518,30 +518,23 @@ static int mcp16502_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	rmap = devm_regmap_init_i2c(client, &mcp16502_regmap_config);
-	if (IS_ERR(rmap)) {
-		ret = PTR_ERR(rmap);
-		dev_err(dev, "regmap init failed: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(rmap))
+		return dev_err_probe(dev, PTR_ERR(rmap), "regmap init failed\n");
 
 	i2c_set_clientdata(client, mcp);
 	config.regmap = rmap;
 	config.driver_data = mcp;
 
 	mcp->lpm = devm_gpiod_get_optional(dev, "lpm", GPIOD_OUT_LOW);
-	if (IS_ERR(mcp->lpm)) {
-		dev_err(dev, "failed to get lpm pin: %ld\n", PTR_ERR(mcp->lpm));
-		return PTR_ERR(mcp->lpm);
-	}
+	if (IS_ERR(mcp->lpm))
+		return dev_err_probe(dev, PTR_ERR(mcp->lpm), "failed to get lpm pin\n");
 
 	for (i = 0; i < NUM_REGULATORS; i++) {
 		rdev = devm_regulator_register(dev, &mcp16502_desc[i], &config);
-		if (IS_ERR(rdev)) {
-			dev_err(dev,
-				"failed to register %s regulator %ld\n",
-				mcp16502_desc[i].name, PTR_ERR(rdev));
-			return PTR_ERR(rdev);
-		}
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "failed to register %s regulator\n",
+					     mcp16502_desc[i].name);
 	}
 
 	mcp16502_gpio_set_mode(mcp, MCP16502_OPMODE_ACTIVE);
-- 
2.55.0



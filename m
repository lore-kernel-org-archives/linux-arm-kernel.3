Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A61EE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idjswr3CZVaGYQninP+vbzfJuDUomFBTKvCN0oZEZio=; b=PTSyppSbMTBQKiyJ8DXFxNciSM
	iroIxc54Q7IV9p44XkWgPiTwa/n0J0dLt9KyQWEAuf0/fdgaMJr5ewoz+Npmzr6v4Q4WHZLNQcy8p
	iyTtyk2k5Nf2Qw1R5joXXJddkJIqlfVGF3BHuPp2uA1iCEZnjRyFtTPeA8P9MJyEcIFdCjIARMg9+
	vKflLTMCTDzPwACuFtUArEc7GRaqY/MFiMP36MVaLgQRf4SUQNqrp6PAiOHzV1iOnqvAqmFuYUT9q
	tXoZLSMnaxBStoyE8HT302swTx+PD+XY91U8QwTIzbGjWGG+FxwvcXNPHAojrRFHUr7Rd4WYxyifg
	1tQ/vQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgGw-00000008Uaj-37XB;
	Mon, 09 Dec 2024 16:06:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgFs-00000008UJt-2m5F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:05:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434e406a547so15815205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 08:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733760303; x=1734365103; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idjswr3CZVaGYQninP+vbzfJuDUomFBTKvCN0oZEZio=;
        b=VZgnqdoYpaDp0JYqyI7h3EU7gdco9A+e9Q4XC2dBcuFs46WrngZoc2PtyqzPyvpSTO
         uL1ei2VycbJejS2leJAvisBjtyFIhyml6QNjLRqFKhUU8uoeYwwLn/zVpV/yEnT3woLA
         Dv7SpKgbkUyalpbtATOK/PazQV0+MI6EsRKpciWkh9p+izcMJCGxO4PDDf0jTqae5dWe
         7rDYMgsRo/cVH03FFbiB9Jjl+nIMO7D2xDP5FDQFsCnucs+1glYpD+gNrW43xldce5Ca
         tacP72ebB3T26PeHNCvInRtPb/fmWYqP+G5KLU9mMuq8DFWjJqXaAHjNnM2fSpPIiCoL
         C1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733760303; x=1734365103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idjswr3CZVaGYQninP+vbzfJuDUomFBTKvCN0oZEZio=;
        b=uMXnVoaqjPiN5nT7mKZmhH5vFfxgA1WbcIq10TX6shX43edWWhimjVnboC12UKW/Q0
         0frQooH/2VibBVvjhjPeP7pXJRVNxjiRscpxZHsiiugInXQi0o189v05XYOzogiXtIxG
         vqpBOmHLLaQL/RdA7nG2cFz9dhsOVo9BBd4DnQdTBYbKnql+zrJmHdl5YFQeBy1B52QF
         +M0062OzO/3eCbOG/wM1vNNwbwWkdurgRZJBPqLxUE2oQ4yF4NgLroVauuDJusm6tihk
         hN3/lZUSRM8ZRhPW41YZ/pxg6njBDbPIc5+RubjkDdwbQhp+8RhqRSMl7OFv1PKjyu41
         OrpQ==
X-Gm-Message-State: AOJu0Yw6OdEg2VlDLAmnqHk0qyq+bD2IlsHf6LQHRae4P/3dQNQCHgvx
	aQGQvSug0nt5MCnwB92nH1aqYAqSlSN1mtxdr1mdwKpn1Xe4Fs3RAzEUs9lMu/8=
X-Gm-Gg: ASbGncuUtTUm5QaUNjzgc491xDmCJUECHBOqyCnqSOTszrUUzKMU8HpqIWQs+wMaGg1
	2PgwLgXNh7xcf6OiwrRkkJ/Ur4Cz2qde72Oku84qiVMb9EFUyhwlvFKhUKmw2xYO2Is+yNT325B
	3kBPCQGgvy9CrtxepFLQjfJgaVNztDPh3ECi/K9Fc5SzEINgURBoZ3uQHlWq/VhaD15HWeYXD1B
	YkJw8CgPqEKr4Wedpno2E67YPIl2Ndq3jbj/vKvs/IrmZMD2OI80ZqBWWsLlTE9
X-Google-Smtp-Source: AGHT+IFxmJwOIZdSDCITBs7oFnEjBxY6Amfn6FoL8IA0PX5snnp8jJg+2IGwONPosv/ODGNfFL0F5w==
X-Received: by 2002:a05:600c:1d12:b0:432:d797:404a with SMTP id 5b1f17b1804b1-434fffa2ad1mr8902035e9.22.1733760303044;
        Mon, 09 Dec 2024 08:05:03 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:432b:3c3e:b17a:687a])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434f3d89b75sm61459015e9.15.2024.12.09.08.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 08:05:02 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 09 Dec 2024 17:04:34 +0100
Subject: [PATCH 1/2] reset: amlogic: aux: get regmap through parent device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-meson-rst-aux-rework-v1-1-d2afb69cc72e@baylibre.com>
References: <20241209-meson-rst-aux-rework-v1-0-d2afb69cc72e@baylibre.com>
In-Reply-To: <20241209-meson-rst-aux-rework-v1-0-d2afb69cc72e@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2997; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=GIzXS2CMipBruUg013x80hnunrhkIkK1Hy8qrpszX8M=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnVxUrYW638WrIiCr42AH4JqorjA4A+TLUZqfdJ
 0cE5/fWf0iJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ1cVKwAKCRDm/A8cN/La
 hT1WD/wJ6B/JrH/0Q+H6hMUfb52yQg381BFefDiZ+hYlFFSL2G/5ELCs7skolU4LuewUJ4kYYlO
 73Lgt1ujDqW6CJhhdzDCeqqMXrPuXjX5OHdcP9uB78toj45dBkSJPwSiALZORP4IMCg1gehyy1E
 6sBd0VUvAjT1b3abHb/tDmDrdY5O381LR7/eQvWquiXl1Q9YoamWtXsnoQO4BO6oHzXXtUxNjs7
 d8g3SFiIUSkz/tB+ruYtiOhYJeOAeUA/uaAp4ViGHyIgHvE/U8a2wX4C6wpWRfuHgce0Q6IxQSA
 nWGCU5bWf5oAQ/GNrEC/0EPKPWzgrqwIcq0Wbxj/W+FgAL9ckUa/USHn+xtYLRcGpFGCN/2DAlL
 IoCifTNiA5iVmZVveeFhRqvLpzN30iRltEkRI+Oqf9Rtn5v3uyU7mCUPbmMkiTaTuMTyLxB3YPu
 IHTFzpqaH8FxnEDAkUsA6TKPO6lfL9Rucz5qm55Nw7Hs36IzonVAwwoVjwYwfgQUkibZ9EJYkvQ
 C2PhkeHy+5dM5CDNfRpaIaGCDBE/ISd8HMpJiYJdsoZ19Ln+bGCGZa8MeX2fAY1mr/wqjghxnJ5
 TVLHtTxaXfyFoPDzbllL9HKjCAdU+64YDXCeDPxh53FLzWyWkGsQ48kVQ+WTRIp4Art0Z6r9kN2
 IAt5sbbUECe72WQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_080504_702690_B83CA64E 
X-CRM114-Status: GOOD (  13.83  )
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

Get regmap directly from the parent device registering the
auxiliary reset driver, instead of using device data attached
to the auxiliary device.

This simplifies the registration a bit.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/amlogic/reset-meson-aux.c | 36 +++++++++++----------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/reset/amlogic/reset-meson-aux.c b/drivers/reset/amlogic/reset-meson-aux.c
index 4b422ae5fcd209e1041e9a793d980627203d00b0..0fc1788eb7a83810ac524facfe09b5fa032573c3 100644
--- a/drivers/reset/amlogic/reset-meson-aux.c
+++ b/drivers/reset/amlogic/reset-meson-aux.c
@@ -18,14 +18,6 @@
 
 static DEFINE_IDA(meson_rst_aux_ida);
 
-struct meson_reset_adev {
-	struct auxiliary_device adev;
-	struct regmap *map;
-};
-
-#define to_meson_reset_adev(_adev) \
-	container_of((_adev), struct meson_reset_adev, adev)
-
 static const struct meson_reset_param meson_a1_audio_param = {
 	.reset_ops	= &meson_reset_toggle_ops,
 	.reset_num	= 32,
@@ -72,10 +64,13 @@ static int meson_reset_aux_probe(struct auxiliary_device *adev,
 {
 	const struct meson_reset_param *param =
 		(const struct meson_reset_param *)(id->driver_data);
-	struct meson_reset_adev *raux =
-		to_meson_reset_adev(adev);
+	struct regmap *map;
+
+	map = dev_get_regmap(adev->dev.parent, NULL);
+	if (!map)
+		return -EINVAL;
 
-	return meson_reset_controller_register(&adev->dev, raux->map, param);
+	return meson_reset_controller_register(&adev->dev, map, param);
 }
 
 static struct auxiliary_driver meson_reset_aux_driver = {
@@ -87,11 +82,9 @@ module_auxiliary_driver(meson_reset_aux_driver);
 static void meson_rst_aux_release(struct device *dev)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-	struct meson_reset_adev *raux =
-		to_meson_reset_adev(adev);
 
 	ida_free(&meson_rst_aux_ida, adev->id);
-	kfree(raux);
+	kfree(adev);
 }
 
 static void meson_rst_aux_unregister_adev(void *_adev)
@@ -103,24 +96,19 @@ static void meson_rst_aux_unregister_adev(void *_adev)
 }
 
 int devm_meson_rst_aux_register(struct device *dev,
-				struct regmap *map,
 				const char *adev_name)
 {
-	struct meson_reset_adev *raux;
 	struct auxiliary_device *adev;
 	int ret;
 
-	raux = kzalloc(sizeof(*raux), GFP_KERNEL);
-	if (!raux)
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
 		return -ENOMEM;
 
 	ret = ida_alloc(&meson_rst_aux_ida, GFP_KERNEL);
 	if (ret < 0)
-		goto raux_free;
-
-	raux->map = map;
+		goto adev_free;
 
-	adev = &raux->adev;
 	adev->id = ret;
 	adev->name = adev_name;
 	adev->dev.parent = dev;
@@ -142,8 +130,8 @@ int devm_meson_rst_aux_register(struct device *dev,
 
 ida_free:
 	ida_free(&meson_rst_aux_ida, adev->id);
-raux_free:
-	kfree(raux);
+adev_free:
+	kfree(adev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(devm_meson_rst_aux_register);

-- 
2.45.2



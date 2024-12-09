Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D49BE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gQvn01SCFaYf85wm7wZA4AxrI1YMc0NMUI8LVKIi7Q=; b=Nxqrq1ZYQ4ut9diFEGPgwKOzIA
	Y8o8BeCllyAaXfzwtpFFm8DezDIjYcMnbMz+JGlQsaRy4SsuEA4peJcNqXaTcWPq5CKbaGKbaiCBZ
	cXGq33kZ/uT6WooZjuqyUpy8ILgJgeelyCRonTTZndOy6FaGdI/ytZLehe4y1Qd0TAtaf9YNud8eh
	EFWuKzBnPYdEU2ONEo4K7xkPKIDdkvYBqgRrRGDGgxKF9+1E/9LKFySeUCLCW8mdDoJVFlj+JOJw4
	8sI2mYrDrQzP0Pp+R426CNZQ5J58iYGIKKcAM/UKeQoXE7EoSqaed9zhdVNwtdEM6hZPEXHwycdi7
	U9ndEy9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgIy-00000008UsN-1JfS;
	Mon, 09 Dec 2024 16:08:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgFv-00000008UL9-21pO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:05:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434e69857d9so13006315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 08:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733760305; x=1734365105; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gQvn01SCFaYf85wm7wZA4AxrI1YMc0NMUI8LVKIi7Q=;
        b=hqtpVFWEzZyIXb9icCgPIu0bUXh+F3aMxPismFhEnROPTpmmUnpWCRGEyzy9RKgYbZ
         CJKKpJ4BV1ydB6unbeILqArTxhwg04Axg2fAoxx6E86V2EUxQNTs1uOJqrmhHcO4JtRx
         nHcbCd2ReoIDLytYdN5fXozc8mbE7zcy7kXhA//U8clg9ISQBI9NcQMWQT4MQctYeAX0
         5CXTTdwKjZDVTKCdWWxdVFq3MI1AcQUiLybavALMNftYaIJ1cxOEirlUj2gT02Toaq/5
         mVgmDOGIlgEWzevMAl0alRYIv0W7iWA8p+GrFAVKsYp9P2CxEsaRq5Y3jIx4U+th6Jm/
         Qxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733760305; x=1734365105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gQvn01SCFaYf85wm7wZA4AxrI1YMc0NMUI8LVKIi7Q=;
        b=w8DN+nuZ88tSOxMLUQB8IUNNlPJ1boZgjONGb8aA2Msq6i12nJeeigWB01bUgP6EK7
         wnSm2GxKuy/AMvUQZ49ZG02irTDL5R8asq4A4r9Ez7l3/B2icXaFlJRmG1zPUYtu/P6L
         jo640kS8PBh/0KR2S2Ews4Qo6ckiCHzVNda2A8Lk8jTm8SdKFhAYm0ICDx0bnWX/PdeO
         I28eBsNdblTuLd5uIhgR4dDC5xNbDomla8Q8cAHxpL6vCDfyImxeJT7ZCSNlFpWP6Zas
         rBVhDrAC7bY5JCEREVty2F9JnLP0PJxrw+qloTcBL6mT0GHf5UnIn7Vy6MpaZPS/mJiX
         tbmw==
X-Gm-Message-State: AOJu0YxpSy7kAPkXgit65t9TBwuAvnyebg50mZcm8Ki6SKAL1xQmNgBh
	HQDtBUwcUo9CfhZp6WAUGgtCqoYMM7BDvd3QQRdu406OhQG/WFSZ/334xEwJfVQ=
X-Gm-Gg: ASbGncsXQw7ZAaj9IiwQ1mGWcWOEtGcAAIwe4Ddk1wDl5VRBBOHcX9IOS/WPLTq7ynd
	+X4zd1vmy2ObFGFyOQ77dRICQongvhQJCMVTbK8wO7RnzvUZabffUr6oAyt7hpNbpQS/VAzV/AR
	He7WbPqV94sQ2cageqr+tla5KGHeNCUY6VQKeFvAgIvPJ3Y8wZv419q4LqtvGBPcygopAGxZTUf
	Yu8b2g1ceb7U1ZqkwV7bmunuBNgqRuDqO5etfPxv+boqAGscDSujQD016JpRhdP
X-Google-Smtp-Source: AGHT+IFLgrvvJ4ZbcU5oZ15CP6sGt89w7sS5cZEiwVmnaeCinGDbdxMMBd+lkWhnwgPAIvZ9epw2HA==
X-Received: by 2002:a05:600c:3659:b0:434:e65e:457b with SMTP id 5b1f17b1804b1-434e65e47cbmr71087645e9.3.1733760303838;
        Mon, 09 Dec 2024 08:05:03 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:432b:3c3e:b17a:687a])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434f3d89b75sm61459015e9.15.2024.12.09.08.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 08:05:03 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 09 Dec 2024 17:04:35 +0100
Subject: [PATCH 2/2] reset: amlogic: aux: drop aux registration helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-meson-rst-aux-rework-v1-2-d2afb69cc72e@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3766; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=rBR5NXgnww06Sh65Qy/7Azyi2Gb2xpN2qKRXGKxDmUQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnVxUsYkSkA4Qwt3VALxgGbnvIVc8tf8kC27Tdj
 dF6gxpmN7iJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ1cVLAAKCRDm/A8cN/La
 hYLDEACeLDq6gapWnzc/DY38UK33183muDLmS35DUORGdkyly9YR8SSsNCdgUThmQj7ZGrECxOr
 VACnCXVFGcdnQk+SJhg/x2a/y5Bvh/kJYH5RNDcLWYAlXyCsYKw6GAnPc1q8cZ+0oEiRiQTvF4O
 eVRLt8oFMXOpgSzceSZ/AXAEaPRsUa1yVGih6LQp802v+sp6x2SJK7kvpkyIL8AHKhuoAbLz8uH
 mxYYi3OajcQM4B/Z0secKuabppMS1DfMB4JsKpbRDRGlaa4oa0MWjiULPBbXd5lAsPxDk6WFx3d
 PhpbjYQCF9wXXCAJtPXcDWKidypQ6D56IfoP+OfGNw/4Idw3of+1fSebpIUrL4lcReeCNWNU7A+
 nctX/aQ4/FSHYW8aPvKP1yj/1u6gVl5o0Z2tdPyTktiGYncfHhSuk7KYRlsAPzADVKOJ41zFRYD
 yPhUJU0YZFwbYh6AK3l9/1a8PgEC5gWWJpTw7laTHX3QIBMQuUcBCKNADgz39Y0BmGBnCrHd0T0
 6TxWvh+RG7mHc+3uAgpv7kcqt6UDYuwJYGf8kwCW5wB2rcfo+mPaaDHHH/lcOvmSdMR11ORdf8L
 IYVtcVu0rMsV7LJWl4snnxIw97Vnyf1hda505G5SAVkM3q2AR/XRU/UsSfs9JyMVMz6k0VyBp6j
 +h15x7Daa+PgfKg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_080507_525793_42AD028C 
X-CRM114-Status: GOOD (  14.80  )
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

Having the aux registration helper along with the registered driver is not
great dependency wise. It does not allow the registering driver to be
properly decoupled from the registered auxiliary driver.

Drop the registration helper from the amlogic auxiliary reset driver.
This will be handled in the registering clock driver to start with while
a more generic solution is worked on.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/amlogic/reset-meson-aux.c | 61 ---------------------------------
 include/soc/amlogic/reset-meson-aux.h   | 23 -------------
 2 files changed, 84 deletions(-)

diff --git a/drivers/reset/amlogic/reset-meson-aux.c b/drivers/reset/amlogic/reset-meson-aux.c
index 0fc1788eb7a83810ac524facfe09b5fa032573c3..1a2024afa056ea4d9404f6444476e48265ac8da4 100644
--- a/drivers/reset/amlogic/reset-meson-aux.c
+++ b/drivers/reset/amlogic/reset-meson-aux.c
@@ -11,12 +11,8 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
-#include <linux/slab.h>
 
 #include "reset-meson.h"
-#include <soc/amlogic/reset-meson-aux.h>
-
-static DEFINE_IDA(meson_rst_aux_ida);
 
 static const struct meson_reset_param meson_a1_audio_param = {
 	.reset_ops	= &meson_reset_toggle_ops,
@@ -79,63 +75,6 @@ static struct auxiliary_driver meson_reset_aux_driver = {
 };
 module_auxiliary_driver(meson_reset_aux_driver);
 
-static void meson_rst_aux_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	ida_free(&meson_rst_aux_ida, adev->id);
-	kfree(adev);
-}
-
-static void meson_rst_aux_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-int devm_meson_rst_aux_register(struct device *dev,
-				const char *adev_name)
-{
-	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	ret = ida_alloc(&meson_rst_aux_ida, GFP_KERNEL);
-	if (ret < 0)
-		goto adev_free;
-
-	adev->id = ret;
-	adev->name = adev_name;
-	adev->dev.parent = dev;
-	adev->dev.release = meson_rst_aux_release;
-	device_set_of_node_from_dev(&adev->dev, dev);
-
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		goto ida_free;
-
-	ret = __auxiliary_device_add(adev, dev->driver->name);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(dev, meson_rst_aux_unregister_adev,
-					adev);
-
-ida_free:
-	ida_free(&meson_rst_aux_ida, adev->id);
-adev_free:
-	kfree(adev);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_meson_rst_aux_register);
-
 MODULE_DESCRIPTION("Amlogic Meson Reset Auxiliary driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/include/soc/amlogic/reset-meson-aux.h b/include/soc/amlogic/reset-meson-aux.h
deleted file mode 100644
index d8a15d48c98494c45c6e3d7e88fa714f770f12e3..0000000000000000000000000000000000000000
--- a/include/soc/amlogic/reset-meson-aux.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __SOC_RESET_MESON_AUX_H
-#define __SOC_RESET_MESON_AUX_H
-
-#include <linux/err.h>
-
-struct device;
-struct regmap;
-
-#if IS_ENABLED(CONFIG_RESET_MESON_AUX)
-int devm_meson_rst_aux_register(struct device *dev,
-				struct regmap *map,
-				const char *adev_name);
-#else
-static inline int devm_meson_rst_aux_register(struct device *dev,
-					      struct regmap *map,
-					      const char *adev_name)
-{
-	return 0;
-}
-#endif
-
-#endif /* __SOC_RESET_MESON_AUX_H */

-- 
2.45.2



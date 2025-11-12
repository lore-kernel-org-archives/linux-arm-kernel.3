Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93020CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHCwzReQ17B3LDkchxkIz3eblf2i0j4UnwMVHJlClGg=; b=Dt3HO2MKkYfZNFGfiI6b20VTm2
	vk1OLAoTLDkRtEyEaHq2voZISdBvMNliZ33uBvriheJRGG8te4JK+WU8ZhvtvKlECvmlabLqO5ke3
	gD4p1sIAuR1Sk7rfETwAddi+18PgQe4yE5A39iE1W/TdmFzy0+t7dWN21WggO0OOmd/XWVEHzJ8i/
	2/AQxqRgtXO5s8jC5ulWSujtyiU2dUewBL7DNdmLiGjK2dTQp1WhCWS7RJ6jJFVr+vNgwjTfLuGZ4
	1FaKXLvfV0bsFr7TJUDdYOCDLR+Xe2KzZC9P2WkJ5NI687f1rpLdL0WZx8tjAifgH8o8f0/3dkB81
	LTkVZSOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6X6-00000008O3M-2Nxj;
	Wed, 12 Nov 2025 08:48:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6Wz-00000008NyB-2Uoo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:48:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47777000dadso3572635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762937324; x=1763542124; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHCwzReQ17B3LDkchxkIz3eblf2i0j4UnwMVHJlClGg=;
        b=YxoRz1u/9kktO8D+9CslAXbiRz38ihguAlNWs7sq9YlaO4fERybu9dz1V7+xhZAaig
         GGxRy6yDRP14Vp0xCXUNHhddA5BNPwjX5xWax67q1ZuSabDO9zc44CFuBU+mRk7ZWAwo
         V4EPoS2MnqI9ZQ00wBPjIcFtNUpDGmaIA2KjY3Px2lim1HPvuVn+bnSIqxKzAbq/hs1I
         MMLWOkQmboUzo8YRiH+eBSoI97VEl2SmCxrZFi1FrTg40UnYgAvPafuJzsOx7ps2/AXb
         OyRj1Zk47ZeYK4832K8IhuBxv8OSQ4JO1KyAt6mnk4H4QR5BsvZaiJCvSQLO7o0w0uof
         YdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937324; x=1763542124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YHCwzReQ17B3LDkchxkIz3eblf2i0j4UnwMVHJlClGg=;
        b=RTEv+18gsJID9c/geoBTJV89BJ9wviV+HR9a6EVibwinaRZNSYcMx0O7uz40CJikCJ
         VIBaDoLJiOAxSHDXvn0nLL29Hda16oMo5/6C4jMB2PrE/jQ6frEsh0RsFNkWjzJwk6pb
         U4wEXg/gevyv9J0EzWu1on1QTO5DIm1aiQhMYRuQ3zD8AxQz0viFaIaje6gdQx80mnYQ
         dRN5olLutY76vigDBDEAZxxpJZ/TulG2O6I38fWLecc7ZFWfX25J4ME40HsZxGBDVv5N
         7sZYQ95SfwrhT3dN9YwMnu+Sq9kFK6MGImcEOX6pGvNxTDoAHEzWfAwit29UsmksTg9V
         ObTg==
X-Gm-Message-State: AOJu0YznMcIGxDH7qZcXKTaBUsnOuBG90LqjEDu70gnpuGAPAvNqScMm
	sgfYhKoztBmL8J69pSdOIUs0DqKflM+0Duhx5gTm13sUj8O19wQ9UIukypyJAaT15nU=
X-Gm-Gg: ASbGncv4b/YDr40SxhH3ITzmo4yVW7TjAZ2ZuZ4Lp7X8P03U/dk/lZL1UMB08NQLamQ
	qumeO5ehU9k5pQSeH0yS40FaLg07MJJmm4fWmXGB794wSNVfNoLHR4MMlBUAFJkT+jwoclUeTje
	OqXU/kaTf9+dpAwnxt19qwpNfov13n6/02NghCycLkXd1PL3zXwXlHx+zwgY2BrobHO3P9G/QMb
	8CXyyx1+bzTqRyalOXQ0HJVD8HuahCdy9kMvOlMQKL057LhJ38DiSo4Vc3Gv/C8aDVzLjWVGhjJ
	7drYbYhi+gZLhLto+l7GVM4S/MNPUNmb0i1mCeLLar1ko1KoC+sj296u17aApoAGMhtjh0ZajnC
	5X8R2LmkQfLUcUa31Ag9PU0wRS5Ri2OZayp+xtsywZdrnM9dLq4vO7OiKUgsg9hBaJiqzCCg/Ee
	vm821ZvS9qUkqpRv+KBuwdleUTcdy5dwsR2OkmkSuhIYVJDzEnNzL0N1La
X-Google-Smtp-Source: AGHT+IER3DYH8U9sYwYLoN8VfKXngSp0sef0ZPfwedq+Ay/0zM7XddiA+Z2Mq/fUyg1ZnrUUB2uTBg==
X-Received: by 2002:a05:600c:35c9:b0:477:6373:f3eb with SMTP id 5b1f17b1804b1-477870a8b57mr21511475e9.31.1762937323522;
        Wed, 12 Nov 2025 00:48:43 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47789ffea1esm3732645e9.13.2025.11.12.00.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:48:43 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:48:23 +0000
Subject: [PATCH 4/4] soc: samsung: exynos-chipid: use devm action to
 unregister soc device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-chipid-trivial-v1-4-ec2dea03bd83@linaro.org>
References: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
In-Reply-To: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762937318; l=2293;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=n57AkQX/19Tb7iHOH+H3uEtUeyVRBEzgRBixRLiXHFw=;
 b=bMyB0dF9A7s2TwSb6EVYiRGLCLForFlgHHMYDdy3K5A6G2Ioi2jiFOZ13zx6ejNWqrQuMYtg/
 v1Svk1Zmeo6DeqIub2Zm7ixB/YNYSXR4VxOo/yq1VXDQvkqPk2UcVcn
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_004845_660163_7846869D 
X-CRM114-Status: GOOD (  14.35  )
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

Simplify the unwinding of the soc device by using a devm action.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index b5866a324d8ae911a5c99d0290328efdcc072dfd..d5b4d4f8d43da4c50d0e856e914550a9322725a1 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -14,6 +14,7 @@
 
 #include <linux/array_size.h>
 #include <linux/device.h>
+#include <linux/device/devres.h>
 #include <linux/errno.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -104,6 +105,11 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 	return 0;
 }
 
+static void exynos_chipid_unregister_soc(void *data)
+{
+	soc_device_unregister(data);
+}
+
 static int exynos_chipid_probe(struct platform_device *pdev)
 {
 	const struct exynos_chipid_variant *drv_data;
@@ -151,28 +157,19 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-	ret = exynos_asv_init(dev, regmap);
+	ret = devm_add_action_or_reset(dev, exynos_chipid_unregister_soc,
+				       soc_dev);
 	if (ret)
-		goto err;
+		return dev_err_probe(dev, ret, "failed to add devm action\n");
 
-	platform_set_drvdata(pdev, soc_dev);
+	ret = exynos_asv_init(dev, regmap);
+	if (ret)
+		return ret;
 
 	dev_dbg(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
 		soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
 
 	return 0;
-
-err:
-	soc_device_unregister(soc_dev);
-
-	return ret;
-}
-
-static void exynos_chipid_remove(struct platform_device *pdev)
-{
-	struct soc_device *soc_dev = platform_get_drvdata(pdev);
-
-	soc_device_unregister(soc_dev);
 }
 
 static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
@@ -205,7 +202,6 @@ static struct platform_driver exynos_chipid_driver = {
 		.of_match_table = exynos_chipid_of_device_ids,
 	},
 	.probe = exynos_chipid_probe,
-	.remove = exynos_chipid_remove,
 };
 module_platform_driver(exynos_chipid_driver);
 

-- 
2.51.2.1041.gc1ab5b90ca-goog



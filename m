Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC28DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 01:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfN6GTuNKF5VqrxYRWrKUqgkdrEWac7RU0Z/q9vfjN0=; b=PrOHDWFWXz3P5U9OZCZAXLr3vk
	6BS9rulcokywrBnvLxT5ZpAvcVpThJEPRBK7Ugn55ZgJ2CxnQlC7K3ABdIOKq7DDiwwP7RwbMpwph
	JEypHSmtLXY/Dr/pPLbxrH+5gT+k7JaRMoEOnKZcg+hZtpuU9uu7DX7JMwAf1flLpOa6P0IzfdBQH
	RTA0pQ1rBCrvPy67wap7ynmCxOQ9Z1w4gVfwq+wxar/YhbAbDmvPeSI4LCw9NBOc2uv50cE3xmiBA
	Q+HeErCOeajhP3QU/SW6bFvodvjRF/yTieOOYxCxvoPN+MNAvEOsiuoZ7cWktep/r9b6NzFDu+ybi
	jfSNe6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKyI-00000006lRE-3TNb;
	Wed, 08 Jan 2025 01:34:58 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKsR-00000006k0T-2QpK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 01:28:56 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ee74291415so19419883a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 17:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736299735; x=1736904535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfN6GTuNKF5VqrxYRWrKUqgkdrEWac7RU0Z/q9vfjN0=;
        b=k/QOFlOkrfox1/v+A3Q/rOXjC4tVmSFFStgm0XSAJAgpK3gCC4Am0ZNmfPVbMwRDTG
         TEJ3bHGNwsNZjGSFl2rbEHA8qlq/ZxhrUkZatWsTBKzQqvzwzVaPyalO6JD+OMmNEjyq
         RA9nc7viEEEe+3ZXBUbNGSP8yN/CL8tU+BH5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299735; x=1736904535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfN6GTuNKF5VqrxYRWrKUqgkdrEWac7RU0Z/q9vfjN0=;
        b=nzxOiSZX9TfQjmHXkmMEgWA+k58NNfmMty6XKB+QbOKtRfYGXKdsgNqRSnyQXBDz0G
         JMBftpTPIoFBX9ZrejMQUbqfvta32O+My/JtlWC3MkyDBUBRFav0lejnFEb1qpRFfIYy
         iKl0Hlm5wvxDHdNIiDEDxqaJS2fhGKoGLEV//Zv0rYTUGUFA9Ac4TgrWqdYlp1/j0DbC
         HH72MvzA8tnYMNCEO9O2IDrM86At3e5i1V2gEMrHl+71UAqtyTFl+6cmoZxge55pYJIm
         YGLhWcSnE97ngB4eH/7acU4t+E5XEOZX7suiSA3twFPVKR7TxZKi7ZCWS4OoV5udmxxt
         uPhA==
X-Forwarded-Encrypted: i=1; AJvYcCVVvuI9msciE3MPbKlWZlVCdaH0lf+MwtAPcZ1GiAVscY7ak/oRQoICcu55NzmTSZluoYCTNEHyGh+Gs9zFW2jB@lists.infradead.org
X-Gm-Message-State: AOJu0YyC6bKT7ISEqF/W1HLwFcXFZ6MWJtSj7ukLnpo0mEmHJmnSzyEH
	zsP/C6++g34oHpXS7y688tga2oM48YFnwjX2AQh6e82o9TBt+3bkkR4gYcSwpA==
X-Gm-Gg: ASbGnctThETsWqs5BhgJXun2j3W6QiT2BvbG34HgI4TUbEqFbnkiiJ67Fa3FB1yspwA
	9j9km9htm8LsjJgThXd8C62Wzt2qS/A7gWjQSVkehWKxV5aHQXV7WaCE71Gk334npVp73R4l7z6
	+QdUhrqZ639NJ/errPADTCijNjTO1Z21kOA85XeSth6OGQU+wFUFE5brE+56dCfTiaxhetl2l8I
	JwCJpKPcrpjGWfxqDm9ClN8Jyc0ypYk1blGg04R/KsBCrz+BEc2YPHdquvWVCR+JlXqOpUvFCNE
	KNLK7/ifWL+Z9YWyXvEU
X-Google-Smtp-Source: AGHT+IH4Y++Unzll3LBTxpHGSJAl9gWr9EZnywMb7/5iKVZRlAs9Kn/eOeYulAHPdNQ/JPBW9ae4bA==
X-Received: by 2002:a17:90b:2c84:b0:2f4:47fc:7f18 with SMTP id 98e67ed59e1d1-2f548ebb679mr1630164a91.10.1736299735123;
        Tue, 07 Jan 2025 17:28:55 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f54a13dcd5sm239559a91.0.2025.01.07.17.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 17:28:54 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [RFC PATCH 4/6] of: Extract alloc/add functions from of_platform_device_create_pdata()
Date: Tue,  7 Jan 2025 17:28:41 -0800
Message-ID: <20250108012846.3275443-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250108012846.3275443-1-swboyd@chromium.org>
References: <20250108012846.3275443-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_172855_622226_90091DA1 
X-CRM114-Status: GOOD (  19.36  )
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

Allow drivers to modify the 'struct device' for a device node by
splitting of_platform_device_create_pdata() into two functions. The
first function, of_platform_device_alloc(), allocates the platform
device and the second function, of_platform_device_add(), adds the
platform device to the platform bus. SoC power management drivers can
use these APIs to allocate a platform device for a node underneath the
soc node, attach pmdomains and/or set the device as runtime PM active,
and finally add the platform device to the platform bus.

Cc: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: <devicetree@vger.kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/of/platform.c       | 80 ++++++++++++++++++++++++++++++-------
 include/linux/of_platform.h | 14 +++++++
 2 files changed, 79 insertions(+), 15 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 63a80c30d515..d8ee2d38a382 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -138,6 +138,66 @@ struct platform_device *of_device_alloc(struct device_node *np,
 }
 EXPORT_SYMBOL(of_device_alloc);
 
+/**
+ * of_platform_device_alloc - Alloc and initialize an of_device
+ * @np: pointer to node to create device for
+ * @bus_id: name to assign device
+ * @parent: Linux device model parent device.
+ *
+ * Return: Pointer to created platform device, or NULL if a device was not
+ * allocated.  Unavailable devices will not get allocated.
+ */
+struct platform_device *
+of_platform_device_alloc(struct device_node *np, const char *bus_id,
+			  struct device *parent)
+{
+	struct platform_device *ofdev;
+
+	pr_debug("alloc platform device: %pOF\n", np);
+
+	if (!of_device_is_available(np) ||
+	    of_node_test_and_set_flag(np, OF_POPULATED))
+		return NULL;
+
+	ofdev = of_device_alloc(np, bus_id, parent);
+	if (!ofdev) {
+		of_node_clear_flag(np, OF_POPULATED);
+		return ofdev;
+	}
+
+	ofdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
+	if (!ofdev->dev.dma_mask)
+		ofdev->dev.dma_mask = &ofdev->dev.coherent_dma_mask;
+	ofdev->dev.bus = &platform_bus_type;
+	of_msi_configure(&ofdev->dev, ofdev->dev.of_node);
+
+	return ofdev;
+}
+EXPORT_SYMBOL(of_platform_device_alloc);
+
+/**
+ * of_platform_device_add - Add an of_device to the platform bus
+ * @ofdev: of_device to add
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int of_platform_device_add(struct platform_device *ofdev)
+{
+	struct device_node *np = ofdev->dev.of_node;
+	int ret;
+
+	pr_debug("adding platform device: %pOF\n", np);
+
+	ret = of_device_add(ofdev);
+	if (ret) {
+		platform_device_put(ofdev);
+		of_node_clear_flag(np, OF_POPULATED);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(of_platform_device_add);
+
 /**
  * of_platform_device_create_pdata - Alloc, initialize and register an of_device
  * @np: pointer to node to create device for
@@ -154,29 +214,19 @@ static struct platform_device *of_platform_device_create_pdata(
 					void *platform_data,
 					struct device *parent)
 {
+	int ret;
 	struct platform_device *dev;
 
 	pr_debug("create platform device: %pOF\n", np);
 
-	if (!of_device_is_available(np) ||
-	    of_node_test_and_set_flag(np, OF_POPULATED))
+	dev = of_platform_device_alloc(np, bus_id, parent);
+	if (!dev)
 		return NULL;
 
-	dev = of_device_alloc(np, bus_id, parent);
-	if (!dev)
-		goto err_clear_flag;
-
-	dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
-	if (!dev->dev.dma_mask)
-		dev->dev.dma_mask = &dev->dev.coherent_dma_mask;
-	dev->dev.bus = &platform_bus_type;
 	dev->dev.platform_data = platform_data;
-	of_msi_configure(&dev->dev, dev->dev.of_node);
-
-	if (of_device_add(dev) != 0) {
-		platform_device_put(dev);
+	ret = of_platform_device_add(dev);
+	if (ret)
 		goto err_clear_flag;
-	}
 
 	return dev;
 
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 17471ef8e092..e55c1371b560 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -71,6 +71,10 @@ extern int of_platform_bus_probe(struct device_node *root,
 
 #ifdef CONFIG_OF_ADDRESS
 /* Platform devices and busses creation */
+extern struct platform_device *of_platform_device_alloc(struct device_node *np,
+							const char *bus_id,
+							struct device *parent);
+extern int of_platform_device_add(struct platform_device *ofdev);
 extern struct platform_device *of_platform_device_create(struct device_node *np,
 						   const char *bus_id,
 						   struct device *parent);
@@ -91,6 +95,16 @@ extern int devm_of_platform_populate(struct device *dev);
 extern void devm_of_platform_depopulate(struct device *dev);
 #else
 /* Platform devices and busses creation */
+static inline struct platform_device *of_platform_device_alloc(struct device_node *np,
+							       const char *bus_id,
+							       struct device *parent)
+{
+	return NULL;
+}
+static inline int of_platform_device_add(struct platform_device *ofdev)
+{
+	return -ENODEV;
+}
 static inline struct platform_device *of_platform_device_create(struct device_node *np,
 								const char *bus_id,
 								struct device *parent)
-- 
https://chromeos.dev



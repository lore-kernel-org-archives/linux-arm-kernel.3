Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEF0C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 13:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qo/hHt79rE3VZLJ7TZ98QyZq8pgpS3gSu0z1hicTW8=; b=Var1MGpF0CgS7Y5P29Ge8VNAeT
	dFUddW1JNUb0Z9QwgU+t27b0C9KOKW9O1tt5xpNGzqrWUEZLxFXo+zV9+TiClaBQRyejAMa+qKi2q
	3bc/SO4s+NUxXfMRv8GjSpOjM28+QbsxzDv5NTDH2J3IjCMChA6Fvb3drjkGVUG8NOMUYj/f29kgA
	jKqn38WEsYXA9aDzHLnCGo530m4EAYDogD3bpDCQHKMTcCJslXvU1Rf/7zAm34iNDB80tT4ttXliW
	vlAyhaTQpg8BXEr17HWqMkgRN1xTft9zZEJTzb49g+v65iBcsb44RmXtXTPp1wv2QxP1J8JYqyBKp
	SVz36CDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmpp-0000000B005-2cCV;
	Thu, 27 Mar 2025 12:59:49 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmkh-0000000Ayzg-1vXR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 12:54:33 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso183694166b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 05:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743080070; x=1743684870; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qo/hHt79rE3VZLJ7TZ98QyZq8pgpS3gSu0z1hicTW8=;
        b=tIMXVdrngnHPkdC+quRvRpd6h6EdWnbR5c1d5TxyZxyilxFW7YAFVEV5bGyk5k7zTc
         9Ik7H2Mv1Eidf9hWxvOq4lgcbNlYiQS6eZRlBoZ3JA81K3yrDdJMf2sz3/81tSuqx4px
         7fj/ZXY67DfRtRkOSNNrC1hIG4EOPSYdKV46CsQLkIcMA3AnrXiuiEi/88XBMS39i1Hi
         Vn6QlxO+MynpKGca9wTQ2ZJKrbd+TvxgIz9+tvSmPgRBEjzOchyEyQ14OWVpC/9rPt/J
         5rQxjLtTGovUAwwyqZSo9pshIwxqTSNmbEPTR/gtmMt94cODVZBx+jQziEzRi9KDHVgK
         cSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080070; x=1743684870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qo/hHt79rE3VZLJ7TZ98QyZq8pgpS3gSu0z1hicTW8=;
        b=xPFajvi5L5MQxu8sb+wHgRFBbYr5est3lVXQVLvTN4I8ZUR2hn9TuCKHNUhCV5blMA
         2Dp2TOG2PSpwRbUgxeoK0u+ooW8dj4OwVjQhtuMdr3WbAubiL5u4RQf6D8I6qTCzA0AG
         sYR7WOa3DXikVzI2/vBgtg3XLnnFhU1kfi6tScCy0vw839kCOSuHjv1bMlCseo8vlMSV
         HJrtDmIjSAZpDAWzLl/nCHYaP67Y6cgVHlrnzIKwkEZgvxi9NoSETNZhUIyC7UL+DWno
         c4nozAJKRosktn839pdBKPjP/i7CqxRsdWuuKoZcATG1konFtRaQPk9+QGKK0oDRqee3
         alEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU1aWgfv2hoMalIl6fabBsuBbvVlUOrR/zKdKh0Bkww/HoQrXYJa/Ys35H5PE+hOx2Yt6+0GJ6abhYWvQhPy/q@lists.infradead.org
X-Gm-Message-State: AOJu0YyNtWj9nFdWKJ0evLWpNO2A6xgNaxfIsghWTdLG7MVCjwH5q0AL
	G6TAvWv/sPcvbqy79YIKUEHWYevm7VfXXJg01alq3s/lsJZ/UIR4QoUUiWp/w0U=
X-Gm-Gg: ASbGncss4lM3e7biOmtjivqtVwipAgY2v/WCKWvOhBe1QwvF9sGgeZwesTOXvLJ9pbP
	+8pMbow6urE73sAWYDzaKMyNKYW4JpKVX8NFfJJtqelCwnG00TtN5h4a/4uRB2Hk0ARSedL8ALv
	sB1NUVCkKHfpvxLJsFt4Fala4RsEEXfiIdYEOKXyN0qaE6CLbpvzacepvOiYdNT6FztaDRYmCod
	+PncNgibpamvLv2q3wX2G3bmpHskW1sTfyKA51Zr4iHDGWu63uFeHeTiz6NttY/Q0fHeWAf++1V
	KRUNmKEFxFzVC3eyl1CJzDCaOJqnRojYSO5o35X3qJQwoLlP3/lzhFbI8zX5a6zstbetKCizW5N
	uv2iDD3pffkui+cwGzWk+09u/nrv/
X-Google-Smtp-Source: AGHT+IG8jc0XBjcqIGUvrW/gcmDgiKrcGkSXoJocsWny8eep3O/qi28YUXPgBj4BwkE0yMd/1FYIUA==
X-Received: by 2002:a17:907:2d10:b0:ac2:49de:45c1 with SMTP id a640c23a62f3a-ac6fb173f7amr271477766b.50.1743080069724;
        Thu, 27 Mar 2025 05:54:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd47e9dsm1205410266b.167.2025.03.27.05.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:54:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 27 Mar 2025 12:54:28 +0000
Subject: [PATCH 2/2] firmware: exynos-acpm: introduce
 devm_acpm_get_by_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250327-acpm-children-v1-2-0afe15ee2ff7@linaro.org>
References: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
In-Reply-To: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_055431_498184_12BC4699 
X-CRM114-Status: GOOD (  16.55  )
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

To allow ACPM clients to simply be children of the ACPM node in DT,
they need to be able to get the ACPM handle based on that ACPM node
directly.

Add an API to allow them to do so, devm_acpm_get_by_node().

At the same time, the previous approach of acquiring the ACPM handle
via a DT phandle is now obsolete and we can remove
devm_acpm_get_by_phandle(), which was there to facilitate that. There
are no existing or anticipated upcoming users of that API, because all
clients should be children of the ACPM node going forward.

Note that no DTs have been merged that use the old approach, so doing
this API change in this driver now will not affect any existing DTs or
client drivers.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
devm_acpm_get_by_node it is being exported to modules in this commit,
because there will be an immediate user of this API as of v2 of
https://lore.kernel.org/all/20250323-s2mpg10-v1-0-d08943702707@linaro.org/
---
 drivers/firmware/samsung/exynos-acpm.c             | 23 +++++++++-------------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++--
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 7873cdda127e4f1b6b2febccd054ba27aeaf9b28..74f0ed9b5c0f73393932c46ab6341716745a0df4 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -667,20 +667,14 @@ static void devm_acpm_release(struct device *dev, void *res)
  *
  * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
  */
-static const struct acpm_handle *acpm_get_by_phandle(struct device *dev,
-						     const char *property)
+static const struct acpm_handle *acpm_get_by_node(struct device *dev,
+						  struct device_node *acpm_np)
 {
 	struct platform_device *pdev;
-	struct device_node *acpm_np;
 	struct device_link *link;
 	struct acpm_info *acpm;
 
-	acpm_np = of_parse_phandle(dev->of_node, property, 0);
-	if (!acpm_np)
-		return ERR_PTR(-ENODEV);
-
 	pdev = of_find_device_by_node(acpm_np);
-	of_node_put(acpm_np);
 	if (!pdev)
 		return ERR_PTR(-EPROBE_DEFER);
 
@@ -709,14 +703,14 @@ static const struct acpm_handle *acpm_get_by_phandle(struct device *dev,
 }
 
 /**
- * devm_acpm_get_by_phandle() - managed get handle using phandle.
- * @dev:        device pointer requesting ACPM handle.
- * @property:   property name containing phandle on ACPM node.
+ * devm_acpm_get_by_node() - managed get handle using node pointer.
+ * @dev: device pointer requesting ACPM handle.
+ * @np:  ACPM device tree node.
  *
  * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
  */
-const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
-						   const char *property)
+const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
+						struct device_node *np)
 {
 	const struct acpm_handle **ptr, *handle;
 
@@ -724,7 +718,7 @@ const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	handle = acpm_get_by_phandle(dev, property);
+	handle = acpm_get_by_node(dev, np);
 	if (!IS_ERR(handle)) {
 		*ptr = handle;
 		devres_add(dev, ptr);
@@ -734,6 +728,7 @@ const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
 
 	return handle;
 }
+EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 76255b5d06b1228bb8579d32aaa478036a5c344e..f628bf1862c25fa018a2fe5e7e123bf05c5254b9 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -11,6 +11,7 @@
 #include <linux/types.h>
 
 struct acpm_handle;
+struct device_node;
 
 struct acpm_pmic_ops {
 	int (*read_reg)(const struct acpm_handle *handle,
@@ -44,6 +45,7 @@ struct acpm_handle {
 
 struct device;
 
-const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
-						   const char *property);
+const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
+						struct device_node *np);
+
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

-- 
2.49.0.472.ge94155a9ec-goog



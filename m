Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7594BCCF2F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sT+McEH0mapvqHwCrxtH/EF4dLPev+0QCK1+TJXdyk=; b=ta5rRZF++mf2R5q43BP/ImnVQY
	8IgmHNXtQphm/sUT7rBHvEzLHCuAfrJ85+foOYjG7TQU83wAtMQPlX5tjzDxBimK5fNa8OFNKYgSh
	gpdgCVLvlVDzY5hsSS+tbkLBjavAVtEuo/PLAhKawsL0Hg7qAz8QDEUgh3r/wOg7v6mYabtM2/C0x
	aZm+xma8KQTUJdhVUQempbsZcfArcb7oXMPoWFJ4d8d4Kf5OOI59EfPncU5T7H4OzertQFy/Hnwmq
	HZm099n60gs+r3IFhNI08yTv6uOxYCypXlTTnB2oKbfgNgebG6qnSHDE4i8NRgYSafNZ6hyRFlIac
	fmcbtt6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho44-00000001xUg-0Z67;
	Mon, 19 Jan 2026 12:09:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho41-00000001xSd-3LVQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:08:59 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so2331293f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768824535; x=1769429335; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sT+McEH0mapvqHwCrxtH/EF4dLPev+0QCK1+TJXdyk=;
        b=WI3/aIKZOziHOpZrQJ67RQScKQ2f+VI0tm7FmyOBrQRTjQroHf+ofUQHvZ88Z/zt+l
         UfexI+U0X5nBYU+A5efrKGva4LL7Obo2E9ZCsyxY7jXiV6aPT38hjpAsbgDTKSJWQJWX
         W8IdYp4g2QJ/ZaTfDXGEzTJ3sIwnUvVqUgxBtXsKGljOtD2ilXmwGUBuW1TxRamxGGz3
         MFxXvRND/j7OSlrq08+kM+Yq5vkZF8kp/Xx37OQXuLv0+dKrRPBZI60A0p4EQ4bY6WWZ
         X5Ht2T+Iv1rli+7kgIKpZTnT/h+TmyIawFBPd5Wv9781S2yG8Fn38idJhTIrTtQYw78w
         0IsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768824535; x=1769429335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3sT+McEH0mapvqHwCrxtH/EF4dLPev+0QCK1+TJXdyk=;
        b=rCr9mXVmQYim7Tm+4mHn9PgHHSdN2JAYWNWYcOhKHS1LzfCYpkSOxldZNYjONLMI6p
         ScbJj5bg9AIEAmtiN/vtJ+0tJGWjgGdjDHQajbDJWz0LApP+ZW9R8iAo5DGTlshE7b1W
         QqRQyKTQCfRQ1PWkCiMm/eiV8z1Kcsg1pnBvKzOlPyc4sSgo5mnbU1xZDswOw5D1cQaZ
         QFoVQ8oAvjObi7qIV7zdnhTuMOZOmPh2mnWt2O/f9Zso5Renq7cJEE/6lDarwhqDTNel
         Ax4EQaC8cwsYNu7b5qgP2/6GcCBFN1PnKtSDp+PBOBoEMCxbwSDEr/BxOHGr5dGVaEIE
         5bEg==
X-Forwarded-Encrypted: i=1; AJvYcCUzQ9zzatT1YDcnnFsxNNELCRsE/nUmAJ+TzzjIeH1K+76e4jlpCxKtlGXDVJZURJWm2jcOZVFwTzrjig40NzRl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1k1RKyfluslE3o67EBFMmpxdiZudHdYx1+7FEIHkgIwjaqUxu
	HtPXrIJl+SMAKSuaLkLCnPh9iXXw8yDfRZ5ESIi99DxCwP47Nt8a4Ttcc0SVop6FJJc=
X-Gm-Gg: AZuq6aKTIa0vkybwWsASYbeKV9EH2KagaMcyblBhK17fRA1TgjfK53TaNaRvk+aF0KU
	eJqpVzjGy9hxQDuJhyCxn4GHqGzAYqXrTLV15/xWoSlAz5kb71IbSI0SCSAa3sPng6hqu7iO3uZ
	keh6j7W0d0wTuDrrectigm8/NBOym0N1VRTPUjtU84jmFWu02D7LGDMu4It02TNfQ50kM0EQJkx
	hqqXwBwMMJZ9T1gwpl6Fr6JuGNX+1j5pkEixWcUY8QTAyu5crZII/bJbe9YUJHQIeJVcjsIKSvq
	54ZnpvaOBks75sw6MHPSJ6teIVqJ3rG+uJANHTB6i40IOARlmkZuSnld+AKrpPc/SpCMel7xmWB
	MV3A1NJUoh66VmmF2s4CgQUY4HR8la6C8k8mAmJBzwNLz0M9sGdDGcSmZzBE0DD9acLw0BYV9AP
	cC0fvWgsaGb1B2oA3nz0VCrNL9OH/0TiNoTxzUlki9j+m/Kw2SXYdaT5xFTuxD0QTkOQL/AA==
X-Received: by 2002:a05:6000:2505:b0:432:5b81:49c with SMTP id ffacd0b85a97d-43569bd463bmr11645564f8f.55.1768824534827;
        Mon, 19 Jan 2026 04:08:54 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e664sm20698421f8f.30.2026.01.19.04.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:08:54 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 19 Jan 2026 12:08:49 +0000
Subject: [PATCH v2 3/7] firmware: samsung: acpm: Add
 devm_acpm_get_by_phandle helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-acpm-tmu-v2-3-e02a834f04c6@linaro.org>
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768824532; l=2702;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=pykdip+kkXufUlfCYLkhdMwhxg3VFd8rMtL8HJrLcEc=;
 b=mq6tHfgFD5v+dBnv9e/9P/zH0n4O+kG2DeWw28a7k1Ie25bdm6byhx1O/Jsmir3D59rhSmRB2
 PCtjiH30SmtCASeMud922mbZVmChdLaD2MzvcIIs6KDlOrDaN2jrrTO
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_040857_899294_04DD0D8F 
X-CRM114-Status: GOOD (  13.95  )
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

Introduce devm_acpm_get_by_phandle() to standardize how consumer
drivers acquire a handle to the ACPM IPC interface. Enforce the
use of the "samsung,acpm-ipc" property name across the SoC and
simplify the boilerplate code in client drivers.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c             | 23 ++++++++++++++++++++++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index cc045370f4b0dc6ccea99e3c2d6f86a43b2e9671..cf849ba23f09d8b1e7f91734a0a1cc064f7407c7 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -776,6 +776,29 @@ const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
+/**
+ * devm_acpm_get_by_phandle - Resource managed lookup of the standardized
+ * "samsung,acpm-ipc" handle.
+ * @dev: consumer device
+ *
+ * Returns a pointer to the acpm_handle on success, or an ERR_PTR on failure.
+ */
+const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	const struct acpm_handle *handle;
+	struct device_node *np;
+
+	np = of_parse_phandle(dev->of_node, "samsung,acpm-ipc", 0);
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	handle = devm_acpm_get_by_node(dev, np);
+	of_node_put(np);
+
+	return handle;
+}
+EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
 	.acpm_clk_dev_name = "gs101-acpm-clk",
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 43d41e11ad2eb985e27a918ce3f9e9ac15a194ee..9485cdc1d91e86f9a9a8fc00722f3313e3000c6a 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -82,6 +82,7 @@ struct device;
 #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 						struct device_node *np);
+const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
 #else
 
 static inline const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
@@ -89,6 +90,11 @@ static inline const struct acpm_handle *devm_acpm_get_by_node(struct device *dev
 {
 	return NULL;
 }
+
+static inline const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	return NULL;
+}
 #endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

-- 
2.52.0.457.g6b5491de43-goog



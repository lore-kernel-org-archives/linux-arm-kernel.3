Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2845CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAYzurZY50V3hmmtsDULHaTPPUEpyOSaAQclTNRWi04=; b=B3LOaA0yu/XOCD6WeeJtDOyVSf
	kGu4E0KlwafSH1jCQ7SfSRRGrmtoKve1lpj4+IZwjaGO+pY7bUbZsd/6TEi0jawKrHwEo3h03qz9R
	j0GjoVLjpWIKV+RvrObZL+LtDvZlHpoTivOzqWHXc1MDA5bcsoCfgfTIi/zuHP+riy0aw3J/kFL6c
	i8nthWvEYY3qLlaT6phrdAMLwFDtYvC1C0eyYeqwwlRyhUmKeDKIF4gEqPhiYNKGu9WhTiGtX/Tql
	StenjIubE+OulByNXd2EbzlRd5tpZTbJ3GYMb/tI8vdG9EOUrmToa69MI0UTa0grGo8Bn5ghaCENI
	TYdhf3aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNouS-00000007tvm-0KsX;
	Fri, 15 May 2026 09:32:44 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNouL-00000007tpk-2una
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:32:39 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5aa0862dda1so2016066e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837556; x=1779442356; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAYzurZY50V3hmmtsDULHaTPPUEpyOSaAQclTNRWi04=;
        b=ICA1Q8iCM0w0cdV0I/xQbGWP/Mqr3YxcQCbaJKm+w2zD+FXll9/wrZtifVNS3hYwNq
         kWnr+EyL7Ci82hJr2ihCgmgnWJjTL2FITpH2TNbwDdQblltw6GQ8kIKP+Z4fIJiab6vu
         waoMc2gb0BMjKc0e7tPV3g1tAIhPT2EOB7IumLg0ASxeVm4H7wF/Uxcak9qezcdvpGTe
         K5U7DvnZvBN92Xak3J7sarLSiQ/bMe4Cs98sStZwZO7bQ66talRMWErUAKM/D/HHS8bX
         H6W2goy7RFJSnWAEm0DSkwPt2S0CxcCh+fAejkGnPhINXReO+kzN2ngBcpYTDLp/8MXq
         SYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837556; x=1779442356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bAYzurZY50V3hmmtsDULHaTPPUEpyOSaAQclTNRWi04=;
        b=AyC3esHrP7/MjFN2Sif2R/HJXQe7B8JbwxEoOk4W8f836mZ//zT1wHP3fHLVswJjnG
         5Nz6LN7t9Y2UCCF9qEe23Oyii134VlsnPiqo4eKeoQFbBOMEkQSglHPxbK1TJtVoCL/F
         uZ8vsRWQZu8TpUqY0nqrcRZti3CFKgK634EI5di+E8f2iMOFNG05h4q4mal+H/AOIPpb
         KZCbRfHTwvYis/LXJXAYWio1QGZWaoxalbRMcFn3sCiBr2t48yWEqRnNcTIl6P1pTbNZ
         mKbrQDp9j7an4FygX6SuY41IVUvj7RpErQCQSvS603rDGk6N1jkzAOJaoHH+CdEUfymM
         aNeg==
X-Forwarded-Encrypted: i=1; AFNElJ9FlWrNrUgkZJcQnv/d3mqIzoFreOV0Q1W2oglkRxmlX/vZ9nI6d3DNaLi2nt92KNuSIH3W6tUV7co7pBS4fqDC@lists.infradead.org
X-Gm-Message-State: AOJu0Yxopp9PteAYjBuqn/8tez6UJ8MJY9/v5tg5aLNRARGzLjPUNIpw
	hbMK2UkJOnUTbbG1v4HKfEnOzCxe+mKfPUYtFii7YpMC5i4EkL/5IecUMEh/fGDy/l8=
X-Gm-Gg: Acq92OFvU9DsbvRWorrWFizCmkzuUW0UIA/nj/Ni+2+/0ar0+7cLdqteWn4VkYCb6+U
	PQJrSCIp+iuNxOzD1P5dG8YYzsBaDE6NUHfy04eJsetMbw8yJLbhWmOy9j4KclTbM39Of0NQzIw
	wQcgcgkdW6ch28Sdo/PWfL6XF5vAnHfWWS/m3vABpdHLDgNFK9eTi9KIvn7J7zgxigB2fXBar5Z
	FdmTOaeqd3F5CHmmkQjpW2lnpT73lQX+EKCd8uCCzVkXz+LTFxebZBmICxHMpV46gv9L6oxsW1l
	F81r95fe9rlvsWR+31XRF1+Yf60HivnOTvWzDxXmSWp+Vtt7v8mrtHEnfN7JKfAHAVIESXXXhvP
	8J5ZnXDcaoVGHE26ezoC8i/ft1K3VjYE4x//TcyPvrhonqtsM6duHXfWdsOdm662D/tj6jXs8SO
	D5OoKg0O7fUKHpCMpvscgMmRU/QhCDz/KE8qC0ycjpfjXC+tgxx3LpDTxCFy/evWI57oF50Nr5S
	jhzlXER
X-Received: by 2002:a05:6512:1241:b0:5aa:b6a:7a8c with SMTP id 2adb3069b0e04-5aa0e7755fbmr794712e87.43.1778837555450;
        Fri, 15 May 2026 02:32:35 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:35 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 09:32:30 +0000
Subject: [PATCH v2 6/6] firmware: samsung: acpm: Add
 devm_acpm_get_by_phandle helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-acpm-tmu-helpers-v2-6-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=3069;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=V/zAmCJSjPS4lESeLMnCYH+wKme4wcn13reVAfH2wSY=;
 b=InTs9KReVdF2eoMfw0/biWdc7G3Bd8Nh8MxuA9Gg5UmfB4Osm6mTlKpQfuXozSCoIiHD7QqQe
 acV6BXVoUDbCnqsPo4ZPDSLBCkon0f53ViIX/VdTjIn/a3bkutA2HBs
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_023237_858225_0F4408A3 
X-CRM114-Status: GOOD (  13.11  )
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

The first consumer of this helper is the Exynos ACPM Thermal Management
Unit (TMU) driver. The TMU utilizes a hybrid management approach: direct
register access from the Application Processor (AP) is restricted to the
interrupt pending (INTPEND) registers for event identification.
High-level functional tasks, such as sensor initialization, threshold
programming, and temperature reads, are delegated to the ACPM firmware
via this IPC interface.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c             | 23 ++++++++++++++++++++++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 2cebc5456968..a663e15fbad6 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -857,6 +857,29 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
+/**
+ * devm_acpm_get_by_phandle - Resource managed lookup of the standardized
+ * "samsung,acpm-ipc" handle.
+ * @dev: consumer device
+ *
+ * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
+ */
+struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	struct acpm_handle *handle;
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
index 08d9f5c95701..83cbd425b652 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -71,6 +71,7 @@ struct device;
 #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 					  struct device_node *np);
+struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
 #else
 
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
@@ -78,6 +79,11 @@ static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 {
 	return ERR_PTR(-ENODEV);
 }
+
+static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

-- 
2.54.0.563.g4f69b47b94-goog



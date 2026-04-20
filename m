Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FE6F5A8A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O67orx5DZUm8BgsTcl5AUXZvqqdjzW17WuxDEAybQAY=; b=BNiNpZb8gcQzpG4G9cSJ5KRMI3
	3yRtJsDsIEp8muVibWNPdhsrm0ZRL1mCdx2EFI6KkTRVJ6i1sMYy+9A/EYPpVElrddeXGgP1Dd2tU
	/p8+wZQ9f10z7suAzziUxQCIs/nEOcl6c7SDwXYT1fQBxr6QPpH7LUlz9R2gpzqlwVbvkasb2Kt/F
	IcEKWNr00qtFAinAyTEmzT+tjYiTWzETl4rGt6n5h4i57I5g2jnZnOwqibBXyKbJ2BpItdjid+yQA
	ec03bAQaToI2U4WKffJsCM5xL44fC4x47CXn++Qu5fz7pK9Df3vOCgiamdMkdhjVOrtt7Yzexy5vL
	9JxOCr4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsba-00000007V6G-49jk;
	Mon, 20 Apr 2026 17:40:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsbT-00000007V0I-1223
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 17:40:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so13031885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 10:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706809; x=1777311609; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O67orx5DZUm8BgsTcl5AUXZvqqdjzW17WuxDEAybQAY=;
        b=BbRvoQFFVgywmp6RaViSkTFh3Fpn3b0ENRLTTtTyvyGTFOSwUYvCRpHGBw1JJlC6wK
         piZbpZFsGYt0Vh+l+sO5WqAkqcYXM3o6ZBiY/YA8a1b3be9mDVrLpz94OhQ3rLJLPsgv
         U4pAP9LldtAzEmdkdofq9XMgB0/8r8Bu5udhR/HARZ0mkvIx+ki1ywwRiCk267IcnNLZ
         4xUCVviWMybNm57aUF0yD+NN4wmygafhuYBAPDCXdBgHcMOLJdf8t/pbzLqavuLQ7Nyr
         9wB2p6oBLD6HGCzefCLUfgMfeGqqemXTJM+YXe1+WF5UZVOmzjWLF2OQ3vEc07w0tmAL
         Y4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706809; x=1777311609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O67orx5DZUm8BgsTcl5AUXZvqqdjzW17WuxDEAybQAY=;
        b=TABlK4hN0g6meR1FJ/XbyM5GjiTsJK1MuDYVSd6VREaaq7AKzb8ghNE79Gcn78Eb89
         yL9G55rw8bZWGxApFiZfHXa9iY0R7Jh+u6uj3RqIQ9OjKlDWV7ZAPuIY7rA75agRmDl/
         ykj21BOkx9ZYHUzcrpEM2KM2MK2xBysV3ELR4ru0feVstZ9y772cRUgW2AG+zXDnNDK2
         aTbJlZ4W7r/+/1/rtbO2hcbQHc3YLXdPoH4U+EVeozHFEuy1bfacNN5cLykan8mYNz9W
         DRukFCBUlRNsU+dG5h0sVJQQuF1xgmRwfTgB2/aCotUI3BepTlTBLApnp0k/q+bjH8Li
         xLQg==
X-Forwarded-Encrypted: i=1; AFNElJ+IjyL5OGvK82vvPbKD9Xn44oChw5adV81skgruhYw9+bBpMi5EuEXJEgZRFvU5GDx6OXsW18HfDI5eB6LsQBTH@lists.infradead.org
X-Gm-Message-State: AOJu0YwVK/PrAvtFw0KPp2JKz/2c0we8Xh0e5J24S1Q6Y7dFpqIkHgju
	IkjgkyURFe+gYavqmMhKZoUwaTJLwtlxxkZ++CC0tp3zwATyuebD7NektYCq0s55DZ4=
X-Gm-Gg: AeBDietHrac0JLTUE2QY09qXjVEeDOX7iM/H5khPEgW0G7PmzSqKL3Ty/8ul4TWykHP
	Wop2qZ9WkjEyAZ9Kw6dCcRnLCbN7Gywz5jgRTh8x9mp7nP6Se/jAlJNqTu4GXsvhrLqpTkU0b2M
	LdsJ2KXBip4LiFGfhNM+kri98TBzgieEjTELPa3NpjNErM3Xt5cj8L557UzM0LdNuTcgHqeeF94
	Pul/2x+9P9ywRwJvrDuCx4y2G7Non3s9ywLqzS8nJ5OLB4OcIyfYOu3SctmCZoLW35ddY0kqDMQ
	jnvLysmK2W1+8RpdE5aw4o57X/4K1dNvqTs8ZzB/6cau1LtyAjAooq8wIyG87edZFTp4kKv4Ped
	RYCvDmTGJsjgVG9cuau0D1uF0pQTCG1tbATIh8h9MZh8+Z+WAnmVhYnOK9SC9+2yKNaeRBQrJhO
	Q3xi5rUOHw/W5Uku6a1jKyOCuwMe32D9s50ayAaO/m6RG/Zt+t6M4eh65pqkTVYq4DOaosyd8Tm
	MXi+SpxvJcRSTwCHA==
X-Received: by 2002:a05:600c:4f92:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-48a0f18edf7mr39490595e9.24.1776706809215;
        Mon, 20 Apr 2026 10:40:09 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:08 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 20 Apr 2026 17:39:52 +0000
Subject: [PATCH v3 06/10] firmware: samsung: acpm: Add
 devm_acpm_get_by_phandle helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-acpm-tmu-v3-6-3dc8e93f0b26@linaro.org>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=3004;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=dBg2F8BGZZ9Mm5Km26Z5eGMyUNSTN1VtnuTwvVrkrps=;
 b=UOAj8gd0XgQFhm1iCBDvFWh9DJ+oBh0oq0XfmalIeylHgCDrLUj+FnH+1NXZyoFoKkD5UBjgB
 DQ3XgDUmwZzDRFlKtsI8+P4vVI/i2hj8MZGg/O8O5oANp006hjIzhqw
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_104011_345358_63227F61 
X-CRM114-Status: GOOD (  14.19  )
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
---
 drivers/firmware/samsung/exynos-acpm.c             | 23 ++++++++++++++++++++++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index d4afd6b535e4..15c10fbb2920 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -797,6 +797,29 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
+/**
+ * devm_acpm_get_by_phandle - Resource managed lookup of the standardized
+ * "samsung,acpm-ipc" handle.
+ * @dev: consumer device
+ *
+ * Returns a pointer to the acpm_handle on success, or an ERR_PTR on failure.
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
index 8511c3c3983b..9df4c514ebde 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -70,6 +70,7 @@ struct device;
 #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 					  struct device_node *np);
+struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
 #else
 
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
@@ -77,6 +78,11 @@ static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 {
 	return NULL;
 }
+
+static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	return NULL;
+}
 #endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

-- 
2.54.0.rc1.555.g9c883467ad-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D518CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 11:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4q7kcb0fMi5Pu2YwTecx4CalpdCzHIy+97zlwqlgQQ=; b=aF7kYa9W3L0Dqi1OJjcKR6wDuo
	OflknxC9welIUUHcIe8nghTbeneJOH4s5lboa1f4+y9FTg7o01xv93Shye8ML/smT7gCu5ymu8rWa
	ZIX1mug6zniKrTdC1A/Wi8TMoa4Y0RExxE90qF7+JJA5c5eOP9+m9h9pyOjc0bSE9dc2vYGIIiEwE
	gbgCivR73rGO0PpKvvgb0PeaklmpLOauaeHEZijnLH2p0AaDVzlaWckNrZIQMb9yBOW0Fwt3a33cP
	zjIEJBLhRKyfeptve916l1SwGO4729/qLu/9ImK0H/cKJ+nYBP77ggamIR1+YX0cdtihXCZYe7IX8
	w7R849Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKabE-00000000eTB-1qdf;
	Wed, 06 May 2026 11:39:32 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKab9-00000000eOg-43d4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:39:28 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-44b052142e1so2677247f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067566; x=1778672366; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4q7kcb0fMi5Pu2YwTecx4CalpdCzHIy+97zlwqlgQQ=;
        b=kzzr8HAYN4KvPow3gY2HjESdKfXejwvkiTAS7ayKDrqCHCg+MbdF6Z3dEO6u6SxtS4
         clq3+0252dZ4FKyBZ3qlYpDEWEQT8+sgvyH8iISGAi7TiNyVgRcw9/QcrNMiBRKU726F
         HwSO4sSbQ489RJBCx9BLlZPjuxeVhrlPYeioww7fXkOTLZq/trPBjr0c5dtjmtcj1er2
         n84YakZPBOEXpVDonw365fAS/4isdOeSFpmIe5h1HXRspYPK/hUrYbFpviXLxrBsM4z8
         jI2PGEwzA47fK8Z9hBmSnJhwzTVL6TToCbHuASbc+spve7ZQYYR339pDCTahzkV/hbi2
         JI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067566; x=1778672366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e4q7kcb0fMi5Pu2YwTecx4CalpdCzHIy+97zlwqlgQQ=;
        b=b3iKFQVrUyVFVLfANhbZZBPIpPRpaDQRJrFsCiwdtPslbKKs7KPGwIEED3nusflaRF
         t9WhsQcU1WQCnESPseaNzT3khODJ43zaRWaxq71Q6a07X2EEnCaneyl6pP4R6dYMbPTZ
         x6cqkxx2xfQvqovcCCDiKPdgJzYPlyRWKr2T9hYwkKJuTe8QwfM943L+XTQongMMwlLK
         5bwNBHVsX94slrPMAzjvLVrYyMUkh+sdVxmPp/Ts76iZABOYtqht2zVF76luQ0IX/bGX
         nM/d9hhQDSpyz0RBtb8Kj7uJh5SGIc+qxtEv7veIIIcUnvILV7OdnSA7uKgzFyzTloJj
         v/WQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PDkqA8FysbpxF7gpxQ5IOmDHwNwwUZGHu+MDvcG7usu/HGD8RXhwdEC/wQRKjmkTD1vtH77iAXtgxef52qrGV@lists.infradead.org
X-Gm-Message-State: AOJu0YxJYVkVYAiW7dxn5DFsi8PoQPaWlcW9C4NAruOrf1QnKlOfwg6y
	bdLj95P3yBUbZscMqYrNLvn7XMIlDfeC09l6bcfWZJM6oqCraw4sUZ/OxV9mFTjC1Es=
X-Gm-Gg: AeBDieuXwjq2OPl1DfD8DmxQgE9NAl/y/V1/Efyf1VU5PFocTul66BMKpXiAigXsem0
	BPaojt7R/SKAC3oDWdYMXR/AujZiPVr9lPisMYweL/Ifu3k+3lhI00cNDWVp9peCp++DF9vOgyV
	TO39fBEGZNkCW2DC95mKZJ7qO7jQCm4am1wcF/h7CRbE2NE+HePTJOCgo0V0OtL21zUvD8CLOpG
	pY7+krodQWpnG/WL0fC6D4OorBN3meNKJ11CAs0yHAtEO41/Mf3HW2JypkbWuMOP3E0bVRekTIb
	eLST0XfZgIIGs4SqNtTUfCuogh2q+bjKt+84rZadS2uMJN8q+Xjt/QZixqGCgbQjfi35ND2uWG7
	X+Ax8ZpYhKKNFRDkhKdV4YaSBnX/Pk8donLmvF3ZS9AgAJuXviOGEMrXvXe/bkJE6PTuaZAxPyu
	NIrifjteU5uEWuKTP3q0vpi8YflpEH7idfiCcfd8gLCZKCm2eU3gaH1mUhQfO8btfYQftWNCVsT
	tUG6rfFntwcwC9ie06K4yNNQ5Wt
X-Received: by 2002:a05:6000:42c6:b0:451:6a8d:e774 with SMTP id ffacd0b85a97d-4516a8de7a3mr3101276f8f.1.1778067565966;
        Wed, 06 May 2026 04:39:25 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:25 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 06 May 2026 11:39:08 +0000
Subject: [PATCH 6/6] firmware: samsung: acpm: Add devm_acpm_get_by_phandle
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-acpm-tmu-helpers-v1-6-a9cd5daf8355@linaro.org>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=3014;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ixgrXz9GN5EhUvDPJ28JgskjbIJslRyhesZiWA23f/I=;
 b=f/8MQczFVqs1m38YFWFXyGRZ8YFS9xYx7+0MAU6sUUFpkMvkBSPCNfMwpYRWjgw7yCQ1ajQlP
 qyIQAYzjkSbCZe7EwVXEnD5bggQ92A/a77SgnUhU4fr/gmyOdJ0dcCW
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_043928_043162_C97E30BD 
X-CRM114-Status: GOOD (  13.16  )
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
2.54.0.545.g6539524ca2-goog



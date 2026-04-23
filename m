Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845F9FC0347
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 15:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFRx8vQlRrTBYadIbF6D8n4BAlzLtgQdTMGBUepLq/s=; b=XP4xDSSKQ7UMrCWSlAi4cAN8Z3
	UTbarEcTABAXxqQ6xDbqXxSNtltRgioLVTKlpWlGnH7HxlgItwSaRfZEURUXmHweg+1UC0FFDPf87
	RaD7uSv97vikeMSmZwrf8HFtZJvJvAqe2jo3nsFMhWPEd8NDhWICj+cgOmkWdjarZvHScImQOoA3j
	f/LaAluNgUlP9XJyRUGLk/qXTKG4RbEwQvsIOy1LmSaF1ObHScJW8yO42ArCyoupdJpFzADbhMZ9Y
	vnKBeiuBjg0CInNqv//2K5EdOSu++52i1zI7Z1Bb/HzV8WRFY2CDatkF4ZxzBiLvLRVIlT9hVJya1
	rXuXettw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtm-0000000Bski-141I;
	Thu, 23 Apr 2026 15:23:26 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtR-0000000BsVo-2VzU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 15:23:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so4243151f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 08:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957784; x=1777562584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFRx8vQlRrTBYadIbF6D8n4BAlzLtgQdTMGBUepLq/s=;
        b=A+CZMFtsEeEQIhhFJSe7Vs8QXpsyoGRnXSO0hGPtRBEBw/KZ2vwLyBy7wNlUpG9X1Q
         QTj0BsIZDXsloGnQfHuiE+A+1U0mReXAmYiaTp9OzsISxOqc1txS9huJaaQ9i2VgXbpz
         D2+cM54UBW4/k+ATywAG396j7rkEKBn6dI4uopDr2Ulo3HLHu0639miqcwFj3fsQqi2M
         +d9xlwMO+ojCcETu29bSm6JiV6Nj0yhJzYRvOdo2JYg+F9u3Zf/2u+UHFwsimptE9FLB
         AQxJEwqhaiM/0ve5QoMHKfv6hh1WsYsNMRg8vvHWQUAhd7tI3p8hq1kRmyJvQzRuQDLy
         gHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957784; x=1777562584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SFRx8vQlRrTBYadIbF6D8n4BAlzLtgQdTMGBUepLq/s=;
        b=k85OFXGAEWzT7O62c0gNdDQv+BWkO842vPQd7Zz43C5tecQO7MR2KLKfXivcVTZSmT
         ktuORsO74EBpH8G09kKfdQxP9xSzdQkC+NQB+GowP2pZ3z9go1duCKxGqB5mLLLvfWmS
         ov+XKy7ZS9coaYR4o9BA0YjYUepiGj1d2i30FpXhB6WYq5eyInPJtK1F4ZQxRCTIp7Dr
         J2kx6CvQn/Y9qBm/4MlU9NaZa0CpfRtdzHV5PTI/Ri3q2TMehTmJgylgXlzzbB6BeESU
         Q8OlrsuqYK3XJt92jTX+kbDEvwhrhIW9fPAK/BOUMs0Bq7EALy4A4o/zfmpjL3G7jpjX
         jAYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zTfb1FnDMBochVZ4pRRdA+sCtCyqppqoTPzTFCJDIOnEIOvjwjMatLu29HLmllcDRKzqMi4qj4JcDGBk6KFnp@lists.infradead.org
X-Gm-Message-State: AOJu0YwGxGav9jsUBwfBhtwfLMRRPKsiiuWfql4npFxi7aI/mlqTi7ul
	xs1GqXVoaerTncwfaSdAB96IOWpIrB3e6pJ1Om2KvV/W/a4WR7Ag7L793ZYrZjb6kuk=
X-Gm-Gg: AeBDieszhehW+x3NyRGMisnog5jWL9AJSUAF5iimRkbcbNefS/+CbhtZGSI7c8hgJ6G
	24ebBHudFBEd4x4aXs0RR+V8Y3jiPEjpvms8zjJwGLswDs9zyyed6PFvfJjcayXW8AoOy1Ng3po
	XS5Ue5E0KUUQk1ZMg/k3jVwTOhge7AnjrZGiQCGoz/mxCPSlwmYGG9CLmqXyMjs3MQ9racfUp8P
	mbCn7xjI+9jvpK7y+U7mlqFkeANk8ymbHZ2oRhYvOBpX7NxmmSqjifySi+8DqrSwzvuj1hmnAHv
	+FC+WWtpQUX9ja2gP+aytfN5EQpFmjuyhKG54vy8qVYVyR0pXqEXiz+aaQ50af6K7NEwTrs9bKs
	Nju032WjHJl+2hTFOd7Rgl+grnDoiw/ueBYlGHPLhIsal6aQ6c4K5zMj5S5Sf7vuogP5EvUeIEj
	DCvE4+bu+wpR82mf+myMrMNE5IaE8W3BNfKV7htwFdZRHSDEiRpYx581W0rw9+dbrMR3nhL7xhf
	0phSszlR5QO3Xc7UA==
X-Received: by 2002:a05:600c:3b14:b0:48a:52d9:54ab with SMTP id 5b1f17b1804b1-48a52d95604mr227748485e9.30.1776957783700;
        Thu, 23 Apr 2026 08:23:03 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:55 +0000
Subject: [PATCH v4 07/11] firmware: samsung: acpm: Add
 devm_acpm_get_by_phandle helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-7-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=3024;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=YbKU8bNkuqniUi6opUD1cEX17xfpbeAqZSEM023mUjQ=;
 b=gWU8Thuqdu+garSPEjoTkbNiCDA9yevszfEqnNqdri4bAmJgHoIk33bjFw1V63C+yxyWRNccp
 1IZUWsWg+OQBSrbw4xbsja5qvOYRQjVDFPrpXNZYNlcZfXVGIx37b57
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_082305_674930_A5AD18FC 
X-CRM114-Status: GOOD (  13.02  )
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
index 655b80fc635f..6dee461f5827 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -812,6 +812,29 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4859CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oapuTl40hgb4G5/aDuwYBQkElchJu8zWsaiRUCi5VkU=; b=m/LAb/Da5F+M3GzSnWyE5BsY2s
	EtqAgEJ3MUEqWRnBWzSwpy7/4kH2FIPcCZGSdhami8XrTJ9JsQzZ4w4TM5f1g8gdpn7We8HmKB/QV
	IwNkFrqgYgwP+2GKlaPrnK9lY8ctbLd4aE4+SkaV9jtbroAvJg9RxZa0TlbVY2N7JFi97rcoek5s6
	3b7PRMvPRcKOu6g6C8xa5AI2sGRGL6AkEiZlWd4tLPRRLM1Edgyx7MKu12Kc2G+uhmtSrdYl+ha2e
	4DS22IcjbYR7ZjS8nW6jOpDzvX1Xx/FvpnGgJmJcnbL93lXnWnXQn2sTApp0/71GULkJpswWuxY6l
	Z5d3Kyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVm-000000076EL-3yeV;
	Wed, 10 Jun 2026 08:42:10 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVk-000000076AH-0Y6z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:42:09 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf30d530bdso65051965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080927; x=1781685727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oapuTl40hgb4G5/aDuwYBQkElchJu8zWsaiRUCi5VkU=;
        b=feNpll2NEGkanpZRKfFYjRB7qu1AGA5a4Qt3waWGiwPHOI+5CPXrPh7vG7plmTOn3A
         NOHfO/x2559k+LKYgluAJsAwawEwqn5PrKnG0H5e9VWR0sgmqPvxxIgnJkhM+kIVkMVr
         iQ6x3cvluWIYzDcrHewn8fo+KPoVkh3k3Bvfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080927; x=1781685727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oapuTl40hgb4G5/aDuwYBQkElchJu8zWsaiRUCi5VkU=;
        b=TOECQSE7Q6Xdf9dqSssVwfVka1lAJdjbpSZTC6/nQ+PznqVklCiCOkg48BhVkofrOo
         q1L/SH+2DlznKjmzV3XWBAYnb5UtRUxBfQ+HOKF9exSb98Qq0GJXAyrP1PXulK+ntN/I
         dEJ8OcbYyzRLbhfJgjRMLxKSArMnAHNooTFo4f3ToOsBApkZIE8D6V+cqXXcNDLeB+LZ
         CMtxEVxNdVVLAiY64EQIoNpDZLi8uORLVMpCkEy24KtZPenKsZUTonB73IXskt8EH+gr
         7rg8ebbi8qDsk8zPA/iB00uNbvluwLYDslm36snphMQV47+pNk3xPXKfDabRw+/LneTM
         U50w==
X-Forwarded-Encrypted: i=1; AFNElJ/SgUHEaoS0sic5v9XAb82tybrlekNJeaenYXEVLe4BN5daNhRm3Sr+uybAztzUFAUmE1Xpea74bMA0W3+gxmx5@lists.infradead.org
X-Gm-Message-State: AOJu0YzUGHK3z2zdPtUzb6e0z3eqHoGAfhM+LeJ58T7LaWOXAujMZDUC
	SQ8M/9sNQNhtgVQH0L5o8yGhrnspn74vBUMsl4gcvVnlBeFS52a9y+KEHPz/hC/2Fg==
X-Gm-Gg: Acq92OGOYYK6Pm0uxqO/VnoX0vx6b0kBBaWugEhO5WXkpCp4Un8q8aOtlk8dAG+nD6C
	w2JnQDz4HeCZiCibIkyq6AiP6RGRX3jkEDDssq4XE6iG+ftLjsQM9YtsddIKnFFKalFDzvvbzZE
	Uiv474xRNN5Q9xA1v2tQzc0tfxlpD0eJKLs73YcrjfAM/MQmBJK9AxyNYnkCeVkGasVpD60+Ro8
	EeHkG55akJD+wNufrA1h45SBFeBlVGAuwB70YSVm8WHnZw9Rzb5cMs3/VNxTeoHBb9/Q9N1pcS8
	FoHwGQw6fxy3dZ1ytu5ZjPSGTFq83MMgqERKey9OkkG2d07q2csqZBND9O06e6NvJ8ISeXgkEp9
	Yt2ZJ4Wexn4+22G28+uShgJaX4Vbx8oxrNFdMdIuNEKGaC57nOdJ4SGErhuK0aqgANEHjcU2t+o
	JFyk3NWHfcLaoG+LisBMBzJuzQwhpiDolcbd/w1iMNa0vTQml4P80X1LNjliB5CpI7MSTTtTR7r
	UEuTzd/oCJASIIGjA==
X-Received: by 2002:a17:902:e5ce:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c1e77d145fmr269724115ad.0.1781080927559;
        Wed, 10 Jun 2026 01:42:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 11/16] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Wed, 10 Jun 2026 16:40:45 +0800
Message-ID: <20260610084053.2059858-12-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014208_175236_AEC8FA60 
X-CRM114-Status: GOOD (  15.27  )
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

The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
UART for BT. Currently the driver only supports PCIe and UART.

Add power sequencing targets for SDIO and USB. To avoid adding a
complicated dependency tree, rename the existing power sequencing units
"pcie" and "uart" to "wifi" and "bt". The existing target names are left
untouched. The new "sdio" and "usb" targets just point to the renamed
"wifi" and "bt" units.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 49293376956b..a21a3dbe8a5d 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -70,46 +70,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
 	NULL
 };
 
-static int pwrseq_pci_m2_e_uart_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_uart_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data = {
-	.name = "uart-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data = {
+	.name = "bt-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_uart_enable,
-	.disable = pwrseq_pci_m2_e_uart_disable,
+	.enable = pwrseq_pci_m2_e_bt_enable,
+	.disable = pwrseq_pci_m2_e_bt_disable,
 };
 
-static int pwrseq_pci_m2_e_pcie_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_pcie_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data = {
-	.name = "pcie-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_wifi_unit_data = {
+	.name = "wifi-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_pcie_enable,
-	.disable = pwrseq_pci_m2_e_pcie_disable,
+	.enable = pwrseq_pci_m2_e_wifi_enable,
+	.disable = pwrseq_pci_m2_e_wifi_disable,
 };
 
 static const struct pwrseq_unit_data pwrseq_pcie_m2_m_pcie_unit_data = {
@@ -131,13 +131,24 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
-	.unit = &pwrseq_pcie_m2_e_uart_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
+	.name = "usb",
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+};
+
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
 	.name = "pcie",
-	.unit = &pwrseq_pcie_m2_e_pcie_unit_data,
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
+	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+};
+
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_sdio_target_data = {
+	.name = "sdio",
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
@@ -148,7 +159,9 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 
 static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_sdio_target_data,
 	&pwrseq_pcie_m2_e_uart_target_data,
+	&pwrseq_pcie_m2_e_usb_target_data,
 	NULL
 };
 
-- 
2.54.0.1099.g489fc7bff1-goog



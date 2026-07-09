Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C766C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TJQhyYS4M5x6G4jk8p4LYaJRSq9L1d3/4D1LtBYsTE=; b=AB2nZeT4zszToPoVyhYVkPH0wF
	3gqZT0yF/Vpzj0zcaHjZv6Fa/t+/jR22VukINDz1JL/zdmrHiH7zjWrO7BuTlPLPmddzFxaSS1YvS
	iaPNer7aBA/9cSEjdLz3DLae5CGH+b7CKd8TUj6+kqlhLv6hFR+hRoq9h2PkDdnOdJMQljVa5UJ3q
	hf4y0yVuIl4cUk8Kr9zWjIwRkq503wrG4A8MPF9iEDAD/Laqtf7l/7hw8GKHzZ7192gF7nxdIyy3M
	G+XyrBHIRUEt+v4mQ8IXOmWbJOnzTk1lr47iFq1T5AWec+Zb7Bl+7xq2gAouqAnUCxpBQUMeRq1V5
	FJwiBaBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWq-00000001q4c-34E2;
	Thu, 09 Jul 2026 09:58:48 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWl-00000001pwu-1Isj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:58:46 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cacd69a9c0so20499645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591122; x=1784195922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TJQhyYS4M5x6G4jk8p4LYaJRSq9L1d3/4D1LtBYsTE=;
        b=LIKBkCWkA8Kg3KRKCybaNcovv9d03PBMlBQ6KgEze60Yan1aBCJk6/rP+ELMbwmwdq
         v0R3C4D0Do3Q22ReVyTElS/2fdphPTmAbvDLBPZ0w1yfZS/b6rCWFkothlvbpEOFrIej
         monZY2lBXvZ6z8lRSmmzTqmvJGR60DWkaZFOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591122; x=1784195922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3TJQhyYS4M5x6G4jk8p4LYaJRSq9L1d3/4D1LtBYsTE=;
        b=G0brJ/Ii+f7rfq5Bfoe+NATkqB7X8soXM6IZvvQBxF9U3j00Okwmyd8uerThIggz0D
         Ca7WDP5DKfDofFyHept5NEnQ2Y2Dt6AWWPl78HkJVEDlN48m8J0R7jixeiyB4L+QjXxR
         KRvtIzmJW0UnmKKttFrsiq1NMuEQrB28Dg930rHdb93OEO3IsgvUB7iEq2guLG5SmUtj
         hcUL7OQn7yvb2CkEurO2GtzY8L9ZQ0C8kqSMYVMdNfWBvbJHB+Hxqa7Dhljul9aO+23y
         sY+bwV2Hg/a6CBQr0UzIkERJdM4M/HySjOa9gDgCHW8P2r/IFz9FpF6lIbe5qEIMgalx
         bp7A==
X-Forwarded-Encrypted: i=1; AHgh+Rr8ZXLrBdDmB+G9uMpho7cn4Sg7aC/GxchVJ+PkzpFXnTEEOuHMrSFiCdaA3GxodetWDy+xKOYavWK2kQhGj8i5@lists.infradead.org
X-Gm-Message-State: AOJu0YzjuBFX/olyjn7ZaBoO/6KouISJTQSwQ2eGpdf5WWLZ/mebr17A
	Zv0CL3t9SEj/HNbD9rc7/ZXOoo1shzBfVjblNtnwX554oOD3CldWja52Rg2tLjR1QA==
X-Gm-Gg: AfdE7clizNwk0cpYHmID8X1Y1516DRbcfY1AD6c89F1+77OT9Lgly4TqoZcqtw4iAMX
	RPObM3vofMBCmFU1sY3MpVU9wO45f5YCSjuBhk2JhwLnRcw0GWnzb2oFNHIaKKKvI1nguoIEh02
	MBKCHPt4LfgA7lK+pgSt/GaP+GrYNsJb7byMyeEoqfUmnRMaR7TmKKC8H/UtSo5duWusJltSQtP
	nbPZJeoW8TB0uDnWUsfpd3NoIknpeuW04K5bAayTtZSjTZGOgUvU7uaAXuVRCkHl4EZCfLLSwMz
	92aqZLo5+OgkVCjdQDnkqswPFPDFwvKO6bp6HBDfIRqTMN1SIhvW4FUTzMW8v7XCJXr+QF3dt56
	zqqbNSfkycLNb3cr9ZNk44IR6Tw3pPVe5UKQoU/Qdhxz+sR2FuVNyVYpKMhq7GGI7OjeEzWyvVG
	3WijMYLk7qP0ZsidSWkkIFp1yg0+46OgjrnyDPv8i80KKEaMSM1aC6dn4qF3Ltu2tNltcNNg==
X-Received: by 2002:a17:902:fc8e:b0:2ca:ddbd:a19b with SMTP id d9443c01a7336-2ccea40b65emr65003915ad.28.1783591122348;
        Thu, 09 Jul 2026 02:58:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:41 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v4 12/14] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Thu,  9 Jul 2026 17:57:17 +0800
Message-ID: <20260709095726.704448-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025843_384430_DE838EFD 
X-CRM114-Status: GOOD (  16.03  )
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

The "unit" names are internal to the power sequencing framework, and
should be confined to a single provider. The names are only
informational. Dependencies are tracked with pointers to other units.

The "target" names are the strings that the consumer uses to acquire a
descriptor with. As these remain the same, existing users will continue
to work.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expand commit message
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 733190175f84..d67bf275480e 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -69,46 +69,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
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
@@ -130,13 +130,24 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
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
 
@@ -147,7 +158,9 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 
 static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_sdio_target_data,
 	&pwrseq_pcie_m2_e_uart_target_data,
+	&pwrseq_pcie_m2_e_usb_target_data,
 	NULL
 };
 
-- 
2.55.0.795.g602f6c329a-goog



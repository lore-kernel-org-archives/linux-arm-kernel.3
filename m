Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB771C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fMs6AV1DB1/anefBW7A0r/4RRc6OeCs0ioieSwLEU0=; b=rOWX98J1Sd6/2DLhiSuGycjKBK
	JMdgmzOTAWfeqRdTUZpl9qy12RzumSt6HjpupRJenufHoKhlmwTFpbXzDlE416E+O9WNfeU9nf9A6
	XPeOOBtJ99ZnafXbkKUMnUyv7rkJhWJcUrotWxzgmOPlTCP5yU52WJWxmRMsB1fmuMlB2O/ory6JG
	yfykI0iTVoOYAOVmSxuGVEOT4HLMUUxzl7rrkXE755Efbz/nsAJCOqSYnrYRKDsng1g6yZjZ0RPMC
	KYS4J0xw83+x44AmDjPcEGtVVBxezRZTeYesEUzYpXpWAtkc44e4VX5l9GynFHP8AKYfM6PSTs0tN
	jzJvK91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBXK-0000000Frfq-1KNQ;
	Fri, 24 Jul 2026 08:45:42 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWq-0000000FrGk-1wt6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:45:13 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso102262a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882711; x=1785487511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fMs6AV1DB1/anefBW7A0r/4RRc6OeCs0ioieSwLEU0=;
        b=Tn2N/mt/LrMXNKBBeRbZXY9SL/sE2m/TbSQbLHk//WeSMw++TCxyydkcQ+dHJIEVlo
         WZ5YWtYnUnbW674u1LZZq6Dee5xJ0Xpd3AXV3CbwG9Z3JD/dkKc0sgppI1ptYA1B2atK
         UCM0YfyX5UMeawSmNUDBCmduVVulWIdT0qpks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882711; x=1785487511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8fMs6AV1DB1/anefBW7A0r/4RRc6OeCs0ioieSwLEU0=;
        b=T2eDrTVOtmtYiJpwuvmFkcW+vUnjvMVw2zMFeESP5sBQjTvv9l0W7bUw4OXe22dsv9
         31v33ztmlu144jo5fIbXPB+jz0mDwKsmgmzwwYPsk9a4SsaHw5ruHOPYZ9CcufKCcSRg
         WdpRJKQ+0CeVI31/vfm7EcxdUw4mEzFbPcDxttNGoPK1TN9m/Z+sGzejbZJX7unzw0WA
         tQ2gzo3d1Lt501WVc1G43V45jp2bKJ0a3zDrW7IYc0tSbqsNjTtao0KH2v/6JnfHPUZa
         ONRVqxgvR0kOFD80ajIbrxyHZNm+keoDQCu6RYQIkDqb//2HxTVU4H3Zusqw24Lyr3nM
         E0wg==
X-Forwarded-Encrypted: i=1; AHgh+Rok6q8x4KZ0bbs04I65DCU06isPsq1a46YkV2UKimhCrrn5pgICDMb5bs2ftOm5dKr8LHuzBcH1fiPYJEWPWVba@lists.infradead.org
X-Gm-Message-State: AOJu0YwcEKu4FU9b+oPNnNUAT4El3AUADzphg++osOZxCRUckynbsimS
	37rAFbFdU27o7bZ9BLzNRo8y6yfP7XM6RERA6JxBM8GYk3F78+4c/PRu40UuaD0/dA==
X-Gm-Gg: AR+sD10Izx8XXvgsH6qyI7fW7ontyam0yxVm9q3bPCz2SIJSmC32qofzRwADpSmCvAt
	swNwheHTFdvRlBjCFADaLRw7lEmA3RDslbn8q2FV0XOcCFSEZ8aAvUMb1GeUskgVZZ++7zPVpy1
	gORI71515szh79ycD8rLKksFq4nqajPNQt2fg31Qs6ls82UiXij/fd5zognmhoLJYkgG0hfdnyB
	3sxECUJFSb39Qb5J/mUdZEK+rK3fH0u3XETMWrztrdIJ4dynEhNBSz0TXFaJ/4puelXQTnlCHY3
	xKyaxeB1djuaZQmj2dOZISPLThiVW3qW02Jf4xQgeih2zj3tKJW7sSpijTP5j9qrpNHlFiugrun
	cBO7mweQA38v1+nvZILJpO/tahUVloplpYpg8uedT2FigerovGgKSX8tgCOZCHO/dNTwymLcpPl
	umx+GGwprW3KOUaEbPXgAbpaWlvh4a7gs5bTMbvfsV4a2CwVBaed3lnz7zoas=
X-Received: by 2002:a17:90b:5205:b0:38e:e9b:ffa7 with SMTP id 98e67ed59e1d1-38ec6a51c9dmr7051099a91.28.1784882711529;
        Fri, 24 Jul 2026 01:45:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:45:10 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v7 13/16] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Fri, 24 Jul 2026 16:43:22 +0800
Message-ID: <20260724084328.3943997-14-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014512_601928_C7B21D17 
X-CRM114-Status: GOOD (  15.54  )
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
index 691cad0a6dd0..693b0d33f8cf 100644
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
2.55.0.229.g6434b31f56-goog



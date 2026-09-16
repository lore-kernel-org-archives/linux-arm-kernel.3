Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341F7C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HG7OvbliYWQiE77ZMzyIyMkMvjpjZCW/b60QdeLOOYM=; b=gWEUOXRFLUb0/nmKwMWnkaVy4J
	nJslwDqi2nyM2ZH4gjIG9ZOeKa1vlK5oxQJGVRiZlEpSwAjygF2C3ZdxyAfdlj1ZfN53sKZRdfKnu
	+3S2RCXW+COXCSXUEkMJpZPRBvpUH0TJ0sqinseHKHa82bL2rWKCeU7tWcwyJ0YXaC/XSAazfiUi7
	scasGFrUSr/avIr7U2HT/nLaVJIHLBiXFPSYuZVwk0a3Vy/RMc0Zs0pDAGzRnL2oosWs+gfMn1Kod
	lTK5Tk9yt0FYc5/nqiwsZ4DhZKt7Xdd75AuANLeejh+Qrbcj9AOwPFokgyrqudyN9esG8LGpbzSVF
	RDlp3U5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kZ6-00000008enE-2yyL;
	Wed, 16 Sep 2026 08:00:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYF-00000008eHS-0PLV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HG7OvbliYWQiE77ZMzyIyMkMvjpjZCW/b60QdeLOOYM=; b=M4FNmsX3g+wy5zMQbDcCQ18rzt
	1e5EgWa7hU2FDhBIn5lIF+uZbnVv1dJmGX5ran12k7LllF1Hfj/7Em99lKkH5AVueudXUnGLG3gl9
	1OZs5zVFN2r51He7PNQVhHO+BnprpvYENb2Z2z+FSKVl/liOS63Z9KqoDRYMgbJO4JdngSwydKQrH
	W+jrKIrmNgiT0vof2Pf0YHAf+FciAHWvUYWEDLuehvnZS0BG/pWh/frvtRlS7TCmadFtDmRjjEBnj
	4srWyQNiaSQpJOollliU7t834q56Kdlh6hxKYmIWYMXRYI09QIoMRvdh1l3LpXEhzt0XkNQZXPJ99
	6mFIXCcw==;
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kYC-00000007bdd-08Dc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:29 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so483694a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545566; x=1790150366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HG7OvbliYWQiE77ZMzyIyMkMvjpjZCW/b60QdeLOOYM=;
        b=JKNa59DnL4Y9wJAnyTgFpqu3FoIXlSHXrw5hM/VC4Kep5FA+4lfz5ec1zsgtIPiwnW
         qPV7AMe9G3+xzS3Jxj6dZpTyHr5fgwE5STngFRnZ7ZOfckKOIN2gFEoqtqUfwXIJ6TDB
         A/3Y2y1vu3aDkZCaFGKOADu71scWVEqkmsHxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545566; x=1790150366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HG7OvbliYWQiE77ZMzyIyMkMvjpjZCW/b60QdeLOOYM=;
        b=fOeYxv5uh0KqRVcxrvIlA5rWxNNq+ogBnrR9tGmkQ1rj6H2AiBByRmab9eY1Lotq/U
         nDgr0Iy1Vcg5XzPwY9QVfN5fmJzvH5IP8G/vg2NVp5qHhEvw1xlY4DmHm3mxoM9Y4jg8
         tJ7ic4Pzt85EqywjvXMbcV6YxoAuvn9LjT94dvmqmlG8FmcZf09yIegPK5r5XKnsvqOj
         inHq13GpVNwfoaDQ604Ayw6EXdYPLHEbHvBCIGsgnQXERWWqMrwXSv7TE+VWX/YVaEri
         LfO3ZFY1k2fOCApXgSvCaL6/1idEFIVS9Jm/VQw8xMeQEPH52HWLLj0E69DIpvw+C1Zn
         R/jg==
X-Forwarded-Encrypted: i=1; AKwUvBxLVi+ZaGZGgrakkGWDgMrMPf7HfDcnAatEDmYD3QpCkE8N/+z9sRjaO+gSrd+XaUg9xYZlJm9a3vkGHqU+vEoE@lists.infradead.org
X-Gm-Message-State: AFuF++n4ivvVKcAkqNSGxMqE/085gPxQtupdMCBHlCsc9YwXRDzjbcEx
	bjSZzQ0xQcxhhV2ydz6/ixNXmo7KeI1c8Ikw+OTwLHm4gttdIIXgn0K0VmkDXBvLfg==
X-Gm-Gg: AYBFou2CZwvCr52wVOhPjNtCYlU92kRb0miXku1v16Ia7imQPiSylZGa3LXgnpIcqZy
	hYO/rGzUsxxLlvC4TDVnI9wbOqIrJmnMVpnpLfQyelR9tq8fRO1WyySj4vY2HX4ImIq0QewJ8p5
	PklFtgScoPCpeXYAX41xwtfZ3KLOehBwVqmDpQC5ij3reEnU5z7jaXTlgqb3QVLlUJNpwKgsWqw
	tTWd9KOVmJ56rgMBJFrYX/hiINrvBhUX4+vqc9NH+cMUen28/3fGyafoDUkFKgQivyZMirLx3NN
	HJcf2JbKe22+4WLOcoa2/Zzwio+1T1QsRbDkRsSqwWp5bPl2JTxaTDKG9a2veneN3vpwxnqAkS1
	Mtdw4lJthwXY5KZ2XypIAHUZqBdLD/lWPEW5Qx26jBAMuOHCCIA5E2ptyzuOwLfDkbDygsLrnZF
	CMj7Sq14XH7RRO7SiDwTjjZbcfrTOvgkMLpLzA7h8kTq1GIGywcJja14Hu/gvsesbQerP8zqXyh
	stEdONGPf6gAD7Bfn02/UPf/uynU9csy4RFOubt9DufBjAhkVcDXsxZ8p+h3foG6z4l
X-Received: by 2002:a17:90b:3b91:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39e1e380e12mr4028912a91.11.1789545566189;
        Wed, 16 Sep 2026 00:59:26 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:25 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 12/15] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Wed, 16 Sep 2026 15:57:38 +0800
Message-ID: <20260916075745.3549953-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085928_212853_1FAE82DC 
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expand commit message
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 350a4c8831f7..499cfd291a39 100644
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
2.55.0.1032.g73a4cd73de-goog



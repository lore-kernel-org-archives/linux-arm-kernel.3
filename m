Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2BCC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fMs6AV1DB1/anefBW7A0r/4RRc6OeCs0ioieSwLEU0=; b=VNS3G8xTm6GZnSZO7hB4W0imbZ
	JtAOFaST+5CzEbPlcKx3WBAaPTz0wFvX+6iMJJMgHvUKYeVG/3oMBljS+3e0vWOPx40RmPQmkgf1t
	BV/NvdQ1MZxSCl39Q0OB9mBoeyoiJl4YTwwlqeM0cfPGN6Wx9qhxxp4Afc3oo9sM+A/ev6KgRayEK
	P0fsbzG2bq1emzyvYna2vu9gUtpWCTmTp0P9qS5+RDUc9MT9G/vR03pCF/7neirPFkH+rz57oR1Ux
	54pToVBpirmu7yeuEgv/X0KVilO0n7Aje/YHGoU/EVLC9Yz/tEMUIB7NQefsOboH9OHOQjyJrUfEC
	QJ6RYP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4OS-00000008bCd-1Snt;
	Tue, 21 Jul 2026 06:55:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4OF-00000008azx-24Df
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Jul 2026 06:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8fMs6AV1DB1/anefBW7A0r/4RRc6OeCs0ioieSwLEU0=; b=RVol+p35i21F4BiNKU+hpkfd97
	q7qJBGdD0YHpRbF2YaweImxqxxLd6cZdi8gjLydYFRrzQbZ642g+4wIbFTzdQAPkJJXRWJ+gRmdEE
	aQnpQMieJNmFnU7YAmvUXMN4fSFW5KTj5HpoWlK3VMdSxBW1KHOxkxXEXPz2WD0Rdej4FxGnBRcKI
	JR7OJ3ymSYzygKbpJzFuGbaJZGkMmDylXnda8ThCRVTAId77Q+Qarz3rDPk6aoWtmMUZuGD5/Wc9J
	WPYHnDkyz49WhPh3LoogpgsJRJCn2WeGA0xKuJoe1IxSD2vEKU04N8a0kRizhDLrKm1BYPP81C6vA
	Ltzedw9g==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wm4OB-0000000HGYn-1zdE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:41 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ceab75934dso115010535ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616937; x=1785221737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fMs6AV1DB1/anefBW7A0r/4RRc6OeCs0ioieSwLEU0=;
        b=YRCG3CIzjg5fPWN4VnykzNgSRow8xtxaMTJ/RPuKpMnun3gl2qEoBh7Nm3Sfp0S2xS
         YICBZGEwJSNeVmA/cuYsg3PXrMgDUG+j0N656dVNkhnt5CLADovRvuGkXpqMTqAgQk/h
         +gsT3ehn5L9dLNOwGafOTEwKNeZ0Tg3LN6mqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616937; x=1785221737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8fMs6AV1DB1/anefBW7A0r/4RRc6OeCs0ioieSwLEU0=;
        b=BtFm4HOeS0Z/dcl8BRXFosx3Q9SWsFUSfI0Zfkbz7bSD5ot9RErCVDvgI3QWjPGghU
         ZgHXPLM1iHTRcXx1IFqePP21JmBwEVL0fv/ADrSBfYFrV1+k+T/2n84pNLxbp5kqxH+Y
         y/j5UimRoEzdD7SGels+7q+YZtKSlzXTtIEtiPXA9xTxASobQ8WK4qjPXohDn2VUPGLG
         x5x98d7yxV/PPnrOcYj1JgRNbOgjVGX0GzgYYLOfloAVOXdlcv5A0c0i2n9I+mLEHJkX
         Pcmcm93Imv2f+FWEDXCn/cN5uARAGwEgFePZiQJc9hPFlr0J6Rq0QVkZx/lRPVdIO0CJ
         sQaw==
X-Forwarded-Encrypted: i=1; AHgh+RrF1drYtiWWuXZ8b1IvEoiJIkqn2IHcF77joY8ALd6VHW0PMToUDhpeOgmN8HQnoYasewqOqETjbs5t2ghW8NFm@lists.infradead.org
X-Gm-Message-State: AOJu0YyZrQ/XHXgvo7k1C2ISDLRNLwoSY2TlwW0GD/xhMv9L37IfgK8t
	iHeQnrsf48gId9CkXGFy2cWp8etL3UqCUWTcW6cyPuyWwf7sV2UeYGHt0hUZoYbMXQ==
X-Gm-Gg: AR+sD11xb5/Fc8IHqbwo28cISld5pBPx49dBA6ckt9fQ1ycsotksLLA2zBzF+/Ghmfn
	2Yv8JziRLkbm4/6xwnxssPsFhL3mQK8RHC6KAEtaHnBOdd6baIVEkOc641P5uw7QpLy2IHY9+Ay
	a6oLtCZvDUce1BsrtwMf4mdJtlRUlDjw55I/Vj34L/cfsffWCRi6/Xzm8iAUjAM92LlCb8tNZI1
	LF1rXjDtVMsGnbI3Blv2zcLYvvnNP+uOhYU+2aRtWkc4KALikw/yCxxQ8C+biIgnmNt2X3abwt7
	qE1klTMn5EX7iOnzaNW5CDB1pD2RaqZriCsUWrrD2HDFgb0BWlht1dlGugzrucGyOW+NbW3MsmN
	fVRt/XGC2SGl1tXaREsMU1bKQ0J3EcjE/KRXQUENxlXqePofbglUaFLIoG/5oq4Pc8Bz43g+giL
	qnmxYit6ZJTbPwdANco48YNyGwjj5WQRWk8UCQ7swZV6WcBV1hC8mtP9HF3NQ=
X-Received: by 2002:a17:903:2c50:b0:2cf:47c4:3d1a with SMTP id d9443c01a7336-2cf47c463camr154543805ad.3.1784616937260;
        Mon, 20 Jul 2026 23:55:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:36 -0700 (PDT)
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
Subject: [PATCH v6 13/16] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Tue, 21 Jul 2026 14:54:08 +0800
Message-ID: <20260721065413.2306137-14-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_075539_844175_32F538DA 
X-CRM114-Status: GOOD (  16.38  )
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



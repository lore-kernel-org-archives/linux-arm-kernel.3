Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30984CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkMXWQOY3SYOq1egH+Z6kUsiL0nTYxohMUH/RmfCF7Q=; b=uERjq5sh52J0Y/l/R++TqQTYr7
	lBHcBHetLoDv27chFcorUo2PwoVX0W/gyHMiOsWFVx0Ad3phoJL4JHLYjAx7iOSFEhe+pM7iBqGvq
	M7F+QkKI6LzHB6GGWcdPS6pwpr1KLsnacZPet54Ow6b1Ee0oGqKo4mmWji0vFB0hIZxX1rAUIr87d
	tjHRvsSdqxkGpeP5iat7wcyGBntn5agdegCn4Et7mMkceZuffIrXcxGkjnYoo3e11d96q8oOBzef/
	8O9zIm7zscDHzXHTpnK3yttbtthIyS6vhvpKjG9iGLnNFc6h2uDbQl6/6zbLHP/MkgbxynLGm/Hm8
	NRljRZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoR5-00000007oja-2BBj;
	Fri, 15 May 2026 09:02:24 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoR0-00000007oep-3LiZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:02:20 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so2232270a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835738; x=1779440538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkMXWQOY3SYOq1egH+Z6kUsiL0nTYxohMUH/RmfCF7Q=;
        b=fGVCcNgdZTNGfeScFjapOIw3i3pLZC/4PyuWuMs0QdquFsXSrgbPmWtEpbbu2ZXPNO
         szM2giQckN6HXmFDOHfkQRUyRg7rNI+ADIxqhIZd02DCtxzGR8C2dxGa8lXYorAv14Fy
         lxVjfBpHGhojAcJZEJfTQ3eKcrAFZjl5HMtbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835738; x=1779440538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lkMXWQOY3SYOq1egH+Z6kUsiL0nTYxohMUH/RmfCF7Q=;
        b=lI0q93bA+q2Otp8turYv8Y7Nc9YUk4p2V4I+R2/+GrcqhypbHz9F2nMf6PHl+uI/Ux
         uhz7vRC2P8s9hWJ5q5gra2kxRqFKiM6FeDLMVm/H2JcLxFsXJaRTCNxDFimw1XlDLQ2J
         XP6RKmEzyouihfILRcMTvKiPSTDKnKu5XaghD82lwRpSTU00PDVgqEa04J6kpY3qk53I
         vJrNdp+njEd2MSvVo+xCXrjEFdPXwJ/vbivxDm9FT3hYyzIardwE3flmKlyVAbFYx5yn
         xh3rE8gBLfPlyU0fvSHkU7VzuJy6nuHglpA12cTb6I2qmC0+BuJ85iZJMKl1xLV8KuyW
         gvvw==
X-Forwarded-Encrypted: i=1; AFNElJ8sc1AiQNCSnyBJAVOFxNkQIfGa13PsaYNviCPj9OZGgt8iFQPot/eHqApONximGvuPFnoRS6nUvlZTRJ4fAui7@lists.infradead.org
X-Gm-Message-State: AOJu0YwuBQvXRid9vUOBNvTd6AglJT1BIYfeac0UXob1D3wqHq2GW0Wg
	Gaks+OnEjieH52p1Zew6ZGBIk1+eQRF0Y1+tXooLhjPkHUDBceUhBRD9jI60qlM7IQ==
X-Gm-Gg: Acq92OGTQmo6XIYw+cRhMxR7vJMQ/6v1/CX7SHN17ywPsDMXXcx4vIuo6RUHmtcYlME
	X/5h1pABGbU6HydlIUxDeUucYi0soeGN4IRd7FUb4XnOW3TTOD6fNaXj83NT6b+YHaRlcnYNbAM
	3u5X5YuUivJ6nlvynKkwpacd92xLzvcSIJBcTLsI27DlAPzD2uRzExD+O3MYRgMx+MULbPqmkae
	IkEf3EJQ/g6DuDx0fAYekfwIH4b/sBAGNyemepxaHzc70oagsZFEib0+T0WEvyimsCRsJp+ELG9
	5girzVbja+JGKqnLTP5jtTfmwPE0MReS5MwWcglWhDrRv0YL4/jRUh8YhNxAcCE+GG+sIkrDAjs
	jkMxQFjVHV60xNU1oDIB7ZXirkREnf8s2jeHajHCxFlfWdAoOJ+bPP31V/RlMVdZM60tWwDbL0U
	zgPp6h9HfFoWsMW8cyyYQMumaGg0cZpYusW/t8fM9/HiVvUFoGCAZMrG5ISzR13iS4s4kb3PtDf
	d8Tr61LsVoiTd4mDCM=
X-Received: by 2002:a17:90b:5744:b0:366:159a:c17e with SMTP id 98e67ed59e1d1-369518af9c4mr3451493a91.2.1778835738088;
        Fri, 15 May 2026 02:02:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 03/12] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Fri, 15 May 2026 17:01:39 +0800
Message-ID: <20260515090149.3169406-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020219_580419_DCA80000 
X-CRM114-Status: GOOD (  14.92  )
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
index c9aed2c02e81..a5585f000ef1 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -62,46 +62,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
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
@@ -123,13 +123,24 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
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
 
@@ -140,7 +151,9 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 
 static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_sdio_target_data,
 	&pwrseq_pcie_m2_e_uart_target_data,
+	&pwrseq_pcie_m2_e_usb_target_data,
 	NULL
 };
 
-- 
2.54.0.563.g4f69b47b94-goog



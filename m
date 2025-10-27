Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547EECCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPXw61XXVZPE5iGSa5+dbW4T5B5jPT8r8QbZD1R689Y=; b=sc+OiQYT0cdjt107Z3zKQY7ill
	cay0gH3s/f+59mCEszcbK8LfiA3xHBRyV4oFqS3CxX3HJ44Nj1e3bgyW4flZSE5ircD4EdVni4pzg
	RNcooe924R79jeMP7GS4n34bMK6bZVsHHZMkSo36EFpcGqUikd+/h8MF4p+LHhB2Q4giMhlC+33Hu
	C9ZzcxQZ/Fp2COQhKeYeNX9BhBO5Jy3OckUtZgqJw1LTY0c+zhihXJLWyBCKMeITYm+LrCSGU3KQn
	BeCxLOGygim/At4/L6eVPxt8U/SW6errPdsZ0TNmRjrgA0hplDTgAcRJ7m00AiBEfALjlE7vpK0b1
	yXC7wF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPPD-0000000EF7I-08fZ;
	Mon, 27 Oct 2025 15:45:11 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPP9-0000000EF5z-1iuN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:45:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4710022571cso50493525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579905; x=1762184705; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPXw61XXVZPE5iGSa5+dbW4T5B5jPT8r8QbZD1R689Y=;
        b=Nm85zCEwZeT1VR7MC6ugB+Dnh8GYOyWFQBYVdom0Ic0rQAG3AHyS436YjzUxE4Yon3
         7HOirSruUwEWCkOWrMdR86ysBZeVDeOKja1QlPECJdJT1GqA1Pm+5bjTnLKUuGwJ4TQx
         tGNbuNoDrFZ7QKOCu6ZEgpQr7/bEVLSBV08MhWil9sNLPe8hx1FoJZqq9AkJK5aPrAfF
         Rvj5ZlF0pcjYZLKf0n9WYPueoSEhL3yr1hPv4bWm2LhgOaX5YX29vBoA3Yh8aGMWBHZs
         1uUfGkj6fNe5QR88wGkfoi1WEUeupm4TqEkpvRXBRfk08DZHb9RkrB02uCtoq1ieOt/g
         dMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579905; x=1762184705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPXw61XXVZPE5iGSa5+dbW4T5B5jPT8r8QbZD1R689Y=;
        b=fi0QzXHXio2dVugBVBt50ds9Llv8vcufK1cazkBAK0ekitss5e/2nusk60lox0IaDA
         o3baqEFaItZHBaH1kWmLrfFsJyOYUwYJeZkDhWiDnq0HQRNnWKG7NjPcOZJQI3eJPSMm
         9D5DGDCM2URo8XNIyV4/ip8p0QKZXEXwh/CqNDLXpApWMYBnCZPGlXqQrJAdkRHe8+6n
         Euvd7bk7lq59YARV+5mKtYoEgsb96nc2BPu6SqM3PzuICxAZY9+YlQINi+luvoeTg2XN
         v8zTaLSr4QIP6fQss+TUFxuR02DsCTIAy76FPVZoC1oVx8YE6ohuJOF9pbxh0st79PIS
         vjHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5W4vBoa2yvoao9Ec7IE8boVle/eadTwA32xUjR2M1wXVAeugXxizI2okyiIQAGi4ciuKpL4XafeLXtsPbcLkF@lists.infradead.org
X-Gm-Message-State: AOJu0YwQrEG9Zz83ne+ljl2ETOlVz4BSFn7xRh6D7MjZ11cAJw9Um8UP
	xTikavTEeNte4hvs08ZCso5Ha6xu10b3Fm8SXfdtUsryikZc4eowEelYzFwJyuS7FDA=
X-Gm-Gg: ASbGncslVFfKLPwXBRvg1BS7MsexaDkomT4GduWtAsi1kDTNSvLKriS2fVBBWi32Jib
	RFRHsunlGPvz6bOrhbnqo21EpwwbVH2idCFcEVn7DcFzvlSQ26yjVT53nyr7e8f6ADcXPwdQJM0
	dLo4NsBv0FMjisYwmTblvH2w2ZRo9Y42YM/gQZXbgkc+23OR4xqifuXhQzj7YokCncZb6WGepJg
	oFcnXbTShyhyBX10k/J957Ln8XQhy7Ps4A78k0ud42KyyuWTmq8x9R4D+Lr91+rAwYUz9y1K9nV
	ayw3QXvEb9vmmXqDurAUi2fILMa/uXJV/8j/gsJdRgMw45DJkO/RA+DqJZO8HcU/DNaAoyOr8DC
	rauduVvDt10GwQaTzjb0nJsIdH8nkbr6ZD61tWJrOBXzg3r8WwKFvDrYh5VrXZMp5jnaOzCgQl6
	G1n0rnlg==
X-Google-Smtp-Source: AGHT+IEGeaS0+QG2Aha1NgT9BPrRrz4NonOWyil4rVeyKXTgBzuqvDLGB5Q4ZzRtF1NNuDSXdfB8XA==
X-Received: by 2002:a05:600c:45c7:b0:471:747:2116 with SMTP id 5b1f17b1804b1-47717e62ebdmr726945e9.41.1761579905524;
        Mon, 27 Oct 2025 08:45:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:45:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:50 +0100
Subject: [PATCH v3 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-qcom-sa8255p-emac-v3-2-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vnoFLVrcb6l7nKIGlK4OOB/YGlbBMeK7LkpWKpc+pc0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N7HQYH3vFxPerzcQsvDYeZugsZRuhl7VhVy
 2Quu9L5hP6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TewAKCRARpy6gFHHX
 csb+D/4hfQLnbDWWeEYALfZLjfvHcxj8QC1o1ijyYS0DGDMJ3ieET7R5s5vFXLyeidjo2LB6Tkh
 8xuNaYYnOMXK012RnFUcfWsqh9VA6dULq/Jec7Icz2SLCkvhUoOz1ECVU8P7/1HgscqZhmPhOrA
 OAVF7sMh5tRhWVl9KR89qFqaOsx3xtcKj1Irh465tlUbN0zClc5WMgPgXvHthIRPi0mT7evAzul
 0BFb8/NM0urZ3Ltl0bA7WAnBBi7dQFlTXlebiWRHr9tRKb1lRD3yOq+JZBOdi6YGlBRX7lPU9qh
 toxfr8G9uzCoO74mRZa3B4nfcbC3XPCMc5ElZCyAizNPH8G9poSOjBCbTIqCtm3liPTitgcCX9K
 Wato94CMw/zKGgD1iH7/PXuT9dUx9nVhoKh4HihhNHyhIFhdXusnBLB6Ef6t0UwNF6lxxZbmbG0
 sbFuan/mab3AyWEcHTXgY0kQWr61TRd61v7YFITF6W9l0sfwuHXbcDKUR8LRrP3dd4pr4IsNNwd
 a58xY/CshZ5B6P6t4DUaz27fECD5yhDvH1034dCAf5VZCUSjfXtpsLy/nyoaZsZXDJsYSQARDry
 sMsM1CFH/f6CYRh1vjyNCQgrB0KaYJGp7Iwc31evTSdVWgJzwY4Ou/YG7ueRtt4DzQU4AZaAjgA
 sickoFDA15UyOgg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_084507_914799_5B254431 
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 716daa51df7e50e401e2c2ca305055dc52897793..d27733b8a05a393ce356543c799da18a6d9b9083 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -134,7 +134,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d1e48b524d7a964f229e2bf28e7a316325726193..b24134923fdff0de8b608c140dfb8ffaccd19303 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -762,7 +762,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -813,7 +812,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -850,9 +849,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.48.1



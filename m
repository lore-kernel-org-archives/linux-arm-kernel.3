Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4102CCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ul8GBU+O+XdLER6XCbhZBXCxZuiNlzEAtMGpu/p1y6Q=; b=LOCF/vNiJi1OYgse9AXaw7BsfH
	LodPDq9Sog0+Aq0r1E7SXpq3Gmnoecd76ck3CA1GsA6CBOmReo6HQtqbtM1ez+uk/nO6J5yxHo1og
	hPNez9VdehKqlEP6L4err1AHgTDARRbpZXeCIPEbj4FmwrL2/uuaJ9dcOgKZTZ2/JOKnHxpg0BVC+
	89y78TVTR5bKsZqDi/hsKmElN5kYje0RoOc70Vh5EhOoxW4ZvPJvmbWbjGrUI+O7qmLuJzNNfG0ME
	6pfm0sMwZFKaqKa9rFIbw1Iz1lt9YT/mktznw+A4i2gYkmN1ELOgZ4QSLjD/tdpPJ91keFol74oPE
	QycXakkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PNB-00000003Qu4-0Gq2;
	Wed, 08 Oct 2025 08:18:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PN8-00000003QrL-1XQp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 08:18:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-46e47cca387so74478535e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 01:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911484; x=1760516284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ul8GBU+O+XdLER6XCbhZBXCxZuiNlzEAtMGpu/p1y6Q=;
        b=cS5h2WhtP7t21uSS1TRbww6ryYoilp55yRdTfKSf71+OETuMu7bcPKdqQ8sUGJWaho
         S2Rfw3OXe61vE+pPsmAb9VQ7UDPXkzvoggl0+AUzdbOW62lxxSbfmLHpsMnOFpmP7DKR
         LjEENoBa/9UjAZ4REqM47x3LIcCQvXLPpvQOEHqFdxsXlY2Oh2r/louI5CfRiYwSdAtd
         6OwQiUx3bXM2e6qIBuukMKcUSwIjGlfigogdmVukO8PaxyjisbhJnuZSbU/uKXYTSgcp
         4PWWSRk9VIZBZi7aMppRk2Po7xy5xufYrgfxFDBEKOOaGpTRhiIReqmTxwdIExR94r33
         Oy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759911484; x=1760516284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ul8GBU+O+XdLER6XCbhZBXCxZuiNlzEAtMGpu/p1y6Q=;
        b=spQBtDsaOpPCQx6w/Q9Y2SdsovvhU/Z9Og3GvfXuf0hrJxd+da4IQsfultlbfqMU+C
         uBJxfr61BaQ3QzF+9TRZi2kTysfKK1HlnTu7K4FrJdCDgUYePR8QwYXxLCLN6JodEj3/
         Q6j3s0OWW865ka5udA3CBAqBTEI7w9+czLCCTxHt6eEJEfwaIS55HxOMT0Xh6KZlsAAN
         aV0Ni2PHlOQILYFlAhxmG4VqbUd1wbdX7wW3PKmNMsv6NhEn9FyfNRgL1k5jsx3R3s1M
         8dVGSJcRzGeVEnf2uFI7fSeNMO61ouTZWTiPRuf7fAKTaOV4GLsIF+nTG1pFlYsUb7Kt
         gWRg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Qn2o3TrkcvflzMPLt6Fknm0IQba8Ia9Sg9lpWbdQG599NylN6Kb6cI+uSdIcdtZ4XWVhGLcjgjwrtighZM1M@lists.infradead.org
X-Gm-Message-State: AOJu0YwS/V/btaKk+GfL633uFtnqTzhS54gT9tITSGQu7j/unjL0hnBq
	oeB5FM67bW1R9WzU30sOVcynnMZBhSrjqfn82KmhSKRqwHUCnACGAtiCX8JtLtstofo=
X-Gm-Gg: ASbGncsdiLvtsYqiFwAKznTrPGJyqkFyc6TGmocZxRvsyFtg+ZtLkLRjpdxvLvn/5en
	cpMWda+rnvjrzRgiX8BU1yoHNwOTVwYx44OoBSO+BnxfJS3XrSi6yZaiq+BFLnpYzWAaLfwRtPt
	8my6MLVVepPRrdr9oU+mLEO/TRRn9vhSsJexRDWHr9EODYz44GrT772NHw63r3SEq+wubpZnNPd
	g+IMbI8Y61XkjglV/o9JODJ6fERdN8FU74wme3y5Wp9x2v2TEE/r/PxhEnyi6hvYGdcbDFSx8dy
	xwefBn1p7X3kERP5Or8wDBf0GhjBZrut9P4L/aSef7FXV2iLjLO3VfrrYcEreAGL6S7KJTidtsL
	N8cpgG3yT7ZaIQNRA81j7ZDy4u6WRU2hkCfLmlwkDwQfiicf8Fih5
X-Google-Smtp-Source: AGHT+IE6ZMyLcsBN0V50RlzjIFoIQLk9iOg6oRiNR5JvPii+uUuTFdHwXGEV0hlJlVRQnaGtVLEXhw==
X-Received: by 2002:a05:6000:60f:b0:425:7589:2737 with SMTP id ffacd0b85a97d-4266e8d8e67mr1317470f8f.43.1759911484416;
        Wed, 08 Oct 2025 01:18:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:18:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:49 +0200
Subject: [PATCH v2 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-qcom-sa8255p-emac-v2-2-92bc29309fce@linaro.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=D247/I9k9+jdDafl4QuGSA0//M+k597SsL92RQwFhvk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h413esbXqnjuND12yudzI6EY/1g9lJi/uRCy
 Uuv9fCwSSOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNQAKCRARpy6gFHHX
 cpxRD/9UQQ6GsDEhCf2230he2y8bhcrw003wd+e+aOxvP1HQjx2HrvP/Zh1enLCAxqMlTE4Ipiq
 c+UtF6BPiuYKaa62kQx3y8twflIjh1bFOgQCKz0b8Kps5yLsS7lZwX1dSRrIvMCWPxrXJtqXWvx
 HNlULSdJR8x9p8IXMGHCG5rEOSi6Mgo9FsIq0rqbVBwUeX06kOe7pA2ssdvbr44P5KecfrBfnwK
 a6/o5AK8MjJZjOLhhyzuigM92jp4W/KA/qFSEgdRcOP9mSlCaRvV5F0Ibraq6o8b8UZGPWo6HQs
 N11vvaBgINRZNs155aKWFaBuUYy9WM+GJ9+gp8PtR9GGZ/cCVnyar2uf+ZyUemeaa75LyHTuqCZ
 BfuXXMZdAxRjPRtMqdz+nd/RHj/S7/0PCafuZj/nWKgKOTBTFDZvj5UlWbGpHugfFbBcqB9OP5w
 IeemlR06TcuY1gdnoz7/WzHAnC5K8ELWdnDyB+7SU9+S3M0ViN23lM3k/xzPL2sOGQWpPzMi5Py
 rx9bsW3PeEHqilRbhNJ/9AplrkCZwL6BuYoXS3FrGwy1etNxuHiZolqfer5Vg5O2ygobzIdlUus
 qVJQusAqdj1Man4KZInD244TGspt8J5sVbVbs7DkDIQjueXTsaHiO0+OVRoK1yx9pnFfWxVj6cG
 M/aKIqen9XWrJOA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_011806_445609_80B90E53 
X-CRM114-Status: GOOD (  15.51  )
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
index 9507131875b2ca05fedcab95a3bb4c7f8e8810fc..7734acc6f1dd669ffec622812f48d355c507fc32 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -125,7 +125,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d8fd4d8f6ced76cbe198f3d3443084daee151b04..aa4715bc0b3e7ebb8534f6456c29991d2ab3f917 100644
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
@@ -764,7 +764,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -815,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -852,9 +851,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->has_integrated_pcs)
 		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;

-- 
2.48.1



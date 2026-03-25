Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E04FEA83C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aIsbSfS605Q4eTkbTgnxZvgMorhnFDaqZxn3f2tTBFI=; b=p3Z64vcGx1e7GGAjxfYKD4DFo8
	em+NM4es3QnSUTD1jOL6GotP1IUB8gaNvRJxLNmln8PS0OckbQmHN+FFS5Ro/aIgLoBIATBzxyhkp
	jMtEVjDQmoQVp/3v8NNN7ZwwoyicqPjlfHih7xpASkJqwMOS9iefBvbyPMiunIqfs1UF02ZWZ7exs
	xmc2syS7eZYXGn1Mc/ZNkfT8NYLXwQ3B+nUt8hbCRjJVuAFDPVFdHJjrAHUUEu9TmC3iMWGrUNr/d
	BxrWNBQKi4Qinas3NO8KhoM4ZCDa/ftCEtExuVYlGjIoiV/z4pfLxWG3+adjb7+/0pLBgIxwcd6G3
	hMXkfLEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kau-000000033lp-13SI;
	Wed, 25 Mar 2026 09:32:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kas-000000033lC-1Q5y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 09:32:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so49231905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 02:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774431124; x=1775035924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIsbSfS605Q4eTkbTgnxZvgMorhnFDaqZxn3f2tTBFI=;
        b=jo0lIdlWdj7aOv0BknjwVh1Me5ySseOs02BsB0YA/wdgvt//vNrQhIzr8q6aLo7qaQ
         qUqluvuPCD1hkWvp93J8LMsqklzDaTTzqj71i9xvsk78SYzzCFJZ7/kBqd4VDin6Q+TT
         Ed0DwTIARQNznx9QrAUqnnOIP8Ulca7CAZW55MM2/LR/Xa/hB5qCichTj3s6qR5DjHTA
         5b0A5rGyAx86F/og+t5rq4PSYWhA7SqQz43RrI7TZnGHTk92pLthABxSlzf6meigau13
         o6pk9nOhJW+AoKgSTe5ooXBogtCxofsCm65qjkxGuao5oKP2SMses3P0IohM9jgrglFL
         wcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431124; x=1775035924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIsbSfS605Q4eTkbTgnxZvgMorhnFDaqZxn3f2tTBFI=;
        b=Qf/asc6fPJkYF33/OXyHwbztN6dGikMZaPhPKcfyPzsEHN9kchWaZcZdecYji8bMvV
         z9/YFoDZWR/a0ixg+392vK69cr7Fje1zhp6x9bXsLRAgg63CG29seibF0VJrGAD59dnq
         r9Ud0v8Q1HpwDQQTp4FLMACco5kWpISixHMx8a9omGLrEyQBMhdM0NZwYngioek4P4L7
         yd6Y2rAFl7UkasYIZn/ZYiBXxzu2gaIiwyEB8neemE4QvgVaLi5Wjk+esG7R3ILpTva9
         lffG18mnT3zWFFb3cfxN6VtWzq9c5UnN7zwssmGiR/4DilBsT2Tff8dLGn+t0rbB0Icb
         3XQA==
X-Forwarded-Encrypted: i=1; AJvYcCXy8kFP1udfdTmEo0pd6Sct/oRD8P4j7FyxrzUCFNTkA8FVy4BRx96PQ+uocihNybmG9KxhPuHSxwiyiPV6QgQC@lists.infradead.org
X-Gm-Message-State: AOJu0YysapBCalpEpk41nNPHRnYFjgVTbQ/xbuwnv/ryEjYrSBK0vkH/
	D5TVExWHw1urnqOAAsq3UfoZ9+HWykU71FNWbQ2c04Ix1g0zDhVF8GAw
X-Gm-Gg: ATEYQzwMv9MnMbYxs/g5TSP9tc3BiJNBIRPJ/UFNL3bY8ejCjAnC1W/eQDunkfzuUr4
	J5oCth2INytN/7valLuNrfVmVNShB0Fo7V3VwlitR2OKFX3nyhvUV5PPWugLcGfYyuiGsX+ykQG
	HM8PmzeoLa5o2gDL7GrgQcDfZBUzlCZxrZ3tiOjg8yytrccJEg1/kvTD7+k2F6rRKHx/uFGL/my
	48HhpO68vJOjZRCBJr4tByrIOVdM2xsc1ZXFVILOqYR6fM4hcsy1hyx4j12jsC7g6mQIFGC99x5
	YRk8wLUrp5vEo5lgHaPjjXr4+ooQrb/d9V3UCw5Vf5mv3tzbdud8G8Q2vLjsWiHBfUe13rnQ2un
	FUwOFZI0bt3tQ/otcoM/F/G5Y/mpzBycGYKMD8olYAM3iWspvzXmoBPWkNnlilMejnLWH7HJPGz
	3Hh0G1emp45idgZoK8wV2n6GEO7gwz1Jxmpqf5DdD72POzQfoF/8bPJw8kLttmqxZRI1nixGBXT
	zH3w4S6fFviJVvLQDy/EsN5oc5Nr6wleLoXOOBYWaIHZxJl/jFDrA04z2z6/K1B5xBqqX9EPuQB
	LfUp1nB0g3D7TlNBKKLH
X-Received: by 2002:a05:600c:8b88:b0:487:1c2:6a4c with SMTP id 5b1f17b1804b1-48715fbf6a6mr44191015e9.4.1774431123985;
        Wed, 25 Mar 2026 02:32:03 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711764625sm120724195e9.14.2026.03.25.02.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:32:03 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] PCI: imx6: Fix reference clock source selection
Date: Wed, 25 Mar 2026 10:31:16 +0100
Message-ID: <20260325093118.684142-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_023206_395421_9B17BE93 
X-CRM114-Status: GOOD (  11.02  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

In the PCIe PHY init for the iMX95, the reference clock source selection
uses a conditional instead of always passing the mask. This currently
breaks functionality if the internal refclk is used.

Pass always IMX95_PCIE_REF_USE_PAD as the mask and clear the bit if
external refclk is not used.

Fixes: d8574ce57d76 ("PCI: imx6: Add external reference clock input mode support")
Cc: stable@vger.kernel.org
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 81a7093494c8..e0580d6efa57 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -268,8 +268,8 @@ static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
 			IMX95_PCIE_PHY_CR_PARA_SEL);
 
 	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_PHY_GEN_CTRL,
-			   ext ? IMX95_PCIE_REF_USE_PAD : 0,
-			   IMX95_PCIE_REF_USE_PAD);
+			   IMX95_PCIE_REF_USE_PAD,
+			   ext ? IMX95_PCIE_REF_USE_PAD : 0);
 	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_0,
 			   IMX95_PCIE_REF_CLKEN,
 			   ext ? 0 : IMX95_PCIE_REF_CLKEN);
-- 
2.43.0



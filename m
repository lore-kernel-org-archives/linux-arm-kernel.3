Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2C9C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/2ZMg6LQNzP+WqoJGSl/J+PhbKTk0j0hhnJ6TPVsHY=; b=3GU0laedDWCHGiPgcz1/hixMN7
	XyAKEOizUn1fdO47YoHBCwIfxXuNhFPh03+gkhLc12DgHJ8qapm/Cslr+zEgkKP+EJ9zA0xDSl18i
	s1/3bTY/UZ0Jae9N0sjrSvDXGo5B2sgX5aSi0QcywnabP6XWD4qCivUmXFVZjGSrzwhPWjHjKgS0G
	gePj6vcdy/8X8SPd7X3tgBhCPV/J/c1dAaM9cdmULtrMQdVj71evvDdxqzIn3BITPPdbd+xKCcYY7
	KydCbRZaWsQN7+gGPptDOB3IfjijqML+MHvoMxBWw1HpsOgtCtEnZjgV7EJjYsBfZZ+hyfoGvUtf+
	ivX0b12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBamS-00000005R4v-0tbJ;
	Sun, 04 May 2025 14:57:24 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBabC-00000005PRC-3ILS;
	Sun, 04 May 2025 14:45:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5f6c3f7b0b0so7112385a12.0;
        Sun, 04 May 2025 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369945; x=1746974745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/2ZMg6LQNzP+WqoJGSl/J+PhbKTk0j0hhnJ6TPVsHY=;
        b=UeQhB58VuNBnBRDbFHSKN4xELdspfbxTlEaFg0Jj4UuT/dsq7yRFwAv39b9gvEimXY
         8DoVDjxOCFue5tjOKn4oCpKpyqKxi4vHN/GHIi3/yRzzgXu0PGoSt8Y7HGVKVFk4knGS
         7EZ3fN9MKG8prZEPcTVFuLz/944RELpFPXGuzV2zT6ByakosT1CoiQo4+/e2aNEUa1iJ
         NNy1QzY1toh4DF3K8jgsj5fSI5yjLGtiuFeSJVKsqHweveKgPOqebnd1tVouUoKXP31B
         aHoerRz4JEu26vQ6Kb4UbaK633aMH7hOhPYfIwoRd/vtI9GXqWdiZoXO/MQZ5395KRjI
         n42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369945; x=1746974745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/2ZMg6LQNzP+WqoJGSl/J+PhbKTk0j0hhnJ6TPVsHY=;
        b=FyQbse+iQ77iH9+J8IlqWHluDHBgPvsoQpJqg78TIPGoFrT2W9XKELUJO3so6HAMVR
         j1pB7F/Reuf+NusrxzDr6GuM4ar5yFKDmr5lR/ItCZmgIfjuhTWfJG9XQnzn4tcB/H9J
         bcO30QSpcbRjEcHF4LajKk/8C7RSE0MGVLf690zu3IsSs+XnbZkpeLxu9ZlPUFYWfB8s
         99CHitJpEiGpbxK//4bMnfBzZGwQBieAfRXk6zmv9htQjeH4Z8AXtC+c6R/g1bJNirYA
         REJo6NBDCU27fxWjNbhugaMymF1mekMAfRjFVfFNLXIBOoYDKwAh7Zbwx9//g5Z9gPdD
         0A4w==
X-Forwarded-Encrypted: i=1; AJvYcCW91muu6X0h/CukGj7l20NCEsGWMYy8qwM7CFDKdq2KpxdvHRF/bxkLiskv/DuAd9P74Dmq+kI4+OcVrmPc/PLs@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa/atOnFU7vc00e4HAiPI4rBLvpkEo+jAATfxB3gDpVE6VnCw1
	1ZG08g0Joe6or2y94l0Zfr/VxgYE/VcV9Tn1Lkl08uJ9tHBOFmJB
X-Gm-Gg: ASbGncuFCxVwQECnhOCAddx8BaFve0iAeB+zauSykvLAaiTcYd/EeuHSDMQbClUtp+I
	1q+aGofuA3LF/PC0Z4rnIHxK3s2yMuFFsYo9LNHk4bKqi/qFbXtgaxKbjAQipgI3aW/Gd4UUXzx
	uP0+jmDUKWA/9ACsKMfh68/+OIuLXq8p5c2xro3yA2k6PdLY5xZyqoOjPpj3/e3ZZdLTTXmRZbC
	ozpUn0YoO3NZ0EphNNsuqtLZYu4Azl/4elcOltbI+Dpu/09n/jpAqeCH2K4ApTe0A257dInSnBC
	yN1HI5/GJqnx2x0Odb8EsDhdU1CC3GdzPhUGBmaCcs8p6Cfk2Fr9SR1/HuxtWtWDsZp8J2JGWkh
	StaxpALjC60Ov0eAz
X-Google-Smtp-Source: AGHT+IF7AQauSsrNTCBXEecy6z1zSfX3R1XXKCBQWg7IremhkdjxTo5/KPNyh6CLmo9LP5N75FIt7A==
X-Received: by 2002:a05:6402:50ce:b0:5fa:f96d:7a24 with SMTP id 4fb4d7f45d1cf-5faf96d7cd9mr1447167a12.3.1746369945252;
        Sun, 04 May 2025 07:45:45 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:44 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/10] phy: phy-snps-eusb2: split phy init code
Date: Sun,  4 May 2025 17:45:22 +0300
Message-ID: <20250504144527.1723980-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_074546_844914_F6E5D7DB 
X-CRM114-Status: GOOD (  14.50  )
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

The current phy init consists of hardware power-up, as well as
QCOM-specific eUSB2 init code. Split it into two parts, to make room
for such non-QCOM init code.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 94 +++++++++++++++++++++++-------------
 1 file changed, 61 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index e1b175f48..1933e8440 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -121,6 +121,10 @@ static const char * const eusb2_hsphy_vreg_names[] = {
 
 #define EUSB2_NUM_VREGS		ARRAY_SIZE(eusb2_hsphy_vreg_names)
 
+struct snps_eusb2_phy_drvdata {
+	int (*phy_init)(struct phy *p);
+};
+
 struct snps_eusb2_hsphy {
 	struct phy *phy;
 	void __iomem *base;
@@ -133,6 +137,8 @@ struct snps_eusb2_hsphy {
 	enum phy_mode mode;
 
 	struct phy *repeater;
+
+	const struct snps_eusb2_phy_drvdata *data;
 };
 
 static int snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
@@ -230,41 +236,11 @@ static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 	return 0;
 }
 
-static int snps_eusb2_hsphy_init(struct phy *p)
+static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
-	if (ret)
-		return ret;
-
-	ret = phy_init(phy->repeater);
-	if (ret) {
-		dev_err(&p->dev, "repeater init failed. %d\n", ret);
-		goto disable_vreg;
-	}
-
-	ret = clk_prepare_enable(phy->ref_clk);
-	if (ret) {
-		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
-		goto disable_vreg;
-	}
-
-	ret = reset_control_assert(phy->phy_reset);
-	if (ret) {
-		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
-		goto disable_ref_clk;
-	}
-
-	usleep_range(100, 150);
-
-	ret = reset_control_deassert(phy->phy_reset);
-	if (ret) {
-		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
-		goto disable_ref_clk;
-	}
-
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
 				    CMN_CTRL_OVERRIDE_EN, CMN_CTRL_OVERRIDE_EN);
 
@@ -334,6 +310,52 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 				    USB2_SUSPEND_N_SEL, 0);
 
 	return 0;
+}
+
+static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
+	.phy_init	= qcom_snps_eusb2_hsphy_init,
+};
+
+static int snps_eusb2_hsphy_init(struct phy *p)
+{
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
+	if (ret)
+		return ret;
+
+	ret = phy_init(phy->repeater);
+	if (ret) {
+		dev_err(&p->dev, "repeater init failed. %d\n", ret);
+		goto disable_vreg;
+	}
+
+	ret = clk_prepare_enable(phy->ref_clk);
+	if (ret) {
+		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
+		goto disable_vreg;
+	}
+
+	ret = reset_control_assert(phy->phy_reset);
+	if (ret) {
+		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
+		goto disable_ref_clk;
+	}
+
+	usleep_range(100, 150);
+
+	ret = reset_control_deassert(phy->phy_reset);
+	if (ret) {
+		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
+		goto disable_ref_clk;
+	}
+
+	ret = phy->data->phy_init(p);
+	if (ret)
+		goto disable_ref_clk;
+
+	return 0;
 
 disable_ref_clk:
 	clk_disable_unprepare(phy->ref_clk);
@@ -378,6 +400,10 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (!phy)
 		return -ENOMEM;
 
+	phy->data = device_get_match_data(dev);
+	if (!phy->data)
+		return -EINVAL;
+
 	phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
@@ -424,8 +450,10 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
-	{ .compatible = "qcom,sm8550-snps-eusb2-phy", },
-	{ },
+	{
+		.compatible = "qcom,sm8550-snps-eusb2-phy",
+		.data = &sm8550_snps_eusb2_phy,
+	}, { },
 };
 MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
 
-- 
2.43.0



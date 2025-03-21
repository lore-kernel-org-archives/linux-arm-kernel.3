Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CCAC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dL00t3QE4ASPpAeBNPhfJbN60yp6PFJbIaqm4DRKcSA=; b=nohcMzA7ANadrn6oivAnREDKoi
	dfeRbwh1uBofL4anc/LFmJCJKJzQF+wDeur3fejv+LQxJkyPO9gJ3uGMLr6dN/u6ztSwCVMpXQA9i
	yTs7LWdbpm/qomOd1LSAXLpHKw2eGbMIKhD3q0p/hMa5fDW2Yb4hQmxVhnlEkLywsgg6z6nM8Zu+u
	697be3Ttn5Gqne6iyxz9VQT+YQpd0V1rzmi2/IWclTuHpkfgMOZvvEPgc+mR8BsQU3XCP0oG+XUdI
	qM4czgIa9Bg4OaRX3+7/rrlfwO6rNgflw/K6HCvIdv5MhA2dPKq9oHnLAVZJ+sJrQssR3s+2iaK9J
	FZxHOZzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvd3m-0000000F2mF-04LM;
	Fri, 21 Mar 2025 14:09:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvctu-0000000F0Wi-2JqO;
	Fri, 21 Mar 2025 13:59:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39133f709f5so1091143f8f.0;
        Fri, 21 Mar 2025 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565545; x=1743170345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dL00t3QE4ASPpAeBNPhfJbN60yp6PFJbIaqm4DRKcSA=;
        b=VZNzdnVqMnDGfynH0zu1ovmn8V13pPHVAjJGzUWiS9qSC4LrkVTr3P4kCOPiVva7lc
         Gf51V20tkS35OAOUahZkWARVNwedXhxQ8Q/ILZBRz4HqBcgyat+M56sfXU6q/WQ+3lr0
         aqoIfCMJisECXAtkMuTGwmOGiTSDBvYUSR5AVlRRB/eJLsoJyGzRHDP1GW8bMvsK7JnQ
         ssv5jYDNDgKCWjuSgC/YRoKEi8GbvFhB4xOVq+bXcZsq2SQcKekzsDw3ofBGOkYXO74i
         0firu/y9gQuQEUYa7y786+/BIyf/PAMRRnGVXEGgIZyYvyHOXlf/ykDQchmzhdDJ7oMW
         jJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565545; x=1743170345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dL00t3QE4ASPpAeBNPhfJbN60yp6PFJbIaqm4DRKcSA=;
        b=KskmrTfXQGYPBOhvH8gKLNNaP2XfB8oHCCWtzI+Fn/tqMfU9rJYnXYF4/xuX4UJ5Y0
         etTleEU3+zBX0ru+Rw7a0U44PhnO/HjNWttJmV7fuoe+EPGEf72Cn/qkExt312d4VK33
         8vi8Y5gbYEm96xGjX0TeWSH54vm19StVfzS7rbrNQ6HH+j4y0bxvTyktYCJHphPT/RQG
         uYZPe36qH2YHgaVdufesEPROgSMZWa76LGI/ZR8EC7wHuZeKom8l/51RsD8x0DES63iq
         l+kCtLQClfTGSxjJFxbocK8DHqZlgviMmIJo7HRxibZ/t0p9m8QE030XxmLGd+8QMKcz
         hAKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc84C2msXBTZDazUCKn7TH/K+//GT5l5Pxs8qEp4t1wMXZ6AaTpD0e1jCqZD+EG4WpZ5SoBf5L9x+qN52lRI0n@lists.infradead.org, AJvYcCX/STkjSRiFdHTsR+GwH8T+YLvmVUTJNLKJtyCXmXfhk7M+abtNUcIMPL2hMoSTVz7qAlR0Gietg2BY@lists.infradead.org
X-Gm-Message-State: AOJu0YzX7HEtkhX3qnlys4hNJNqT1FRwSuVcVHsdrIH2YogecE9z3ppj
	ooKzc3MJEuYPH4wuuauKlzEyGKHVhpt2FU3B8hARoCyJgH+ibb7vScamHg==
X-Gm-Gg: ASbGnctNul192uEe0DYw8oWLOqRO5YHqYTGiKTVqNiieOgm1KXOWIudyJBedTv5M5oq
	bisNy9rX41KmiDUYtlPS30BUuQF4IQ8dvBhDLzdPRDJWnYEr0TV9A4PKDfVWsbOuRVsFBL7yQUj
	eBTlJvvlUNf7WDOgd0eWWuQKjbZY9ixON/bpUj4p99V3Wyq1pSy1S6dhc/N9t4QY888fG3eAqoK
	BV9v9PQWjWtRJBuywZ3Aif9OBQKuSZndHXXDS+z/E03Edz2R8AdOK7edD8zZAqVMLZ8KT1Mvf7T
	i6/CMsPJpKQU2ruRoFPiLjoM6byiW5HbLKOl633VmdYoi8cKxgZT9K/5lOBKKQQLtKjRtG4qgPL
	xg8dSKSQXrxhoGf2lyOzK
X-Google-Smtp-Source: AGHT+IFquZF4hd4nWmTPWqI68wVcBaR6V5d+ZVDKcCwV1vPKm3ReaFGvjX+0+VE46ogmhHCnIcBjWg==
X-Received: by 2002:a5d:64e4:0:b0:38f:3b9b:6f91 with SMTP id ffacd0b85a97d-3997f8fa8f5mr3266881f8f.12.1742565545103;
        Fri, 21 Mar 2025 06:59:05 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:59:04 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 05/10] phy: phy-snps-eusb2: split phy init code
Date: Fri, 21 Mar 2025 15:58:49 +0200
Message-ID: <20250321135854.1431375-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_065906_602253_DF03522E 
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

The current phy init consists of hardware power-up, as well as
QCOM-specific eUSB2 init code. Split it into two parts, to make room
for such non-QCOM init code.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/phy-snps-eusb2.c | 96 +++++++++++++++++++++++-------------
 1 file changed, 63 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 405278c18..fa878389f 100644
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
@@ -371,6 +393,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	struct snps_eusb2_hsphy *phy;
 	struct phy_provider *phy_provider;
 	struct phy *generic_phy;
+	const struct snps_eusb2_phy_drvdata *drv_data;
 	int ret, i;
 	int num;
 
@@ -378,6 +401,11 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (!phy)
 		return -ENOMEM;
 
+	drv_data = of_device_get_match_data(dev);
+	if (!drv_data)
+		return -EINVAL;
+	phy->data = drv_data;
+
 	phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
@@ -424,8 +452,10 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
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



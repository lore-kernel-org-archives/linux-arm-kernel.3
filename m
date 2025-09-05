Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAF5CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BvNSdgfroz2AQh+V+YdAGx7lMSQySMqfI1R60lc+cXY=; b=oDsxEw4JH0c/6fdPxcjm6QXC7K
	UDH+zXuzhEhmJNyvXeAfHWYxFaUq2/9LSAbQoDRgA26W+m1av/wQnMB2zaP4pvUYdwX8yXfDcfCbY
	95j7fHW9Xc4ejDpdI16f5WdzwqY2z9+M+x66S7g3vB7Z6HfsRUQWwbqROleCxE7ZzDkix9b81t7tV
	Os+rrcZHqJh3am5s9YfHq2P9RMHJDZSzKi9ZPQso9ff01gYhpORkXbycx4WcQoZYf6uMkcMT5HYa1
	209bj4XU2vceluZAIkAs6g1N8ppypsXE+OE/NhUqYIu4hNm7yhaskMc5jufxUrtAKxKLlz9Q5UT+a
	FfBFqvxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXZn-00000002QAh-1JC3;
	Fri, 05 Sep 2025 14:38:07 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUba-00000001NVE-0moF;
	Fri, 05 Sep 2025 11:27:47 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32b70820360so1604686a91.2;
        Fri, 05 Sep 2025 04:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757071665; x=1757676465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BvNSdgfroz2AQh+V+YdAGx7lMSQySMqfI1R60lc+cXY=;
        b=BWzWMzOX/H3/rM9qt7yrJ4joshfDJkzVFXRg7PQjOBjqZ8wWHJDSCCwpxCwoV/Qvqj
         pRyEwiiz4VwQlIx8H1SIBjF1I/Ehli+cfLI3F1As1p+qCp+Jmn1jjDBfEXq1E+lRb2Nk
         XTZ84YNqJxlmALFqyWCvCxXwyvluN+vNX7Bk3QcgoCUEJMa5jGlLZtOJ45bYP4n/iXlI
         6GFGclNK4y02O5MUPPP+d7kVotjT0Cdr/rBpg2UmUtZK+wRLHSjRqGueZgwLaLHte4pu
         k0KxtbRH+DTwWNIXsosBZs06pO3c6LTu7Qg1W4EEsTODbM3bntd/7tB0TuWL9g2YyqsJ
         T7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757071665; x=1757676465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvNSdgfroz2AQh+V+YdAGx7lMSQySMqfI1R60lc+cXY=;
        b=rgm7Qg9Z6LtfviWWD7vHtNclm66BmhRG+VcxBBA7HXymS3IVVZ8mj1o2UzRrGzdYZ4
         /ajkrLMiEt9ILO040ZQL5nL8+DYUigaYIGMcHjaRpvKf27ZrxQaKXRDqS2tmj6KGA98v
         vNqPI3fpHc4jYMO4rNYeaP1kqLA3P3+pkJ/m5X9KHy5CyB16wb/N8ETMPUpNQI/UwzK1
         LDR95HLSZ3zTdBKPvxgZHInq7/cvOs19UFtWehKlpkf7vyHbDi3HIcfwwTkDW5dku0EJ
         InzRxVJnnHTmZw4yVr3Wny/pp+bC80EUFQBJE8Pl+1bUrK5wgKFJzt/GrsYu1fnFSW3y
         eeEA==
X-Forwarded-Encrypted: i=1; AJvYcCWrqoUOaMyAqDiaIXIiDqmGWkwiXtqNoj4dQIRLSKCtL9XBlGa9vmLfpunFAMIM5XlKEqbqlEg8+po/Ebc7hZWo@lists.infradead.org, AJvYcCXhhemBhZhqCV5/rPmwwVVFCLGA3RXSa0gPZHQbnSFOhQg3mdLsskqTWSWCUUgzdX5DDiJS+5Dr/UKRZPEvXUo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMrRfjaqoU+pRIqIlk9+LxnodT/rKiZT5MOOnx9e5qbqfGywz4
	+S1jhrUOwECn9eDPVQrLrh/98mk4MrzvwU0f5zc7jXAwQ7mj6DZioXZz
X-Gm-Gg: ASbGncsIOar2PWOkeSjsiLMlupdTrx5pcA94o3xWXBDep642u31aETVNkiVP64RXfac
	HC20s/Lb8b4mU7NADUkB4oqtRTh3DlWFt9M80zqRqmgi08MFH+b3QpvB6R5p9ktlW3WrEY5VzEY
	kks+RGDEMRR+f7jWe87H6ZXASFGHJ1TtaM83M85IyzN16D+GIJ0ptzeHMfR5/FJqMGN7jArlULz
	FcC1fcqb4RHF221oPeZx1WO3fnKI4/z8nrBC18YUmfU572178LDLg+D8qSSK9JujeG2SU3DztWX
	4ZQXtFye/YwC/26Az5G0OVPlv89xmoC8xbtMzSgxjj1/xxnsON3z6iG9zDoCxo5MAciIe9oHBWH
	4kqjb9cZ77WPybUHX/ZpjwiqPWhkTIHI=
X-Google-Smtp-Source: AGHT+IGvR4zQ0L9DATfW6OC24buFgtcy9qBxyqE0QsalCQFZz8jZdjfaS+y+TmQZ4bZufc0KdMQo+g==
X-Received: by 2002:a17:90b:3e44:b0:32b:bc1c:8d65 with SMTP id 98e67ed59e1d1-32bbc1c8e51mr3401055a91.30.1757071665181;
        Fri, 05 Sep 2025 04:27:45 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e6d6d4b2sm10390179a91.0.2025.09.05.04.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 04:27:44 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Hans Zhang <18255117159@163.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	linux-pci@vger.kernel.org (open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1] PCI: dw-rockchip: Simplify regulator setup with devm_regulator_get_enable_optional()
Date: Fri,  5 Sep 2025 16:57:25 +0530
Message-ID: <20250905112736.6401-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_042746_226071_A0F1A29F 
X-CRM114-Status: GOOD (  15.40  )
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

Replace manual get/enable logic with devm_regulator_get_enable_optional()
to reduce boilerplate and improve error handling. This devm helper ensures
the regulator is enabled during probe and automatically disabled on driver
removal. Dropping the vpcie3v3 struct member eliminates redundant state
tracking, resulting in cleaner and more maintainable code.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 23 +++++--------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index b5f5eee5a50e..56baca52c3e9 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -76,7 +76,6 @@ struct rockchip_pcie {
 	unsigned int clk_cnt;
 	struct reset_control *rst;
 	struct gpio_desc *rst_gpio;
-	struct regulator *vpcie3v3;
 	struct irq_domain *irq_domain;
 	const struct rockchip_pcie_of_data *data;
 };
@@ -644,22 +643,15 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 		return ret;
 
 	/* DON'T MOVE ME: must be enable before PHY init */
-	rockchip->vpcie3v3 = devm_regulator_get_optional(dev, "vpcie3v3");
-	if (IS_ERR(rockchip->vpcie3v3)) {
-		if (PTR_ERR(rockchip->vpcie3v3) != -ENODEV)
-			return dev_err_probe(dev, PTR_ERR(rockchip->vpcie3v3),
-					"failed to get vpcie3v3 regulator\n");
-		rockchip->vpcie3v3 = NULL;
-	} else {
-		ret = regulator_enable(rockchip->vpcie3v3);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "failed to enable vpcie3v3 regulator\n");
-	}
+	ret = devm_regulator_get_enable_optional(dev, "vpcie3v3");
+	if (ret < 0 && ret != -ENODEV)
+		return dev_err_probe(dev, ret,
+				     "failed to enable vpcie3v3 regulator\n");
 
 	ret = rockchip_pcie_phy_init(rockchip);
 	if (ret)
-		goto disable_regulator;
+		return dev_err_probe(dev, ret,
+				     "failed to initialize the phy\n");
 
 	ret = reset_control_deassert(rockchip->rst);
 	if (ret)
@@ -692,9 +684,6 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
 deinit_phy:
 	rockchip_pcie_phy_deinit(rockchip);
-disable_regulator:
-	if (rockchip->vpcie3v3)
-		regulator_disable(rockchip->vpcie3v3);
 
 	return ret;
 }

base-commit: d69eb204c255c35abd9e8cb621484e8074c75eaa
-- 
2.50.1



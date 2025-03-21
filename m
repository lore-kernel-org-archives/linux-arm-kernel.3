Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B8CC36001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKyiSlNdwX7DjF+cflTvTcf4eOt0dAS41mN07rs6ryI=; b=aORFvPQSxIfH1IpMun6ZABSPp7
	ZlRNWsPrx7Ienfohpfdsd1wEbTk91kAD3Po2Cf+/o7/KDI96A/RCa7M8/iaWPTPnp9LHsMWGB8lNK
	43/ITTlQ8Oueore1+qePQsD8bqo688OOVFY8XmPCSz6n+dHJkonHsEqjrM6FeBFB9QlsUlop20rZC
	ZoZzpim+IzrgjZd/9/G4I20sUUEauKaI+2eHuAOjtXni79/iW8n/bajoRyArD3uQHIdGs219h02aJ
	Mo5EUhFbGLwJBMeQP8vGkEmsMZY2lHV6pViGoZUjNR5RNwamIlW1w4FbUJ+p328PqJQCe/XOXz8y5
	/lKho3Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvd5P-0000000F35g-3phk;
	Fri, 21 Mar 2025 14:10:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvctw-0000000F0X6-0NV9;
	Fri, 21 Mar 2025 13:59:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso12700645e9.0;
        Fri, 21 Mar 2025 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565546; x=1743170346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKyiSlNdwX7DjF+cflTvTcf4eOt0dAS41mN07rs6ryI=;
        b=iIiVyVbRLzOM+L8N8KQMJWZ3ROpkunBVl48BKHE6KFF4Q3i/kCpZd8L5Jr3BsqdJGk
         yzKn6LEWP+sPSFqrCuSoEgSAJmKJa+DlZpkhSJq24S6k2CvNXklJLgzKWMVDr9eQEV7Q
         G105YYgW5Xww7yxhF1FRzXANnj09Ttu/ONY4amGmzNlh6hpB1liOHffA8QAqTNUKIrG4
         wgkd3OG7R6AWMf7hKmwRRuCaRhYmw/n/Z1/R9ddOSOQ+JLvx5x+Y+8HGzLbR2heVwS5z
         i/1lu2KJ+3aqEpdlJ+pvnTOlKr1iy3z8cKMSk1dKTWjgn2kcGu2vWZEzWhkeLplfF6W6
         NVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565546; x=1743170346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKyiSlNdwX7DjF+cflTvTcf4eOt0dAS41mN07rs6ryI=;
        b=QO8bdsDK0GBYHWoefVojXvE3lo2xSsEFfdINlo/0ePKrJvQhyLnt1LcW6opbY40yJ7
         NJm+9A5tSwEe7tnyRKxcVdc+Mio9xLffPTYkORL1O/tNxGp9boJ5IgSzY5NESm+pWrX3
         lO3+Qo9yqDjxFnvw3GzuF0NLvpIs/Leu46WcumLEdjbc+cEef/EwE/Ik8cdiM8sUcM2T
         vvybFcQEtJqGSDNHJO8U5EE8MTGdtA0rhIgNGpOu1eKxzlNh0FGSCJbaTBoQyqZWfxdP
         FSrWxFFKqQaJizRil90q5XDvoyzJrqD8TgYjdb58p1ybT0/DSl7tM1tSWO3DX5c89JJU
         Bf5w==
X-Forwarded-Encrypted: i=1; AJvYcCV6XpCJctS6QxBcVYaTOgU9D7SeNX8752vNKDXB7EzSfVHTlVIzJorwUO4s0mf7zTMJ/febJNRj5VjW@lists.infradead.org, AJvYcCX9YbCyYwR6hbQyf1VxMV5oaTIwkXA4iFMK1VwnGX6w54EAT9bMRw5/7a578oA3Clk6kjiAgPMw25/chBJMtnIK@lists.infradead.org
X-Gm-Message-State: AOJu0YwR5cmj95DnV9BAH/R4lbbsRVBDNfYkUPXxU+zVle3oXu30PmeH
	QPlonD9zoQsxMuD7EVYAcn5mZNYWllg4jgFLvfJLhNqEXOb/CxXz
X-Gm-Gg: ASbGncvdz3f+MAbbUI6tkNxvdTkH0wc0tUTHCJC82kzMmrGaTeUSLHlwHbIVqP8/WYV
	vo9N3U8mGB0Ah5Mw2IuYqylgvmyBW0myCtdm+98/afHihJWHQCg0Y6dOGJRaCS9luyGSB/Y25r7
	8xccPn5VxxBqfAIX2Dqq8Y0LNHIw1/fNvvXT29Pi7IHv20V8xe1Wr6SBdRbTuxrXedxrGivjuEl
	4l7wLpOPILQQb14am+PsB+mtfPCp2o79Ewyzo1SqDu7/cO/kSyosesVetz/F/vNSevm6qNlA7fL
	4ow8B/RJAEx0NcCB785V2SgH1IlxrUnh5JuhzJ4iAtBAcUCmWY21K+LDauDglow0qPNTilE+/2m
	6EYeZlQwV9q8Iit/rW/oc
X-Google-Smtp-Source: AGHT+IHKCNFnqK6pDIgCowKP73ucm3N0R/ZSYYNAOEojeB9gyAuveeAPgC5emyHRkRJvTkfkUr+V4w==
X-Received: by 2002:a05:6000:1ac8:b0:390:e853:85bd with SMTP id ffacd0b85a97d-3997f9371f1mr4236408f8f.48.1742565546499;
        Fri, 21 Mar 2025 06:59:06 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:59:06 -0700 (PDT)
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
Subject: [PATCH v3 06/10] phy: phy-snps-eusb2: make repeater optional
Date: Fri, 21 Mar 2025 15:58:50 +0200
Message-ID: <20250321135854.1431375-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_065908_126579_E5EF58FA 
X-CRM114-Status: GOOD (  15.18  )
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

As described in the device tree bindings, it's not necessary for the
SNPS eUSB2 phy to be connected to a repeater. In configurations where
there are such instances, the driver probing fails and the usb
controller does not work.

Make the repeater optional to avoid that, which also lets us use
the eUSB2 phy when it's connected to a repeater that is not configurable
by the kernel (for example it's missing a driver), as long as it has
been configured beforehand (usually by the bootloader).

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index fa878389f..8ccd432a0 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -428,7 +428,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
 
-	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
+	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
 	if (IS_ERR(phy->repeater))
 		return dev_err_probe(dev, PTR_ERR(phy->repeater),
 				     "failed to get repeater\n");
-- 
2.43.0



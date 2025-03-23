Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B92CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvVG+h6exYVME9DrCs1LDYgxvlNyKrO2ZRoKATXeWAM=; b=AokrMAMv6dPRzB3rGnM0GoXJ3Q
	uO8tmU85ZGxSvgU5ieACUShrfscoT1D2zqBF/vxNFDIA5xlcglgpVNZSqmkHr3dDYc7Eh/ZNR0NDA
	g21v87zmpq8uKEYmmTlNkgeWhLgJLrlzA9IHXcDOLffBV9j5FTdkoRjaizRBMRI15nvDfXnmCJatF
	35RPAbef3BoZIdcGRb/em2wlBMr8qaun6bSMR0XbNy98sO0Zaqa/u8E4LzkyztbnDN+pSrOOE60sG
	639Fh48hS7buQwB8AFHQeZ+cic9bOdAkM1zqY29AEXxGkR14r8sQ5v+q3tbkFcnNuJF7tIHirdKHg
	dQjg1pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twURK-00000001sx7-1Drh;
	Sun, 23 Mar 2025 23:09:10 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyh-00000001p95-2q83
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:36 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-abec8b750ebso702083666b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769574; x=1743374374; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvVG+h6exYVME9DrCs1LDYgxvlNyKrO2ZRoKATXeWAM=;
        b=fTKJ1vaIx9puTBGC9pHUc3jClmGxdUfea/hEmZdRbjvr2H8kjJmr9mDPVu6LLbbJOX
         X3xgUtqdwErI8fv9VEOJ8XbJSewVPvvMJo2FHrpagyZYqjF8xDOiqDKNlNyLevkn5OLX
         PHQvkLffYiXlG13kmEKV6OF4xNEF6VpgszijNsoULmjMnx4G7dFE3Hjh+ahIXIkkJEdY
         fcN7Jy3JV1i4p8u6wTWJfmwrWTaPGpduzaeMFg21v1zHUqwLFllIByuqAACrw1jfc3LC
         Qu5W0m/xgvIzg0qTvLEzIH5o+GuSbVA7HIp3JH1t987NmX3FaEMnLjXgp0MdABoT1S0j
         y3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769574; x=1743374374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvVG+h6exYVME9DrCs1LDYgxvlNyKrO2ZRoKATXeWAM=;
        b=vjJ6b1LlpkhEJi2H+AWSHJyBKX+z/qmRh5TOlTP5+FGMGF9XZ0u0e6qEVui6S3ZpSc
         NvTVyolRRjnuvzF8mvvnt96JbtYhAp+V38sNx3Nnv7eNwzSfb30bshS3iYdhwGBr9OOe
         9B0E9n75zcF8IfAsPaKGRC0Nml5FYKOk5EFL6HTFXu1h0oQhFEDJI07HFrrA6VOqXycJ
         pkm/dHHWf7eIV6f7yQDzkXQfM+bCgMs36q9G4tdpPIkVQNITue+9CXmghWVJVmvIb84f
         gxasWITvI3Hj7+LLuVVajvv/jOHV5jp+Abnnmv5BHxrmnvbWft9RGbEy3greVpTxpFBD
         wTzg==
X-Forwarded-Encrypted: i=1; AJvYcCXFTDc58fE5a386N2e6gfXYOZnhaBRJ1XK0NX9ICYvQf9n4AlSIaBspmUIfoTquvCJMSAGpFRlBN6ewsa58Eik7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+cQCeBl14Gs+GY60csPJbiTiKKxg9YX7i2SzEs2d7JDaRDctd
	4vgsCXzVYy0/TnWsoV+pOUUjfHwIpNHEHaN3xTPT1qshpO09eGEGyAG3fHVA6q0=
X-Gm-Gg: ASbGncsPID7cx1uZTI3HDWSlI95kof+l9/Q4FWowo5xyOPuHlZB/rh+04uMlk3Rz/eU
	7rFF+RASSTLL20xcOh9Z0r6DA6U9Ske6a6ekiBOU9fXYW4YuAEDPAlFwVVULQVGoYxoPmwOu9op
	wsdU2zgkIYCoBHIbVmYcmC92p6EKB5Mx63tm5W6I2wtrUt7UzW3aLHEDxoxJ8eRvzf1CNFzLosF
	BPGT9lIyPE+WQsjv3vqHKKCOzZBY8wyjH1ovneuuZga9rQwE5SJdZNZz3UuyZ2VquO1zdWr9rJk
	xmklqtVSRDRBLuhPyM4dYGvJL0VXlh3vG8xM1vcGXTUVJYEloS6f4LSK7agVU1u9hZmRmFO8yEX
	EnJHvXDSyo1GL0jBZu6wbMzZmuDtp
X-Google-Smtp-Source: AGHT+IGbu/jFjtqa9LSXFqPCJsAn/xbvTSf/7H1OcPEes32L8sKOj1rM+QLBV82JKfVyHX96sb/teQ==
X-Received: by 2002:a17:907:1b0d:b0:ac2:7a97:87fb with SMTP id a640c23a62f3a-ac3f229dcb7mr1140111466b.33.1742769574302;
        Sun, 23 Mar 2025 15:39:34 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:34 +0000
Subject: [PATCH 18/34] mfd: sec: s2dos05: doesn't support interrupts (it
 seems)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-18-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153935_728572_7DFAE83F 
X-CRM114-Status: GOOD (  15.85  )
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

The commit bf231e5febcf ("mfd: sec-core: Add support for the Samsung
s2dos05") adding s2dos05 support didn't add anything related to IRQ
support, so I assume this works without IRQs.

Rather than printing a warning message in sec_irq_init() due to the
missing IRQ number, or returning an error due to a missing irq chip
regmap, just return early explicitly.

This will become particularly important once errors from sec_irq_init()
aren't ignored anymore in an upcoming patch and helps the reader of
this code while reasoning about what the intention might be here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-irq.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index d05c8b66c35f2a1356d7c641484404628870ed42..dc5560a0c496917e847a40295c53e3f762b60998 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -453,16 +453,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	int type = sec_pmic->device_type;
 	const struct regmap_irq_chip *sec_irq_chip;
 
-	if (!sec_pmic->irq) {
-		dev_warn(sec_pmic->dev,
-			 "No interrupt specified, no interrupts\n");
-		return 0;
-	}
-
 	switch (type) {
 	case S5M8767X:
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
+	case S2DOS05:
+		return 0;
 	case S2MPA01:
 		sec_irq_chip = &s2mps14_irq_chip;
 		break;
@@ -493,6 +489,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 				     sec_pmic->device_type);
 	}
 
+	if (!sec_pmic->irq) {
+		dev_warn(sec_pmic->dev,
+			 "No interrupt specified, no interrupts\n");
+		return 0;
+	}
+
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);

-- 
2.49.0.395.g12beb8f557-goog



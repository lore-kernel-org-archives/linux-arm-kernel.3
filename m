Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1355D2E9D8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fu/BrO8IXX6alWkTb0GYjGoZx8cl1iROqgITASLHOag=; b=p5sqkAbeeJ9CDsBWXlMWv7WPy6
	C8AJ6+7mVnxI8qef1T8M76oUhY/m9Ct5+8G9eCg5n66Fj3o5QY5TO/0PqjJ0DEWcvSoI3dkwgBgaT
	Ed9d4wXBxl6ajOfUWmM9paDkUkOa5BOkI+xTOtvrLTA3ZGqTSWYcu3/sVjqlrJIw6LhQnC6/0xhl0
	bGZscDzakOaLWXCI8KT6py/8vrdpICcBdwBLbpk5QQiLyg+kU+hgDtMacNNMuzsIL9Iw+L8ftjjVq
	uo9rK5+xgsxgiuCNdT7DIyq1VfIoWDBW7pqBLDEUb4Hjt5W58teoDkJ7J3/h3M+nxgOSJjVM0p05p
	YHarRVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tASXz-0000000HRmD-22gi;
	Mon, 11 Nov 2024 11:25:31 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tASSb-0000000HQFJ-0MUS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 11:20:00 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so574480766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 03:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731323996; x=1731928796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fu/BrO8IXX6alWkTb0GYjGoZx8cl1iROqgITASLHOag=;
        b=em5OAZlpo1CbxNuxijs50Jmc3TpGKQTMFzOtTsGZ4j2XTNZNJ897iDC9WPfi/Oy2TJ
         qjwPbrh3Wb6ERzK5ETtbOPVykYLYkqbgmYngtQTw0nMAk0kfVmeqMu0u9qkMUGCtkCAr
         C0ewrldnSFEXZdmtxP/vX9YJCsCk/5ZggTZeR4l5dIoP/Y+3qmFc9QFalZKrV9spQd2k
         OfCJox+YA15GMn1HIvYSjmux58Uiw+aHruH5y106McNwlr7YWNzMeIFEPpzOonLWJ1FZ
         fpJF/c8ZwwMTw72JqqJUZYpgIKjnRT4GFwGSJePLhSYsIBn7PUONHwAef+ltGNPoLS+3
         WFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323996; x=1731928796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fu/BrO8IXX6alWkTb0GYjGoZx8cl1iROqgITASLHOag=;
        b=lZZzkOk4aHw5Nkf6gVQo5WugCcLJ2f22XAhv9/QKQnuIh/c0oDeg1lzbvzI3CA5THB
         8HpqlnZ3ML58n6/MpKOgdrfXUW+Rtsg/OGWEKzei3TA+w+IyxR3++otZOCRmzLGQCiR/
         SsICOPu8+ti5uHjuGYVY8scIymZjM0DCKzRU9qVHd0oaXaJ+WCDuhAv5338DM8+4ClY1
         RrZ2/MinIQwykAS1f0W+F6tcjz6ViCxlELJIWX2Og66LeovekZdqC6RCZ+680JTamtXS
         +kF93twyYoazXjsQFmceGWp9cE21ScKe2233tZjMnI2w5GnaJHD0VMQ+nnFSxOIPq8Gl
         T5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0HW4YEvG6IS0YrE2bWBZ1YvVJ1hO+Ml4oiPGuFO4ssZA0rv3ErCw9PJoujFaSy1Zpf2I2MSTbJCTzQxe93QgN@lists.infradead.org
X-Gm-Message-State: AOJu0YzSc55ONz9MzxWjcuv6CpogrtHKE4FSYwWBQ9gDjTNLLO7TCEI3
	eZhkwuvffgyBLVZ9h7zhEkpYT4889I4zY2v9oOrOi7nUNItInpjU7hETDCxA2qA=
X-Google-Smtp-Source: AGHT+IETD0TTRXcK0fhtRcdkx1FK3e/NgS7iCgkGzVtCtOmSV30aF2EybWWflcXrw2+dh5CJKbTS3Q==
X-Received: by 2002:a17:907:1c0f:b0:a8a:8d81:97ac with SMTP id a640c23a62f3a-a9eefeaf352mr1148302166b.4.1731323995661;
        Mon, 11 Nov 2024 03:19:55 -0800 (PST)
Received: from 1.. ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2e922sm582530866b.193.2024.11.11.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:19:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peng.fan@oss.nxp.com,
	m.felsch@pengutronix.de
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 3/3] mtd: spi-nor: support vcc-supply regulator
Date: Mon, 11 Nov 2024 13:19:46 +0200
Message-Id: <20241111111946.9048-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111111946.9048-1-tudor.ambarus@linaro.org>
References: <20241111111946.9048-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447; i=tudor.ambarus@linaro.org; h=from:subject; bh=/f04QIpiuRXQZGFnfAnaIXlKFecFw5Gb/Nj7YVsESQI=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnMehSiUznsRKk7icK+iHmW5tJsygFpLEVcVVqy gWwSLj6VbSJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZzHoUgAKCRBLVU9HpY0U 6ZCHB/9VoXfZlG0zTmKUX6uOfKEiomBJ3tfQ08Fz7JZbY9HNkY8ASnC7D3i/ne0kDCkVXmDdN/t truMWEiWIE1aEqbqieiySwIsqcizG8Ng8aLiNPni4zPgm6lAMLGq9pGPkvgQ+cFq+o3sEqK6ju1 teBSW2iQF+1ZFN/yIjDe8egf9CAcfouomGbsT3ezLCWmfzGyknfgU+SZm2MuI020jVlawX/8u3/ SdG44Hz6HjnrJkYXQyvKOVYGgxNXcow+G5b/UAbgcUNo9rVXbPNFG6etyN+bN2C9AgYC5BJaPb8 ApAAcl8bVmIqGIMm7hll4kkRejUfWBnUCOp+r6Vxabk66hCF
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_031957_157684_C47809EC 
X-CRM114-Status: GOOD (  13.57  )
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

From: Peng Fan <peng.fan@nxp.com>

SPI NOR flashes needs power supply to work properly. The power supply
maybe software controllable per board design. So add the support
for an vcc-supply regulator.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
[ta: move devm_regulator_get_enable() to spi_nor_probe().]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v5: introduce the local dev variable to its own patch
v4: move the devm_regulator_get_enable() call from spi_nor_scan to
spi_nor_probe(). We no longer add support for the drivers under
drivers/mtd/spi-nor/controllers/. Those drivers shall be moved under
drivers/spi.

 drivers/mtd/spi-nor/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2a329084505c..19eb98bd6821 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -17,6 +17,7 @@
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -3587,6 +3588,10 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	char *flash_name;
 	int ret;
 
+	ret = devm_regulator_get_enable(dev, "vcc");
+	if (ret)
+		return ret;
+
 	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
 	if (!nor)
 		return -ENOMEM;
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A776BCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 13:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PLIWEM2t+8glT4/c6dR+SAAi6xj6yMZpKE6lDz4PBBg=; b=XAB6X1PcKIP9ANnBbPcS7MsGib
	lhVf7CF6ql1agu/ToNV8PaDWsQZoyKw/K1NsWH++ju4ms0+EK8PrGHtj4u6sDXldjTvvJ3gW8j0VD
	Z7ZjNLRrov4oZhNNfoNCHb4nJn0rJ3NX17IeiqS0jtEX+Cm714Q/9L2yH3+nUdHXb7F+z4OnPmuKC
	PZtEv0JXiIO8mlj13yDH520P24ZMx/WY5Us4tDqonIdLikhyHred4IKrSiZEgnPPXkdWXrGMbfLmA
	sxVEzy0e+aBpJWr3UCJp0cZ2K5qssoAInYlEm3rFkC34HYwp3aYuR8f4VpyxHprQRsIibX2Z0DfxM
	I1EErBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLh5-00000007woM-0djE;
	Sat, 30 Aug 2025 13:32:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLau-00000007w2S-3pga
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 13:26:14 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso682571a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 06:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756560371; x=1757165171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PLIWEM2t+8glT4/c6dR+SAAi6xj6yMZpKE6lDz4PBBg=;
        b=RYfNMg8bq9SGoZufvq32F6XpFNhBBtjDraorLGCl/3exgDtWM2dRX9oX9/Ae28bs1Q
         hzxa66WvAAfb3YINooH6kDmvTOWy3CabbuKJGtTwaRFeBImOetF1efxb52nKREV+zBQf
         j00M4rhxMhEQUcE3AyHbN3/XKTwAC9mVxTNZ/xL1pcPl5wacR25WwWu7hojTqZpa58eX
         ICark8UGg2G4f+e9cgSBLDuUDsaUu45rp7GuLyfMEACW2ihSyRjpefE6dQ+0b23n0LBx
         588Et/UJW870TY4HXoLkDvWXDv+QwcU0etNozwIN7s+j2WHSRHW7EzG1UrYQhuvy3y4+
         Xq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756560371; x=1757165171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLIWEM2t+8glT4/c6dR+SAAi6xj6yMZpKE6lDz4PBBg=;
        b=vSMDVLmQZPowvqX5CYWEFxADJxNjZohBMTUUWcFnSeFcdf2l7OLmNSQgbXuQQEHlzR
         2Jf/HMJwHsJLi9GHv0GHEUX21EtKv+JC/5pCsZHlLjdqvaVCV4RNYv63ERbqNqNREdUM
         T8+2bpfCWsPkJN3ofJ2lcm3mvMdHtaWPpIJWa7KqjmCovBSzvME+KcTrtes8WIaTpfVC
         qM+41KjAqPwsvDw6KtxUY1sRoOLoc+PrSWP5i2ezKoywkXmaFTtALLj7GbixTYnf9tZG
         cfrwpEVcyh6YnKSDl0UfUSV+OEyB5zLDQPWIctNrZbebLEFpbkLwmsGF89kKby7SzLu3
         Nwiw==
X-Forwarded-Encrypted: i=1; AJvYcCU0G72bmIEy/5YWgZwl5gftggvNvf3M0YNl37keodfVg8ehffQaeoG6Nqh6ADSpEZydMRdiqFDhKFbU+xqrQ6Yq@lists.infradead.org
X-Gm-Message-State: AOJu0YzNROb7XJTHR6nPSBs4m6PMnNUVTTAtEW1+b9hFFKnc8ZCIsdKq
	PVTAcwI5PTCNpZQGEJt0D3rX7hHbK6TI40Ff22HbAALovMyEC7dnyGgI2cPNwy+bnxw=
X-Gm-Gg: ASbGnctwcbJAYuzCnwAuW/tZ4sFBNn/v35Y4c3otook/s6zGQ/StSy6l1BBlr4T5cbh
	SS7Mfe3aWrR45kRdARAgdkEKvoB0bNQY0C7XM/+5MrNLEDQcDqc538pSTQZy5nl2TlpDCwRrD/O
	FZNTbv2Tadtb3mr6UF64X+rZTJYPr0wqhAo5dyv009CJM93lD3LZATOdHeKLRyomcuCX84HFnIr
	zaQioZWf0oOG9k0t3ZWipVjhtZoeBgfRv3LAD05K4Bpnm/er1up+1UN4RPXRlgTV5KRuAZnjSiG
	sSgB/njkaf4dz306QYoQJYptmrf/KfJiduHNgRiX/eJLpRTI9e4mVacxxLOkYBzhfYSgj1+uN4E
	NHdAwJwJtW8wOAqhNFFM/J9FG0UjQyeNulDW4PdO/vzM4
X-Google-Smtp-Source: AGHT+IGKl3kqYaSwQPUyHhXqMbxZUrLqH93jZVeI0k79WyXt2qIL7Rke4+gSMVRK+QckLh09LkMgFA==
X-Received: by 2002:a17:907:1c9f:b0:afe:d028:ebf5 with SMTP id a640c23a62f3a-aff0f0207fbmr198830966b.5.1756560371113;
        Sat, 30 Aug 2025 06:26:11 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff3dd9574fsm225212366b.84.2025.08.30.06.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 06:26:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] spi: s3c64xx: Drop S3C2443
Date: Sat, 30 Aug 2025 15:26:06 +0200
Message-ID: <20250830132605.311115-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Jne1QJWkeU+oLym35AseBFFlEqx8sHlGVdUYoe5lJTQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosvvtHBDqzIYGJh932/9vhOHyjdU23V6AcUQ5t
 Pt97iK+3PKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLL77QAKCRDBN2bmhouD
 1582D/4018tDCkEZ7Uj52wpb+bjyEhAWEFbJB2Zz+Inn/BXhJevzJn16OcMptyUw+hmj9v+HF+k
 3HYxAi1SfV0+KY9YYMPKYanM7eTMYJfY0jglX0Oc7hD/gPbezMWu5ORVrEF28UtpNhCZA0kS8As
 6Cv/tacdw1hOmeyJUcBSLnCLSMLAZZSShlwUVTlp/UFQ7gkPHhRj1iXlLsKd/f/NvC220Adp/y4
 l2dHKNrK3ubpbHGZ3LAOoutKYB15d9kK3Ow4asxeyAtDDNsXNaPwz9w3wWEsDLLqfpXTb8TTvvg
 aDDhwIeulfzSXK8DayTW1am8pEFoAxxNfXJINPirEEIGF9NbwXZ/i+u94VW9OYDD/F6ESVNFqFP
 +T6KIZODOcLdcM9LVzYoppJFoicskYF9Xa6q1Qnm/OwqhfoanlOuqYjntasTeRrTk6p7iIQVrk8
 0msVDtGW4O63pzGHRTBhcU/XtSqWrFTIx+uXvDd8hqW1rfanqOuKAv+vQg1AOPtnFvdPv7jv6xa
 nlqRsDvT1ZivvAkI8BS+2UQpE0vJhLKm9LVqbYPtiipaT8Q45l4TYqVa9IVxQiIBzdIznwDBqMf
 NUbn9OydpQOG1fqRlc2+p8J9Ssu5rjZ6HQog9Oswfx/hsl/EYuwH35264vSh27TaPhvjM2uIGYj XmFdZA71pqkM9Sg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_062612_960034_C06EC977 
X-CRM114-Status: GOOD (  12.25  )
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

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles or
platform data ID.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 3a00f9e480c5..aab36c779c06 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1506,16 +1506,6 @@ static const struct dev_pm_ops s3c64xx_spi_pm = {
 			   s3c64xx_spi_runtime_resume, NULL)
 };
 
-static const struct s3c64xx_spi_port_config s3c2443_spi_port_config = {
-	/* fifo_lvl_mask is deprecated. Use {rx, tx}_fifomask instead. */
-	.fifo_lvl_mask	= { 0x7f },
-	/* rx_lvl_offset is deprecated. Use {rx, tx}_fifomask instead. */
-	.rx_lvl_offset	= 13,
-	.tx_st_done	= 21,
-	.clk_div	= 2,
-	.high_speed	= true,
-};
-
 static const struct s3c64xx_spi_port_config s3c6410_spi_port_config = {
 	/* fifo_lvl_mask is deprecated. Use {rx, tx}_fifomask instead. */
 	.fifo_lvl_mask	= { 0x7f, 0x7F },
@@ -1627,9 +1617,6 @@ static const struct s3c64xx_spi_port_config gs101_spi_port_config = {
 
 static const struct platform_device_id s3c64xx_spi_driver_ids[] = {
 	{
-		.name		= "s3c2443-spi",
-		.driver_data	= (kernel_ulong_t)&s3c2443_spi_port_config,
-	}, {
 		.name		= "s3c6410-spi",
 		.driver_data	= (kernel_ulong_t)&s3c6410_spi_port_config,
 	},
@@ -1641,9 +1628,6 @@ static const struct of_device_id s3c64xx_spi_dt_match[] = {
 	{ .compatible = "google,gs101-spi",
 			.data = &gs101_spi_port_config,
 	},
-	{ .compatible = "samsung,s3c2443-spi",
-			.data = &s3c2443_spi_port_config,
-	},
 	{ .compatible = "samsung,s3c6410-spi",
 			.data = &s3c6410_spi_port_config,
 	},
-- 
2.48.1



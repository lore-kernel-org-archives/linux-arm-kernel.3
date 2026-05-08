Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0189FCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAyKAjmkX6PvmXkxrw5YnaLQ/4sPrlWKfDdfdwHLY1Y=; b=1v3d8qekI355LGty1Ga1j2nVgK
	MZbqIOL+JisPkfljjuYX9cWQwmhjxl7eoXwUW7bMpo8p9/1XJhtRZh7HBk02owAoFTgcvIp/5nyi2
	6/8+7W6uqKzkBGGy+nR4dIcgfNS1e3AVfuCaEs6wq1n2ADZMxyNKzBTDXfG0W+jZYVzuYrn4Wxe5P
	2A31Lvyvhxv1n9UotYX97S5vEm4LEhHhv3c4rhhNxoh4uMeoGxTPiIOeIpw8ivQTMNj0Z+nDRP8nS
	oWkHIm1yjBDylsgUUJ/f4Sp9tMFYpK3f1h66ZjJ9mbwYC2nU0crU21ApFc2l8ZTl1eZ+Ly+sI7ICS
	D+w8m1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOv5-000000077kN-3HGC;
	Fri, 08 May 2026 17:23:23 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOv3-000000077ir-1njn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:23:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2babfd18435so12200215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778261000; x=1778865800; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAyKAjmkX6PvmXkxrw5YnaLQ/4sPrlWKfDdfdwHLY1Y=;
        b=nAGkErDGRT5pbO1HKFghIMhlM4EtHBAHCfdCpJn1ymQpywRSU85RsSLnz2WWtp4xgB
         9QOMLRC2dvkM6TKeIK/vooOal9iLGfwI5cmYLYwJPP7HtZy9amG5UIsKx+J1KtOMnG5/
         UQPt8EI+jd769xk2d/Rd6GFLDNh7tcnkXeFwPltDrKnD492OMMVkS1/g5qgRN6G+tgQy
         rq9azCkU/TS6Eg6ESMkbXAg4yeeoRZVujag3tBJO+FPCh6mO3xqRQC2UTUkn9K1JNqes
         1h7IrOy0MoP9xRLyzu4NzhWBu/S2bVEk3IRHLQlOJnso8oohiyyUlhZzZQsmGYMZyR1x
         j2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778261000; x=1778865800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vAyKAjmkX6PvmXkxrw5YnaLQ/4sPrlWKfDdfdwHLY1Y=;
        b=QneFsZsjXWqX7XgS56CfPk3/X3B0kdsH4z6IZJS3yiHUc/DvacoB3w5eIhou15usip
         amsys1IHoyTa5jXeS3wD/L8t+KIFcCUUluRh0u83cJkr+dmwc3DNb6P1MFw2l3xolmKi
         yTY9J5Me2ZKXZm7o3CmgS8vkXESnz7/Ju8skbXpBfxbJLk9OI0Ehu/BsPsoR5Zcde2dS
         ASzxpxO3M4XQRO/1Pyt/sR7t4PXC2vG/EonK18Lk/uvosUdlo3pbvD0ndGIbMFMnK4FJ
         k0e2mcksl3tSi3efECiGV9zS1uxTmrCsRQGSv49VmuseeQ7lhw2Osqc3ClAw9tXgRdlM
         xZKg==
X-Forwarded-Encrypted: i=1; AFNElJ9txp28j9VT6mBby4DBlMlyGtyVOF/w6e0VqYnAPJ4jY9n+jw0ywvhqtCqIdGEh1QuXRfS/OJEBIeWr5ctWE8/C@lists.infradead.org
X-Gm-Message-State: AOJu0YzlAqPfbwVGpMbtOfW9kdJm4SHTf4tEpDQU10Rybm2sNzl6mIuE
	xkGr60twCb0mehycz1II1l37PrVNPPvPhhnp/rfLOCRJ2VUBWC+h7Ryb
X-Gm-Gg: Acq92OFdu0mVqCSk6TM4q1GgvITWeX9H6aBt/ODXfjXZ6WmrtoHxA9SS1HC1kqCD1M3
	7x1mzDmsTkShox+1SSXF4pYumCeBc514Uafsu46qTZ3EYSiLhRW4cIYLgnLP7wVoHIVaaHQr9/j
	0KclfNYobx98tUJG6p2U/ibGAiN11lnHInb+emwhNmGKEuU+DIStNp+xmx8dsTdY4zYpcyBKeAF
	GL589BWN8kip0bKCl87eyE8pOZYS0NVXVXgXIZmhPYvG5RmHo76j8ia6YsZl5ECLfWo+ALnbETf
	cnCnrV8RCmW9el3MrVLmj9ZzsmwMuaqvO+HXYOLdG97JMePFxDklEEkbVWoU2ENqZnNnWNbNjxV
	bp40TuZpGNw96gZXLn2adU1UFZDq5sZ48DW+xGaHFakt1YnLmBC/QJdrrQ9K6bvF4oDP8IMEPp5
	C/WAZGDY3McM5l4yaYM7rvfergEPrn2Y8KwApV+6vPSF+I
X-Received: by 2002:a17:903:181:b0:2b0:61c2:8e83 with SMTP id d9443c01a7336-2ba79287515mr137856355ad.20.1778261000634;
        Fri, 08 May 2026 10:23:20 -0700 (PDT)
Received: from Black-Pearl.localdomain ([60.243.224.75])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2baf1e35487sm24907985ad.46.2026.05.08.10.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 10:23:20 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 08 May 2026 17:23:06 +0000
Subject: [PATCH v3 1/2] arm: dts: st: align node patterns with established
 convention
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-st-mmc-v3-1-81c329ed28e8@gmail.com>
References: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
In-Reply-To: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_102321_487423_F05D1081 
X-CRM114-Status: GOOD (  11.81  )
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

Update ST MMC DTS node patterns to match established convention.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/st/stih407-family.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
index 3e6a0542e3ae..08acba209c56 100644
--- a/arch/arm/boot/dts/st/stih407-family.dtsi
+++ b/arch/arm/boot/dts/st/stih407-family.dtsi
@@ -596,7 +596,7 @@ spi@9542000 {
 			status = "disabled";
 		};
 
-		mmc0: sdhci@9060000 {
+		mmc0: mmc@9060000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09060000 0x7ff>, <0x9061008 0x20>;
@@ -611,7 +611,7 @@ mmc0: sdhci@9060000 {
 			bus-width = <8>;
 		};
 
-		mmc1: sdhci@9080000 {
+		mmc1: mmc@9080000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09080000 0x7ff>;

-- 
2.54.0



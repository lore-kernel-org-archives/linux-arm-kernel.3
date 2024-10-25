Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898E4D0C600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPEW+StB9yri6/7vzc+p+9fT8+1vMg/ckd/Nh55RyuM=; b=1bFdBJbUyRkZRx2C0V+q7Xlv5k
	ETXlndTBxc4BKA5V4k9yh7AC1eITfLpxz89WCFbyawPzmHs6ypIjzFbgbEnrDXekSt+bs1x5C6B9P
	HxH6mfSTGbtG1OFxBjeIAusxU6MjxG13DdIF2rv1O7knwqePl5ZpSi9t+gU67VBXpT5kh+4D4f4fI
	9/6dS3j+SvOky90J1fA//FeQW2Tpi5rqEb/DLtrSJvWOs635x48OEpmwtJ61/+E8QgR6CK6sS74Oo
	bFkzMs56ZXY2iOLrtlu3sRrPDyGl3LeBbDdwfP+GRxg6JijhlBZdDTCWn0G6purqdnMmG+/3qnHXU
	/v8yAofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IqL-00000003ZKy-3qph;
	Fri, 25 Oct 2024 11:51:01 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IRU-00000003V0D-2ivR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:25:22 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539f6e1f756so2287568e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855519; x=1730460319; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPEW+StB9yri6/7vzc+p+9fT8+1vMg/ckd/Nh55RyuM=;
        b=lEXK1KTMXZh05+Hkmiq4qRAVkTDBhbnQXp9t4fL6R4KjTdDce30VIrBayP1cfB+ZP2
         VA4oH7KxCOgNg4RUmRh/YI/amndV2E1V+ATFZxGEbW/zAaVwr6fML0LdbDFzIfyA/Dku
         Wu1Y6Iw44mwSR58Z/fLGx3qrpnzXCI/0GRRZrIZf94lj5punsVD3RKEofvaHPZNWdQpO
         ZR8SKf1l9Q+2uczlBhq3xxdADB7d/nZXOfx1QUwmDCkmpY6gy+BaTlruq9F4EJIBgVY2
         IZS+rrkFUE2twJx0Jbn7x1OEzcIwHccD+QnDY/lxSvVyLESUQtquglNj0ea6PG2kEjOA
         xXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855519; x=1730460319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPEW+StB9yri6/7vzc+p+9fT8+1vMg/ckd/Nh55RyuM=;
        b=cx49qQ/hiYgnpFHVRGUO47/6c0fd8jNB32o5G9c9kQLq0RGhoEKhGbhu/mkNPZ6nzc
         cF8yGTl/vuizma3TYAvlUB0UHF1F/CYZQX3qg/eOYmQzKxYOdi+h/11sJLOcGQHqjtou
         k8fqxYFsl/w0qjYF+qbh7mjKaJmDhR5kehguLqNp/G9uWJ+qVuYZhwoMjV2v6lEIw542
         Z3OeNv5POoflkDrXZNNnX7gGAPQgKpUBldtYyUHQNkV7QQmVK8N38QVmgdjeCVvXH2A3
         kp54URWzyTsTV2MA3yjNbiVf8m7D7ZTJdOxXD9RyQYAgPsIYWoU9/L+Xc8I2oLRc5qU9
         j/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8NBIcj1BU+1HqSKhH2qcqxZSvPYaJNEOdVEm1Rxa/6Wb/kvi5SzD/j6BXiJy8Fvi/lnYzYZZT/irk3lRqMcOt@lists.infradead.org
X-Gm-Message-State: AOJu0YwDYSdnwzVkPN8iOmw94SITaQ+LXN/Bpak643WdmAfxw2w7ro9v
	Zqs8BlCkDMD7lOAo6BoACxsBoYhejpR3l8lMp4GOzu5/vw8ga6wQ
X-Google-Smtp-Source: AGHT+IGt1fCquMZ3NNZLwaagu9KRz7cZdz/Me6B7Rco1p8I/pwkT0SJo6jB3OOzEWB3h7ucjl3WGGg==
X-Received: by 2002:a05:6512:3991:b0:539:e454:942e with SMTP id 2adb3069b0e04-53b23de9aa0mr3452803e87.16.1729855518903;
        Fri, 25 Oct 2024 04:25:18 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:18 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:55 +0300
Subject: [PATCH v2 08/12] perf: arm_pmuv3: Add support for Samsung Mongoose
 PMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-8-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=1401;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=kyHAPTKZB5mT8XCJ0jyUMcgti7f6+k1RLiIUUCWE+Oc=;
 b=e18R1gAgBqNCItvEqiHWKV4mMiyFfaoPBdnl6l/utulFdQNuLswqV9JWRXelc4wgJJy11VQSs
 f8bgmqNff5wCYbqLk4IMUwUWHV5LEY26+RM8aVSOfPfuRr4WzerOxji
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042520_733363_2992669C 
X-CRM114-Status: GOOD (  11.90  )
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

Add support for the Samsung Mongoose CPU core PMU.

This just adds the names and links to DT compatible strings.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/perf/arm_pmuv3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 0afe02f879b45a8600b9cea1bfd88e6a68096a67..9eb5603e1dda18c4bdd2745304737932a27fde8a 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1364,6 +1364,8 @@ PMUV3_INIT_SIMPLE(armv8_neoverse_v3ae)
 PMUV3_INIT_SIMPLE(armv8_nvidia_carmel)
 PMUV3_INIT_SIMPLE(armv8_nvidia_denver)
 
+PMUV3_INIT_SIMPLE(armv8_samsung_mongoose)
+
 PMUV3_INIT_MAP_EVENT(armv8_cortex_a35, armv8_a53_map_event)
 PMUV3_INIT_MAP_EVENT(armv8_cortex_a53, armv8_a53_map_event)
 PMUV3_INIT_MAP_EVENT(armv8_cortex_a57, armv8_a57_map_event)
@@ -1409,6 +1411,7 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "brcm,vulcan-pmu",	.data = armv8_brcm_vulcan_pmu_init},
 	{.compatible = "nvidia,carmel-pmu",	.data = armv8_nvidia_carmel_pmu_init},
 	{.compatible = "nvidia,denver-pmu",	.data = armv8_nvidia_denver_pmu_init},
+	{.compatible = "samsung,mongoose-pmu",	.data = armv8_samsung_mongoose_pmu_init},
 	{},
 };
 

-- 
2.46.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28855D0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2XM3Jplq8/EbJJC1OO1W3bzQVXel65Gy7KIsJ85dgQ=; b=lXlckfc8g5eTktQhO3f+/kCu6K
	6kIcyErCYIvBb5PJ3eOlyfSj8iNxIJqNY1bTwG5JlrbV7n4FWZOCBrY6q0cvxvTOWPeRwFnvGnffb
	XhwV5t9YULFgRCFt8EdSJmkXpaeI1cGs4783yDPV39+DwUCVdgf6xxAL6VN4N5lScMD/9XOqStum5
	Fj/6Qhznc9lb49N15XXDIeri6xvGy2w4lyBob5oSXboFwv8H+w/dooYMQl21lmT383eVBx1RvHCDS
	ov2DOkPIq5lOp5JtGQ7DHY5m+N7d33/Zgpa2J+ZcDv5Vffd9U0i4rfVc6FaS2oFFJmo1Jmnt5N4/b
	Ao2r3ZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3kDR-0000000GAFV-2Sv8;
	Wed, 23 Oct 2024 22:52:33 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jyo-0000000G6yM-2BAY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:37:27 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5c9404c0d50so275287a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 15:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723044; x=1730327844; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2XM3Jplq8/EbJJC1OO1W3bzQVXel65Gy7KIsJ85dgQ=;
        b=d/b6YeLIp+e8Mbk9l8jreZ+cldZ748cV8jEMQRW36iFOVljdzWcW4sjFSnlV9WfS+8
         cyjr76eX8cZ0n3U9VRiN5B6TPAE8JdRnZBC5RLyq0MkPaNN9qeUNrT0NMD+woUop3Fad
         iWulwkx/89KZ4uIEolV2QVAtBYu6WIJWZBRbd9Wlx3klkAKUeKfkScKFekeiMm/4W7kw
         fTnR/lZMG4VtDEz3fq6PrTXTiKIcua9depz8+xyanchZIrFi5nhO2UiHR4we0zk3Oymm
         Rkb5dU/Zir0huf4b7eEq4qWhtPbEYu53yGjCKzHM2WW4S/lEBLhu92KcHpyKbl+AIPuF
         Q6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723044; x=1730327844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2XM3Jplq8/EbJJC1OO1W3bzQVXel65Gy7KIsJ85dgQ=;
        b=WYi0Lrw5V0ntr+6N5swOXEs1P0n9x5cGpIG+5X5C02dq2Zi8oS7zu46BkbjdjFGKto
         TnXzTRac8jlhrB0De63y1PIWsyFMvBvsIF9upzJCV4d1TLEo89vfBzakk5vm12sWop39
         p0c+RVXof/VAUZBkkDWmsb7ngh+5FUb/nw1JITit/SkWHJaMpJCl59NJbbHFaV1Doy6C
         iX09hyfH75T/7xOXI3jbnpZEXKc1kUQVdjTEU7aFm2vSRNHhamm5duYKJ/dgpGVXm97b
         dieqNRWtRnoX/X+R2xwwUbyD5oiPqhW7M3gkI2IxOPpBGQP771Fs5TnPwsAs0BmNtZx5
         37fA==
X-Forwarded-Encrypted: i=1; AJvYcCWQFDvEBgq01KUDeKsoc6yf1V+ap8mI16xWkTqMrQZIvXRB2icss3yHs0XP4QBcRtcUwiAa8guybij+uLCVkLhS@lists.infradead.org
X-Gm-Message-State: AOJu0YzcSkZyvmt3kLxgNF0h3Odu2sSMmXojPwg7WBkR9tU7tQMG/mfO
	VDYRZ0PKRpa/9VGJPRq/hxdJabCmx/xkLuRoiqGH3sUOlAr7TOiT
X-Google-Smtp-Source: AGHT+IGGOKlIqWKq/XzZ1d3yP1+cqdDO1i0NcdTYIW30vhzrfZLkX8Xf2wVVNdiDv/YUTtBY0MXIHw==
X-Received: by 2002:a05:6402:1ec8:b0:5cb:9968:b4de with SMTP id 4fb4d7f45d1cf-5cb9968b667mr889645a12.22.1729723044407;
        Wed, 23 Oct 2024 15:37:24 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:24 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:39 +0300
Subject: [PATCH 08/12] perf: arm_pmuv3: Add support for Samsung Mongoose
 PMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-8-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=1343;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=nQQbu4onLgjxpUEL6v69QQSst4e5z7h+LcPxyX3sihU=;
 b=sg4+SVEsg+HRJRfFMRpU/sHqKpBVGugHB3ed5T9oUx8+nJ0XJggdevDa4myRkuSz1SfL+yGP6
 WR8EB+pYycNBDNOjXtsYSb3DW4MUeJ2XsnRkiExliTJTmN5cEUBU2xc
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153726_607822_DA076886 
X-CRM114-Status: GOOD (  11.48  )
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

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
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



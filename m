Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15FEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 23:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsyWzi3KnCZDSIQ4SscmiQvCbCr+L8MktGb1FOBdF5k=; b=l288d1ydfkjyWzynGnnr8R57pE
	XMhH7Jga5kUvgXQIj7F1PzmSMAws1yp5Zkk/yMkLFfcFP2Io9oL3sD0b1FsbphLXj0JSeE20ntMuI
	QBj9GhyYX7SYq3QoY1A/ZoI4sYeBJ+IKFw2NSA3yQ7+5l6vUdfYaELTwOjzTYqwCa7aFAuWIfy+L8
	Ak+Jl6IrJXpSefOldVYfkJS7ItyB7yErX7R7TG8IH8ZRqSluOfYTydx/1iNMMmSGN0l8uA3A/ZY82
	d2JxGAwdo1P2HDFizHbBT+M7jfnGYGa0aXNCnIy24sr9bJI+PjaHbAc1lQskRawkJEX0cwb6L4t7L
	vqBz1tlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tug1y-00000007KM2-43FO;
	Tue, 18 Mar 2025 23:07:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufve-00000007J5u-2HJk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 23:00:59 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2235189adaeso2532255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 16:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742338858; x=1742943658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsyWzi3KnCZDSIQ4SscmiQvCbCr+L8MktGb1FOBdF5k=;
        b=U04tUF4Mb57tf/ywpxSI6DdfuYXrVnRU7R3x1Jne3UfHDSgRFenuGue1HSUaxLe/+n
         nl9pEaBUQ4kOezPEj/Z7aooKdVtRaXCIoOUH+1HMNhV/wlGO8poOz38EZgMgcnI5Cpb8
         +YXWec0DmdRCSogV6rpo+3BZS2CztIQnlejFm5HJfNfO0zQAyuCCrprsrRCJ0bJHJUrB
         BYipd7oSjbKeIYywnC93TXRaXK72GWLaz51yfrnUQTTPJPdfxUgNg9XRqEoS9IIt9v+L
         6Rry3ps6+JaK243grPkL50lXqLQqep5CB9e1fYd0WcQ02My65i9pNRMl71GpyZarfiHh
         MnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742338858; x=1742943658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsyWzi3KnCZDSIQ4SscmiQvCbCr+L8MktGb1FOBdF5k=;
        b=Uw+7F6Ujz5wezhLAlBBN6y4oNQt6Wg2JlU1kdz6FQKskyc17iBMLwqJW5+4sUABGXT
         8MsXWDDP3J2h+1bIxeDs6tXalaNIba3bI7G6BotQoVi5dY29tjMRIwIzxJcNaHE2lAd3
         CTjbOYPsfxnlmhND/MtFxlTjzSmzWASQE25Hhn0J1K9dzNp2i629svTnJVBtR4b/ZT3D
         OjOzGoiDkGqPQIuAR1g3N5hjSfgjn2xRAaOydV7VovvbtaQnIfz4gNHFXXKlit0LYGCy
         N5FrvxqweFbblUjA1ujPqJ4nxNjxwoEasW30xmzporUfBjeN1iCeZOacItiFpgPgc52Y
         ufOA==
X-Forwarded-Encrypted: i=1; AJvYcCXdCoKGJE+KFlPMH+lgu7S9/LTe1NvOQuyUL0ahV6OnLp40mnU70f0M/1nfzPl/jyDCR01ysKLoU3+c0Ht2qyrk@lists.infradead.org
X-Gm-Message-State: AOJu0YwjcvAGnaaqgvdtcjWIxxJoEsPEJxKjnT6IhNF52xLrOjjx7j78
	0FK+4rMoHflQ37D+xKfNAKT3CF/xmyLLZdGiIit4dPtFj/OhVt2TWNXHaQKyhhU=
X-Gm-Gg: ASbGncvrhTBzwRR5YR1JmplIcPP7A/ei72AMGOAJ67B89UVicOD0NEHwgVF9L2hhaeo
	KMObtTjeMa3ilqJmeQiF7zK8O9two4z3hlpgDGbCcdsmR6uoj9qiPo37GgNNCgR70b7iwrVixyL
	gmDMiaZLyHag4PrfNguYzrsTT63P17dtNdBKNy1U0FFA9Lhbr61vHkw3QrCpAmfz9E3xQ2Nyi8a
	OlLGO8vM6nF8TazFT1tWO9JGgeeqD3WAfI4Amnm/4NAKvFk84BKs8lJbRtOtp/bPh7fNR9HMUOZ
	XNL4NxECkHs8XZuTwREMscYMjyljVd3QsxqiP5+uhW3yz21uSUmJjI6PQFeaITq6SEDQ8n9JlnM
	wyUVDaOQ=
X-Google-Smtp-Source: AGHT+IHUNJViFXE4mZINOgNDoCllQmqZOnocHLrF3VCSwCnt9Ce0i+DvhytxOw5IATvfS/lSW8+VYA==
X-Received: by 2002:a17:903:2301:b0:220:cfb7:56eb with SMTP id d9443c01a7336-226491f957dmr7833935ad.26.1742338857707;
        Tue, 18 Mar 2025 16:00:57 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f14sm100739465ad.111.2025.03.18.16.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 16:00:56 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Raghavendra Vignesh <vigneshr@ti.com>,
	Bin Liu <b-liu@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 2/4] pmdomain: ti: Fix STANDBY handling of PER power domain
Date: Tue, 18 Mar 2025 16:00:40 -0700
Message-Id: <20250318230042.3138542-3-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318230042.3138542-1-sbellary@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_160058_579832_78407B8F 
X-CRM114-Status: GOOD (  13.72  )
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

Per AM335x TRM[1](section 8.1.4.3 Power mode), in case of STANDBY,
PER domain should be ON. So, fix the PER power domain handling on standby.

[1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 drivers/pmdomain/ti/omap_prm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/ti/omap_prm.c b/drivers/pmdomain/ti/omap_prm.c
index b8ceb3c2b81c..7e36e675a8c6 100644
--- a/drivers/pmdomain/ti/omap_prm.c
+++ b/drivers/pmdomain/ti/omap_prm.c
@@ -18,7 +18,9 @@
 #include <linux/pm_domain.h>
 #include <linux/reset-controller.h>
 #include <linux/delay.h>
-
+#if IS_ENABLED(CONFIG_SUSPEND)
+#include <linux/suspend.h>
+#endif
 #include <linux/platform_data/ti-prm.h>
 
 enum omap_prm_domain_mode {
@@ -88,6 +90,7 @@ struct omap_reset_data {
 #define OMAP_PRM_HAS_RSTST	BIT(1)
 #define OMAP_PRM_HAS_NO_CLKDM	BIT(2)
 #define OMAP_PRM_RET_WHEN_IDLE	BIT(3)
+#define OMAP_PRM_ON_WHEN_STANDBY	BIT(4)
 
 #define OMAP_PRM_HAS_RESETS	(OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_RSTST)
 
@@ -404,7 +407,8 @@ static const struct omap_prm_data am3_prm_data[] = {
 		.name = "per", .base = 0x44e00c00,
 		.pwrstctrl = 0xc, .pwrstst = 0x8, .dmap = &omap_prm_noinact,
 		.rstctrl = 0x0, .rstmap = am3_per_rst_map,
-		.flags = OMAP_PRM_HAS_RSTCTRL, .clkdm_name = "pruss_ocp"
+		.flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_ON_WHEN_STANDBY,
+		.clkdm_name = "pruss_ocp",
 	},
 	{
 		.name = "wkup", .base = 0x44e00d00,
-- 
2.34.1



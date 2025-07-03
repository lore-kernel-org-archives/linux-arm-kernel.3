Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52245C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSM5+fYnMtOsm8GdwVjstZSV2NM3rH5RSvo+XZzua+E=; b=Gk/jheJVacbhdyotrGOx9scaEj
	Dt9WkkFBJ78j1qaMNqH1jjzVzQ4KT+Z4Ypvc9NrT8g/3bp7U9f+toNKVO5FnZVSbBi86IMAwpU0sh
	bx2z4iOh1uNaNU4NozWVyMEmcXcVR/d81hj8nbvLK0P5j0YXMUDKGZqTA3uGiiKs62l25ywmi2NE5
	K43EWk3MVaawr2IqvWjz1fLX1Th7Va4ww/tq0i7rJAilIvC+BsHpKvAMic7byvSnf2A8xscgR23Pe
	TyuFxYfmK30EoElQrtiI93S8pNBxUSo2WoRQWkHmqR68S4aibxOnboSqnk+NYtAcVK1+TCkhTbzIB
	S+cbv3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzY-0000000CTHf-2lPd;
	Thu, 03 Jul 2025 20:57:12 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLcV-0000000BmK9-1lph
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:13:04 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-553b60de463so19572e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555582; x=1752160382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSM5+fYnMtOsm8GdwVjstZSV2NM3rH5RSvo+XZzua+E=;
        b=FTpFIa4Rz91se13AWSanlT+j1P5U4pchlVg6x5edtZxql5HMjksCZrzHzEOfqlKgh1
         k3498PCvXvNPF1YcCJcIGcEobBnbmCRIKcoAkXf6ybbcc5feWmRex/iCf+WMlNDqNgsq
         bfNpm8Wh5xaeXf8zkvYcokA7gX1lL9+mFHU7Ro6Wx06d/iLNKPXLagWI0pr8zg7D8UTh
         8teeZOnNwRLQxjaqgopERcn4OMheQuiYFGYBOcOzrArAJtZmf4KvrlKIHoqUYpej9XX5
         MTl4F9VdSR+GVUNmU9ajMrnpMSIVZevtDxsp3QHRkHVqGSBasJvj7XqPiapxVpfkLmvT
         iImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555582; x=1752160382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSM5+fYnMtOsm8GdwVjstZSV2NM3rH5RSvo+XZzua+E=;
        b=qPmyl3cZxxNHqMPQiWx1PuQg0lXSSnG/m+3kEP2RXX+WcxcjzYfqvQx41kJ5UKN1KY
         6Z4H9ofIEk+cYjJ36yHLb4jW2BB6TE8uPgIrjygThZrVjG7OqzA83+sD8oPUZggHXhBB
         WGVb9em4VCjiODPF3m2N3PsGMMk5QavAcGyqq/dGWUCJze+GxtqVjJUK8dL9Qc0JQRIq
         lWuFBDLsAJ0QUzp3it2Y/BHBCCTpdXSlKIqedlxPDyRNGWRGxylHM0gcdfFSWMKjI19i
         wAtAi5GsQqJdrKI5MGfT1jiOE8ewStq+/EiBWL0KZ6BzBaPLD/SY5XjRna4VI0Oj2jLf
         ZGjg==
X-Forwarded-Encrypted: i=1; AJvYcCU+Vdih9jZcpy9zGicJT50LZlk+EUl+doixL8Vcbr5KetdW4iV9L1gN32H2caUP0SFMbP5H3J6TpvrSTWmNEKn5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhlat8BJ5CSBTOkRcUckAmR+UitzZdAkvRsvjyY/wCcrv21x2+
	/VCksCzmQva8wxU1LYIrKfPiwlZzqhHNQj6HwN/v8YohnW3SAvsRkzbx
X-Gm-Gg: ASbGnctI08zNimGymh8+hyNM6Rdtokhuvm8kZB3+a5azE7YIfy9OxiZFFU1rrUhbdhA
	x/ky9WwrV3aKdDsRfi/9x/L4IMjnPtCFhF861acpNy6PVhOsOyUYi/kCAfzYYqT/wPO9RSjj5LG
	Gyz3u0sCPXYjeaYReis2ZZdeJrdOck2oOsij7rciw84D7PxQVFCvk0iAIeSZto27Rahna5pDr6c
	OorrOOqKO28ghSDng4q/YIwxYANY8AiLYGaKWQsfu+Y6MGP50D7RbBjW6/5e7gQQKUgYui3vELH
	q/4GNzfYiPUPQAKCLY+Bj0iiIyz8XbslXWYnJMcWw1SB0wxkqZObTic83mCO6Z7b795Z32E=
X-Google-Smtp-Source: AGHT+IHcwagZ0bz8urHkgSxiQduhEhToNj/qwjiDIvUuGgoplh+L+oS4JKl6ajnw+KxoaxGfavI79w==
X-Received: by 2002:a05:6512:1390:b0:553:252f:adf3 with SMTP id 2adb3069b0e04-5562ee3f0e3mr1589090e87.16.1751555581341;
        Thu, 03 Jul 2025 08:13:01 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:13:00 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 3/8] thermal/drivers/sun8i: add gpadc clock
Date: Thu,  3 Jul 2025 23:11:27 +0800
Message-ID: <20250703151132.2642378-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703151132.2642378-1-iuncuim@gmail.com>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_081303_459995_25E8CC24 
X-CRM114-Status: GOOD (  14.27  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Some processors (e.g. Allwinner A523) require GPADC clocking activation for
temperature sensors to work. So let's add support for enabling it.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 226747906..45aaf5348 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -66,8 +66,9 @@ struct tsensor {
 };
 
 struct ths_thermal_chip {
-	bool            has_mod_clk;
-	bool            has_bus_clk_reset;
+	bool		has_gpadc_clk;
+	bool		has_mod_clk;
+	bool		has_bus_clk_reset;
 	bool		needs_sram;
 	int		sensor_num;
 	int		offset;
@@ -89,7 +90,8 @@ struct ths_device {
 	struct regmap_field			*sram_regmap_field;
 	struct reset_control			*reset;
 	struct clk				*bus_clk;
-	struct clk                              *mod_clk;
+	struct clk				*mod_clk;
+	struct clk				*gpadc_clk;
 	struct tsensor				sensor[MAX_SENSOR_NUM];
 };
 
@@ -417,6 +419,12 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 	if (ret)
 		return ret;
 
+	if (tmdev->chip->has_gpadc_clk) {
+		tmdev->gpadc_clk = devm_clk_get_enabled(&pdev->dev, "gpadc");
+		if (IS_ERR(tmdev->gpadc_clk))
+			return PTR_ERR(tmdev->gpadc_clk);
+	}
+
 	if (tmdev->chip->needs_sram) {
 		struct regmap *regmap;
 
-- 
2.49.0



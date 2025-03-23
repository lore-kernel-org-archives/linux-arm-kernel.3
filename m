Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238ACC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB2B+UaRvhzRZZ5Wx1Ln6+NaDhGt6Oe4sLGxlVN20j8=; b=WZmF2SXH459/rUPV1/YLnUv0ds
	7j4bmIs5NJ178z2KLToTNDZoLQK7j9qFTA3jJNU291tar4hugoYRyv7NtGQ61HDvylC6CdJoLRF6Y
	RHF8CB6LgJeYteqRlJrJCjGrSMo6Mit03IN8PxdvRAFdZHtwxBayWvYDGbwjN3k+DrTyqU4Mjp18W
	brPGBTGCOLO4EeqlvZMZhkwwXTgbsElDM5kWk/q/SEye30HUG99Dc9A/HxoGOWqMOlYXkKGG2LPIm
	IJQvcnLHh/l7FuvJ0bJcwODkW2i/M5OebfJOX2LOxywjaYc/Vih9IPuC0+v/pEXFqGu9RzfwPz/fj
	raoYYRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUoc-00000001ugd-2zBn;
	Sun, 23 Mar 2025 23:33:14 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyp-00000001pEU-46Xu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:45 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac345bd8e13so673832266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769583; x=1743374383; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qB2B+UaRvhzRZZ5Wx1Ln6+NaDhGt6Oe4sLGxlVN20j8=;
        b=LAba9iY2jDdPjgIuJUp3NemEs+FeGMAoE9lSpQKX6H/R3TTpr+duHFOdFEkzhPtCER
         /gakWhvxe8n/jCqy9ZD1ziUeFR5ez8KKq06h1/YoCy4cLm8swQVAOxh8wMP6gI+lFuaL
         J9WRTZRve9PpOaQUrnSjDGkadn4qEljPbMPenh6zOhNzTyfRPQAI2bsC2wLHX04JBh2A
         JE9uiYH7e1U11DGqn9Oo99P7GaOwzVVcIIePJ1v7zenfiK8ruXsvI8YFFsSgkHIeAU90
         NCZEOHjJhWWTysrzBuxX3PSETeZ/9jffO56zY8Z8zUzF3wvXIVPqHraoV56EjFKPvDvZ
         tg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769583; x=1743374383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB2B+UaRvhzRZZ5Wx1Ln6+NaDhGt6Oe4sLGxlVN20j8=;
        b=pHQ2cQ85dhev2/V2Tqe5vztLDZsJ+JrbWLScppKI5WD5PnbrprGMgwUjkBXn6reBS1
         8hvS7bVSnvTvoFZBNoWIh524GoM7SC0ER8f0fg0+aeBf1vz12p58t7rBj2di3XP8WwX7
         ccbv9+M/HufIQwOEzgh0KzQnE8rngqu06Z24EKnPA2PqGmjJcQ06O1Tpb9uHpRxscN8b
         u3BJB5CCrO/YLsV236UiWtCFu+iMfk8rzxJuUuW7Gcf5cQ7DuX7Q8/lucm1hSWwSxiUk
         2wm1ktXWpFPuZvTdO2ZvgrTVJHhivKIHq7JU5IMlbuaqmHWt0aUUZw8OCz25FZ69WqC/
         3IGA==
X-Forwarded-Encrypted: i=1; AJvYcCWvxf0blmTL9i+cqNv2ZpnMovpVd6uMi47aT2CUI1hMTLU9DZFnvi8PS9QhSumfSFr5hSLIvQkLLE17S5Qjg1Kr@lists.infradead.org
X-Gm-Message-State: AOJu0YzqOZG8T44cxP+80pxhTYu2oSYVHU6dD3TKCo/M/5TNmo+5kEhW
	o1YIeti3R4F258cHtHGSZZervRLrbT4vyDK0Jq85e6EL7yuKdFXDLGkpURJyPd8=
X-Gm-Gg: ASbGncv7Joen4rDdSX4FKE8mBHJ6wrp9x72tvwn1JIeoqElAmmD/N1apuIhetsAYRuq
	FT/aZ12RqtOsh2O68T061KJzYXlT2iXfhoKcS3fe8dzSFaTQr1IWWkrc4AxBezhYj+DuLyccoFb
	SyNzSopNfVxuHSfzcBEvmKleLk2ELNCm9tg2x3PSZxR36mtFFI/QtZFMoWtvUeyb/7nn039oUgz
	0n5tJeOkHm7I8E10l7i2FzIHD1WO8Y8eJmlGi6Igs/s0o/guECrSQV0RXq59KHjBGp8C4/Z153D
	5fy4NUKWYlM0+1y8JgouAoF4uAnkZmBNeFq0GYlKl46slY63aSm1P6H0R1bzRA5SCTSMKMrWsMY
	NGg+3hLjx4Dfxw0TJ5h0hAFGVaztl
X-Google-Smtp-Source: AGHT+IEqdMFkeJB9L19k5i2T9SHkqV7HBIih5q+Sk1+mGJp+qYtrcbGq+req37UQlXtoOfZvy9bw1w==
X-Received: by 2002:a17:907:da0c:b0:ac3:f683:c842 with SMTP id a640c23a62f3a-ac3f683c845mr1099102666b.42.1742769582647;
        Sun, 23 Mar 2025 15:39:42 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:48 +0000
Subject: [PATCH 32/34] rtc: s5m: replace regmap_update_bits with
 regmap_clear/set_bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-32-d08943702707@linaro.org>
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
X-CRM114-CacheID: sfid-20250323_153944_018052_6DD05475 
X-CRM114-Status: GOOD (  12.30  )
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

The regmap_clear_bits() and regmap_set_bits() helper macros state the
intention a bit more obviously.

Use those.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index e8e442c503064eb4e570af5bf7dcff6bfa7f4656..fb65a8e439d72d9070751c00f5826a403ac0b416 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -338,8 +338,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 
 	/* On S2MPS13 the AUDR is not auto-cleared */
 	if (info->device_type == S2MPS13X)
-		regmap_update_bits(info->regmap, info->regs->udr_update,
-				   S2MPS13_RTC_AUDR_MASK, 0);
+		regmap_clear_bits(info->regmap, info->regs->udr_update,
+				  S2MPS13_RTC_AUDR_MASK);
 
 	return ret;
 }
@@ -351,10 +351,8 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 
 	if (info->regs->read_time_udr_mask) {
-		ret = regmap_update_bits(info->regmap,
-				info->regs->udr_update,
-				info->regs->read_time_udr_mask,
-				info->regs->read_time_udr_mask);
+		ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+				      info->regs->read_time_udr_mask);
 		if (ret) {
 			dev_err(dev,
 				"Failed to prepare registers for time reading: %d\n",

-- 
2.49.0.395.g12beb8f557-goog



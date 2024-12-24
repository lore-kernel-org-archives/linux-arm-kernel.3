Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506F0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdy6SZd8FG0XOydpfx03ysjyzRhbHoW5G6enWzLPqXA=; b=meqE5z8wzxSuViI6qAuMvcsmpk
	3lMcDcOCOc+q02dIj/fo3KHuiCTw48kP/AX0auECxzONvO7J/Fknc0PWcK28IW9I3Nfv4kEu0TZx0
	wLk/1WbDkQVHiUawKXryOSM02CtWEbUraThWrzFRRHdUW0nE9w+sAZAnOvBlmJV9LHH4FwmqmHOsN
	tb3ZPjliAnUgvzDwT8KXxYkkfuGhkQv3fG8g7saiktT+6tcYEto/LV5X8POSmuA09tETU4vvFsLCq
	Ehb7TGxLMQJKSTGR/Cl2j0qfCtmvGOwfCM9VgqMYg4TWWjzMyZnY70TIYHBh3GU51EEhegWOcsEGj
	/qxc87vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ60P-0000000C9Qa-033D;
	Tue, 24 Dec 2024 14:35:29 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5vm-0000000C8lu-0nwI;
	Tue, 24 Dec 2024 14:30:43 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso890055366b.2;
        Tue, 24 Dec 2024 06:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735050640; x=1735655440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdy6SZd8FG0XOydpfx03ysjyzRhbHoW5G6enWzLPqXA=;
        b=frZvbvLyzi6PAVRt+NX0FWfPJRJzYOJT8slaMSrlA+kxG6u2CO1DBtvsjDV89vJeft
         LnFK6zZy7jJJdxd21OenDUFINrAq9gM8nqBSG+y+SOjmWSkTBA9IErSYwbdjurelTI7A
         5XlEyLXcyo9SeK6rNmGNY3tahDnbgL5y+kBg924i6Z9RactEMUt/h5Pk1eyWx1jSYKM8
         5Owjoc9Ns91vkN/mcCcw1/3s3LCn3oLZaZd3zcWmcowfofA+4lZRxn3IeER5EmA7VwbJ
         ixIL+7npB9y/XJEM+UqNXqb0DMkM2hDn3Wk17vrG4xLxrpdaeUOrPXQTDJG82hTDNx5J
         ujvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735050640; x=1735655440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdy6SZd8FG0XOydpfx03ysjyzRhbHoW5G6enWzLPqXA=;
        b=qNe4bHxvmOFdERSju4m3oSCza9s8MG1ZM6leC+ylkQTGfmBdSPb4fyeOPZF94f8W0a
         2h4o8Cl+9zlKNTkhK/75nvOAr6k0w5HmRxSDPyoCCv22rq/gOQJf8daD0IAH0zi8nz5v
         zB1wQ1aMP2bE9V70EvdLppCcajwxlH8uDykyAgqaHrR6dCpZPnyXi8z9O70+T2YpM5Km
         TZDE0TuU1+6dvEHcfsJ053zGOAaLwkosEIvg5BPnd2W1V64Zogwgj0NvZ45QBpcW1D3P
         FL7Q9hUR9ZewF8odpH7vx89Mye6j6BPsJMAeknB0bB9bIfWWaLFM0sF4LpMaW55cfo9C
         P3dg==
X-Forwarded-Encrypted: i=1; AJvYcCUkleLgQcSnnVqq65dzvBYKrF9fvKptTpgiX9loj+ItfV1el1LukJfcxtM+FZyM6DmIKRK09KlbHnoRpN+a@lists.infradead.org, AJvYcCXGuuoguhhmEChq736+eHEwryxjchK4RT4Cz44X84lbuQ7RNJyk4C2/zmfV0BUsDZJxRhLPM3ktz6e2+pYGQktFAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYAiax46RfSIC7YmkhA9QBc1evc60aRnx3tnFLcKaxKGE5d9c4
	9xJRjsQUU7pZ/8ZxbeOG+oXrWoNqkQgBkUOqZdrsbwoQDfDnQWae
X-Gm-Gg: ASbGnctvhdMxU+pugaRDwB60bp8M4UtKRvgKTE19v6IpgD7zrwRZZq/xfAWmQuLCR3Y
	aXjHEx51hOBydSdbZ8kJpZ75WRJ9mTvQkSPFiDDKQz6GeHAT+AEDXypD/iSsibZrup3uUYFOBMB
	k9luafEUv7jRkm9MyH91+0Sf2mzXUAj8OWnhsn3RDwoYmIf3Q/3YEwVMIJU/bEwk8D515ph3x3E
	jQDCAn7U5mZXOmjhphQ0lSiTRbc0bUohG3YMjun4sXP++kDXa8tgBwMYoRIBUXqCyEUP9jfovzd
	IRons2yHyx/f9gsBGHWkuwdcxUSyoMQO+/kVj+13yP0ea+fp3xgcAUarIbo83VLnBXwzA23PXGq
	3WVpBflI=
X-Google-Smtp-Source: AGHT+IF+RA6pGEMNPeEIvtinon7wnHw8ZYLmyQnZK7PR3NdDBs1HQuAtj3EPBYyccO1+vDKHN6vReQ==
X-Received: by 2002:a17:906:f59d:b0:aa6:9372:cac7 with SMTP id a640c23a62f3a-aac334c1628mr1727003066b.31.1735050638526;
        Tue, 24 Dec 2024 06:30:38 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a5d7-4700-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a5d7:4700::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0eae74e4sm658827166b.91.2024.12.24.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 06:30:37 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: jic23@kernel.org,
	lars@metafoo.de,
	gnstark@salutedevices.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/3] iio: adc: meson: use tabs instead of spaces for some REG11 bit fields
Date: Tue, 24 Dec 2024 15:29:40 +0100
Message-ID: <20241224142941.97759-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241224142941.97759-1-martin.blumenstingl@googlemail.com>
References: <20241224142941.97759-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_063042_245641_444E9EF2 
X-CRM114-Status: GOOD (  10.08  )
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

This makes them consistent with the rest of the driver. No functional
changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/iio/adc/meson_saradc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 4cfbb3482a2e..469af3c57066 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -155,10 +155,10 @@
  */
 #define MESON_SAR_ADC_REG11					0x2c
 	#define MESON_SAR_ADC_REG11_BANDGAP_EN			BIT(13)
-	#define MESON_SAR_ADC_REG11_CMV_SEL                     BIT(6)
-	#define MESON_SAR_ADC_REG11_VREF_VOLTAGE                BIT(5)
-	#define MESON_SAR_ADC_REG11_EOC                         BIT(1)
-	#define MESON_SAR_ADC_REG11_VREF_SEL                    BIT(0)
+	#define MESON_SAR_ADC_REG11_CMV_SEL			BIT(6)
+	#define MESON_SAR_ADC_REG11_VREF_VOLTAGE		BIT(5)
+	#define MESON_SAR_ADC_REG11_EOC				BIT(1)
+	#define MESON_SAR_ADC_REG11_VREF_SEL			BIT(0)
 
 #define MESON_SAR_ADC_REG13					0x34
 	#define MESON_SAR_ADC_REG13_12BIT_CALIBRATION_MASK	GENMASK(13, 8)
-- 
2.47.1



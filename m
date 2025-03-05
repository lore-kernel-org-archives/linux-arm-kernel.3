Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEDFC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LJW9aE2UhCV0B4dc2B3h84ZOkRVFNml7XUku3ywU8Fo=; b=xb8Swom/lRUSCQ
	nnnvvA/Up1QfoT3llbV27bgdbF5fiZ2LBGFrUFeIejjONbpRd0FFpIY6z3YrWMujdVX5UU4w3pVdv
	bLgJg9ToSYcaDX6ynXuxDJBeHMtRaH6RcWPhMXwIo6p+ZReg7uw6blS18jcMsVA89DuVMH7HuHZyz
	XXdAImaHKIulznA/CcDq/VD5MmUTdIOi3/07G814sJKgBVmOeC4ANUf6AGyUptZjMGBM0L76xBNDo
	qTjx3EquNyWKjB1/rp1VVo0ITVATZxJlV0+A1SuAcvmwzIcpgVb39mK4I8k0tksyMzPjNXdZpNekl
	vY2cwm+S8Mau3dnr8DDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkN4-00000007P83-1rq2;
	Wed, 05 Mar 2025 08:44:54 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjLZ-00000007G7u-42CW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:39:19 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-30bb75492e4so30669081fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 23:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160355; x=1741765155; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJW9aE2UhCV0B4dc2B3h84ZOkRVFNml7XUku3ywU8Fo=;
        b=aIJppTNCZ4vksrmXO9WgXX5RtK3kGrdwftbn3CVUOAxFXnxe4+qic7YOqiAgGC0HjG
         ZUqUfTQ/OEoxG2E3L4U46r6ld49d1B11IL39RDKmbsJBOf71lVkoYKJBvKPW/cfpdop2
         3QQ93VTErg5b1NYfK7iAEZ1SkQZqQhRwJY9766sBDSUJRn/eDyZcNd5QlV67ZIm27W0H
         c5ibsR2t7MUC6zESHPzp4E8sFA7LvZbMXEnZ1yLVCzNoZX/WGkhQSyoEElKTbbkQ+Isr
         LvgQFD0An/DxjvBKBSRh2X1WrZ8z6n0nM0AiZR+vbIiyGNGWOSg5gDDOmh9U+6SQ5UDV
         T6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160355; x=1741765155;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJW9aE2UhCV0B4dc2B3h84ZOkRVFNml7XUku3ywU8Fo=;
        b=btxG1NzYWmbOFuEiLXOfP6Gx9/CLHtQLUAqwzXaRPRIjOqVqkOFgzm2XZe5oK2I+Qd
         t40ueUhQ0jdIlLUlP5S9ocG+m0g5cIgXV4pMPfK9A4oN0Q4ZZtZsC3/j2EeTSMely47t
         +nrKyLc0QdodBUMiWHaxuGLjkAtPIykB3v352QzAhdz2M4PEVpbwqqtL46uQNrgyJAo+
         9Z7DyZGT+Nxb7RaFDSAUDUxTKn1o6CWlEGlvKq4uhtTkRTvRKtLzkHZt2p0fmkyhd1rl
         JuoCgAWIkg2buQWmxlVv35RG92pdWjOFbuZR3hRcs9qyO6pvQJHb8xCfxlOeJeOLrao3
         KR+w==
X-Forwarded-Encrypted: i=1; AJvYcCVNsLZgrcfT/2yiTOnqNT5sD4zeHMiaRWSHySFVmRByrLUvrENTArUKsnuEQwNfE3UDh/+/wBxTVDdCBwcxH4Sq@lists.infradead.org
X-Gm-Message-State: AOJu0YyEfgVPKG8tYTi8QHbX1fw4+fa2ZhshnhucZGP97YxAK4LL0pRC
	B2X0HLwH1hx0pgJA1p4QzkPMAt3TD6XCpaDtcykRzk4HBYRy7Zeiw8pibumoYMU=
X-Gm-Gg: ASbGncuKYRHM4D6o6LG/gn869M8O1C+r+fiN1p93Y8HgG82q6OUcfhjfpHcc7oQb9kz
	wdkqjajVlwU6HwAMEOA/trLC3TQMNTwwo/m4pZiCYs2rkmR2HX2vEAMt81mubCcMTYm3XJclY78
	GVeFJWh4F0Fv9dyblmoE1c/WkfZwg/FJzZH9SFLAHDEKKPsDc6YV/glAyDVkO+3kmEk8I0/fvgf
	7GX+1B551XI2k0AEJmzs9nmeL+nRwk/GphQ9qewqTkuLK8AZeaksyoTT3NSiWo/bw4wE9ZTAsOc
	EgySwA3DNLIBIUQkt917duzwHDTBLhtGJ/ZM9uIH5hK3sZb8gZvz0bo=
X-Google-Smtp-Source: AGHT+IEyQAzaW4gq+8l1Jw587sTvvOjYY8IgYjgeac3pSvj7GEl+4Qb0eshDTUKdJvdxEf1rchKeSg==
X-Received: by 2002:a2e:a7ca:0:b0:30b:971c:96e6 with SMTP id 38308e7fff4ca-30bd7af6208mr8775671fa.26.1741160355350;
        Tue, 04 Mar 2025 23:39:15 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:15 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/6] ASoC: samsung: GPIO descriptor conversion
Date: Wed, 05 Mar 2025 08:39:12 +0100
Message-Id: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKH/x2cC/13MQQrCMBCF4auUWRtJJzS0rrxH6SI203ZAE8loU
 Urubiy4cfk/eN8GQolJ4FRtkGhl4RhK4KGCcXFhJsW+NKDGRhuNStxNnmFWY/Q0irLGWqovZsL
 WQDndE0382sF+KL2wPGJ67/5af9cfZf6ptVZaNdYhdp33HbbnKweX4jGmGYac8wdF5AK2rQAAA
 A==
X-Change-ID: 20250302-samsung-codecs-6366e1b3f283
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_233918_035980_F72DFCCA 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

This drops unused includes and converts one Samsung
codec to use GPIO descriptors.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Collect Review tags
- Add a devm action to drop the gpiod table in speyside
- Link to v1: https://lore.kernel.org/r/20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org

---
Linus Walleij (6):
      ASoC: samsung: bells: Drop unused include
      ASoC: samsung: littlemill: Drop unused include
      ASoC: samsung: lowland: Drop unused include
      ASoC: samsung: speyside: Convert to GPIO descriptor
      ASoC: samsung: tobermory: Drop unused include
      ASoC: samsung: tm2_wm5110: Drop unused include

 sound/soc/samsung/bells.c      |  1 -
 sound/soc/samsung/littlemill.c |  1 -
 sound/soc/samsung/lowland.c    |  1 -
 sound/soc/samsung/speyside.c   | 47 +++++++++++++++++++++++++++++++++++-------
 sound/soc/samsung/tm2_wm5110.c |  1 -
 sound/soc/samsung/tobermory.c  |  1 -
 6 files changed, 40 insertions(+), 12 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250302-samsung-codecs-6366e1b3f283

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>



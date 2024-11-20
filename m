Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19A3D743C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 19:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jr7qqPzbHAkagf9kWZH8AFBjV0Ls4zMfwt5LoWCWDEI=; b=pBWbdi05AV63Vi
	h24mX706aoBVzoyUVrBA5h+TSLKoVGmxGo19kYjXRFiBOkg+1rNogAVrrInTUKskQ/x6BfHjF5Aro
	15BAYT5eCtmLQOlwsVa1UPq4vRMdZ7Zud89WkrVe1ZixgfBF4eJ/6yU1di919gkzIoLG3BDP8iVsU
	+HnOmfqDxXIwR1aiQR9CKQ5R2uH4bOY9UgzNCIVHXRO8K2o7Eed6MIly4zKrTsaEMahQPytJj+1WP
	k/jFqNm2b8SCOWGRTn0Ex3Iduku6FN1+nN61mLll9YLrnZs2vo0RqMh+w52p3QTrJMwZYA8J5Q6Q2
	BhYzRZhtIX+/AG8JUE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDqDe-0000000G6DO-2Kmk;
	Wed, 20 Nov 2024 19:18:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDqCh-0000000G60r-0Efz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 19:17:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4316cce103dso381795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 11:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732130249; x=1732735049; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jr7qqPzbHAkagf9kWZH8AFBjV0Ls4zMfwt5LoWCWDEI=;
        b=JmATwYKV2tvpLuvZ//t+JQlRJ9Pk8juAamlLnYNmJosH7UoZ5r8qTLeH9IWm7usWVd
         xwee7ouSEwSFhbCeXzTbEaTbLAYErz63WXnd5RhTkDYi+Btf7rIMEto4j9Ree9eowYMg
         2IVV9SkxvzM66g7pfVLxZ8DvlOcTUVn+uSk/WMOgRHKrt4ttxtaXRrJSjb9rOidsciOZ
         hG0ulpiJcJG8sP6UFZfEeyBqyyJLjvNxRlF06IZFMUzygHxp2ggk3Tscc5szhmhfCo+m
         aPSyiGSvllfJ335yE82X+jPRHrJR2Y9xtMqQQiS4q/vtzVbzXtJ6CEd/iEFFwVORzEzc
         uB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732130249; x=1732735049;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jr7qqPzbHAkagf9kWZH8AFBjV0Ls4zMfwt5LoWCWDEI=;
        b=sUTkrg/txIcsnahQI5jGJrUbLbtPadgAGy/dY6J5I46N8kPE81KrQTEQxtvMUWTRwP
         ASbUSTiE334FRfpVLR4OwvcOmuK0GEWq0PflUDqEvq04fd2JIUzFMrO4kYM69jomCYkI
         DKfZO4pAhBiqgZ4Gjkrvm7elKT+oM0D0aA4JqVHi7i44Obka4stJl8Sb1P++IAHrZtLI
         m/xTYJjpl86Xi2Gp9TV1bDrEryyAfdfbr4rIBL/iXwqHBYACNPx4S+yUrYdQjwzLd6fG
         Rerx1xNDLsS514Z9FZ7kV4Aem4DBeDnm+Clr4ozgN6GOEj2agYPl9JOlj1W9TsMAKJqe
         LHmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa+FHBa2CJl/lStC+hujUjMEfcRCn2Cu5aYm62XbroiNm0Tmv7X0ksgnYGDNgk/VSQIS6QzpfKqqiLqNHRrFT/@lists.infradead.org
X-Gm-Message-State: AOJu0YyZMZKrK/QvAZ/arzI+xIw9XKh2BTy8iXv8mLmGPhCMiMRddghM
	iNgDevU8iCsHdfFZimfIXmUCT7Aufkz/YYjtb19rVZSv8Wj+2wjiy6cN8wyNpF4=
X-Google-Smtp-Source: AGHT+IHvFo9WlmxcMV8IjdperLMhQZjV3VgLzVSA3y+8HnawYzK6+2xS69U+wMdnZmgdTzRDcgK+WQ==
X-Received: by 2002:a05:600c:1f11:b0:42a:a6b8:f09f with SMTP id 5b1f17b1804b1-4334f0154b9mr36081565e9.23.1732130249071;
        Wed, 20 Nov 2024 11:17:29 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3825a2c5ef2sm172457f8f.53.2024.11.20.11.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 11:17:28 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 0/4] media: i2c: imx290: Add support for imx462
Date: Wed, 20 Nov 2024 19:17:02 +0000
Message-Id: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK41PmcC/32NSQ7CMBAEvxLNGaN4cBY48Q+Ug5eBzCGLxihKF
 PnvOHkAp1a11NU7RBKmCI9iB6GFI09jBrwU4Hs7fkhxyAxYotFaGzVQYKt4WPFeHmFqVK4O2qN
 xTeMqyMtZ6M3raX11mXuO30m282TRR/vft2hVKl/dWouEpmnrp9g4OxLZZr76aYAupfQDVR3xf
 LwAAAA=
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_111731_177167_EB7B515D 
X-CRM114-Status: GOOD (  10.62  )
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

imx462 is the successor to imx290 (and imx327 before that), and only
requires a few very minor register tweaks.

Whilst at it I also fixed the todo over imx327 and imx290 having very
slightly different maximum analog gains (29.4dB vs 30.0dB) and added
that to the variant structure.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v2:
- Added patch 2 to correct register 0x3011 to 0x00 on imx290.
- Corrected title for dtbindings patch to remove duplicated "media"
- Picked up tags.
- Link to v1: https://lore.kernel.org/r/20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com

---
Dave Stevenson (4):
      media: i2c: imx290: Limit analogue gain according to module
      media: i2c: imx290: Register 0x3011 varies between imx327 and imx290
      media: dt-bindings: sony,imx290: Add IMX462 to the IMX290 binding
      media: i2c: imx290: Add configuration for IMX462

 .../devicetree/bindings/media/i2c/sony,imx290.yaml |  2 +
 drivers/media/i2c/imx290.c                         | 81 ++++++++++++++++++++--
 2 files changed, 76 insertions(+), 7 deletions(-)
---
base-commit: ed61c59139509f76d3592683c90dc3fdc6e23cd6
change-id: 20241114-media-imx290-imx462-b6d1c24b77b5

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>



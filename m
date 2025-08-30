Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8239BCA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 16:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rI+9TEFW7c8SXLX59IxxVSbZo74iy4dg7/4hYEvNg6w=; b=PgQEZl17ZYS6Ah
	FmrKEdohdILB6/1N+i/CAuyEP58/eNw7+6MDS2sMt5uB5WZUYI5yywTa0AZZNhQsMj9IF2hEzhw1i
	k/zEC5HcNx5Em+gBWHS5Bi4vXUmiC/RkBElyiF+Qmt8Ni+cbJFHNEKc/zEqC+D27P83R9b6uuOAXd
	g+fGjRfAdHN2QFdHBTZE1GjjHeWm7233S/ICXQI49EBrFPy4UAUBGsnkH2vG7yj9gmcFePllqdTup
	zGmkbvisnP8QqpWmTMTdfW8Ax6ZpKYdg7R7jEYfD30gNeOruS93CaVm24CpedbfkWraP0TGu8mLdp
	SUxN8kVDlv0D9RBThweA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOnj-00000008AYn-26Fo;
	Sat, 30 Aug 2025 16:51:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOks-00000008A8z-3yKa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 16:48:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3cea1388486so172894f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 09:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756572521; x=1757177321; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rI+9TEFW7c8SXLX59IxxVSbZo74iy4dg7/4hYEvNg6w=;
        b=FF6wWmXZs3Mqc0NdTPB2ZzkB+5d2RGckIdamAbnCeGR/bcKTPavxdiEgbKPDLBQkyd
         TiWvS6PtUn7POA/keZbDD23brSeYB9ye9qYhLswkVp1dkEyh89fa3anXHuHS1Wv9EhNe
         rneLlH5JvquCPHA5dcPtsKsOjZopQZkLnxXvFqqOY5u/l7kEUaSjcJVWVUa4Gjk1asmn
         r8L4mcedZrl/8XxlXdj2uT1xeyZtMrkrtMH037q9H4/gK5ALQNlMtynMMliGtGxfK9pt
         6YJyu0FKxAUeodkm00r8Kfy4aGFPDRoIlLzd3SDFQFQWZQ3L65cI8DyELnL3G0If1Pjc
         LWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756572521; x=1757177321;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rI+9TEFW7c8SXLX59IxxVSbZo74iy4dg7/4hYEvNg6w=;
        b=cPIHAHlBIl2P426SN7ZcOjLGsFmdbftJGb7LbVNFDRnTvWDcJcUdY3WvKHS2JUof7j
         F0hP9QM8MEG0ysS8M/Eu/hrZVPrj+qtcR8hzA2HA7WGgO7CbO3B2VwJQAumI7rKOJc3b
         IquNungBtCWUI0ekjIboyhc5JkNhxWEDcHFgRl/wSkcrShhZ8VYaeLzx99ov3SlW1WPH
         G0cREV/wjBLdRWlkyl2sZUy6C9WjOhBpbkld835gtrnSP+7lk+R3hH6mdwM7acWd1upM
         eip1VKaDeb4R0aLeXT7YzG+zZBDgWzTay0F7nHRe2QaUYrefaiYW1r2RAVF2/NPU+GqP
         7aMw==
X-Forwarded-Encrypted: i=1; AJvYcCVEjwfnR+QW7lrdWSDlUOYfISNVLe7ijaSDG/9D3gOgW2lJcml+1Vlmi/ZFrgpjEAuY3xM/ZUrFaLims6CoEs5f@lists.infradead.org
X-Gm-Message-State: AOJu0YzjQ0Y7r41BRQqLcfo3qnWeKIquLjJIyPg8gkiKtWBt9cZxnY7N
	mp/iP1+bh2csdFD+7kEGsHFCRH9W16bkGwHS+kdscboOBxFgJyusY+FiohkA1bwQqAI=
X-Gm-Gg: ASbGncvKjURewnorwzUqItKOB/fddPwt86e2ululRDddRAU2+0yvC8l09kIHWlZMCyG
	68x/RHigI+Cqul5bL/ORWr34Ca2EI97mwrj8OfQnKdkVvhQxey0ziQFV3fcf24s3t82BQ4fDN5T
	/04GI62yuVE1A0SP/p0Wl2GMddd/M4YouJD0WMrJLVHTG4k+A+JfOLSd4NX+3sElGBbtr8CZHJT
	ye0oUY36PYYrxQ2qFYY2FMoIVSt8Y7nPKQkAGkI+lizCN0ydX7hXRCBCKimvrxcZ8+/lfBMwn9k
	l8swqbxLDUHSy2ZYo73j6qxbCBxyGWRImcftKB+QWk/l5Oq7aFqGgW7EpZ7XZNKeODhOyu5Gk4H
	MTG6xdiGO2d2OHH41X42CH8MOu2mWH70U1Dl5G3+c700Xs6N6NQ==
X-Google-Smtp-Source: AGHT+IFGSi7AECyXD5beDfkfvviE4VSoPFSm03RnqtK69pwNpNQQvYBcKrGHy25gGpl0+JN3uPjsMg==
X-Received: by 2002:a5d:5d08:0:b0:3c8:2667:4e37 with SMTP id ffacd0b85a97d-3d0fab2a6demr1709155f8f.5.1756572521266;
        Sat, 30 Aug 2025 09:48:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf274dde69sm7818129f8f.14.2025.08.30.09.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:48:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/5] iio: adc: samsung: Simplify, cleanup and drop
 S3C2410
Date: Sat, 30 Aug 2025 18:48:29 +0200
Message-Id: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF4rs2gC/3WNQQ7CIBBFr9LM2jFAJW1deQ/TBcK0naSBBpRoG
 u4udu/yveS/v0OiyJTg2uwQKXPi4CuoUwN2MX4mZFcZlFBa9K3A1Fq0Kxn/2tA4i500thdD12s
 loK62SBO/j+J9rLxweob4OQ6y/Nn/rSxRoCN9cdNDuoHMbWVvYjiHOMNYSvkCmoO+7a8AAAA=
X-Change-ID: 20250830-s3c-cleanup-adc-71ac80978520
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1090;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/yr40NhWQv2Ug11CJlWV8gxRtDh8+POFy/BtnxIC6hE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosytfwXY+6qS0t4VDJFlNL5VvQplxb/kkOaz15
 0/oPOSdmNiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMrXwAKCRDBN2bmhouD
 1yWED/9EgNIyUUaP8RhPAhL8uhU3TxBuThxk8dO5pkseUDiC/g02FVKyx385abCebVnOdADsDKa
 1A0BkUH7DYNxBAZTfj11aKLxLFGKmjMRBWBoc20vlJgVCBL9IOXlQIGwpriQcOwFnPId3gy1Xad
 BMXfu4ujElM3LukCAuu0nhiIZujXB9Pvkbc8r8EkOh1EeVIEOJKtIPRNXLqHlk5kGZEICnQ6aw4
 SEHHe0woXjpSfl7jzTquuzVFqwAgg2qAIOKnnK5tLfdASY3vkqll7m41zbVfW2X+tJycOV2cw72
 dDtjSLm9o8YwxOUvPSjAMyHgAaKE/BLs6+8zJywdAktuCjSSr/y6HBT1QmEcVUD18nqNI9mOqwe
 ajvCwxz1Ba2o9x/4dwwPHdZtaGdz18tF/gnT38t6n6Abu9yNGWiPl2R+wyuODY859zheIO4Ojic
 Xi/vqAU1TgONJNUz0SMO/8gJ+UffPkb4BOzBGBaKH99k+o8ECbeUPsMEyK4/uiYyON5EqL+xMQP
 Y2AlGbNzpkldFFHz8ZNma71jhPEIE9YnLhp8qc9S1uJ3qS/FjCVJLrjV0KCPhC5yXxgfm0qi591
 /bBxEnxCsZKxOMxSqsZcVbCUtIjoWieiM3p3fc3eyzctSyLcM5gulIb+7a0U2gXUcQ2msRPQcca
 DG7jMMpS/XT2zdQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_094843_003079_33BE269A 
X-CRM114-Status: UNSURE (   7.62  )
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

Changes in v2:
- Patch #5: Fix S5Pv210 interrupts
- Patch #3: Drop touchscreen-s3c2410.h
- Add Rb tags
- Link to v1: https://lore.kernel.org/r/20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org

S3C2410 is gone from kernel, so we can drop its support and remaining
related pieces.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      iio: adc: exynos_adc: Drop S3C2410 support
      iio: adc: exynos_adc: Drop touchscreen support
      iio: adc: exynos_adc: Drop platform data support
      dt-bindings: iio: adc: samsung,exynos: Drop S3C2410
      dt-bindings: iio: adc: samsung,exynos: Drop touchscreen support

 .../bindings/iio/adc/samsung,exynos-adc.yaml       |  26 +-
 drivers/iio/adc/exynos_adc.c                       | 282 +--------------------
 include/linux/platform_data/touchscreen-s3c2410.h  |  22 --
 3 files changed, 14 insertions(+), 316 deletions(-)
---
base-commit: 642543fe9a04beda174633dff607429dc1734b2a
change-id: 20250830-s3c-cleanup-adc-71ac80978520

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



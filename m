Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688C6CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ZUh0MEEJkewGsicwduu83OxT2GPj9q4Ws7POcHR5kI=; b=hqn0RbDwt1Xvyi
	bRJ3Xb6nmDt88LUtA88TfKJ3OlDm05OOuH7LrLNI32LHaipVf5rDMetMKDcy14wWTD/bx/3bgW/tR
	nQ+VJuXpAFQdbzj4c2ZFPOd/3JEaTNAsMWvLyp8nBGKLWf6fIyZGfuNZEXE45CwfQzmmCwFZV/+ap
	gMFloVhZ1aEMzFOdFyOspBP/rI/Nm1PMeQiHBVHr/jROihVU7KJb1eVBjSO3f7elxsmLeTgKLS0T4
	7iXmh79eiOcQ2vPbXcNm8LytAzSXAjl7jpwPoZ+QGUDNdiJKr3hoN5NTZpYisuUglODQhkGQ7yboe
	Uxcfn5ce2WDzciN7VM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgP4-0000000A77Q-1i4T;
	Sun, 31 Aug 2025 11:39:22 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgML-0000000A6uy-3d9n
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 11:36:35 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-71241d44792so8528336d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 04:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756640192; x=1757244992; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZUh0MEEJkewGsicwduu83OxT2GPj9q4Ws7POcHR5kI=;
        b=IcLrVGmPCTZf5aEBOjxRlwINlG6io5TZfLztkAyPLGz820OZsC5Zod9lD7OIsj2qUk
         +E1unB3+caeIQYCTDFsvznaq/DncamZj3BfQoCDTggNWkFqh7Fz4czyN3Dkh+JndxAJX
         Jcox906fG8vbvttdHIeQ6dRRijNbsXaFuLfxkqOlRxXaZhJ14y+gHggrrg9Rx5Scttz8
         rhAGIs7kXKeA+Q4MKPuzU4uBeg8ttR2BgHOzcQ7cdsHWtRr0iNWmpo5juMKHw1cuvhw+
         HmiV6dRRQXTD4td6vRncro14495Qdl68tvhztdJZcPRJ049FArrayzvZnlA8G5DOxr/U
         EzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756640192; x=1757244992;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ZUh0MEEJkewGsicwduu83OxT2GPj9q4Ws7POcHR5kI=;
        b=HaZw0XhHOsMSrdA7e625pwJAWcetmFKCLyjc2PX1opRN9nemot/xARK+1X9sFaA+ZW
         OBejeOIICKw1wkRYPX3QEbzKjow9eX5f4/1d9LKgygpGaeRi/XcL26eZqCadbCnH0oKA
         fINjPmXs2ZAT6rb9MQLfG26fSdru88crIRBOgk69mqqnFWMKYu4lfHVjoPd9jnLaZPm6
         S5Jig5TAWF8SIIoR54wI26XgnSellzqoAgGi4+xFb412NBTdU2v9Qw6IWKYdkEvawCNs
         TKg3CcOeBa1VttuaDEVXSoEECYF6H6+cEqQktvdyr0/SXxcLKO3bxUmX5JQ+emohGT2f
         Iwbw==
X-Forwarded-Encrypted: i=1; AJvYcCXVZ5JFtc+nY1n/nCtYUtwBLkx6BaIj9VQ+xjfdzZlXK4rOrK9sikcjgKXF881t8TdgkrXtefQVywpHtx7iUJBj@lists.infradead.org
X-Gm-Message-State: AOJu0YwKj18QUpjpyzKiFcjRfbTfjgoEO1CgS/tgJknq+XdKlQ4fuzSp
	ERxfJhMiLt/M0ixyJzzflUpUdyNTkw/nnsxkI52w77qgHdUvjfY/4Hd+
X-Gm-Gg: ASbGncs5Q/cnzT7yOOQEyN62VcaGGaHVY4WUjMYD1Hm0k1Irg6Vh8CDCt1+EBJHRnFA
	LhofYnYLL4L9rz+InjdhSH33VdgDUTMsyY2KqkHs5YQGxQ851SNqy3R3K9dcA/F7dPk1BlNxoMO
	MQtdwBxP1NgO57RYi6k3bGRBXw2W7i9C/BUnqUhggviiXkKgmls1KmDcFqAuZurjVRxS8eN9tTG
	oOR9qjL17055aW/q7sIyqOap+oOyClqjnelvy7LaCWGlP2NIHvap8afDz7o0bvq/vjlbEUX/nz/
	ksftm0jnY1+RHDlBQ5VoDLhLkuwWxLfYsfS6XyPH+quy2dlQvxUq4+Fn0t8Mb3ep6Y3UFFgY7rs
	TAN1qa+/Xh0ed25vcu4nqVC+8R8q2hKMbQjWOrvzpuw==
X-Google-Smtp-Source: AGHT+IEgyOkl/UbdfyW6MG7c7Sd8lz8jggA53zwGgpqsmVaB7MV9/7bu+KNwjTwRd47DIj9JlUGgbA==
X-Received: by 2002:a05:6214:491:b0:70d:bcbe:4e87 with SMTP id 6a1803df08f44-70fac70188amr43385146d6.8.1756640192586;
        Sun, 31 Aug 2025 04:36:32 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28383b9sm20519076d6.37.2025.08.31.04.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 04:36:32 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH 0/3] clk: samsung: exynos990: Fix USB clock support
Date: Sun, 31 Aug 2025 11:36:25 +0000
Message-Id: <20250831-usb-v1-0-02ec5ea50627@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALkztGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC2MD3dLiJN1kixRjU6M005RUyzQloMqCotS0zAqwKdGxtbUA9XRauFU
 AAAA=
X-Change-ID: 20250830-usb-c8d352f5de9f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756640191; l=1076;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=Y5SdIDp6Dj51UlHP63gpByU/X9ah8B/bJJRwBKB06vA=;
 b=N/msIsCF1bZxakusiiyW02vDVnrgyxYTtYKUAjfW7cOttGAEA0iytAQgQQekdIdCrg/8CfLQR
 ewo3N0AtgQTByyC6MjYFTtgNCKOb86wvYiHdpUUKylgB32HgWm60FzP
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_043633_937153_80315073 
X-CRM114-Status: UNSURE (   9.80  )
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

Hi,

Small fixes for Exynos990 HSI0 USB clocks:

Add missing LHS_ACEL clock ID and implementation, plus two missing
USB clock registers. Without these, USB connections fail with errors
like device descriptor read timeouts and address response issues.

These changes ensure proper USB operation by adding critical missing
clock definitions.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (3):
      dt-bindings: clock: exynos990: Add LHS_ACEL clock ID for HSI0 block
      clk: samsung: exynos990: Add LHS_ACEL gate clock for HSI0 and update CLK_NR_TOP
      clk: samsung: exynos990: Add missing USB clock registers to HSI0

 drivers/clk/samsung/clk-exynos990.c           | 8 +++++++-
 include/dt-bindings/clock/samsung,exynos990.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)
---
base-commit: e0edfc39b62e35dfb6d669b1189fa268147345ef
change-id: 20250830-usb-c8d352f5de9f

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>



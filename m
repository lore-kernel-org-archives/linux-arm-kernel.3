Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5538CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 21:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uAYcMOHgP8dzrRCqSWqHz21ZqOya4M26f6YLrK42GGU=; b=hpihyOKSjTYKyM
	JAyFD1x7kpFG0MXZzUU67jKvVm1KzXRTJSh1v062j+tYOyiC3oPimktRhymJL59ZyNQgD6MNvDQJv
	YtsvYEA64Bz3u9NtEy5vr/U0RTAyHwmMiWrkrd3x8ZlmFRC1bUcCDp7z/y609LykkGhjNv0Mhp9ME
	d7EqvFc7vTtn5VyjtVkygcwTtRXn+S6hllMLJ2BeOXci4MUOdRI2Z85Cb+PCforFqMwh0MmwZukxB
	YWwOvFhriCkzKxaK/w+Aq8ekE+YtuPR2HOot9O6StcIo1w05Xx9e7oyhUD0jKI9bNpnFWLDkiBIG8
	AcKf2idWbDM6AEcvKS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvN4N-0000000Cwrz-1S1Q;
	Sun, 07 Sep 2025 21:37:07 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvN1Y-0000000Cw14-3hpG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 21:34:13 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-70ddadde2e9so29931536d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 14:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280851; x=1757885651; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAYcMOHgP8dzrRCqSWqHz21ZqOya4M26f6YLrK42GGU=;
        b=Tb8m1xnD5dDiXCimkQd5IHPCfNhW0/v46eEs74Rm3WW3ZeJjxUYKDSa7IFVJyLDl0t
         L83TjlxLe+RLcjwUr6Fq2LmPYdhm79A6IN0nnnkIwVSuoR7Rz3mF6kBloF8+uBElpsh6
         ZyGA8WzowgPGzDzA/HdYUMi/uprs8cpkvxFCErsSdSE1FeMN95jppKEbYu3QLUnP05X0
         EqPRY3xHDMXh97wsvXzi6fWM/YicSEwYIOFASQMHxcTgKnAC2/6VZqa30NSA4StEq8hX
         TLDpGCCT5IU+GIp0O+QlZBfFjEl4r+2DxZsQdRQHpP3Bpx1cdoC7E33vsr8UfZp4yUHl
         FXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280851; x=1757885651;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAYcMOHgP8dzrRCqSWqHz21ZqOya4M26f6YLrK42GGU=;
        b=buwL9D5um5NPyuAVye0wqJuKqsPSe8Wv5fCrWnJ4Q8X7jZ8tXoEZwa5+9pN9gcUJmT
         1o2M5slKi62ROouPl6AdtogGA+Bk+bPBK8ijbZmJ9g1GGlhFYmuF3WLfS5gxZ/0EBcHp
         VMk41wDpLaw+tll1LShfBZSv9K7gQrIgfv/C/Yw+G+FiYdR3QgVy7LWjwNSiYXUf4XYl
         OPY0ZWZZ57OhD/c98YGxXThMkcMo/+uaq2dkNMauMRMj8E8CsF6wAQ3q+mbUh3KLZLVA
         0KUROyYUq9uzdL4K4gJygTGJ7L3nm4JIjieznJCTyyDrgek0cL+0RqEwCqy5RgIxA5c9
         1+sA==
X-Forwarded-Encrypted: i=1; AJvYcCV1GhfSMEYy83eaW48MFS1e7bQeyUPryCJAi+m2H0i+CxwEGR5H5o45FJEnMKxWOZG/5r15Lvw/QX9MaJjwkxxk@lists.infradead.org
X-Gm-Message-State: AOJu0YwCuS3nPmV9+aOu2jISNqoLgZDaX32JiUL0/rpdr+fznDtp29bo
	dBapEVxyxsUcP/c5EzsE+JNekgNnYfo+MoVCTnutIlYnPMK8PBoaIwBT
X-Gm-Gg: ASbGncuGNiGT7kCcBrMUNLeWc0q6SVSaIGYRlZ19YxX/LMvOeKTRgu52KR/zX6GutCM
	s9bR9cxHou982KCVtO9icOPAuH2aRx+neyKxqauRx5qZSaTWQfEEFFPyhYV06CoSoNWHsdRpSBW
	KkD8xkoLeVrC7DGEP1/GiRd8veVkC7ymp6XjqD3P23ylfDuAiyl9NoU25vEPMMKd39/keDFN0lG
	FBKeSX972Rw2C6XrOk7aftgL+O9Fip53l3Htufh2asdvWIXlHVMi+mv9AtgVi/5QRpqOZwRm9qW
	LWBuqD7ATbQZ+i1M6xVJNGRZQLsWQTHZVAoA2qikhVFtI8ZJQphBpszDAHGMJyEOZ34YRbAjkcK
	8XCC4zNyUxhGbIe1uzxuuL4TBKPD3r8VwT8pOo9QbPg==
X-Google-Smtp-Source: AGHT+IGuZkEOOo9P/4LuWTMMM8+83KFMkIZI+a8A8P22ll3sk7nlM2ZrZnCuedhaJdnefckXJka6DA==
X-Received: by 2002:a05:6214:19ca:b0:70d:f76c:b218 with SMTP id 6a1803df08f44-7393950f865mr73376806d6.31.1757280851300;
        Sun, 07 Sep 2025 14:34:11 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:10 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH 0/8] arm64: dts: exynos990: Add PERIC0/1 USI, UART and
 HSI2C support
Date: Sun, 07 Sep 2025 21:33:56 +0000
Message-Id: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAET6vWgC/x2MwQqAIBAFfyX23IJZEvUr0SHyVXuxcCkC8d+Tj
 gMzk0gRBUpjlSjiEZUzFGjqitZjCTtYfGGyxjozmJ6v4q/Ki/d8q4TTQ9kB1g2d6Rq0VMorYpP
 3v05zzh/8QpkmZQAAAA==
X-Change-ID: 20250907-perics-add-usinodes-5ee2594041e3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=1485;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=qjSX1+MoG33BAIPxSwZgmmm9PAPIWHsGmHS5ZkL4/AI=;
 b=FPmZCdmoS60rMwEKqLRYEvGn5axehswCuPXciOqsCp1swUWAOnYvUlk+fYTFsloLDowoOiMbW
 Z4gcQYdsiKfDVZzrY8kvukSiaRpUFrHUsFqhTYgOSuuMP9/9ufpbGcG
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_143412_928848_92727874 
X-CRM114-Status: UNSURE (   9.04  )
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

This series adds device tree support for PERIC0/1 blocks:

- Add sysreg nodes required for peripheral configuration
- Add USI, UART and HSI2C controller nodes
- Update bindings with Exynos990 compatibles

These changes enable serial communication interfaces
(I2C, UART) for Exynos990 SoC.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (8):
      dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 compatibles
      arm64: dts: exynos990: Add sysreg nodes for PERIC0 and PERIC1
      dt-bindings: soc: samsung: Add Exynos990 USI compatible
      arm64: dts: exynos990: Add USI nodes for PERIC0 and PERIC1
      dt-bindings: serial: samsung: Add Exynos990 UART compatible
      arm64: dts: exynos990: Add UART nodes for PERIC0/1
      dt-bindings: i2c: exynos5: Add exynos990-hsi2c compatible
      arm64: dts: exynos990: Add HSI2C nodes for PERIC0/1

 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |    1 +
 .../devicetree/bindings/serial/samsung_uart.yaml   |    1 +
 .../bindings/soc/samsung/exynos-usi.yaml           |    1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |    4 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 1423 ++++++++++++++++++++
 5 files changed, 1430 insertions(+)
---
base-commit: 98ee0e036cfedf543c4728a604fd7870d0000efd
change-id: 20250907-perics-add-usinodes-5ee2594041e3

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>



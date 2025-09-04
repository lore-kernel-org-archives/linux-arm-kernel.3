Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CC0CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eihtZU8OHYKgtMximmIrUFJ856exD8VD53vOuodUiTU=; b=wcf6eLNRyVQ3Ri
	yqw1W+sJHomQbaXjN+4CC2I20w4hvBs5JFzfJApp6MTvv04yAuaCfCq/Lp/MvFlHvx7IryhWJEA1R
	6o/Z/3Nt8cRF5yqqFUGafK27roBK1BQwTDTBCCF2VPQ62oBLQdZNTNkmWyVeTDT3ORvye0VH0e/3y
	pDjs+sdtdaOutgqz3fJLWG7EVwkKc+CLl4iQEPjyN9yaZoyDtJtwp+8y/BjR9fKuL1XO12cnz7Y4G
	6xkKx3zjKKBEgxv5bYXOwnSWvTDqe3d82oBd32D7BgkggXpyfE5k2PeGtlq28JvT0km8oWwiPQxB/
	oCoWt9V0rUr/UT/r7nCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEkj-0000000Db4O-0EOn;
	Thu, 04 Sep 2025 18:32:09 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAcN-0000000C5gC-3NQm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:07:16 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7f7381bd1fcso70033385a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 07:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756994834; x=1757599634; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eihtZU8OHYKgtMximmIrUFJ856exD8VD53vOuodUiTU=;
        b=e7Hg78MIJ7Enij1h3eRkkDITPFOjXv8XRCdXZCU+PEEAHKrlFMKAzEmI46+K1+RQgf
         TlXs8SaAzOem16zjJR5VVp297pWVyfcZZmsWT6w7NbI9PuNWTxmt1pifqzh4zzKwIS5m
         sIuaFjl50kPdcPwdZpVRrZf5pfTZWRtP7C+rPE9tA+1MS7NBhUn60Cvv8LebDzW8OrwN
         QJjjgLQehiCU6LbgdswqzVRo5d2ZiMO9Sx8exjUr+WNG11/5uKSnDON1zznc+73XkSMN
         upAuS8teBo88XUxJPIv9ShZP1QFXCqjBI55cF2ortM42jKSq+cWbAFWE1ApR9s8ZR/1G
         9Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994834; x=1757599634;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eihtZU8OHYKgtMximmIrUFJ856exD8VD53vOuodUiTU=;
        b=kOO18Rbi0jHlfaontg0TSSjH9ldJveqL5GYaxubXobbw6biQY33/dM5j5zWQdukRJg
         uf5bGk9qozHWYQPy5THlhpVjBBCbwiRG1gPiftrHOPw9YC5er/vswhXcthTo28LtDhas
         8YhTyiqha7ggmxJ2qZvPzINmdwh1Yx/6JYBtjPl80R1yXtkkz3twMXHNa8F+7ivHa4x6
         ME8lBr45CLyHKyKvlyoohnwUiNTaZ4s2AReqY/VPCnlgfJr6GoPXjQOw3Lz43ruPGS2z
         6zC5NQUrWmpkLQXRsar2OHii11rDN4r/KExQO1JAxQE/EMmD/Pwxp/U1P184UZnVrkKo
         /7Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUV9er3n4J9y/lme0UlMZlc3XxIgw7gJxfLOQqhpc0vXVZ2y7iFDX6jKEzbZik1zk+CJ/iGZaq45GbdwoPMWxY9@lists.infradead.org
X-Gm-Message-State: AOJu0YzqU+QvvP+d2zTzTg32RjGG217VYWVXaEwReDb+Bb1OkZeog0lN
	AHhJJtgrJE0nu9lIcB3t+i2ZdqcV2Wt7T93WqQXUxVCWW81m103jJFMf
X-Gm-Gg: ASbGncvtAKJwwQs5hsyp0L+tec77geNr5krebE2JQGzBA5m2rBr1U+cI4GfHrYp848O
	9GBCCrlG2KasIU4yFgUXkuHE+M8bh5dkn66k1Xs+IBvEwo91gATVkDPiLCNOFZ1sRkxThxAxAru
	OkFPnnQQjYc7yIDciF/GQL2xBz3g1tSJ9vaEnKkMFUgTEZwDAzIRsEQCfVaoadFpQIM+DqOXJDv
	+rICX1WN4PwKrMZHA4y0+ECPk4lWGTvs3xQkQuJNTvxgux+47EHVhyoDVHFfKhXtgcam4S+h7Gv
	4wL4oShFkHKRNtbFDRVMOZdtvNZIwOMLtt/gQksaBnh0LxAsT+VAdg/Bg/oHsT/1D22j4YsadFP
	gkyaGgVIAQZMiBR7CrK5SddS9iefK
X-Google-Smtp-Source: AGHT+IFAmc0wnCtcOEvRgXDrQ6IUkfol6ZeLbzKo/Il17bCwAzz4m4TitxyZWAzjU/KhfhX5q02NmA==
X-Received: by 2002:a05:620a:394f:b0:806:522a:25ae with SMTP id af79cd13be357-806522a2b71mr1163297885a.36.1756994833844;
        Thu, 04 Sep 2025 07:07:13 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.194])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80bdedfeaedsm212280285a.70.2025.09.04.07.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:07:13 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v3 0/4] Add PERIC0/1 support for Exynos 990 and hsi2c
 compatible
Date: Thu, 04 Sep 2025 14:07:10 +0000
Message-Id: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA6duWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC2ND3QKg+uRi3dLiTF1DI0tTYyPDVFPT5CQloIaCotS0zAqwYdGxtbU
 ANmCpbFwAAAA=
X-Change-ID: 20250831-perics-usi-1295321e55cb
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756994833; l=1287;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=ly5NeSE539nxeXkPhgKBaDj4r7GvtHEHx5sOROseuOI=;
 b=x5fRiKxuNl7/HyAUuv2TiCNfWDovKgGZuKvCrCwKms3j7fN31H08qUfze44YgZlEusYLZ0AnJ
 RgL9/06hOEIBF6BxPXba4/LTG3kFYYYN4WKqsB2MOZ/NMszO+WUFfjB
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_070715_848828_80CADB8A 
X-CRM114-Status: GOOD (  10.79  )
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

This patch series enables the PERIC0/1 (Peripheral Connectivity)
and compatible hsi2c for Exynos990:

- PERIC0/1 feeds HSI2C, SPI and UART

Changes in v2:
- Remove other unnecessary patches not related to mainline style

Changes in v3:
- Fix compatible string ordering in bindings (alphabetical)
- Reorder device tree nodes by address as requested

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (4):
      dt-bindings: clock: exynos990: Add PERIC0 and PERIC1 clock units
      dt-bindings: i2c: exynos5: Add exynos990-hsi2c compatible
      clk: samsung: exynos990: Add PERIC0 and PERIC1 clock support
      arm64: dts: exynos990: Enable PERIC0 and PERIC1 clock controllers

 .../bindings/clock/samsung,exynos990-clock.yaml    |   24 +
 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |    1 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |   22 +
 drivers/clk/samsung/clk-exynos990.c                | 1152 ++++++++++++++++++++
 include/dt-bindings/clock/samsung,exynos990.h      |  176 +++
 5 files changed, 1375 insertions(+)
---
base-commit: 1b15d1010a693feaf99fe3e08271cfc72be0f9f2
change-id: 20250831-perics-usi-1295321e55cb

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>



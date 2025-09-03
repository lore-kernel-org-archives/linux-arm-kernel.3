Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99893CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=11JUQ5ev+7cUmEafuoYU8OrU4sJAEkKk/NLhU0bkFyo=; b=eEnNeKI15I5nh9
	J1WW/GC4r5akTtjaWWECoyzeCxSxQ4j4HDTEc8XHRGybwGEUY9SxxRGaRm1EpTpKo+MAIuReHxQSN
	MtO05rhJotna7AVXzhoo9N5nEFekQp0E5vIvB0uQ54erDM3iEIDlNRfT3twiMua8sFTcdkvUF5bpn
	C0ZseLB9hmVn6fIdwKEDnIDoAHTMfyHE1suyTtK/2MrfJ6u+Kpiw7K2Onm9dt+LM8UKKPinY0WmbU
	KTPZaHgDEUI1GXYL/LA8TgqzwYlUpad8cBw/qmE3xASD0iD8rO7Rj29R5QUVZdHRoeQNZ2mAQNunJ
	x8AggXexu+D/cVkboofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utssM-00000007PhM-0fiE;
	Wed, 03 Sep 2025 19:10:34 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utoPg-00000006j6Z-2jWw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 14:24:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45b8b1a104cso32692995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 07:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756909479; x=1757514279; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11JUQ5ev+7cUmEafuoYU8OrU4sJAEkKk/NLhU0bkFyo=;
        b=Urs0TgHEnAPc9EjaQY+M/7L9p0FrF4O5PvFl6WkbUnbV+ZKI5xRnjDsjWkUUZ+fQVy
         vTZMgPaTcrPXR9GnA6vZ4D9Q+nQ5jcQLvFuUxaG2U7UCk1xhq783+/fRLwPs+/o3DGAL
         OFKA8KeaUP/jPcnUPt9VTFTb1043a5rkWU5bvx3ziXme+dPQqWh3fUkOUpQ2YWN0jEzR
         +I7+lUec0SmyrG0yIyjh/8iqLDVTMKSXcFdgGh+3ItzvZx4bHXraqTqRt+5ZVIIheyug
         MaqlO+8bG93hKR2vaSiW7yUBeagjDSKax+7zGhwMnyOBOE0H8ldI9hzRCfESWEsviH2e
         68OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909479; x=1757514279;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11JUQ5ev+7cUmEafuoYU8OrU4sJAEkKk/NLhU0bkFyo=;
        b=tzhmahj5xI4dWiSC5RTZZ8Y8FbncSNwG8Pnz9u8uu6e1O2MLo0QNhBogspL55kD2kn
         otZXuPEaBi3DHIVa2BuowGGYB01V0iKhGTxJkWB2nWWIHbXoPqjIryDOrfz/jMXoJXSD
         N2TyAp/nmn3oyujA2e9BEHGPqmzedoa/DIWnjMfWGoOhmGU7ArLHBJSMJrm3ivoja1Hq
         towKHb1pBLG9pjHgWPiWQGR9c4N43u5VqYwMHTIrxVSHs84SqAepXjRuUXJqCBejDeBq
         G5y4gmbD4h3G66qIx92HDpKU8Ck1S45/Vu4xRjM9MRkyZYFLgiwKVdAP3tbMSGEcJBIJ
         W7aw==
X-Gm-Message-State: AOJu0YxSpOU7rWms0+q6mHJWZz8Sug3tmbGe4gs/VtATFC9ZwwYBxe0J
	pGACpY99AV8oB6NROlxgXWKWU3zEVjjgX8IsBDXX6AWnCM2ZZv/bwLK7z9Q36alNL20=
X-Gm-Gg: ASbGncuxzDmrO+AeuLyRt9heksZwvUj7FySqSXAj5EQKcBN27U0iTfcHgIlsS6KRmbd
	AFC4WLZ3nTajYX4XLov1uQDpAcyQ/vDba3O6h66LUEaHAUF/DkUBanLpGVU5TFiYpdsdulEeKHd
	9WP6t1yhKPgmh2qLXWLZ28WqW9qqn5mkJWzUwhL2O3CSigsy5x4YuP3dWPtI/AZPSV1ihEe3gNV
	1QGfjMoMjbMlhulq4wE9X9I2fclRVrITE5VHYf2sMKDqWJT1eo/JLp9VT68eFVaAuhpwPt0Rnyt
	883b7r8c2O46W3ONLIlvzgKyuLvJ6/vdryaQFl33il1Gjpe8DA1tk1eFrc8+S9EGqdw41lVmHsm
	KjTrplBRdZRY6ddtRtDT5f4v3grzksag/YLSr1Df30u7+qWhQXUkoKvjokdcEqnkrG0fDq/EvkA
	jIVw==
X-Google-Smtp-Source: AGHT+IHO7lF68sZSzRU3Ji9xQ8Bg+5ordTX8h7glVlsP3LEnejSEX9Agz2jxEBMCAJA/KkoY5VsH0g==
X-Received: by 2002:a05:600c:4588:b0:45b:86ee:4181 with SMTP id 5b1f17b1804b1-45b86ee4497mr127647825e9.22.1756909478846;
        Wed, 03 Sep 2025 07:24:38 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3dc1cd4a7d2sm3996035f8f.33.2025.09.03.07.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:24:38 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/3] arm64: dts: exynos: gs101: add cpufreq support
Date: Wed, 03 Sep 2025 14:24:34 +0000
Message-Id: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJPuGgC/3XMSw6CMBSF4a2Qjq1pL0VaR+7DOKAP4CZKSUsaD
 eneLYzUxOE5yfevJLqALpJztZLgEkb0Uxn1oSJm7KbBUbRlE2DQMMkV7cz8oDb1kdqFspM2rRL
 aGmNJIXNwPT733PVW9ohx8eG11xPf3j+hxCmjwtVSq0YwacTljlMX/NGHgWylBB8a2h8NRTtuQ
 SpmOehvnXN+AxSdEN3nAAAA
X-Change-ID: 20250819-acpm-dvfs-dt-06bc794bdccd
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756909477; l=1514;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=boXlFe+neX+rbXfuMW2IbPpgXk7Xd+Trui4cXXc1XHI=;
 b=L9P2BH3epk84RCrBmVx2GaIRgBviB5UvLL4K9afDUGFWG1bnkaX/YQ0iUz/gTH10jTAwgbS/K
 uCXKN6hqgpUCSs2U83YiZnWujnFKvoXNO7QtM+1u4yl4QYXFHL9A9cv
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_072440_697801_49836F6C 
X-CRM114-Status: GOOD (  10.54  )
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

Define the CPU clocks and OPPs.

Patch #2 has a dependency on the ACPM clock bindings sent at:
https://lore.kernel.org/linux-samsung-soc/20250903-acpm-clk-v3-1-65ecd42d88c7@linaro.org/

The following error will be seen without the bindings patch:
arch/arm64/boot/dts/exynos/google/gs101.dtsi:10:10: fatal error: dt-bindings/clock/google,gs101-acpm.h: No such file or directory
   10 | #include <dt-bindings/clock/google,gs101-acpm.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v3:
- the ACPM clock bindings were moved to their own file, update the
  references accordingly.
- Link to v2: https://lore.kernel.org/r/20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org

Changes in v2:
- acpm node becomes a clock provider.
- reword commit message, extend cover letter with info about dependency
  on a bindings patch.
- Link to v1: https://lore.kernel.org/r/20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org

---
Tudor Ambarus (3):
      arm64: dts: exynos: gs101: add #clock-cells to the ACPM protocol node
      arm64: dts: exynos: gs101: add CPU clocks
      arm64: dts: exynos: gs101: add OPPs

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 285 +++++++++++++++++++++++++++
 1 file changed, 285 insertions(+)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250819-acpm-dvfs-dt-06bc794bdccd

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>



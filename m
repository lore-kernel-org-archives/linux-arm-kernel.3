Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD24E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 16:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OeT7GH5ILmC7+ZwAvbXrLYZE10VxTwPPtXsqOi8ctH8=; b=0oTFok/U3tc2+OqbRi3RRvH2nV
	0qK01ZAZk9uJymL0kPpMRTTkgUDuoYS1LhZR2xeftl83klZl7F4WVVKqV581mXj3BumWo2hiLAUBK
	xskrO+iwJ4InzNzbFGmSi1joRKEeVyCycFNraY92xPdmRZq5wFty6YplolnFcAqjnSbh4bwtVSkku
	msZA2wOu8QKBjOdccXWDv7YGdvTrPYTxaZHVRDV2dtAy7xrKldtc6VhBZx8YESx/Xkwy+ctdBjMeY
	GcgbNbZZ2mHoSNf8AAWJs7qbORvlp+WV/3g/BVqG/JSEZ8rHySS1Q9Yaem88+6Q6tP/txK1zDs7L9
	C58l/WJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7GR-0000000FIBY-3KzN;
	Sat, 04 Jan 2025 16:44:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7FG-0000000FHuD-2UXb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 16:43:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so130139775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 08:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736009005; x=1736613805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OeT7GH5ILmC7+ZwAvbXrLYZE10VxTwPPtXsqOi8ctH8=;
        b=SHwBineYNfiN4ROPIMwivp9sey8mYPC4RK4RYncHVrwbyLLjKoCgFD6GaXXcua0mvR
         GfllN0EtRcGCew3Qa4dn008RjxbRJLFpQntt2VTyTep4BZUA/t/Vfy04uvNOZ+csBVId
         Vn1X7IEmDtr2JdG7YoCA9Zob73jRHdvZB30EV2wv7ouJ1UXsSQS3teUeEvPkPEJHTTSM
         YYScwtIsNC4gbIxYRP8bg8PJDnyrt9C688EG5wXPHDGlOpR+xkT3FvFI9GmOXiU81Aj1
         1ISwtzNADn7qk48sKqldMNm9Hiymy/0mjMCwStZj4YRFEpCuLr90I0OLj3DldqVuYwvQ
         HZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736009005; x=1736613805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeT7GH5ILmC7+ZwAvbXrLYZE10VxTwPPtXsqOi8ctH8=;
        b=ZFOE2XN7V+j+DM61PJi+sPFY+DK0337o+cqaQfelq2jUyCxvNYJ17fTEI33HpkwRre
         0NiAOvr4bqV6tvo6mr+TMM184n7El7BJJTAIMveUngkwKsFitRLKFqcb6JNxd2EoNxOo
         c4bukFJoAjnIVk76KGfIC7pS5VqZnAcGYAypNQhX4ZHog1aABPMez8+EGR4enceU5dou
         ewAExmznWOfOf5ysd+vwl+8ktgIN0Yws/ViYOIlz7N7sgVMW92W7b6LqRLnRkq8n3tNJ
         WXI6GB3MnzhlqHvnsb/toXfUlRTVt6f5F9p2kCJyQq4YoYJfeOVi1Vz47ZUtF7HdLyPP
         EFmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOH1SUV/+1IS13cS68PmIwow9NQMgK++RWbnggAAb9GJJ12TjwYudet2VKRQdCfQ+AfJEVZko3QINshwgFdpru@lists.infradead.org
X-Gm-Message-State: AOJu0YwCfucVrPkGNLGOsB2FbviTv5i2+xk8kuTznGUmbVBMH0C5IVhr
	CDQVE7bJ+vcVRROnC4qN44aIjauYtpmpBnA0q4iTWKcQF1TuuIXR
X-Gm-Gg: ASbGncup/j3eNp+K9PEO+2aoNveJmxIvAau/KKH+3fexlFOtvVOxmFmeBvmlB7UCbDf
	niWxKpa2kDpulY8v+Gg4hafj35NokkUk7MNk3ZSjgZ3wxR2VJet+5Zem80DyvJd7Wd+f2hst0w1
	4yMEoYkr/AbaZM7TvSnHUsX23GtDAFg8LOycinO8nAkc2/3Xr6WvG2ANkH5bLEClsQsHsYNpT53
	lbUX89X9oeFIbPl1uBvvPzwUNjItkWvUHrrgGr8KteeSabdXNUWaYmYH40MrXL6GxrRXnE=
X-Google-Smtp-Source: AGHT+IFflzQBanz+qf0JlHxJWMbBsbQVmFQjmWt8PkrghEauNxkIGwkUDzPNrVC0sT0q5/EXW8FMXw==
X-Received: by 2002:a5d:6486:0:b0:38a:4575:5ffd with SMTP id ffacd0b85a97d-38a45756035mr25928426f8f.45.1736009004663;
        Sat, 04 Jan 2025 08:43:24 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm513321455e9.24.2025.01.04.08.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:43:24 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] arm64: dts: exynos8895: define usi and mmc nodes
Date: Sat,  4 Jan 2025 18:43:15 +0200
Message-ID: <20250104164321.333669-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_084326_635998_1DD974B5 
X-CRM114-Status: GOOD (  12.41  )
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

Hey folks,

This patch series adds the required syscons for controlling USI, as well
as defines all USIv1 nodes for Exynos8895 and adds support for utilizing
the external SD card storage in dreamlte as well as touchscreen. Due to
PMIC not being supported yet, we'll assume that the regulators are
pre-enabled by the previous bootloader for vqmmc, ts_vdd/avdd
(in our case uniLoader).

The patchset relies on [1]. I also expect the exynos mmc binding
maintainer to pick the specific-compat patch.

Best regards,
Ivaylo

[1]: https://lore.kernel.org/all/20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com/

Changes since v2:
  - add r-b from Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  - drop hsi2c_pclk clock-name where it was left accidentally
  - utilize _I_PCLK instead of _I_SCLK_USI for all usi hsi2c nodes
  - move assigned-clocks properties to dtsi
  - set mmc's clock-frequency to 800mhz as per vendor's dt
  - add a pinctrl node describing cd-gpios
  - drop the fixed gpio regulator
  - add a new patch to the series for enabling s6sy761

Ivaylo Ivanov (6):
  dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatible for
    exynos8895
  arm64: dts: exynos8895: add syscon nodes for peric0/1 and fsys0/1
  arm64: dts: exynos8895: define all usi nodes
  arm64: dts: exynos8895: add a node for mmc
  arm64: dts: exynos: exynos8895-dreamlte: enable support for microSD
    storage
  arm64: dts: exynos: exynos8895-dreamlte: enable support for the
    touchscreen

 .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |   1 +
 .../boot/dts/exynos/exynos8895-dreamlte.dts   |  72 ++
 arch/arm64/boot/dts/exynos/exynos8895.dtsi    | 908 ++++++++++++++++++
 3 files changed, 981 insertions(+)

-- 
2.43.0



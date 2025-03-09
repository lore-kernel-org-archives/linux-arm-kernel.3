Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE3DC35FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 19:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZYpRuX79H42AyJwMpeb72MjPa6wN8mVoMbygXkMxqYc=; b=17p92I7rKxlBe+lZHJckr7Xp2s
	+vkeNH06poNMMUGs3HH3klKBNJmnxj0cCP2LB2XFqaS9ifMIMR7wDegrr6uokiQBk1ecZgZ2wV6ev
	u/TxVkGmrHGICxeWohoG8lTH4vPAiJOfFKZA4yW05dNfFH8hqtnhlDD0wlLsQbtNOGyqjhqqChws3
	OZRzJQPA6IIXxWVeI7JGiwYWA+bWyzUCZUJx/Mzrq0XWesuqg6S0Lza2ExjkHR9GTf6prHP9drGDh
	FkShRewaLtS8FlqxjMqCiYM/hnhv1adQvAFcnBuPUSk1QIyLJiYMXq5ZN7oLrcnUJ+I4iZAnE4b8r
	Vham1c+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trMA6-000000012jZ-0APc;
	Sun, 09 Mar 2025 19:18:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLom-00000001106-3h1r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 18:56:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-391324ef4a0so99486f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 11:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741546567; x=1742151367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYpRuX79H42AyJwMpeb72MjPa6wN8mVoMbygXkMxqYc=;
        b=h+xV69IYVPBGCn6V9FznZ7QI0P4jtnHfvYg45mc3NrRQ9QeIXCkjZKMEFrr6I80VTJ
         MExRvS2g5Uro3LRIS37kWCND9lSVC2kSDV7/Sd+FOhji78jq6IV6hqh88vebJUzInbVC
         XWaGpyZw1l3lYtzY6j0SJz/16aTJ0JrdMQNFfyNJ1lCJvVumsCbLWepDXNfTbj4LY0MA
         pwpi4lBlKCjUq7kOc09KxMnoURobCXP8LRNk3TztRQPLm5og3UBSMD0D9nk6J58kacq0
         ybRBPNrWjhF/J35JV5dD6aH7f3860InfqBNMi/f0ncyPdIK4KaHPoXg60LyTYQ9CRgso
         ynuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741546567; x=1742151367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYpRuX79H42AyJwMpeb72MjPa6wN8mVoMbygXkMxqYc=;
        b=pDOuFMO+mBy9QKGeOt03SB1zQzvxQmPHB4gd0tSIPEQR964qYsdoUSaPylFLgyvi0B
         TxLpp+ZTYcQPB7tc6nFXKvA+ndT6TugCvZrJNh9HLHYgNwvGEJcIhEC1bllBoyeUS2gI
         WvozzWZVfhfJS9d6EB3siUHiPGyGBHUhrNGZgeVcqcWqbDTm1ZbthPqzYxnPCTOGhzd2
         ED3z1CP3IpyUuPkUYbwu53zFQyEhapZ3xTRvQW2TxtXgQghCoynd627BI1xxeueY9vOe
         5PuMvJnHqNatzMsmNWN9AFS2/DHSgfjHc8IORciOskimUqK2JYaeVoEeAD9CTRwV5h7N
         +2eg==
X-Forwarded-Encrypted: i=1; AJvYcCUk/TMpNCDguAIgxwWksP+po1n4bkCo7GdJ4a8VrzkaTGB3OatKI3WUjCMfZbp69OHhY646vxbJfrzRJa+oxgje@lists.infradead.org
X-Gm-Message-State: AOJu0YxcnYzof75BaixJ0Qa6zTsgQnkuNJLZmGdAAEAEBQYchjmx+U+m
	NMqltTzMoqDB65pwZhlBTp41pNFoERhvM2jcRq/xUBZCNdRllee4IGj5s6Lk8wM=
X-Gm-Gg: ASbGncs6H5l2IwiR7DABU23PkjqdYT5veafN0tb7wA/G6AaUwBbvbOYS6jPf7f/0NoB
	Fdf5OUkD1Lk12XpmayfC6QJaFexoMEcauPWNSWDPCLn8Zhw2rKBuogvc0Og/XG1FPDo0ylafSda
	o0tAAOgwxpYxXepM3cb58pK8VwCzjTwMQ2DJo3QlufY9M4K2DJoNKhvXsaRRRF/nU2mvDtzwtiT
	WSeVtCvYjqq6sfgw2Fm4QG+CP1OBA8bUJSzYO7JMbb6McOlR11/pfGdtF9sk871oUnh7gVWvABk
	clrblh5W1ymk+0IQq53MG7BLZcz4nBo1g42AFyvYHk9LpkZJLE1d+M9DaOc=
X-Google-Smtp-Source: AGHT+IGtaEQwIFc/6TYT3DLRhe8XehJ9zBv7aECl0lbGZTSP5NvnoXEhZ0PSYiVFLI7kcHS+u3EmMQ==
X-Received: by 2002:a5d:6d8e:0:b0:38c:5d0b:71ca with SMTP id ffacd0b85a97d-3913ba438famr1345644f8f.0.1741546567145;
        Sun, 09 Mar 2025 11:56:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cee22c13fsm44263945e9.40.2025.03.09.11.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 11:56:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/4] samsung: drivers for v6.15
Date: Sun,  9 Mar 2025 19:55:55 +0100
Message-ID: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_115608_919423_DEF10D95 
X-CRM114-Status: GOOD (  11.70  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.15

for you to fetch changes up to 8f299df1b75ad0939f1340182c265de019eab438:

  dt-bindings: soc: samsung: exynos-usi: Drop unnecessary status from example (2025-03-09 18:53:34 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.15

1. Add support for Exynos USI v1 serial engines.  Drivers already
   supported newer IP blocks - USI v2 - present in Exynos850 and newer.
   A bit older ARM64 designs, like Exynos8895 use older USI v1 block.

2. Add Exynos ACPM (Alive Clock and Power Manager) protocol driver
   for Google GS101 SoC.  ACPM protocol allows communication between the
   power management firmware and other embedded processors.

3. Exynos2200: Add PMU, ChipID and SYSREG Devicetree bindings.

4. Exynos7870: Add PMU and ChipID Devicetree bindings.

5. Various cleanups.

----------------------------------------------------------------
Arnd Bergmann (1):
      soc: samsung: include linux/array_size.h where needed

Colin Ian King (1):
      firmware: Exynos ACPM: Fix spelling mistake "Faile" -> "Failed"

Ivaylo Ivanov (7):
      dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
      soc: samsung: usi: add a routine for unconfiguring the ip
      soc: samsung: usi: implement support for USIv1 and exynos8895
      dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos2200
      dt-bindings: soc: samsung: exynos-pmu: add exynos2200 compatible
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos2200 compatible
      soc: samsung: exynos-chipid: add exynos2200 SoC support

Kaustabh Chakraborty (3):
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
      dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
      soc: samsung: exynos-chipid: add support for exynos7870

Krzysztof Kozlowski (3):
      soc: samsung: Use syscon_regmap_lookup_by_phandle_args
      Merge branch 'for-v6.15/samsung-soc-dt-bindings' into next/drivers
      dt-bindings: soc: samsung: exynos-usi: Drop unnecessary status from example

Tudor Ambarus (3):
      dt-bindings: firmware: add google,gs101-acpm-ipc
      firmware: add Exynos ACPM protocol driver
      MAINTAINERS: add entry for the Samsung Exynos ACPM mailbox protocol

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  50 ++
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   2 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |   2 +
 .../bindings/soc/samsung/exynos-usi.yaml           | 100 ++-
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   5 +
 MAINTAINERS                                        |  10 +
 drivers/firmware/Kconfig                           |   1 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/samsung/Kconfig                   |  14 +
 drivers/firmware/samsung/Makefile                  |   4 +
 drivers/firmware/samsung/exynos-acpm-pmic.c        | 224 ++++++
 drivers/firmware/samsung/exynos-acpm-pmic.h        |  29 +
 drivers/firmware/samsung/exynos-acpm.c             | 769 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h             |  23 +
 drivers/soc/samsung/exynos-asv.c                   |   1 +
 drivers/soc/samsung/exynos-chipid.c                |   3 +
 drivers/soc/samsung/exynos-pmu.c                   |   1 +
 drivers/soc/samsung/exynos-usi.c                   | 108 ++-
 drivers/soc/samsung/exynos3250-pmu.c               |   1 +
 drivers/soc/samsung/exynos5250-pmu.c               |   1 +
 drivers/soc/samsung/exynos5420-pmu.c               |   1 +
 include/dt-bindings/soc/samsung,exynos-usi.h       |  17 +-
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  49 ++
 23 files changed, 1359 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
 create mode 100644 drivers/firmware/samsung/Kconfig
 create mode 100644 drivers/firmware/samsung/Makefile
 create mode 100644 drivers/firmware/samsung/exynos-acpm-pmic.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm-pmic.h
 create mode 100644 drivers/firmware/samsung/exynos-acpm.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm.h
 create mode 100644 include/linux/firmware/samsung/exynos-acpm-protocol.h


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3AACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3tTGGzjAuGZXQWRu05vrCKimfXwg8uSaYFn3EC8TDkU=; b=C01l+yXAMDriqUL6but3meYX2A
	QkeF3E3QZhxittOS4NwDxvFMxo5sl9KIXW8nzadoXrcbHnSoE8qVCgJ0+QpOJcFZR4zYDVrrBr4O2
	T+KQX9ySzRUnY64vZZDh7KmfE8jM8rq4AfwGIqMvjKA59AA9W1AfUOdlIRFVP+xlSnJm1fWbeanVt
	kdNeRt/83jjwA2kvKDHErNvZ277I4zfJPmP23gmTtOea9a0QI3pQnDHLQZ1IY3WliOldmThIuKRqq
	j9p2L4BYwzwICWRRiubiUKvcr44Iulfxpj1y9RTom6J0pN4uYkxTF7iYUfZQQ9h6pgCv04y4rHOui
	YuqnoccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Eq-00000009gLQ-1gW4;
	Fri, 12 Sep 2025 13:54:56 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4En-00000009gKk-46Ry
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 13:54:55 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3e35d87f961so243255f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757685292; x=1758290092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3tTGGzjAuGZXQWRu05vrCKimfXwg8uSaYFn3EC8TDkU=;
        b=d/7vGrq3BwWpuHtlYjH2M7GBewfuyocQn4+Fq42izqf2NtZBkZ1P4Nrrbv6/unJzlu
         EqWIfOpTTqGfBdJsdA3nccFaID6LYG/2wNweI3iZmDsLJkzzikDVfCWrgEhgR3I5x60Y
         90H3OQ93LQOItsH+5+eEq5H90l8UOB4jGq41m5v6wymCwa9IdZNzMB6qmIHf9IFDBUeM
         he6vp7SLJMcOT874Ih8Q4AZbO9QjemiQ+ThFfYPvG4pLePELtgOjevSbCJDcjQ/mAKmc
         IDuhXL1i78dJVZ4Z9zJ2ePCJiFP+KIQKZXeWdlO83xmZA9Xg3UJBVrWZK1MJD8VopbD8
         qR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757685292; x=1758290092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tTGGzjAuGZXQWRu05vrCKimfXwg8uSaYFn3EC8TDkU=;
        b=rlBCK52bRVgRpHnYyldO/JpuYtqBt/IqZfeRxF+Q6oE4HE2SajW/Rqf1i/4PSqH7uy
         19IlOc2nTfIrj/psnG+pMZLewEbAQ0yInHWmKtGYemNL092qYEsNP9R1vkhkOxR+zCYL
         lqXdjIx3ASTf4wraXmsNhuRqD1Iw2tBnsNZFeCQ02fN3lawge2ze1K+8mP1HH5UU3Fxb
         7cHBS4AJLpP+whHuUXoNiwiXwXlokwBaekvm/0zz84VQg0Tg8/I5Yp7AiCxf24ze/Lns
         CILRYeUUlLMi1q1dqHTP3vnlGx53YNPkiQINyPTRSJceW3AI4u2GTb8WkkQ72pNFgDqS
         5pzA==
X-Forwarded-Encrypted: i=1; AJvYcCWlqYXj/mtN9VhynUwH6cz9p5VeuoEfI5ctEodohmwyeJY1kChf2leEgZjwJYfaIJmSMW4077HRI0ZlCMr2NPtO@lists.infradead.org
X-Gm-Message-State: AOJu0YynP/UaBvlFazzq/BMiRwY6ZqwU7zipmmKpisPx5FIKaDqOTPN3
	OE7GUZRD6PDt5ksuvgpnKcSOoyQtdOwkzveQ94hM9tbsL2Xem6VxQlwAhp02/KDkYYk=
X-Gm-Gg: ASbGncvKl6eW8caQ4wM88os+biwr+QDuK9AsUJT1ooGa3rq2c6CwapCCpHVV8/uvsfI
	CTCWScbGzBEjgLnewhgptBPfxmrzp2IhMF0+hreV888MVN8tuWOczUA20ZOoyKT9RI46CTEgywC
	PpISYteSOCi1qGuTmvte3w6wrbXl8NzuQFjuJkbOLynbbJZ8ICtj1C55OfPuoW0BuVU2YCfIc0K
	k9VgeBliCcxsR8XtDqUrayAGVdZv8b9PQsy5ng2LYDdNt58cjlZnGSHplFfk4x+s/vYYpBaz1Ec
	crwBXXZoKvsF7HwBs1HdQgdxR0AHjqLScX8acoTEanCzCZF1bAMZ88muod6kWe0LK8kptpxpxOc
	/2CPmnZ1Xbb3Ffb33BNRTvqQqLwRYig9mq+Pt4PRRhRX2
X-Google-Smtp-Source: AGHT+IHa2d6N+I2Uzmdt0WNUESJkvL2LyjiN5VutHgQP0qs3PTN9Sv+qvKSGg2es7vfBpKw/dNOTtQ==
X-Received: by 2002:a05:6000:230c:b0:3dc:1473:1a8d with SMTP id ffacd0b85a97d-3e76553700amr1475966f8f.0.1757685291885;
        Fri, 12 Sep 2025 06:54:51 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd329sm6749615f8f.31.2025.09.12.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 06:54:51 -0700 (PDT)
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
Subject: [GIT PULL] samsung: drivers for v6.18
Date: Fri, 12 Sep 2025 15:54:48 +0200
Message-ID: <20250912135448.203678-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=+R3H1ZTHIpjD/7gpvZo0O5OPpiEvSR7fzcYJIZTMjmk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoxCYo+Pv5PhFkoqL+D2aJfApilJiP0CroSyKj8
 yHoC5S2/9KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMQmKAAKCRDBN2bmhouD
 119+D/wNTh8XCX0eJ1D+00tjKjvAUyIG70Ce8hwuspf2+Y/ZmUzzUZi3xCB2ExpCgMZ1SEHF0bS
 LJmEYKHjPexn37YqQs/O7V84sqOYJoCisxXUk5Gp9JM0SzUJ6yqZ9M4KoeJuq4PVd4x0cCl2DDv
 oFV+r6qKgwWyh/EVqokjUXqABdJhpGz9M2Wn1sSWRF5n3gujv3K/Sx1TGsbZgvbXxQWIQ58CxrS
 m/Tey1RNtLzTnrkorRlHcxbEDYt5fojnUgci4ebJIlG7c08f6N7vW+D+LTJYHK/FPy603PsxjwS
 XMmGu9EzyvflPL0r9IZfExuXIl+cv0FZ/ZWgHcnC8HGYwGOVG1ryDfcfRLo4GBcvx8vUGjBYFzL
 TU59zS2BkyaxpD6Cqh0Y6vTQdBb1eMjknAhDzouj27ZEETVsl637qEXAsFns6XigH6VVhJ4Nxfv
 FKTYKG6wNttNaCrQMdChdPHCJGrJhGwZ5gWFmeg9YoubQfFiqFLHASrdVyOSW0Jeu4OaZXO2NM1
 LHVnFaiNFHCP0JicZ51wIUqzoZCIUzVQwapxAfZaTrzhOurAdWWSSQQlJcijQTd42DZHnWaB2jN
 ZTImPN0hxyAK5KV3rExKxZoyfMhdIbnw73yrMA8atLu/Fg2x9IQLgmljorXpmViDqRq3698QMod iaNGtFLV2DD+xAQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_065454_046564_83B68214 
X-CRM114-Status: UNSURE (   9.54  )
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

Samsung SoC driver sfor v6.18. This should be my last Samsung pull for this
merge window.

Best regards,
Krzysztof


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.18

for you to fetch changes up to 1da4cbefed4a2e69ebad81fc9b356cd9b807f380:

  firmware: exynos-acpm: fix PMIC returned errno (2025-09-11 11:27:05 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.18

1. Google GS101:
   Enable CPU Idle, which needs programming C2 idle hints
   via ACPM firmware (Alive Clock and Power Manager).  The patch
   introducing this depends on 'local-timer-stop' Devicetree property,
   which was merged in v6.17.

   Fix handling error codes in ACPM firmware driver when talking to
   PMIC.

2. Exynos2200: Add dedicated compatible for serial engines (USI).

----------------------------------------------------------------
Ivaylo Ivanov (1):
      dt-bindings: soc: samsung: usi: add samsung,exynos2200-usi compatible

Peter Griffin (1):
      soc: samsung: exynos-pmu: Enable CPU Idle for gs101

Tudor Ambarus (1):
      firmware: exynos-acpm: fix PMIC returned errno

 .../bindings/soc/samsung/exynos-usi.yaml           |   1 +
 drivers/firmware/samsung/exynos-acpm-pmic.c        |  25 +-
 drivers/soc/samsung/exynos-pmu.c                   | 276 +++++++++++++++++++--
 3 files changed, 275 insertions(+), 27 deletions(-)


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6556DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEeNr4UQM6nD82XRHCzIRIjoe3xsp0k0uwMlhMJ0AyI=; b=HPpo3q4oZpR/Y0TkTp6+C6v8g1
	7aaOHAAP6OOxAQ8iWvgoOrU8kjFRFOWgRqL9paT95MhXVAgVv6JYUYkjCG9fI81Ob3fQ2a+h6i9DM
	ol1b/OfhHc3cGw64i+QmWK0cjawIENNxgOrLZkiZQAlPtJHHAY7N2L7w0Sqbn4q3CIhMznQcWRKEG
	xKp9NHN9aHkrMF6Lwo8ZYkE+RTU34/RdJpL1Speu/iULn4nCSHhjnxm6M1Sp4UnoTCZ935Lung62r
	TmMgJlAMWzjgd65sIsHiBPdzG7NCNHHK/mg2F0K3ZE6kESx4ywouB3k7a9jnFgzZstQ3wUUlLNrzF
	kBZebKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQ56-000000099zH-2OEu;
	Wed, 12 Mar 2025 17:41:24 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQ1p-000000099kp-0RZl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 17:38:02 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ab771575040so225385766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1741801079; x=1742405879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEeNr4UQM6nD82XRHCzIRIjoe3xsp0k0uwMlhMJ0AyI=;
        b=UFs2RxQFp7yqYXzi+d2Rbglk2w5Izb82sfuIR57B6tr+3ZokfKtn1uUQJ0OiDiD/JE
         52uofDwwiyuGRiGKvOBYzofj/tx5zOf5RKjCRNLBh11Mu2RfRibEq98JtWggeUKLyAh7
         uKkHLFjnOtGuvpN87U9ww1vC1Ys7hYH0Jo5nGNYnU6QwwRiGigP1lWg/bfJwltBh7WyN
         ajT6lYk1ara8EQ/8DKvSioJA7EvF/dj6n8nZTh2W2VNaNmA5+A1cK6/DpPoxK4lSwIoe
         pwDJJf1yt6AdEUr7P7yPTzhEkNZxmQh+5Gl2o/cV4vLUuSE0NndwhmDEBt6R8x3tKshw
         qkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801079; x=1742405879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEeNr4UQM6nD82XRHCzIRIjoe3xsp0k0uwMlhMJ0AyI=;
        b=YO4u0pL0vl7jtF/xDo0ygRjHrfXxuMCyaWEekte5AwLHMcWp/fzijKdGLA//yMR96P
         Z4nJu1uu4Uy2uOAfKo4Y8QWdaA6EoUVnKCxDGXZXeHAWHT2DFKETEcDcCPeDzM3p1XuP
         vuJpVD4jXFll5qgfkcSwlpboF76RXZp95VS3ISGk4ri/p5zkiG5hrcqCmaSlD+nqnyvw
         9EU2aNfwkQmi4kQU3meIOIW8oQulOOhD0MD5Ltt8tnGJaQXNOvPZR7cefMbkXuPLu4S7
         gj/FWeZle45HFHD6yNlCOhiUCehg4/8XMhuL3eVrVrRl6qjVSHEEWxLnMIFy48JWXo7L
         VaQg==
X-Gm-Message-State: AOJu0YyozmgbKY+92FjjekEA92q2YwFTn03WwdpA4hTaCIfz0ZBWgfNs
	0syRxOrgF3Gd9nc1kZmtrrfWXwcI/GQ0hlPa1nIMl00I/sD89Yv956MlCr6Si4o=
X-Gm-Gg: ASbGncvVADbDjAD/HPgYr6aoyoCPjwIGSJb2Ac9JYpaHft85W/PmAkVfM6IEg3PF+jv
	TvvRzlZNvjXbRvnzB5TA3GS2zdWqiz3WZ4Py/GMn2rDSzH36sRYlYuVivkyZaRoXb4LJtTWnOit
	2v3fPmScF8dAbP7059T7yU9ihAe6cyVisbBbWLDhdynVpb4BjWB9gSjDV9hYCmAoKzLS32SR3Kk
	z0GWBEUrxtwqZO/rkF4SlQOaRPSy8WJnxpyYicDTow6i2WzwWJx51ADrR1txBJjN2bjZTQNaLiv
	N0S2bp+hSg2TwiyGqL+P/YkF7m9ePHX+GIvFzMcrZtSurkKWvQXo1dR224ZIf5jb
X-Google-Smtp-Source: AGHT+IHZoXNnur5KGPxNzS/oI/LwDAfE9kg28FhzviV/7gJH1+NFPrf4Dlc1wmzmq8s5iuOYW2aG8w==
X-Received: by 2002:a17:907:c80c:b0:ac2:6fc6:b93d with SMTP id a640c23a62f3a-ac30aa6cda2mr64636566b.1.1741801079118;
        Wed, 12 Mar 2025 10:37:59 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.160])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2ede516d6sm92760866b.49.2025.03.12.10.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 10:37:58 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 SoC updates for v6.15
Date: Wed, 12 Mar 2025 19:37:55 +0200
Message-ID: <20250312173755.975074-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312173755.975074-1-claudiu.beznea@tuxon.dev>
References: <20250312173755.975074-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_103801_142400_05861E94 
X-CRM114-Status: UNSURE (   9.85  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.15

for you to fetch changes up to 8bd10f002411c9ea947edc0af18ad81f789e28d5:

  ARM: at91: pm: Enable ULP0/ULP1 for SAMA7D65 (2025-03-02 17:38:54 +0200)

----------------------------------------------------------------
Microchip AT91 SoC updates for v6.15

This update includes:
- SoC driver support for Microchip SAMA7D65
- power management support for Microchip SAMA7D65
- power management fixes
- documentation fixes

----------------------------------------------------------------
Li Bin (1):
      ARM: at91: pm: fix at91_suspend_finish for ZQ calibration

Ryan Wanner (5):
      dt-bindings: atmel-sysreg: Add SAMA7D65 Chip ID
      ARM: at91: Add Support in SoC driver for SAMA7D65
      ARM: at91: pm: add DT compatible support for sama7d65
      ARM: at91: pm: Add Backup mode for SAMA7D65
      ARM: at91: pm: Enable ULP0/ULP1 for SAMA7D65

Wolfram Sang (2):
      dt-bindings: ARM: at91: make separate entry for Olimex board
      dt-bindings: ARM: at91: add Calao USB boards

 .../devicetree/bindings/arm/atmel-at91.yaml        |  33 ++++++-
 .../devicetree/bindings/arm/atmel-sysregs.txt      |   1 +
 arch/arm/mach-at91/pm.c                            |  47 +++++++---
 arch/arm/mach-at91/pm.h                            |   1 +
 arch/arm/mach-at91/pm_data-offsets.c               |   2 +
 arch/arm/mach-at91/pm_suspend.S                    | 101 +++++++++++++++++++--
 drivers/soc/atmel/soc.c                            |   5 +
 drivers/soc/atmel/soc.h                            |   3 +
 8 files changed, 168 insertions(+), 25 deletions(-)


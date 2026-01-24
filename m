Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154ADD715DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 09:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lYuJM5xxHyayhgUiamwAETL6g/TQjMXIxfgveswC0ic=; b=C/Iui67t/zaSEIJ+H00GB1S4+r
	hkDdIYZsaCjQ8kA2g2NgBRqfR47hKwDYejyzfXublymWSD48aT6Bo9M4B7PbDaosDkd2X6+94SoYq
	fh7xIyYHCPrGnUqz1hvmwZXrDZTPZXVlSJ55bZYPGNzvA8utM+0MnAeUdqQKKIyaQYxTaUEw2JxeF
	7sOGqrK2FJPBnoExvP/0yz75aawmxOaN9qp0NSID9tBpq2D0Y4liUbANwZ0ELmc4lEDT36kSOpUeg
	hndcCqEzc7yIeGWRToc+q/ePKiJEd2BHakrw7rB5LhZjQqWgh07iN8VU41EbdO550ljoxwm4Xs0FD
	kS1sqjYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjaCf-0000000A8OT-000z;
	Sat, 24 Jan 2026 09:45:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjaCb-0000000A8Nx-1ykz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 09:45:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so23033865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 01:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769247907; x=1769852707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lYuJM5xxHyayhgUiamwAETL6g/TQjMXIxfgveswC0ic=;
        b=oEUUJJYGNGktG4GhzBTM0VGhLQKxEMFK2s7O9fOWskpGVqdQS9vigMXNzIky27NqTl
         i1LWCYWUyvP/fVOZHMdylojfyVAI4trytOfe70mVENYxH0TzIqXaW4aVocEfxceVo67D
         8ntbOn9iaj/IJCZR0OzQyNcBc7bsE4TCsPJoNwaLiHwS5+kBi+ODEHMzhqhN/KhKSzVv
         MiyB7BbKSxM+X43AsQgIIhNzOdV29pO/qV5JOQSt4vtX1xk+9M0uihFTljrs+1orCqz3
         /+366ogARbMnJe3pZ7ojmQo84YfC9czqUrLEXGaleS3qind7pAsBhmgaBbbVQf6BFYSB
         /i8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769247907; x=1769852707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYuJM5xxHyayhgUiamwAETL6g/TQjMXIxfgveswC0ic=;
        b=sE+a637iMyNodMObpBYzAFB1ndTM3iZbwzZyS55TqPOIoojBCSb58+uzFB9T+RtE/h
         xNssFqQF9QVE/ggUanN7LpJVv6QnUWKIMS9mZUOKyDGqBj25qO7aEDaqR6EO6WhsDFg0
         PaQkDl/109m3UH20iE2oy9PxZ7qx1NzyK3/2Ulv7evffpHa2mGFojeqNl/A6WJX7AQCT
         PPAFmpSZxYfwHLGllMVCuiqAsSf4NAIwAeLIv1wyLzD9nipR1joZ9Qrkh7tcs/j5RFSN
         JUry4PMc46PKzWIYo6nR8ZpHAP+SuAnjk841iuteSQRvy2ZvxuLK7HR9hPj3m15DfCxl
         tdvg==
X-Forwarded-Encrypted: i=1; AJvYcCUsQ4VXJELopzhAzFP6FrZLdS9TGJuCCuvN113JVUSda4NIEpXwRvY/o/GnS3QrSVGI/j4SZbRBQnY3v92tjd3u@lists.infradead.org
X-Gm-Message-State: AOJu0YztoR0WOM8gf57VRDGsuCbE6QEICtJxMuonb0cNrQatvXQ698S3
	Y8Zd2k+I94BGKhUj1qt39FkbhdTMoyMWmd6SegZyHXJioMIX3gUpum5Vyis4W/pmOSE=
X-Gm-Gg: AZuq6aIuwMKHPBfOQmUNZ11/og3OL7gCO/GTiyDb+ed5Yy7Vm4wr1u/1dmFkA3qjfJM
	7zi/rlRzJDBe7zrasuQBSiFacLLo+33uWb5oyUD0lkLF944s69umRoFjGYmnaeSEZOTvDNbIyxk
	iFEVKeEAu0lA7Be7JE30yTI5i9CwOScNG7YAgexbivvN3gYCVysMhyo8elsE/EhdIj4pabs639U
	bKVzzIEPwDk94TamnjSGFK1wFrUWi7IOmayJOTCd2Ndg5q8rlQO41gsze1hRmuk88yZeoFvzwU0
	JcFAGQZ0u1JYokrinyRdRPrAZkqJtwoC8cEpCe8roRGzMPgX8rgLLOjr6WC0DPiYzV3AJC9ojEB
	s/tD/B/PU6eFWhTkR8hClh29dA2NGrB2JoyFtcm03n2/CKlbKvjyYiiAkC/8K/booXJocJCWj1w
	869YNw0ISt01qDdJy4kM1a2ka/v6tj8iZraZRpLU8=
X-Received: by 2002:a05:600c:8b02:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-4804c8e758dmr87743995e9.0.1769247907283;
        Sat, 24 Jan 2026 01:45:07 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d85206fsm116002915e9.6.2026.01.24.01.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 01:45:06 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 SoC updates for v6.20
Date: Sat, 24 Jan 2026 11:45:05 +0200
Message-ID: <20260124094505.2106608-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_014509_541607_9E995E93 
X-CRM114-Status: UNSURE (   7.49  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.20

for you to fetch changes up to 0b0f7e6539a7507689445f8a0cace17305272bfe:

  ARM: at91: remove unnecessary of_platform_default_populate calls (2026-01-10 17:35:02 +0200)

----------------------------------------------------------------
Microchip AT91 SoC updates for v6.20

This update includes:
- drop the use of of_platform_default_populate() from the
  machine specific code, as it is already handled by the DT core

----------------------------------------------------------------
Rob Herring (Arm) (2):
      ARM: at91: Move PM init functions to .init_late hook
      ARM: at91: remove unnecessary of_platform_default_populate calls

 arch/arm/mach-at91/at91rm9200.c | 12 +-----------
 arch/arm/mach-at91/at91sam9.c   | 12 +-----------
 arch/arm/mach-at91/sam9x60.c    | 12 +-----------
 arch/arm/mach-at91/sam9x7.c     | 12 +-----------
 arch/arm/mach-at91/sama5.c      | 21 +++------------------
 arch/arm/mach-at91/sama7.c      | 11 +----------
 6 files changed, 8 insertions(+), 72 deletions(-)


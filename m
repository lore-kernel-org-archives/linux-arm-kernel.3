Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11C5C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OZv7t8lDV0iXHfFqBM3llVIlQFfOfljI9UC5k/uzgbw=; b=nXh7aJGiGRgH2XFSyT3fy9Yh5c
	dB9+H3qB34xnh18CIw9WUldBomK61Dn48V+SWrEKF8a2cto2O878fwBY/Y0RDl8wWMxwgLyyHUAOq
	kr7YijM00kbgAFuUJv5+oJz3YXRr6AU6k4CU4l98Dw5LdblrwfouIZ923wo1Pbqqc7gPpnjQSZjA0
	xKRbIdW/7M5vPVWSGENSWtjrFkvRj3FxLxNn43ffPQTTlHIU5/pE+yhsJnDyt6Ky4czKD1I4d+tEE
	3J6P6AvcqPkAug01I1/6vqasCtPl10UBtMLGceVUM2Cg8c7YpTP0WiBBsorGhk3GveDRxL3ZefxzS
	11xS5AAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwTc-00000008Tc5-3581;
	Mon, 19 May 2025 09:08:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwOM-00000008SXV-208f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 09:02:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so32143585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747645356; x=1748250156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZv7t8lDV0iXHfFqBM3llVIlQFfOfljI9UC5k/uzgbw=;
        b=yt8np1yP2gToR6o9O/FBoCFGDR3Xmd0PPf+jlriiUhqL8yMUGqsksgYA75LIsZZ7TJ
         364g9Jwjx5cSpKm2JX1DqsKBdZe/1ylu7qwIFdGmaBl3TQ3d2oT3FYYE9BRAjpVk6B5C
         h8Tz+oZA75VsL7XV+qFpFoxZ5zF8ZcUzEexhaQCoLz3Ys2DjveWm4mh7v3dzeM5cLeP4
         QETEzrjtNMT1DIuSEBDl6RTcDx3zIoesrBLlLtf6eN58th1vawR5MCn4Mk4zAuddvff9
         fhUDkHmLJeLmyv4Y5oon4BvbTXlccS6hCW6xowFDPXeMZQzs/HAdvLNurla9ZMLQK8U9
         0g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747645356; x=1748250156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZv7t8lDV0iXHfFqBM3llVIlQFfOfljI9UC5k/uzgbw=;
        b=dKqNdqf2y3C/UwtupznxSSGQqdH5/LbqlyZPEMDGDyKKFhQoYdr9swY35E9MvWCjYr
         GsQ3oxvMjjx06Ga22APeD74ib+nlcJOI4CyhZEeFTPrx5X6IM9HJn+u0VbjEibvIX4T5
         VALO+3GDqfnM9vVt2V4czaXcsz+Y1Sb0Zc95TuJLlDx5ItR4i4iBVuUAbZlyOfZneYAl
         Ga9QTFhhn3eEl/G6ZvDC+Oc33jMjjS10Jvyp13qh9WJJC2lhD1LVa2hWhmLyVTGsSW94
         /0lziAI30a/OF43BXE1YQEwbp+y7EIjmyp6WtVPfEAqAUmyPpiHvlUk1PFS0DALlg2Zk
         NXQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQw6OnnWz2MQQ5Mnea4gkEoR2+EbIeNPaEPcI9PbRxVy3Bs7BriPr39gYTPONAuH3qyTX0J3SPtMpKHInzCNyo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyg8Iptb0NyEzA4GTDxRhH2sPonfOAbkFWl4PT3FM39NC9ISE6
	nBxKKH7Opfcg5Oh13Ozb+2IZ/G3NwaFAaT2xmKLrXVycKVHVJ2lgNTJ/4WnnqqLNWgY=
X-Gm-Gg: ASbGncuGyfTeQhVpLWWMwCE9PPQBKW7sk4Up20X8HW86+E1CoOgjGaByyBkv0foK+hl
	6dS1WUkQ8BCrG8MJ4PIOKm8/3Na6jASpNJo9p6ydlNn3W+8JpZCdbNQhFyz5PjRolSKbZqTkvik
	lJgyLo/drCbulHzYfEoQqYE4Ouf44MKxnxSD/osiX5TxIbscoUAqbtl/bQxagLmHv3ys52Qpuoh
	EPeJF1XRSSoYZPnHs04tnP3Xb0LTPn40/xZGBM4G6n2t66XV4fP/MF7A1rzc2lLne3VIoK0i5te
	/VnvPAmptvxT4+BXepEzsFlTZoJn48JdFwA/TsMCtBcWjumllWA=
X-Google-Smtp-Source: AGHT+IFoYsaKW2NEe2NClmKIGXOT1IxL6UwFv/4s+ZsDYhRJPYQuPfae+I/E+1pAu02D6qEp1lVAtQ==
X-Received: by 2002:a05:600c:3114:b0:442:d9f2:ded8 with SMTP id 5b1f17b1804b1-442fd6444c4mr126185075e9.15.1747645355859;
        Mon, 19 May 2025 02:02:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fc90:23dd:2853:309])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a360b0b766sm11640130f8f.56.2025.05.19.02.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:02:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: arm@kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] ARM: davinci updates for v6.16-rc1
Date: Mon, 19 May 2025 11:02:32 +0200
Message-ID: <20250519090232.13147-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_020238_514980_4F759074 
X-CRM114-Status: GOOD (  12.98  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Arnd,

Sorry for the late PR but it completely fell out of my mind during Connect
last week. I hope this can still make v6.16-rc1.

There are only two commits here, one is a tiny DTS update and the second
removes da830 support. This has been in next for many weeks without any
issues reported.

Thanks,
Bartosz

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git davinci-updates-for-v6.16-rc1

for you to fetch changes up to 55da73fa7a68ccbe23c94ecc070d2ee0013f4fbd:

  ARM: dts: davinci: da850-evm: Increase fifo threshold (2025-05-14 17:37:54 +0200)

----------------------------------------------------------------
TI DaVinci updates for v6.16-rc1

- remove support for the da830 SoC
- increase the panel FIFO threshold in da850-evm

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: davinci: da850-evm: Increase fifo threshold

Bartosz Golaszewski (1):
      ARM: davinci: remove support for da830

 arch/arm/boot/dts/ti/davinci/da850-evm.dts |   2 +-
 arch/arm/configs/davinci_all_defconfig     |   1 -
 arch/arm/configs/multi_v5_defconfig        |   1 -
 arch/arm/mach-davinci/Kconfig              |   7 -
 arch/arm/mach-davinci/Makefile             |   1 -
 arch/arm/mach-davinci/cputype.h            |   1 -
 arch/arm/mach-davinci/da830.c              | 506 -----------------------------
 arch/arm/mach-davinci/da850.c              |   1 -
 arch/arm/mach-davinci/da8xx.h              |   2 -
 arch/arm/mach-davinci/devices-da8xx.c      |   1 -
 arch/arm/mach-davinci/irqs.h               |  27 --
 arch/arm/mach-davinci/mux.h                | 404 -----------------------
 arch/arm/mach-davinci/psc.h                |   3 -
 13 files changed, 1 insertion(+), 956 deletions(-)
 delete mode 100644 arch/arm/mach-davinci/da830.c


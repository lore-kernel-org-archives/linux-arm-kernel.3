Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC04E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 05:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5T7Xps2U+Xbtct6WpNh1Ms/jHQH/Zy0/yiacfJI6eY8=; b=CH3b1rNSH8DXCXKbtHt/lux/dD
	m8gYoxxAu2Yy0v954o54LsGp8Scr1318WdH+zVugvB5n9o4QkZCRj3OCqq5Ob/9XIdledFSvXnFPD
	QniDsH602MJo3KDYNvyGH+LwDXWZ6cCSbqMODmvTLv2UUP61KVHCszJKkI8NUa2cAz+WUrwit+Fx6
	n4gfDRCDPszu2npbOLzkGEj05VxcbVwkrGhYMJfhwaUqCsMafIDGU7lHtHmn6xcz71WykEgBb/dy0
	uVeatGunCDUvIHRngm7iOIVQBFHMpfkOlY7iGvdBuwPxe/JAQ1sjxuw9e3hjHByd4LGCP1AUlP0gE
	VJ1i99Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMhKP-00000007Rvo-3DAz;
	Sun, 15 Dec 2024 05:38:05 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMhJK-00000007Rii-0EdZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 05:36:59 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21619108a6bso22452825ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 21:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734241017; x=1734845817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5T7Xps2U+Xbtct6WpNh1Ms/jHQH/Zy0/yiacfJI6eY8=;
        b=JiJvcDMG9gjgoHvnHck0RyPBFgbCN7H7Lk6jKZKlwRGwgYxLUJCEFyhyMo0dvjDtAE
         BJbOhTT9h4HluJ1K3vz5uzhnAj4pM/rzXfucCCZH5Saycb/fjpUr8l/G1fNFdSebk2ze
         jZGtnqaPi/HJN9C83PM4rmKg8D/pkR5mhd814omo5iZ9s9Zs2g/qqYrTZ1SlpZx7oecB
         d0oh3iR9RSL79fgAu/YyuubPxB/j98uDc0MDgYkbWIsGCpsYoVesnGbZ5UVv6z4bcACU
         QmR1ysNjz9lUkMvDSPriYCXlEYetXhnBYX7tPnEicG1YM3ewvgfVBJFNW993vGJ7g6Wg
         E6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734241017; x=1734845817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5T7Xps2U+Xbtct6WpNh1Ms/jHQH/Zy0/yiacfJI6eY8=;
        b=GBkL3a7TD/TUX7V8Q1VrwgaZuwbjeTVIkiisjTsZgV+FhC5eIv3FFmCh3QdJE9FlYh
         5X8nu5J9YHcDHnXhPEc1PBbyqs1ChAeKl4E+1CutjFd9wzjks2hYS1yyOpHttYP0oalN
         T/mpeb4NWJKjDp36qnUC7DTG/UFv8aod9vjytzlEjrvGuE9kUIH9xtMzN8oE9iEvU/y7
         zg0XJnMc6upzIrxvU6pnTFzSdtxyUNU7+Ja6Vh8tRrFGsHfN9LCikGhUzkXiexrdQ9g2
         Btrh6n69PBsmvzZPClyRHVxLN8VQ5ydn16oCxqv8SBvOaUTxtRi9D7Nvhe5gpybNDh4O
         3VmA==
X-Forwarded-Encrypted: i=1; AJvYcCW/XMLorKhlsNG5pSL9YpkQQHjntE9g5Dtoo9Lhah6Obmg8HkYu4RMcmqVgpGIzSf0bBX8pP2w0zs5BXyHFypsS@lists.infradead.org
X-Gm-Message-State: AOJu0YyV4aci3k6vKZXWy9akvhjdEWjYZuE3XG6FxcxEwijCwu4abz8D
	xeV21vEkohm9AWthtizzSjOQQhWR/XvASd1BoTAkEgGCOA4VHkwpQdOjHrEB
X-Gm-Gg: ASbGncukvHwHjd7pDb5TrqwfEYAMSnSX0eVZX+3UUOqLQIepHpaPSSHfGaDndjt18Tx
	5hCc5bqk91ndUOW0E+karpaG2RzvFyYmH+ObXtc2SEcQ2lcDlTn2tmzTqgjXSRFTC4oXo7PTGAf
	SnAhb+zIu1Y0jtIU6N/JUyDl3t7/+9S2cHqcVp7oEBlMIIN3eHegYT4EtuBPwFxw9PEjL0S6F+w
	C/ae7stDxBtM++jb5980pzNqzRex1sx89yr2HKHhFnSF+5sqA==
X-Google-Smtp-Source: AGHT+IFi1PPQSUOrCioA0Ut+2J5jgMJCNCDNT6STQp0qD6xWCc08BjaoFiUHYwBhtNmNrzFypeNIzA==
X-Received: by 2002:a17:902:e806:b0:20f:aee9:d8b8 with SMTP id d9443c01a7336-218929a248fmr95477575ad.20.1734241016960;
        Sat, 14 Dec 2024 21:36:56 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142fa1cf8sm5729803a91.38.2024.12.14.21.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 21:36:56 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 0/3] arm64: allwinner: a64: fix video output on Pinebook
Date: Sat, 14 Dec 2024 21:34:56 -0800
Message-ID: <20241215053639.738890-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_213658_123557_4EA5DF46 
X-CRM114-Status: GOOD (  10.21  )
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

Since commit ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux"),
TCON0 clock parent is always set to PLL_MIPI, but unfortunately it breaks
video output on Pinebook.

I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
to the same clock rate and flipped the switch with devmem. Experiment clearly
showed that whenever PLL_MIPI is selected as TCON0 clock parent, the video
output stops working.

To fix the issue, I partially reverted mentioned commit and added explicit
TCON0 clock parent assignment to device tree. By default, it will be
PLL_MIPI, and the only users with RGB output - Pinebook and Teres-I will
override it in their dts.

Vasily Khoruzhick (3):
  dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
  arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
  clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent

 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts |  2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts  |  2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         |  2 ++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c                 | 11 -----------
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h                 |  2 --
 include/dt-bindings/clock/sun50i-a64-ccu.h            |  2 ++
 6 files changed, 8 insertions(+), 13 deletions(-)

-- 
2.47.1



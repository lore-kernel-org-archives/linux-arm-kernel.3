Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EACC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tJzM1K1Dmueh7OdUtHBIOxpyAgF67zAJOJ63216nDS4=; b=gL1dmNGwmgvp+CgaOZMvWek8gZ
	uDgDCbIgwi5gmROXuvA9dkZ52eX6i2gIVvlUez2ohox9NIkINPrJLIoiw6ycZHnv0vcvMbg/+i6+b
	D+iA3idC9FAXYdxyKI2e2QS+XKVxZMXoF2unlys6OnVfN7ONQKIh9asVr9nB+PHv5Piw23O5XQCc6
	9hpVYCtR9zompQnf/Rcs5ZpUDK8wet3Hf5RRjusmKz8YFx/17IYFBQozHHxwBWgNXk+/O5EtERREz
	dYkRV0Ce39NuJjwEl+bGsLnpLfBwZ+bJqaWCCXkweCp5YhjIZ0xmXhLvsusUl0FH8zfOIONiJP5r+
	yJZLGBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdjj-0000000ABCN-1Be6;
	Wed, 09 Jul 2025 22:57:59 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcxF-0000000A1ei-3cMu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 22:07:55 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so59393666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 15:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752098872; x=1752703672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJzM1K1Dmueh7OdUtHBIOxpyAgF67zAJOJ63216nDS4=;
        b=ADLfzSxI9/CJtZ2Di+cg3gXj+wRLuTrGSTUFPj1J8O6R1O11UVWz7kK2Q8p1Y5x5DW
         OC5+1nkkCslkn1R//rHm191OND0wyEStHw2NK9roKvLBiYK1rjVTSznfQJbXCeNcDLkq
         PoODeexKm7ivH8pODhax4otzvZez4oF3v43nyXmhSa8T/UtOVl6n17HUi0E8ygB9HGds
         YtfG/bO4m+ZHIU4mXVgXlMBygG8/9V5fDmHRgUqKKzDoQG+xGJfrMRf7Xjv2X5tY7rV5
         26mBk4PzJFMO/ejZiL+z2wZB8qWM6pMmdKad5kZwq+IzITJddc2iKTP6hM1OpbnyPJ1v
         AHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752098872; x=1752703672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJzM1K1Dmueh7OdUtHBIOxpyAgF67zAJOJ63216nDS4=;
        b=lXNuzkmpADnQmPBXvV51L39tZ94ZryA73AnyMqP85PvDa0bIrp6NgBzm+AKN96wDNG
         uvQ5sskWwcXekbwo7+MlwZyejY3lV94d7qSRruzE0ciEGHkoY/NYqzm8ymKhWFlHQu0h
         8SNuuGfO/Kd+sWyfJv0Xu+A54UhzEvEkEqh5vS+KjPKHjH/FP+I/R1NqgRWeK0uG5wke
         6IJZVjqAnus+TBUBMqSutu62ZUgj33vjXrV9hgKr7jrdUTO2vS/6YvquOYWAzITM86W8
         B79LjtJixsfZe/iFgd8SsHq7RIcCreHWF5KrY3SR4IkkZEyCmdTR2c7XY6q12kxRXino
         CicQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqvh/qN5n0krzxof8rB83k0ammMTVknffrWUhPL4kRlTqcmTVeT1XKcHnX+4RNyoA7eB2jQRBlyVMeL0cYaruL@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl9uBhvEk3j96R46hYSxCM0cxOjbH+fjk4sAWC3ctyAmN8hl+9
	lhLe3FO5MaGa/9SlYU4HfJ6OOLaI+MSyaIndlX1fAICcMsX7FJ4vaeqz
X-Gm-Gg: ASbGncuVwhE8IrdgL+G2gcKe106QJ6JVOHOsk4kRnJiOu6GeWj7bghUNDmOVo7vbiP8
	clXSInL9To1+GCSHJFKZ7hJZ1sfVs4mQWtadmQULmj1RSDTGKxJWtBBQsrbpBvg6LDZrQsCtSBa
	Tj/s5rmokF5+yKmVsh5btiorKS5+bLKu19fIAmHnYJ1qOMwDBWcBhqR0U4TGQt2K3mwzTZpdCDR
	xnoeAWlJkRvloOyaiKHG0G7445a44ZVo1Ku7/GSf6ScK/qi/9cUyP+0ylWlGKx0Mda5qDeNR1aC
	MkKt7HDwqyHg6091hC+Oof2sj3KQIOoukhm0k9rSDXW1cArBt76yub/fLklxZF2Y4XMsLvkVu9z
	Z2d6ypoh2+7lyWK1zHlv+0fyNJdFOXa7wDeUlcF9d8wyzjw==
X-Google-Smtp-Source: AGHT+IHlkfkLvk0xG1HBQFG/XesTYuOQg3jZVndTCAQHvvSGCdCcXTtdOQ4Fa6CTUyNNcLVE4GCoTw==
X-Received: by 2002:a17:906:d195:b0:ae3:a71d:1984 with SMTP id a640c23a62f3a-ae6e14550ccmr134642666b.57.1752098871710;
        Wed, 09 Jul 2025 15:07:51 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8264fbcsm10520666b.75.2025.07.09.15.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 15:07:51 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] Add support for Variscite VAR-SOM-AM62P5 and Symphony board
Date: Thu, 10 Jul 2025 00:07:03 +0200
Message-ID: <20250709220714.85697-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_150753_898345_60EE16E1 
X-CRM114-Status: GOOD (  13.61  )
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

This patch series adds support for the Variscite VAR-SOM-AM62P system on module
and the Symphony carrier board.

The VAR-SOM-AM62P is a compact SOM based on the TI AM62P Sitara processor,
featuring up to 8GB DDR4 memory, eMMC storage, Gigabit Ethernet, and various
peripheral interfaces. The Symphony board is a feature-rich carrier board that
showcases the SOM capabilities.

The series includes:
- Device tree bindings documentation
- SOM device tree with common peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern where the
SOM dtsi contains only peripherals mounted on the module, while carrier-specific
interfaces are enabled in the board dts.

Tested on VAR-SOM-AM62P with Symphony carrier board.

Stefano Radaelli (3):
  dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P
  arm64: dts: ti: var-som-am62p: Add support for Variscite Symphony
    Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 563 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 374 ++++++++++++
 4 files changed, 944 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi


base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
prerequisite-patch-id: 7e8493f8ed01ee319f827119ffdac7531afbbc4d
-- 
2.43.0



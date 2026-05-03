Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87947CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 19:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aMCDw9wXTxDgto5dOfbGsyssZJSrE9wLKmOGf2pkLYY=; b=BKu2wIgKfgAZG8OosXOS7PwGE8
	a4IIy/R2sKy9Rl5LH+LBJtkYj4QV/BUNIB1xzpJJJ9aS2xcROCZyBB7h8jGsEeohKsBXB2yI7EupM
	B1BGRUqGgSr5qdVqz/sYA5QWHLyFjPh8hBeJjXJeSXmLGI6vegbTerwiL2V/sOC8VY022RlL94gMH
	IPp7aRi5xZFMven0RolEJUbvWnjbAIsXc4LepZBAVmqfmbTss1yJM005Lhz1KJH81UnMYWQmOJMeg
	JIjtsuu4lt0ctS6CkhSWB/DEL0X3RqWhiPCOow5FsTRTc6GlPCawHpI5I3ENTK0AUkYr41khXSfMy
	J1iOZWMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcL9-0000000BZZJ-0SBZ;
	Sun, 03 May 2026 19:18:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcL6-0000000BZYI-0hZO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 19:18:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so45107835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777835929; x=1778440729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMCDw9wXTxDgto5dOfbGsyssZJSrE9wLKmOGf2pkLYY=;
        b=TKDwkE4WmbqBHe3uIK8X0TdZ/0QYcG/l9KrvfhjaLEHvihO97RgVJN0pYXoktqy3hT
         Xn34LS+PEJuiI+vJQekVzrWOcyKgpoIWmtlP8DJdXgP2y9/mEsjSEwJn1fpE1axOeA5M
         Y9M9tTUydDeKbj3Hb4WqjqolqOlnVhTWBJTKoPLS00iUfdBMQk8ckXzw7jDh3KVZh3qM
         3+fUtHaP89ffvHOPhR1z+hd4Vn2QXKZ+HfvrzFycJ38zmf5PEaHyhJdXqeD0eWEGqGXD
         W6aJ4GJAyh/Uqh7EaxWand9bH9mF14f0Qjqak+u9dtdAU2bXdPeRHsGo8TFLN8DLNFcA
         yfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777835929; x=1778440729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMCDw9wXTxDgto5dOfbGsyssZJSrE9wLKmOGf2pkLYY=;
        b=lIpl619+/C3rFegzUppcfaXCQr/SDiH6NsBq8kEAFiy+81tnhvo/yT1yzaY6S+No7j
         D+qAqQ3FYTWmSw7DNWvwMdfBPwn8penm4X91ZWmrMzdfiibccEVQ44XziKHxv+8nhfkP
         vy7nAXqpM39CCu7l9qMshfTfdwJi4TGRRx3S9z/F4uFTHiyKbz7hWqutmql8o7FNA9B1
         lw8T4WM9w7+I2hsc7lUS9QwQWrTiSmaJclK95+ePkLOf/EDvJphuOLfwRoDpvTcjeTXV
         bKCI76JooiymAAIhng7Ucql7GIWfVdOqwRmb+ZE0KRSakwizFxi6JmK2En3PxmGkyBfK
         yxWg==
X-Forwarded-Encrypted: i=1; AFNElJ96PmkBPrMJTHUm2F6S6EP84r8UMIFNKev+xUfuwjrwbNBy155IvqgOQ7HTLWQNRUk+QvQL7CDrJCt+QVrHRcDt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0OiKLxaJW4ccTcp0RzT18LSq3gTOw/oLC3/W6YJogfPNhOQbg
	EJ7E9hPwjL3ZeLXHllYjE0eUHfQ62UqP/IALBUBmDcOc7fnaIbazBXfT
X-Gm-Gg: AeBDiesc+DMDY4QV9TnKmMqScwWK/tYGKqxZ9GCQG34CmJDP/AMOfLtW10fKG6dapzY
	fh1j41gOD0N+kJhcW9jd3UMDZsZLzYYQ94zZCU9sj/GZEVOyUC7QfBUnrCZvto5g0OTgiEjC9JN
	tsWHr265FzyPRNdR2u/JD+FV5dMepzsXlvxiERqVWx22TesEk4kqYg4DmLRkQXyRlV4FPjxFtyB
	Z1xcVi+Ck4vfhL+5EqsTFq/kiNjoD3Xrw3jP6qIYNTSr4rf62NOb/iDkM8eRs/os3XQZrFcs0YT
	qYNv2szr1cbklDRASBDalTEIi1oC75/29rsmlOa9ok12FNGvXc4EvTo5nbr7VW2/EPtvKESqBEp
	AvmmPU8+E+cdUZy/KCyvZ7ledAAbcLp1aVLJCcvysNUpim+Ju7qlds70TepQvon2CrlwvXB7r/e
	LhkZOCKJ+Ka44D6fwgMJ2eeNpRUzsv7bbP3X7IizF0A8JG10A14vevUaD/uOZowKI=
X-Received: by 2002:a05:600c:8906:b0:48a:5574:3a5b with SMTP id 5b1f17b1804b1-48a9867a7dfmr82025435e9.27.1777835929008;
        Sun, 03 May 2026 12:18:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe928f6sm62230925e9.6.2026.05.03.12.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:18:46 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add support for Baijie Helper A133 board
Date: Sun,  3 May 2026 21:18:35 +0200
Message-ID: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_121852_238864_37534ED6 
X-CRM114-Status: GOOD (  11.49  )
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

Baijie Helper A133 board is a development board around Baijie A133 Core
SBC. Features:

- 1/2/4GiB LPDDR4 DRAM
- 8/16/32GiB eMMC
- AXP707 PMIC
- 2 USB 2.0 ports
- MicroSD slot and on-board eMMC module
- Gigabit Ethernet
- Bluetooth
- WiFi

Add initial support for both the Helper and Core boards, including UART,
PMU, eMMC, USB, Ethernet.

Link: https://szbaijie.com/index/product/product_detail.html?product_id=23&language=en

Alexander Sverdlin (3):
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-baije-core.dtsi | 159 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   |  93 ++++++++++
 5 files changed, 260 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

-- 
2.53.0



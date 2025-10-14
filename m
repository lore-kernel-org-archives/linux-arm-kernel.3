Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07700CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 05:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h5pJYct9yVXw0oCIW3UzRkZKmjOaGJ9oUwhyyYxVEys=; b=QPpYJhxJWjvBlu5aMzKTluaA5L
	TfHEDFXn8pxZCFpxSd2upZCDWLx9RpxScMj0BU6zAges8b+BBIqZkFF80OJ4xf4ZqefXel9xYMb7N
	+2lv/Gr7gLQPhJX9YvF/di50ymHLzFArWxnBhJPc2F++bU9t3zak2T2bl5lFWn2jR8k6c9OQJGkTg
	mJQC4Dx7srS5cP2y5GL+IciKdYqJg0wepEVgzNBQOitSMXvpmNLG/EklRNjqiQxbWphqXmzQgSS2R
	KTHmKyMp9YGgAUko4L0tL9JIQThVEJcinvaEat/HKCEI+iT7jX5L3nCE1EZuC6e+cy70K83Kzc2Dh
	Lf9Nmu/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8XLX-0000000FAzv-0yMV;
	Tue, 14 Oct 2025 05:13:15 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8XLU-0000000FAzF-11sK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 05:13:13 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so4701918b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 22:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760418791; x=1761023591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h5pJYct9yVXw0oCIW3UzRkZKmjOaGJ9oUwhyyYxVEys=;
        b=U8/QU/H+Q0556SiGOjSK0+akuRKWExaL7K8LdvJSi+uG1i+9hS6s4PQmWCffW6ybWJ
         beNgmkzakDdo79m34TVABVK1ViURA5NeJqwZLRBR5TQNM0euTnbBJdHp6qbBaGmiMdJZ
         4jIhzpKGb7w3KcNKctBfapIs20ZATOAezHDORBUlYUZ0uE7d4M3kIJnQgfRmUc31tSU+
         5MquOkcsubX5wHwFJPMO5MGJBt0MMFKRhnOt75h2HUbqwqanQDndTiV4T/iby5Iix7sD
         Wpiz0yBJRYRFSa8pkuZj++Shon1i+tMa5D48VyBcBruUwGge731OoFZo/8bWTlpjx+oW
         DmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760418791; x=1761023591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5pJYct9yVXw0oCIW3UzRkZKmjOaGJ9oUwhyyYxVEys=;
        b=DIfgJbE1s5yFUDIbXyKuXBM65TevPoBsqZUQeET0ZrAPJvfdhtuusInF1aSUeCFvMI
         aZG09IqcYn15GMgDzoafyEIoyYhAdbuEIeAPNyausnhnX+O4IE3tIfdghyTwvHvaJQIR
         XeppQqorCM4tNuPNGJZv/Nui7/JSz/VlpEgVNqfpEPGjntByqTgInM7JgHcdlm16DwT8
         XQFO64DXqT/nUG2SKl9mEwisDr+SqL3lcJ18zbP3YsFpmX2+k9wNFjwVUfsbN8+VzjtQ
         15rlV/h7IgqFdc4n3IgvJaF/igzpfdKkMlQOsyQlt7r8aUA7wsQBdGrrTbvCD4oscm/y
         RrXA==
X-Forwarded-Encrypted: i=1; AJvYcCWOkghXO5xZnArYalBToHzwz2AhCd0/2MtusRHn1MK2sFzDP9qc0i58EFBYBVm2Uy4z07Brx2xxcje7KrxNicL3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5u8d6ar24u4CQxpU+8cudhof0X3xp75fa4bYDiuul9/A46YhW
	kzfQqOkbX0N5pvsqSC7TqHOpgy4vnzo8TowvvNCVoCuOxTPzQno8nZGd
X-Gm-Gg: ASbGncuzhXfqIlQ1sdBH1SSV8eSCTPmwoE5MatVYzySgRR2U9YvdVx5YiASXIa2gPfj
	y2433dFQTtPXzB88rqTcYzdPTLjlbg4J5UnsaBkO5KMLwjidtGBCkYL+fFniqLq9RlDLK7evppA
	Ylt+11B7ZoZIt+2HRi6/TGIDw+IPojK+Uo0cB8UXjqmxshPfVnYSGY+vf8FBaX3A6kPc1eXpEUk
	HvzTH5Z80u1ANb8pJheOPw23OyeqfrEipGaAOcvQpNiI4pUGLwDqCxcAdrEDueQGvI+Y6smoLWP
	i8MIV+4IrRYK7qLHD9/oeNIPKhu1LOE9osdKEWsY4DOh9hSmSDMpatrJdV9YBHSKt6mRX++hZWY
	G4DV3xONp0nF5Huj7Pg07EUQh17BBlTK6D8IeA9Mnd8CDMz+Kk92X72/2T8VPccYeOQ==
X-Google-Smtp-Source: AGHT+IEFCzkkgshVwSNP2mRUNWEuhHD3ijpyLH4r7whNKouoX3vJnv6qHBbE3m/mtSLuTYRMhWSgqw==
X-Received: by 2002:a05:6a20:72a5:b0:2af:65aa:4efa with SMTP id adf61e73a8af0-32d96db58d4mr34629174637.8.1760418791214;
        Mon, 13 Oct 2025 22:13:11 -0700 (PDT)
Received: from localhost.localdomain ([223.74.108.51])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678ddce4b6sm10902353a12.13.2025.10.13.22.13.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 22:13:10 -0700 (PDT)
From: Liangbin Lian <jjm2473@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	kever.yang@rock-chips.com,
	naoki@radxa.com,
	honyuenkwun@gmail.com,
	inindev@gmail.com,
	ivan8215145640@gmail.com,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	dsimic@manjaro.org,
	pbrobinson@gmail.com,
	alchark@gmail.com,
	didi.debian@cknow.org,
	jjm2473@gmail.com,
	jbx6244@gmail.com,
	andrew@lunn.ch
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] arm64: dts: rockchip: introduce LinkEase EasePi R1
Date: Tue, 14 Oct 2025 13:12:23 +0800
Message-ID: <20251014051226.64255-1-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_221312_356462_14D78EB0 
X-CRM114-Status: GOOD (  10.78  )
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

LinkEase EasePi R1 [1] is a high-performance mini router.

Specification:
- Rockchip RK3568
- 2GB/4GB LPDDR4 RAM
- 16GB on-board eMMC
- 1x M.2 key for 2280 NVMe (PCIe 3.0)
- 1x USB 3.0 Type-A
- 1x USB 2.0 Type-C (for USB flashing)
- 2x 1000 Base-T (native, RTL8211F)
- 2x 2500 Base-T (PCIe, RTL8125B)
- 1x HDMI 2.0 Output
- 12v DC Jack
- 1x Power key connected to PMIC
- 2x LEDs (one static power supplied, one GPIO controlled)

[1] https://doc.linkease.com/zh/guide/easepi-r1/hardware.html

Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---

Changes in v2:
- Change deprecated "rockchip,system-power-controller" to "system-power-controller"
- Link to v1: https://lore.kernel.org/r/20250925055906.83375-1-jjm2473@gmail.com/

Changes in v3:
- Fix typo ('status = "disable"' -> 'status = "disabled"') found by kernel test robot https://lore.kernel.org/all/202509261328.Grjhp029-lkp@intel.com/
- Link to v2: https://lore.kernel.org/r/20250925092037.13582-1-jjm2473@gmail.com/

Changes in v4:
- Fix missing "Acked-by" message in patch 1/3 and 2/3
- Link to v3: https://lore.kernel.org/r/20250929065714.27741-1-jjm2473@gmail.com/

Changes in v5:
- Change gmac phy-mode to 'rgmii-id' and remove {tx|rx}_delay as suggested by Andrew Lunn <andrew@lunn.ch>
- Fix comments ('not mounted' -> 'not populated') for unpopulated devices as suggested by Andrew Lunn <andrew@lunn.ch>
- Link to v4: https://lore.kernel.org/r/20250930055017.67610-1-jjm2473@gmail.com/

Changes in v6:
- Fix missing 'vpcie3v3-supply' property for PCIe nodes found by Chukun Pan <amadeus@jmu.edu.cn>
- Nodes and properties are sorted alphabetically as requested by Chukun Pan <amadeus@jmu.edu.cn>
- Remove unpopulated devices (sdmmc0, sdmmc2) as suggested by Chukun Pan <amadeus@jmu.edu.cn> and Andrew Lunn <andrew@lunn.ch>
- Remove 'combphy0' node which is unused
- Remove 'clock_in_out' property in gmac nodes as suggested by Russell King (Oracle) <linux@armlinux.org.uk>
- Remove deprecated 'label' property in gpio-leds node as requested by Chukun Pan <amadeus@jmu.edu.cn>
- Link to v5: https://lore.kernel.org/r/20251009084416.45542-1-jjm2473@gmail.com/

---

Liangbin Lian (3):
  dt-bindings: vendor-prefixes: Document LinkEase
  dt-bindings: arm: rockchip: Add LinkEase EasePi R1
  arm64: dts: rockchip: add LinkEase EasePi R1

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3568-easepi-r1.dts    | 624 ++++++++++++++++++
 4 files changed, 632 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts


base-commit: 30d4efb2f5a515a60fe6b0ca85362cbebea21e2f
-- 
2.51.0



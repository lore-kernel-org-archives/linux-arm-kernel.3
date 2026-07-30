Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22598C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 05:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oLomkV/WERA4unRDmZMMnCa6Bk9H4/ypeqQvvFV/QKQ=; b=cgj3mhSwJjwNh898nbSFIY0vt7
	GYsASTotvz/bohU+E/k9oB0N2BA9ysRDtmidR/yHVndu77tE0KbymcdGRDJO0+B6n7ODxb3/GbKyG
	14frFUMOHJZ3tScvNJcTxxw3Q45znBpSdWL0XfFaYkPYSBjK4+8wIzcdJP80PL+4uVvcMX9fGUhKf
	HMCjU76WB64pM0RM3YD7GsMFtsgKH68mVHvqc9cDXydoaXWzHgkYJHyVn5xeiIe/Z+BbkGzr0KRK5
	37M0+YydD6mBewoPlaF0OOqkrx33rDaohT54GtAjgZOwC7zQjzMKVj8huBDdlT+HlGE0EsJ0Ix0oK
	7VOaAAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIsH-00000009WE8-2D3Z;
	Thu, 30 Jul 2026 05:00:05 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIsA-00000009WCG-2B1m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 05:00:04 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso275185a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 21:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785387597; x=1785992397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLomkV/WERA4unRDmZMMnCa6Bk9H4/ypeqQvvFV/QKQ=;
        b=XhbOYtoX4yxTzQbFEc0AvKET5HJ3OYXT1zPY+9Hwp26Y0zUBxb7iD13SCHtn7EYlt8
         2ZXI17jLrqShks/mZf61vQW1XZiv/BRJ5vO7+dvbwWXC1rs2RcijqhrINSAc/Dw27vrm
         zOfpO4lf4eETruW9ENRldLzkjgCDQdCoJvEPmB/YrHWjG3e3idnqeibu3tJOAzn4FDGz
         HVXb+6BeYuQfFKjAVdJzq0cG9/UZ2Iew8OVx0xZ/TiT2I+aOB2AaIX7ebHUS4jlhKBCA
         dhSm0zg8zuh5v9DR82bbQ741jXuOncno7ySXth7WWOxOO4nBSeSE0/GORPDRmCnokX7b
         yCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387597; x=1785992397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLomkV/WERA4unRDmZMMnCa6Bk9H4/ypeqQvvFV/QKQ=;
        b=g4y9yzo+u/gC8JiqQZNtn+vPndl2sxecg9wXrupt6d1Lxrj/N7CxPM1q7KkLs4TBJv
         0rsNy8+lk6BKHkcgRJ0ijdSAIpeKen6at1TkStSxNvVtzCdRxegOU/vD9mn0+Wl95zo6
         lLsFHZnqu6mgfgIMYzCOSSDhcdP+SeXb+BWC6ru1M9KCa/a0h+f0roR40i3sfN7J8IlV
         yGm15ojk1vxJ4Xsl/5f01ZH7Nw3Aejb0FwCSA8u+NEnktqit8T6Lgw5Yg/8d8ddm+bv1
         wryr7/0kkz00f1u7PPXDwLYY5OzYTYML3j5vjufD5qZA5k0HpNFyGWAV/aCgpUMKu1bg
         o9Eg==
X-Forwarded-Encrypted: i=1; AHgh+RpPlujF1fsq1fmVKXqJdjeqBFs7adhJJmyflmGt4gP7ly8TM0T4rUDOlhfS4lBUfZeaJIQvefVGuYgGcfuGsylo@lists.infradead.org
X-Gm-Message-State: AOJu0YxXB2cBei210rZhlkirnKr+ifzV7noaG4rAfNa6u8YJ0sKqQpOn
	iruBelhsPsZI1UfNFdD2MhDT+dD8Mqlt/VHZ7rPGndELveoHBFHy0HfG
X-Gm-Gg: AR+sD10pMa/Mm/Rc8kDgdHcpvtFlB3bWXMd4L8qYzdRgWcTekTvDqeUr+sT2IGJe2u7
	4OnUoo0Ox+2axMzlx9ScfLdMJXAv1clqgWjrYliWi145zR/BzW7GGvXIeKwwPfdd+YbMjFTFlm5
	rNPaAYyoZpbyv0ewqz8+/6djXf1nZHeoOJD2kKzRLkJeGmkwA06Hqr9C9U0vC7vkhiLDRFjFn1v
	ZyJcu5+qzqg6EFp6ryLd1482jQnDZFIeNnVnqfa/jZ3nyY9gaLGvtof4EuttggMexnp4fGNZcta
	R7jXcjdaEn9+vADjnsqh+XGnJy5Q7peK7TNJ3PlPGJuULHqGGJDgwORMYPd3oENcNmELBTDIXff
	VQhLC2Q9WlpZXBBagE+iQz5gGfXjVlex1bQNGsgUem5aNxQUJ2XhfXXF5JK382kRZvGIt1QmSQj
	u0NyfCUeSXdn+uvEXsedJu77UuuTmJAZ8ZSHPFr1TpiFE1cxgPjK51GOhfzSgmI37F0fBe
X-Received: by 2002:a05:6a20:d52d:b0:3bf:990d:3fc7 with SMTP id adf61e73a8af0-3c901549430mr881717637.20.1785387597517;
        Wed, 29 Jul 2026 21:59:57 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72556386sm14383898c88.0.2026.07.29.21.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 21:59:57 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v3 0/2] Add support for Vicharak Vaaman board
Date: Thu, 30 Jul 2026 10:29:45 +0530
Message-ID: <20260730045947.388660-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_220002_394217_6681B17F 
X-CRM114-Status: GOOD (  12.26  )
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

This series adds initial support for the Vicharak Vaaman, an RK3399-based
single-board computer manufactured by Vicharak.

Patch 1 documents the "vicharak,vaaman" compatible string in the Rockchip
arm bindings. It carries an Acked-by from Krzysztof Kozlowski.

Patch 2 adds the board devicetree, enabling the RK808 PMIC with
SYR827/SYR828 CPU-big/GPU regulators, Mali GPU, Gigabit Ethernet (RGMII,
RTL8211E PHY via a proper mdio subnode), eMMC, microSD, SARADC/TSADC,
PWM-based vdd_log regulator, and UART2 serial console.

The vendor prefix 'vicharak' was previously accepted via:
https://lkml.org/lkml/2026/6/24/929

Changes in v3:
- Replace legacy snps,reset-gpio/snps,reset-active-low/snps,reset-delays-us
  properties on &gmac with a proper mdio subnode (snps,dwmac-mdio) holding
  rtl8211e: ethernet-phy@1 with standard reset-gpios/reset-assert-us/
  reset-deassert-us properties, as requested by the maintainer
- Add phy-handle = <&rtl8211e> to &gmac
- Add gmac pinctrl group with phy_rstb pin for the PHY reset GPIO

Changes in v2:
- Fix fixed-regulator node naming to use 'regulator-[voltage]' prefix
  consistently throughout

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman board
  arm64: dts: rockchip: Add Vicharak Vaaman board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3399-vicharak-vaaman.dts   | 454 ++++++++++++++++++
 3 files changed, 460 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts

-- 
2.47.3



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB21F45A1E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 02:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8AO3/aAlun0d/2MK5fwm9gbSeroCU5cGcr9PM3HBALI=; b=PyQ1Q/nDmvTJQ1zmY8fg7OouMp
	qT0cTKUzn6RTBV4AqkYvtjgjug1TYTKYa8uPZnCMUp9+BbYgdG6zbyFd8OWbbrkW8fIM/0kz/BQn8
	PsgubJj9ip91JULzjygpq+8beRJF+1tf63DlnzwwTb54cEC/B0+mjZLetVhCgFo5DzUu89QOTRbXp
	ee/NYRdZLOXUrpP7LEEnFL0KRFHLd76PAcXGJiJVAexF1gs0w1NjEK7V1W7nO2pKIOZiNlnTJ9LsT
	BE0dvzjxfW5iuL4w2gaUszrSKt9A/g2QvWyCVgW6ZN/+qLOiOLcu2btAjyH0HQpj83be0bAw+kQ3L
	h2LsY34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBONz-0000000D40e-35XF;
	Sat, 11 Apr 2026 02:47:51 +0000
Received: from mail-oa1-x61.google.com ([2001:4860:4864:20::61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBONx-0000000D3zG-2EvC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 02:47:50 +0000
Received: by mail-oa1-x61.google.com with SMTP id 586e51a60fabf-40427db1300so1894240fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 19:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775875667; x=1776480467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8AO3/aAlun0d/2MK5fwm9gbSeroCU5cGcr9PM3HBALI=;
        b=B1CtYRC5QWTSgC8daxYx9RtvwhmceFiy07s1X/vzJjpvRcqzksjjaE6Fy+865IWjCX
         sI8kSzifW2LXnIBdYMT5yWfJGcOvreBVb/8tYOrQDmKmGeKzw6tiedhCEL7A9BwEa/Di
         x4aJ3jmlKGUkKS6jH7VRb5tXIsoQCnZN09O8wTS5fOurq27d83DcPGwhrPyww4vGqaIx
         vw7wVeVUAWSnvGqa6XWxz6p0oH1iogZjanSTSzm9s7g0AMA7Soyf3pos1fM87Ncu+gAU
         UGQ9d3SypTzEvShhJuOr05iVz4VCBHLtn6Zx9bC9TK+hKlUk0ANKZ6CB6UEy+G7k2x12
         Ebeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775875667; x=1776480467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AO3/aAlun0d/2MK5fwm9gbSeroCU5cGcr9PM3HBALI=;
        b=NIxB084/AmmgNRvxCqPBAXONTW44wAoJHKJ85Ma/17V0mE8sBr+QinueigWLCaVOTD
         gEBbH8UUnIHSoSqfZ4ZWjPRTaxSSOMAbqH/TjxrL9NDcr1RANAq2uOCxP0BxxUwzoRLb
         FNPdUa0/tUAS34r6MiDLtNgaS+j+0JploNuU3kGhjB9JJyBmEuMWe1CEM7YvHzqlFj7f
         B1WkTFQHD8M2ozlFBWPKpnU+NmpJ1L7it6eF3R0kU+nwv0W2ROZtr0gtj0sAVeYFr9hn
         xxbHwoG6Vnh9zT9qaWLLiUOYfiiGQQpZg3NjkPlpX4XacslPZ8dQN5Fj54NZNqVMlQGC
         Auhg==
X-Forwarded-Encrypted: i=1; AJvYcCX4oD+//SpxAC9hUJ5+cgD501j/e9JAOCZyi7ke7czNNJbBP1WsSUtzP493q4augaSyp7knhnq0pEIBONSMR5XU@lists.infradead.org
X-Gm-Message-State: AOJu0YwtYHPddsiVHH48FvzSdAUqsR96hI3ytNKLwBNc1RM9leD30jLH
	z/HZfX03UTNaeGPR54rYsKnJPtlCeuE+uwj5JWYS27Ar8knLkrVZ9SGq0HywgpOHZX3l56dLvZj
	M8GBtu9zykcC7TwNaGv45tx2E8yZsEo27Ub56
X-Gm-Gg: AeBDiet/aZq3ANSgHSasqHqzUzw2sawA5mw+x4eL6qh7P1O+ld7FxiNtaTHFyZQrwGg
	VptmVFltcNY6G4LVEJMkHXNwAZNwDbAHMawQzAc/uw4elRCRPOGBJLub8e/XuLRXxmIQ/sod1vn
	q6VG778nRrNyNloYmDwXtpHX4u1fj5/DJFsLBCkhVkL8jnYI3WGUh1NG1aSlPiiOm31jD3EVk0r
	TmEy3dnjZAU9ZFOFxTSJ0gnvSAXmyZ93fhwciJ1p7HFM5jprgHX5A/Hhp9otuCu7gexMSZqZhcS
	Z1WpCXpU0e7GprOqotuudn+5sFRBQXhFRChtnny3X2ONfFEyW+C7kmRY8GGiXyRlK9IoZ/XxGyb
	MYRDqnKorQ6CAtM8Y+y8Q0VgUkwkdHT/MvSsKDy8UMULz
X-Received: by 2002:a05:6871:2ee7:b0:404:16c6:40b3 with SMTP id 586e51a60fabf-423e114b119mr3123217fac.37.1775875667513;
        Fri, 10 Apr 2026 19:47:47 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-423ddd32ab3sm599086fac.16.2026.04.10.19.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 19:47:47 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: dennis@ausil.us
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] Add support for Orange Pi 5 Pro
Date: Fri, 10 Apr 2026 21:47:40 -0500
Message-ID: <20260411024743.195385-1-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_194749_594292_82AF852C 
X-CRM114-Status: GOOD (  15.31  )
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

From: Dennis Gilmore <dennis@ausil.us>

This series adds initial support for Orange Pi 5 Pro. The PCIe attached network
driver(dwmac-motorcomm) was just added.


The series was tested against Linux 7.0-rc7

Please take a look.

Thank you,

Dennis Gilmore
Changes in v6:
- Move the shared configs for the Orange Pi 5 and Orange Pi 5b from each
  devices dts to a shared rk3588s-orangepi-5-5b.dtsi to avoid duplication
- Remove empty ports subnodeis from typea_con
- Move i2s2m1_mclk pinctrl from &i2s2 to the es8388 codec node
- Add dp-con, dp0_out, dp0_in, and vp1 nodes, plus the vcc3v3_dp regulator
  in order to get the second HDMI port working via its transparent
  LT8711UXD DP to HDMI bridge
- link to v5 https://lore.kernel.org/linux-devicetree/20260401010707.2584962-1-dennis@ausil.us/

Changes in v5:
- define a connector node for Type-A port, and list the regulator as its VBUS supply explicitly.
- Requires https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a4c2@flipper.net/
- link to v4 https://lore.kernel.org/linux-devicetree/20260310031002.3921234-1-dennis@ausil.us/

Changes in v4:
- rename vcc3v3_pcie20 copied from rk3588s-orangepi-5.dts to vcc3v3_phy1 to match the schematic
- use vcc_3v3_s3 as the supply not vcc5v0_sys for PCIe
- remove the definition for vcc3v3_pcie_m2 as it does not really exist
  as a regulator

- link to v3 https://lore.kernel.org/linux-devicetree/20260306024634.239614-1-dennis@ausil.us/

Changes in v3:
- moved leds from gpio-leds to pwm-leds
- remove disable-wp from sdio
- rename vcc3v3_pcie_eth regulator to vcc3v3_pcie_m2 to reflect the
  purppose
- actually clean up the delete lines and comments missed in v2
- link to v2 https://lore.kernel.org/linux-devicetree/20260304025521.210377-1-dennis@ausil.us/

Changes in v2:
- moved items not shared by orangepi 5/5b/5 Pro from dtsi to 5 and 5b
  dts files
- removed all the comments and deleted properties from 5 Pro dts
- Link to v1 https://lore.kernel.org/linux-devicetree/20260228205418.2944620-1-dennis@ausil.us/





Dennis Gilmore (3):
  dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
  arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for
    Pro
  arm64: dts: rockchip: Add Orange Pi 5 Pro board support

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 .../display/rockchip/rockchip,dw-dp.yaml      |   7 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 192 ++++++++++
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 352 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 198 +---------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-dp.c       |  12 +
 9 files changed, 582 insertions(+), 189 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92906C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 19:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9qu0kVYDa1LJAygHrKHPQPVcQppgU3bFJcwVxclK610=; b=F+av5AcxX0fIxtpgGG9XDm2d/q
	0KMufQOT6Tc0SJBGDv+52A4v7ZAI/6wC2RZ7Sz0YRMt5D9UvR9KrJCQETrSS2fml9Jg3iXjKlzBfC
	gWB9uO9W8z5ODXT/02t1EKPxctzVopaCd1gHi2iE4aTS8FZLKtZA2upejNvLD3d6jCBNAkTcLV0sp
	zbJ6cMdWHD8LazJjfSGJ2f2zrhdX+qAT79CWijkr+8Zj/1zG97GsR/hjoDhfdUvPeEIUGVxXkaLLC
	LwCtLU+zuj3W4MUOBso0YvKVPjTkg45Cno+4EsIqb7YAkY2Wefcu1vCbJUUbAamrzoISpTMgdvD9p
	Z4NAFz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6ax-00000001cSk-3ccM;
	Thu, 08 May 2025 19:07:47 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6Yy-00000001cHz-3PSh;
	Thu, 08 May 2025 19:05:46 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6f5496972d3so13399516d6.0;
        Thu, 08 May 2025 12:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746731143; x=1747335943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9qu0kVYDa1LJAygHrKHPQPVcQppgU3bFJcwVxclK610=;
        b=k8/19qSXy0DmRhlseN0A637rHjYcEqqhFMWVDhFthzFAJXr/uSBDTrp+p0sLFAjz25
         1sKt2ldQyvp12WOkcdOo4yOlJ9ZwbycNRBjhu2ceFVSMir76J0IZYBGgnzwc1tAQfGnc
         f5SuJzTfGtk0xCq+MAldDxkI1IEKm+G6ZlNV7mFYSpRRX7XbkCvJDMTD/0dtrmMsIE+K
         SrkVXka2caI88pn06kRFHXMxo3edy4W30mgICElY6Vv6+LfsRbeKPnGe1+Ly3e3SwT0E
         sl3r+vF8QY6bcJnXTnqlnoYiUe6D51RlJqiavfmIUV//C4lHPWoRG26dfJFHJKZ2tgrI
         oOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746731143; x=1747335943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qu0kVYDa1LJAygHrKHPQPVcQppgU3bFJcwVxclK610=;
        b=jjXSMOV8UoRvXvXpAYMX5twsPk3OcGTFn/IHfobpKhG2YL/oMaqwvKC0DdZAIiU802
         xBtV96iEMmHh4q/W4He7jKNGuD4JGtbTIrhwJWBFsBIz6+fLk5HOGDb8ylnB4NxzJiDJ
         gSc71s8VQNDcH2dBBaf0EZrceVAI/M98CGeu+da+5y0TBpfQ0bkfDNfreH6zN8uJmcVb
         FF/JJ4dL5P0hViu1Qkk29fHZ+gFj5qSqaGHjcP/Wc6CXxMykUapD9ZkNEKFiTGwkIcv3
         00YNrcRLNZIc3vVAkJ80JWbc2ceG5EFktys90r8rnX+jBxf0XPy1qceIXyALjMny3s5p
         eeyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn3aCmIilfUrKKO/9WgPlhU7ZaHv+RjQUnfqpURby/KCmEQtY6NeGUhY891DumqFM9eS4Pr+j7allDlWKC5j7H@lists.infradead.org, AJvYcCXTpNJMkyCzSbEpDWBaS8SnXhIKiMD3KoHmH6UtQEH1xoSgCkj9LcjGK1wTWh28Tj2njhFErKQfyLvYegPnHno=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvGRPdiA04F+g4WwEwBh2ANsnC5bJi3Pa4EBlIDKtmdmbiauno
	Aeog51sP4aE5QWt4p/42iiYUYqjohdPK30PbT1qSIruSNReEr4lU9+pF5/k4xkQ=
X-Gm-Gg: ASbGncsYROx3SfrRozv9tHHe3pbtVxOtdrSlUrNINgO7tYp4suEm1C400hkDjvaU9PM
	bWPYER76CAMYkDLjP23kyza303LVwDFgaqYXAEwzg/uLfBD1MoW3+M5qXt1kn7kGVIzKFlHKFmn
	D9j6UD3P8lcUdSXhqWUQBfeTw8mBHS8X/NCmc8EqQTS7WTXLhhY8DzRY3m4gzlcdzTsvzcgcnVI
	DUAeOcO+H9csewYHkKV+tDtAq06Iv6gJbbJ9z8Ti3Faua/gAaKVpZhu4QSwzV9X4I2gI8exhFN5
	hVHFjX6g8Sngsb1yX/6H/v7pQqhaFDAxf8dFAybUSsRpHf0QfajX
X-Google-Smtp-Source: AGHT+IF3GvschKMoOsEYJDjP5Bh7wGJRXzNc7vFAvC5p6sW/i58t089hOCR/ZeKjvfIlvNXPZLbXAA==
X-Received: by 2002:a05:6214:2405:b0:6f4:c824:9d4a with SMTP id 6a1803df08f44-6f6e47c339cmr5390056d6.13.1746731142883;
        Thu, 08 May 2025 12:05:42 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a0bee8sm3148216d6.54.2025.05.08.12.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:05:42 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	John Clark <inindev@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 0/3] Add Luckfox Omni3576 Carrier Board support for RK3576
Date: Thu,  8 May 2025 15:05:35 -0400
Message-Id: <20250508190538.22295-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_120544_849014_ACF94150 
X-CRM114-Status: GOOD (  17.84  )
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

This series adds device tree support for the Luckfox Omni3576 Carrier
Board with the Core3576 Module, powered by the Rockchip RK3576 SoC
(four Cortex-A72 cores, four Cortex-A53 cores, Mali-G52 MC3 GPU). It
enables essential functionality for booting Linux and basic connectivity,
with plans for future support of peripherals like WiFi, MIPI-DSI, HDMI,
and Ethernet.

Tested features (on Linux 6.15-rc4):
 - UART: Serial console operational
 - SD card: Mounts and reads/writes successfully
 - PCIe: NVMe SSD detected, mounted, and fully functional
 - USB 2.0: Host ports operational
 - RTC: Timekeeping and wake-up tested
 - LED: Heartbeat trigger functional
 - eMMC: Enabled in device tree, not populated on tested hardware

The series includes three patches:
 1. dt-bindings: vendor-prefixes: Add Luckfox vendor prefix
 2. dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
 3. arm64: dts: rockchip: Add Luckfox Omni3576 board support

The device tree is covered by the existing ROCKCHIP ARCHITECTURE entry in
MAINTAINERS. I am aware of ongoing RK3576 upstreaming efforts (e.g., by
Collabora) and welcome feedback or collaboration to align with mainline
driver development.

Changes in v4:
 - Patch 1: Unchanged, Acked-by: Conor Dooley <conor.dooley@microchip.com>.
 - Patch 2: Fixed binding for Omni3576 Carrier Board to use correct enum
   syntax (enum: [luckfox,omni3576] instead of invalid const), added
   luckfox,core3576 to compatible string to reflect module dependency.
 - Patch 3: Updated compatible string in rk3576-luckfox-omni3576.dts to
   match revised binding ("luckfox,omni3576", "luckfox,core3576",
   "rockchip,rk3576").

Changes in v3:
 - Split device tree into rk3576-luckfox-core3576.dtsi (module) and
   rk3576-luckfox-omni3576.dts (carrier board) for better modularity.
   Previous Acked-by from Krzysztof Kozlowski for Patch 2 no longer applies
   due to substantial changes.
 - Addressed Jonas Karlman's feedback on patch 3/3 (Luckfox Omni3576
   device tree):
   - Added pinctrl for green LED GPIO (gpio1 RK_PD5) for proper pin setup.
   - Reordered regulator node properties for consistent sequence (e.g.,
     regulator-name, regulator-min-microvolt, regulator-max-microvolt,
     etc.).
   - Updated regulator nodes (vcc_3v3_pcie, vbus_5v0_typec, vcc_5v0_host,
     vcc_5v0_hdmi) to use 'gpios' property instead of deprecated 'gpio'.
   - Removed pmic-power-off pinctrl state and pinctrl-1 from RK806 PMIC
     node, as they are vendor-specific and undocumented in bindings.
   - Removed pwrkey node from PMIC, as it lacks binding documentation.
   - Added blank line between properties and child nodes in i2c2 node for
     DT style compliance.
   - Removed no-mmc property from sdmmc node to enable MMC support,
     aligning with RK3576 SD v3.0 and MMC v4.51 capabilities, allowing TF
     card slot to support MMC devices or eMMC via adapter.
 - Removed Ethernet support (gmac0/gmac1 nodes) per Andrew Lunn's
   feedback, as it used the generic PHY driver with incorrect RGMII delay
   settings, incompatible with the upcoming MAE0621A driver.
   Collaborating with Andrew Lunn on a device driver, with Ethernet
   support to be submitted separately when complete.
 - Addressed Rob Herring's DTB check warnings, other warnings (e.g., VOP,
   PCIe, OTP, HDMI PHY) originate from rk3576.dtsi and are outside this
   patchset scope.
 - Added RNG node to pick up Nicolas Frattaroli's "add RK3576 RNG node"
   patch.

Changes in v2:
 - Enabled HDMI node per feedback from Heiko Stuebner and Nicolas
   Frattaroli; untested due to upstream driver issues.
 - Enabled Ethernet 1 node per Heiko's device tree philosophy; untested
   due to suspected PHY driver or configuration issues (removed in v3 per
   Andrew Lunn).
 - Clarified eMMC remains enabled but unpopulated on tested board, per
   Heiko.

Signed-off-by: John Clark <inindev@gmail.com>
---
John Clark (3):
  dt-bindings: vendor-prefixes: Add luckfox prefix
  dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
  arm64: dts: rockchip: Add Luckfox Omni3576 Board support

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-luckfox-core3576.dtsi | 683 ++++++++++++++++++
 .../dts/rockchip/rk3576-luckfox-omni3576.dts  |  53 ++
 5 files changed, 746 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts

-- 
2.39.5



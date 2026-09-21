Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2479EC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PzuZBv/6+rRjuYTdPZhwsFKr+NJXaORBiijnRAhlDc0=; b=4xD7kzfpu+3+o/CXApHWKIkRUv
	lydkYJ077S2YeiI4CdlVHQJwI7FO3qPNeJ+2ztyHJo2DFxs7tKtSn1U8G49HBagOpgM66+jGT9Fii
	UNqQ6NFD0Qe3BtJBO/Dtlk91w1XhgT1LYHc7VFpbTwsY4fewxc5ayOsjaSOPA+MtKCgL+qCK/nEeg
	FCXMoWGt8TBBJA9bI4JCJg8lqDeQQK1Qfznv9TqxUtSKCdOFTHelR3SInlvZ71a/pLolqOGbossu/
	NU0ZT3NDzYwwfYHlWXfkCTA9NIpz0OH9/rljfa9SXBa4oSx+FyKigm9zp5kIK1JihBgWHcgqp5Z5v
	K2o3MC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iix-0000000373s-1w98;
	Mon, 21 Sep 2026 18:26:43 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iiu-0000000370K-0edO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:26:42 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so45766645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790015194; x=1790619994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PzuZBv/6+rRjuYTdPZhwsFKr+NJXaORBiijnRAhlDc0=;
        b=BBh3pUTRnB98sqX9vyp7vsJbku4yjc3/lYR7RDkvrJhu+D72vYkXUTu829S1u6yoQ7
         kuLjUpr4y1tWarxKAB6+67ZvmR6kL6Bi4MOGEhR3z3SR4esRKk41Nt4kHc49kQqGovhH
         qNBiCJF52uAKUxY+1doCko4BOCwkqWEUWDdP0tbcx9AOoVQxAnJrUN4YHAk+VhhmSQgM
         OidWNJf+d/uFt65R72joZo3Gz0TgYJ72zGnwBv+EL6D2n0/dILVaqwPmYWuOsfNWJszh
         JoUDFU3QWw9C/ZfGv65MQie/0j7PRqXT27/hF6Y+zWcJ3QpAOxZu/0TYQv4Wj1YI0pRB
         2k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015194; x=1790619994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzuZBv/6+rRjuYTdPZhwsFKr+NJXaORBiijnRAhlDc0=;
        b=UgF26NTUiPghC2VY0QGtQHzTKQoPHT2GgAHH4DIgHFDATD5gGe5lTxt4vF8wDF8CV/
         TN3GT9l9JwNPaCMoaL9Hd1VqwYeoaXZ9lJTDnwcOvauUIAaSLmdMr8EHNjOKA8ML4HHI
         9NgS/HuVOMGEqXEncDZYq601u0h/PA1iKKLZC5W7nOiNaT6jnV63pfGwUtaTKkv3Q1qn
         t8qOCiPm3c7rVVPKYmf/QV3x7fi85IYBpJmKPpMYfCkO7D0cAl+j24vbnr28pVlmXAL/
         LNFAzzDGN8TpGH6sappAO3TVCx1RbzbS3NhrmgVr7gxWdJFULhigtR9wObiSY/YNACxj
         03iw==
X-Gm-Message-State: AFuF++nlcj9ITc4vroizTtkHqacQkkhxQIv/OHG2IkvDHqZLvcCO13sK
	571NWuZWBJOtP1YkC7jXFUnj1qh8D0hkWqQc5PdpylZacwWeaM0si3UC+QxV0ukRymhWNHdju3a
	/xOYPN7g=
X-Gm-Gg: AYBFou1RElzmKS6lufpUCl976JkSE3wS9HGO4hpSGUIhZ59dJ+QknItzLhajIW9VIZH
	RSkv1XF2WwPPgPmz3jibVnueRzgTlxjORjWfUuOR2zS5R6XWbOLfZDkFyMpip+VZVZMuyAVQKc5
	13pqO+HXIprmuLXPvufz1Azxiaag2HlI1uTHtzo46a7L8Pw8M3s3BuZcbCSULE19C+cjVELMI7B
	3B1JagQRIXCwAcy+JlpzZBha7O7NYKdk5ZopGxp4DiTAexSjijUwqVbhfGqASetuBw0LAcMKZ+s
	4iy2Wq8Uqy2JIlgV/qbbF8+WHxHHOuM2qg53rKoKDab01k/hWoGbgcBrOcKWV4pz0oMfcnBZucu
	qeGEfjFppeWKTnA9E/PT+4OO0gaBbbOBdMuzIYcXBCXM7jpJVZshnOuglGTplQGWgMVv3DVb0lt
	W46JjpVG5utICadB0ezs4DinogI73l3DhgTkEdi6wzuCJ2dlHbcJXqqFe77ApsmGo1GLX7m+eRR
	I2Z/FCRPRyx6/OOlzm2oe+2/g3ggHzbLAkg
X-Received: by 2002:a05:600c:34c8:b0:49e:732e:6b79 with SMTP id 5b1f17b1804b1-49fc574eff6mr164403745e9.32.1790015194408;
        Mon, 21 Sep 2026 11:26:34 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm25126184f8f.12.2026.09.21.11.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:26:32 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v3 0/6] arm: sunplus: add Tibbo LTPP3G2 board support
Date: Mon, 21 Sep 2026 20:26:14 +0200
Message-ID: <20260921182620.17597-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_112640_450174_04C5960E 
X-CRM114-Status: GOOD (  14.82  )
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

The Tibbo LTPP3G2 is a board based on the Sunplus SP7021 SoC:
https://tibbo.com/store/tps/ltpp3g2.html
It is the platform that underpins Tibbo's industrial IoT products.

This series adds board support to linux-next:

 - Patch 1: vendor prefix for Tibbo Technology.
 - Patch 2: document tibbo,ltpp3g2 compatible string in the SP7021
             board binding.
 - Patch 3: add device tree nodes for SP7021 peripherals that have 
             drivers (PWM, watchdog, eMMC), plus a label on the
             gpio-leds node so board DTS files can override it.
 - Patch 4: enable SMP via PSCI 0.2 (HVC) on the SP7021.
 - Patch 5: add the board DTS for the LTPP3G2, covering eMMC, a bit-banged
             I2C bus, PWM, watchdog, and two GPIO LEDs.
 - Patch 6: update sp7021_defconfig to enable the drivers used by the
             LTPP3G2 and correct a few defaults.

Tested on LTPP3G2 hardware on linux-next-20260916.

Changes in v3:
 - fix problems noted by Krzysztof Kozlowski
   - put the Tibbo vendor prefix in correct alphabetical order
   - remove bootargs from chosen
   - name DTS nodes correctly
 - fix problems reported by sashiko-bot
   - add tibbo,ltpp3g2 compatible string to sunplus,sp7021.yaml
   - rename i2c_tps to i2c
   - rename system-led to led-0
   - rename sg-led to led-1
   - add the missing pinmux node: pins_uart3
   - fix pins_i2ctps: use SPPCTL_PCTL_L_OU1|ODR, not L_OUT|ONV|ODR
   - fix pins_btuart: remove SPPCTL_PCTL_L_ONV from BT UART RTS
 - don't disable CONFIG_SMP, instead enable CONFIG_ARM_PSCI
   and add psci to sunplus-sp7021-achip.dtsi
 - increase i2c-gpio,delay-us from 1 to 5

Changes in v2:
 - fix issues spotted by sashiko-bot.

Andrew Gaylard (6):
  dt-bindings: vendor-prefixes: Add Tibbo
  dt-bindings: arm: sunplus: add Tibbo LTPP3G2 board compatible string
  arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
  arm: sunplus: enable SMP via PSCI on SP7021
  arm: dts: sunplus: add Tibbo LTPP3G2 board
  configs: sp7021: fix defaults and enable existing device drivers

 .../bindings/arm/sunplus,sp7021.yaml          |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/sunplus/Makefile            |   5 +-
 .../dts/sunplus/sunplus-sp7021-achip.dtsi     |   9 +
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 183 ++++++++++++++++++
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi |  39 +++-
 arch/arm/configs/sp7021_defconfig             |  32 +++
 8 files changed, 273 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts

-- 
2.53.0



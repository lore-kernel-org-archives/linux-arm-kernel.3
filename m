Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06F3C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tsOKTY4Tt/OuNN7a0jDQ/bxjeb3eAr0Hjqy/Np0O6lU=; b=wB6hk0JUge+n/J
	sG3Sis9upvAv4tQYufgTTvQVlA/KetE+Bj4sfssB7QQgKBTTQ2N8ej1clcyDTLJi/OYcFYBfPB64n
	jlRg13ekDJdrFTIl0PhjCJnDoc9FQ6WJNSWHeuL5xyXW415gC0cyH9WyJ2Za4vyZZAxyRsgLXIZs2
	uwlVlin9vx7d6+m7jAtd4XTvJiq/YzapRN3CIDLc48QvHw2CZn3fIn89fagIII/GiDjN2GwSx/hAi
	aE734rslCfHEOpcn2bT9ph+D4bh8SZUi7uLPNagzO4dEW57nipWnohtwLqaQtXNYpk7Rbn3553cRh
	T8JGU8DjTYAzWjlTl95w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIW-0000000Amon-1vvH;
	Tue, 12 Aug 2025 12:40:12 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull7P-0000000ALjO-43DI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:16:33 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-61576e33ce9so8911145a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754990190; x=1755594990; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tsOKTY4Tt/OuNN7a0jDQ/bxjeb3eAr0Hjqy/Np0O6lU=;
        b=IO6f9lkwKLW/jN5uigkd8ujrD6OSh9EgXuJM+0dYWOGriWPRJh1z66l3BqpBlHx8Ea
         saFgv8KT/KRBxR4KqfVOJUW9143WG/5oTxreRqft0FkZoxB4KTvPqt6YasyPv9UW3RTY
         MEzG2D6oruJli+LvU51j/5e9Kcp13dbT6nWyRmyEwBFeH+Bxzhb6m8zKLKY5iPUG11GR
         tsUcjdFX+dVyyOhis/Cf+wH96MJxL6vrhGR1xtXy9dglYday45FEqbgwAboNEll1iM+Q
         xF8vH5EHuDrFCOYLPWiY4zq+tV9Iv398SYPBLq50rI7Cpyccz52FfAIuEf+zM8kV+z9+
         O+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990190; x=1755594990;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsOKTY4Tt/OuNN7a0jDQ/bxjeb3eAr0Hjqy/Np0O6lU=;
        b=DFzvqERSnXkeBGHUs+STDsz0ucHTCtu+cSYMphnoUBqS9srX1EWlFfaBOFknLaL71c
         ZbdMat1JWVJjpSHGinTtVTZ4ZEzMmi6EoAXZQDNdPhZ4XAJh6zo3UUm3FtDt7kbpPgBz
         MSoZriypqjOpNY90MZIzfNl9zeqdTn9/XWJg4DGAARt9MzIjKPewzZMm+uGncpHz3qWL
         4j8mtAloX2mFMhnqHYvuRyrmGJSVXmYym88GoL8yIkZupDf+cSiT34u+1J7jQeKCH9aQ
         pzv/D0vDIlbpP9P8kaDFrJmvz9NdE8wGFyxOzcPJEwEz75mOrCFbDqjzLKIPhp0J3TnO
         a4sA==
X-Gm-Message-State: AOJu0YxZnK0UTfx/qsZf1EeBsr1zccrpiqURlfntFZYv4OSjvuMhU09x
	MUPsv2ALfEvtU/VB91aGY3QtR/qOYqq+RY5TDGkeidKvYpeX0va1GTwEzIwUTtfYqJA=
X-Gm-Gg: ASbGncv1+OI5Bal5X3lepqnEyL3sNvfC7fs1gKZ/yStzVoswry6V0AEa5Y1janRekpx
	5VxfgB/BDQMKMIAqXOzgGDyN7DFCqgc5ycbo5qqA3q79VxuvSlTQIRYqDWbn5finSYJTSP2nfqK
	ilT5/lHk/4uSDVS+HOhAREcsdUSfkILDiumMWj+ujqo9OMhUEJgypzXEAoU83VFXbMcHSS7eS7x
	JKBKOHlLRPE7FSnsyPtmnLyiCmKek3FCRZ8LnHaAOOJ9QQgvlR38mMka6c+yKbgZtby0Cjuq/5f
	N62pHmTGPGE8UAFKM29oj4wXYe2PJrOtDbHXalHxpl8EdiVIUlkJ8AMybY8WFoimQNJ8yw3WdA3
	1DQ7C8p+FWcs3U8iw1g==
X-Google-Smtp-Source: AGHT+IGr5HW0hp8z7aq2ufVrm7zJ5K6NIslkaSCm+mwJ1eY5Pb/nrN8ypCjKuTQOWDx6e/M2v60y4A==
X-Received: by 2002:aa7:d284:0:b0:617:c586:9bca with SMTP id 4fb4d7f45d1cf-6184d8476eamr1856574a12.4.1754990190005;
        Tue, 12 Aug 2025 02:16:30 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8691:4b7a:7bbd:bac:c56e])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-615a86758fcsm19687032a12.0.2025.08.12.02.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:16:29 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 0/7] arm64: dts: ti: k3-am62: Add wakeup-sources for low
 power modes
Date: Tue, 12 Aug 2025 11:15:19 +0200
Message-Id: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACgGm2gC/4WPS27DMAxEr2JoXQaSnPi36j2KLGiJbojGliPJS
 oLAd69qd9Fdl0MC8+a9RCDPFERXvISnxIHdlIN+K4S54PRJwDZnoaU+yaM6QXQzG8Cx0mAjzOg
 j45UdpAryt9S1tWoYVG1R5I7Z08CPrf/jvGdPtyVj4n4UPQYC48aRY1ek6qBq8EaJv/w8R+qjk
 rL9pY8GJ7jjFy0zBLd4QxteQ2OUrdq2VL1tutSIH+SFQ3T+uRkmtTF3Ga3+kUkKJFSGbCkRB2v
 79x6fV+49HfJgcV7X9Rsst5k5QAEAAA==
X-Change-ID: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4920; i=msp@baylibre.com;
 h=from:subject:message-id; bh=nvdM9bES2M2TONEu/V1R6Pbby+jxQRKWgcemit1o6OI=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozZbBZCSdsjdqyNfB1vsveozvnXX3crOO9edPbY7zrTJ
 dMW2ypWdpSyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBEwvcw/I9bFavAfCH9usBO
 5vATVp7uQjm5HY4+S+s+P5Kw3lWnMo2RYcbsz3k3b7EWbFfLsVffFlJU9dXHOPLN9izdvP85hi1
 H+AA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_021632_039496_7CB6D44D 
X-CRM114-Status: GOOD (  14.93  )
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

Hi,

This series adds devicetree changes needed for Partial-IO support
on TI am62, am62a, and am62p SoCs. It defines system states for various
low power modes and configures the wakeup-sources for devices in the CANUART
group. Depending on the SoC and board details, some low power modes may not
be available, so the wakeup-sources are described in the board files.
The series also adds the necessary pinctrl settings required for proper
wakeup functionality.

Partial-IO Overview
------------------
Partial-IO is a low power system state in which nearly everything is
turned off except the pins of the CANUART group (mcu_mcan0, mcu_mcan1,
wkup_uart0 and mcu_uart0). These devices can trigger a wakeup of the system
on pin activity. Note that this does not resume the system as the DDR is
off as well. So this state can be considered a power-off state with wakeup
capabilities.

A documentation can also be found in section 6.2.4 in the TRM:
  https://www.ti.com/lit/pdf/spruiv7

Implementation Details
----------------------
The complete Partial-IO feature requires three coordinated series, each handling
a different aspect of the implementation:

1. m_can driver series: Implements device-specific wakeup functionality
    for m_can devices, allowing them to be set as wakeup sources.
    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/mcan-wakeup-source/v6.17?ref_type=heads
    https://lore.kernel.org/r/20250812-topic-mcan-wakeup-source-v6-12-v8-0-6972a810d63b@baylibre.com

2. This series (devicetree): Defines system states and wakeup sources in the
    devicetree for am62, am62a and am62p.

3. TI-SCI firmware series: Implements the firmware interface to enter Partial-IO
    mode when appropriate wakeup sources are enabled.
    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/tisci-partialio/v6.17?ref_type=heads

Devicetree Bindings
-------------------
This series depends on the dt-schema pull request that adds bindings for
system-idle-states and updates the binding for wakeup-source:
  https://github.com/devicetree-org/dt-schema/pull/150

This is merged now in upstream dt-schema. These new bindings allow us to
define the system states and reference them from device wakeup-source
properties.

Testing
-------
A test branch is available here that includes all patches required to
test Partial-IO:

https://gitlab.baylibre.com/msp8/linux/-/tree/integration/am62-partialio/v6.17?ref_type=heads

After enabling Wake-on-LAN the system can be powered off and will enter
the Partial-IO state in which it can be woken up by activity on the
specific pins:
    ethtool -s can0 wol p
    ethtool -s can1 wol p
    poweroff

I tested these patches on am62-lp-sk.

Best,
Markus

Previous versions
-----------------
 - Link to v1: https://lore.kernel.org/r/20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com
 - As part of the series "firmware: ti_sci: Partial-IO support"
   https://lore.kernel.org/r/20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com

Changes in v2:
 - Combine k3-am62a7-sk.dts devicetree nodes with existing ones
 - Combine k3-am62p5-sk.dts devicetree nodes with existing ones
 - Update the idle-state-name properties to the new names from the
   dt-schema
 - Rebase to 6.17-rc1

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
Markus Schneider-Pargmann (7):
      arm64: dts: ti: k3-pinctrl: Add WKUP_EN flag
      arm64: dts: ti: k3-am62: Define possible system states
      arm64: dts: ti: k3-am62a: Define possible system states
      arm64: dts: ti: k3-am62p: Define possible system states
      arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62a7-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62p5-sk: Set wakeup-source system-states

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62.dtsi      | 22 ++++++++++
 arch/arm64/boot/dts/ti/k3-am62a.dtsi     | 27 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  | 71 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi     | 27 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts  | 71 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-pinctrl.h      |  2 +
 7 files changed, 280 insertions(+)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da
prerequisite-change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931bd8:v8
prerequisite-patch-id: 02b7142f56c849c9a3faab2d2871805febd647aa
prerequisite-patch-id: 830b339ea452edd750b04f719da91e721be630cb
prerequisite-patch-id: 2c9142d2bc47e64c49b7b8a7ca20a62a0be14870
prerequisite-patch-id: f7652a616dca17fd5e4a7e5cba59de6a6a36079f

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>



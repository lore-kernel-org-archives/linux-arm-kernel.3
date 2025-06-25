Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0679C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8g9Hnc6LU8Fq8A/D982tn/Y9CTQjt1J9xZrVskwwrnQ=; b=pBJbnsGl+NOsODZ/9Rq8YtuE41
	wt1h/3DP/BD8zwbxCzfCT7Sdeup8rNu5bdgueqehNI+4JKIhs0WJmyxoXlw5UTWSeeR0ZNVQWj2kp
	N8VYrVRPiEg+PRmBqrvzf5+0hdnJ46CdZ/ldwAsySkd8qY9n5TyiNPL5Kzy+wKKnmeY011Mzd10qd
	knCQG+c88HIHKI1Mx/qpQD+gDwJzqmQWyONQ45rH+Pz/O8+vZ6HvYqPIEjwyrZcni+LfVmZQELit9
	Wy6XS+AOoz9T4C83JZiL6ob588QRADFEcqp6rmTJyCdBYB1UdIOfLG+hxcUchAsEph6UQzANx/f7T
	HBX9nRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVWg-00000009i6z-42t9;
	Wed, 25 Jun 2025 19:11:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQ02-00000008lkW-2HDG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 13:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8g9Hnc6LU8Fq8A/D982tn/Y9CTQjt1J9xZrVskwwrnQ=; b=ZZJlKaGVhoMSUTZELSEGfEECIk
	oyOk3CJlu8T2l9OABBDXA92KUVKvB+wjiW6CNdGnHQRzzzeCCvik1OYz8Xa0OJmpvdWcAYsSkAxGw
	rFoEIf24pSr2JLB6nn6kIDUgglS8azRxkvgYctOnMLdmROVmEhHk+WOtAFJ5RbGTcBPy8Hcp6kBZh
	7UFrKQLT4WmPoJnt0EH9lwLInePie8tgpjJDkA19maYfqxGesHG+PNXw5qIc2Ghj1h9bGmePQ0JW4
	HcTMHFSZlu/lS3ZjLbzjpLL7CsqCT4Qo2kcuChkVTsfBMOMN8e9oN/zZH8Q2grgqHh5fXImza57p8
	FOT4JBfg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPzx-00000005rio-3Zqy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 13:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C01D5C59B8;
	Wed, 25 Jun 2025 13:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF4DC4CEF3;
	Wed, 25 Jun 2025 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857425;
	bh=XAgpjW/O3CM0ZnOLk2RcDGdLgfzXfUkXBKJ3HCpD1Qk=;
	h=From:To:Cc:Subject:Date:From;
	b=fohGDIt2S5dW8eGGmDkgtYKdXBnWVxx7EZCq9ZBJqvIvFqHEpmJsFQemA+NiTOmuk
	 Z8D4iDoTqT+8q/rEwcLMGOTRDwwCN/jPdOIQ/rpRc8CUlXCX4D25l+YmMYVjOPNhGu
	 XxsAqHH+GSDsSwbm5HuD7OwP9Q03l9IbFQnFDKQkgtBrcpnkCnEc5ku+3piBFcfa8d
	 vGL3ebutZ3I1skb7vrhjs0oGPQYemnRSy3UgFa89E9i+pzpNzJ0O3CuM5bg7lmBoMp
	 3tAogbbKgZD8b564kogcAbcVNKNSdkmQ4el/+BjxKF+cCTrpJLLED4uQVQCj2EmYfx
	 ZvGas7sQMl9hw==
Received: by wens.tw (Postfix, from userid 1000)
	id 4953A5FC6F; Wed, 25 Jun 2025 21:17:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 0/5] arm64: allwinner: t527: Add OrangePi 4A board
Date: Wed, 25 Jun 2025 21:16:47 +0800
Message-Id: <20250625131652.1667345-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_141710_069142_A80ED949 
X-CRM114-Status: GOOD (  15.64  )
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

From: Chen-Yu Tsai <wens@csie.org>

Hi everyone,

This is v2 of my OrangePi 4A series. Changes since v1:
- Fixed regulator names for bldo3 and bldo4
- Dropped labels for aldo1, bldo3, and bldo4, which are not really used
- Added voltage constraints to aldo2, based on specifications from
  schematic
- Appended "-usb-0v9" to cpusldo's regulator name
- Added comments to explain how axp323 aldo1 and dldo1 are tied together

This series adds support for the OrangePi 4A board. This is a Raspberry
Pi model B form factor development board based on the Allwinner T527
SoC.

The board has the following features:
- Allwinner T527 SoC
- AXP717B + AXP323 PMICs
- Up to 4GB LPDDR4 DRAM
- micro SD slot
- optional eMMC module
- M.2 slot for PCIe 2.0 x1
- 16 MB SPI-NOR flash
- 4x USB 2.0 type-A ports (one can be used in gadget mode)
- 1x Gigabit ethernet w/ Motorcomm PHY (through yet to be supported GMAC200)
- 3.5mm audio jack via internal audio codec
- HDMI 2.0 output
- eDP, MIPI CSI (2-lane and 4-lane) and MIPI DSI (4-lane) connectors
- USB type-C port purely for power
- AP6256 (Broadcom BCM4345) WiFi 5.0 + BT 5.0
- unsoldered headers for ADC and an additional USB 2.0 host port
- 40-pin GPIO header

Patch 1 adds a new entry to the list of board compatibles.

Patch 2 and 3 are minor cleanups.

Patch 4 adds pins for UART1, which is used for BT on the board.

Patch 5 adds a dts file for the new board.


Please take a look. I will take all the patches through the sunxi tree.


Thanks
ChenYu


Chen-Yu Tsai (5):
  dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A board
  arm64: dts: allwinner: a523: Move mmc nodes to correct position
  arm64: dts: allwinner: a523: Move rgmii0 pins to correct location
  arm64: dts: allwinner: a523: Add UART1 pins
  arm64: dts: allwinner: t527: Add OrangePi 4A board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 160 ++++----
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 383 ++++++++++++++++++
 4 files changed, 476 insertions(+), 73 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts

-- 
2.39.5



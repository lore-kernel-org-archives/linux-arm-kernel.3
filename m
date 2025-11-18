Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D849CEE332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ut3SuGRXcnqydzose6Th4hSHH5Fvmww3wK2Gga704mk=; b=zfk6NbEC1ncgDM5u70U2cbnZ1v
	bgIOrk/RY0fVxcyf0JlMA1PfrsP3n3x8vTTac+SNrBVf9LOkvk1iGU2DcwxQtyAL+i0QIKWeQsSWN
	lp7ibT6Z3ESWdVbiOTH9t31gGpxqPXbJI6s4vwQhxMFMLzJfGDvVPfpaIVOdYlxKsVgJ2hv7nLWe1
	Ka/9pH541baEzN/zfk6qnCb9LYBC8CQnqnvFi4GmjvjmeZpG2HiC623MIh2M7F5XLUwbN1meGmD3g
	didL532arcqIGUEKGjEe6RCHWaCGO0/blCCRyrcwUvP0c+qfsC7xLNtLfyCyC84NrJdQGC51MgDFg
	+eGYyeEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLO4e-00000000f0B-1W4n;
	Tue, 18 Nov 2025 15:56:56 +0000
Received: from skyblue.cherry.relay.mailchannels.net ([23.83.223.167])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLO4Y-00000000eyh-3jXg;
	Tue, 18 Nov 2025 15:56:52 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 307F74441EA;
	Tue, 18 Nov 2025 15:56:47 +0000 (UTC)
Received: from de-fra-smtpout8.hostinger.io (trex-green-2.trex.outbound.svc.cluster.local [100.127.171.17])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 819B34441CB;
	Tue, 18 Nov 2025 15:56:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1763481406;
	b=yvDa/VvYmUSJvM7mnMULG0o+YDF5C82BGzEsr8+18Not+hMGPwKRv0xa2Vq//JjK4QPN1m
	aGtgMGKxuD7p2jnHhuRExeq7oWqdy9hTakl0W59Kd4x06+sAxPza6m1ersBqJ4IsQrrRlC
	JnRcfrbGqBcr7YlitH5XI/Z0rycKUBlUHC3Emj5c1IdXEKVGkvK5VLmhdxY2lwAWVoaQEY
	mDhiJ/Dz7WZ8xYNBDcb7R6IZqRr6vcpzeuVdID3xPYjrm2dna78qrN7xezWDfFtxppgQd4
	l55IAK3wB08tcXBSO57r+NFqcU7BzHDn8MyXTsmZFFKuzFQtSpgR6dL06AZWIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1763481406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=Ut3SuGRXcnqydzose6Th4hSHH5Fvmww3wK2Gga704mk=;
	b=AUTll/DiTnjUmT6zmZVf4qz7HEOJrmtUC9N4PDMn1YpB6BvMs4SQhDknZKyTesbvFdQ38b
	o12w8QosaJBXf+qvdW9sZojzlhfcyanxgSYkitGm+nrUmErmWyHwJHWDA9GXLEf982uRzE
	bCHF3Fa/BNqYoTQXD4JcekuETQJR2jxoavYpYt1P25TnxaEF5jgF8oiWx8qxRcnkjqcJBQ
	P4iqFDZ0kv0BzBLId62BaSfYlA9AfHT5Q8QcI1WfP1QnFTNWAUG06rAiaFLhF1/auzClJN
	jgCP/HGwOVIWMt9bIgXHH1UJdrlQjMhXqfSOSnZcU3n/HRrg+7h5dwDmEcn84A==
ARC-Authentication-Results: i=1;
	rspamd-55b59744f-jl6rk;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Tart-Lonely: 249516853e3aebaf_1763481406887_877732730
X-MC-Loop-Signature: 1763481406887:1968770014
X-MC-Ingress-Time: 1763481406887
Received: from de-fra-smtpout8.hostinger.io (de-fra-smtpout8.hostinger.io
 [148.222.55.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.127.171.17 (trex/7.1.3);
	Tue, 18 Nov 2025 15:56:46 +0000
Received: from [127.0.1.1] (unknown [IPv6:2001:861:4450:d360:70a8:5f6b:5afe:c6b5])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d9q3t2v5hz42S4;
	Tue, 18 Nov 2025 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1763481402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ut3SuGRXcnqydzose6Th4hSHH5Fvmww3wK2Gga704mk=;
	b=hLh7yH8CCt6qeUC5v9JL1d8OXDoHVsDXjT4QBxzJoLDlcuYaJu9yuGVj9bpEnoMilHbwia
	JiKoD8vgrp0QMz8niT7N2jlMvyCPM4teDsnWekPuwBIHpNP1Eb1ZC0X293hAwNDlH5hSDf
	S8kYnU0zmotThbdJxu4CBUwV9JWL+2t/xg0xwttmvmaUx+8Co+Pi0M1ZgG4hf6BCjPwJ7X
	opKrYqOnLMpSg7KQ7N3F2B1hjBtnE4ftndaXgHKgA/ez9B3LFHg+xou3vMOEVFUILpRXRT
	zLcWTwSqwZEChE0M6XygHnVUp4nY5Bt7nGUH3CNwOiOEk7QRJLTrJ+uZORM5oQ==
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v3 0/2] arm64: dts: rockchip: add Tinker Board 3 and 3S
 device tree
Message-Id: <20251118-tinker3-v3-0-2903693f2ebb@rootcommit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2XHGkC/02NSwrDMAxErxK0rkMU57/qPUoXJlEa0doOsimFk
 LtXdNXV8GDmzQGJhCnBVBwg9ObEMSjYSwHz5sKDDC/KUFd1i4i9yRyeJNYMA9l6Wd2IdgBt70I
 rf36m2115lehN3oTc/77BtumwL7txbCuDxrO+0KuM+0LBzWq+Sox5jt5zLjXgPL/VMIespAAAA
 A==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
X-Mailer: b4 0.13.0
Date: Tue, 18 Nov 2025 15:56:41 +0000 (UTC)
X-CM-Envelope: MS4xfAf4PlmoqFM0KzB8lu67raFzxwPBycLgxOHv1meH4Qi1w/F31grhV6fvi0l9amO1mHVUQxA8YpD96ZDmOSSo5iWRhcDRjn65/HatOgYLXi5Q+9gbOfJp nndS31PO+fIP3izpPpd3NXtx1QA6sYweQmuBpKX1MSXf+MdhDqZ1h9N35LEYZ8rIN+TwIxIt+rZmpoTrLSx7oCt2Vx2O9IqGxUkxsKAh2hKDW8yLFEUv0Nhg t35MPrV+wpq7WSo1TKfD0EX4p7swxp7RSYh18xHOF4lh5Wi/BNor8I7844ieC8aLqWur3Q9gs/prkVy+Ak9qVy+zs1GiXJQdnG/HxFIiBd66jbOMJpDiqnGe ExdhONVY43KQEaSdm3UTzRiHJygrYW8sDU49kvubjERXKrRelypgztFbVbgQ0JxRCAW0r1b7cHwsaSClVOP2YeGQpToTcbaHViSXD7qM19X2/Uy83KXSdslc LcKh4ybeSza+iB5VVuyII2kJNktyeuJRrrTzruJveUiSzoZeumXPN/UsC8DSQnd6biwe+D7xoO/8fwjM46pUzIJL76jedFMwNQUXYDfKB0/r5gltJcvwumUE 8g2Nq+mS9smxpoVWwpjmivCptpQvDaU6z+GxplCIZc/lWw==
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=691c973a a=Ph0lQeLb5o4XXq6kAtNexw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=-Yt9tNsTAAAA:8 a=KKAkSRfTAAAA:8 a=d70CFdQeAAAA:8 a=Bb-50Za3bNL7VLoPKgYA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=qPQde0g9OtMA:10 a=HTceBwxjnJgA:10 a=cvBusfyB2V15izCimMoJ:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_075651_336176_C1D723AA 
X-CRM114-Status: GOOD (  14.31  )
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

Add initial device tree support for Asus Tinker Board 3 [1] and 3S [2],
which are SBCs based on the Rockchip 3566 SoC.

The "3S" version ("S" for "storage") is just a regular Tinker Board 3
fitted with a 16 GB eMMC and a "mask ROM" DIP switch
(to mask the eMMC and enter "Mask ROM" mode for recovery).

This adds support for:
- Debug UART (/dev/ttyS2)
- SD card (/dev/mmcblk1)
- eMMC (/dev/mmcblk0, only on Tinker Board 3S)
- I2C:
  - i2c0 (internal bus with a PMIC and regulators)
  - i2c2 (internal bus with an at24 eeprom and an RTC device)
- USB 2.0 ports
- 2 GPIO LEDS

This code was tested on Tinker Board 3S using the "master"
branch of the Linux kernel.

[1] https://tinker-board.asus.com/series/tinker-board-3.html
[2] https://tinker-board.asus.com/series/tinker-board-3s.html

Changes in V3:
- rockchip.yaml: group Tinker Board 3/3S in the same section
- Remove this Acked-by as the code changed substantially:
  Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
- Remove "asus,rk3566-tinker-board-3" from rk3566-tinker-board-3s.dts,
  which conflicted with the change in rockchip.yaml and
  could create an issue if some code unexpectedly turns out
  to be compatible with 3 but not 3S.
  If you don't agree, than we can keep V2.

Changes in V2:
- Rename "Tinker board" to "Tinker Board"
  in commit messages and DT code
- Insert "-board" in DT file names
- Insert "-board" in new compatible string too
- Commit messages: change the way the references are introduced
  ("[1] https://..." instead of "Link: https://... [1]")
- Reorder alias properties and node names
- Add missing "cpu-supply" property to cpu nodes
- Use standard "eeprom@addr" node name for at24 eeprom
- DT commit message: add missing "Asus" before "Tinker"

Michael Opdenacker (2):
  dt-bindings: arm: rockchip: Add Asus Tinker Board 3 and 3S
  arm64: dts: rockchip: Add Asus Tinker Board 3 and 3S device tree

.../devicetree/bindings/arm/rockchip.yaml     |  11 +
 arch/arm64/boot/dts/rockchip/Makefile         |   2 +
 .../dts/rockchip/rk3566-tinker-board-3.dts    |  14 +
 .../dts/rockchip/rk3566-tinker-board-3.dtsi   | 280 ++++++++++++++++++
 .../dts/rockchip/rk3566-tinker-board-3s.dts   |  30 ++
 5 files changed, 337 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3s.dts

---
Michael Opdenacker (2):
      dt-bindings: arm: rockchip: Add Asus Tinker Board 3/3S
      arm64: dts: rockchip: Add Asus Tinker Board 3 and 3S device tree

 .../devicetree/bindings/arm/rockchip.yaml          |   7 +
 arch/arm64/boot/dts/rockchip/Makefile              |   2 +
 .../boot/dts/rockchip/rk3566-tinker-board-3.dts    |  14 ++
 .../boot/dts/rockchip/rk3566-tinker-board-3.dtsi   | 280 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3566-tinker-board-3s.dts   |  30 +++
 5 files changed, 333 insertions(+)
---
base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
change-id: 20251117-tinker3-88e32dfa9138

Best regards,
-- 
Michael Opdenacker <michael.opdenacker@rootcommit.com>



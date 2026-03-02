Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E3BE9B372
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aKF/6DgiDPqPoZ/uIJETMDFd/SR8tjF97ZA2t2o4bhQ=; b=pQ6CANg0vKa9itgeSP5qT1JUL+
	U+hImldqoLlLDvW1WTgGMPwtWyyuSe0jCmeXm06vTb3DaUD3JqrMhYsNBT8yVIRiG/Ak36/hYirAs
	uagFpNqoveHLKmHRAkpWfxkbp5HhwwfN5SYE8X1qc+Nn4AwAzG1VVZZBZyCbY55pTebn5qna++R/t
	tMVYk7FMryecwNaUqqBRZVsSZ3yyxgN5CBpRW5agBISfUqwQa0C51SWVo8hwJExJRXiLZe6HnKth3
	EilJ/fFhNx2b93vWZel1iQsDCn95e9BWHya1DvP5/0fL25m+niV8W/77LBwCY5xvpetwGpSQ+nb9g
	9zZog2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2M2-0000000Cwz4-1WwI;
	Mon, 02 Mar 2026 12:26:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LW-0000000Cw1w-3ysM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:26:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D07AE44584;
	Mon,  2 Mar 2026 12:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8546C2BCB1;
	Mon,  2 Mar 2026 12:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454357;
	bh=EJr2Mq3lKojirQvqkCZGmLtZh7IobNepi+pjmnv8tD8=;
	h=From:To:Cc:Subject:Date:From;
	b=GhSANKRDBvuspzgx+8jGlOgR4kTQBYjLlQmESWiyEqr7otJV9+z55JUwcB4kAJJul
	 gUcXYad8pHjh4kd34QkTpNQAkpHHngA1LiQKnklMtIS1yyw9q0/ZWft3HJjnX1yT6k
	 wqjlL4r88EJIxlTd5ycfpppZ9ju5mc5QVPehi6S7rRKt+v2S5dGhy5m0Qf9uCEWh/Y
	 dHYxQJnHmGOhnxv1mHwbxg93YfeyB5x/a9fJkvUUwG451sWeW0QQXIiyiU21xDg6Wl
	 q38sanNbqro8/GcxD3XkO0eguZInS/5Tarujo8Sg+4KiKqV6G7SlP6POieY77d4BUL
	 UO1iFt0SvGKxw==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 0/7] Remove the Kontron SMARC-sAM67 board
Date: Mon,  2 Mar 2026 13:24:45 +0100
Message-ID: <20260302122540.1377444-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042559_067150_4C0929A8 
X-CRM114-Status: GOOD (  12.78  )
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

I was informed two weeks ago that this product is discontinued
(without being ever released to the market). Unfortunately, this
collided with the merge window and I had to wait two more weeks.

Pull the plug and let's not waste any more maintainers time.

On the bright side, the board upstreaming brought some driver fixes,
too. I'm really sorry for any wasted time.

v2:
 - drop hwmon patch, that was already picked up by Guenter Roeck
 - reword commit message and don't use the default "git revert"
   template as suggested by Krzysztof Kozlowski.

Michael Walle (7):
  arm64: dts: ti: remove the Kontron SMARC-sAM67
  arm64: defconfig: remove SENSORS_SA67MCU
  dt-bindings: mfd: sl28cpld: Drop sa67mcu compatible
  dt-bindings: arm: ti: Drop Kontron SMARC-sAM67 module
  dt-bindings: nvmem: sl28cpld: Drop sa67mcu compatible
  dt-bindings: watchdog: Drop SMARC-sAM67 support
  dt-bindings: hwmon: sl28cpld: Drop sa67mcu compatible

 .../devicetree/bindings/arm/ti/k3.yaml        |    1 -
 .../embedded-controller/kontron,sl28cpld.yaml |    7 +-
 .../hwmon/kontron,sl28cpld-hwmon.yaml         |    1 -
 .../nvmem/layouts/kontron,sl28-vpd.yaml       |    7 +-
 .../watchdog/kontron,sl28cpld-wdt.yaml        |    7 +-
 arch/arm64/boot/dts/ti/Makefile               |   13 -
 .../dts/ti/k3-am67a-kontron-sa67-ads2.dtso    |  146 ---
 .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1091 -----------------
 .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   26 -
 .../dts/ti/k3-am67a-kontron-sa67-gpios.dtso   |   61 -
 .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   31 -
 arch/arm64/configs/defconfig                  |    1 -
 12 files changed, 3 insertions(+), 1389 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso

-- 
2.47.3



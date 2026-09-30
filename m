Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DF6CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L8/OODqwok8+iyAtj/XZzViXaiQxHsPKEsXS6DG3Xq8=; b=UTTteGmKKcqX0g
	JSnAa6v27Q2q9V7B4mBLxTJTrTAqs0OitvaPrRKIDTsvPZktX3yyXg4TDOc5Ah6/XuYEwz8OXzfZI
	QtZI3fJ0i4V1Rq3JVFvRRhhH3cguktCU7xej8X0Tkh6dA9uMcx/AXFj3dD9n/oSbGcyJTuRePYus4
	iSAoe/K6fda6DqOQEjKwt2W7YUXQGTQMaD5qDTnETIvwGOyzF/pLgeColM8faE2yTckNdsftWi+aq
	xgq9Azm8mSs3AFf0FUMpm43m33DM5vIge9Auf0UE3Oo0dcourl7/al0U6t9DJCo1hCJJ20qzNeP+h
	K9nwIvyyX4ysMaWJuCUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy3h-00000006on8-2WYy;
	Wed, 30 Sep 2026 17:25:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy3d-00000006omn-0aBc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=L8/OODqwok8+iyAtj/XZzViXaiQxHsPKEsXS6DG3Xq8=; b=qsyIYylfYlsbSUeAjjIKDDW207
	AkNpqz/8uGvBtsBz4RemK8r9o2INZJMfMoRV/W0LY8nqDNR3GvdysbH1bJRwUpsh3z9iZ0Tb1NzrL
	XXC4fqFjj1oNbUQRumltjwMeyfV1OrPQYrqNX/xc8UxPAxwmBVdgZsD8RjdS+yPkrVh90Ig9HsJsR
	Gka0WDKas9vcDQyM5xTl0zszDwGkpdYFgUF5/f5vyqAzJ7ch1vELFmbMb7Z6DJa3h+yWEhUTZQYD6
	Wl6qYBwvIy19QAP9FuSV7nZxsD+LfEs0TC6HdxRkj0xFjxu+1PwZUVEA3Q38bFbPx/vOlfDVzhT4I
	m81qRkjA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBy3Z-000000048TW-322g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:25:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7A6674E410D4;
	Wed, 30 Sep 2026 17:25:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B71C60749;
	Wed, 30 Sep 2026 17:25:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B43F110328A02;
	Wed, 30 Sep 2026 19:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790789116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=L8/OODqwok8+iyAtj/XZzViXaiQxHsPKEsXS6DG3Xq8=;
	b=GSGgLhE2bvk/588d85GTM9KlFlwOVg9/UtzISuHcLNPVHxT30hdlFGR+secNCLrkgczG5M
	IWORn8JTp879B1BNEaOPMOLbj6A4V5+bdfPMNgo8u73sUCdyKRP6pKXnYEL9+r/vNd4Ix9
	kuvPxm7zqurl/NTx1xWPKklHVlvVMbKUTfSrfgPxYDVopgqBNTICmOi043Wy1ix/nGa0I+
	qJ/Dqmr9fSNEZZBOY3E6KaeqSPouSG9AVQnqAc6Asg+AHVLuv+nANqZ78ySHpHpr0qRK2e
	QOagn8NAmp3mS38JV5stOcnUgullb9r0n5t61WpoZMXHMpC9Z9/8YIWKZPJMNg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 00/12] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
Date: Wed, 30 Sep 2026 19:24:46 +0200
Message-Id: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43QTWrDMBAF4KsErTNFP5YsddV7lC5keZSIxJaRX
 NESfPfK6aIpBpPlG5hvHnMjGVPATF4PN5KwhBziWIM6Hog72/GEEPqaCadcUc0ETJhyhMEK2TP
 4nPKc0A7grhdQ0lnnHbNadaTuTwl9+Lrb7x81n0OeY/q+nypynf6qhpsdtUigoLQUAo2QiM1bF
 +N8DeOLiwNZ3cL+rP2GhQEDbDVKVKzlaLcWf+zF9ixee3FqfC+41R2lW0s8WnLPEtXyvrPYIuX
 U6q3VPG01qyWUaWX9mWH+v7Usyw8cTqic9AEAAA==
X-Change-ID: 20260813-perso-ma35d1-upstream-clk-65cacfc1a86b
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jacky Huang <ychuang570808@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_182526_126080_236E0AC7 
X-CRM114-Status: GOOD (  20.54  )
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

I am in possession of an MA35D1 NuMaker board. The SPI controller has
been contributed, but at this stage it does not work with the current
clock driver.

The clock controller registers its muxes with .fw_name parent data,
which requires every internal clock name to be declared in the DT. As
the DT does not declare them, all parent lookups fail: muxes end up
registered as root clocks and most peripherals read a zero rate.

This conversion exposed a first issue with the WDT/WWDT parents which
were actually missing in the clock driver. I am not using these clocks
myself but it is worth fixing.

The second round of reviews raised another problem with the
crystals. HXT and LXT are external crystal oscillators wired on the
board, while HIRC and LIRC are on-chip RC oscillators. HXT was described
whereas LXT was not. The series now also takes the two crystal inputs
from the DT: they get documented in the bindings, described in the
boards and looked up by the driver (with a fallback for backward
compatibility).

Finally, I was still unsatisfied by the clock tree because there were
too many root clocks. Many "gates" were wrongly set aside from the
downstream clocks they would gate, and SYSPLL was simply not parented at
all (?).

The clock tree now looks much more accurate.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v6:
- Drop the clock output names entirely, they are not relevant.
- Error out when the crystal providers defer probing.
- Make sure gates are correctly parented.
- Make sure SYSPLL is parented.
- Link to v5: https://lore.kernel.org/r/20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com

Changes in v5:
- Fix the bindings wrt HXT and LXT.
- Fix the DT descriptions of HXT and LXT.
- Collect tags.
- Link to v4: https://lore.kernel.org/r/20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com

Changes in v4:
- I forgot to bump the clock counter in the driver after adding the two
  new clocks in the bindings. Sashiko will keep complaining about the
  incoherency though. Since binding and driver changes should be kept
  separated, I cannot do both at the same time.
- Link to v3: https://lore.kernel.org/r/20260925-perso-ma35d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com

Changes in v3:
- Drop the number of clocks from the binding, set it in the driver only
- Split the binding/driver patches completely
- Link to v2: https://lore.kernel.org/r/20260921-perso-ma35d1-upstream-clk-v2-0-209fd32a8b00@bootlin.com

Changes in v2:
- New patch 1/3: register the missing WDT/WWDT parent clocks
- New patch 3/3: harden the code
- Link to v1: https://lore.kernel.org/r/20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com

---
Miquel Raynal (12):
      clk: nuvoton: ma35d1: Keep the clock count in the driver
      dt-bindings: clock: ma35d1: Document the missing crystal inputs
      dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define
      dt-bindings: clock: ma35d1: Add missing WDT/WWDT parent clocks
      clk: nuvoton: ma35d1: Add missing WDT/WWDT parent clocks
      clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
      clk: nuvoton: ma35d1: Avoid possible error pointer dereferencing
      clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
      clk: nuvoton: ma35d1: Reparent the gates correctly
      clk: nuvoton: ma35d1: Reparent SYSPLL correctly
      arm64: dts: nuvoton: ma35d1: Drop HXT clock output name
      arm64: dts: nuvoton: ma35d1: Add LXT crystal and clock-names

 .../bindings/clock/nuvoton,ma35d1-clk.yaml         |  16 +-
 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts    |   7 +-
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts    |   7 +-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi            |   3 +-
 drivers/clk/nuvoton/clk-ma35d1-divider.c           |   3 +
 drivers/clk/nuvoton/clk-ma35d1-pll.c               |   3 +
 drivers/clk/nuvoton/clk-ma35d1.c                   | 723 +++++++--------------
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h     |   3 +-
 8 files changed, 287 insertions(+), 478 deletions(-)
---
base-commit: c5137d373338693fc18f03824782c7d383bfd57a
change-id: 20260813-perso-ma35d1-upstream-clk-65cacfc1a86b

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>



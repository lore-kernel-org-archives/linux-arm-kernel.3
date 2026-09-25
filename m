Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D388AC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vn9Tr1xJolmW78wFJwJBHDNHE9ScFHG6XbXCr7p2L1I=; b=KzOh+Ti50yl2ww
	KccrEbVjKWvfhGs1afQUnEEBBrc34nm/O2A0W24mXaIV/cV9LIqN3Q0NVKSwVp0vQSPU4tFD60eQ5
	Womy5FIJZJww3xCU1Tf7YhrRkKLcYYpVgMZ61GzVCyvNGaBqgv8lNvm5s2McUXYVw8dyRz4LHhJiL
	beWB+ciUzc4J0emU6RRYH5yDjzA1NmA+bXEokYnuQvExI9Vn31NaHzds4vE1Num3Ej8K0YznwB8ig
	ja9Lzc880ve+2KAUMBSnRLd9BfWSBbpmb4TIVVYe0fDuby5vD/wVk/fBHJku0CkFIJl7h8AMwvuTd
	0z3vVzJFw0Bk+jOtglHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7ZK-0000000DiK4-1wmI;
	Fri, 25 Sep 2026 15:10:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7ZG-0000000DiJd-2Z6Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 15:10:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4BFD81A1022;
	Fri, 25 Sep 2026 15:10:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 047CE6073B;
	Fri, 25 Sep 2026 15:10:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7065102F1E06;
	Fri, 25 Sep 2026 17:10:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790349026; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Vn9Tr1xJolmW78wFJwJBHDNHE9ScFHG6XbXCr7p2L1I=;
	b=xH+riAv6BzpC1AWsFzrgHy/CY5OTEaPn3DPpChJIqwQ1yv3bIfCPqdr+MrvczE1E2vorMn
	d1/q/lnFepS5gHO1toFZNpVjgFncp1zNfzVlKA0ZUdkvdfE2qORwZ1ujvyP2ySZGn9LTsD
	OF6wDBiU/Yy1Pn7wY7rMUfX10vANI6CFQrluiSGyiXl4F4+Ei+sCVJA6FUu8wuL8s3M3Fy
	Oc4Shz3Y6u3aG6WEAYq8hDB+Lro6TAssVP2Cmfc7K3qeSlx1QGMp70HqNdoYK8kOMcmEw4
	QpCDw7qazWvbxXdLPmcZv5nwLuwdeC/9wPY37NRn/flTS7DPua8hqO0uUVuRLw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 0/6] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
Date: Fri, 25 Sep 2026 17:10:10 +0200
Message-Id: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQrCMBCF4atI1o4kE9tGV95DXEzTiQZtU5JaF
 OndjW5UBHH5P5hvbiJx9JzEenYTkUeffOhyLOczYQ/U7Rl8k1ugxFIapaHnmAK0pItGwblPQ2R
 qwZ6OUBaWrLOKTFmLfN9Hdv7ytLe73AefhhCvz1ejeqz/qKMCBVwZLrhUFTJt6hCGk+8WNrTi4
 Y74slaoflkIElCuXKORTC3lt6XfreKXpbPlXE1csURJ5tOapukO4SemBFwBAAA=
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
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Jacky Huang <ychuang570808@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081030_803632_D6892D8D 
X-CRM114-Status: GOOD (  14.26  )
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

This conversion exposed an issue with the WDT/WWDT parents which were
actually missing in the clock driver. I am not using these clocks myself
but it is worth fixing.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
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
Miquel Raynal (6):
      clk: nuvoton: ma35d1: Keep the clock count in the driver
      dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define
      dt-bindings: clock: ma35d1: Add missing WDT/WWDT parent clocks
      clk: nuvoton: ma35d1: Add missing WDT/WWDT parent clocks
      clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
      clk: nuvoton: ma35d1: Avoid possible error pointer dereferencing

 drivers/clk/nuvoton/clk-ma35d1-divider.c       |   3 +
 drivers/clk/nuvoton/clk-ma35d1-pll.c           |   3 +
 drivers/clk/nuvoton/clk-ma35d1.c               | 642 ++++++++-----------------
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h |   3 +-
 4 files changed, 199 insertions(+), 452 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260813-perso-ma35d1-upstream-clk-65cacfc1a86b

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>



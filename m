Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9EAC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CqhBrtc24xeYe5rtT3XAuCH/QzXbGSjDLxpVbh3Y7Ow=; b=kgwGEzNKavfy7M
	lQ/TNh2WS/acL0Z9y2EZMaoZkRR5QqSv6V5B6JW2wDotN5vTZVfIe6cn/8zPWBTQFVOdUiH8zGFWm
	/M8aSuLTIuZKhRevYsQzGcfh1sX6UHw4H30ILvucIb8mWnahqsu2Ie67gVZ13wXJGTuNFjElRzWlr
	uh+K2EjIYJDLW93ZQoqVqYH28KBFiYkMmYL1jIGpuZU6m6ZFlXOcvWXt/DigmQ1krGRJcnrYH72XD
	y+25x+FlXcDvBrJuhgnb4Zy77Y7uS5BmWn9sxVSrpJCMAlSaIuc21SoKkqLDBgrIo8pnkqVrYEWpb
	vWQ1lJNzoaqqhQDnwB8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7Ab-0000000DdIH-48ch;
	Fri, 25 Sep 2026 14:45:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7AY-0000000DdGc-1lW4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 14:45:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A2D3A1A0FF7;
	Fri, 25 Sep 2026 14:44:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C19E6073B;
	Fri, 25 Sep 2026 14:44:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A12C102F08C8;
	Fri, 25 Sep 2026 16:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790347492; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=CqhBrtc24xeYe5rtT3XAuCH/QzXbGSjDLxpVbh3Y7Ow=;
	b=AYBtgiBq9Yk+NgcPBNMvFv3rq0t5CpY+KQYMtAFcoGdj0Qsz7PwHJvcgSeyu8eP/NnZDjC
	wjKFDBqzICOnMn7XQJbqFCdhKnwI1wu2B2qgr7mtCGsENv/jux9LOG86I/0yWmjCjHaJ9X
	JjOnhAoQWQjfvxXaeAK6G1QA8RomnIDraWdJLNaJ00mFVFXMcHF1vJVKVJRd47i1uku5t/
	9y7HSvZLl29MWqqw9yEEJheJg/Ppsedefq3Q+LWSeEEQAZ77NKVSRiKPWw9yNZyY13K5dV
	nci1AhNmJEPFoFflfSsvxWDWkUs+lkmFuPNFi9LD56AlVUMK09P455d4EkKU/A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 0/6] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
Date: Fri, 25 Sep 2026 16:44:19 +0200
Message-Id: <20260925-perso-ma35d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQ6CMBCF4auQrh3TaUMBV97DuChlkEagpMVGQ
 7i7hY1xY1z+L5lvFhbIWwrslC3MU7TBujGFPGTMdHq8EdgmNRNcKF6ihIl8cDBomTcIjynMnvQ
 Apr+Dyo02rUFdqpql+8lTa5+7fbmm7myYnX/tryJu6z9qRECgoqScFBaC9Ll2bu7teDRuYJsbx
 ceqBP6yBHAQvGobKXRZc/5trev6BpLERBEQAQAA
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
X-CRM114-CacheID: sfid-20260925_074458_607464_2A47B175 
X-CRM114-Status: GOOD (  12.03  )
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



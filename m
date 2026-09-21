Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3832AC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ky/EdIk6lo6ktUN94uOMEwEvf7fiSyNZIxxU9JsyMM=; b=GcNl1CAKhN84Dq
	7BSXk21LUN1qIpy10ucUYM0A9NKSuXFzoEv4ZGw7rzTz7LZLbLWdY3tHpILG7ToShRmc0PPsIXifn
	BUcTRNa92xzOQbGJEmjuScAznr6M7nBRy/PaCkrsgWhuHdu06xDQFZALj6sYrXNPDVlNiSW75k2sF
	6Z6MvqU20CS1eGekEGYwKOYNvaJji2AUdyb/BYNTNQ1v4qC701e+ypW8i4RhgmXwjycvgPIkGZHH3
	tFIIpLSMqzuyDkqkW0y4uR1mcIs0Nmwew4JYLtTiTdNE1UH2LmgZ/XZXlWCdqGUWHW5s+vh09xLKo
	cnLmi8/nVqVGoTZhbhMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xlx-000000016NH-3Gjl;
	Mon, 21 Sep 2026 06:45:05 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xlp-000000016Fp-0Epv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:45:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6FEFE4E40C54;
	Mon, 21 Sep 2026 06:44:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3933F60339;
	Mon, 21 Sep 2026 06:44:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 854A210328203;
	Mon, 21 Sep 2026 08:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973093; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=1ky/EdIk6lo6ktUN94uOMEwEvf7fiSyNZIxxU9JsyMM=;
	b=hhfkwpz9jViN/7ttym6UlD3h9ZCof9xotK88U/e98owTE64bvSfYiro3ocM3GF/frUPADe
	W3MTY7xPYZNQ+jHCpk9aQ8U7KmpeSZjZSrEynxWu8SUl5+eaNoGKSEO7HvjGJYkv16DOzz
	pSyqMjRfVIV6TrEU3KpdTH1VLTkLRWSx8aP4iHRP8yeBhfqQgYim7LcgR8XSHFWgU3dA4+
	5zX4nyqrC5MNTE8YLA5f01czv/JgsZoNzVyRtZ5vhv7OgsM8n6cmKE+h5efNgpy1srE3NK
	9Oubm51Y5Rw5UzsMfXk6/4CAeBAGGWeAhZ7xQHuRDZPurRCSsVP8TosOBKEebA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/3] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
Date: Mon, 21 Sep 2026 08:44:44 +0200
Message-Id: <20260921-perso-ma35d1-upstream-clk-v2-0-209fd32a8b00@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7RimhEJceQ/CopRBJgJtWiQaw
 t2tnMDle8l/f4fIQTjCLdsh8CZR3JJAXTKwo1kejNInBpUrnddUoOcQHc6mKHvCl49rYDOjnZ6
 oS2vsYMnUuoO094EHeZ/tpk08Slxd+JxXG/3sP9WNkJCrmkvWVCk29865dZLlat0M7XEcX8KHn
 SjEAAAA
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
X-CRM114-CacheID: sfid-20260920_234457_269860_4668A14B 
X-CRM114-Status: GOOD (  10.76  )
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
Changes in v2:
- New patch 1/3: register the missing WDT/WWDT parent clocks
- New patch 3/3: harden the code
- Link to v1: https://lore.kernel.org/r/20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com

---
Miquel Raynal (3):
      clk: nuvoton: ma35d1: Add missing WDT/WWDT parent clocks
      clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
      clk: nuvoton: ma35d1: Avoid possible error pointer dereferencing

 drivers/clk/nuvoton/clk-ma35d1-divider.c       |   3 +
 drivers/clk/nuvoton/clk-ma35d1-pll.c           |   3 +
 drivers/clk/nuvoton/clk-ma35d1.c               | 637 ++++++++-----------------
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h |   4 +-
 4 files changed, 197 insertions(+), 450 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260813-perso-ma35d1-upstream-clk-65cacfc1a86b

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>



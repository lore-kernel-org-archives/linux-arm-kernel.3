Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA96DD41D41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 00:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FxZwK/+in1zWGVe+BhCIW9P39OCNmwZUeCTRsHuxe20=; b=nCDMA4sT7kS/+r
	YODtlyDvJN0SsBr6MXbW/g11fubZh8OuxH/d+RHwBVb4Z16tz/uCAZZC4+2YnGP7+UZfpDVPWYPaJ
	wfiZlRsm+UDnxmEsvSSKay45keI2ke9cygMmaApTWZoSL+XoJprDXC7du+YMonFHhk71PJGFhCg++
	EQxpLYXJcyfFo+i3nWPLbJNyHtYyF9wHU2P8Ki/YItZ4TNV9gZlBx6Y2LV4kjDs+wsmaYqEN9mhh5
	CrpYYBwdRGf/4P8je1/ydR5AG/AS9HcBv+XfpvBQgOTT+4hJrpIcRd/9/eG6c+/GNa/S4O98XbYu/
	HI0n419iAu1xohuExuvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeVA-00000001hti-23ml;
	Tue, 12 Nov 2024 00:11:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeTN-00000001hZU-3631
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 00:09:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46D035C5D32;
	Tue, 12 Nov 2024 00:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC76C4CECF;
	Tue, 12 Nov 2024 00:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731370172;
	bh=0BN/FwFINfIweSPyRYGiqivvH0muTynHLak6B4C/5vY=;
	h=From:Subject:Date:To:Cc:From;
	b=gA2rjWSIv32F0Rwy9fJ2opnTSWrlewyiuq/0/8JnZNHe/EJxkbjjSrNj5QDNB0gMU
	 fQlshSh+/CxIeiTy2yHaOuTUu2O022BMuNk8wU0S3aZxGDDXHAkJ92D732fej6aEHu
	 BnvreV26OsQCb9QYb+caYOoeDjuZoMqBeP1gxZXxPagAdc8xsa0V9Cut+ibjL8ZTKL
	 IlIvhMYikGTNeT/+nGoOs4TMGMqYrbe4qfPj8Qu4n2wCWbvu2AdzrhS0tnyakfPTl6
	 DS3x2x4iAnzDVKVP9ZxOejmkM8OYVgmxpTBsSl3ExQomsTXy9df7guIOOxefZ2iqQZ
	 wniY3TBljhNCQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH RESEND v2 0/7] clk: en7523: Update register mapping for
 EN7581
Date: Tue, 12 Nov 2024 01:08:47 +0100
Message-Id: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, 
 ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_160933_856656_2460EAB3 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

Map all clock-controller memory region in a single block for EN7581 SoC.
Introduce chip_scu regmap pointer since EN7581 SoC will access chip-scu
memory area through a syscon node.
REG_PCIE*_MEM and REG_PCIE*_MEM_MASK registers (PBUS_CSR) are not
part of the scu block on the EN7581 SoC and they are used to select the
PCIE ports on the PBUS, so configure them via in the PCIE host driver.
This series does not introduce any backward incompatibility since the
dts for EN7581 SoC is not upstream yet.

---
Changes in v2:
- fix smatch warnings in en7581_register_clocks()
- fix dt-bindings for EN7581 clock
- move REG_PCIE*_MEM and REG_PCIE*_MEM_MASK register configuration in
  the PCIE host driver
- Link to v1: https://lore.kernel.org/r/20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org

---
Lorenzo Bianconi (7):
      dt-bindings: clock: airoha: Update reg mapping for EN7581 SoC.
      clk: en7523: remove REG_PCIE*_{MEM,MEM_MASK} configuration
      clk: en7523: move clock_register in hw_init callback
      clk: en7523: introduce chip_scu regmap
      clk: en7523: fix estimation of fixed rate for EN7581
      clk: en7523: move en7581_reset_register() in en7581_clk_hw_init()
      clk: en7523: map io region in a single block

 .../bindings/clock/airoha,en7523-scu.yaml          |  23 +-
 drivers/clk/clk-en7523.c                           | 309 ++++++++++++++-------
 2 files changed, 217 insertions(+), 115 deletions(-)
---
base-commit: f0e992956eb617c8f16119944bfe101dea074147
change-id: 20240823-clk-en7581-syscon-100c6ea60c50
prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



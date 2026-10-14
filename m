Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC18BCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G/2llohs/KPObuHyET4p2v7xDP/sdVjpNeBSaMAKCss=; b=akjotQdYk9pt0s
	NnLDuj6qdjb8xqKlD2Hcb9EXnBbEnhDeOeS8j9+YuYI16/qU9GzWp3Ujbej3WaBnJydF6Y3BLkfof
	yao2ep2n42ztKFz23k0fXkeXSLQPwMLAMEP0hs4tpfWLPAKySPiRCj4j6M1bf5JtMaoQkjYgHN8lW
	NGfEetKQBHObOMeV26daTsio6SYolOFXbywLAT5HC2IEhEB0Ob4DKmsN7VOBeuuIdiZP1RpRNJFCB
	mQB+TvbQ/brY5rOXuVWVLmD+kselW6H3+mZL7cDW0VdxZ0D3aTmJPv9q2nwm9itY8WEy5gb86j2Yu
	C4UTPL18pmg6HvmPh70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvbO-0000000F7BN-3qoL;
	Wed, 14 Oct 2026 09:48:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvbN-0000000F7Ay-1DNS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:48:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED2F34031F;
	Wed, 14 Oct 2026 09:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07A71F000FF;
	Wed, 14 Oct 2026 09:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971328;
	bh=G/2llohs/KPObuHyET4p2v7xDP/sdVjpNeBSaMAKCss=;
	h=From:Subject:Date:To:Cc;
	b=cnUJwydPx59VjWSX4qP1fwUunlew0NdECFVPiPLXa476fOJAbMYWNB+3R022HRGyn
	 vE1Bi0+RW1DT0ObZ0xVMMc99VB706b6zKYEiCGoOgwroXczzigYEYOs44BLW6BrvEk
	 ArV0AvfxAb7cmDdqAkfb5KZlruwv9O7/nMu5lo5GGvrSTruFR02dNA3eBD8WZfaT88
	 ftJas8e7Qmd8HgzCguGjiURD17WV8b3ZrT80YWOG8zxJOqjeszJ7q9Q6TcozocER+e
	 lWG4mc9fY/OnipeVBlip083SJY4OGzMWT7Y01+s/DeJHHlOCWJ6eZjcZjM1XxI3/iW
	 Xpg6HP63e1AtQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH RFC 0/5] BCMBCA PMB reset controller
Date: Wed, 14 Oct 2026 11:48:42 +0200
Message-Id: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Nj3Yp0MwsTsyTdpOTcpORE3YqilALdotTi1BLdlFRzwyQLg2Qj00Q
 TJaD+gqLUtMwKsNnRSkFuzkqxtbUArltojnAAAAA=
X-Change-ID: 20261013-xg6846b-bcmbca-xrdp-reset-de71b80c25a4
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

This is another of these big upfront design binding and driver
hoards that is the consequence of adding new SoC support. My stake
is to be able to boot and test a full featured Cortex-A5 system and
the BCM6846 XG6846B is one such system on my desk.

It's been cooking for a while in various prototype forms.

IMPLEMENTATION:

Add a shared Processor Monitor Bus (PMB) driver and a child reset
provider for Broadcom BCMBCA blocks. Support BCM6846 XRDP and its Runner
cores, PCIe0/1 and PVTMON. The PMB bus driver uses the third generation
Platform Management Controller (PMC3) keyhole interface. It owns the
register bank and serializes complete sequences for child services.

The fixed SoC transport is built-in and has no sysfs bind/unbind
controls, allowing delayed recovery to retain hardware ownership
until a busy transaction completes. The reset child can be modular.

The series contains three bindings, the PMB bus driver, and the PMB reset
driver. Describe PMC 3.1 as a simple-mfd with two system-controller
children and a bus child, each owning its register window.

The bus child exposes the PMB transport and contains the reset provider.
The parent uses Broadcom's "brcm,bca-pmc-3-1" compatible. The PMB and
reset drivers support only the BCM6846-specific compatibles for now.
Other BCMBCA SoCs have different reset groups or PMB interfaces.

Use one reset specifier cell and define BCM6846_RESET_XRDP as ID 0 for
XRDP and its three Runner cores. The vendor sources describe individual
PMB device addresses and reset masks, but no ID for this combined group.
SoC tables map IDs to blocks, register values, timing and sequence
callbacks. PCIe pulses preserve lane-selection straps. PVTMON uses its
analog-acquisition reset. Consumers must quiesce every affected user;
these resets do not replace clock, power-domain, PHY or UBUS setup.
Power-cycle operations for USB2, WAN, PERIPH, MEMC, BIU and BIU PLL are
left to power-domain and platform power-management support.

This series is based on v7.3-rc1 and is a prerequisite for the
forthcoming Genexis XG6846B Ethernet support series, which works.

The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
ports and copper WAN and has been tested on that series.

MISSING:

I did not add MAINTAINERS entries because I don't know how the Broadcom
maintainers feel about it. Tell me.

MERGE STRATEGY:

I'm not sure. Possibly through SoC with ACKs. Through an MFD immutable
branch if Lee wants to handle it.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (5):
      dt-bindings: mfd: Describe the BCM6846 PMC complex
      dt-bindings: soc: Describe the BCM6846 Processor Monitor Bus
      dt-bindings: reset: Describe the BCMBCA PMB reset controller
      bus: Add a shared BCMBCA PMC3 PMB transport
      reset: Add BCMBCA block resets through the PMB

 .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  |  98 +++++++
 .../bindings/reset/brcm,bcm6846-pmb-reset.yaml     |  46 ++++
 .../bindings/soc/bcm/brcm,bcm6846-pmb.yaml         |  51 ++++
 drivers/bus/Kconfig                                |  13 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/bcmbca_pmc3_pmb.c                      | 232 +++++++++++++++++
 drivers/reset/Kconfig                              |  15 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-bcmbca-pmb.c                   | 281 +++++++++++++++++++++
 include/dt-bindings/reset/brcm,bcm6846-pmb.h       |  15 ++
 include/linux/soc/bcm/bcmbca-pmb.h                 |  25 ++
 11 files changed, 778 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261013-xg6846b-bcmbca-xrdp-reset-de71b80c25a4

Best regards,
--  
Linus Walleij <linusw@kernel.org>



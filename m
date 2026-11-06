Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43E2606D804
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lS7tc6El;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYVhOYyi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UGfKZvZvqFhX5Ky0rm/23LKeKcQDPDoWftzic2rR5Uc=; b=lS7tc6ElZQdpIgo2LbAORoZxf/
	gpucevgtMPJsEDc4gFRi4C9qoEerabtTXGjNvlGIqj/8WBPj9Icg80U5yxfudiZMqIG1Mwo0yFj5j
	2oYUdaPJWsTi+WkiTqwh98CpftUf1wgqG9XPcCwPs94G+rnk3aQgoDf7FCWUrvDIus7yq3R6MOcVj
	zCIcJIYufA5CdPdX4sA3csYu7R/CnRMsxyIRbJ/fGbOBpNoMzzlChqc8wv9YRzPGdmmpVE/ZPTwjC
	N6n+rww39LQXpmdYqIlC+J3rwJnLFNIRnPPXjfUMxjHPFPx7Eml2wTPm706wfiUpXPn8/5yN2ZTym
	lwfXq46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFHj-0000000BXwE-2Cql;
	Fri, 06 Nov 2026 08:26:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFHi-0000000BXw6-1tA8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:26:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DEC1D43717;
	Fri,  6 Nov 2026 08:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B271F0089F;
	Fri,  6 Nov 2026 08:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793953613;
	bh=UGfKZvZvqFhX5Ky0rm/23LKeKcQDPDoWftzic2rR5Uc=;
	h=From:Subject:Date:To:Cc;
	b=AYVhOYyiPRMnaaYm2MD60GoD47kepcROp+UtvwZH5vX+qcSTwVZUmYgFySr7/+p63
	 ckcvhLe3SkbJuwGcu6ugcOAG+zUBS0V7bhTbuaD81+tNDd2ypJ5A9rkWdEVQRxZ8us
	 XCytBC7NOrWU0SKNr1j++T6i+shLBmAYLLxclqJ4EV0lEMC88G2tXi2kacxcfWxy58
	 TtKamR6oCI/Y71IaNIlmdx26wVajIrNBzVAhC8XSP9kBpA4AiaiWZAXdo5/dAd8WpH
	 akrvEO/NEoGdwKHjUCOjH2zdjdUsWpByGC1jwcNTs7dJit7jFjwbS2gJzcGMFejk5J
	 NBx2zWiZFrBbg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v3 0/7] BCMBCA PMB power, clock, reset and hardware
 monitoring support
Date: Fri, 06 Nov 2026 09:26:43 +0100
Message-Id: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/33NQQ6CMBBA0as0s2ZMp1BQVt7DuKB0gEYF0pIGQ
 7i7gcQYN2z/4v0FAnvHAUqxgOfoght6KEWaCKi7qm8ZnYVSgJIqJ0kpzm1+znKDpn6ZusLZ2xE
 9B57QckHmLGulqwwSAaPnxs27fbsnAjoXpsG/91WkrX7V7ECNhBJt1WhLRcFE6fXBvufnafAtb
 GxUP4okHVEKJWZaN3xhtpr5j1rX9QPd0BPNDgEAAA==
X-Change-ID: 20261013-xg6846b-bcmbca-xrdp-reset-de71b80c25a4
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Ulf Hansson <ulfh@kernel.org>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is another of these big upfront design binding and driver hoards
that is the consequence of adding new SoC support.

My stake is to be able to boot and test a full featured Cortex-A7
system and the BCM6846 XG6846B is one such system on my desk.

It's been cooking for a while in various prototype forms.

IMPLEMENTATION:

The PMC contains various stuff so this needs to be a simple MFD node
so more things can be added into it later.

Inside the PMC is the PMB, the processor monitor bus. This bridges
to several individual peripherals which are very clearly distinct
devices on that bus.

Handle the PMB with an MFD driver with power domain, clock, reset and hwmon
providers.

Expose the standard BPCM peripheral, memory, USB and PCIe domains and
a combined XRDP domain covering XRDP, the three Runners and WAN. Keep
the peripheral and memory domains always on. The power domain provider
now owns zone transitions, leaving the reset provider to pulse resets.
The CPU and PLL blocks use different register layouts and are excluded.
This new power domain integration has not been tested on hardware.

The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
ports and copper WAN and has been tested on that series. The zone
power-up sequence also passed direct CFE flash boot in the Linux 6.18
OpenWrt port; this folded v7.3-rc1 revision still needs hardware testing.

MERGE STRATEGY:

Through an MFD immutable branch once everyone ACKs the subdrivers,
it will take time I guess. Queue the bindings and drivers in MFD.

Updates to peripheral schemas and device trees to accommodate the power
domains will be submitted separately.

The patches were authored with the assistance of an LLM.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v3:
- Add a PMB power domain subdriver and binding with a combined XRDP domain.
- Move XRDP, Runner and WAN power sequencing out of the reset driver.
- Register the power domain MFD child.
- MFD transport: simplify cell registration, drop unused state and
  property.h, and add the bcmbca-pmb subject prefix.
- Power domains: default to MFD_BCMBCA_PMB.
- MFD transport and reset: use mutex guards; reset: use
  str_assert_deassert().
- Clock: use the reference clock as parent, limit CLK_GET_RATE_NOCACHE to
  PLL outputs, drop CLK_IGNORE_UNUSED and simplify Runner registration.
- Clock and reset: suppress manual bind/unbind.
- MFD transport, clock, reset and hwmon: drop redundant mod_devicetable.h;
  clock: drop slab.h.
- Power domain, clock, reset and hwmon drivers and PMC/PMB bindings: drop
  vendor-source references from comments.
- Link to v2: https://patch.msgid.link/20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org

Changes in v2:
- Use a shared PMB regmap in all child drivers, keeping keyhole semaphore
  handling and timeout recovery inside the MFD provider.
- Drop PCIe reset IDs and sequences pending proper power and lane
  configuration handling.
- Power up the XRDP, Runner and WAN zones before the XRDP reset pulse,
  preserving the sequence tested with direct CFE flash boot in OpenWrt.
- Describe clock, reset and PVTMON PMB child nodes with separate
  compatibles.
- Move the PMB transport and accessor header under MFD and register
  clock, reset and PVTMON MFD cells matched to their child DT nodes.
  Select reset variants through OF match data.
- Add PMB clock support and PVTMON clock and reset bindings.
- Add PVTMON hwmon support for temperature and all seven voltage inputs,
  retaining the zero-cell thermal sensor through the hwmon bridge.
- Drop the unnecessary literal block marker from the PMC description.
- Use the BCM6846-specific "brcm,bcm6846-pmc" compatible.
- Expand PMC as "Power Management Controller" throughout.
- Move the LLM assistance disclosure from trailers to the cover letter.
- Drop the RFC prefix.
- Link to v1: https://patch.msgid.link/20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org

---
Linus Walleij (7):
      dt-bindings: mfd: Describe the BCM6846 PMC complex
      dt-bindings: soc: Describe the BCM6846 Processor Monitor Bus
      mfd: bcmbca-pmb: Add a shared BCMBCA PMC3 PMB transport
      pmdomain: bcm: Add BCMBCA PMB power domains
      reset: Add BCMBCA block resets through the PMB
      clk: bcm: Add BCMBCA PMB clocks
      hwmon: Add Broadcom PMB PVTMON monitoring

 .../bindings/clock/brcm,bcm6846-pmb-clock.yaml     |  39 +++
 .../bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml    |  42 +++
 .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  |  87 +++++
 .../bindings/power/brcm,bcm6846-pmb-power.yaml     |  44 +++
 .../bindings/reset/brcm,bcm6846-pmb-reset.yaml     |  31 ++
 .../bindings/soc/bcm/brcm,bcm6846-pmb.yaml         |  90 +++++
 Documentation/hwmon/bcm_pmb_pvtmon.rst             |  53 +++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |  20 ++
 drivers/clk/bcm/Kconfig                            |  11 +
 drivers/clk/bcm/Makefile                           |   1 +
 drivers/clk/bcm/clk-bcmbca-pmb.c                   | 388 +++++++++++++++++++++
 drivers/hwmon/Kconfig                              |  18 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/bcm_pmb_pvtmon.c                     | 231 ++++++++++++
 drivers/mfd/Kconfig                                |  11 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/bcmbca_pmc3_pmb.c                      | 286 +++++++++++++++
 drivers/pmdomain/bcm/Kconfig                       |  10 +
 drivers/pmdomain/bcm/Makefile                      |   1 +
 drivers/pmdomain/bcm/bcmbca-pmb.c                  | 279 +++++++++++++++
 drivers/reset/Kconfig                              |  13 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-bcmbca-pmb.c                   | 243 +++++++++++++
 include/dt-bindings/clock/brcm,bcm6846-pmb.h       |  42 +++
 include/dt-bindings/power/brcm,bcm6846-pmb.h       |  12 +
 include/dt-bindings/reset/brcm,bcm6846-pmb.h       |  11 +
 include/linux/mfd/bcmbca-pmb.h                     |  11 +
 28 files changed, 1978 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261013-xg6846b-bcmbca-xrdp-reset-de71b80c25a4

Best regards,
--  
Linus Walleij <linusw@kernel.org>



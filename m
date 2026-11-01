Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F6B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N41qyY19;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QeCwmY0I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lrsjzjehIG+LsU8wpx0+lgcbIIx5YCUiOoTNxMaQY7I=; b=N41qyY197dlhbuHsY7sZDaqQZv
	1oj3ObYMYJBmjcxQ+dMUDBqFhjNdDSAREoBb3vXHXPCky0/oOTHvucfiuE0KzRnSfO75vbFZKkR+P
	vRDzdsT15tFNexjiSs+FmxG0FcyU4/oXSNAGBR4gUfM8B02AFsamimh2IrXBa4P2GFwJjKCPwGKYC
	cR52TYdfdM1hGCRe7ON81Oink9m6xdGIImvjbnXIgoja+PHE8ag4fuTJQe9VKvsBQNGq5F4wvADbV
	kVt9WLVCyPJtP3oyIhfYXiIgXVYwNl9skm5Z8+dufzo8BpUxBLe936o6/24w+JbN7+q2oyw5C86bG
	Or2I13QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdp9-0000000EyDm-1Qba;
	Sun, 01 Nov 2026 22:14:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdp7-0000000EyDd-0ucg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 22:14:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 237DB40F01;
	Sun,  1 Nov 2026 22:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57EC1F000C1;
	Sun,  1 Nov 2026 22:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571284;
	bh=lrsjzjehIG+LsU8wpx0+lgcbIIx5YCUiOoTNxMaQY7I=;
	h=From:Subject:Date:To:Cc;
	b=QeCwmY0IHi5Vid6QnU9QJJOM8+a31UrK/+W6Wp1KtD0ViHY27N9BKLWTTZbh3ZPLk
	 rugC49LAhSYg1T1CbTXIAnXOk9EvEABHIueZrKzMs+3DGsIfmAFE7GV+/R+xARxXo/
	 qGsf4h++YnphpxRaARiFAnBOBE/sbYYju6OQrAunkDBOhkeTq0uV1IjAiILZLr1gxD
	 chuqiR71cR5en3Vf5k/16mkXwi6aCYmgMDLk57yiA2+1g/ZegUv1OkYTcTgJR0gb64
	 zF/lc5TfjoLOWSc3eRv2K3r+RW42br/WIJL7bxBOuUqNXhaOgrtILUAnWDAL07kLIK
	 GvWvc3jERlrzQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/7] BCMBCA PMB clock, reset and hardware monitoring
 support
Date: Sun, 01 Nov 2026 23:14:33 +0100
Message-Id: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NSw6CQBAFr2J6bZvp4RtX3sOwmE8DExVIDyEYw
 t0dSdy6rEpevQ0iS+AI19MGwkuIYRwS6PMJXG+GjjH4xKCVLklRhmtX1nlp0bqXdQZX8RMKR57
 Rc0W2Vk4XJoe0n4TbsB7te5O4D3Ee5X1cLfS1v2r+p7oQKvSmLTxVFRNltwfLwM/LKB00+75/A
 G/R+JvDAAAA
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
 Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-hwmon@vger.kernel.org
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

Handle the PMB with an MFD driver with clock, reset and hwmon
providers.

The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
ports and copper WAN and has been tested on that series. The zone
power-up sequence also passed direct CFE flash boot in the Linux 6.18
OpenWrt port; this folded v7.3-rc1 revision still needs hardware testing.

MERGE STRATEGY:

Through an MFD immutable branch once everyone ACKs the subdrivers,
it will take time I guess. All patches except the last one (DTS file)
to be queued in MFD.

The patches were authored with the assistance of an LLM.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
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
- Add PMB clock support and give PVTMON clock and reset resources.
- Add PVTMON hwmon support for temperature and all seven voltage inputs,
  retaining the zero-cell thermal sensor through the hwmon bridge.
- Add a separate BCM6846 clocks and monitoring DTS patch.
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
      mfd: Add a shared BCMBCA PMC3 PMB transport
      reset: Add BCMBCA block resets through the PMB
      clk: bcm: Add BCMBCA PMB clocks
      hwmon: Add Broadcom PMB PVTMON monitoring
      ARM: dts: broadcom: Add BCM6846 PMB clocks and hardware monitoring

 .../bindings/clock/brcm,bcm6846-pmb-clock.yaml     |  39 +++
 .../bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml    |  42 +++
 .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  |  82 +++++
 .../bindings/reset/brcm,bcm6846-pmb-reset.yaml     |  31 ++
 .../bindings/soc/bcm/brcm,bcm6846-pmb.yaml         |  80 +++++
 Documentation/hwmon/bcm_pmb_pvtmon.rst             |  53 +++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |  16 +
 arch/arm/boot/dts/broadcom/bcm6846.dtsi            |  47 +++
 drivers/clk/bcm/Kconfig                            |  11 +
 drivers/clk/bcm/Makefile                           |   1 +
 drivers/clk/bcm/clk-bcmbca-pmb.c                   | 389 +++++++++++++++++++++
 drivers/hwmon/Kconfig                              |  18 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/bcm_pmb_pvtmon.c                     | 232 ++++++++++++
 drivers/mfd/Kconfig                                |  11 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/bcmbca_pmc3_pmb.c                      | 297 ++++++++++++++++
 drivers/reset/Kconfig                              |  13 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-bcmbca-pmb.c                   | 309 ++++++++++++++++
 include/dt-bindings/clock/brcm,bcm6846-pmb.h       |  42 +++
 include/dt-bindings/reset/brcm,bcm6846-pmb.h       |  11 +
 include/linux/mfd/bcmbca-pmb.h                     |  11 +
 24 files changed, 1739 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261013-xg6846b-bcmbca-xrdp-reset-de71b80c25a4

Best regards,
--  
Linus Walleij <linusw@kernel.org>



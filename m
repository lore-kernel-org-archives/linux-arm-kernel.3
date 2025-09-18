Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DF7CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DPFj/PUEJX2Mv5IIZorbPN+reFYeZuyiIswoEUsZNxQ=; b=QCIQvV8o9UtcgenB0KaijJtCpV
	AmA1FHxvwNJTgTJkz52TMoPf7I40qjN3drNzy/qMps5i6O9IvyPAOHTXowMSLpv7LKPbEnFJCJUGz
	rg27Fory0U2nSkSYQgCWoXZ9HdU92Ig24Ro7AvQD+UBUeCiAyNUpjRkGgCN1q0Q5z8p3ahZWOu/vy
	jhCYUbeskzbgyYafU4KB0NClHN54Szg/F1yZxb5LdPw09AiJk29hDh4hioX85cTeLLNIyfZIUr9XP
	zBOYaO6PsFKtOcwSaiJ8GTLi7Gucvy4c90bcGGdeMSaTLdoLn5zdqBwjqX9NR4P8qFBbL4ld1kLtN
	xtDvstog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHqM-00000000gbX-20kv;
	Thu, 18 Sep 2025 16:50:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHqK-00000000gZv-1dtt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Sep 2025 16:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DPFj/PUEJX2Mv5IIZorbPN+reFYeZuyiIswoEUsZNxQ=; b=UUYyhmwucpfLjhCI2V3T1yFkiM
	vxnDbhMpo0v7o2bJOQu6l6fLNVoEubiduj0mKMvcN1UGgNCdP1vFtORu3Plm9T5foaYmmTTcJCLYT
	vAOl82W6IcYBWXGicu8OmWGOcTeQjF38K7NdCX76tHudaDVWfkAdBA/35utzVLXSHvJ/WmCk+3je4
	jbQQsDySorHYmYfKD8GkG5mwS3u8UrpbZ9iBIfXym2k31faENP6WZONEcAF6hRK04gyDjSGwmAtnc
	BuqItWbNrwMHWvxaae8YDBAYwrBzv9tSDLflr2G5Rxd/bp4eqT2g/146D4j0wxaDHLvKD6GlhxFo8
	Wj1VtQaA==;
Received: from pegase2.c-s.fr ([93.17.235.10])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHqH-00000007fIZ-1e5E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:50:47 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSLY10Mbrz9sfh;
	Thu, 18 Sep 2025 18:23:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sO3sKZP93SXY; Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSLY06MC6z9sff;
	Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C9AE08B776;
	Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9SmYjYN9p3HL; Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D1588B767;
	Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 0/7] Add support of IRQs to QUICC ENGINE GPIOs
Date: Thu, 18 Sep 2025 18:23:20 +0200
Message-ID: <cover.1758212309.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758212605; l=2729; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=OgCnUIlKw1JxR7kjRn4Et9d8YymbVWaWOnW11EryMBs=; b=kJ17167SdnC2brfs/6ZVeip2FJrVuZWNePg7vhRzccMHLW4xR2hWSncCA8JgOKj0R2u6IENLD yr/kbkEH4dEBRTTs5kh8I0ABfpN+NWO5uki35VvaGdsWBxh54sMSOg9
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_175045_628596_C8C89A2F 
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

The QUICC Engine provides interrupts for a few I/O ports. This is
handled via a separate interrupt ID and managed via a triplet of
dedicated registers hosted by the SoC.

Implement an interrupt driver for those IRQs then add change
notification capability to the QUICC ENGINE GPIOs.

The number of GPIOs for which interrupts are supported depends on
the microcontroller:
- mpc8323 has 10 GPIOS supporting interrupts
- mpc8360 has 28 GPIOS supporting interrupts
- mpc8568 has 18 GPIOS supporting interrupts

Changes in v6:
- Changed mask local var to unsigned long instead of u32 to avoid build failure on 64 bits (patch 4)
- Comments from Rob taken into account except the comment on fsl,<chip>-qe-pario-bank becoming fsl,chip-qe-pario-bank as I don't know what to do.

Changes in v5:
- Replaced new DT property "fsl,qe-gpio-irq-mask" by a mask encoded
in the of_device_id table
- Converted QE QPIO DT bindings to DT schema

Changes in v4:
- Removed unused headers
- Using device_property_read_u32() instead of of_property_read_u32()

Changes in v3:
- Splited dt-bindings update out of patch "soc: fsl: qe: Add support of IRQ in QE GPIO"
- Reordered DTS node exemples iaw dts-coding-style.rst

Changes in v2:
- Fixed warning on PPC64 build (Patch 1)
- Using devm_kzalloc() instead of kzalloc (Patch 2)
- Stop using of-mm-gpiochip (New patch 3)
- Added fsl,qe-gpio-irq-mask propertie in DT binding doc (Patch 4)
- Fixed problems reported by 'make dt_binding_check' (Patch 5)

Christophe Leroy (7):
  soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
  soc: fsl: qe: Change GPIO driver to a proper platform driver
  soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver
  soc: fsl: qe: Add support of IRQ in QE GPIO
  dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC
    Engine Ports
  dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema
  dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO

 .../gpio/fsl,mpc8323-qe-pario-bank.yaml       |  72 ++++++
 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       |  58 +++++
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     |  26 +--
 arch/powerpc/platforms/Kconfig                |   1 -
 drivers/soc/fsl/qe/Makefile                   |   2 +-
 drivers/soc/fsl/qe/gpio.c                     | 209 ++++++++++++------
 drivers/soc/fsl/qe/qe_ports_ic.c              | 156 +++++++++++++
 7 files changed, 434 insertions(+), 90 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

-- 
2.49.0



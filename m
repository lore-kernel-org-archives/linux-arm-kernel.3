Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4B8C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5mFtqUYrNt5Jtcz5Xx0Xzx69WhDueky464L1flUsojc=; b=QPGf3XSv7bmKOX
	rqsIvwE63Cu3W+KAdd2FMTt8roF2QShzrrXQY+sUhkrYIgDB+YGJ9uqKZX/T/oyKVc+Sbvq4libdy
	UInHZp1O1+2f4hdeE6CFFYOIvnoE9ZVgbAur9E58u1PhFUvaIOY1Ybnkfks7K/JnPJM21FJcd57RM
	2/AGZ+1nbEENgXXiLzOb3Muo6mQUIfb9CkUSjBX87GnAcuppRkGFX4reqqe07J9UsHsIsAp9UTpO0
	4RI9W5ST/1bgVmCQ+gDY6ccnc5Idj2AiNRRt5RzsgiQjFrx0UO4T767t33Gm8PUdmbHeN+hYgjjz5
	pJLeMjkId9E23K0l2o7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdya-000000075jS-13HS;
	Fri, 03 Jul 2026 13:30:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdyV-000000075gm-3y0f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:30:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B73011A0E1C;
	Fri,  3 Jul 2026 13:30:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 81ADA60300;
	Fri,  3 Jul 2026 13:30:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C201104C94BE;
	Fri,  3 Jul 2026 15:30:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085428; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5mFtqUYrNt5Jtcz5Xx0Xzx69WhDueky464L1flUsojc=;
	b=PKJdgbvBwLLqmMSoSaXjSkq3tGVHqMcjpjd5puIh6yH03DJX7vw96fFOdAarNP7f+BhGHn
	+9NyGhDJqf2uueK1833RPQDkoYzHmOtLhAF9erYuWoLt6e/H2eRA1cpjoqkzUCarHYbJl2
	BNoHXFDd1X5M+z4/dRUlZ38YcFKsK7NduHk3fXp2uONjAolnyPCH5ulcC+IiQPvkG18mKl
	VPMk//ST+d4Q0zlz5XwGvCiV5dy5OnOp2TNPy44DoT5KEQ55tNTfD4vg1YWVGtsGA4H18l
	zLT98L+qt+ZUUt0rY7Hu726czmiwsF3cb20OnGFHVgoR4A8rIBS87WBmw6C+Yw==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH 00/12] soc: fsl: qe: QE PIC improvement and add support of
 IRQs to QUICC ENGINE GPIOs
Date: Fri, 03 Jul 2026 15:30:08 +0200
Message-Id: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XNTQ6CMBCG4auQrq3pD5TqynsYF7QMMkYptkg0h
 LtbYIO4/JJ53hlIAI8QyDEZiIceA7omDr5LiK2L5goUy7iJYEKxjEv6BNqipdcWXaAslyB0qnh
 WSBJJ66HC95w7X5YdXuYGtpsa00WNoXP+M//r+XS3pBXbpHtOGa2ktiAqJjSkJ+Ncd8dmb92DT
 PFerHm64SJydSgMcK6rMjX/XK55tuEycs1AGW7y0gj5y8dx/ALAq6umOgEAAA==
X-Change-ID: 20260513-qe-pic-gpios-073e284615a3
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@kernel.org, 
 Christophe Leroy <chleroy@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=3216;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=1yGfD2Bn0HIgjtbHahbjnqvrsiBGIr12/iGNAQIsO4E=;
 b=t2Y0LBJysR5oFAc3K2X2asCnqDjMttKGixZaUW0InOOvdj8WRyWoVMgiIRfx74m+Uoi1nrRnF
 O217geOIZWNCZVj68BVRyl0OWCN/WB+0HXOC0pdo0xoA6YKiO/eAq+r
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_063037_029541_638898C6 
X-CRM114-Status: GOOD (  12.92  )
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

This series modernizes the QUICC Engine Port Interrupt Controller (QE
PIC) driver and adds the ability for QE GPIO pins to generate interrupts
through the QE PIC, completing Christophe Leroy's prior work [1].

Christophe's series was partially merged; patches 4, 6 and 7 did not
make it to mainline.

The series is organized in three parts:

1) Add missing chained_irq_{enter,exit}() calls

   - In a chained handler, the parent controller need to mask and ack
     the interrupt source.

2) DT binding updates

   - Update #interrupt-cells from 1 to 2 in the QE PIC binding so
     consumers can encode the interrupt type (falling-edge or
     both-edges).

   - Convert the QE GPIO binding from freeform text to DT schema.

   - Extend the QE GPIO binding with an interrupt-map (nexus node) that
     maps GPIO lines to parent QE PIC interrupts.  This approach was
     suggested by Rob Herring [2] as an alternative to using compatible
     strings and driver data to specify which pins support interrupts in
     a given bank.

3) QE PIC driver refactoring

   - The QE PIC is a perfect fit to use the generic irq framework
     instead. Perform the necessary changes to the driver to convert it.

   - Minor cleanups.

4) QE GPIO interrupt support

   - Add a to_irq() method to the QE GPIO driver that perform the
     mapping of the GPIO pin to the parent interrupt domain, allowing
     GPIO pins to be used as interrupt sources through the QE PIC via
     gpio_to_irq().

[1] https://lore.kernel.org/all/cover.1758212309.git.christophe.leroy@csgroup.eu/
[2] https://lore.kernel.org/all/20250919152414.GB852815-robh@kernel.org/

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

---
Christophe Leroy (1):
      dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema

Paul Louvel (11):
      soc: fsl: qe: Add chained_irq_{enter,exit}() calls in cascade handler
      dt-bindings: soc: fsl: qe: Set #interrupt-cells to 2 to support interrupt type encoding
      dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
      soc: fsl: qe: Use generic_handle_domain_irq()
      soc: fsl: qe: Iterate over all pending interrupts in cascade handler
      soc: fsl: qe: Handle spurious interrupts
      soc: fsl: qe: Convert to generic IRQ chip
      soc: fsl: qe: Rename irq variable to parent_irq
      soc: fsl: qe: Rename host member to domain in struct qepic_data
      soc: fsl: qe: Remove useless struct member
      soc: fsl: qe: Add support of IRQs in QE GPIO

 .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 108 ++++++++++++++++
 .../interrupt-controller/fsl,qe-ports-ic.yaml      |   4 +-
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt          |  26 +---
 arch/powerpc/platforms/Kconfig                     |   1 +
 drivers/soc/fsl/qe/gpio.c                          |  28 +++-
 drivers/soc/fsl/qe/qe_ports_ic.c                   | 144 +++++++++++++--------
 6 files changed, 232 insertions(+), 79 deletions(-)
---
base-commit: f1b7f9c6e1a7fc549f37cafb48d233c9f7c26adc
change-id: 20260513-qe-pic-gpios-073e284615a3

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



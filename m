Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D34EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vAvPgJKH8E5PMa+rzxmboQbVEpCqkKMOdwuf26Tm0K8=; b=hJ5lej4P8aypSb
	oqBGSXok0pwoN/46ZinsuNboRG2I94IhzGalfj4nEsvBI3D3MtZ2w3H7r2L2k/Ai4BLjXjHUDNSkw
	fd4wIHOw1P4xQ1Lq4TK5rnI9qgSCieUNhCvTemlMAKkRKcuNe6A3hcTCL8Yopj+rjrOSe2o3adfXX
	/LBFLKHy86fki0GOuds42qD5g4HxMECq3fcSM0MNFoszHDfEs3Ax+aylyx31o5ayvqHBRSpHV/MFZ
	V11bsenSB//jDyxC3jlL8yozYJjYNdik2c/Gm1iPKTkzBNv/4HMNKYQmyIKU6hQVWyTdV4q4K6eQX
	osRQM9BS5AIkh4lib9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPJs-0000000Gq89-1gnb;
	Wed, 08 Jul 2026 10:15:56 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPJn-0000000GpzJ-1HNk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:15:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3270FC8F448;
	Wed,  8 Jul 2026 10:16:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47BE760337;
	Wed,  8 Jul 2026 10:15:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFF6711BC3422;
	Wed,  8 Jul 2026 12:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505745; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=vAvPgJKH8E5PMa+rzxmboQbVEpCqkKMOdwuf26Tm0K8=;
	b=jlFd1uYn2yV2CPBYgVByiNDZQVn+1Kpebd2p4SHFTj/6APevVxQac56sRg/ftHrvki0SEk
	TPL0Vm8+WFLZJ/9LRiQcWKjwwV8MXGDrrN2uJUQzLeOXI4Sa2niDSKYsa04pTn5CIMUoD0
	KyFhOHEOcIzvJK+2+p9NigRBDv1pMDuC/O1TZGyKiHWXyHtTD6+tj0tbCHWvdKY1dVXdNA
	m5yfzIufseA2G4jO+M1T08/49wubZ37ZJtZY8uzqnSqGB1zKoxWCrpuVdxZJfCNcPYZKCc
	bmOrBuoLbYuI+hGHHB6L8fgLDpLAyMR4uv1TYZg38DPmwPnTS+cHUQ3HBLm3pA==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v2 00/10] soc: fsl: qe: QE PIC improvement and add support
 of IRQs to QUICC ENGINE GPIOs
Date: Wed, 08 Jul 2026 12:15:13 +0200
Message-Id: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OQQ6CMBAF0KuYrq1pp9BWV97DuKBl0DFKkSLRG
 O4uxY2iy5/M+3+eLGJLGNlm8WQt9hQp1GOA5YL5Y1EfkFM5ZgYCtMil4lfkDXl+aChELoxCsJm
 WeaHYSJoWK7pPdbv9O8ebO6HvUke6OFLsQvuY9nqZ7t7VWsyqe8kFr5T1CJUAi9nWhdCdqV75c
 ElNEzN/mfYKjdAIpvRfLP3Uw+dqNuOQ+LpwKKWtysz9cvXJ8xlXI7cCtZPOlA7UNx+G4QWo3SB
 mcQEAAA==
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
 Herve Codina <herve.codina@bootlin.com>, stable@kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Christophe Leroy <chleroy@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=4530;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=3mw24PdZ/MnLAdgaavO1HCjV8HURiuVJHNRuMIows9s=;
 b=pdrtt4GhhaY6xcboT+i0fyq42dyNHqHy5xcjYiq0zPAb3adp1yM5GcBdpgFU3U49Vj4rHUtvJ
 kK9jcVgfRkGDRqsTyU6D3iVuO+6kFpBIrtSULIyzkr4pYqa6fna31Ta
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_031551_870126_D8845E0A 
X-CRM114-Status: GOOD (  17.47  )
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
Changes in v2:
- Applied Christophe two patches before this series [3] [4].
- Fix a miscalculation in patch 6 when iterating over bits set in
  CEPIER. Old ffs() is 1-indexed, but for_each_set_bit() is 0-indexed.
- Add in patch 3 commit message more info about the changes introduced
  by the conversion to DT schema.
- In patch 4, keep the existing example without any IRQ supports, and
  add only one new example. Also fix the DTS coding style that was wrong.
- Add raw spinlock guard to mask and unmasking hook since multiple CPUs
  can modify different IRQs concurrently. Also add it to set_type hook.
- Drop usage of register offset in irq_chip_type. It requires additional
  load instruction with no real benefit since irq_gc_* functions are not
  used.
- A race condition can occurs if an interrupt fires immediately after
  the domain is initialised, because gc is NULL.
  Instead, do not carry gc in the struct qepic_data. Add the domain in
  the handler data, and retrieve gc with irq_data_get_irq_chip_data() in
  hook functions.
  Because of this modification, patch 10 and 11 are dropped.
- Link to v1: https://patch.msgid.link/20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com

[3] https://lore.kernel.org/all/b08f76c1d8ff864774246f1e2c2158c223c001be.1783435914.git.chleroy@kernel.org/
[4] https://lore.kernel.org/all/cd46aec4b325745d38ac7992e4d3d5b4f4c4e95f.1783435914.git.chleroy@kernel.org/

---
Christophe Leroy (1):
      dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema

Paul Louvel (9):
      soc: fsl: qe: Add chained_irq_{enter,exit}() calls in cascade handler
      dt-bindings: soc: fsl: qe: Set #interrupt-cells to 2 to support interrupt type encoding
      dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
      soc: fsl: qe: Use generic_handle_domain_irq()
      soc: fsl: qe: Iterate over all pending interrupts in cascade handler
      soc: fsl: qe: Handle spurious interrupts
      soc: fsl: qe: Convert to generic IRQ chip
      soc: fsl: qe: Rename irq variable to parent_irq
      soc: fsl: qe: Add support of IRQs in QE GPIO

 .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   |  84 ++++++++++++
 .../interrupt-controller/fsl,qe-ports-ic.yaml      |   4 +-
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt          |  26 +---
 drivers/soc/fsl/qe/Kconfig                         |   1 +
 drivers/soc/fsl/qe/gpio.c                          |  28 +++-
 drivers/soc/fsl/qe/qe_ports_ic.c                   | 145 +++++++++++++--------
 6 files changed, 208 insertions(+), 80 deletions(-)
---
base-commit: c34b47a17bc566c7113679e6ae095d5510b4f1c6
change-id: 20260513-qe-pic-gpios-073e284615a3

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DEFCA100A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+NcYjXUcgSUfyONIom0k0pSDonkPMPGHVx9VdH1/2wY=; b=pgtmxM61YfJfVTi7FXivzhbJca
	huM6LvMnq2l+QgIpMX4tY4Nls2xmOqWM7KcCDMxLlY4yGvwy+oW0TKe2NerPcxxgBDkQYMpoPgsPT
	S1iSAh8S6H3caYMXLxhCmfAawtbOakt6KTd4d6IMwB1pE6Z7VCVssQH1/wTX1dSStC0PD14J2kOCY
	yCa97H/1l8DVHiF2LUcsQib2ELC3QY6/lIwS+KnOj7yiSAkToVJmMI9H+TJzsn5b41G93nTOh++4s
	wylTwH2zGDbz9J/HHx3oUm1O/OZhHkdhoTnave2bf5KX/9VrQvvZy8vyAl9uS5Jo3exAc+fjqlHXO
	L3W9LCKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5oi-0000000Cswd-0pxq;
	Mon, 01 Sep 2025 14:47:32 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3WW-0000000CLb7-28OY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:20:38 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cFndC21Vkz9sSh;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eGxryqrUX_hV; Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cFndC0tmwz9sSb;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0A7888B790;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MoqCpBZoSEHQ; Mon,  1 Sep 2025 14:05:34 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D60908B77B;
	Mon,  1 Sep 2025 14:05:34 +0200 (CEST)
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
Subject: [PATCH v5 0/7] Add support of IRQs to QUICC ENGINE GPIOs
Date: Mon,  1 Sep 2025 14:05:07 +0200
Message-ID: <cover.1756727747.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756728307; l=2473; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=OQso3M18Z5ORcR/fPWxtfj+ukdTn1jxV4K9Dtp+9ezM=; b=Sa0OBzCBpoGN4HMRxzJnWdq9fZNM5lvmxW/10//o9X7BqvBcy9RkfTft0Q6Nj/WX5r6Z8iMS8 woenspJQt4yAzoKwVux1Pqldu+JN1n3addpi4kD64aZS57VTiqX3XlF
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052036_733111_8CB43726 
X-CRM114-Status: GOOD (  11.78  )
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

 .../fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml |  76 +++++++
 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       |  58 +++++
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     |  26 +--
 arch/powerpc/platforms/Kconfig                |   1 -
 drivers/soc/fsl/qe/Makefile                   |   2 +-
 drivers/soc/fsl/qe/gpio.c                     | 209 ++++++++++++------
 drivers/soc/fsl/qe/qe_ports_ic.c              | 156 +++++++++++++
 7 files changed, 438 insertions(+), 90 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

-- 
2.49.0



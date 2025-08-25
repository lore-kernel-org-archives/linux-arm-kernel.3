Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B76CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ACH5U9dmCOjUKPYlykUZNIaOxITsGB26E2+zSyyJZ0o=; b=hPXG4dGvHsihafJXSVtH9UOoBc
	o5IBEGQO4+SYTnMQ/Qucfi3OyOEutS7RIO+juMmVFWdPMjTbQF0V7QMIgDji52b3aVlhoahX8Uh7z
	McUQZudZ5qB+9uUFjc0va5DNZSdclSr8Q7xvdM3/qY812cKe4r0ramfZrH1kKd+Rf5ls1hectgS3W
	UTuEGooLHNYkcHmkJO1oWILWwhj9CkuyXh8ie9Oi+d5Jta2pT6mJE1u5WtqSBLKjco7eOTk9dme9R
	zenk1a6zOGQ7NU9ZvA1UOCClN3zCkBDJaqI+WwWOnPHD48rd/RayJ8O3XRRliNEXIcTPQuUrkHLwV
	2PEOIocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqS4Z-00000007EON-2RGc;
	Mon, 25 Aug 2025 07:56:59 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRVM-000000079Px-3uzQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 07:20:38 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9M286c6Jz9sSL;
	Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxLSvRcp4PtP; Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9M285rFVz9sSH;
	Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B144F8B769;
	Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 79Duc9-z2n-g; Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8845D8B765;
	Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
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
Subject: [PATCH v3 0/6] Add support of IRQs to QUICC ENGINE GPIOs
Date: Mon, 25 Aug 2025 08:53:15 +0200
Message-ID: <cover.1756104334.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756104796; l=1967; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=9gU8poKsNJSgCMj5IC193x1flh8SKIRE7FBDWszpiWY=; b=s6s0Zoi/uoWVoB6Dpqtqh36eyBdZYPiQX7Lsm4T3peSJPKqTrsYBsGx5vTJQ1PXR5nzJtkHfw rRSUesOi+piCK4lY6+crj0YPYpBjOJvpltbn2OeKjzVgBzPFYDj69GD
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_002037_140445_8191FB02 
X-CRM114-Status: GOOD (  10.27  )
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

Implement an interrupt driver for those IRQs then add IRQs capability to
the QUICC ENGINE GPIOs.

The number of GPIOs for which interrupts are supported depends on
the microcontroller:
- mpc8323 has 10 GPIOS supporting interrupts
- mpc8360 has 28 GPIOS supporting interrupts
- mpc8568 has 18 GPIOS supporting interrupts

Changes in v3:
- Splited dt-bindings update out of patch "soc: fsl: qe: Add support of IRQ in QE GPIO"
- Reordered DTS node exemples iaw dts-coding-style.rst

Changes in v2:
- Fixed warning on PPC64 build (Patch 1)
- Using devm_kzalloc() instead of kzalloc (Patch 2)
- Stop using of-mm-gpiochip (New patch 3)
- Added fsl,qe-gpio-irq-mask propertie in DT binding doc (Patch 4)
- Fixed problems reported by 'make dt_binding_check' (Patch 5)

Christophe Leroy (6):
  soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
  soc: fsl: qe: Change GPIO driver to a proper platform driver
  soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver
  soc: fsl: qe: Add support of IRQ in QE GPIO
  dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
  dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC
    Engine Ports

 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       |  58 +++++++
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     |  19 +++
 arch/powerpc/platforms/Kconfig                |   1 -
 drivers/soc/fsl/qe/Makefile                   |   2 +-
 drivers/soc/fsl/qe/gpio.c                     | 145 +++++++++-------
 drivers/soc/fsl/qe/qe_ports_ic.c              | 156 ++++++++++++++++++
 6 files changed, 322 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

-- 
2.49.0



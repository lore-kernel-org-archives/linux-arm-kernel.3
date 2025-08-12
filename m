Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903A7CA0EDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oi0Xxx1TJ8BNWP99I7t9epnQK0iYBf9hcB6LTNITS28=; b=hanOPMvRJASU/JmdSdHO3JwJJi
	ZMjlXf21L2x5HkJHI1k4UiUUPKLlvnaqZ5e8wO/t10z/afTDstzN/a2R3fz+HACocykEKMr+3AQnj
	jLhI+qVSlGNvRVZNnDMlLJ7yrf7Ujyo8YOdXK2XdwQj5dx+dU8xRuQGxDQaFMtKc/c30c2docHEyL
	pJgWvFfD5kWpYizluL2XLU0GzoczbMXYuLhRfCtLdwxTf+KCKAnOPUeG5aGBRSFnDhtPjETGr3YH1
	s6PVV0rskcK5pQJ4ve021mDQqNPS93wbhJQDXSUMfiX2c5lT5k9bAnotKfZuppIj8YQxu4UUnyE+F
	C4Mywg7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrjy-0000000BKLy-0I4p;
	Tue, 12 Aug 2025 16:20:46 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uln3Y-0000000Ab7l-23FZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 11:20:41 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1TBM3vkpz9sSq;
	Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olXeWImUxYKy; Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1TBM395Mz9sSj;
	Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 56E5B8B764;
	Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MNwkCkkNJAtR; Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B2D138B763;
	Tue, 12 Aug 2025 13:03:06 +0200 (CEST)
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
Subject: [PATCH 0/4] Add support of IRQs to QUICC ENGINE GPIOs
Date: Tue, 12 Aug 2025 13:02:50 +0200
Message-ID: <cover.1754996033.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754996575; l=1268; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Cv+al3RkR0a6hj2nZdT3jnct2NEsZKUY1Yamq/g80o8=; b=fFl+7sV7wvWfoxhth6KvVgNiahxwX5fogT8IfnRNTZTK/9CrJvm+FZscOIx5Gp5mTTYv+jMxX /4BNU07obY7DwKrRVoPtg/YU1mQp3Qpsf7Va6nL30foeAvVGTv6Sg5z
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_042040_694035_BABA409D 
X-CRM114-Status: UNSURE (   9.77  )
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

Christophe Leroy (4):
  soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
  soc: fsl: qe: Change GPIO driver to a proper platform driver
  soc: fsl: qe: Add support of IRQ in QE GPIO
  dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC
    Engine Ports

 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       |  63 +++++++
 drivers/soc/fsl/qe/Makefile                   |   2 +-
 drivers/soc/fsl/qe/gpio.c                     | 108 ++++++++----
 drivers/soc/fsl/qe/qe_ports_ic.c              | 156 ++++++++++++++++++
 4 files changed, 293 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

-- 
2.49.0



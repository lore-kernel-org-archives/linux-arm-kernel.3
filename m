Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54754C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoKBaP8I7DCsUzrZ1dbqYwFIa5Zd5tckcAk7zMSaww4=; b=Jyl2aluAD8DuOgYPryYZS9rej+
	7a2pKHN7gV5e07IdhnpYzyTOsf9romt1SzWdMKn0k+2VJ5UXeT1nLhCy1PFSSjxHdQLUU/yPJgnZ9
	fGVh6o2uoLQEYWUU9Ei7sFIpFYlYbjmGYBmiXK8935Y8PR/E5T9bwSdnv1YpDvCif2pB8YImNtuIv
	P2H07bg19jvGuzVQMsmMl1e+ElxqjaWkmPZ8LWvQ0m7mmvNjqb5w0XJaatRgJ4b31KhXKRBvwOp9r
	ZWwcQN6qOaR03pAdHX07K2u03RGymZsA82rmYGg4dzeGGOLMJNC5BU13blgz6i6fmFRzYDBTg2QCO
	+p+PnOZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdya-000000075j9-0ZCs;
	Fri, 03 Jul 2026 13:30:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdyV-000000075h3-445A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:30:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C02BFC49F59;
	Fri,  3 Jul 2026 13:30:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFA8360300;
	Fri,  3 Jul 2026 13:30:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2B19104C9464;
	Fri,  3 Jul 2026 15:30:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085430; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AoKBaP8I7DCsUzrZ1dbqYwFIa5Zd5tckcAk7zMSaww4=;
	b=FrT/rVHxgt8LHTWxo9gj5m3P8VNmtKGnwgl6+ZQXHOMfykXdajkdqpJn6oTM69J9kFnCwP
	yIo6b92cVCUm4BeQ9Dxfex0an5r/r2wnUksOi2M28dCfxnZb9g67EQCdaun0sRsN+hNUXD
	Q29TiGdx7IGpy/rIOLooJsMj3L7WjlPQcMf1+CRf+HJaga2E2oINMffFbB8E+BAbMxe8xp
	TiSTmzt1iacoP+9DThkKFw2twDFVGAx9iswWGO92w2kwOosgwqU+0bxSroeKT2q56gEptS
	tsHkZC+IXwie4IaZJTaYMoF18wUI2NHV3tnJWcp7F82N68kecO7xWIjSOaOL1A==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:09 +0200
Subject: [PATCH 01/12] soc: fsl: qe: Add chained_irq_{enter,exit}() calls
 in cascade handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-1-6c3e706e27dc@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
In-Reply-To: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=1181;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=nmg1nGhf5vcHeC3TZyEy0wOxu/Qq+uIbQ5ztZQX88WA=;
 b=W+UGoggbgRlZFApVLXokPSIY4M5hwAJDGBFxHS6Lu9RNR8FHFGDp2lBmmBNa/av9MoI/RPEl6
 CR+yR0S7BSZB6cq6yjTRBZyiro2uqv7j2EK31Xj3EfPG/xLvonX2cbD
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_063037_029074_34FA782E 
X-CRM114-Status: UNSURE (   9.36  )
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

Wrap the cascade handler body with chained_irq_{enter,exit}() to
properly inform the parent IRQ chip that a chained interrupt is being
serviced.

Fixes: f0bcd784e1b76 ("soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports")
Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
Cc: stable@kernel.org
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 9b0bba64e91e..73a77763210d 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/platform_device.h>
 
@@ -79,7 +80,13 @@ static int qepic_get_irq(struct irq_desc *desc)
 
 static void qepic_cascade(struct irq_desc *desc)
 {
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+
+	chained_irq_enter(chip, desc);
+
 	generic_handle_irq(qepic_get_irq(desc));
+
+	chained_irq_exit(chip, desc);
 }
 
 static int qepic_host_map(struct irq_domain *h, unsigned int virq, irq_hw_number_t hw)

-- 
2.55.0



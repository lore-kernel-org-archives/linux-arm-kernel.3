Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDE6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKGSzFWOQ0pgQff5lX37PQfUpTYPDf3zSxLME5aZVNs=; b=4Xmh9dWIfytuSGqsL7pQp4bF7i
	WOjfDsBsydLkKeXDvcZasfUTHLmF3rQsRhFYzoYQAsy422Z8czONnEUDBU/eEdTIEAo5s1R0TJLiL
	JL/YUizCYzOnPqev2IPAjcDu88iBz1ZHjOLH0dgFpjP2ZX27FXZgg4MSEeyzv+meZXISyLubfBCwQ
	9QY1yH0efxuZGpixlF9bzLY+rlgNO4ehEPYv+8+91V43e8X/rP1Km567iobK6MLQ72rMrNe074S4U
	sBiQ4/JKExYD7oxTKJCel+ojKCX48APQ89Dewp+A+I1SLeq/JFitG3V249LE7sjNt7hQHqkUxeimR
	zZZ/17NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPJw-0000000GqBo-12QE;
	Wed, 08 Jul 2026 10:16:00 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPJp-0000000Gq2O-1bAo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:15:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 01ECD1A0EDD;
	Wed,  8 Jul 2026 10:15:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB49060337;
	Wed,  8 Jul 2026 10:15:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5568411BC3441;
	Wed,  8 Jul 2026 12:15:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EKGSzFWOQ0pgQff5lX37PQfUpTYPDf3zSxLME5aZVNs=;
	b=wOkDlcVlrzIeZekN+Rr1aY0KnyT0yISevNhGNqeEDo4xeZSk8U5szWWykx26hxSM4zmOO9
	4W+hSEF3MG79p49AxzMrl6Q4IOsx8KUB87fbAZn27W1bb5jC+DMSLUNRrrVZ5NZ7JnxmIf
	oNZZz7ud0Bf6s/LKrLoxYG7uYJrzKkZxcRfkOomRjqdqOv1HtKgSOoLW66iQ3kLgn5pnOm
	SOxqyTZbK9BTaU7s+Q/6s6qpx9G03KRfvCcGxQF260INxNoRZYx/mgg0Bb0Lbfz4QALfN/
	/gccyOGjITQgmFHHct6cyxVhaQS356VRoJT5UAo7VRqbxGm8A1C+P058ZZ9RJg==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:14 +0200
Subject: [PATCH v2 01/10] soc: fsl: qe: Add chained_irq_{enter,exit}()
 calls in cascade handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-1-1972044cfbd1@bootlin.com>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
In-Reply-To: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
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
 Herve Codina <herve.codina@bootlin.com>, stable@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=1181;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=uMsD6FEMT4fz2ANAG1m3/bi6O+rr81eHSt9sCqU/PRg=;
 b=Oo/ytMkVc4RMpzD8Ct5wc9ZSu6LfQvEt/QNk4/iQG9C9hhfvqlv4fj7tjnPtYMgGaXhWU/SNi
 yrXEADV6AHADH5rmybjYIbAD8+K0+pPYc3VN/W3HOjEljoeBxbMbBWf
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_031554_032493_4F6E05FB 
X-CRM114-Status: GOOD (  10.16  )
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
index 33ca1ddafe18..c3768c82a58c 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/platform_device.h>
 
@@ -82,7 +83,13 @@ static int qepic_get_irq(struct irq_desc *desc)
 
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



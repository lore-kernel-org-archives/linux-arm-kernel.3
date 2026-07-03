Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F030C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oefoDKc99jkDXFZ2F7f0RgFb3hTkk3t4ZLcXBYIg34=; b=XA4gI/ms+Avpe+xNkAwX+Q6Ywd
	fpfLcruUDdKjS7f6zmoLZzpuUR7q11Z7ikeUJrCO5MsxxcL/rf3bZ74CqXMzesmKPeRcK/GLd88to
	4ewcokwzbAB3IR4taenxmiPJ+aHnc7oMFK0ZmOFl6RHfcl2sPHPHZOPkPXZ/bbvANjrmTPFyr6rmF
	H7xCSf1zFHNx4k1x6b7zbtD+atBbEfHSDVMJMzUWj5O3nBcwxAv4cWYqbiHGJVPz1n3yTdoOP6ntn
	ebhRKTlsD3wsNR7BpojJpvFpJYzmZNzjWDP2PGnIuWhH7dVbMQke1hr6UaqEQqD8MO/6kNDNQ7Bu7
	3Q0Rx1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdyf-000000075o5-0Fm3;
	Fri, 03 Jul 2026 13:30:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdyc-000000075k7-2e4R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:30:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2CACE1A0E24;
	Fri,  3 Jul 2026 13:30:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0134160300;
	Fri,  3 Jul 2026 13:30:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4CC6104C956C;
	Fri,  3 Jul 2026 15:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085439; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1oefoDKc99jkDXFZ2F7f0RgFb3hTkk3t4ZLcXBYIg34=;
	b=G8KQcMnfA97uJv1/eCDL6gH5IJ+vm4EPXOagsotJwMTR8oFIuKQVSqeAQabajojEBOfO7b
	EG6Ai4UrKdvo/lWnemKKYKr2lDtsJqp9vuCs5MmQolpxyXe6VD18Q/7ieOSK/x3tHSCjOK
	fIWjh7AQkkrXrWHgGcycvuKv9NpJCgCqSyk08REr4s+G7rREldOvO2X8Pe89oRxXhDMYvj
	wFPm6CwPrZLq88t0zeS6huzkV3f/U8Ct9V29MC/htJcd9I2Y8EV5ngyNPmjG5vphXt5QhB
	0ydHTI5lm6L0upADw+4GjQmD5mE93pXSzfyi+IDS1Gcd5tci6mXX+3Hz5pfZeg==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:14 +0200
Subject: [PATCH 06/12] soc: fsl: qe: Iterate over all pending interrupts in
 cascade handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-6-6c3e706e27dc@bootlin.com>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=1694;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=d9GunKd8m7L9v6kr11X2z55lp5pdUtS6kYCuy9Mzz3U=;
 b=nGB9C+Ncr3tcfR6k3rWU9qZiyRkLg+NUYBUuOA/C44U+SvIww5Y7/csAreOLgStzScc0eoVL5
 Rl1ffD4IbTMA+i9IIjd417wirii40xmTivqc9LO03NpXTjZM++mNBRk
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_063043_020897_FED847E2 
X-CRM114-Status: GOOD (  10.26  )
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

Instead of only servicing a single interrupt, the chained handler can
handle all IRQs that have their bit set in the event register.
This avoid multiple parent IRQ handler being serviced if more than one
interrupt are pending on the QE PIC.

Remove unused code.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 3bca116fd2f5..27b62f4e3afb 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2025 Christophe Leroy CS GROUP France (christophe.leroy@csgroup.eu)
  */
 
+#include <linux/bitops.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
@@ -67,25 +68,17 @@ static struct irq_chip qepic = {
 	.irq_set_type = qepic_set_type,
 };
 
-static int qepic_get_irq(struct irq_desc *desc)
-{
-	struct qepic_data *data = irq_desc_get_handler_data(desc);
-	u32 event = in_be32(data->reg + CEPIER);
-
-	if (!event)
-		return -1;
-
-	return 32 - ffs(event);
-}
-
 static void qepic_cascade(struct irq_desc *desc)
 {
 	struct qepic_data *data = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long event, bit;
 
 	chained_irq_enter(chip, desc);
 
-	generic_handle_domain_irq(data->host, qepic_get_irq(desc));
+	event = in_be32(data->reg + CEPIER);
+	for_each_set_bit(bit, &event, 32)
+		generic_handle_domain_irq(data->host, 32 - bit);
 
 	chained_irq_exit(chip, desc);
 }

-- 
2.55.0



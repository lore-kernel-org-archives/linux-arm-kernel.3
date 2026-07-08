Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB30C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ef6n7iAZaYmW5RfDmOVxwgE3Bkk2FUJ5t2gDf9cNlS8=; b=ml/fekCGEZkN1lstsb54L5EMpS
	FJ3pEBQdqGJiyER93R45F86Pe1d2LTMfStXmufRHV0df7+DhA4l4FDe8IWi5VaGe8nCnn8pVO+1H5
	hUS0y5rLIMZyx7r/RRHFm6usSxC3RDiIWZSP4O5EYO7Y29xlZFiW5cb2ZlCsxazUqTZMSuEzX6J0k
	CqHNZ8T40rMtqWgg/jVkOombF7osuD7wfoP5kFd5b46VaLa52gyDeodpiBez8GnxP/6ui/RQvf3z7
	3t3Y6I4DDp2+iKQwidXOOaTlswj4Vv+b3qJ06QPhYemk/kLuvtPZA/VXVqniT+1M78ip/+CM8p+PO
	u2hbl08A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPK5-0000000GqN0-3d1r;
	Wed, 08 Jul 2026 10:16:09 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPJx-0000000GqBq-2Q0L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:16:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 20D331A0EDF;
	Wed,  8 Jul 2026 10:16:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8DC260337;
	Wed,  8 Jul 2026 10:15:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C98A011BC3422;
	Wed,  8 Jul 2026 12:15:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505758; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ef6n7iAZaYmW5RfDmOVxwgE3Bkk2FUJ5t2gDf9cNlS8=;
	b=uc7p0jaN1tBDRfMkZFYORtAT4IttYYgrTg7xpUsZZKoYIXaziU2iGmMFvnSQPOLkPHjUyw
	298u50wwdKRaWJrYPzoIJk5/kahNc20YmaNESxACtEu0UIgfohrC0xFFiLOcoWqtzzebBN
	ojsgDYGYZRe2fu5BsqdYA5mPrR7VhdD3t24OwAMGWKYIQ1ua7uhCKlNWe7A426DTAiaRcu
	Nw5xBJUR8ZVwJEQ0NcMeO36UndP6GnClRYJB757H570zlrGbopVz6hRSClnAR3ye0tqBZd
	RHuy0PAy8zUdeIExr256zYiyarOFaJkipSXcuGv6eBcU2eKUdH36KmYxnt5wCQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:18 +0200
Subject: [PATCH v2 05/10] soc: fsl: qe: Use generic_handle_domain_irq()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-5-1972044cfbd1@bootlin.com>
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
 Herve Codina <herve.codina@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=1188;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=xbFRoxhXaEBH4Z6kI+nDJgr3V2xJJCGk5mX9z2OeP7M=;
 b=KOg49Ld9mc1j9DuvOxFnlANkXiq6UTbCePbNYkfANdBAfH1b1YhRpaqE+ndIEl0Nek+gHkpO/
 zsqnFBfn0nMB7RU6OQ9QQw/kDGp22n0VVork7kea44xzld2Nta9Vwsc
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_031601_814494_7DF3CFC2 
X-CRM114-Status: GOOD (  10.61  )
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

Replace the irq_find_mapping() + generic_handle_irq() pattern with
generic_handle_domain_irq(), which handles the IRQ domain lookup
internally. This is less error-prone and more idiomatic.

Remove the now-unused irq_find_mapping() call from qepic_get_irq().

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index c3768c82a58c..c8fff45e353c 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -78,16 +78,17 @@ static int qepic_get_irq(struct irq_desc *desc)
 	if (!event)
 		return -1;
 
-	return irq_find_mapping(data->host, 32 - ffs(event));
+	return 32 - ffs(event);
 }
 
 static void qepic_cascade(struct irq_desc *desc)
 {
+	struct qepic_data *data = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 
-	generic_handle_irq(qepic_get_irq(desc));
+	generic_handle_domain_irq(data->host, qepic_get_irq(desc));
 
 	chained_irq_exit(chip, desc);
 }

-- 
2.55.0



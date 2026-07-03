Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9BDC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVGgD3fb+eKy4BrLSrfxqR3z72o1xfjS9b0bDJoQno0=; b=j9m7Q/NDZHkhKnfJUu4141qKeD
	h0nuzkctq3t/JYL2quRT/X5Zbvvv7r5+3EsQV1Qkj2NCQYfbyAMmkAYKtJ3CufI2oB8/Wfdfsiqpk
	3qWrQjSFhLPQTteGtGLgv4IHOV7AyFG/SLP2TUQtQ0EN6WQsrCSR4kdTCuNWN13Eg46jyPLXN6w8g
	869RmRYqPLXOUT4ycm3Ds9AKCcNH6optnsGmRPC627pxfXL58xHtIa62GTks/O3mp1WkHhk+gh5+x
	3OkMx2ZisvG0aqpA4lzLKhpKrUBFjPGyAV/wm9D1g55HGYd1+26555eh6m8x7yn6oH825k5qsMOav
	LtHuwUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdyq-00000007618-2ktF;
	Fri, 03 Jul 2026 13:30:56 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdyj-000000075ry-3iu7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:30:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6ED7B1A0E2C;
	Fri,  3 Jul 2026 13:30:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DD5560300;
	Fri,  3 Jul 2026 13:30:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDC72104C95AA;
	Fri,  3 Jul 2026 15:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XVGgD3fb+eKy4BrLSrfxqR3z72o1xfjS9b0bDJoQno0=;
	b=SXF3aul57hCaFh0VwEkkDSj/4nrSy/i+RyZiUelCBbEO0WRhxrx+wugPe+O262Q2RWPryr
	01Eiw2vI4D/H3JB+8zNIL8FqyLZBEpO4/3liT+fx6v7WXY3gMAbltcVDycJRIPQTdr9XYH
	XFWLhhvSZ4fS/9qRWpaeMc+CNki8if6Ye5TOHvpe2uHyU91dLmlfIBslkemMLn9mCgeY7+
	65kQO32lqKDNuVFd3MmtqUeLMn8ybqiC0BL3poSdGzag7F8TcFFQxEeVJZOyRvUmr2jcjp
	si/yh8hhQrTg0pIwce3HfF6eSOHmv4Frt6TZPw3ppPswb92XhaNILGjHOc1x/g==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:18 +0200
Subject: [PATCH 10/12] soc: fsl: qe: Rename host member to domain in struct
 qepic_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-10-6c3e706e27dc@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=1508;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=Q1LU98vM9HHOAM5h2e8fS0MJIEHJs/m4IozHvGGHGHk=;
 b=3ByUpPIH3v8ySIFn0+aNMFaKPQFIWVsopDzpFPZIneWR1GFcygDi4tPD47xYf/IimB0uOiwhP
 8Xx53Iyu7rDBu4rrgnyFLfvF61fEsYOCObL3lJRFukRrLA7p86s6HlX
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_063050_070715_24C64D3D 
X-CRM114-Status: GOOD (  12.36  )
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

Rename the host field to domain to match the common kernel naming
convention for irq_domain pointers.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 718703dab024..1bf2af087b78 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -18,8 +18,8 @@
 
 struct qepic_data {
 	void __iomem *reg;
-	struct irq_domain *host;
 	int parent_irq;
+	struct irq_domain *domain;
 	struct irq_chip_generic *gc;
 };
 
@@ -85,7 +85,7 @@ static void qepic_cascade(struct irq_desc *desc)
 	}
 
 	for_each_set_bit(bit, &event, 32)
-		generic_handle_domain_irq(data->host, 32 - bit);
+		generic_handle_domain_irq(data->domain, 32 - bit);
 
 out:
 	chained_irq_exit(chip, desc);
@@ -158,11 +158,11 @@ static int qepic_probe(struct platform_device *pdev)
 	if (data->parent_irq < 0)
 		return data->parent_irq;
 
-	data->host = devm_irq_domain_instantiate(dev, &d_info);
-	if (IS_ERR(data->host))
-		return PTR_ERR(data->host);
+	data->domain = devm_irq_domain_instantiate(dev, &d_info);
+	if (IS_ERR(data->domain))
+		return PTR_ERR(data->domain);
 
-	data->gc = irq_get_domain_generic_chip(data->host, 0);
+	data->gc = irq_get_domain_generic_chip(data->domain, 0);
 	if (!data->gc)
 		return -ENODEV;
 	data->gc->reg_base = data->reg;

-- 
2.55.0



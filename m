Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D446EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGZOL8C2TkmYpdoDmtcWAQyhNiUWAQ2nkK1kVx5QS1A=; b=yMB3CClEdEWVEvY9H84z8vtTGC
	WqaspMOWJAkfcPyZel39EhzZPdIHM9sCh2tMZFlmOhHz+uLyVVPtEG4hdmNshDD2bL3qsf8wN13gA
	E/eSqYtxrJqE0QHaKTiJSh2lj3BAgpopS3+2nYdQRKUVUCwZzUFV2TROewq5lgAIA+JeR0Y+YJrEe
	0uN4MNxgO1Ec5XACvsxAnzB3wXg429l/ozveWZLXKcX6bmx030JXqfMcqf0IfPnGAV79c+Q3lDBZO
	IG03lzCMbRK6gYd92kUaAlC1OMNv0O/8Gik8TZre97jMQeXmkVsV5wbs9WxqLxxWWg5JVM2uYu8/T
	xte7qNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdyl-000000075v6-1hMW;
	Fri, 03 Jul 2026 13:30:51 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdyi-000000075py-1YPn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:30:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5EDCEC49F61;
	Fri,  3 Jul 2026 13:30:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8ED9160300;
	Fri,  3 Jul 2026 13:30:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12473104C9464;
	Fri,  3 Jul 2026 15:30:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RGZOL8C2TkmYpdoDmtcWAQyhNiUWAQ2nkK1kVx5QS1A=;
	b=K7eo9h3BUEmCk/xosCZC6V6++51tqWU4cMERDXId5OyY53HOByjSQGLNUQ65mFwhXwx+cI
	9ebFPdIipeNTq/kb6e+ddxnpSpJNKVtm2ucrRIoU6G2CTdQAf01lJmhxD+Tc9r0RKQbcgK
	id6i2RQR+dw6P80YvEcsjIRhjsckMTBPEIpgamXYWV5pHCkbofgTKGMDRjoIOlImLoK/MX
	hEFNBy3lQVHCYmLp0KnaljRc3aeT7A/2MmwP6hi+lB0SzM2bd3Kk4QzqxyGOrbD4NX+CO4
	jQbehgzGYkmCHMsiBvPzMd0X5lLNh9gTfxKa7zXRr+gLgkeDlxcHU/VzLKJQbA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:17 +0200
Subject: [PATCH 09/12] soc: fsl: qe: Rename irq variable to parent_irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-9-6c3e706e27dc@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=1714;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=qLX9DQ6US1jLkaxEAOSY64aDksPeerbbEeIDbPKoJVA=;
 b=55d1Hq2Gudzpk5/2MD3gVD6YluwwZMFeAdM8hRfZB6IhTnjsBdCCzYQupJ+SZ+NKhsMhxSrNd
 +8uV2+zFd8iA8VY7KuXYZ2cT7dPQ/IkFTCHlmkWjcCrdxG1Uf24axWX
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_063048_583826_67A89B64 
X-CRM114-Status: GOOD (  12.58  )
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

Rename the local variable holding the platform IRQ to parent_irq, which
better describes its role as the upstream/chained interrupt in the
hierarchy.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index d022aa224f6d..718703dab024 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -19,7 +19,7 @@
 struct qepic_data {
 	void __iomem *reg;
 	struct irq_domain *host;
-	int irq;
+	int parent_irq;
 	struct irq_chip_generic *gc;
 };
 
@@ -111,7 +111,7 @@ static int qepic_domain_init(struct irq_domain *d)
 {
 	struct qepic_data *data = d->host_data;
 
-	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
+	irq_set_chained_handler_and_data(data->parent_irq, qepic_cascade, data);
 
 	return 0;
 }
@@ -120,7 +120,7 @@ static void qepic_domain_exit(struct irq_domain *d)
 {
 	struct qepic_data *data = d->host_data;
 
-	irq_set_chained_handler_and_data(data->irq, NULL, NULL);
+	irq_set_chained_handler_and_data(data->parent_irq, NULL, NULL);
 }
 
 static int qepic_probe(struct platform_device *pdev)
@@ -154,9 +154,9 @@ static int qepic_probe(struct platform_device *pdev)
 	if (IS_ERR(data->reg))
 		return PTR_ERR(data->reg);
 
-	data->irq = platform_get_irq(pdev, 0);
-	if (data->irq < 0)
-		return data->irq;
+	data->parent_irq = platform_get_irq(pdev, 0);
+	if (data->parent_irq < 0)
+		return data->parent_irq;
 
 	data->host = devm_irq_domain_instantiate(dev, &d_info);
 	if (IS_ERR(data->host))

-- 
2.55.0



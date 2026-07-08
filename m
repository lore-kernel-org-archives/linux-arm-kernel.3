Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3194CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2D54DLwyp1FomyecUqBcQt3voMAAHcAPIOVYtACtMIY=; b=dJxSHDTd6PzHl8FAcAZif4wBb7
	MYWdwBT9p9Ulff0+K7rjUgjHzzyo4zvn/vKjfCYhOxMyU2xlgrMSSCHtIb6SvcTh1EFxB0zl92/X9
	Dvbfc3FuVnJL1fOjVYk1tBOPfHOUzHJ3/jgnr6mxADuTskrvpWQLS40MMc4dEVd4k7RzGdxdvH078
	T5+sCgxjafreVETOqB+zUJQPwqfEgJxGmaGSurnN9xWSsjsUAuu+0jnksuIXYbTlvDRxlWbszQTbi
	tMO0r3+GS9VXPdKZBjQTtODsFHHvrNkAn/kayNuBmL9/NtIqd/yeQ5eXsIh8Ht3LqdAUIC71rSnNC
	KZ170g9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPKE-0000000GqZa-2IsI;
	Wed, 08 Jul 2026 10:16:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPK8-0000000GqPF-2lmC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:16:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0C5AB4E40CF2;
	Wed,  8 Jul 2026 10:16:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D52A160337;
	Wed,  8 Jul 2026 10:16:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F165811BC3422;
	Wed,  8 Jul 2026 12:16:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505768; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2D54DLwyp1FomyecUqBcQt3voMAAHcAPIOVYtACtMIY=;
	b=C2ttfkG7CQu+QwlKhKO8Jy8mmOO5slLHoPzfhlHogbTefzYwmRXBzRSo+BrzSAmSqyrWJR
	G/cf+3aotc/5GwBrkT/7NtWu3Lpu0DcFqFrEoafdWidU8LMlwElD72mAnc1IHvpAX3a6pr
	qxmsmfSMCxsgGVcmY3jjR/y62yQczTURLd3Ctr6RlwNWr9k3GKXSaZgvLdESb2m4FopGBI
	ePG7/l2nZSQYgdpIcZ1/bgKWVosgvqpLWdsBk73Ok4wp7UL8K0jAlgKB2AEMQJGbGQqkwl
	R8zQMjs7PfUwYgpj98uBgJjmgDnngitJYzjUscI2aENsneBuchowX4FqiDhwbw==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:22 +0200
Subject: [PATCH v2 09/10] soc: fsl: qe: Rename irq variable to parent_irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-9-1972044cfbd1@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=1688;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=lg8pO2TtHb3jP6IOv7CUPg4uuEdOUB/AkCb+PKzxxEo=;
 b=8Gi3R+3l/3Km+4n/8HNw4vV2u2JZvzUjJIXrzPPYx5pm9Y0Ay81LIakl3dqT2jK6OvHk3ua8B
 zoC/7XHYaHfDLNoJmyi5xnIIBRuR6IRLZfntTDNkBdkr998zxLmUy4U
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_031612_919395_3140C543 
X-CRM114-Status: GOOD (  13.43  )
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
index 4f6b75439f9f..7375f92f528b 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -18,7 +18,7 @@
 
 struct qepic_data {
 	void __iomem *reg;
-	int irq;
+	int parent_irq;
 };
 
 static void qepic_mask(struct irq_data *d)
@@ -117,7 +117,7 @@ static int qepic_domain_init(struct irq_domain *d)
 {
 	struct qepic_data *data = d->host_data;
 
-	irq_set_chained_handler_and_data(data->irq, qepic_cascade, d);
+	irq_set_chained_handler_and_data(data->parent_irq, qepic_cascade, d);
 
 	return 0;
 }
@@ -126,7 +126,7 @@ static void qepic_domain_exit(struct irq_domain *d)
 {
 	struct qepic_data *data = d->host_data;
 
-	irq_set_chained_handler_and_data(data->irq, NULL, NULL);
+	irq_set_chained_handler_and_data(data->parent_irq, NULL, NULL);
 }
 
 static int qepic_probe(struct platform_device *pdev)
@@ -161,9 +161,9 @@ static int qepic_probe(struct platform_device *pdev)
 	if (IS_ERR(data->reg))
 		return PTR_ERR(data->reg);
 
-	data->irq = platform_get_irq(pdev, 0);
-	if (data->irq < 0)
-		return data->irq;
+	data->parent_irq = platform_get_irq(pdev, 0);
+	if (data->parent_irq < 0)
+		return data->parent_irq;
 
 	domain = devm_irq_domain_instantiate(dev, &d_info);
 	if (IS_ERR(domain))

-- 
2.55.0



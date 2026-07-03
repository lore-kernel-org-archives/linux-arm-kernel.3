Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D82AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYiPuRvE6Nwnxm1ayjjfGRCixDjRGX9XFfBMaqcehNo=; b=uqhJCpIPC/6N2s6iLONRqTVZcS
	FJJ9GQ/IT5N7lb5jMngBAT7mgYXn4V1qDI1P5wiL3tPKRPS9FCP5tPFQPRzc1Z5x8yo3lyGOvxMvL
	yQGM3C7nuq+zKigJU8laj4xNmpZIBRZCuwuFURpcXIkD18NalEVRe2mUqR27jH4n/7TOCCagx+azU
	O9r9zTZmL7RNdVt8fbS5iynIHe2uu0l4gcpdG8kP5SPXFgYe0Wxjgo/46Nzv+hkzxJ8KFjrziBFnU
	31l+jKi3D7Ro+JBFwY9vmGFmqZg3Fo0I+k12ML3bOIJqDk1AjiZSnBcaKh6iNlsf/4TYfDxO7KzSA
	hqVnQMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdyq-0000000761L-3PpU;
	Fri, 03 Jul 2026 13:30:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdyl-000000075tV-2pHx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:30:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 01DD34E40C73;
	Fri,  3 Jul 2026 13:30:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB6FA60300;
	Fri,  3 Jul 2026 13:30:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2806104C95AB;
	Fri,  3 Jul 2026 15:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085448; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DYiPuRvE6Nwnxm1ayjjfGRCixDjRGX9XFfBMaqcehNo=;
	b=TPFDubIOOd12n77ZxYKru+sNA7xfghnI7Q5u0bwp4fAQxtAEOXWdCwOjBuUJ6H/lVmev8p
	At01ZX3W66RGbqXG6frB42AukdRbTiqgf9Ne3YC5tw1lFV81K1EcbqbimuX1VgsLsFsJWn
	RgL3pNdq/GHpFeAJ7uzls9MGOI5yNN76s/TXzF09XOf0LcnI4uvnQqgvmkfrEwZXtNhtng
	F9iI2hXF9H/6d6dtDGHA1MZRs9g1pnlYftrTHfaN8Tm4mLwIG1GTtftPFd6+jRiN/ninp7
	+/TeZllHOaEtIknkmkI0euNQrkn31XiYid5PZ4uVeX2/UaR7O6aPY0+apyckgA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:19 +0200
Subject: [PATCH 11/12] soc: fsl: qe: Remove useless struct member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-11-6c3e706e27dc@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=1530;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=lV6ixfVQUU+h5OFc6ks1zgWp1h40IUo5QKv+Bi6rpy4=;
 b=GTd53N1L6mieV9LlVEep06QMzjN/ESane6rFL5nBaGQzPhkH7cvOjjXeGy3noJBEpv8mlEyJD
 09JzWIAKFqZATFJ0g3rY981zqaR5bWzMCKPO8dxQ09la/CBBR6EG1Kf
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_063051_875808_BDA6281F 
X-CRM114-Status: GOOD (  14.04  )
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

The reg member from the struct qepic_data is no longer needed, since it
is now embedded in reg_base of struct irq_chip_generic. Remove it.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 1bf2af087b78..6cf23a721ff3 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -17,7 +17,6 @@
 #define CEPICR		0x14
 
 struct qepic_data {
-	void __iomem *reg;
 	int parent_irq;
 	struct irq_domain *domain;
 	struct irq_chip_generic *gc;
@@ -144,15 +143,16 @@ static int qepic_probe(struct platform_device *pdev)
 	};
 	struct device *dev = &pdev->dev;
 	struct qepic_data *data;
+	void __iomem *reg;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 	d_info.host_data = data;
 
-	data->reg = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(data->reg))
-		return PTR_ERR(data->reg);
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
 	data->parent_irq = platform_get_irq(pdev, 0);
 	if (data->parent_irq < 0)
@@ -165,7 +165,7 @@ static int qepic_probe(struct platform_device *pdev)
 	data->gc = irq_get_domain_generic_chip(data->domain, 0);
 	if (!data->gc)
 		return -ENODEV;
-	data->gc->reg_base = data->reg;
+	data->gc->reg_base = reg;
 
 	return 0;
 }

-- 
2.55.0



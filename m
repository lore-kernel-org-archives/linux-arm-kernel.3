Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D38C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fupjHTV5DnOmVcgCuGo7Gn43pEA+0f/cXil9unSCcGQ=; b=PokhxqJFzhlVyHxGvGq8jls+b6
	dFue9a3he6wLH0Z/a9X3GlCH1RZRwCJ/3e1sC9y3p028mD+Ba2o4q3wvoEugK8p5t3pRdCK1B+H2V
	61p0bL+RwV5X4cJp7zdjQNbI3J11ELdbk5Hi0aPmni29NrzzX281fV3SWgBqCny60uQX6x3V3FYO2
	pdLclhoEoLno3LURdevJlQ5Oef43qg1n7MuMoA+TNvo/H8nEiha2kIKGk0RE1uP6T0H/6okr0pofd
	ji5px1if2CM8qcfqTBGIJoJPE9Qi1R0tq2rbwpSf7aojDqRPT5TV4jvrSHK0DBQ3+3S4UuTHpyoSJ
	G9fMpnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoeZ-0000000C9BR-2tFv;
	Thu, 26 Jun 2025 15:36:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnut-0000000BzwQ-4ACc;
	Thu, 26 Jun 2025 14:49:33 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fupjHTV5DnOmVcgCuGo7Gn43pEA+0f/cXil9unSCcGQ=;
	b=Le0CtdFBiqX2btBCd9aUHwSpvNJJiERCenIY0xuoHYXzpcWz2J+t6YAvYp0KU/Ah9dP9Fj
	aqOGCEsXMWdkZdfNy2manEE695M6vy8P3+cS8qpYiZYHsKvkdmAWebgkaazG398a+Y5Bsp
	U3TtFq3Re6osMhOL5sP/6tgiASvW1/GDVOgJJhX3P/oBJ3tLGToiEHKNwBRJbnLAOqABKN
	XSZROilhPoyjGfqXrJBqR/9D7VFdFzhs88J4n0uEM1hF6Se8qjzY5WWJiXMG3KcMOQ/eF4
	bVtOKD+LeaQ3bP4pak/PmNjfsHaJYPkG715aZJ4vJqjFVWocYyBh1pGn1D5teA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fupjHTV5DnOmVcgCuGo7Gn43pEA+0f/cXil9unSCcGQ=;
	b=Mzr5HnfB60mMPL7NGoooAyg1xNzdkmbmHxXDYU5fjXyt0j9iN7EVzDaRqZ7rQSd7VG1RaK
	/trtgHhcMHyE3rDQ==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Antoine Tenart <atenart@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 02/12] irqchip/bcm2712-mip: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:48:59 +0200
Message-Id: <92a6d68db014e945337c10649a41605da05783da.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074932_187704_DA32671B 
X-CRM114-Status: UNSURE (   9.73  )
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

From: Thomas Gleixner <tglx@linutronix.de>

Switch to use the concise helper to create an MSI parent domain.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <tglx@linutronix.de>
---
 drivers/irqchip/irq-bcm2712-mip.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-bcm2712-mip.c b/drivers/irqchip/irq-bcm271=
2-mip.c
index 63de5ef6cf2db..9bd7bc0bf6d59 100644
--- a/drivers/irqchip/irq-bcm2712-mip.c
+++ b/drivers/irqchip/irq-bcm2712-mip.c
@@ -172,18 +172,18 @@ static const struct msi_parent_ops mip_msi_parent_ops=
 =3D {
=20
 static int mip_init_domains(struct mip_priv *mip, struct device_node *np)
 {
-	struct irq_domain *middle;
-
-	middle =3D irq_domain_create_hierarchy(mip->parent, 0, mip->num_msis, of_=
fwnode_handle(np),
-					     &mip_middle_domain_ops, mip);
-	if (!middle)
+	struct irq_domain_info info =3D {
+		.fwnode		=3D of_fwnode_handle(np),
+		.ops		=3D &mip_middle_domain_ops,
+		.host_data	=3D mip,
+		.size		=3D mip->num_msis,
+		.parent		=3D mip->parent,
+		.dev		=3D mip->dev,
+	};
+
+	if (!msi_create_parent_irq_domain(&info, &mip_msi_parent_ops))
 		return -ENOMEM;
=20
-	irq_domain_update_bus_token(middle, DOMAIN_BUS_GENERIC_MSI);
-	middle->dev =3D mip->dev;
-	middle->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
-	middle->msi_parent_ops =3D &mip_msi_parent_ops;
-
 	/*
 	 * All MSI-X unmasked for the host, masked for the VPU, and edge-triggere=
d.
 	 */
--=20
2.39.5



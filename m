Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FD4C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2aznJGf1J+nG8uzCfZ1sNahDbmhHRYzTMg4koq1VzA=; b=Sou/8CMKCHKorGUCsal3wdLHFI
	X8pnguSMmynWtrZjfVOY63WEr2+yFe88gVwuEASpevlj9jARIxZHg0/LrwH2viLH5WsfyqMwVNmGD
	gLVyGrEV0mBDWNPLTi9BIRzPKroKdnpibWDDIVfUzrdkEV1StZeduy4EY5JoPTYWRF4s0tuAO6YOO
	vU3mfgMjEqrilM6z/8+Ks21UKxl3rn3BUOqjrkoJIy/1O3JkhWFFIeeeV7ViCY0vk+SHKaoNV5VQp
	kV5G4MUxM7iIRumZyEcFf4DDl2k/n5TzpsJZ364xqvHnMdfvx4ujCt+ZmptZ1u6qT1A2f9jt3ZigD
	JH+XqbFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoly-0000000CArh-0KUP;
	Thu, 26 Jun 2025 15:44:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnv0-0000000C00O-43wG;
	Thu, 26 Jun 2025 14:49:40 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2aznJGf1J+nG8uzCfZ1sNahDbmhHRYzTMg4koq1VzA=;
	b=Idsc8a/+lTtARTa2nNQrRNQvokiSlvPFnhxaytrQ1nkjwUGdApgKmyVsjOyhGmvOp4ruxo
	wHOArztVX7uJfBbPcb5uK+/ha9KjEzBrVLjNkwu4ToXBKnDeNVvgtVZ8Jffcp3WCHD51dl
	tyLoQN/tcNmUDMdoQU3HAuCbuIfqzUKHZmtWJodFHRT7kxMZyK/w2cMUg7W6AvnE+ddqoX
	5JplpIQjp7LKjWwfnjsu2LpTon/d3QZLEUXZUD1WroEV9z9Yy82LiFMJ1LklSdz+Pdc8vG
	ZHYAO9xbNSUowGTAn9O4rGFjA7rTnPg3VI26DrrCoifOHT9hriabbgAbyz0+TQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2aznJGf1J+nG8uzCfZ1sNahDbmhHRYzTMg4koq1VzA=;
	b=JBEOGIcDy1WIGOz1iEnahNhZLPLAPyxSPGYQw3pRNaIE4sX+XH1TNAh/rWBgqYtgSBL7GW
	zn74SJJMSYMKUdCA==
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
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 09/12] irqchip/alpine-msi: Convert to __free
Date: Thu, 26 Jun 2025 16:49:06 +0200
Message-Id: <ff2c9460d03e44cb2946521dbae5ce800d34523e.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074939_173500_ADB30C84 
X-CRM114-Status: GOOD (  10.86  )
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

Tidy up the code with __free. No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/irq-alpine-msi.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-=
msi.c
index cf188e5feefc0..43d6db290138a 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -207,11 +207,10 @@ static int alpine_msix_init_domains(struct alpine_msi=
x_data *priv, struct device
=20
 static int alpine_msix_init(struct device_node *node, struct device_node *=
parent)
 {
-	struct alpine_msix_data *priv;
+	struct alpine_msix_data *priv __free(kfree) =3D kzalloc(sizeof(*priv), GF=
P_KERNEL);
 	struct resource res;
 	int ret;
=20
-	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
=20
@@ -220,7 +219,7 @@ static int alpine_msix_init(struct device_node *node, s=
truct device_node *parent
 	ret =3D of_address_to_resource(node, 0, &res);
 	if (ret) {
 		pr_err("Failed to allocate resource\n");
-		goto err_priv;
+		return ret;
 	}
=20
 	/*
@@ -235,34 +234,28 @@ static int alpine_msix_init(struct device_node *node,=
 struct device_node *parent
=20
 	if (of_property_read_u32(node, "al,msi-base-spi", &priv->spi_first)) {
 		pr_err("Unable to parse MSI base\n");
-		ret =3D -EINVAL;
-		goto err_priv;
+		return -EINVAL;
 	}
=20
 	if (of_property_read_u32(node, "al,msi-num-spis", &priv->num_spis)) {
 		pr_err("Unable to parse MSI numbers\n");
-		ret =3D -EINVAL;
-		goto err_priv;
+		return -EINVAL;
 	}
=20
-	priv->msi_map =3D bitmap_zalloc(priv->num_spis, GFP_KERNEL);
-	if (!priv->msi_map) {
-		ret =3D -ENOMEM;
-		goto err_priv;
-	}
+	unsigned long *msi_map __free(kfree) =3D bitmap_zalloc(priv->num_spis, GF=
P_KERNEL);
+
+	if (!msi_map)
+		return -ENOMEM;
+	priv->msi_map =3D msi_map;
=20
 	pr_debug("Registering %d msixs, starting at %d\n", priv->num_spis, priv->=
spi_first);
=20
 	ret =3D alpine_msix_init_domains(priv, node);
 	if (ret)
-		goto err_map;
+		return ret;
=20
+	retain_and_null_ptr(priv);
+	retain_and_null_ptr(msi_map);
 	return 0;
-
-err_map:
-	bitmap_free(priv->msi_map);
-err_priv:
-	kfree(priv);
-	return ret;
 }
 IRQCHIP_DECLARE(alpine_msix, "al,alpine-msix", alpine_msix_init);
--=20
2.39.5



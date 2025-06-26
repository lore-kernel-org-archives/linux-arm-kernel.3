Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB52C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RH4Oypq2KUDQkhJZzAt8JVIWri/iIyk+GulHVMw8GJw=; b=K8e0OxCgah233i1NCfqo3zn3pH
	pf6KrRpDN700RbQs8dWTT80ttv3tylrytTibTWadzjowENLhBQh/RWTGubekVfEZZy4U6rhpB/exq
	6oW2DSWENuOgst6c9TUPaBDWCpCNx3/bmAUuk25E1PBoN+yXvPj+qJ4Tk0CKfSiOCqM/QKQcilBbr
	aWF3fvlNcUEPuf/HUFApxQ//7u8vvui6kIU0r/rVXsYsOk2KB43A+8g8SjSmTllkIWpZsqWWdB8nW
	O1Pjn7qo4MCppWFhHQEo6YoWipJcXiuRsO42nmqY4/g3qQ/WE+yeowV3bKaL2qAr+IaYyAiMufNSH
	F+qxMm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoa2-0000000C7kw-3zvu;
	Thu, 26 Jun 2025 15:32:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnus-0000000Bzvp-2Y08;
	Thu, 26 Jun 2025 14:49:32 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RH4Oypq2KUDQkhJZzAt8JVIWri/iIyk+GulHVMw8GJw=;
	b=czaI2DSBz6lv453TNMwhAu26IwFz1BOoWFI49qdBHgvJndJ7A+gK6ojqrK1HnfjGXuz17+
	4Wuz0KYBKa1I2pk0/mfDJJxSnvY+p4Wbmm+IbJlukddbCxUshXcBP3t7CpmcasNzvVQxX4
	VtMF9rbnmKc1lfvRsU2yYmsCdDudNWLz2KQmA8rUpwvP9biyrYKuUnw/fYWwfdAcqQiHPG
	skQFntKLytgiyj9iW2LuPqkkbcC8f3R5e6b8EiH3LFRbcpKEOVGcj+NZ1uK/PlcKWvwF4H
	66+ARZm2c8+m5rMvuG2rTeAkaK6QYZRQBKiVct0HkLubGJWu7G9hY3zRpXFUQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RH4Oypq2KUDQkhJZzAt8JVIWri/iIyk+GulHVMw8GJw=;
	b=psVI2LjHAPIUXeFXC3qVXazEejx7vgLn8YmfK3c6xPNOeqTwCFROQJgUanCk0avAHuqWR5
	SEtZrEmwxGV9x1DA==
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
Subject: [PATCH 00/12] irqchip: MSI cleanup and conversion to MSI parent domain
Date: Thu, 26 Jun 2025 16:48:57 +0200
Message-Id: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074930_784070_F8BC4501 
X-CRM114-Status: GOOD (  10.37  )
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

The initial implementation of PCI/MSI interrupt domains in the hierarchical
interrupt domain model used a shortcut by providing a global PCI/MSI
domain.

This works because the PCI/MSI[X] hardware is standardized and uniform, but
it violates the basic design principle of hierarchical interrupt domains:
Each hardware block involved in the interrupt delivery chain should have a
separate interrupt domain.

For PCI/MSI[X], the interrupt controller is per PCI device and not a global
made-up entity.

Unsurprisingly, the shortcut turned out to have downsides as it does not
allow dynamic allocation of interrupt vectors after initialization and it
prevents supporting IMS on PCI. For further details, see:

https://lore.kernel.org/lkml/20221111120501.026511281@linutronix.de/

The solution is implementing per device MSI domains, this means the
entities which provide global PCI/MSI domain so far have to implement MSI
parent domain functionality instead.

Aside from that, the creation of MSI parent domains has been simplified by
new helper functions, which are not yet used by all drivers.

This series addresses this by:

   - Converting the remaining global PCI/MSI domain providers to MSI parent
     domains

   - Converting the existing MSI parent domain implementations to the
     simplified setup function

 drivers/irqchip/Kconfig                    |   3 +
 drivers/irqchip/irq-alpine-msi.c           | 155 ++++++++-------------
 drivers/irqchip/irq-armada-370-xp.c        |  48 ++++---
 drivers/irqchip/irq-bcm2712-mip.c          |  20 +--
 drivers/irqchip/irq-imx-mu-msi.c           |  14 +-
 drivers/irqchip/irq-loongson-pch-msi.c     |  25 ++--
 drivers/irqchip/irq-ls-scfg-msi.c          |  49 +++----
 drivers/irqchip/irq-riscv-imsic-platform.c |  12 +-
 drivers/irqchip/irq-sg2042-msi.c           |  20 ++-
 include/linux/irqdomain.h                  |   2 +
 include/linux/msi.h                        |   2 +
 kernel/irq/irqdomain.c                     |   1 +
 kernel/irq/msi.c                           |   3 +-
 13 files changed, 155 insertions(+), 199 deletions(-)

--=20
2.39.5



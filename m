Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3F2CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFf/1zJr/zEkqZOKIb8GQD1rcuHp4gzmK6Cu/u4Zy2Y=; b=OImSVvvgpB6RHbVSA7Z6ZTsPkO
	QzpgLd/Zw8cj+k6SULOVwK7s4BznkAbq+IPACYkpH5VqfXyQ3ap4zOK39xMh3dVbs2/m6Yj85Wz2N
	hflQFqzEkYvXITFQxRd5Wgl7J2ZCygeXE4Mib1JGttnPTmhZlBmDeMQbWPDkDXQ5UX/S8ljDhGoCh
	XUhzo+Jsmf9vrGx1ODV7UGHbxH0LemSwB5Usl8AcGOQOcxWLjlwJYBA7PpaOhhXtTzpM1RrqwybH8
	4soMotZsk9UP/GwTO/MrFhV9+WIqolm4fohWAv48RNkg7uZgCJe7MwiYHoF8XiEGKoLlPl+UC/bFL
	KQ8Mw3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBg8-0000000H0C5-1WqZ;
	Tue, 21 Oct 2025 12:41:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBg6-0000000H0Ai-1EZ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:41:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0135144105;
	Tue, 21 Oct 2025 12:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E432C4CEF1;
	Tue, 21 Oct 2025 12:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761050485;
	bh=ZdCUUMchR3IZHrUpOETZdGuUsxzbyMb4ecC2yoA5/tY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vEm0zSa0zJ6EnD5StWuKbGLFC0eDn3fHQFlf+4FSbpIc3KBJcWeNm73cMpaaEAeXn
	 itPOwyLtd+G0Hq+qMxmqgbtN65fSldGQxAktR0BI6Ohaeb4+1K8trUVYPApig3HGZr
	 S06gptoO3CVkhIDPrNUeLHu877VE1DXIEZUI6KAbNRT0zGlNglCfiYjCyQMZYTlL0m
	 moEJ72WdLXOkCib/2IiRgFpkoqJ0GPPGokkp2RWmKqpAjvGklHU5Og1FbyK+SqSFb5
	 bgtoqBx9nFkNwXTzVDW/r6Mspx8Ro3mm8hr3W6j43W3lCqHhUAwDhUerFklH6ckKBs
	 aIsEl2zXnKLqg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ray Jui <rjui@broadcom.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v4 3/5] of/irq: Export of_msi_xlate() for module usage
Date: Tue, 21 Oct 2025 14:41:01 +0200
Message-ID: <20251021124103.198419-4-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021124103.198419-1-lpieralisi@kernel.org>
References: <20251021124103.198419-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_054126_354278_9BDAB669 
X-CRM114-Status: UNSURE (   8.77  )
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

of_msi_xlate() is required by drivers that can be configured
as modular, export the symbol.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index ee7d5f0842e8..1cd93549d093 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -733,6 +733,7 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 	}
 	return id_out;
 }
+EXPORT_SYMBOL_GPL(of_msi_xlate);
 
 /**
  * of_msi_map_get_device_domain - Use msi-map to find the relevant MSI domain
-- 
2.50.1



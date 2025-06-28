Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7ABC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 18:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H78N3sOXSToVRI3tun6+pWw8yWWi5DdLeEVwnVpXNRo=; b=zqvF/6evWCwk6JGstrRH9fgdZA
	hyNw1sT7C/fr4zPxADhVvckpvTBaL2ANlSRkUtF0Gdifg984jVQBSHtn7gGj4UD1DpFT9/6ZXDWE7
	p2EiUXLhY1hef409b6aRYUYdyjQlkm+41ytp8gLL8K5HUxeuY2iUn/35YYIS8YAT17s/6gnqJ1P0/
	l6uFSXGLjKvS2B4GE4Hd1PrhK4Sk0lkIt+OMjfdyX0trr3gBuuLTGIKag0TUbdNHR+VY57YAUWnx2
	GFsvkXn9Ec0grIb1AYYL55rRnw6/9mwrc+gsEG9nXqOjpzDTjftq96NKjNog2P1UrboSu050bUqJ1
	Qs9LwAWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZrd-0000000HB3p-3L9u;
	Sat, 28 Jun 2025 18:01:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZNn-0000000H7W0-0ooF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 17:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BE9046403;
	Sat, 28 Jun 2025 17:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DF0C4CEF7;
	Sat, 28 Jun 2025 17:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751131830;
	bh=7TKWmvcmwH8EPAgGzhd5SaoCtxIYJA2s5UD/FxVMb24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IbK2Lldpk+5feq9A359lTu/tVzT5DORZ+3NRgDVCNNuSAQOXg3by+CADp1by1l1LY
	 nkb8nIyXxVy8iNAnXXCd95XqIPAsbeUohcI9bKtkNKixH/K+y2QglmjPNI6a8fBvZF
	 zy15F684XQ75nuWhIQoZdvgFGcBaBIJ/VjLthGvCMWkTBaqJHUKibOrbwAvvehju9S
	 blmBcaf6TbKYa8HG+tzoyDg3YXi0bHHEjwwzzGAjiUIYIYMQoP0+hUqx6Ef8cTRUrC
	 R0k1ZUxkMhCEjaQhtvM/qHefylBFIRNmNT+H6c1siqyNY2Onq/VF1Ws56C9nEq6lfb
	 WLuYJooE9+3Iw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uVZNk-00AqZC-62;
	Sat, 28 Jun 2025 18:30:28 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 10/12] PCI: xgene-msi: Resend an MSI racing with itself on a different CPU
Date: Sat, 28 Jun 2025 18:30:03 +0100
Message-Id: <20250628173005.445013-11-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250628173005.445013-1-maz@kernel.org>
References: <20250628173005.445013-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_103031_256361_C6745E1A 
X-CRM114-Status: GOOD (  12.78  )
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

Since changing the affinity of an MSI really is about changing
the target address and that it isn't possible to mask an individual
MSI, it is completely possible for an interrupt to race with itself,
usually resulting in a lost interrupt.

Paper over the design blunder by informing the core code of this
sad state of affair.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-xgene-msi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index fbfdc80942596..f797ba0524783 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -168,6 +168,7 @@ static int xgene_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	irq_domain_set_info(domain, virq, hwirq,
 			    &xgene_msi_bottom_irq_chip, domain->host_data,
 			    handle_simple_irq, NULL, NULL);
+	irqd_set_resend_when_in_progress(irq_get_irq_data(virq));
 
 	return 0;
 }
-- 
2.39.2



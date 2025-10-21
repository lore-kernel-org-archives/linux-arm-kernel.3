Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0599ECCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwXWn85XnZv9SphS4gUmIrupy+5IqH1mYIDyn/sGI1k=; b=t80EpGDVcH0f/2CnjiNU6peNgc
	d5m5UXRDhWyv+rgBnyi4jbjbbCVoGGrQU615JCM+4Edn24STU8kvbufvejgshonsoJj2I6T7pKf0j
	PEb8P1cd1xywMEQYA+MNEBNdMCVFqH++4whU3dEM0xSGH2jJe72UECUQQSOfYqEMkdjfKhsvSCr66
	kWIEncwzdCvd7QONqy41mB/T1363J/52obE2NXy06axrOGdKVl+PSdmpp3ZaGOUxnD2KJqc7da0bz
	+yOXUeTj4PVGUeR9M5nPuR+qSEjIfp2QEO5DFEhw4l5Se3ZsuLseZzbRg+EI1dGEAbk1qEu0x7pq5
	UnZ1Wr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBg5-0000000H0A7-0EP4;
	Tue, 21 Oct 2025 12:41:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBg3-0000000H09D-32vR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:41:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 221E762423;
	Tue, 21 Oct 2025 12:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AFDC4CEFF;
	Tue, 21 Oct 2025 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761050480;
	bh=+KrQ8+/Xpeyyg0XnnZnoOXc5K2eE7Yf3Idw+8Qii2j8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P8kbiDNknMZb/FC+i5v5f+TFVKK+HM/KGJTHGUFkJwM3orpLLSq+vpuZhATlyhVPp
	 Kzc2YTzXJJqczzz1z9sLQdClMg1HeLI1mcmXTT6/lLPPkhLOhZm6eioJqrQv36oJy6
	 PLE0gC19x+g6UoJN3oVY9RmI/FloI06eWdJsWKsG6CVKUXSVr7MjMFwYL05YAueJ3X
	 YyNHG8v0vQVbYX+vPi+pLgbwhVbNizAj8q777TlUPkv5F4OHm9MpAhSTtUACM6Uujg
	 3TThY0i2tXtfxI+Q8Sc6p5PryAXgUZAUf1r69b/aPRIO7o7/fJJbvNa0oGp93dsgzI
	 jd29mY0IyC2ig==
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
Subject: [PATCH v4 2/5] of/irq: Fix OF node refcount in of_msi_get_domain()
Date: Tue, 21 Oct 2025 14:41:00 +0200
Message-ID: <20251021124103.198419-3-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021124103.198419-1-lpieralisi@kernel.org>
References: <20251021124103.198419-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In of_msi_get_domain() if the iterator loop stops early because an
irq_domain match is detected, an of_node_put() on the iterator node is
needed to keep the OF node refcount in sync.

Add it.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>
---
 drivers/of/irq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 321d40ec229b..ee7d5f0842e8 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -774,8 +774,10 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
 
 	of_for_each_phandle(&it, err, np, "msi-parent", "#msi-cells", 0) {
 		d = irq_find_matching_host(it.node, token);
-		if (d)
+		if (d) {
+			of_node_put(it.node);
 			return d;
+		}
 	}
 
 	return NULL;
-- 
2.50.1



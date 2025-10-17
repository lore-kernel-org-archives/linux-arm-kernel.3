Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9023CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXhbXjbg9Bou7XFZx9Va+8DrZiTnOAeArbhWtGkh2B0=; b=bl8d2ROR5LBx0WCu47yGJm6xWd
	k1FIu597/tAM2dytz6mOpN0f+7gZZrodC6IZe8JkUkCS8/ceD6fpbgy8OXaxx6byQSep80Kt8B5gm
	ff0wSWHKJzFqcJ73j+4o8MUXWZj2ru1/HCqAc6mdnWLnzegwVlVxsMjrHc7BeZuclKIlNKWRHzjIe
	h0NAKWK5GTCITrEFO3HQ0Hl4zBiex7F8c7vJ+LhS0VD5CxwOlOQsFkVJS0AkRD/7aBMwgwl8xYXjO
	N55ZJAZXNhzNiPgxXCWdqjO1Bk9IoIhhCKJgwGJATQYF/2LP6A3hINb6C/oapabHBXPYiP3wBV18z
	2Y9Wz+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g8B-000000077k4-1boE;
	Fri, 17 Oct 2025 08:48:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g88-000000077he-2HFy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 08:48:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA46F604EE;
	Fri, 17 Oct 2025 08:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D40C113D0;
	Fri, 17 Oct 2025 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760690887;
	bh=XGXorEJawrWEzTdrR4D/nXvovbfYzhFoHVqFZYAEOXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m5QYaH/WEXygWVrPOjMqdEhRrPdFXruUYtqnHZ4Fmv8H3ZWEzwwid0w3JeLYbrv6k
	 8aWbPMNETE4+njNuSsGmJ06/LoOwD0Nf2sVekIfotn4vCR9sSAqEb0ogSuIIW0bneu
	 QdzoH+VyKUf+qiqScez0+3XbbPtYvx0qkWF1s/tAqdBtH7Ox7M13htnmRPMOy6dWU0
	 LwE4sGc7oVOD3yWiXmM4wBDEITiKazUQnJotUasF7MYeUbPp4Dv0EVjQ21pemjj+Yb
	 h5v8nvNYoSqzh9RMxijXBZB0v/mI4ZZQ6zyZ/wX/8vaphS4RZOS+hPO0P12uaO3MKe
	 A6Pg1Sedj6y1g==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
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
Subject: [PATCH v3 2/5] of/irq: Fix OF node refcount in of_msi_get_domain()
Date: Fri, 17 Oct 2025 10:47:49 +0200
Message-ID: <20251017084752.1590264-3-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017084752.1590264-1-lpieralisi@kernel.org>
References: <20251017084752.1590264-1-lpieralisi@kernel.org>
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
index e67b2041e73b..9f6cd5abba76 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -773,8 +773,10 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
 
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3D7CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PL1GDMmY/bx2opAVMcTQBAEMy2JUIM5NtAnnBh5UMfM=; b=btcZv0ceZ4MxTpM4pSVfhhSUbv
	1T3VOm7P17nCFdtxlZMiktIs18QDNRy8f7RqgdrkH4HCZRaYlBRF/hIGs1MFHubx74N4XObYVCIuj
	1TohF4q/E3+IE7LBw+1BiqLUFanHIMxfj2OEBUVt3pwMDsqdapLvZX+HIh51alHWlkvBYHK37y5vL
	zT3EAUP5UkK/NeKC3IEapT9ykDULFvXE8U/qcctIPtKfAl10WGKpHQ1jZMdKlpIObiN4UHrLuWNHA
	20AHiaOm/DaH+BVyp+lV+mPL7GQXpFw773bsAmozi/uvukDOnXLDbxyZkYI3CK5bRZmZKwZwN6JGV
	T9sxDWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bo6-0000000FqPd-3Bzd;
	Tue, 14 Oct 2025 09:59:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bo4-0000000FqOC-2RSf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 09:59:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 492FF45B7D;
	Tue, 14 Oct 2025 09:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667EBC16AAE;
	Tue, 14 Oct 2025 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435940;
	bh=T1moSDjDx6AIFQ4/WCSXt0NBcwIuqhZV4QnKZW8jK0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MMnrRDku3v2pqZdglfonyg3bHwZ+UdM1d/NZeQMlHg6s9RC4KL8bXP59YarcKXwEm
	 lrRp2iCjsFsW5B0DY61+FEKqnKAd0xc1mZtakjX2rS+jIOTQG1CGdq70q2zB6bARYE
	 rvG2fdupt7AY0Fp/7sGYeqjs8tbJ7+pMbJBnImjRfAz8V7463irI+JhMAs4+RHkN/y
	 6MkkU3nxUlFsxStckBODhVCB254o+nozhu+GrvoOuNxnM5VYtCp/C4/P9hW+46NVrt
	 UUUfgkPCOhw2uwOt1+cLc8z/CoaimVjnyJEIWf+HmmY9iewa5C2L1y9Yz0evvbUTaS
	 Otv77qBqsc54Q==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ray Jui <rjui@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 2/4] of/irq: Fix OF node refcount in of_msi_get_domain()
Date: Tue, 14 Oct 2025 11:58:43 +0200
Message-ID: <20251014095845.1310624-3-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014095845.1310624-1-lpieralisi@kernel.org>
References: <20251014095845.1310624-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_025900_637877_A7BD4B96 
X-CRM114-Status: GOOD (  11.89  )
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



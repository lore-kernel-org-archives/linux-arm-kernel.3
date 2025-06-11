Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA949C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOcA8JVEjHxy7SXGk73izLSpZeUh6cImIEszSD+A3x8=; b=JE0QeHraOj9s8/288wA2PJzO8r
	gvjVI5CMFiDg/r49xUHcRuIyDy9HJ1/ICeCt1Yq7XUhz/Q0PkPnAvqWIpiW8l0VEr/Gtg/K9dH6M7
	n7zBVmki7GLRMe9Xqvk0aKaDa9v2vG7YzFDOZLO0fDqXlQOoO1rbsUT0pP+ntgMgnwSsmk/4MXlcO
	azKvtbZONXbGlZ0HYssux6PeNitsK3EdjEDA4gvihucQ+UGi+g7hF+OyqqH6V391fpuplOpHwoImr
	gh3SE3WmkIkcHL0hAlxUSCvGtHlIlUQkE/WIIZKu40aVNtmcc3XufnT/XDmZzHEOHp2TuEEg+KGtT
	38lElBaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNmN-0000000ATQL-1kZq;
	Wed, 11 Jun 2025 15:54:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIwl-00000009e7H-1lU1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:44:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB990A51682;
	Wed, 11 Jun 2025 10:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC8EC4CEF2;
	Wed, 11 Jun 2025 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638682;
	bh=NLnT5+LOFbAWdUD6OEeMhq8wMEwsqTEbDWDE/LB5oWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bhJu2rvffdhuDVYngs0/mJHh/Ii4qb2QtctIipm4DBUJclR7bsCSEQGuTxOzsfrfd
	 Tn7OMefVMV6axO7RrfvnO8OMXp5QKHdplyCFpuiVX3N9XIeci0hEtQCurRRXEoNS47
	 5oZjNV8VHM9DH7/3p/qvdnQz1P7LRnMlqmILblb6ZJAW41cFP8LhyauvBLQrtkAfWY
	 nm5aGIbCO8SY0LuJpQe5iQZ1I9feFo0r+Vho7MCYLp7c6CU4howsxj+6Yr+olrWmg6
	 evu2rEF7aJz8wsiiOu7o+21ahm9P3mc3P2Ioqhcq69dKyjhSWfLsmpSZ15C0ivm/ty
	 yuu2qvRW95l+A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] soc: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:47 +0200
Message-ID: <20250611104348.192092-19-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_034443_541997_5283DF07 
X-CRM114-Status: GOOD (  13.64  )
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

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org

---
Cc: linux-tegra@vger.kernel.org
---
 drivers/soc/fsl/qe/qe_ic.c | 3 +--
 drivers/soc/tegra/pmc.c    | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 4068b501a3a3..943911053af6 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -407,7 +407,6 @@ static int qe_ic_init(struct platform_device *pdev)
 	void (*high_handler)(struct irq_desc *desc);
 	struct qe_ic *qe_ic;
 	struct resource *res;
-	struct device_node *node = pdev->dev.of_node;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (res == NULL) {
@@ -441,7 +440,7 @@ static int qe_ic_init(struct platform_device *pdev)
 		high_handler = NULL;
 	}
 
-	qe_ic->irqhost = irq_domain_create_linear(of_fwnode_handle(node), NR_QE_IC_INTS,
+	qe_ic->irqhost = irq_domain_create_linear(dev_fwnode(&pdev->dev), NR_QE_IC_INTS,
 						  &qe_ic_host_ops, qe_ic);
 	if (qe_ic->irqhost == NULL) {
 		dev_err(dev, "failed to add irq domain\n");
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e0d67bfe955c..9543bee0c321 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2500,8 +2500,7 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
 	pmc->irq.irq_set_type = pmc->soc->irq_set_type;
 	pmc->irq.irq_set_wake = pmc->soc->irq_set_wake;
 
-	pmc->domain = irq_domain_create_hierarchy(parent, 0, 96,
-						  of_fwnode_handle(pmc->dev->of_node),
+	pmc->domain = irq_domain_create_hierarchy(parent, 0, 96, dev_fwnode(pmc->dev),
 						  &tegra_pmc_irq_domain_ops, pmc);
 	if (!pmc->domain) {
 		dev_err(pmc->dev, "failed to allocate domain\n");
-- 
2.49.0



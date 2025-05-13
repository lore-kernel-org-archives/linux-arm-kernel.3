Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF58C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XywPm1hYfLaxczZNPLcKe14jSc1x8ueteSqOLhNMCFA=; b=4ks909Tugj/OUmpzIcehx4JDc/
	hTU0SelAUzevte56wnik+RNMlq2LuWqIIEz8JcraIDe3cTf5hIZIBRmqQHuNnVZk5dH+O+0pU4Poe
	Zvos1ousimOBV/7QzJDwLM/ZLIYa09L6No+bj62LJtKoPo0d3dUXFrf9TLVXBVQmwgO0DalIXCwP8
	HQZ1VVNNeQ+QJSYpm8evtmm3XYJNevnUI3uoKtu6LtpWSErlvDuk+iDwz6LY2PXAcBHW40aNWZnpx
	a9V8JXKTzBWUpoTfQhsk+sTFfm6TUyk9NcKZgSwVxwZzn6KqaZcrHj5c/DZgskWZHmYhmdeC6P4NV
	R6OsH7FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsoG-0000000CzXH-16hB;
	Tue, 13 May 2025 16:48:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsXp-0000000Cvv0-2K6y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7E84A4DA35;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B35BC4CEF5;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747153912;
	bh=5YnLuW4gz7cYBwmJ4dAR13BTuttnlScp3AJ2nVWpIOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=md5u7IbZqXvOU/Kx+Gy17zrOrU35ta7gml8kWoB5xRMwCAMx8uj3mYTrLLQMwNTMg
	 rlADE+MFc3dfObEs2QiRLKgr/r7Jr6GxlS24GMZgAOU1yyC+/z5dznGRGJ9LOFwZp9
	 3wTisr7Tr4EZQPyK+z3gGvqc5gYz6fX9et4LbVAMQe9y377hvtUKswz6eAKFVeXbFe
	 ir1oPkZhAcQ9EWuxL37my5rFeXWpfJLL4Dl6zZhj9vleNW0XowCRLv1L6pyLf16rCD
	 7HH27Wyy6xh3+U51T3wqgavV1GAYqw0+csEcxjV/vkhhcIF51Y+0raJvGNCHp9M7IZ
	 /D47zCDtyk14g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEsXm-00EaLc-HK;
	Tue, 13 May 2025 17:31:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH v2 4/5] genirq/msi: Engage the .msi_teardown() callback on domain removal
Date: Tue, 13 May 2025 17:31:43 +0100
Message-Id: <20250513163144.2215824-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250513163144.2215824-1-maz@kernel.org>
References: <20250513163144.2215824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, lpieralisi@kernel.org, sascha.bischoff@arm.com, timothy.hayes@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_093153_715363_8E3F0F25 
X-CRM114-Status: GOOD (  10.84  )
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

Kindly inform the MSI driver that we are tearing down the domain,
providing the allocation context previously populated on domain
creation.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 kernel/irq/msi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 07eb857efd15e..8f3d9f5ff1eb4 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1096,6 +1096,9 @@ void msi_remove_device_irq_domain(struct device *dev, unsigned int domid)
 
 	dev->msi.data->__domains[domid].domain = NULL;
 	info = domain->host_data;
+
+	info->ops->msi_teardown(domain, info->alloc_data);
+
 	if (irq_domain_is_msi_device(domain))
 		fwnode = domain->fwnode;
 	irq_domain_remove(domain);
-- 
2.39.2



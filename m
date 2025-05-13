Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A39CC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlNCxhd/IUJQkMpc327D6n/Mhd1fghbTwG6zUflT1Lw=; b=I9p0B4AjEMbicEZmRofkD8xUz8
	iq7uEuIxqHouf2PQ2+q4ie+gU66URo740cSG/YUD3QiHvqlte1DloWDIgFFVN8a9OaAmhBAflwc9J
	npJnDWgZWYbsltInYwjBmOOpszOW2NQUQYi24AZAKgs0PG5HBcG3urOpFycwnQJoFiuOnyo2sWx7W
	wxPIX8nNKDaCYfXLRqyem6Jmyl3+i3uuu7YdAN2urcOqPKnUTciXwx1iybx9n4ZcDEuc5k4ygxYPK
	bW8AVzbrOGE97bbt0MvwyxWSMRoMMFYzg1+sjjXZml4HpvfcYmO99usLZWyGOAIXYnN4KolTyDnnB
	jPwG/G6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsqL-0000000CzjU-03ZF;
	Tue, 13 May 2025 16:51:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsXp-0000000Cvuy-20t0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D9E85C6B18;
	Tue, 13 May 2025 16:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718F3C4CEEF;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747153912;
	bh=17/pUMQ3E5yHwJFwSxMS9cCKFYZ8IU9JtUyr4n/x9f4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKIAKPyZNE8558Z0epfjFt5ZcJ86ATAzkd0LRVgH/k9K3aQh9Co/nhlK4dMRY6vUn
	 AvZhb5tu72Wio6HMJqBQtu/VVP3dVo9ZFVPXtExMv8Bjem4k/og61Pf/DNGsMuYJ+1
	 8yPxs5+mZGuqu8p3tbL/G9VIcoXr/+xpCPsoXV6D2kLg2LzROHVoSVdWjnYlkFNhEa
	 0c3Czuh+7tsWlcmW0UI0x+MU880Usim2vVLQzpMQnzDB4Lz2Qi6Oot0BOVyQo+uoe6
	 OSWbFcu3WHMCW35JdgExQLCD8jfgNTsAzMd/goD7ku2VilZr3a6FErGGrJYvtWMJHa
	 zBFeoiRdtKvlA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEsXm-00EaLc-Mi;
	Tue, 13 May 2025 17:31:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH v2 5/5] irqchip/gic-v3-its: Use allocation size from the prepare call
Date: Tue, 13 May 2025 17:31:44 +0100
Message-Id: <20250513163144.2215824-6-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250513_093153_691902_B4FACDC6 
X-CRM114-Status: GOOD (  14.87  )
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

Now that .msi_prepare() gets called at the right time and not
with semi-random parameters, remove the ugly hack that tried
to fix up the number of allocated vectors.

It is now correct by construction.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v3-its-msi-parent.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its-msi-parent.c b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
index 958736622fa57..6a5f64f120d4a 100644
--- a/drivers/irqchip/irq-gic-v3-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
@@ -67,17 +67,6 @@ static int its_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
 	/* ITS specific DeviceID, as the core ITS ignores dev. */
 	info->scratchpad[0].ul = pci_msi_domain_get_msi_rid(domain->parent, pdev);
 
-	/*
-	 * @domain->msi_domain_info->hwsize contains the size of the
-	 * MSI[-X] domain, but vector allocation happens one by one. This
-	 * needs some thought when MSI comes into play as the size of MSI
-	 * might be unknown at domain creation time and therefore set to
-	 * MSI_MAX_INDEX.
-	 */
-	msi_info = msi_get_domain_info(domain);
-	if (msi_info->hwsize > nvec)
-		nvec = msi_info->hwsize;
-
 	/*
 	 * Always allocate a power of 2, and special case device 0 for
 	 * broken systems where the DevID is not wired (and all devices
@@ -151,14 +140,6 @@ static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
 	/* ITS specific DeviceID, as the core ITS ignores dev. */
 	info->scratchpad[0].ul = dev_id;
 
-	/*
-	 * @domain->msi_domain_info->hwsize contains the size of the device
-	 * domain, but vector allocation happens one by one.
-	 */
-	msi_info = msi_get_domain_info(domain);
-	if (msi_info->hwsize > nvec)
-		nvec = msi_info->hwsize;
-
 	/* Allocate at least 32 MSIs, and always as a power of 2 */
 	nvec = max_t(int, 32, roundup_pow_of_two(nvec));
 
-- 
2.39.2



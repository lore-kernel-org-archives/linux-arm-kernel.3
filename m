Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38134C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4E4kdc+QexrgcK+1+23uTFNROvNaQge4T/FiQ7EYK8=; b=3Dl4HLkrXO0u627+Q7Xb4KQfcX
	bxREKSSw4lirkLdfI6kTz1dy0zooKYr7SebK/6B0dXXJR3W61T0OvxLgvonA3Gy8/HTlEH7Gy0JF5
	wiJ2hvKgmQk0SmQiFoboa7zn68SOUtvIA1emqaweErenV1VNgZ209wg20GJVMONjdjUac5FYStcG4
	1q91WL4pzuyrdCHpRL3S9kqCOass8evzYRXzYi/AoiCbEm45HzerQ6ZfGRNYbDkzRWopY2Z+4IBtT
	YeDrDVUmSRMCUsUw0dDu9GO5vPZGb30VBFpA55petNoAe/na1SbNjZZUBsvoy1FavD1gBIsU56KBj
	K3pC4PEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEshy-0000000CyR3-40Y7;
	Tue, 13 May 2025 16:42:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsXp-0000000Cvuj-0Dfv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:31:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60C19A4DA28;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0384CC4CEED;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747153912;
	bh=RcZzjfbX3puoN0l0SuXE8X3V8BVXm+FxxK0G7lqM4z8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DVeIbSW8TnkKNmuUizY8RG+l6Zonk3cN72jhwf9HqSXsapUKLlJ8AwnqBF8PdLSK2
	 RNVRdIhNl3pFvXk27FMO+0e9Q3tBJJ4bxDEO9MSVfUSADpgt7y00e79e8kATICEZye
	 /+FTm7r3OuG7Ylo1gwiI5LYo8nAUGhGsnCYPDivZm8EJa3S2JiT3AjR4mvdhkFdsyP
	 CvXB/RWkWiGC12sPNmN6vkSUw6Qy788qBtezjaBjmI5sZhP59ypUmaqe9RfNDuTMyh
	 7cIJ302UJ9x9j9JEkmZYDmBhA/C8dQFgNAfL0EOlMAlHbIa7sILgVtQBpGkbb1Hgqw
	 gSNgGsHdXCnCw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEsXm-00EaLc-0g;
	Tue, 13 May 2025 17:31:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH v2 1/5] genirq/msi: Add .msi_teardown() callback as the reverse of .msi_prepare()
Date: Tue, 13 May 2025 17:31:40 +0100
Message-Id: <20250513163144.2215824-2-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250513_093153_222276_2A55FB89 
X-CRM114-Status: GOOD (  19.03  )
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

While the MSI ops do have a .msi_prepare() callback that is
responsible for setting up the relevant (usually per-device)
allocation, there is no callback reversing this setup.

For this purpose, add .msi_teardown() callback.

In order to avoid breaking the ITS driver that suffers from related
issues, do not call the call back just yet.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/msi.h | 10 ++++++++--
 kernel/irq/msi.c    |  8 ++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index 8c0ec9fc05a39..63c23003ec9b7 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -423,6 +423,7 @@ struct msi_domain_info;
  * @msi_init:		Domain specific init function for MSI interrupts
  * @msi_free:		Domain specific function to free a MSI interrupts
  * @msi_prepare:	Prepare the allocation of the interrupts in the domain
+ * @msi_teardown:	Reverse the effects of @msi_prepare
  * @prepare_desc:	Optional function to prepare the allocated MSI descriptor
  *			in the domain
  * @set_desc:		Set the msi descriptor for an interrupt
@@ -438,8 +439,9 @@ struct msi_domain_info;
  * @get_hwirq, @msi_init and @msi_free are callbacks used by the underlying
  * irqdomain.
  *
- * @msi_check, @msi_prepare, @prepare_desc and @set_desc are callbacks used by the
- * msi_domain_alloc/free_irqs*() variants.
+ * @msi_check, @msi_prepare, @msi_teardown, @prepare_desc and
+ * @set_desc are callbacks used by the msi_domain_alloc/free_irqs*()
+ * variants.
  *
  * @domain_alloc_irqs, @domain_free_irqs can be used to override the
  * default allocation/free functions (__msi_domain_alloc/free_irqs). This
@@ -461,6 +463,8 @@ struct msi_domain_ops {
 	int		(*msi_prepare)(struct irq_domain *domain,
 				       struct device *dev, int nvec,
 				       msi_alloc_info_t *arg);
+	void		(*msi_teardown)(struct irq_domain *domain,
+					msi_alloc_info_t *arg);
 	void		(*prepare_desc)(struct irq_domain *domain, msi_alloc_info_t *arg,
 					struct msi_desc *desc);
 	void		(*set_desc)(msi_alloc_info_t *arg,
@@ -489,6 +493,7 @@ struct msi_domain_ops {
  * @handler:		Optional: associated interrupt flow handler
  * @handler_data:	Optional: associated interrupt flow handler data
  * @handler_name:	Optional: associated interrupt flow handler name
+ * @alloc_data:		Optional: associated interrupt allocation data
  * @data:		Optional: domain specific data
  */
 struct msi_domain_info {
@@ -501,6 +506,7 @@ struct msi_domain_info {
 	irq_flow_handler_t		handler;
 	void				*handler_data;
 	const char			*handler_name;
+	msi_alloc_info_t		*alloc_data;
 	void				*data;
 };
 
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 2b3ef2333dbc8..a3b34c3c599be 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -795,6 +795,11 @@ static int msi_domain_ops_prepare(struct irq_domain *domain, struct device *dev,
 	return 0;
 }
 
+static void msi_domain_ops_teardown(struct irq_domain *domain,
+				    msi_alloc_info_t *arg)
+{
+}
+
 static void msi_domain_ops_set_desc(msi_alloc_info_t *arg,
 				    struct msi_desc *desc)
 {
@@ -820,6 +825,7 @@ static struct msi_domain_ops msi_domain_ops_default = {
 	.get_hwirq		= msi_domain_ops_get_hwirq,
 	.msi_init		= msi_domain_ops_init,
 	.msi_prepare		= msi_domain_ops_prepare,
+	.msi_teardown		= msi_domain_ops_teardown,
 	.set_desc		= msi_domain_ops_set_desc,
 };
 
@@ -841,6 +847,8 @@ static void msi_domain_update_dom_ops(struct msi_domain_info *info)
 		ops->msi_init = msi_domain_ops_default.msi_init;
 	if (ops->msi_prepare == NULL)
 		ops->msi_prepare = msi_domain_ops_default.msi_prepare;
+	if (ops->msi_teardown == NULL)
+		ops->msi_teardown = msi_domain_ops_default.msi_teardown;
 	if (ops->set_desc == NULL)
 		ops->set_desc = msi_domain_ops_default.set_desc;
 }
-- 
2.39.2



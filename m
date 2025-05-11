Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8BBC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 16:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aV31C/PSmnYZr6vn4CCQ6KI3WLviTXrOVrHd4rpTG5U=; b=F2yKgatA4uaIuWJy7UBChwXtt9
	gmPihUuT1KNihHr0uWQYzrUioDBKPevECSXfRjyDgVhrS9wIhJtDS5pAMwS6yDk4tfmBrw7em4K6s
	YKJ2VChMB9WNQIhGrtqA0OrSEQhR8s2f+e2QDnXFZTxlhgCF+U12gvJTr3EFATuja7/GNeSJBtwJ1
	G4UIDE/F3l/bImos9OVYKigqQ99wYVNu9Ac81W3C1juP8LdaVmwTbKQWMKi6A6mkID4Qf3mTxCqF2
	EoTHvJ9jiy+PLolAbWGKpcJrZpImQvUzs90J2L2YB9TBsrvJ/wu3M2TzGIRPUTAaYdULEM3M+mKug
	AA2QyI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9jb-00000007Wzj-15Om;
	Sun, 11 May 2025 16:41:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9eC-00000007WHr-2ZEu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 16:35:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E5CB5C25CC;
	Sun, 11 May 2025 16:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22E4C4CEE7;
	Sun, 11 May 2025 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746981327;
	bh=GaOQnEbLL9GZs6ot00bxwo1vTakAiiwicLKpRgJPfmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fTTKFRdM3VnzPD88jFOf2OV/Rw99Y5XQlU1eZ6IgHDHKwj6ZnakTwEXRbIWvqGMFQ
	 qJsyHuz6iw2qAOIeJylFbITR9Ls2d3geAGDGwJ4aQLjQGYG7vNLm96albse7nEdLje
	 wESOJmauQV1z8L3epNxV85hxSCVp2SC3PZAf+jtlWoSQjlnab9xG+JXr/jnGJNteL2
	 67f2x0zVBwuUb/m+3LMKlsu80JJGqH2Tn9l+nZ2yt7oqTtCFV/xt3zDU2vnlus6pCI
	 guT6JyN6qv6lvLzDPrJarxXzRgSlp6ZE6yPZ3qx6yibhOD9KkfLsLK+RyTxXZeb0EC
	 TksPyGnhgkvgA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uE9e8-00Dt22-L7;
	Sun, 11 May 2025 17:35:24 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH 1/4] genirq/msi: Add .msi_teardown() callback as the reverse of .msi_prepare()
Date: Sun, 11 May 2025 17:35:17 +0100
Message-Id: <20250511163520.1307654-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250511163520.1307654-1-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, lpieralisi@kernel.org, sascha.bischoff@arm.com, timothy.hayes@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_093528_740088_C52EE82C 
X-CRM114-Status: GOOD (  18.47  )
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
allocation, we don't have a callback reversing this setup.

For this purpose, let's a .msi_teardown() callback. This is
reliying on the msi_domain_info structure having a non-NULL
alloc_data field.

Nobody is populating this field yet, so there is no change
in behaviour yet.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/msi.h | 10 ++++++++--
 kernel/irq/msi.c    | 12 ++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index 86e42742fd0fb..0a44a2cba3105 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -420,6 +420,7 @@ struct msi_domain_info;
  * @msi_init:		Domain specific init function for MSI interrupts
  * @msi_free:		Domain specific function to free a MSI interrupts
  * @msi_prepare:	Prepare the allocation of the interrupts in the domain
+ * @msi_teardown:	Reverse the effects of @msi_prepare
  * @prepare_desc:	Optional function to prepare the allocated MSI descriptor
  *			in the domain
  * @set_desc:		Set the msi descriptor for an interrupt
@@ -435,8 +436,9 @@ struct msi_domain_info;
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
@@ -458,6 +460,8 @@ struct msi_domain_ops {
 	int		(*msi_prepare)(struct irq_domain *domain,
 				       struct device *dev, int nvec,
 				       msi_alloc_info_t *arg);
+	void		(*msi_teardown)(struct irq_domain *domain,
+					msi_alloc_info_t *arg);
 	void		(*prepare_desc)(struct irq_domain *domain, msi_alloc_info_t *arg,
 					struct msi_desc *desc);
 	void		(*set_desc)(msi_alloc_info_t *arg,
@@ -486,6 +490,7 @@ struct msi_domain_ops {
  * @handler:		Optional: associated interrupt flow handler
  * @handler_data:	Optional: associated interrupt flow handler data
  * @handler_name:	Optional: associated interrupt flow handler name
+ * @alloc_data:		Optional: associated interrupt allocation data
  * @data:		Optional: domain specific data
  */
 struct msi_domain_info {
@@ -498,6 +503,7 @@ struct msi_domain_info {
 	irq_flow_handler_t		handler;
 	void				*handler_data;
 	const char			*handler_name;
+	msi_alloc_info_t		*alloc_data;
 	void				*data;
 };
 
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index c05ba7ca00faa..a65ccf19b15d9 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -796,6 +796,11 @@ static int msi_domain_ops_prepare(struct irq_domain *domain, struct device *dev,
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
@@ -821,6 +826,7 @@ static struct msi_domain_ops msi_domain_ops_default = {
 	.get_hwirq		= msi_domain_ops_get_hwirq,
 	.msi_init		= msi_domain_ops_init,
 	.msi_prepare		= msi_domain_ops_prepare,
+	.msi_teardown		= msi_domain_ops_teardown,
 	.set_desc		= msi_domain_ops_set_desc,
 };
 
@@ -842,6 +848,8 @@ static void msi_domain_update_dom_ops(struct msi_domain_info *info)
 		ops->msi_init = msi_domain_ops_default.msi_init;
 	if (ops->msi_prepare == NULL)
 		ops->msi_prepare = msi_domain_ops_default.msi_prepare;
+	if (ops->msi_teardown == NULL)
+		ops->msi_teardown = msi_domain_ops_default.msi_teardown;
 	if (ops->set_desc == NULL)
 		ops->set_desc = msi_domain_ops_default.set_desc;
 }
@@ -1088,6 +1096,10 @@ void msi_remove_device_irq_domain(struct device *dev, unsigned int domid)
 
 	dev->msi.data->__domains[domid].domain = NULL;
 	info = domain->host_data;
+
+	if (info->alloc_data)
+		info->ops->msi_teardown(domain, info->alloc_data);
+
 	if (irq_domain_is_msi_device(domain))
 		fwnode = domain->fwnode;
 	irq_domain_remove(domain);
-- 
2.39.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92B1C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 17:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXARjxbJ868h4zMx6ZYJEciNDJpMwBVbX7fEfOyr9/s=; b=lQHXrYrJBf3LY6CtWWp+X7I+Vt
	U+H4hnHSW1/yHFGWkXpgiOsTIa1AsToZKAaou9MRwb8qL4Xd1JZgQmGBmvWeHPJZ64r715efYquyR
	XTlK2IFafjYlPCgNlWJnLWA0E8UCL6DNJ8hn2Ii0CdhxRwt6vCxk80ycI0pUZEIRD5g4rf7MT+tSl
	scCJ6VjYpOdEKhLzewWwZQ9HA5BoPt2emOTZvBRLToa/gbnQJOH7ElJiLUYL0/E41E/qZv/2Z2oL6
	TIfblsBY0zAa4C2/FTTs9bQNWiioRmsENmuKzJMPFGAPsn8JwxmdHs42Wky+Z141DHEZnE+gTtUgF
	1CSV66Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtaI-0000000D7QV-3hO7;
	Tue, 13 May 2025 17:38:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtQd-0000000D5cB-1mY4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:28:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 853F6448AD;
	Tue, 13 May 2025 17:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C17CC4CEF0;
	Tue, 13 May 2025 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747157310;
	bh=S6Ff81MD23ujzW5xAirjeHQsiPS7s/q55XaQYWojlYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jyq8BCiX/3xyRfa3lsPePerZ4XYr2gQBFZqvmeb7/qKSW75wAxFL6fUXhfVSUEUc6
	 b/GKae5N+5Ixi29qAZpnKUICt1ts6fYpNH8l+KOb9Y0l56+4Zu8Vm/W8kk429CRNVb
	 bBRUlQEguuK0QbspT19D7PjzXmmgNc3YdTVLYCbFax9QqHuEi7WOl9pqq3iGdY2WSs
	 Sc1etVrBqzkn+UHZQR/yjkRhhhv4NYUcDn9FngvI1M94j/iXNbKYqkvJkXJ3DGUMQA
	 4WEDgsbwaho1o4A0O3n8IpGC7iQIbgSKHn+DXy3W/4DNMlbIOKkLH68Gnwh0G5RYeT
	 MG7B7f0Sj1zoA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEtQa-00EbRz-AA;
	Tue, 13 May 2025 18:28:28 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 2/9] genirq/msi: Add helper for creating MSI-parent irq domains
Date: Tue, 13 May 2025 18:28:12 +0100
Message-Id: <20250513172819.2216709-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250513172819.2216709-1-maz@kernel.org>
References: <20250513172819.2216709-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, tglx@linutronix.de, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, toan@os.amperecomputing.com, alyssa@rosenzweig.io, thierry.reding@gmail.com, jonathanh@nvidia.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_102831_503763_FF1104EA 
X-CRM114-Status: GOOD (  13.66  )
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

Creating an irq domain that serves as an MSI parent requires
a substantial amount of esoteric boiler-plate code, some of
which is often provided twice (such as the bus token).

To make things a bit simpler for the unsuspecting MSI tinkerer,
provide a helper that does it for them, and serves as documentation
of what needs to be provided.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/msi.h |  4 ++++
 kernel/irq/msi.c    | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index 8c0ec9fc05a39..56c69d14ef4a2 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -628,6 +628,10 @@ struct irq_domain *msi_create_irq_domain(struct fwnode_handle *fwnode,
 					 struct msi_domain_info *info,
 					 struct irq_domain *parent);
 
+struct irq_domain_info;
+struct irq_domain *msi_create_parent_irq_domain(struct irq_domain_info *info,
+						const struct msi_parent_ops *msi_parent_ops);
+
 bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
 				  const struct msi_domain_template *template,
 				  unsigned int hwsize, void *domain_data,
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index a8f7701c2929f..e702e536c8034 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -903,6 +903,32 @@ struct irq_domain *msi_create_irq_domain(struct fwnode_handle *fwnode,
 	return __msi_create_irq_domain(fwnode, info, 0, parent);
 }
 
+/**
+ * msi_create_parent_irq_domain - Create an MSI-parent interrupt domain
+ * @info:		MSI irqdomain creation info
+ * @msi_parent_ops:	MSI parent callbacks and configuration
+ *
+ * Return: pointer to the created &struct irq_domain or %NULL on failure
+ */
+struct irq_domain *msi_create_parent_irq_domain(struct irq_domain_info *info,
+						const struct msi_parent_ops *msi_parent_ops)
+{
+	struct irq_domain *d;
+
+	info->hwirq_max		= max(info->hwirq_max, info->size);
+	info->size		= info->hwirq_max;
+	info->domain_flags	|= IRQ_DOMAIN_FLAG_MSI_PARENT;
+	info->bus_token		= msi_parent_ops->bus_select_token;
+
+	d = irq_domain_instantiate(info);
+	if (IS_ERR(d))
+		return NULL;
+
+	d->msi_parent_ops = msi_parent_ops;
+	return d;
+}
+EXPORT_SYMBOL_GPL(msi_create_parent_irq_domain);
+
 /**
  * msi_parent_init_dev_msi_info - Delegate initialization of device MSI info down
  *				  in the domain hierarchy
-- 
2.39.2



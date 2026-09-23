Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABCAC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzP4sAc+QEd6N2Rrf644vF3EpqR7lb90v2jCieXNJwg=; b=0KMRVfjoonqGXZPVL55j0+dF+c
	MAdl/s8pwML3/zi+Ni/kKZvXiioYxnLu6hAqkidAkajUjrJVdpDgMB4M2kgBcuuRfb4TCaGya1lbX
	eOQnycq/BOY3aWUDPMj7DJyuTbF+kjYO1hb9Yzdy3uTETx1AbSnIG+KV62zUTSCn0ZglhFwC2jIUc
	0thCgqSKjfM/3DdmcwO19Exbu2hOiuXmRWuMitHU8etO09AWlIoYMEUxCdgzp5VuL3NLAUOlZuDE6
	8PwE7VqyXzUj+OLGUPVeLzmxJWNeTWWRDR1SPq28ScxCTB3CCLjLbtcsfXgMwBzs5IsFuvmUWrBq0
	pQ9V/4Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IU6-00000007YSA-3q0m;
	Wed, 23 Sep 2026 08:37:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IU4-00000007YQl-3IjA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 08:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vzP4sAc+QEd6N2Rrf644vF3EpqR7lb90v2jCieXNJwg=; b=jhYkKZEIqZ48IGU7mDXW9mjbfB
	GyobKb7/YVZD+A80RpfzV2kaeMgaoPwqBwhzzKVSH9IyHN4eXvc9JmoCIX4osj0eumkgHnVdB020D
	kop7Qx08oo/nR7JvLwIN/E/8pCFMw6V+xaDiAKYu4k6wp+37AuQR+/Y3TKvaQ/4eaXs2k7EPoS1NN
	sjvSxUcjZu/CTLPe0PzyIkqjXPCgkESksQ6MPSZ1LUpn1PisG6YvFeiEo/F11RKIYWm9RzTAvFCnO
	MTU8Ue0al3on62wcMqGS79tDws2U/R6uIF9A+QeftINgvxvBwho13l+50pavRsKMyKTS6+fE1V9Kv
	BHygduug==;
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9ITs-0000000EX7Q-3fj4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790152652; x=1821688652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vzP4sAc+QEd6N2Rrf644vF3EpqR7lb90v2jCieXNJwg=;
  b=a5lg+BpTEtGO2uYtf3923ImnIXe6iX3pqE3LB7a0M1Mqn2Zg1K16GxFv
   SgU86Sq4bZHJMjnlhEOy7Bmtz8pa1gSQSYWbOU+mWHWvM0ZVvSO3RjAKD
   /ASdrywjQXpn7+jtiCPOR7k6LR2pY3cmrkKY3fXIz2ABjHnmD/ncms7g3
   XFHksSyrflMK25D7QYpXz8/So8+xCd2yQrwPklsgeCIHnwWiGyhpx83NL
   AMrD/3+5XinXxkbxVzFXeN/4GVNWgI4jtPwIqeUvG9xt9iO7eB43i+uFx
   gWFFYH5jDl6yUY+jWYBMh+AHYm1uqlr/yqkVDKKX3PNeUO/JZcH68FrvT
   A==;
X-CSE-ConnectionGUID: yKqgrZgVRoehWzb7KbNZOQ==
X-CSE-MsgGUID: YTxlBIf7Qva40P0vbJq0Cg==
X-IronPort-AV: E=Sophos;i="6.27,118,1787011200"; 
   d="scan'208";a="29457104"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:37:16 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:6659]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.35.200:2525] with esmtp (Farcaster)
 id 5857cd88-a10f-427e-8576-0d37b6980452; Wed, 23 Sep 2026 08:37:16 +0000 (UTC)
X-Farcaster-Flow-ID: 5857cd88-a10f-427e-8576-0d37b6980452
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 08:37:15 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 08:37:14 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH 4/4] irqchip/alpine-msi: Add debug logging for MSI allocation
Date: Wed, 23 Sep 2026 08:37:03 +0000
Message-ID: <20260923083703.38974-5-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923083703.38974-1-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D033UWA004.ant.amazon.com (10.13.139.85) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_093736_695335_BDC2F41A 
X-CRM114-Status: GOOD (  12.46  )
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

Add log messages to help follow the driver flow when debugging: an
info message on successful initialisation, and debug messages on the
MSI interrupt allocation and free paths.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/irqchip/irq-alpine-msi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 8155f63cfd29..0e68f81014e7 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -104,6 +104,8 @@ static int alpine_msix_middle_domain_alloc(struct irq_domain *domain, unsigned i
 	struct alpine_msix_data *priv = domain->host_data;
 	int sgi, err, i;
 
+	pr_debug("trying to allocate %d msi starting from %d\n", nr_irqs, virq);
+
 	sgi = alpine_msix_allocate_sgi(priv, nr_irqs);
 	if (sgi < 0)
 		return sgi;
@@ -116,6 +118,9 @@ static int alpine_msix_middle_domain_alloc(struct irq_domain *domain, unsigned i
 		irq_domain_set_hwirq_and_chip(domain, virq + i, sgi + i,
 					      &middle_irq_chip, priv);
 	}
+
+	pr_debug("allocated %d msi starting from %d\n", nr_irqs, virq);
+
 	return 0;
 
 err_sgi:
@@ -132,6 +137,8 @@ static void alpine_msix_middle_domain_free(struct irq_domain *domain, unsigned i
 
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 	alpine_msix_free_sgi(priv, d->hwirq, nr_irqs);
+
+	pr_debug("freed %d msi starting from %d\n", nr_irqs, virq);
 }
 
 static const struct irq_domain_ops alpine_msix_middle_domain_ops = {
@@ -235,6 +242,9 @@ static int alpine_msix_init(struct device_node *node, struct device_node *parent
 	if (ret)
 		return ret;
 
+	pr_info("initialized successfully, spi %d to %d\n",
+		priv->spi_first, priv->spi_first + priv->num_spis - 1);
+
 	retain_and_null_ptr(priv);
 	retain_and_null_ptr(msi_map);
 	return 0;
-- 
2.47.3



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63083C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 05:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qGQOt9zJY1AhXD9o4NBc7iKeC5E/hVEdUUotGTlMF60=; b=3vOR9Pjd6+9Sv934KRxH4gEZKC
	Z2SEk73pPT9ANe6qYvz3QPQCpt4BXnep4j3ScSOErGU2NT8f1a3p+d9kOrGbiHQIBxAuTOYUyFVuS
	FH+jUloRyx6K1DUAnq+WxMZs49fSjUIOgCs7eIkpIFFsdAZvHj6KJWREdUwuJvETAivKSqE6BVYZE
	Z9ZwZ4tAALxnJdWAqLBLbObjKeQ2Ixkk9bahGrnzMRRC7vmZyHQ3BMcTUdQXgxPrAR8CyiD8gffdD
	V4zqqGoma71CnIT3ThbTsHgg4kzk1rLBejBodcH+mdeuumYzach/RHXKwPCFKUUDj7JT+x7pnqQaP
	WQp66aAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ14z-00000004L9d-20wf;
	Tue, 08 Jul 2025 05:41:21 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ12K-00000004KaD-36XM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 05:38:38 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751953112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qGQOt9zJY1AhXD9o4NBc7iKeC5E/hVEdUUotGTlMF60=;
	b=waYixALk8ew3kupKl+Sv0gwYp8se/Dfi/iHjRbrELdra9IIpCHgi6xaxBxrAoBeKmyntIQ
	B44r85YOVVEYiq4QWp2PgXgRtP0wv1ngF/Sgts4eEXk7n6IAvfjXXLhJ0DTySMS1idlZZW
	d+ML2ZTkAsNfmG+LdYZDtUkyEVts4CwTFT3Ei/wo5l8pvPhkbnC/B45UtcD9KHq4krXbWo
	GzQ125bpeaoMgl1AGBCORDgprtqfscQcXHzdr5BwRkQ/hYSCgTiZ27YC+OUyCKZNgQkt4E
	WNe2u7Rmf/QJ1kJNwqFusjZSCv4098CoM2gruTfjjA+kAfIcaMwc5SbEGCqnuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751953112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qGQOt9zJY1AhXD9o4NBc7iKeC5E/hVEdUUotGTlMF60=;
	b=z2yMPUoun6joogG68ZUVq97zb0wQM4zYXJGzFbNOzQV49MpFFKgy0RitRPkynR5UaQwufD
	/XaMFmlbzDKwoXAg==
To: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] PCI: iproc: Remove description of 'msi_domain' in struct iproc_msi
Date: Tue,  8 Jul 2025 07:38:25 +0200
Message-Id: <20250708053825.1803409-1-namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_223836_921302_F3617F57 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

The member msi_domain of struct iproc_msi has been removed, but its
description was left behind. Remove the description.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507080437.HQuYK7x8-lkp@int=
el.com/
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/pci/controller/pcie-iproc-msi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-iproc-msi.c b/drivers/pci/controll=
er/pcie-iproc-msi.c
index d0c7f004217f..9ba242ab9596 100644
--- a/drivers/pci/controller/pcie-iproc-msi.c
+++ b/drivers/pci/controller/pcie-iproc-msi.c
@@ -82,7 +82,6 @@ struct iproc_msi_grp {
  * @bitmap_lock: lock to protect access to the MSI bitmap
  * @nr_msi_vecs: total number of MSI vectors
  * @inner_domain: inner IRQ domain
- * @msi_domain: MSI IRQ domain
  * @nr_eq_region: required number of 4K aligned memory region for MSI event
  * queues
  * @nr_msi_region: required number of 4K aligned address region for MSI po=
sted
--=20
2.39.5



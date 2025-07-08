Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165E1C83F16
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oD4W9g0WOfKx+bxrkNnfnVsGqOoAnE5r5en3gmkQcuU=; b=IJEnXLlue71/m0OqLNVCxFT5ut
	PMxjVLXQPBC5W/5UIAi7wkpsYxr8a/1COeg+W8TQcQloh9aAoTenfyci1EYwbZ9hL/tQkZtmPC88h
	yn28mjC2PSjW6cQDfgy8hqdvfrA4idHP39olg/tziJhXlk6iQRs7njLiytxqkx14DJPSJxB8bv3En
	sjFrMuynoI6yEElL/qm7w5ycCg+6KowmULknU5srEaxVpCAVIhjL6gjQGbswVx90VJFyzJHhWLAF/
	ZZCzCcA95hi6wF6030JMq/TrIk8WXIxsUr0UoS/U6KgbmH5LLS8arSjF3/eAys2kvdk8fR8JHq/f4
	DhQQtV5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEA7-00000006MfX-088l;
	Tue, 08 Jul 2025 19:39:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCy-000000067s5-33Bj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Jul 2025 17:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oD4W9g0WOfKx+bxrkNnfnVsGqOoAnE5r5en3gmkQcuU=; b=lTyw6A3L4BF1RyEP7WMHvGyZuk
	qVsSiH2i03a9xHdXo6yP0cau1oFSsvubBJ+X51VW37JI65J+QRV4D/n0aOf5m4EamE6GrjwL4bWlk
	7lhG7oQsuTW3Wjlwqgvhn+nvpw32G95tfFCAS8vpbbanS+0PlvpUYb7HAQND7r7/gkEgGAZTGT5Bd
	tIL2i6bRBmJr6NCUNP6b/co3SafwY+Ruv8ZdT/d1sgxJPMpTu29vtv8BK2wYRyOPAoPvOMzOs18ic
	1KV6K1OH2iJFjg0HGvByhOCbP9I3QRPwHnFzBTiuXeu/DHdkNvIhVV4CIX3Bpfck/MgQKE/6ArSIX
	3QIZZCxg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCu-00000008lVD-44PR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB17C4691F;
	Tue,  8 Jul 2025 17:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CB0C4CEF8;
	Tue,  8 Jul 2025 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996052;
	bh=R1XE97PXvA2ANKeTAsd6SDjyoafLP7919cZJ82aU2GU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RbM5gYfp7zNIfYsBNm9Yil6S+w3K1LUNu7NHSjNpD6v2mDyXpjJX8BX4SeC8THFze
	 3FJpGCOWwpcWKnMyjLVVI3brVfYF25HO7lRLxbCAH41IXFM2d0iO2wlKcbQZMllSmM
	 byytUP52pOLhqk/aQrTnLgJY0r4fW+OveghnhitKPz2gRD1Bw0rC+IgQutehm0RrV9
	 PP7/GMGRG6fcGgkxnomWPZJdtT2ob4zKwluEPhguctvBwoRPOrO3/9TBcOsFtZV0zK
	 q/ROl8pl00R3OzWZ/Nx3cg/h5ZwBD4phK/SjleA5dp0sF+Kov4D9/v6HhOqNK5gAkJ
	 ivpmOv2YxbQGg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uZCCo-00Dqhw-PD;
	Tue, 08 Jul 2025 18:34:10 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 11/13] PCI: xgene-msi: Probe as a standard platform driver
Date: Tue,  8 Jul 2025 18:34:02 +0100
Message-Id: <20250708173404.1278635-12-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250708173404.1278635-1-maz@kernel.org>
References: <20250708173404.1278635-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_183417_272217_C6AFCE9B 
X-CRM114-Status: GOOD (  13.52  )
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

Now that we have made the dependedncy between the PCI driver and
the MSI driver explicit, there is no need to use subsys_initcall()
as a probing hook, and we can rely on builtin_platform_driver()
instead.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-xgene-msi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index a190c25c8df52..243c7721c8799 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -429,9 +429,4 @@ static struct platform_driver xgene_msi_driver = {
 	.probe = xgene_msi_probe,
 	.remove = xgene_msi_remove,
 };
-
-static int __init xgene_pcie_msi_init(void)
-{
-	return platform_driver_register(&xgene_msi_driver);
-}
-subsys_initcall(xgene_pcie_msi_init);
+builtin_platform_driver(xgene_msi_driver);
-- 
2.39.2



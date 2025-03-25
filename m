Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39449C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 10:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3BPcvcf/Hzb4kdrFNvNMNRHaveuYCWOKZwNt/+2EdA=; b=FXaGpOtzJ4s6HT7aBJaGFlm2+B
	0/K9UwaKrg1yWoCk9qI/m7mvrS0aJzf6wuAr7rmKoZdyelLChTsYgnH5y+p5qTltdL9Ahcy6/s9Gl
	MHiCod1/7xG84ag8m6jSCW39ISMEc4gNRwNo21J8VSykZ1/PaM50bmtKibPbPNxf5F9N+QhXOMsqr
	HuhbY7qsvyevuZmHa1QKxgbGfHoSsqMq1Jlz3T9eb+eA69cc5GQ6JAZ4VXTjkZOCxjVJ/GI7fcJgS
	pk6Nl6EanrL1e7Jlf84I1V82y4/FQeyzQHMBb60tUs/0WjGvPTvdfQjGEWwk0SnUe0p0GNQETS/bJ
	ZkVhOTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1gO-00000005TFv-1YJk;
	Tue, 25 Mar 2025 10:38:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1US-00000005Qnq-1V2K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 10:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 758DAA4A251;
	Tue, 25 Mar 2025 10:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD9FC4CEEF;
	Tue, 25 Mar 2025 10:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742898395;
	bh=VSfhlj5RX9Q0sFL8fHCdCaINpj+NsUZXrHHgkzj/h48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DGKbOGoeIMFSz4zITg4ScePrgJqXqHIWQs0ttHPfQ/1q96gwO/fQ0pTbdYLzxrNSG
	 AREng6rzN5ApUkvlwATUwA0AG1tPAOBh8Pk2HeU29t2pnfNPYSSyASzkXTcG6m67KP
	 LzdauePc5hAhkZZxVNZ/pdqfBZUVHE5xVdRJbt+tJOA1Z/qkkG0hpAp3pkfNQuzBDT
	 HNg64fX0usc3k1AaNHM71S1Q0PNKG4w87KJWT/Qx7YhNHa2z1/+DiOGIOilQOaQBkz
	 rTbaDHpyWz9DivAfYdObQOhvtCI+zmWTNsQ7+I7fr5STpt+gdOv2yaTkHd1R+MhNV5
	 i+Dgo1WggT/Jg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tx1UP-00GsRS-AY;
	Tue, 25 Mar 2025 10:26:33 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v2 05/13] PCI: apple: Dynamically allocate RID-to_SID bitmap
Date: Tue, 25 Mar 2025 10:26:02 +0000
Message-Id: <20250325102610.2073863-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250325102610.2073863-1-maz@kernel.org>
References: <20250325102610.2073863-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_032636_458836_2C97402D 
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

As we move towards supporting SoCs with varying RID-to-SID mapping
capabilities, turn the static SID tracking bitmap into a dynamically
allocated one. The current allocation size is still the same, but
that's about to change.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pcie-apple.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 9c3103d0d1174..1f6c55e4b5d68 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -147,7 +147,7 @@ struct apple_pcie_port {
 	void __iomem		*base;
 	struct irq_domain	*domain;
 	struct list_head	entry;
-	DECLARE_BITMAP(sid_map, MAX_RID2SID);
+	unsigned long		*sid_map;
 	int			sid_map_sz;
 	int			idx;
 };
@@ -524,6 +524,10 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
 	if (!port)
 		return -ENOMEM;
 
+	port->sid_map = devm_bitmap_zalloc(pcie->dev, MAX_RID2SID, GFP_KERNEL);
+	if (!port->sid_map)
+		return -ENOMEM;
+
 	ret = of_property_read_u32_index(np, "reg", 0, &idx);
 	if (ret)
 		return ret;
-- 
2.39.2



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8365B606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MZKYUIid;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=Lqtnk/E9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qID+dEtKjHnTB7zRrjAZ+x1ovn7794ILO31jRDajG3g=; b=MZKYUIid2HuUZvwaOVpGZ0UBUY
	5sO+euu6XNiMB3EJP3RLGuL6KkP6QdcZLlZ9xUs80YxTpFP0wN3ejGE3RWWk2ZeIH9eyoQguCfrtf
	MwmzwvKyNCbiTGyTxQ0668iUK9cuCbQDfosybokm8cepAYO+5/FIVByRDCzl9oeG/FZwid5ShsFs/
	CHr06v3gDT2Ed5jolKt6p8sMKkGejhrDVAMXrawrvz3f/FtdhACf+33sn1sEp9+g+FWtV53hS1W88
	AaYVXYlYFBW2z7pM1IGv4abfJqP7g9oHsUWPQWPF0iciybYR6MdMYVUVwdlNEDzK7vSzB/c7690Gp
	sIF7TyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTMN-0000000BaHd-2KIE;
	Wed, 21 Oct 2026 10:15:51 +0000
Received: from out-159.mta0.migadu.com ([2001:41d0:1004:224b::9f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTMJ-0000000BaGF-14az
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 10:15:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gsCMZZdvoKKiSu7dqO9JkNt1TMT38UkvVw1xwlAFKHE=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792577741; v=1; x=1793182541;
 b=Lqtnk/E9A6eXhIx5TY/NrE8qCmhglMh93geCeasd4HC56ijwiDVVD7xeCWTAI0SuXM3fYEP0
 02mSxqKGNmENiAntBMd/rZAdbgi5I74ARzRYgdyan76Gx+qNZHnnsLVkPedltTJGsDHXdJTnfT+
 bfOsPU4TP4/OQ1YWPkQ0AIG69HN6XO2jIytY5V3kTGuLCGVpJpLYsxWii5jWaYIe2s8zYMh7Phg
 +cxncq7EgBxqk6SqWEdUYS5ytEpTpEVAGQPPdo0TWFg45/awQhffkMo03jStHO9ymuqu9RbfYPA
 5o+kmHw1w/7EVBVpJbMkbvVLBl1yyUDx/HL9wJRApt+bw==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6805060a84a1d670;
	Wed, 21 Oct 2026 10:15:38 +0000
X-Mizu-Trace-ID: 6805060a84a1d670
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] PCI: dw-rockchip: Remove redundant dev_err()
Date: Wed, 21 Oct 2026 12:14:57 +0200
Message-ID: <20261021101533.609118-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_031548_139599_EF36FDC2 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The devm_request_threaded_irq() function already automatically logs
detailed error messages on failure since commit
55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()")
So remove the now-redundant driver-specific dev_err() calls.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 14976861f8ef..a4dbfc52c2f1 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -718,10 +718,8 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					rockchip_pcie_rc_sys_irq_thread,
 					IRQF_ONESHOT, "pcie-sys-rc", rockchip);
-	if (ret) {
-		dev_err(dev, "failed to request PCIe sys IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	/* LTSSM enable control mode */
 	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
@@ -764,10 +762,8 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					rockchip_pcie_ep_sys_irq_thread,
 					IRQF_ONESHOT, "pcie-sys-ep", rockchip);
-	if (ret) {
-		dev_err(dev, "failed to request PCIe sys IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	/*
 	 * LTSSM enable control mode, and automatically delay link training on
-- 
2.55.0



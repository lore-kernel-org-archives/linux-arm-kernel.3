Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C62C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 17:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghFcdq+Eb5obqWxBrWPebdbvYmW4+GkNjIZ2SrOMg1Q=; b=D2K1id5NhARhBKwX/SJi8ZgWCv
	9zD0MdI52voHl/NVX4gJOHTE5rEi59ab+lGh0nQtGqGEt2NHv1xVOEGmT/9KFe2KTcAYvYDeTG2w5
	DxCkAZp3otk+uyQAPwuLTb/utUovPMYwYOvTPcYz3U+b1C46Tcg89LLaRTCS7jPYNbBgWtRZCbYwC
	+JZnN6kG7eNz8p9lPlQeIAAmohHl+A93tF+HZFokR8Tl5OIem5dVm1XO12cX+lcnJ30gvoCm84P3b
	qoJgwSTWu6wGt5RecRopqBJsYqvcDfKtyokkPnVOeKl6dS1zysLxMoTiJAK3ss1j+Xj7m0Sfg2ktq
	cAj26dEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZn3-0000000HAXq-0yW5;
	Sat, 28 Jun 2025 17:56:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZNn-0000000H7W1-0oxB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 17:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D30946400;
	Sat, 28 Jun 2025 17:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610A2C4CEF4;
	Sat, 28 Jun 2025 17:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751131830;
	bh=+GYSKd8aIM8xo28+bC9TFYEOVhobRPsyzp0tu6Fgk3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bjRiiX2ytUjhCedtYc9Qd1lJMVXPsynbsX2z5LJR+xNHvTUh0thKE5RKQRMp3jbSN
	 UkZKBJBsVKPWnTJlfEObly4mf5qol55dPg+NUaCeUiKLspMA1oaJfLyJ9YK0qds+sT
	 Ka86SdsZMimLOzbYkiB0LnngAzY21dAGFSYQmveNP1FdEkAzN7hpb9fW0EuuIlACrg
	 0VB6sQFN7iAy3V8mHby0jnQnTqmZv2IRzar/dG3U/+t8C77Gs88bMO8U/Fl5224+P6
	 15RkI7XBhPP1m5b2Js8DbTBgFT1+JuOaqIU3mt/omJsP02/BMa+eUoiY4pZegWVEMM
	 4O6ZSZK2eLV5Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uVZNk-00AqZC-DX;
	Sat, 28 Jun 2025 18:30:28 +0100
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
Subject: [PATCH 11/12] PCI: xgene-msi: Probe as a standard platform driver
Date: Sat, 28 Jun 2025 18:30:04 +0100
Message-Id: <20250628173005.445013-12-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250628173005.445013-1-maz@kernel.org>
References: <20250628173005.445013-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_103031_254327_E4AE5549 
X-CRM114-Status: GOOD (  12.52  )
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
index f797ba0524783..a22a6df7808c7 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -419,9 +419,4 @@ static struct platform_driver xgene_msi_driver = {
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



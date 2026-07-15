Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BCFC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 01:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lCUYlxb6BsnAbaXQaOLOynpXjnyMHB9hBKlRYLAY5As=; b=WHHSeCnPsY83aikkJAqJ+DaTP4
	GXqbOPLqIW5+kMtzv/9RV2UXmVJ/ZdlJ3jJc6Dv0ssTWnzIxdaylYplc4b6YFvP6tKYEEmk7ZB+jw
	DevLVzqSVpwsBq+SAlWPzrcLVUpv3lT6tOsuz3XeNrplCNhqkkhfOj6QMYwQuXe7F255Fd06LwRXV
	tatnljMoMCdo8PHpQgj3t1OBCjnQf8f1TEamptH/JLiHWkpeIZm2RAwlXygSgmrRvyZuIFGEXnHmu
	jYxpGLZpX3EfBNWX8eSRRYb7qL6sfFzCo81dkgolIXaVjHSj75rHDs54j3DLwZuEj0WJ6b7dpivrU
	3DJz7fcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoAf-0000000DX3h-14Km;
	Wed, 15 Jul 2026 01:12:21 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoAc-0000000DX31-2CEg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 01:12:19 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so5085498a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 18:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784077938; x=1784682738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCUYlxb6BsnAbaXQaOLOynpXjnyMHB9hBKlRYLAY5As=;
        b=FvepDMMugYZupbO53WYDcqrLDWCCA530zkfqu5am/j/hVJNYdUGfxWi3t+ek4SSxhS
         pooTwMGy6gBbQXfF6ZBkNXrRu1r5tedijvcIDawcVN8zHO954zu034leItvrS+F00GMG
         c+lCqO1esJYjDR/Ix9sQ5yVX/sVkbq1LokoOVZ+3fiGrrT8lU8ZcEw6zqncC6BIMdEV2
         PHSSH8dkweLtkytYA/K+S9LJ+twk0FPpDlrt0ewuQ6tnJWdwF9wkHpKeyuodar7+NCG+
         ZO3GQT2hkKlX2Z5xRx0ZkkNXR2XTZvuTyPfVaGRdMHYl7hjjxRXkoGLQZxMGzpa3pbIv
         IMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784077938; x=1784682738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCUYlxb6BsnAbaXQaOLOynpXjnyMHB9hBKlRYLAY5As=;
        b=S2Rd09PFE6V4qLrbLxmp9KN9y9IxClDKElSgoU7cz4dodDPMvURZ9Ulprix0DxTGP5
         PGR2+pth2w4qIl0e/roQA84lnjZbl07XkredkFeUO1hIbQRu/11WuAYZ+At7SU1VCtXA
         u4nr9LeOA5RIHJYZSrxl9tsUUK7nhgcVwSgKCjTB+h2RMxxy0HM60zQvO+vncprK6m9v
         avMx05FfwfbtWoKjTC+fbV1yxMqR/Ss5666eQC5+cqkywU80ION+6n3k9MvDeLjmLkTY
         ETtiOFY8RL04InlcHY0JAXLwf5SSsjz+phWpzMcPm+faVXxOuyEbCQPuflotrvGlZqNj
         oJog==
X-Forwarded-Encrypted: i=1; AHgh+RrrOqiBtnW74aKD1rLPg1RX2zXXNZLmZnnVBykCAzzdT2kkLjrE/LDg/NfndQAjtJYjUDA9AnRDmK4vqQHGXO/z@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfv28Uhkv4dA6d3s85CGFmDtzQKH+KzfcZ59dNDKQ4U8skaBzz
	8dgoBdXWtSfTeDf6eg7in3eNKobj2YyDF3NOzSZouytl48gXlPFJFbp7
X-Gm-Gg: AfdE7cm2kXasjLU7I6gqEEKMhtagkQByOR21q21YP8oZuJwSVyCuL91eYgoh3SaLWiX
	/dah/douPbWrDIFQzKtNjOdrgrOUmaq1qz16JtlGUoSyR2G3bDZK07r+ozWOUODiXWNtyZSfrte
	3Ls1ME3B7vgb85gh49GjQU/sqoG5VPMU7bFiq/ULNcgHuW95SqOnVxUXtvPQagM8vvyc5PvhRfh
	Of8KrJglyMwxEs+32Qy62GfdrJhBl1nrWg6I85hzCyf/w7P0gDoqo2EOg3U0EeA3Mdj9kQUiaFd
	tx0pzh5BVzIbV46q7nFRAS+8WG1hLfbakm18ZLwZcwpTDz06rodiwOWKnHuuOIgao3RombzGGPN
	B5LCX3gGKFXemowKEzARh0x8nO5E3nftHd753xRM2wvtav9jS70btZCFYeQnB1lQ4FbQFM0Vctc
	dn+lhtuBwquh/ra9qW08Tetdqjf/inm+fpNiLncUAjAfEia1fP54aKfYSLUeQhbViTYJtJhqLKw
	mMO9qDPq5jOn77vQPdbXMMk1u/7oiIiM6lkbuq2AWci55K3EaG4DMOWpGuLVjOzEQ==
X-Received: by 2002:a17:90b:51cb:b0:38e:7eb:d07b with SMTP id 98e67ed59e1d1-38e2a06179cmr845415a91.34.1784077937648;
        Tue, 14 Jul 2026 18:12:17 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1730accesm2235481a91.15.2026.07.14.18.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:12:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pci@vger.kernel.org
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/UNIPHIER ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] PCI: dwc: uniphier: use fwnode API for legacy-interrupt-controller
Date: Tue, 14 Jul 2026 18:12:15 -0700
Message-ID: <20260715011215.1263935-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_181218_652641_824A5260 
X-CRM114-Status: GOOD (  16.38  )
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

Convert uniphier_pcie_config_intx_irq() from the OF-specific to the
generic firmware-node API: of_get_child_by_name() to
device_get_named_child_node(), irq_of_parse_and_map() to
fwnode_irq_get(), of_fwnode_handle() on the child node to passing the
fwnode directly, and of_node_put() to fwnode_handle_put().

Unlike irq_of_parse_and_map(), fwnode_irq_get() returns a positive IRQ
or a negative errno and never 0 (it rewrites 0 to -EINVAL), so check
pp->irq < 0 and propagate the error. pp->irq is an int, so the negative
value is preserved. Drop the now-unused np / dev_fwnode() locals, since
device_get_named_child_node() operates on the device directly.

Built for arm64 (defconfig + CONFIG_PCIE_UNIPHIER) with LLVM=1;
drivers/pci/controller/dwc/pcie-uniphier.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pci/controller/dwc/pcie-uniphier.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 297e7a3d9b36..6516264fdfc1 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -262,27 +262,27 @@ static int uniphier_pcie_config_intx_irq(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
-	struct device_node *np = pci->dev->of_node;
-	struct device_node *np_intc;
+	struct device *dev = pci->dev;
+	struct fwnode_handle *fw_intc;
 	int ret = 0;
 
-	np_intc = of_get_child_by_name(np, "legacy-interrupt-controller");
-	if (!np_intc) {
-		dev_err(pci->dev, "Failed to get legacy-interrupt-controller node\n");
+	fw_intc = device_get_named_child_node(dev, "legacy-interrupt-controller");
+	if (!fw_intc) {
+		dev_err(dev, "Failed to get legacy-interrupt-controller node\n");
 		return -EINVAL;
 	}
 
-	pp->irq = irq_of_parse_and_map(np_intc, 0);
-	if (!pp->irq) {
-		dev_err(pci->dev, "Failed to get an IRQ entry in legacy-interrupt-controller\n");
+	pp->irq = fwnode_irq_get(fw_intc, 0);
+	if (pp->irq < 0) {
+		dev_err(dev, "Failed to get an IRQ entry in legacy-interrupt-controller\n");
 		ret = -EINVAL;
 		goto out_put_node;
 	}
 
-	pcie->intx_irq_domain = irq_domain_create_linear(of_fwnode_handle(np_intc), PCI_NUM_INTX,
+	pcie->intx_irq_domain = irq_domain_create_linear(fw_intc, PCI_NUM_INTX,
 						&uniphier_intx_domain_ops, pp);
 	if (!pcie->intx_irq_domain) {
-		dev_err(pci->dev, "Failed to get INTx domain\n");
+		dev_err(dev, "Failed to get INTx domain\n");
 		ret = -ENODEV;
 		goto out_put_node;
 	}
@@ -291,7 +291,7 @@ static int uniphier_pcie_config_intx_irq(struct dw_pcie_rp *pp)
 					 pp);
 
 out_put_node:
-	of_node_put(np_intc);
+	fwnode_handle_put(fw_intc);
 	return ret;
 }
 
-- 
2.55.0



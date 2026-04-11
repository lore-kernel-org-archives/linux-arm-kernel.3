Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99E7F45A1E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 04:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BD+xwKu/bN5/gMMBjSUYvF/EGDAVlZJDs5yWBOqQPgU=; b=IMynsSIhQcG0L2h5Auh4ACPvm+
	Mx5Xo1DEoPslmovBzLTUuVc8IpVK+S4vFV0jUBw5LX3GZQY/2SW6wssVe104/t2uPe7mqQk+fB/XE
	hLFLOiVIH3qJaqjcxFXdg1KwChDnOfoQQOFxuNEUZRvJ//D+UDzEC2YqD1YhqN86APwlXbW0hQ6YV
	u/M8RktYBm8EEIkwTR6nT+NNyrX1kVgCYfdYxn8EJHOYhrsuJwDY27yg1SnzKvF99iqwh7nP7dMkm
	Ds1BzcxrpRiwUikvmLyYifz0ph5RDJg62VtAFUv0yzDDAIDcoIxxO9zWR2ZB62ABlWwuqCLDolSOx
	2biZZzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBQ00-0000000D8Yf-37Dy;
	Sat, 11 Apr 2026 04:31:12 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBPzy-0000000D8YJ-1wQ7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 04:31:11 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso2137258a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 21:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775881869; x=1776486669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BD+xwKu/bN5/gMMBjSUYvF/EGDAVlZJDs5yWBOqQPgU=;
        b=dMq6PD2iZ9MXpCBgXVwukoFMkxQLS7i7cjT79fRNUdMPHRBumSkKEm5LOq3V8mK+3t
         fJBr046glWl8gvCl9XhzZPeJ/8HwLDmIY6iFV23s+3WIJoGEACRb8y+oTOhuD906oD3i
         Pq/4kMm/KaGuUXnKx9MXas3/5umTdDwrQP3AVHJe9rJeWFsoV3ETjAKEbK2WfKP7GnDI
         RSjXr0ay3khM1jh605QDUjm/kJSg3dWLxq9inMg4fNDIfdE+UA8dntglg4KXN6uujIAm
         5Lj6jZnu36atQuOOvAbDhGl4OJs05oynSpSpP3ODFceQHH84n4wfXTQquVwS4q3b5Niy
         zFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775881869; x=1776486669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BD+xwKu/bN5/gMMBjSUYvF/EGDAVlZJDs5yWBOqQPgU=;
        b=i/JdbqmEPvTTqRDs7MVZB1abb2bkPiw4GACZzthjc6jj4AZZTeK3U6QEUU6/YkGSe9
         x2PFnLsIRBmITNMOt2zvydqJmcpNsBF6OSHx6ioyeUfc4KwOfuAxrI2p3VDnPBeTQ9IC
         2b2Okt+Em7y40Aj91maQMO2vL6fR8JReg4pRunNWZ5j7Occ6Ct7p+Nd8EQpaiH/XFTi0
         DenG5/3OQl9YWIkPoDUArkpzqQMHLHo3dk3S/u814pA1FCvUjWV5Yld9/VBHhwOVCFjN
         sGvhXqpShVluIzZI+WE0Tots8HYtHQuVaTPGsIg6OX13k7r8sn4iGzsrQMqlKVjX4FdO
         4dBg==
X-Forwarded-Encrypted: i=1; AJvYcCUwURgDJiPffZZUtgQGoqjZptrFw+A2IuS1EuweVr2s4tg7ZYtlQs24GX0ngUtYkN2+OmdCpuyyKMgkuExeHqP2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvb4YpZqkVfXufPy3zE5KcYUteVXcQnki7SezodJZUvdzLoL5w
	AzIRalHVqm9A+h/q2IqmdULJLNe+mAa8h3Dq6hjah7J2kF94pCiOLbxt
X-Gm-Gg: AeBDietWH46GcgY1vE687Gqzgow49ByigcsbMCsCvGZ2II8p0kcMBN2KSkyrqP7FeSB
	jgFEWF2xSWtfJKP+wfEFsTj0EmjCd39KcDZ9A2eRbOpfypyEPR1Az1b0ZZ3hizPYS/al6MHsaBl
	9nRNpWjC7Xsrou/I9yV4VbWKuCY/Eo9ynUKOD6mWaK2RDxfItZExu2lpfCuE05IbqMtt4sfXiNI
	VVDg3Q7javGxXpiN8KkgKRENJfnuZRQMQkfZhKPunofPmQfpjBNxUKi5DPv7upNsIoboVtqQIIz
	e45yxj6/LFyb+ZZD6cc5HQSfAbqJ/IpDTw/CyiitHhI2WmSH5PW81BrEMp3ORsPxIdelHJztTud
	Ffkm7cKzmy5Spz7gUwvngW0yNG3R7Odeqtro/bie4zuP4WbrDnOKCbJDRGdjRLs8weE1PrzO3iI
	+NaG2Klq/SVWBmZkgMmdIwTtKkOVVVdPdyxOAxJFewfTCM1dG/8sats2U=
X-Received: by 2002:a17:90a:dfc7:b0:35b:e52a:6fe5 with SMTP id 98e67ed59e1d1-35e4274e358mr5585311a91.5.1775881869282;
        Fri, 10 Apr 2026 21:31:09 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e3512f27asm8038120a91.10.2026.04.10.21.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 21:31:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pci@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR MVEBU (Marvell Armada 370 and Ar...),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] PCI: mvebu: allocate ports with pcie struct
Date: Fri, 10 Apr 2026 21:30:51 -0700
Message-ID: <20260411043051.174309-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_213110_508879_1B01BB9C 
X-CRM114-Status: GOOD (  14.27  )
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

Use a flexible array member to combine allocations and simplify
slightly.

Add __counted_by for extra runtime analysis.

Needed to move mvebu_pcie struct below others as flexible array members
require full definitions.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pci/controller/pci-mvebu.c | 33 ++++++++++++------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index a72aa57591c0..dea50f6e88be 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -78,18 +78,6 @@
 #define PCIE_DEBUG_CTRL         0x1a60
 #define  PCIE_DEBUG_SOFT_RESET		BIT(20)
 
-struct mvebu_pcie_port;
-
-/* Structure representing all PCIe interfaces */
-struct mvebu_pcie {
-	struct platform_device *pdev;
-	struct mvebu_pcie_port *ports;
-	struct resource io;
-	struct resource realio;
-	struct resource mem;
-	int nports;
-};
-
 struct mvebu_pcie_window {
 	phys_addr_t base;
 	phys_addr_t remap;
@@ -125,6 +113,16 @@ struct mvebu_pcie_port {
 	int intx_irq;
 };
 
+/* Structure representing all PCIe interfaces */
+struct mvebu_pcie {
+	struct platform_device *pdev;
+	struct resource io;
+	struct resource realio;
+	struct resource mem;
+	int nports;
+	struct mvebu_pcie_port ports[] __counted_by(nports);
+};
+
 static inline void mvebu_writel(struct mvebu_pcie_port *port, u32 val, u32 reg)
 {
 	writel(val, port->base + reg);
@@ -1455,11 +1453,13 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 	struct device_node *child;
 	int num, i, ret;
 
-	bridge = devm_pci_alloc_host_bridge(dev, sizeof(struct mvebu_pcie));
+	num = of_get_available_child_count(np);
+	bridge = devm_pci_alloc_host_bridge(dev, struct_size(pcie, ports, num));
 	if (!bridge)
 		return -ENOMEM;
 
 	pcie = pci_host_bridge_priv(bridge);
+	pcie->nports = num;
 	pcie->pdev = pdev;
 	platform_set_drvdata(pdev, pcie);
 
@@ -1467,12 +1467,6 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	num = of_get_available_child_count(np);
-
-	pcie->ports = devm_kcalloc(dev, num, sizeof(*pcie->ports), GFP_KERNEL);
-	if (!pcie->ports)
-		return -ENOMEM;
-
 	i = 0;
 	for_each_available_child_of_node(np, child) {
 		struct mvebu_pcie_port *port = &pcie->ports[i];
@@ -1488,7 +1482,6 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 		port->dn = child;
 		i++;
 	}
-	pcie->nports = i;
 
 	for (i = 0; i < pcie->nports; i++) {
 		struct mvebu_pcie_port *port = &pcie->ports[i];
-- 
2.53.0



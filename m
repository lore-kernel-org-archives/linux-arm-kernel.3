Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF6D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UvHu2bnc;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEnPCkwA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0gBUd5jJHGj2LvC1m8ir7f7MkneqJ2TxhRwTgxUGW4s=; b=UvHu2bncVktwIrO/wZsuLVahgl
	/yAyRVrgpEZDGXjTDdOFFih9FeYIMlFXmwNRxSGpnGF7fS0h94LYfYS+9PnGR4jsA9frMRdgeKMUa
	kf8bXcX6KvKrwL6DQMjq8MSNc7gTnYba4ERRFo1mzs3gbWa1pp55TVWqmoOvUCJDOzaVzVKHUzWJ+
	WwTe4QjsyOjvhPeepE58pyfl011+Ds3IugrYmi8D+Tp4l5KxqjhmwyfmzC83LH8qy8x420NtnBvD9
	rG8/TkLtu5PNet86R05YnweD5SpdyVWRfuaz10YDq+9IETFp6KCoInj6spCsJ/cz2Fj9PGvBbHKTK
	C5ihEFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKgD-00000008YWJ-1XKH;
	Thu, 29 Oct 2026 07:36:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKgC-00000008YWA-3RZU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 07:36:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BDAF3601F8;
	Thu, 29 Oct 2026 07:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE051F01825;
	Thu, 29 Oct 2026 07:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793259367;
	bh=0gBUd5jJHGj2LvC1m8ir7f7MkneqJ2TxhRwTgxUGW4s=;
	h=From:Date:Subject:To:Cc;
	b=YEnPCkwAU2o1DTOBBoPs8ZS3s6493xl3T1xVf7fVU0LBDzMU7LFXmXZMmgcFZD35W
	 wV0Iq7lYIhKBNjeiBm+AfAg4wFiAxJw18IO+1LRrCPLnKQ+XbFcfgkpPQlFnqSBBE6
	 x8cso0m9D2/iv0/2jFlmUHVlDENej0MvwAh5owg4LEbovxjCnTYtL+uekLgROYvDGL
	 4IRgf0T3rofH6gpPn0e1gMbpz0HAQ6r9vQKFZhdPe9RnEk/DQsfk7UeusdAzUAYwOm
	 0RBKYq1Go5/jBkYwWDeLNaH7GqNJKVqxCzk5gx5tcjVndgMVroRM6ObucLraFX6f9/
	 oZ9BV411ONL7A==
From: Eugen Hristev <ehristev@kernel.org>
Date: Thu, 29 Oct 2026 09:25:19 +0200
Subject: [PATCH] PCI: iproc: Fix MSI shutdown operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-iproc-shutdown-v1-1-05f828561116@kernel.org>
X-B4-Tracking: v=1; b=H4sIAN704moC/yXMOQqAMBBA0avI1AZiBEGvIhZZRh2LRDJuELy7U
 ctX/J+AMRIydEWCiAcxBZ9RlQXYWfsJBblsUFI1lVStoDUGK3jeNxdOL7QxxmItldMacrRGHOn
 6hv3wm3ezoN3eC9z3A1e4wtNyAAAA
X-Change-ID: 20261029-iproc-shutdown-abbbce302daa
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Marc Zyngier <maz@kernel.org>, Vikram Prakash <vikramp@broadcom.com>
Cc: Anup Patel <anup.patel@broadcom.com>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2980; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=e5i4rIOHYC9b5xjEEnkOG0yjqcJV2VKbsARhJj7+xXg=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLIefY8vLihv/frkyqmaySpJRtLzut+4mM5RenRkzcJfk
 R8aatnudJSwMIhxMciKKbJUm/yrFe7f4X7S1VIFZg4rE8gQBi5OAZhIgyMjQ5v/ndtBcqW17+be
 mHlir6L0O/N/H5pm93+bcP+4zOVfctsYvukFLTzJ9q+Gz+iMx56yXUKPv0ppzZ7A0lWytdcxpHc
 rPwA=
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On reboot, shutting down iPROC leaves MSI irqs enabled and not
cleaned up. This can lead to IRQs being served after the iPROC
was shutdown.
Fix it by implementing an MSI shutdown procedure, and call it
before the iPROC shutdown.

Assisted-by: Github Copilot
Fixes: 3bc2b2348835 ("PCI: iproc: Add iProc PCIe MSI support")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/pci/controller/pcie-iproc-msi.c | 16 ++++++++++++++++
 drivers/pci/controller/pcie-iproc.c     |  3 +++
 drivers/pci/controller/pcie-iproc.h     |  4 ++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/pci/controller/pcie-iproc-msi.c b/drivers/pci/controller/pcie-iproc-msi.c
index 9ba242ab9596..1d19db67f314 100644
--- a/drivers/pci/controller/pcie-iproc-msi.c
+++ b/drivers/pci/controller/pcie-iproc-msi.c
@@ -651,6 +651,22 @@ int iproc_msi_init(struct iproc_pcie *pcie, struct device_node *node)
 }
 EXPORT_SYMBOL(iproc_msi_init);
 
+void iproc_msi_shutdown(struct iproc_pcie *pcie)
+{
+	struct iproc_msi *msi = pcie->msi;
+	unsigned int index;
+
+	if (!msi)
+		return;
+
+	iproc_msi_disable(msi);
+	iproc_msi_read_reg(msi, IPROC_MSI_CTRL, msi->nr_irqs - 1);
+
+	for (index = 0; index < msi->nr_irqs; index++)
+		disable_irq(msi->grps[index].gic_irq);
+}
+EXPORT_SYMBOL(iproc_msi_shutdown);
+
 void iproc_msi_exit(struct iproc_pcie *pcie)
 {
 	struct iproc_msi *msi = pcie->msi;
diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index afb3aa38ac6b..6f3dc2f81a1c 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -756,8 +756,11 @@ static void iproc_pcie_perst_ctrl(struct iproc_pcie *pcie, bool assert)
 
 int iproc_pcie_shutdown(struct iproc_pcie *pcie)
 {
+	dev_dbg(pcie->dev, "quiescing MSI before PCIe reset\n");
+	iproc_msi_shutdown(pcie);
 	iproc_pcie_perst_ctrl(pcie, true);
 	msleep(500);
+	dev_dbg(pcie->dev, "PCIe shutdown complete\n");
 
 	return 0;
 }
diff --git a/drivers/pci/controller/pcie-iproc.h b/drivers/pci/controller/pcie-iproc.h
index c4443f236ca3..54e6e365774e 100644
--- a/drivers/pci/controller/pcie-iproc.h
+++ b/drivers/pci/controller/pcie-iproc.h
@@ -114,6 +114,7 @@ int iproc_pcie_shutdown(struct iproc_pcie *pcie);
 
 #ifdef CONFIG_PCIE_IPROC_MSI
 int iproc_msi_init(struct iproc_pcie *pcie, struct device_node *node);
+void iproc_msi_shutdown(struct iproc_pcie *pcie);
 void iproc_msi_exit(struct iproc_pcie *pcie);
 #else
 static inline int iproc_msi_init(struct iproc_pcie *pcie,
@@ -121,6 +122,9 @@ static inline int iproc_msi_init(struct iproc_pcie *pcie,
 {
 	return -ENODEV;
 }
+static inline void iproc_msi_shutdown(struct iproc_pcie *pcie)
+{
+}
 static inline void iproc_msi_exit(struct iproc_pcie *pcie)
 {
 }

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-iproc-shutdown-abbbce302daa

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABA7C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 05:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XrMwKX+SRUfTd+laIq2RPXWM2s+IfHFPYhm80O9b7rI=; b=NPtQio+JxKX7X+jd+PNGPZ2RRP
	crMRffuAMxxQbShzQ+Vi/IhBwLXrrHZ/oPkW5dUtnCKAAJ4Xry/EFvUoI4g3ml5ObmNmKkfQcun7N
	N977cLb5DLEoZOnsm1m8QPwTDEw/WTNK8xVVYubtCFhSQeF+eNqCbaQoOXX+h1l3pf9kF/hQciqOZ
	4oBXjhaA9FnX4K1eBWXNVgTjvNgISZrEjdbGTpK/2BswbAWkvBjTV5KPzESBfcOKetWCJkkh68nbo
	jk8jwwASih4XXHcoPuJMdFWcKQa160DbDtXNFQS15Ejjk6qtDEZ8WasW3p5Vo3r+gRtyJfYD7MngA
	xVJwOfMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLKi-00000006Wrs-005T;
	Mon, 11 Aug 2025 05:44:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLIB-00000006Wmj-0zMF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 05:41:56 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754890911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XrMwKX+SRUfTd+laIq2RPXWM2s+IfHFPYhm80O9b7rI=;
	b=zFHUHJ68aZkzLP2ReY2er1LhB7uYnOiTcBUSd+5Lu/zzPHN5fSskwus4tlj9ahe2YdHtti
	O1yKND6GvNXIh6cqc4jjI1bicKnUjGT4h9JpmUkvflpS4j+WEpprKkElEfUgcVak5Bu+e7
	arbJteLD7YfE+fMdIfGM64DXxiNkH5nTRZn5zv8Xgwv1spKVgwdrY9zzb1RitzbN9+uqV3
	9N9F8cS9cIh+C5vXwl24afW4cAgt0NmITcHAyIX1gippKtjZR0K8nudeiE/8Vnp4AGt5K7
	+Whawep5w/g7+ivldsTNCqcKOJpN8ng1XkVWA/5TV5Ejd/mwJ652AAvrY4dGHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754890911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XrMwKX+SRUfTd+laIq2RPXWM2s+IfHFPYhm80O9b7rI=;
	b=xSY1wHhPYDA11OkH6cQqKXKUMa9VeKo/v7OzWRulLeadzrNrORfLYdYdUFBcjHJUkLwI86
	8YUJmCyAJ6vkmSDg==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Michal Simek <michal.simek@amd.com>,
	Nam Cao <namcao@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: xilinx: Fix NULL pointer dereference
Date: Mon, 11 Aug 2025 07:41:44 +0200
Message-Id: <20250811054144.4049448-1-namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_224155_411179_95FDBA4E 
X-CRM114-Status: UNSURE (   9.89  )
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

Commit f29861aa301c5 ("PCI: xilinx: Switch to
msi_create_parent_irq_domain()") changed xilinx_pcie::msi_domain from child
devices' interrupt domain into Xilinx AXI bridge's interrupt domain.

However, xilinx_pcie_intr_handler() wasn't changed and still reads Xilinx
AXI bridge's interrupt domain from xilinx_pcie::msi_domain->parent. This
pointer is NULL now.

Update xilinx_pcie_intr_handler() to read the correct interrupt domain
pointer.

Fixes: f29861aa301c5 ("PCI: xilinx: Switch to msi_create_parent_irq_domain(=
)")
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/pci/controller/pcie-xilinx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/=
pcie-xilinx.c
index f121836c3cf4..937ea6ae1ac4 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -400,7 +400,7 @@ static irqreturn_t xilinx_pcie_intr_handler(int irq, vo=
id *data)
 		if (val & XILINX_PCIE_RPIFR1_MSI_INTR) {
 			val =3D pcie_read(pcie, XILINX_PCIE_REG_RPIFR2) &
 				XILINX_PCIE_RPIFR2_MSG_DATA;
-			domain =3D pcie->msi_domain->parent;
+			domain =3D pcie->msi_domain;
 		} else {
 			val =3D (val & XILINX_PCIE_RPIFR1_INTR_MASK) >>
 				XILINX_PCIE_RPIFR1_INTR_SHIFT;
--=20
2.39.5



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2049EDEBE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 19:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAjJy21W8Agl7xSVLMb1bYPAsur47qRis49LdPPUGDE=; b=XlOFDboUbbMlyDRnUEdfGC3tmd
	zbmhXLFaoMpfk5ZdlgMVCK1Gqkaj0L98XTjaxaIOasA0/Ksy+0Kanb+NKYlvM8wgcxAtZouqcth0G
	2mkof3qdIxL3iBbkNq/BFZLg7sV0dsZMYWV2B2xpIbKkdq2rroiKacXbgkSgxIE3cxvksBjbMgkOV
	5dCwPlGbq9h9aiAZHw9NhkWkq+ce4+b0Os4FE41DZsNHqk0qhcL2npoGYM9F6jNxPVfAdlzItIy1u
	JETX5KlwT7YD2Uk5wDZFbY4toTVt1vhe7qckqRvCBXcwgR4qnFWZLooy4CskYK3AEXOlMHGp4ENyL
	IfFv7aYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxV97-0000000Fl8q-2vzr;
	Tue, 03 Mar 2026 19:11:05 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxV95-0000000Fl5R-0RpJ;
	Tue, 03 Mar 2026 19:11:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3DFE720DF03;
	Tue,  3 Mar 2026 20:10:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1772565060; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sAjJy21W8Agl7xSVLMb1bYPAsur47qRis49LdPPUGDE=;
	b=jlAk8tuOwAMhUY7Z41ziDfc0b593+d4+uTFvd9os9WUVwg9yOqTmu74N8h8QDkLzqohVqa
	JrvcgRl1WjOtLnmjkuA4IzW+Qvjys/XflU+VorZ5PvItFL/pFxmNQvByu7sofhq9FiSlSk
	AHqEwE2ZwEhCt5iAgSJf85eyuzyT3U6kzvE8XtggOqLeQn25Pw7NavGI5COzFG/r/giKTF
	xNxcSGgRaH40XMdfc7lfsmDYyjSfZ7wgnQBxrZgM2Yu5hjyjY02lmQpt+vYgY6JThmT5rH
	gPYPurVcGGRgO3xRe3V0TsucEPUOmWdDNUkQdYCpR5q0K9C+oSRsp9WeIIgkZA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjd@cjdns.fr,
	tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nbd@nbd.name,
	ansuelsmth@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH 7/8] PCI: Skip bridge window reads when window is not supported
Date: Tue,  3 Mar 2026 19:09:47 +0000
Message-Id: <20260303190948.694783-8-cjd@cjdns.fr>
In-Reply-To: <20260303190948.694783-1-cjd@cjdns.fr>
References: <20260303190948.694783-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_111103_331963_429D26C8 
X-CRM114-Status: UNSURE (   8.32  )
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

pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
registers unconditionally. If the registers are hardwired to zero
(not implemented), both base and limit will be 0. Since (0 <= 0) is
true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
gets created.

pci_read_bridge_windows() already detects unsupported windows by
testing register writability and sets io_window/pref_window flags
accordingly. Check these flags at the start of pci_read_bridge_io()
and pci_read_bridge_mmio_pref() to skip reading registers when the
window is not supported.

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/pci/probe.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index bccc7a4bdd79..4eacb741b4ec 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -395,6 +395,9 @@ static void pci_read_bridge_io(struct pci_dev *dev, struct resource *res,
 	unsigned long io_mask, io_granularity, base, limit;
 	struct pci_bus_region region;
 
+	if (!dev->io_window)
+		return;
+
 	io_mask = PCI_IO_RANGE_MASK;
 	io_granularity = 0x1000;
 	if (dev->io_window_1k) {
@@ -465,6 +468,9 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
 	pci_bus_addr_t base, limit;
 	struct pci_bus_region region;
 
+	if (!dev->pref_window)
+		return;
+
 	pci_read_config_word(dev, PCI_PREF_MEMORY_BASE, &mem_base_lo);
 	pci_read_config_word(dev, PCI_PREF_MEMORY_LIMIT, &mem_limit_lo);
 	base64 = (mem_base_lo & PCI_PREF_RANGE_MASK) << 16;
-- 
2.39.5



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC58C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 09:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SY0AIjrHU+9+v2cuVhasaUrcFgT9QZoe9hiOj54GFIw=; b=hm3QQz1MO/AdfECxHXXgagWwvh
	6UZOFZtfb9861SVLbZ1QEBv8um1LvJX0CFlJ+E7NxrWjsJJ4E4J2nUpAYMYaqpK2tM9ML7U5pcR23
	ftm3OmBtPjOiYh4iF/dzO/AWuKOj+y0/jnbh4k6ZdOUV+jmEzU6yx/QyK12SU4UVfxlCSRcBt0yF2
	VfhDsDemhMgndq6+Co31xa1GA9Yc+KWCO7iChSjgA4F1qHJuOLhzC/wAGBIIm91UF9dkeD6H8ZUQs
	WjVPdrCUOa16U7dBOPbEFOxjpRzRjLAL9rRuZovPrrWCjm7BJNE3keS3tJpkf3xsGXWu75pKt+kiV
	3G5DkrIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBs9d-00000006vYw-1Fxi;
	Mon, 05 May 2025 09:30:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBs5h-00000006umo-0pc1;
	Mon, 05 May 2025 09:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AC41BA4C762;
	Mon,  5 May 2025 09:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB43C4CEE9;
	Mon,  5 May 2025 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746437184;
	bh=DEEW58wS2e6R9G6RjworONmB4VHLR/BqqT0TK+62dZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=imPINz/N9p8vplGwTS77eut5TIULQ+m6785ixH9v9kr/5sb9bB5XdBNsrZ1Krd5zJ
	 6qC18PyPEjPKRMqaxJyUls6YTxoRt88oD6DDXIadjfXwIxOG0w1N+kQW84L1rPCKD7
	 Ib4yroTN4dB9IVbu2w/RWNTQ7h+Xd7rKpyaJnhsgtc3LwgTG/LjWTHmeRW/SxIIAZb
	 i64x4MKsNvLsz65gSDfnb/G4In3E4KuiZ0edtDdpmD7qgDchipOiUCkR01SZYp1bZb
	 hIcRArJKiPiwZdgLAHxqmm/q/4a+NebkIcEBtU6OmPbfuwn3Gosyk3BnjdytMqp7G3
	 iZ/FYfN78DThA==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Niklas Cassel <cassel@kernel.org>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/4] PCI: dw-rockchip: Do not enumerate bus before endpoint devices are ready
Date: Mon,  5 May 2025 11:26:05 +0200
Message-ID: <20250505092603.286623-7-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505092603.286623-6-cassel@kernel.org>
References: <20250505092603.286623-6-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2712; i=cassel@kernel.org; h=from:subject; bh=DEEW58wS2e6R9G6RjworONmB4VHLR/BqqT0TK+62dZM=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDIkWnS4/k8Rfbtk+yTpqiwRJiZBPualC5odPFqTFTTqW 6b2TnbqKGVhEONikBVTZPH94bK/uNt9ynHFOzYwc1iZQIYwcHEKwESufmFkeDNd9uLZ0gsaGZwv lolveH9fQD404NQLI7GmwpvHrAon6zMyHLk8x+Xng1W3ZnD+3WzwjD3B4IH9kfW+Pdw5BzRkfmd qswIA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_022625_364654_654683BE 
X-CRM114-Status: GOOD (  13.82  )
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

Commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can
detect Link Up") changed so that we no longer call dw_pcie_wait_for_link(),
and instead enumerate the bus when receiving a Link Up IRQ.

Laszlo Fiat reported (off-list) that his PLEXTOR PX-256M8PeGN NVMe SSD is
no longer functional, and simply reverting commit ec9fd499b9c6 ("PCI:
dw-rockchip: Don't wait for link since we can detect Link Up") makes his
SSD functional again.

It seems that we are enumerating the bus before the endpoint is ready.
Adding a msleep(PCIE_T_RRS_READY_MS) before enumerating the bus in the
threaded IRQ handler makes the SSD functional once again.

What appears to happen is that before ec9fd499b9c6, we called
dw_pcie_wait_for_link(), and in the first iteration of the loop, the link
will never be up (because the link was just started),
dw_pcie_wait_for_link() will then sleep for LINK_WAIT_SLEEP_MS (90 ms),
before trying again.

This means that even if a driver was missing a msleep(PCIE_T_RRS_READY_MS)
(100 ms), because of the call to dw_pcie_wait_for_link(), enumerating the
bus would essentially be delayed by that time anyway (because of the sleep
LINK_WAIT_SLEEP_MS (90 ms)).

While we could add the msleep(PCIE_T_RRS_READY_MS) after deasserting PERST,
that would essentially bring back an unconditional delay during synchronous
probe (the whole reason to use a Link Up IRQ was to avoid an unconditional
delay during probe).

Thus, add the msleep(PCIE_T_RRS_READY_MS) before enumerating the bus in the
IRQ handler. This way, we will not have an unconditional delay during boot
for unpopulated PCIe slots.

Cc: Laszlo Fiat <laszlo.fiat@proton.me>
Fixes: ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can detect Link Up")
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
Hello Laszlo,

I know you have already tested this, but could you please send
your Tested-by tag to this patch?

 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 7a6a95dc877a..ed8e3dfe80e0 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -471,6 +471,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
 	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
 		if (rockchip_pcie_link_up(pci)) {
 			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
+			msleep(PCIE_T_RRS_READY_MS);
 			/* Rescan the bus to enumerate endpoint devices */
 			pci_lock_rescan_remove();
 			pci_rescan_bus(pp->bridge->bus);
-- 
2.49.0



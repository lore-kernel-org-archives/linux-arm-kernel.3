Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42455C71153
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kq61Ud1QxXq44e5cflOyeynlbOOOGsZzUCs5cu4bf3Y=; b=gNUmUohWukAnrFDSOTsnJxC4vv
	6k8kOq0/Ue4xXyCuKuGnpkoa7iBPsCoB5UBiptLcjiGXhY1uwaHKOxjojgPdf+wVFGEFrFhA73vgR
	ckY6p2GrGaMwRDED+IW/ATGJMQaRrMI/03JwlX8HEHSykic3LYOXNw7xd/e8q2ps/bgt9+u5D+xcB
	nEv4TmA4aVqT6neYssODiOWh9klHZRDdt4axyziD5OtEHbVGXcAVNX1JU9eBwGmxFIga49Olmuo08
	POR19mriJ9ZnnjCI97g9904+NvzlTElb3edWiykOSs68Dx7UGGYiskeEVykzfMpchf1QQVQV3gEiT
	Z0uj5ZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ41L-0000000GRH3-2vti;
	Fri, 13 Jun 2025 13:00:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3qH-0000000GPmh-2d8D;
	Fri, 13 Jun 2025 12:49:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8284B5C1125;
	Fri, 13 Jun 2025 12:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3BAC4CEEF;
	Fri, 13 Jun 2025 12:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749818948;
	bh=b4dI36+7QZrufn62jpx3nCwsgQ+MzFpAS9kwu6KrqjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=st6dNrs+clIM0Xs+sDPIYqnFZJUgdbbF+07JBuLONi+zTuAZ8K9a+giRzTNKwq3/p
	 I8U+4Pef/v1MCQAfERX4Ej8w/N0S29+6ubqaUJC0EqR/qy8OOVtoSPZ/153LES6q7t
	 G6afEq4eb61e6ae/xlK54EHPIk7nSnpOeh4yQgF35yUMy6v6Ax7bzSdIcX7tyH5IHK
	 g/LElfxTgrE+th/kVxysQVuqvHAjFX5orQxuog8LFFajxk/yiJk++uR2uFt0TTcXWR
	 gtOP20twmwhV1mghT9S5tw/L+eZmuouqRKDXYJuqgM2UcTKFPiN1oxM+UwTc5BS/yA
	 KTHrrzs7bD9EQ==
From: Niklas Cassel <cassel@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/6] PCI: rockchip-host: Use macro PCIE_RESET_CONFIG_WAIT_MS
Date: Fri, 13 Jun 2025 14:48:41 +0200
Message-ID: <20250613124839.2197945-10-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613124839.2197945-8-cassel@kernel.org>
References: <20250613124839.2197945-8-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155; i=cassel@kernel.org; h=from:subject; bh=b4dI36+7QZrufn62jpx3nCwsgQ+MzFpAS9kwu6KrqjQ=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDJ85LR1d7x7b5p98mOW6IpK38Ve2XfO+h1dvCyWpYlvu lxGWMf8jlIWBjEuBlkxRRbfHy77i7vdpxxXvGMDM4eVCWQIAxenANzkHYwMP74b7TX3Xn5hJ3vy obNvjj7Z6r/1Xeh6hj7ulloDlZIqH4b/yVITGkqklBqWPJ4b06M/K7XywuJ3LVZOzL0udrzzfik yAAA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_054909_744071_0B871B2F 
X-CRM114-Status: GOOD (  11.67  )
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

Macro PCIE_RESET_CONFIG_WAIT_MS was added to pci.h in commit d5ceb9496c56
("PCI: Add PCIE_RESET_CONFIG_DEVICE_WAIT_MS waiting time value").

Later, in commit 70a7bfb1e515 ("PCI: rockchip-host: Wait 100ms after reset
before starting configuration"), PCIE_T_RRS_READY_MS was added to pci.h.

These macros are duplicates, and represent the exact same delay in the
PCIe specification.

Since the comment above PCIE_RESET_CONFIG_WAIT_MS is strictly more correct
than the comment above PCIE_T_RRS_READY_MS, change rockchip-host to use
PCIE_RESET_CONFIG_WAIT_MS, and remove PCIE_T_RRS_READY_MS, as
rockchip-host is the only user of this macro.

Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/pcie-rockchip-host.c | 2 +-
 drivers/pci/pci.h                           | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index b9e7a8710cf0..c11ed45c25f6 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -325,7 +325,7 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	msleep(PCIE_T_PVPERL_MS);
 	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
 
-	msleep(PCIE_T_RRS_READY_MS);
+	msleep(PCIE_RESET_CONFIG_WAIT_MS);
 
 	/* 500ms timeout value should be enough for Gen1/2 training */
 	err = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_BASIC_STATUS1,
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 98d6fccb383e..819833e57590 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -35,13 +35,6 @@ struct pcie_tlp_log;
  */
 #define PCIE_T_PERST_CLK_US		100
 
-/*
- * End of conventional reset (PERST# de-asserted) to first configuration
- * request (device able to respond with a "Request Retry Status" completion),
- * from PCIe r6.0, sec 6.6.1.
- */
-#define PCIE_T_RRS_READY_MS	100
-
 /*
  * PCIe r6.0, sec 5.3.3.2.1 <PME Synchronization>
  * Recommends 1ms to 10ms timeout to check L2 ready.
-- 
2.49.0



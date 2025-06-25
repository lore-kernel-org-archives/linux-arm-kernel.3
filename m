Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2391C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EYhxfF2tFpUyIMKC82u+QZb4aGzUXXECMVFHko6V/k=; b=s1rWANbhoWBgSb7R5iR0PHDnex
	/1LgCJ3hqwVLnQJ5T1euobuf+OPf/9YtNoQGCXtV36CP3iEMYCBUYIZt1FoZctg/Ag8uOGdLtJg6M
	f17HDF/U45F2f1AiSxqp66Le0lehPye5YQjgYcBNQHsy8CJXb9/+FrfI7u3kIyY4ghk6uyveFMBOZ
	wkJJgeP7OZ5ej7xJTpbc5QENZwkNXouz33RiQAz9rhCznRfMfSjTQ3Y7Wqa4zHfmSHfhLuawugfsW
	woL9mjaXjm3z2B95CUYU8nlSPHHHahCI8dFcReMpgSb7QRqHIzOAzD7dbqCi8v6lLTyjJBC1kLGgu
	FG2gt5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQLq-00000008q7s-0EPE;
	Wed, 25 Jun 2025 13:39:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNIc-00000008Ik4-0ciR;
	Wed, 25 Jun 2025 10:24:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80A5243CC2;
	Wed, 25 Jun 2025 10:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABC7C4CEF1;
	Wed, 25 Jun 2025 10:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750847053;
	bh=F2ftyv+Q/EHTUyO7jIwBMNf62KBdMrEQKTlHC9NEFOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XQ4WearlTSgu+KRp7gt3QpzQdipavHkEEt4AAHZ1HbSpHdMMNEo8WdSQ3RXzwNYBf
	 07KZI3YHjgi2e9Olh7jQMsQQnv+v2reKQ+kKFw17K322jjE0OoBaUH7VN2tRGkkh+Z
	 dP7/JIarM3I3PEYnwbAVE0PnsL8lzGrkLJXVcxfBIRmDCurn2CEkF6UKqXO31Sq2SR
	 6XCkKdtYESboPHwRa3WgXwX5Zgpkc/hgJgbJ0KcjGkNXChuFVVTDf0Sc44kO1ZWpzZ
	 /0flIJysotNd0DKRktGbq2Sh8C0YlOP7fb+0pvf59DYSbh7L1qvrlK/50iYuyFpodr
	 zJ3YfNjC321rw==
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
Subject: [PATCH v4 2/7] PCI: rockchip-host: Use macro PCIE_RESET_CONFIG_WAIT_MS
Date: Wed, 25 Jun 2025 12:23:48 +0200
Message-ID: <20250625102347.1205584-11-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625102347.1205584-9-cassel@kernel.org>
References: <20250625102347.1205584-9-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163; i=cassel@kernel.org; h=from:subject; bh=F2ftyv+Q/EHTUyO7jIwBMNf62KBdMrEQKTlHC9NEFOM=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDKiz1kobrN5bBI29VGoYV7nFy6XS3rqbbrCxV1H+fe8X rXjt5hLRykLgxgXg6yYIovvD5f9xd3uU44r3rGBmcPKBDKEgYtTACZSIsDIMD+uq1RE+1ZHs4aY h6/Fw4IyNWUm9nc7dns4nX8rnZw3g5HhSsn1X789np5lcTh9oqx94hOpv0FJM01+vyiR2dXeGrC FBQA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_032414_223852_4585508C 
X-CRM114-Status: GOOD (  11.99  )
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

Macro PCIE_RESET_CONFIG_DEVICE_WAIT_MS was added to pci.h in commit
d5ceb9496c56 ("PCI: Add PCIE_RESET_CONFIG_DEVICE_WAIT_MS waiting time
value").

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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F51EC01CB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MKh/LFtxEIacTQ1pggWkOg0EVYz80WyyINb3nT37t1M=; b=q1PixaHOgDVVdptDu+6sf/kWSR
	TpPPhyGO9tVj2gkBNV/9iB9LL1+E7DNoLk7FKKe9WERc83SxjLJoJdZ+EL+DHMr/1X8+wvygu1YRW
	b5wrjm/mFZeROHYJOVvmxZXKzIUcIMOFNWRt9MA7263WxNc+QqXMdXz2ku3jTF+8BYKQvdJ/sF9XZ
	AXQYGGwoy+ofntEsTAfptbPuQhIVpQb+WEzZyrMThCSni7c5u9g3aUMV46KCSAYamGh0YWFhCqhHi
	BwrEWXFTYkfPd5v0xJItU2opY4wjNbijIK52QpuJrVUGsyJ+T4tzkXatnKumXgB8TBQgV0mTwzb6i
	z+Y3bN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cwV-0000000GY95-2U27;
	Mon, 23 Mar 2026 10:55:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cwT-0000000GY8U-11p9;
	Mon, 23 Mar 2026 10:55:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 81CC843A3E;
	Mon, 23 Mar 2026 10:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6015C2BC87;
	Mon, 23 Mar 2026 10:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774263327;
	bh=9W56aQ9O2mCnQ68QZ3yP7ENAZ8roACbMFM6v0WstbDc=;
	h=From:To:Cc:Subject:Date:From;
	b=nlmGxLEHSUrmO6dGX9NfuiTACxpIM89yJRQ5e9uDl9gh/61aw5ZTMKtKe5tLdpk1r
	 i//eTpYRvrJ7TvtTPkYeHT/1C53DUgO/gGmSrMCu4dbtkGNQLRAQViRV0ZkdlxGKM1
	 RezVSBNrU1EaBspJcwxzMGphD+0TptcTQTPtF4oT9weKtiafWU4VfSyqSVF9Bla4Od
	 iMqnv729/J/fXv328InJzqfMdxwXnZSHwoMFmTMpoAtKAQJdqfwsfCCOIsahBA9uIe
	 is4SMMMn/hNGgn7nGu6vRXcXHOHamRb3+lfB4SVTaCj9AAE/N/EjxDprw3tepG/NJi
	 Oz5RVDtd9vcSg==
From: Arnd Bergmann <arnd@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] PCI: mediatek-gen3: select PCI_PWRCTRL_GENERIC correctly
Date: Mon, 23 Mar 2026 11:55:06 +0100
Message-Id: <20260323105520.461640-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_035529_328122_87C22BE9 
X-CRM114-Status: GOOD (  12.25  )
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

From: Arnd Bergmann <arnd@arndb.de>

The PCI_PWRCTRL_SLOT option was renamed to PCI_PWRCTRL_GENERIC, but a new
user showed up using the old name, which caused a build failure when
both conflicting patches are merged:

aarch64-linux-ld: drivers/pci/controller/pcie-mediatek-gen3.o: in function `mtk_pcie_remove':
pcie-mediatek-gen3.c:(.text+0x137c): undefined reference to `pci_pwrctrl_power_off_devices'

Use the correct symbol as intended originally.

Fixes: ff124bbbca1d ("PCI/pwrctrl: generic: Rename pci-pwrctrl-slot as generic")
Fixes: 073a7e1b7bcc ("PCI: mediatek-gen3: Integrate new pwrctrl API")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pci/controller/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index e72ac6934379..686349e09cd3 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -222,7 +222,7 @@ config PCIE_MEDIATEK_GEN3
 	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
 	depends on PCI_MSI
 	select IRQ_MSI_LIB
-	select PCI_PWRCTRL_SLOT
+	select PCI_PWRCTRL_GENERIC
 	help
 	  Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
 	  This PCIe controller is compatible with Gen3, Gen2 and Gen1 speed,
-- 
2.39.5



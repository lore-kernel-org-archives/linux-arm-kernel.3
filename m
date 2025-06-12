Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C2FC71143
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=28r9o4XcIg4LmBzbPFAjzXFJOw4dentxCSNmN52243c=; b=uWXJMJ8gmFiVESetYlpqSLQIgz
	FTPPLwm5ePBmsumIHYcegwL2+3IWD6RkUk2Jd0Dz8NjI2FnuDd5Mq0eARRfTLq0OVgk4PCmc8t3zZ
	8Cpr60LxjXghfJ2oxS4/0TIJ8NwpNk6ODcSXFny/F5UvvHtmCG9F+znatYYc9hxiz/WjA5UnEjCJ9
	DMgs1HlPJ3dl8/uzs7o7c76VaxlwY/1a4kUY2YFTx45TWa8TIDRmlomXdiPQHl82KP/VKmNN/VHYS
	7vPiSKH4kwBULY2jzZr4wRuIkgMdCaEtf9xvjiedHt59FfgEpK2KeFxnLqS1v+WmnGvC8cWwytHn8
	fpjLX1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhqR-0000000DO8R-3eIy;
	Thu, 12 Jun 2025 13:19:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPgRJ-0000000DBhN-10mi;
	Thu, 12 Jun 2025 11:49:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72B47A51C34;
	Thu, 12 Jun 2025 11:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61258C4CEEA;
	Thu, 12 Jun 2025 11:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749728988;
	bh=njIe3vfl/yf5a86Ak2CvrAcNRqdijy5GYXgG3V1TR/Q=;
	h=From:To:Cc:Subject:Date:From;
	b=aR2f9CzX4sSdrcF01pGjRWKZr3p5X2TCpNofdfzPk+Whcf3aQIjbaVvLHASzaA8VR
	 Ahg5SQQTsjzoYwwndIrmsZJ6bhIVUH8WWsSBUgKyeN3lIabuKC4Tf7K74Ioqk1471x
	 AOw6553PZud0t0e23XIFz4uJujc1WAvGx1pkz6nIHaP2SvG3xBXUQqbVWZFP7Rq/a5
	 UCTpG3aw8C4bbWTW/CaHPTMHIKX9ngyp1qN9Y6PSYhQSLi8VM+duuZBcVuhJtRB5E7
	 FQ3ce7GO/0If2ta0VEmtQx/XLCTfgdXwisiGIqvB8xldCdqGEvTqUmOReDhv6MQCCp
	 cEhVg2r91nWoQ==
From: Niklas Cassel <cassel@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/5] PCI: dwc: Do not enumerate bus before endpoint devices are ready
Date: Thu, 12 Jun 2025 13:49:23 +0200
Message-ID: <20250612114923.2074895-7-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672; i=cassel@kernel.org; h=from:subject; bh=njIe3vfl/yf5a86Ak2CvrAcNRqdijy5GYXgG3V1TR/Q=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDK89h3m2vVR+7+JaGj15ilvzx6Pt/HZqLl0zfpvcXVTK 76sln64raOUhUGMi0FWTJHF94fL/uJu9ynHFe/YwMxhZQIZwsDFKQAT2cLB8JutaP6tsqf56uE9 wuVTp1tNPtR5+TjbPw+7z1/Xs+9c5fqf4b/rVptpMlkFh7W2Wa4/pV9cHFEqwLR0+iI12RXOHJ/ /zWUDAA==
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_044949_348116_5DBEC96D 
X-CRM114-Status: UNSURE (   8.10  )
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

Hello all,

The DWC PCIe controller driver currently does not follow the PCIe
specification with regards to the delays after link training, before
sending out configuration requests. This series fixes this.

At the same time, PATCH 1/4 addresses a regression where a Plextor
NVMe drive fails to be configured correctly. With this series, the
Plextor NVMe drive works once again.


Kind regards,
Niklas


Changes since v1:
-Put msleep() before the dev_dbg() that says "Enumerating bus" (Damien)
-Rewrite comment above LINK_WAIT_MAX_RETRIES / LINK_WAIT_SLEEP_MS (Damien)
-Remove comments above PCIE_RESET_CONFIG_DEVICE_WAIT_MS (Bjorn)
-Use different Fixes-tags (Bjorn)
-Shamelessly took Bjorn's commit message for patch 1 and 2 (Bjorn)
-Use PCIE_RESET_CONFIG_DEVICE_WAIT_MS rather than PCIE_T_RRS_READY_MS
-Add new patch (5/5) that drops PCIE_T_RRS_READY_MS


Niklas Cassel (5):
  PCI: dw-rockchip: Wait PCIE_RESET_CONFIG_DEVICE_WAIT_MS after link-up
    IRQ
  PCI: qcom: Wait PCIE_RESET_CONFIG_DEVICE_WAIT_MS after link-up IRQ
  PCI: dwc: Ensure that dw_pcie_wait_for_link() waits 100 ms after link
    up
  PCI: dwc: Reduce LINK_WAIT_SLEEP_MS
  PCI: rockchip-host: Use macro PCIE_RESET_CONFIG_DEVICE_WAIT_MS

 drivers/pci/controller/dwc/pcie-designware.c  | 13 ++++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h  | 13 +++++++++----
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  1 +
 drivers/pci/controller/dwc/pcie-qcom.c        |  1 +
 drivers/pci/controller/pcie-rockchip-host.c   |  2 +-
 drivers/pci/pci.h                             |  7 -------
 6 files changed, 24 insertions(+), 13 deletions(-)

-- 
2.49.0



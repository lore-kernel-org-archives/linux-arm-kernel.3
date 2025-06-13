Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1231C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 12:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f/oRT/4Rj4YQ+sHDh0VJuIt8B2OVLtgUUr8fhvOhIUg=; b=jsu/kwqc05rorEnJGbYUyg2/+b
	HYbHbsDNr+7LWFgjVS4gJB/NPy3f7mbeAwx7Uye5Y3exmsBiS1bEi6dqAd83r00BSsoUflNqlNyhy
	yuLeprP1aadQLWuxQWRQ5qGXcyuV8UU/TkY3DTujz/kur+xDvRBJ4yQhy2cR5fwaybYgykg0QdsYw
	4dIDzzqbK/vFR6GEiMmDKf6jLw+ye//WDAaL6LJMRAhOLj+tcS+4vJFetjHYbgnPRXd9fILI7uDji
	uig1Q2lEp8OIPtOE8cGwSxsW/tsl8rmeViVzgxDIXGDGsE2k0uVarR6/OHdMIvyLJATpNfEv3OvvF
	aOJHqiAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3sT-0000000GQOc-0llF;
	Fri, 13 Jun 2025 12:51:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3qA-0000000GPjH-3io0;
	Fri, 13 Jun 2025 12:49:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A7C15C6850;
	Fri, 13 Jun 2025 12:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D874C4CEE3;
	Fri, 13 Jun 2025 12:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749818942;
	bh=lY5lvyrHBT8EJhIYRpQOHfrFcbIbm6kOsukAGhdT2Iw=;
	h=From:To:Cc:Subject:Date:From;
	b=FW65r17WdfE6MjArMQkRm2oxVaGHClYP3au0iY0ESm8NFdHCdHTkpaX8zT/5tDSUq
	 ruQq5dTqczynLIxxiw+xOdqMlqFYESrYBtJlV4vqB/LXH82lyLRb3JhG9LZ9leNSS8
	 qGPKog3L9/qaSzPlWccN/IGphxzBjLeHGcuHowsDgH2Mezh6MrSTxCKDuV2FAnjOod
	 inBkUPIPSYyJ8rI0xzogm2Fdl43W7/LvGHZ5MDL7UCnbUSplDINyr3VUcx5j5inM3U
	 IvDVHZlHzg28GtVUUN3/Nax3EBvQoEUyaUXeI3bVw2LGiq4bEFhFLqvusO7EfPJcx4
	 CfW9ECGFl2vaQ==
From: Niklas Cassel <cassel@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kevin Xie <kevin.xie@starfivetech.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Niklas Cassel <cassel@kernel.org>,
	Simon Xue <xxm@rock-chips.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/6] PCI: dwc: Do not enumerate bus before endpoint devices are ready
Date: Fri, 13 Jun 2025 14:48:39 +0200
Message-ID: <20250613124839.2197945-8-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1417; i=cassel@kernel.org; h=from:subject; bh=lY5lvyrHBT8EJhIYRpQOHfrFcbIbm6kOsukAGhdT2Iw=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDJ85NRffhTk2R4SM+P3h8I+tijv6m7n4w13Euerrpk9f e9XZ9/tHaUsDGJcDLJiiiy+P1z2F3e7TzmueMcGZg4rE8gQBi5OAZhIRSjD/6j9+h0uZlbzp8pb 7j19de6r57L8sntMOdLKTyn/P1+7Opfhf+66vkW8cgGmrUqLNlW6JG01mpDXmtxhuEOwaEOSjLs HPwA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_054902_966733_B873E980 
X-CRM114-Status: UNSURE (   8.46  )
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


Changes since v2:
-Rename PCIE_RESET_CONFIG_DEVICE_WAIT_MS to PCIE_RESET_CONFIG_WAIT_MS.


Niklas Cassel (6):
  PCI: Rename PCIE_RESET_CONFIG_DEVICE_WAIT_MS to
    PCIE_RESET_CONFIG_WAIT_MS
  PCI: rockchip-host: Use macro PCIE_RESET_CONFIG_WAIT_MS
  PCI: dw-rockchip: Wait PCIE_RESET_CONFIG_WAIT_MS after link-up IRQ
  PCI: qcom: Wait PCIE_RESET_CONFIG_WAIT_MS after link-up IRQ
  PCI: dwc: Ensure that dw_pcie_wait_for_link() waits 100 ms after link
    up
  PCI: dwc: Reduce LINK_WAIT_SLEEP_MS

 drivers/pci/controller/dwc/pcie-designware.c  | 13 ++++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h  | 13 +++++++++----
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  1 +
 drivers/pci/controller/dwc/pcie-qcom.c        |  1 +
 drivers/pci/controller/pcie-rockchip-host.c   |  2 +-
 drivers/pci/controller/plda/pcie-starfive.c   |  2 +-
 drivers/pci/pci.h                             |  9 +--------
 7 files changed, 26 insertions(+), 15 deletions(-)

-- 
2.49.0



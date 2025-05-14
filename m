Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E314EC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 07:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I51UIOUgsZ/TmCt5o/0O9IKc/wDLB460xX0boWndr6M=; b=BGvGBFjLvBt76ya56t9YLVzCdY
	WSo/K0TYho+d5vAFU4MbfUed5MVR1n+qwT5AxH1BXFjvm/xxTstaApyo78HXvl84zAAW4LXTDXGLO
	cXZWlcWnuYGiP+B3pZ2LESJie/5BvxWN7bk9QyLenSaxSdCJblc863BYLtpnO99PrQYQ/tUXfD/hd
	rFdaHhFUqoprK8pQzeMzvbvo/hVCI20s3Dn4enfVa1ceku+ilUcjI3LSKJ5Rplwje40uCrmGrl7xw
	Nn+K5/SNoQ3RldSDKFU7mgCH0MHqAOw6VqmZB/njsqkfFJzkbqPlCYGJEu9q8q+00PxmCFJq25feh
	kggsmrzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6oN-0000000EO6Z-2d7e;
	Wed, 14 May 2025 07:45:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6ly-0000000ENXS-2j91;
	Wed, 14 May 2025 07:43:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B214B43A01;
	Wed, 14 May 2025 07:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5892CC4CEF0;
	Wed, 14 May 2025 07:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747208605;
	bh=IlNY+N9xZbP25gW4EGqg6yQNRWjc9oFtjCsewb4Lipc=;
	h=From:To:Cc:Subject:Date:From;
	b=ZTzZu+lLM2/EY5NaqE4555dxzcvf9L5+n1Q/AqvAOPJ4l5CNK3mFqBHEdRjHx8QHF
	 Pr700C7l1M2TO+k1PNW8D5/VoiYK6l5SRDWP6dvmPcI/PmDmquobLex6zmBbgU64Hn
	 w8et4LvHFqbZV0//7yP2mp2YROFqdzLUD6CwH2JEQwZeElBnZuOz/7QQwPQMCY2qjC
	 x6POWwDGHOaa0CHcAvZBe19ZB197JnDPwH2d4zNuV+OKH798iWeBngrzQztZpJrM5k
	 iGs2pMt5+CcS2N10zCIhv5NSTOfreZCNGaex9g1Z2Y1E7mcvMFN9n8Ux775y1Q5hpI
	 BREF6ztaRl+Bw==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Alan Douglas <adouglas@cadence.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/6] PCI: endpoint: IRQ callback fixes and cleanups
Date: Wed, 14 May 2025 09:43:13 +0200
Message-ID: <20250514074313.283156-8-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=cassel@kernel.org; h=from:subject; bh=IlNY+N9xZbP25gW4EGqg6yQNRWjc9oFtjCsewb4Lipc=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDJUPCf+XWco1erKs6pN+l7Gp1NrNKoq10le+N4UuLKjS 9W7+d/jjlIWBjEuBlkxRRbfHy77i7vdpxxXvGMDM4eVCWQIAxenAExkxleG/xWmYoVW9l+5t1e+ 3fr01zXeOov4BWwtH2LFJ/f0xX56asDwvzx2gufxZNGYp+vMX81gFu4sTOyJs7L0j/B8I7OJ+5g 7BwA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_004326_710961_DEDA79DE 
X-CRM114-Status: UNSURE (   9.80  )
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

The first two patches in this series are IRQ callback fixes that should
get backported.

The reason why the bugs existed in the first place is because the APIs
are very confusing. The rest of the patches are cleanups of the APIs.
These cleanups should not get backported.


Changes since v2:
-Reorder patches to have more logical ordering
-Capitalize first letter after prefix (Krzysztof)
-Improved commit message of the cleanup patches (Damien)
-Renamed parameter interrupts to nr_irqs (Damien)
-Picked up tags. Did not pick up tags on patches that changed significantly


Niklas Cassel (6):
  PCI: dwc: ep: Fix broken set_msix() callback
  PCI: cadence-ep: Fix broken set_msix() callback
  PCI: endpoint: Cleanup get_msi() callback
  PCI: endpoint: Cleanup get_msix() callback
  PCI: endpoint: Cleanup set_msi() callback
  PCI: endpoint: Cleanup set_msix() callback

 .../pci/controller/cadence/pcie-cadence-ep.c  | 14 +++++-----
 .../pci/controller/dwc/pcie-designware-ep.c   | 15 ++++++-----
 drivers/pci/controller/pcie-rcar-ep.c         |  8 +++---
 drivers/pci/controller/pcie-rockchip-ep.c     |  9 ++++---
 drivers/pci/endpoint/pci-epc-core.c           | 26 +++++++------------
 include/linux/pci-epc.h                       | 11 ++++----
 6 files changed, 39 insertions(+), 44 deletions(-)

-- 
2.49.0



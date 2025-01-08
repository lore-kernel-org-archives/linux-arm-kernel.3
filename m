Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86258E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r1vchdxwtjZo+6Rp8Nb2W6KH+ugQ3PDqO9YWKmwMMIs=; b=FAAadscYQS7+q4
	5NEHQ+Y5Vnsb3FIcQTJH4SwaP1ORjXz+rtjink7g/VcjzSw3JCiowL24uhyOvaJfFhT6BrnCEPVdm
	UWwhwubkHV1b7caQOsmuH0cvFGBJxTe3yFm5Ik2tswTGe9v0FakmeoDK17CZDe1JQ4ueAkE/4YvqA
	fCAZgCr3obUg9xcy+IKbOILolu/QVHGvhjhUEFzBeMvcmjIBpa/bi3GNFF1pbEj1/F+GnxtI17u5V
	R5KGAC+4yA+p58U4GjG5ivmvWlH6o+f0tCwAJNB8LFbiI9E/vU4a3BM97z8d9IwD7+p5b255eV/b8
	HOTtVFJoSyJFbtbpsgJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSsa-00000007tl1-2B8G;
	Wed, 08 Jan 2025 10:01:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSiK-00000007rxc-3Yua;
	Wed, 08 Jan 2025 09:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 365165C2E18;
	Wed,  8 Jan 2025 09:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE7BC4CEE1;
	Wed,  8 Jan 2025 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736329860;
	bh=fUoWeZRO/HpW76L68BYVrr8hfn5nR1LoYeez3wpOXUg=;
	h=From:Subject:Date:To:Cc:From;
	b=iJFG92gz+jc4FqLGAbBNKQL3bo3cAYGD9Ol/xK1HqXkvE1NPhed37KLtNQY2GXR5q
	 lstqk+zktqh0F2H2VcMpjwJwdPwPnweQWLT0i0VA9fnrVoEtEzREDolzVyVUxHxIYV
	 ei7X2zCJfZ1/C5BwhnCFU5UseygPTlDMuzYmaUBWMEZcN1mchB07Lt9MJYbUnMpvUn
	 4xXTPl0BysZUakTTQRyZxIaX+SKb1rU5NgcgZwBKdd31o285kMU7YYndzhYg5Th4cv
	 vzDCpJydaZeTvGvMaVwDP1sfxyNrbCvdvaz+pTGIELBHVHaxGeKr44R9psZ2VloThY
	 r+frWP+b5YpLA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v6 0/5] PCI: mediatek-gen3: mtk_pcie_en7581_power_up() code
Date: Wed, 08 Jan 2025 10:50:39 +0100
Message-Id: <20250108-pcie-en7581-fixes-v6-0-21ac939a3b9b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG9KfmcC/x3LQQqAIBBG4avIrBvQyLKuEi1E/2o2FgoRRHdPW
 n483kMFWVBoUg9lXFLkSBV9oyjsPm1gidXU6tZqox2fQcBIg3WGV7lRWHdxNA7W295Q/c6MP9R
 tXt73AwVH/KhjAAAA
X-Change-ID: 20250108-pcie-en7581-fixes-04d918e5a561
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_015100_938186_3632A314 
X-CRM114-Status: UNSURE (   9.09  )
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

Minor fixes and code refactoring in mtk_pcie_en7581_power_up() routine

Changes in v6:
- remove mac_rst support for EN7581 since it is not needed by the SoC
- fix typos
- Link to v5: https://lore.kernel.org/r/20241130-pcie-en7581-fixes-v5-0-dbffe41566b3@kernel.org

Changes in v5:
- fix comment in patch 3/6
- fix commit log in patch 5/6
- Link to v4: https://lore.kernel.org/r/20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org

Changes in v4:
- fix comment in patch 4/6
- Link to v3: https://lore.kernel.org/r/20241116-pcie-en7581-fixes-v3-0-f7add3afc27e@kernel.org

Changes in v3:
- add trivial patches 5/6 and 6/6 to the series
- rename err_clk_init in err_clk_prepare_enable
- fix commit log for patches 2/6 and 3/6
- Link to v2: https://lore.kernel.org/r/20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org

Changes in v2:
- added trivial patch 4/4
- improved commit logs and comments
- introduced PCIE_MTK_RESET_TIME_US macro
- Link to v1: https://lore.kernel.org/r/20241107-pcie-en7581-fixes-v1-0-af0c872323c7@kernel.org

---
Lorenzo Bianconi (5):
      PCI: mediatek-gen3: rely on clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up()
      PCI: mediatek-gen3: Move reset/assert callbacks in .power_up()
      PCI: mediatek-gen3: Add comment about initialization order in mtk_pcie_en7581_power_up()
      PCI: mediatek-gen3: Move reset delay in mtk_pcie_en7581_power_up()
      PCI: mediatek-gen3: rely on msleep() in mtk_pcie_en7581_power_up()

 drivers/clk/clk-en7523.c                    |  1 -
 drivers/pci/controller/pcie-mediatek-gen3.c | 57 +++++++++++++++++------------
 2 files changed, 34 insertions(+), 24 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20250108-pcie-en7581-fixes-04d918e5a561

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



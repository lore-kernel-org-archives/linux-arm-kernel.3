Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E87CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L9nB5W8rMDhjNlN9MlnTrlsMTVtGyPd1QPC7FKAvfLM=; b=OI2WpAc1hIOIC4
	4d9PHSNtHM20wKGT3WJNMhV18pE2wGlaeEydz+7eS/mrqf6caNXmfscTkPeJ+y1lVQzXdRyL584FK
	DoIisZ+abkwyo+cnv7Qxy0h/57PNNrZeWQjX29ZicpH1CIZOHJVbHsa5s9Ah4p4knq6BHKDcEwH2w
	QZnU54Hnmnyz5eSGtB5GTk+RGBz3CRVqkX/efSkREAgMc6CbAZLMHppKpXKAKdAwWq/K1Dx2qqpOU
	pZ64W52cZyX8B3rzZtJ7hqV3zR06/Br6iwax7dT6PwzW82hdzLO5n1uVtzbA34hORMwZvfpfoVL+G
	pOQZUK1EUgDkvyN4D2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAQ0-00000002IRu-1wwk;
	Wed, 29 Oct 2025 17:57:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAPx-00000002IOl-32KV;
	Wed, 29 Oct 2025 17:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761760622;
	bh=ObU1xjT7JAA7PqNYLw1LzJzSMyQNrZXDdS3snuzBFwQ=;
	h=From:Subject:Date:To:Cc:From;
	b=JgqLGY3qRvEnHd64TPO99fpsj3yPGyAjhNp9Ls+lZhhz7DS/7rcJB5LPAYp+kIFbH
	 5iOo2DqXSbEnXhgDf2ALUoxA1pxQ3VuDnJlNc4w8ReHJA1zpQE5y3mLm+m7J4gK+jq
	 Tcrkb8p1LYWuoYmcE+leujLve4NLOEPVPFoOar60G8c4LF+2TVS1UR2ny18l/f6uCj
	 iwt+9ot+XojTVSOHFtTuX1TD15huMtyGI1Fr7CgxaLAGrvWxpttjjIZtcqqQrSELYv
	 Bfg55bQ17CeXPD5fkipshXnH4Gxlgy+LuV3ZvwOTuoxdrwjwA3DxyGXnb7Vo8vJdBm
	 CK/bkrnKOdllA==
Received: from jupiter.universe (dyndsl-091-248-085-053.ewe-ip-backbone.de [91.248.85.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B39117E12BA;
	Wed, 29 Oct 2025 18:57:02 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1AA47480044; Wed, 29 Oct 2025 18:57:02 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v4 0/9] PCI: dw-rockchip: add system suspend support
Date: Wed, 29 Oct 2025 18:56:39 +0100
Message-Id: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdVAmkC/x3MwQqDMAwA0F+RnA3UoFvnr8gOGuMMY7U0TjbEf
 7d4fJe3g0lSMWiLHZJsarqEjLosgOc+vAR1zAZy1FSOPKaF3zxrxMgqaH9b5YP2tShhRH/jyfn
 +PhA9IBcxyaS/q++ex3ECbY/hhW4AAAA=
X-Change-ID: 20251028-rockchip-pcie-system-suspend-86cf08a7b229
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3171;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ObU1xjT7JAA7PqNYLw1LzJzSMyQNrZXDdS3snuzBFwQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGkCVW1ndM+n1Si+JdT6O2m9KNQnyob4o/Uf7
 dq3Gk2JnLCq9IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpAlVtAAoJENju1/PI
 O/qa0DgP/j9QvWe+g+UOtj0/VSLCp2Ms0qwURIWZxgrNWk5i+O7moNHbLrAkzWrzKcg9WNR+nXj
 g1x9XPjj5wmomRfW78NoHVXkLSJ1nC/149FrBHQ96RO7fhPTDMGx7wZSfIfhVPpSjUQ7UmJdMw+
 S9gNZX5p5A4HoM+WGAi59e2NT9Z6aO6+9EyYgf4Yu3nEspfoQ5De/nfhNW04KmbmuvlfpVGLyc5
 IEOmsWrlBqwDg1U9R/nAFwVUOscE+IAMbhXrrpt2jZoa4QJp1oK2o0P+XuwCJddc3nSeseDalZ9
 SQhelIkR5xw9J+cXRKmWhT+W6bOmgub4pT01kFuHKfi4y3pxxeCJwC8wsyIMcGMMFSkET5AMguv
 +jtU7fcRyR2bBELeA2TMRhC1amS9zlbu9YAl+BK1Me5qo52dCtLcdFgpgfblllKOT6XXmHgf7Za
 NRHoqfv4JWqxF56gDeUrGHm7GsHh9YnOkSOPWtl79EB/ZHY91yUTa8AYjuVR5BF82fwSHldIcb7
 jo8a33ewiCyE+WY19ETR33pCrEpNrFJChfPcJLzB2YcEJxa1EoMujq25F3Yr89W1SraG21locgO
 4LJBs+AfmRJ69I8+Qg7Mkh8PREBX3dqjVIf3o1eFAoXor1BX21h1Od+nAp9fz++u7H6nAfpoXJB
 ckEOWDtVwOSTLGvCt/s0uCA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_105705_932067_C4E5EE1E 
X-CRM114-Status: GOOD (  12.86  )
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

I've recently been working on fixing up at least basic system suspend
support on the Rockchip RK3576 platform. Currently the biggest open
issue is missing support in the PCIe driver. This series is a follow-up
for Shawn Lin's series with feedback from Niklas Cassel and Manivannan
Sadhasivam being handled as well as some of my own changes fixing up
things I noticed.

In opposite to Shawn Lin I did not test with different peripherals as my
main goal is getting basic suspend to ram working in the first place. I
did notice issues with the Broadcom WLAN card on the RK3576 EVB.
Suspending that platform without a driver being probed works, but after
probing brcmfmac suspend is aborted because brcmf_pcie_pm_enter_D3()
does not work. As far as I can tell the problem is unrelated to the
Rockchip PCIe driver.

Changes since PATCHv3:
 * https://lore.kernel.org/linux-pci/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/
 * rename rockchip_pcie_get_ltssm to rockchip_pcie_get_ltssm_status_reg
   in a separate patch (Niklas Cassel)
 * rename rockchip_pcie_get_pure_ltssm to rockchip_pcie_get_ltssm_state
   in a separate patch (Niklas Cassel)
 * Move devm_phy_get out of phy_init to probe in a separate patch
   (Manivannan Sadhasivam)
 * Add helper function for enhanced LTSSM control mode in a separate patch
   (Niklas Cassel)
 * Add helper function for controller mode in a separate patch
   (Niklas Cassel)
 * Add helper function for DDL indicator in a separate patch
   (Niklas Cassel)
 * Move rockchip_pcie_pme_turn_off implementation in a separate patch
 * Rebase to v6.18-rc3 using new FIELD_PREP_WM16()
 * Improve readability of PME_TURN_OFF/PME_TO_ACK defines (Manivannan Sadhasivam)
 * Fix usage of reverse Xmas (Manivannan Sadhasivam)
 * Assert PERST# before turning off other resources (Manivannan Sadhasivam)
 * Improve some error messages (Manivannan Sadhasivam)
 * Rename goto labels as per their purpose (Manivannan Sadhasivam)
 * Add extra patch for dw_pcie_resume_noirq, since I've seen errors
   during resume on boards not having anything plugged into their PCIe
   port

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (9):
      PCI: dw-rockchip: Rename rockchip_pcie_get_ltssm function
      PCI: dw-rockchip: Support get_ltssm operation
      PCI: dw-rockchip: Move devm_phy_get out of phy_init
      PCI: dw-rockchip: Add helper function for enhanced LTSSM control mode
      PCI: dw-rockchip: Add helper function for controller mode
      PCI: dw-rockchip: Add helper function for DDL indicator
      PCI: dw-rockchip: Add pme_turn_off support
      PCI: dw-rockchip: Add system PM support
      PCI: dwc: support missing PCIe device on resume

 drivers/pci/controller/dwc/pcie-designware-host.c |  13 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c     | 220 ++++++++++++++++++----
 2 files changed, 198 insertions(+), 35 deletions(-)
---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20251028-rockchip-pcie-system-suspend-86cf08a7b229

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>



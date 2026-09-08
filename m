Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32822C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a3JgGm+CVyoxAOevaw7AtfNvefPiK16Y07EKaFHJswg=; b=TT0b4aYssMvJUl
	cG52zEwOcWS5iWwX2mLxksLqQQSwaQgdhp5Wpa3bjYsNacvZFq+J31rOewXDT/Kn4CVoTvKSNVdq0
	/YM+DtdcazoaZ4Fj9huvWHiL1rEh4PRo4BnIn18PEacMp3RGj3RMAPxicsuR1QoJysBmcNkawBJ4o
	f07GHiMiq2LmJgBQtpPm7r3YK1/okgwX4RAL9Ag0HQayMdoOkyUMYp7Er1kKCtnqoZxw0toWHzmRe
	4S9Tg0WRDVLxZ0puxp1H4CuRuKYhbxoKCqAxnMFwlmpw+Y4QCBGhbIzidj5CIh1TR1+Mzxz6EGy7J
	gUMi0naeu0Zb3QU6jtZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAt-00000009KHi-2NYQ;
	Tue, 08 Sep 2026 14:51:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAl-00000009KAn-3aKG;
	Tue, 08 Sep 2026 14:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788879100;
	bh=mw+ZZFpY0CwtuUCkiFx/dEH98jsQ+ra9TZNRzdkH4zc=;
	h=From:Subject:Date:To:Cc:From;
	b=G4oXSMMAfnL9UCufRSgmnMT2vLwqgws5d2WQqM57hG9dQ7Wdcj2JAbEeNXOjm3p/o
	 idhxiWcqS1lYN/yu7c80rZlqosKTRoJIOUfMjvvD8nsJ5fZSu+NzJ8+DCENPQDKcLj
	 8tPvDHKP2dfawQp8v25iyzkTxhEtJ85zx/feDNkP9eF/6ZA27znlKA+9KB/+Mhd77T
	 GfvFcLsrIJm10olPgFx0xXkZ+1IAetA38nnXEwTZJLwG+BRGAn8785MzwP3UkcinHw
	 +oT2l2t38h9sBtJ8Wsj9B+9kFIiiJTHCbJJejmaTIOObVhCn+jRekZ8aMpUAS0KVW0
	 xv32K59MkUYhA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5A8117E0945;
	Tue, 08 Sep 2026 16:51:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8C5C548002B; Tue, 08 Sep 2026 16:51:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v6 00/10] PCI: dw-rockchip: add system suspend support
Date: Tue, 08 Sep 2026 16:51:18 +0200
Message-Id: <20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNvQ6DIBiF4VsxzKVBFNROvY+mAz+flVSFgCU1x
 nsvmrh0aMf3DM9ZUABvIKBLtiAP0QRjxxT8lCHVifEB2OjUiBLKckJr7K16qs447JQBHOYwwYD
 DKzgYNa65akktKklpgxLhPLTmvfO3e+rOhMn6eX+L5bYecPMbjiUmWAGFXBLeUE2vyva9kNaLs
 7ID2vDIDpCTIud/QJZAJiUTuqg0L4tvcF3XD/guwdsdAQAA
X-Change-ID: 20251028-rockchip-pcie-system-suspend-86cf08a7b229
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4379;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=mw+ZZFpY0CwtuUCkiFx/dEH98jsQ+ra9TZNRzdkH4zc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqgIPz0KGzDOsP3sJYdDpGo90PlMBtZv3iqH
 bzRU2COqGOFy4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqoCD8AAoJENju1/PI
 O/qaEbUP/382SDlzN7H+uPAg+eOuaSTURpg51A5pPv8X1zs2dr+eDyczi+CFWbcy0cLCpML7N6x
 4KR3RclKFpjsfyR0Lg7kVx6JlWShhHc/U5rumaxArELOWSyE2Xt3iSai5ZVS0PUZ6xgfWTn8BLU
 0mTJzsdxf9A3xFrC4b5MSDIY3wanIzLc/p28IWw2q3TJGSKzZCGp1auE0tXJA/55mpK028v0I0Z
 jM2D+1nUrKESGoAWp7UlRMlCMn/6tSbvL+SjHupQAvxKwugkWeB4cIjQMMVK2W8V+S5bFgyMZnt
 XThFbWsBQdqZFHr39AWF7nrLlnI3Mrh9c+YSdm4ugCqCGlrxWHmuVk7L81XcvBoEQi0Y2jXLeVY
 kaMIhPF5xZFa1AOfAwxnFswPZKpmCWAbo7M7LokflCiISQ3CAKndt1QMUCrckzuyiIbOtLcJ1iL
 +MsgTrGYm2qFW626wYNJG1AmKXUa5z7qMRXFJb+jPzhvL77fwNA2R2njqat/MxmzYZ2K8qpuVQ7
 t/6esCFRGqNhfqYVvDAoGAVU7V+OiMVlhTIDjL0wcBq37n6xkPTWJiF7F+vhI7M9vTfb+EW0s57
 V5crEhZiHcVsQUENeAtHleI5CKoKKzChkuZZ7SVJYnPgD2/Pwe7aKwcSsJw/ZKcQ9Yi26+IeLD2
 baxeI8atcuyIv3LolPRwn7Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_075144_064657_B15BE6D2 
X-CRM114-Status: GOOD (  17.68  )
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

I've been working on fixing up at least basic system suspend support on
the Rockchip RK3576 platform. The last open issue is missing support in
the PCIe driver. This series is a follow-up for Shawn Lin's series with
feedback from Niklas Cassel and Manivannan Sadhasivam being handled as
well as some of my own changes fixing up things I noticed.

I've tested this on multiple RK3576 and RK3588 boards and things look
good to me on the PCIe side.

On RK3588, I also needed [0] to fix PCIe IOMMU issues after resume. I
consider this an independent issue. Also on the Rockchip EVBs the
brcmfmac driver fails to suspend. The WIFI card is connected via PCIe,
but the problem is with the driver/firmware and unrelated to PCIe
itself. I will send a separate workaround patch for that. Additionally
on RK3588 the system will run into SError on resume due to a USB2
problem. This problem is also independent and will be handled
separately.

[0] https://lore.kernel.org/all/20260728210928.1050849-1-praan@google.com/

Changes since PATCHv5:
 * https://lore.kernel.org/r/20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com
 * Rebase to pci/next
 * Minor changes to make checkpatch happy
 * Update patch description of the last patch and drop RFC tag
   according to feedback from Shawn Lin
 * Prepend new patch, which fixes Nicolas Frattaroli's conversion
   to FIELD_PREP_WM16 accidently dropping a flag.
 * Add another new patch, which sets .broken_l1ss_resume to tell the
   PCI core that the controller is powered off during suspend following
   the Qcom example

Changes since PATCHv4:
 * https://lore.kernel.org/r/20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com
 * rebase to v7.0-rc1
 * Add an RFC patch at the end with some bits I found in the Rockchip vendor kernel;
 * Made some tests on Rock 5B+ (RK3588); with this patch series suspending works
   when setting pm_test to devices. A full system suspend fails in a later step,
   but that is independent of PCIe.

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
Sebastian Reichel (10):
      PCI: dw-rockchip: Fix LTSSM set functions
      PCI: dw-rockchip: Restore vpcie3v3 regulator handle
      PCI: dw-rockchip: Move devm_phy_get out of phy_init
      PCI: dw-rockchip: Add helper function for enhanced LTSSM control mode
      PCI: dw-rockchip: Add helper function for controller mode
      PCI: dw-rockchip: Add helper function for DDL indicator
      PCI: dw-rockchip: Add pme_turn_off support
      PCI: dw-rockchip: Set broken L1SS resume flag
      PCI: dw-rockchip: Add system PM support
      PCI: dw-rockchip: Clear debug buffer before entering L2

 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 274 ++++++++++++++++++++++----
 1 file changed, 235 insertions(+), 39 deletions(-)
---
base-commit: 39ee38a9fa2eaeff030a6c865abb244597c091eb
change-id: 20251028-rockchip-pcie-system-suspend-86cf08a7b229

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>



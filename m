Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC5DCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m0s7XgOpRPVD6j8eXLPzOllyZj68HP6UTzTbwbuOINM=; b=T2F1S1k0kloMCfKqFepIuX50+c
	JGHchNcV1nG0xWtDWM4qK0Ql/GlvMHlVZXjDKI64eCq5DvusPFEN6PmaAMlw285zzyniQ1W+A+Wzw
	UQQBctVOIy6lbk+QQvJbzt85Am4ao22KXuupyGrNecMp6NJQaWk1CNCFmV+JCTtIc9nz+bsVy+3sa
	qYO+tB1HDwNG+InZrLtcUJ4aHMII4IvgF7GXeILj8jiMl/CThJNJKCaVaQrLkearkE2i2JANQwToU
	nkDgEHMyRYjgLv2+THf/TaOH0voQOXL1iu1FPoPXwhGBZV9VEkHoT7PB/J9wH7fPnmUdPc89+CMRU
	Z0KIk9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlxy-00000006zl4-2Pmc;
	Tue, 11 Nov 2025 10:51:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlxw-00000006zku-3egA;
	Tue, 11 Nov 2025 10:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0175661907;
	Tue, 11 Nov 2025 10:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA5EC2BCB0;
	Tue, 11 Nov 2025 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762858271;
	bh=yF3LwFR3UteEXs0R1GhkOZ+SlpXP1QamBYPNI3i0IcY=;
	h=From:To:Cc:Subject:Date:From;
	b=A5WyiygAjAvJsU+uxfKwX/RBa16Igu09c3rbMJfzahbCwEl89D0RLqRW0Na82P3d3
	 pciqRPjjNCIyg7sqzS1B3OxheyAG9SZjDdYtH5R6A+7lyDKfp0k+1VBXKG6Ci1H8CM
	 iR6GMlGJF1AG5fqI8FXC+nPqCHDadsVME5n3SgSIjdxztnm3i0XIXPHlisBLlm+Xz+
	 Wm/Phe8uSOctrR+TFCkjnym6X6NXvhaQmggdgiGiBlnH9Do8t1YJ7sDyPHX0iipRFB
	 pWVbB39nFRyptmH2i0gahPDrI5xgkf+iJV9oulaua/dkgcNdEW5sEIBG2gk7lXbNX9
	 S4JUCEF+ph2tw==
From: Niklas Cassel <cassel@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/6] PCI: dwc: Revert Link Up IRQ support
Date: Tue, 11 Nov 2025 11:51:00 +0100
Message-ID: <20251111105100.869997-8-cassel@kernel.org>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3673; i=cassel@kernel.org; h=from:subject; bh=yF3LwFR3UteEXs0R1GhkOZ+SlpXP1QamBYPNI3i0IcY=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDKFRUUm7tLPDVxjMnfplsCDqi8v+cpmZL4s4F1+Up1bR fNI5xuLjlIWBjEuBlkxRRbfHy77i7vdpxxXvGMDM4eVCWQIAxenAEzk2GZGho6JxU2nNjPkHE/6 FPbf8T+/4/maGFkF3uk24T5M+bftHRj+Fwn1Oj5hZ2+NPrymbnNI+Z3iEpkw1p+FdrM33ozaf6K XEwA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
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

Revert all patches related to pcie-designware Root Complex Link Up IRQ
support.

While this fake hotplugging was a nice idea, it has shown that this feature
does not handle PCIe switches correctly:
pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46

During the initial scan, PCI core doesn't see the switch and since the Root
Port is not hot plug capable, the secondary bus number gets assigned as the
subordinate bus number. This means, the PCI core assumes that only one bus
will appear behind the Root Port since the Root Port is not hot plug
capable.

This works perfectly fine for PCIe endpoints connected to the Root Port,
since they don't extend the bus. However, if a PCIe switch is connected,
then there is a problem when the downstream busses starts showing up and
the PCI core doesn't extend the subordinate bus number after initial scan
during boot.

The long term plan is to migrate this driver to the pwrctrl framework,
once it adds proper support for powering up and enumerating PCIe switches.

Niklas Cassel (6):
  Revert "PCI: dw-rockchip: Don't wait for link since we can detect Link
    Up"
  Revert "PCI: dw-rockchip: Enumerate endpoints based on dll_link_up
    IRQ"
  Revert "PCI: qcom: Don't wait for link if we can detect Link Up"
  Revert "PCI: qcom: Enable MSI interrupts together with Link up if
    'Global IRQ' is supported"
  Revert "PCI: qcom: Enumerate endpoints based on Link up event in
    'global_irq' interrupt"
  Revert "PCI: dwc: Don't wait for link up if driver can detect Link Up
    event"

 .../pci/controller/dwc/pcie-designware-host.c | 10 +--
 drivers/pci/controller/dwc/pcie-designware.h  |  1 -
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 60 +-----------------
 drivers/pci/controller/dwc/pcie-qcom.c        | 63 +------------------
 4 files changed, 6 insertions(+), 128 deletions(-)

-- 
2.51.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85908C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hk85iY4ymzyKE4GF/XJIv+VOxpEfbG0odDZoakglHzU=; b=BL4HEHWKyGnw0t3/3FgR9DQB6C
	Iu0NDTiKPxQv0dd1LdygyJfMECoXwDPwbq1nawyhFs9R9XjV9HR5hPteuRHylDn7nJh2IXg95F4uL
	PG89GKRRULrAHF/BVjqqP91Ma19kOlDHdwuoW3UPsi2TyHjy0CxuKoSHt3nQREeyPGckfAp3BUWoN
	q8svbi1KSigPn46SpnmrMOZJqtB718TWdYv38iIVgK/oBF5ODr2SwLXf+PapMoQYWjjvE831BRLpu
	CtHhTFe/iOiplB02ncYR78aQxLPS4vja6vc6CCBq6pLNaEfEYOe7TZO8UA1nPRuWdgR9N+WVtGeJH
	unej0vGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7COc-000000073Nl-3G2x;
	Tue, 22 Apr 2025 12:06:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BoY-00000006wZT-0rPV;
	Tue, 22 Apr 2025 11:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=hk85iY4ymzyKE4GF/XJIv+VOxpEfbG0odDZoakglHzU=; b=SfG2liOjtE8RtpLEAT6qSRXJvl
	SezmnOdPMP+f+hUx399KlsfJR7OmHqtk2FspCn3S/wa3Xmcy++o/bYH882dT+XMErDTv49mBDD+80
	DfFqv4LuGYIcxmw3KWtLjmk/rwZCOkND4v1T3wGJ+5MuOkfaStdb6KphxBE4KGTqAHrhUv/EpaCcg
	B5OrSVTtb/uuZ3gILpuzf9PLdC7QkqP2C+12up7NPBfAzuxG8k2P6Gp4ZiqCpHcR3elCHNdQsIeOg
	PK+4sqYHBsWnQZ1hiM5feQTtaliy71WalrA7Isw3o+BOvROfbYbDpU3Z1XRoOWcijWJqt5XDyXFYX
	SNu4aVMg==;
Received: from m16.mail.163.com ([117.135.210.4])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BoU-0000000BCBU-0JRK;
	Tue, 22 Apr 2025 11:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hk85i
	Y4ymzyKE4GF/XJIv+VOxpEfbG0odDZoakglHzU=; b=lp8bbt1AYA98UYm7u9TfQ
	ynqlrk6uZpn4Yt2QLQDYSlHVGrZWmWmzl4cQGOuoLtfKNfbQafTsg3ExvSVV1SUi
	1qlhPQFeyhWntuZSTOZ23yUHa6DdhBtV67b8lZefbIkAMFxWaEgQZrjBC1Vb2nYz
	USj6gNOPnihzMm/y2DqpjA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wCXbK1gfQdoRW2NBg--.44191S2;
	Tue, 22 Apr 2025 19:28:33 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de
Cc: manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	shawn.lin@rock-chips.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 0/3] PCI: dw-rockchip: Reorganize register and bitfield definitions
Date: Tue, 22 Apr 2025 19:28:27 +0800
Message-Id: <20250422112830.204374-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXbK1gfQdoRW2NBg--.44191S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykKw4ruF18XrW7Xr4kCrg_yoW8Kryxp3
	Z8JFWrur4fJw40vws7tw17ZFy8K3ZrCFyY9w4DKw10qa40qa48WFyftF1F9ry7Xr4xKF17
	ZwsrX34I93Wav3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEJPEPUUUUU=
X-Originating-IP: [61.171.199.116]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDw83o2gHegpLtwADs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_122918_777851_C1DE48D8 
X-CRM114-Status: UNSURE (   6.95  )
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

1. PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
2. PCI: dw-rockchip: Reorganize register and bitfield definitions
3. PCI: dw-rockchip: Unify link status checks with FIELD_GET

---
https://patchwork.kernel.org/project/linux-pci/patch/20250416151926.140202-1-18255117159@163.com/

Bjorn Helgaas:
These would be material for a separate patch:

- The #defines for register offsets and bits are kind of a mess,
  e.g., PCIE_SMLH_LINKUP, PCIE_RDLH_LINKUP, PCIE_LINKUP,
  PCIE_L0S_ENTRY, and PCIE_LTSSM_STATUS_MASK are in
  PCIE_CLIENT_LTSSM_STATUS, but you couldn't tell that from the
  names, and they're not even defined together.

- Same for PCIE_RDLH_LINK_UP_CHGED, PCIE_LINK_REQ_RST_NOT_INT,
  PCIE_RDLH_LINK_UP_CHGED, which are in PCIE_CLIENT_INTR_STATUS_MISC.

- PCIE_LTSSM_ENABLE_ENHANCE is apparently in PCIE_CLIENT_HOT_RESET_CTRL?
  Sure wouldn't guess that from the names or the order of #defines.

- PCIE_CLIENT_GENERAL_DEBUG isn't used at all.

- Submissions based on the following v5 patches:
https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-1-git-send-email-shawn.lin@rock-chips.com/
https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-2-git-send-email-shawn.lin@rock-chips.com/
https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-3-git-send-email-shawn.lin@rock-chips.com/
https://patchwork.kernel.org/project/linux-pci/patch/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/
---

Hans Zhang (3):
  PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
  PCI: dw-rockchip: Reorganize register and bitfield definitions
  PCI: dw-rockchip: Unify link status checks with FIELD_GET

 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)


base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
prerequisite-patch-id: 5d9f110f238212cde763b841f1337d0045d93f5b
prerequisite-patch-id: b63975b89227a41b9b6d701c9130ee342848c8b6
prerequisite-patch-id: 46f02da0db4737b46cd06cd0d25ba69b8d789f90
prerequisite-patch-id: d06e25de3658b73ad85d148728ed3948bfcec731
-- 
2.25.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48723C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a4qEwfske43/vfxYVnMiAvY6fWKRLGjrP0gzaLq1nD4=; b=yNBsSgeDPHBVabgcbTwKUTvjZy
	w3j5UfudbtQzNnNmE/OgOYrko/mCeI2pJEQ/TQLvdnUfeWSE0KleET66dS+JDcT+j12oYvN0dR88T
	6q17MBvvtKyvSS+VdnjaXIrOnM5UeSsExg24n4vS+UhvNZnwe2Ud46x3KIuBB/uc8CEswAH0eoPA/
	aJsFXZ+A0dkS8sVEpYb9mNKn1o56V098BwYbrZrBCMRgpCyEwVO4PWivkuXoDAbEh0a6ElsgQ6/Ud
	HcvLEC8B2kj38GSpU3mCM7OTBJ8264LjiJ7wt8i37ahiOPB9/hW8VfwSZFQ5wbjycy30BeL7nvJfz
	bTVEHfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u91dm-00000003ZFa-0qEb;
	Sun, 27 Apr 2025 13:01:50 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u91W8-00000003Xt9-19Il;
	Sun, 27 Apr 2025 12:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=a4qEw
	fske43/vfxYVnMiAvY6fWKRLGjrP0gzaLq1nD4=; b=FP3RFEvRSxhbARzBfEvlf
	VV5ox97bb+Qk1pM4K86E10rDHHvT21qSGKzb/UvzCR2tF4kd+X31noRgJhvZw35y
	D33ppMi9AGHENYdvMTqodWe/+TIUVwkNFPeYBofk4vFuGmi18xAGdkNNiKyAE/UB
	To7h/tNcLjJ4drwTbth8BQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3LwC9KA5oNqx8Cw--.63816S2;
	Sun, 27 Apr 2025 20:53:19 +0800 (CST)
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
Subject: [PATCH v4 0/3] PCI: dw-rockchip: Reorganize register and bitfield definitions
Date: Sun, 27 Apr 2025 20:53:13 +0800
Message-Id: <20250427125316.99627-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3LwC9KA5oNqx8Cw--.63816S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFyfXw4kGrWkWw1DCF47XFb_yoW5Gw1fpF
	s8WFZ3Wr47Jw4Fvan7Kw17ZFy8K3ZxCFZ8Zw4DKw1xJ34Yg3W8WFyfKF1F9ry7JrWIgF1I
	vw47X3409FyYya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEwIDUUUUUU=
X-Originating-IP: [222.71.101.198]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDx88o2gOJqQ3gAAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_055356_654882_1D020390 
X-CRM114-Status: UNSURE (   8.83  )
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
Changes for v4:
- According to Mani's suggestion, submit based on the following branches
  and do not rely on others' patches.

  Because of *this* dependency, I couldn't apply this series. I'd suggest
  to respin this series avoiding the above mentioned patch and just rebase
  on top of controller/dw-rockchip branch:

https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=controller/dw-rockchip

Changes for v3:
- Delete the redundant Spaces in the comments of patch 2/3.

Changes for v2:
- Add register annotations to enhance readability.
- Use macro definitions instead of magic numbers.

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

- Submissions based on the following patches:
https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-1-git-send-email-shawn.lin@rock-chips.com/
https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-2-git-send-email-shawn.lin@rock-chips.com/
https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-3-git-send-email-shawn.lin@rock-chips.com/
https://patchwork.kernel.org/project/linux-pci/patch/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/
---

Hans Zhang (3):
  PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
  PCI: dw-rockchip: Reorganize register and bitfield definitions
  PCI: dw-rockchip: Unify link status checks with FIELD_GET

 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 65 ++++++++++---------
 1 file changed, 36 insertions(+), 29 deletions(-)


base-commit: d4a5d7e6d91f6e53c8bf6ec72b7ee6c51f781695
-- 
2.25.1



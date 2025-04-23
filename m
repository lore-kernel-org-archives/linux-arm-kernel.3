Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63253C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Zmrbeq6bLjH06q2d/S498jz0cbVk1UENxMwcMkAn1U=; b=Vvpb8B5eP2j/MbF0CDKIAepP0q
	ortFdBUZFPaUiPKutG4uyTFEM4qfsz/3KUR6tfuYQX7oRg4cRO46+d+X2pj28mt/2Ae92x+wOHllj
	CgZaGWOXCVz3I7BDq5r9MoDjmjDGr3XX0VEFcsuELbFQFJ1lkK38kQEYmNdpOuukd+4WB3Ujvu8oJ
	eDrFy+fDrInqMjIwU+569AmzxeuTfQsqNvQCcEqqM5lHPqFYAzoq9faAi2R8+Llwg/naZxdnKAstw
	uHVweyurJhNCj1UsjWotMxjV6FyrjNbExNaeOBQIC5kRstrmd9eStXhVTceNIBQz58o3UX0Cci3Ah
	TBNqBMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zn7-0000000AX9Q-49w6;
	Wed, 23 Apr 2025 13:05:29 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Xkg-0000000AEkH-1qgF;
	Wed, 23 Apr 2025 10:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8Zmrb
	eq6bLjH06q2d/S498jz0cbVk1UENxMwcMkAn1U=; b=VJUCQCItXqAHYSERxhXjG
	bogofW1u71PDTk9/YcgKwHGZN3XSd8B+zNnzTV9GekBPgDrmFhovExSPKcONQ2Nl
	QKohm02Z8KmKgOAXEf8STgZ/0iA3/pncnoCMSrwEv4xi/SttMnUj/6d/v2MwP7SJ
	DeIDW1gRBnkVAXYPle2cAo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAnRTjYxghozJctBw--.58909S2;
	Wed, 23 Apr 2025 18:54:18 +0800 (CST)
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
Subject: [PATCH v2 0/3] PCI: dw-rockchip: Reorganize register and bitfield definitions
Date: Wed, 23 Apr 2025 18:54:12 +0800
Message-Id: <20250423105415.305556-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAnRTjYxghozJctBw--.58909S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykKw4ruF1kZry5tryfCrg_yoW5Jry7p3
	Z8JFZ8ur43Jw40van7tw17XFy8K3ZrCFyY9w4UKw18Xa40qa48WFyftF1rury7XrWxKF17
	ZwsrX3yI9a4av3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE4E_JUUUUU=
X-Originating-IP: [222.71.101.198]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDws4o2gIwTqxqgAAsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_035450_821985_CEA017C5 
X-CRM114-Status: UNSURE (   7.62  )
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

 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 87 +++++++++++--------
 1 file changed, 50 insertions(+), 37 deletions(-)


base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
prerequisite-patch-id: 5d9f110f238212cde763b841f1337d0045d93f5b
prerequisite-patch-id: b63975b89227a41b9b6d701c9130ee342848c8b6
prerequisite-patch-id: 46f02da0db4737b46cd06cd0d25ba69b8d789f90
prerequisite-patch-id: d06e25de3658b73ad85d148728ed3948bfcec731
-- 
2.25.1



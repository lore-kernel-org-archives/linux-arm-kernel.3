Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7126CCFA17
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 16:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87R96FN7pE6DYLNvmJ2874NuhQITlr0644TgHtiYcWs=; b=oYZO5VIuZHaJc2eh+Vrc1e1Tsj
	pKg5ssJn1MXM8k9IEnOVTWlVvyqQYcORNnQDcsf6C+zWCd5VHoLZftOFiz++2KFMMnDdg0Xf03LsB
	jpizh2OR0st/mDCG/cBxIvlSRtlgyQIkYvu5zF3s+xKin/9g0dhKqUQ1GWSElSLHhOqFZyD0KkaaM
	eiwdlmeWOeJDwhly4ShfDLoDw3f+DsbtM5NVLijZXywnxUxoy+JQC+GBUJ/OdJ2tOw0vD704leWzM
	BdR4U5Unm9W9XPZIFPSgw+u8lOKRzEDXQiC4FJXJ5vuSxnv+Vg9+D3GdfJDNwmZLOJ7rLliNK/WcL
	JHH0k0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKGs-0000000CDwF-0S4l;
	Tue, 04 Nov 2025 16:52:38 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKGp-0000000CDrs-1Cd5;
	Tue, 04 Nov 2025 16:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=87
	R96FN7pE6DYLNvmJ2874NuhQITlr0644TgHtiYcWs=; b=TvhDEKnuHis89BbcDv
	o7/U6L8dpdQESbVZttOkMUYg0CcVKpchO/UkhuSU50ULyvmKaSdN6CpJUL+niUqC
	HXCG/x8tk2Uni8wcY4vrtPzSXXk0aGFVTvt0kjQqpJUE9I3FjujWx6rl9zifl41m
	RUjY1hgE5GXzuLA04CA5hdz/s=
Received: from zhb.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDHcqsQLwppjl+qCg--.1966S3;
	Wed, 05 Nov 2025 00:51:32 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	heiko@sntech.de,
	mani@kernel.org,
	yue.wang@Amlogic.com
Cc: pali@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	cassel@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v6 1/2] PCI: Configure Root Port MPS during host probing
Date: Wed,  5 Nov 2025 00:51:24 +0800
Message-Id: <20251104165125.174168-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104165125.174168-1-18255117159@163.com>
References: <20251104165125.174168-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgDHcqsQLwppjl+qCg--.1966S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFW3Xw15GF4rZw4kJrWDurg_yoW8tryUpa
	4jqa1FyFs3WF1fZa1DZ3WY9FyYqas7ArW3KF9akwnY9Fs8XFyDXrWYyFZ5J34kCFWIqrya
	vFn8try8CFnxZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piQVyfUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:355:1a70:fad9:bcdf]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiFQ-7o2kKLUUmzwAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_085235_704361_501DDC1A 
X-CRM114-Status: UNSURE (   9.46  )
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

Current PCIe initialization logic may leave Root Ports (root bridges)
operating with non-optimal Maximum Payload Size (MPS) settings. Existing
code in pci_configure_mps() returns early for devices without an upstream
bridge (!bridge) which includes Root Ports, so their MPS values remain
at firmware/hardware defaults. This fails to utilize the controller's full
capabilities, leading to suboptimal data transfer efficiency across the
PCIe hierarchy.

With this patch, during the host controller probing phase:
- When PCIe bus tuning is enabled (not PCIE_BUS_TUNE_OFF), and
- The device is a Root Port without an upstream bridge (!bridge),
The Root Port's MPS is set to its hardware-supported maximum value
(128 << dev->pcie_mpss).

Note that this initial maximum MPS setting may be reduced later, during
downstream device enumeration, if any downstream device does not suppor
the Root Port's maximum MPS.

This change ensures Root Ports are properly initialized before downstream
devices negotiate MPS, while maintaining backward compatibility via the
PCIE_BUS_TUNE_OFF check.

Suggested-by: Niklas Cassel <cassel@kernel.org>
Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/probe.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 0ce98e18b5a8..2459def3af9b 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2196,6 +2196,18 @@ static void pci_configure_mps(struct pci_dev *dev)
 		return;
 	}
 
+	/*
+	 * Unless MPS strategy is PCIE_BUS_TUNE_OFF (don't touch MPS at all),
+	 * start off by setting Root Ports' MPS to MPSS. This only applies to
+	 * Root Ports without an upstream bridge (root bridges), as other Root
+	 * Ports will have downstream bridges. Depending on the MPS strategy
+	 * and MPSS of downstream devices, the Root Port's MPS may be
+	 * overridden later.
+	 */
+	if (!bridge && pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
+	    pcie_bus_config != PCIE_BUS_TUNE_OFF)
+		pcie_set_mps(dev, 128 << dev->pcie_mpss);
+
 	if (!bridge || !pci_is_pcie(bridge))
 		return;
 
-- 
2.34.1



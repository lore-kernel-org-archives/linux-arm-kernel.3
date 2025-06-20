Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37111C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8TapiMRiV+/DhKkWGWqqhK/Kqxyy8HtlXWR339Cxls=; b=ZHeVZiAxdVK1UCDeByQSTFObZm
	Qbckj8zfGAf9YFca6g+rdA55yRUkcUfsBfbT5E/9a5ozYo8vXj0VkhMQgShhPqKGSwIay0AOvhzlQ
	bpnuQAQe7FUCPCkUVloPhCRkJjySNWiGZ6nPLPN3cz+9JaQme3Iip3tFYnBE8ZRpMWlJ7P/I5T4sd
	fza2OXUd98bWw4HVbaNltJ4bRmrM1y5EH56lcLAUwO0n9pVYFipTtNWyCQ9QRjJaFLNxCq+Jd27ea
	sPK6D4B1mAz7QbzEpatI9HCEDZbbW+0sspJ36gFvtr24gAPQDvYURZ0nwS6O8KmyRJ8QkkE5bMJua
	FiFud7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeQI-0000000G7Kg-2rVZ;
	Fri, 20 Jun 2025 16:17:02 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSe5p-0000000G3wo-1EjV;
	Fri, 20 Jun 2025 15:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=i8
	TapiMRiV+/DhKkWGWqqhK/Kqxyy8HtlXWR339Cxls=; b=RYMbneu9ctyb7xsH69
	wODmw1d5sYKMXuugkeZtFbY20GNjqE0jBAHZ7P46kpjvsUHNEev+VJqPvrsqOGvn
	Ehd/XYdEqJW17yxh86TQEPhH1mZuJSzCflXZIlBHj3hca/KBs1FntbKaKSNXlYjS
	dwd3h12MskT3faw5Plb/4leS8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDHyCldhFVo3bDnAg--.55764S3;
	Fri, 20 Jun 2025 23:55:11 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
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
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>,
	Niklas Cassel <cassel@kernel.org>
Subject: [PATCH v5 1/2] PCI: Configure root port MPS during host probing
Date: Fri, 20 Jun 2025 23:55:06 +0800
Message-Id: <20250620155507.1022099-2-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250620155507.1022099-1-18255117159@163.com>
References: <20250620155507.1022099-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHyCldhFVo3bDnAg--.55764S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw17Gw1DuryUZFyrZF17GFg_yoW5Xryxpa
	yUJws3AFZ7GFyfWa1kX3W09ryYv3Z7Cry7JrZ8Cr9093Z8AF1DJrWaya1rA3s7Gr9av34Y
	vr4qqryUu3Z5uFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pivJP_UUUUU=
X-Originating-IP: [240e:b8f:919b:3100:8440:da7c:be7e:927f]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOgRyo2hVfXVwHQACs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_085553_794121_EA3D6708 
X-CRM114-Status: GOOD (  11.93  )
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

Current PCIe initialization logic may leave root ports operating with
non-optimal Maximum Payload Size (MPS) settings. While downstream device
configuration is handled during bus enumeration, root port MPS values
inherited from firmware or hardware defaults might not utilize the full
capabilities supported by the controller hardware. This can result in
suboptimal data transfer efficiency across the PCIe hierarchy.

During host controller probing phase, when PCIe bus tuning is enabled,
the implementation now configures root port MPS settings to their
hardware-supported maximum values. Specifically, when configuring the MPS
for a PCIe device, if the device is a root port and the bus tuning is not
disabled (PCIE_BUS_TUNE_OFF), the MPS is set to 128 << dev->pcie_mpss to
match the Root Port's maximum supported payload size. The Max Read Request
Size (MRRS) is subsequently adjusted through existing companion logic to
maintain compatibility with PCIe specifications.

Note that this initial setting of the root port MPS to the maximum might
be reduced later during the enumeration of downstream devices if any of
those devices do not support the maximum MPS of the root port.

Explicit initialization at host probing stage ensures consistent PCIe
topology configuration before downstream devices perform their own MPS
negotiations. This proactive approach addresses platform-specific
requirements where controller drivers depend on properly initialized
root port settings, while maintaining backward compatibility through
PCIE_BUS_TUNE_OFF conditional checks. Hardware capabilities are fully
utilized without altering existing device negotiation behaviors.

Suggested-by: Niklas Cassel <cassel@kernel.org>
Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/probe.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 4b8693ec9e4c..9f8803da914c 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2178,6 +2178,16 @@ static void pci_configure_mps(struct pci_dev *dev)
 		return;
 	}
 
+	/*
+	 * Unless MPS strategy is PCIE_BUS_TUNE_OFF (don't touch MPS at all),
+	 * start off by setting root ports' MPS to MPSS. Depending on the MPS
+	 * strategy, and the MPSS of the devices below the root port, the MPS
+	 * of the root port might get overridden later.
+	 */
+	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
+	    pcie_bus_config != PCIE_BUS_TUNE_OFF)
+		pcie_set_mps(dev, 128 << dev->pcie_mpss);
+
 	if (!bridge || !pci_is_pcie(bridge))
 		return;
 
-- 
2.25.1



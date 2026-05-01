Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749F3CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 15:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uRtlnL49pKeZCApCiJ/CvbaZOCEdzedFqtleNnlK0c0=; b=Fj/xNisXLWjuSVye8RwfxqQcQY
	RPP4mpJa05ckr6kKkMbnVWIzdIsBy0h8EHWoU7seWKBPoWNAeMqzMeED+6YRxVVL0UOZwxnbSMktg
	Fbjonyr5A2TuCXFrVECTh7hPbaI/iX31Lwz9ph8XjmHUCqBpXAa2JoNmtQUGtBi44CmShH7cJx+Pv
	EL6E5GRHqhhvW7P5Wjs1GYV4zv4d3p8JJK2GRBzT0gSBr47UU41JkULEsCtxoe5pvBQHGIhVVJaML
	0o6jHiLw2qTEfvyJNixiIB9d3CNJXDnALFvgraOWcxy3A1kkxMbqQfO3vZxSKzy7lHC1sazkN23aP
	WgvvyWYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpun-00000007M7F-1Pqg;
	Fri, 01 May 2026 15:36:29 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpuj-00000007M6A-3MwM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 15:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=uR
	tlnL49pKeZCApCiJ/CvbaZOCEdzedFqtleNnlK0c0=; b=ioo1AimeJkcaKRj8Fj
	IrKD3TGc5GOVSIZgoPTkXi5LkY98r4n09UEesWcztOhKXK7RycZWuiHHtRHuR/VP
	IL4tMeVchuWTWHo2rSGcWak9r2li1ZQM+IoaWlpmcKGAm3d6dsSpzQVsd2kfCuXV
	23L2nV6FRS82iKj7Vm9l7E/DA=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCH4HBbyPRpuOd_Cw--.58479S2;
	Fri, 01 May 2026 23:35:56 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 0/2] PCI: cadence: Add 100 ms delay after link up for speeds > 5 GT/s
Date: Fri,  1 May 2026 23:35:51 +0800
Message-Id: <20260501153553.66382-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCH4HBbyPRpuOd_Cw--.58479S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWfKFW8Zr18uF4kWr48WFg_yoW8Zr18pa
	y5Wr4FkFn7Ww4avan7Z3W7Zry5uFn5J3y3Kr4kKa4Iq3sxCr93JF1IqFnaqayagFs5Zr12
	yw1qqasrCFsxuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piGjg7UUUUU=
X-Originating-IP: [240e:b8f:927e:5900:a6da:de99:5aab:66f2]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBzghGn0yFzAdgAA3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_083626_759747_0D69FD48 
X-CRM114-Status: UNSURE (   9.60  )
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

As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link speeds
greater than 5.0 GT/s, software must wait a minimum of 100 ms after Link
training completes before sending a Configuration Request.

The same requirement has already been addressed for the Synopsys
DesignWare PCIe controller in commit 80dc18a0cba8d ("PCI: dwc: Ensure that
dw_pcie_wait_for_link() waits 100 ms after link up").

This series implements the required delay for the Cadence PCIe controller.

Patch 1 introduces a 'max_link_speed' field in struct cdns_pcie and adds
the delay logic in cdns_pcie_host_wait_for_link(). Since max_link_speed
defaults to 0, the delay is not yet triggered. This patch prepares the
infrastructure and references the DWC implementation.

Patch 2 sets the max_link_speed value in the TI J721E glue driver based
on the maximum supported link speed (obtained from the device tree
"max-link-speed" property), thereby activating the delay when the
controller supports speeds greater than 5 GT/s.

Other Cadence-based glue drivers can be updated similarly in follow-up
work.

---
Our company's product is based on the HPA IP from Cadence. When connecting
to different devices, we encountered issues with the enumeration failure
when connecting to the NVIDIA RTX5070 GPU and the NVMe SSD with PCIe 5.0
interface. Our code is based on: 80dc18a0cba8d ("PCI: dwc: Ensure that
dw_pcie_wait_for_link() waits 100 ms after link up").
---

Hans Zhang (2):
  PCI: cadence: Ensure that cdns_pcie_host_wait_for_link() waits 100 ms
    after link up
  PCI: j721e: Set max_link_speed to enable 100 ms delay after link up

 drivers/pci/controller/cadence/pci-j721e.c               | 1 +
 .../pci/controller/cadence/pcie-cadence-host-common.c    | 9 +++++++++
 drivers/pci/controller/cadence/pcie-cadence.h            | 2 ++
 3 files changed, 12 insertions(+)


base-commit: e75a43c7cec459a07d91ed17de4de13ede2b7758
-- 
2.34.1



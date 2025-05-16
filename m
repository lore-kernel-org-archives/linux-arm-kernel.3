Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE9CC54754
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b84+eY2PFKvb5YMPP6BEsx0UZiHjhkA8hcScECvXrLE=; b=sTrPsDbc7ytzRK/zgIXTyhBlY+
	kEjQt9Ry2USF8S2so/2daxjD6/gGoYMEBfxNsO68cIG8/5AT8UQT2wodEgp47DcNDcNk9t0and018
	uLyHS2Qjk1jlr0CVC2jMtET9q1eI8XJcB+FPWLFHC+q2Pc9DTFKVF0nJjfrXwiw7omNQzaFQI5WWe
	PGg27/xn7aLEYgqvK6TbN4YhohPwU7/Xel6/3qyzZmasZTn98atckFU8wlMojx0T3lcxCg9dKzGsu
	RZO2khuqnIwgoOBERM9ogQRcb4gSsnIoA/KW+0LkzrVphRAxT7YerbF1JSHeDddsnvtgGFCAGUs5C
	OcUBRCkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwzv-00000003quc-38qM;
	Fri, 16 May 2025 15:29:19 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwTy-00000003kEl-3WwN;
	Fri, 16 May 2025 14:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=b8
	4+eY2PFKvb5YMPP6BEsx0UZiHjhkA8hcScECvXrLE=; b=YdcG1sYntyrS34MqtB
	lIlMZF4ETqn9yMWe10z3KkidFquUDOdXALlHV43nDg+il/ggbo1b6UjSRc1JTHEd
	Icg4dWCMxzR1w39oqZWRJM0fB1JDYzvqX90ucOPHy16qM6N/pDZbKdbbNNJg9s8H
	pmyBg8IOqyvncKlxJrAMZtajY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCXtfDyUSdoaTNOBw--.62835S2;
	Fri, 16 May 2025 22:55:47 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de,
	manivannan.sadhasivam@linaro.org
Cc: robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2 0/3] Fix interrupt log message
Date: Fri, 16 May 2025 22:55:41 +0800
Message-Id: <20250516145544.110516-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXtfDyUSdoaTNOBw--.62835S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw43JFy8ZryDCw4kJFyrJFb_yoW8GrW7pF
	ZxG3ZIyr4DGr4Fv3Z2ywnYk3W5Xan8Ja1UGr12ga4xX3W2vF10gr9agF18WFy5K395tw1Y
	vrWUtw15Gw4qvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMc_-UUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWxFPo2gnTwJd1gAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_075619_221727_9129F708 
X-CRM114-Status: UNSURE (   8.78  )
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

Dear Maintainers,

Detailed descriptions of interrupts can be seen from RK3399 TRM doc.
I found two errors and cleaned up the driver by the way.

This patch series improves the logging accuracy and code cleanliness of
the Rockchip PCIe host controller driver:

Log Message Clarifications

Patch 1 fixes a misleading debug message for the PCIE_CORE_INT_UCR
interrupt, replacing a duplicated "malformed TLP" message with "Unexpected
Completion" to reflect the actual error condition.

Patch 2 corrects the terminology for non-fatal errors, renaming "no fatal
error" to "non fatal error interrupt received" to align with PCIe interrupt
semantics.

Code Cleanup

Patch 3 removes redundant header includes (e.g., unused clock/reset
headers) to streamline the driver and reduce build dependencies.

These changes enhance debug log reliability, eliminate ambiguity for
developers.

---
Changes for v2:
- Drop patch [v1 3/4].
- The other patches have not been modified.
---

Hans Zhang (3):
  PCI: rockchip-host: Fix "Unexpected Completion" log message
  PCI: rockchip-host: Correct non-fatal error log message
  PCI: rockchip-host: Remove unused header includes

 drivers/pci/controller/pcie-rockchip-host.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)


base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
-- 
2.25.1



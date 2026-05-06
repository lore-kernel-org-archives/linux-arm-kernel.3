Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E89ECD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDyIM4BKweQBnCpgrNGgNcV7Vbp6Q+A8dmpeii+IQGo=; b=hcHhNuTJ+q++yf/7MDNfVH+33R
	7UO88Yu01JBcIxr03OKAB9/iOg0n90tc2fCltJ+0KxB7nBmEB2HapnGqMMuxM2bAtzU2zwT+4Ui9E
	i9Y/pVKE7BL7LVLBUCSfi8sKUFZ48DP+e4noW3387GuAIfJwBsU6cccWyaPjCc/DuC+MnJhyCoymy
	3LzBfs3Cvns0FIe4nu8aTUDIEXrzqtrYY6aI7rL07Rwqy7sxPaX7LhbvB2bbO0kIbxlvmc46rY0FR
	MrsukUtySkGiGP/BHqig7TeO7MUYUajXLlYuz9cFwVWI9Jm95tiuJoHw5VNeNyGLvB21LfjA4DgFC
	hy2QjeAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7T-00000001JDI-0Kan;
	Wed, 06 May 2026 15:25:03 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7O-00000001J2j-3yRF;
	Wed, 06 May 2026 15:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=pD
	yIM4BKweQBnCpgrNGgNcV7Vbp6Q+A8dmpeii+IQGo=; b=joWJy+qjTJCNktMpzt
	ZqXslnzQhJb1oT/i6kVzHaxMfME0l3i7P69BPzq7402unsiX/DLgq1c7c5w8Opts
	FeoNmeCBC/CLmqIJVT+84XHBaEZAvXAOhCVNxaV+0C4teOKBqAIAArIXYq1xkeFU
	2WIITz0TSsY1VyPDzjF9cu12o=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAXH5wkXftpfKPsDg--.7909S2;
	Wed, 06 May 2026 23:24:21 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com,
	jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com,
	pali@kernel.org,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link training
Date: Wed,  6 May 2026 23:23:46 +0800
Message-Id: <20260506152346.166056-9-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506152346.166056-1-18255117159@163.com>
References: <20260506152346.166056-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXH5wkXftpfKPsDg--.7909S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1DXw47ZryDZFy8XryfCrg_yoWkurg_u3
	9xCFn7Aw4UGr9akF12y34rZryYy342qr10qa10vF13ta4I9r1rXw1fZF4jy3WUWa15JFyv
	yryqyr109r9rujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRM7KItUUUUU==
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAW5XWn7XSU5xwAA3x
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_082459_409436_ED0E001D 
X-CRM114-Status: GOOD (  10.68  )
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

The Renesas RZ/G3S PCIe host driver currently does not enforce the
mandatory 100 ms delay after link training completes for speeds > 5.0 GT/s,
required by PCIe r6.0 sec 6.6.1.

The driver already has a 'max_link_speed' field (derived from the device
tree). Add a call to pcie_wait_after_link_train() in
rzg3s_pcie_host_init() after reading the link status, ensuring that the
delay is applied before any Configuration Request is sent downstream.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-rzg3s-host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index d86e7516dcc2..6ab59c5464cf 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1390,6 +1390,8 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
 	val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
 	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
 
+	pcie_wait_after_link_train(host->max_link_speed);
+
 	return 0;
 
 config_deinit_post:
-- 
2.34.1



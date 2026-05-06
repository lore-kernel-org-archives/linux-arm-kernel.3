Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F4ECD3442
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tp7iBmKEeToHBfnghM1mY5+mcwB0MOqh5PUwFfpbteU=; b=aE2MTRmHeZfHB8Y0EGsBMKwbCa
	eOS2mnGiRV8jIAJ/1KOtugWZjvm6+gh3o4DlyQJlqjQYKgF6sDGXTmbEEoiED8muhAcZPFsVAsaBu
	NPbQJ8PC8bkR1jY5oTc/FYbT681tPVmkH1jnkdxBs02Qbw/akgtfO59sz7WWRQJt2goL1URCAMVB6
	Jz3ZIBFlUK3KVBkRhq8jk8Dz3XHeTGNSLJUz9e4gN72383v1dBixY5BSFa6CxmWUQ35ku3f5ItRM/
	8NCrSjGkhPfF+L0yhBJV1pL3Oe1yWSfkSP5eAMp36+MtHh49xGl+/6LpIIyjS//+0gi6p1bf9mmdT
	1pc2Xgzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7O-00000001J5m-3Bii;
	Wed, 06 May 2026 15:24:58 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7N-00000001Iyr-3X7Y;
	Wed, 06 May 2026 15:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tp
	7iBmKEeToHBfnghM1mY5+mcwB0MOqh5PUwFfpbteU=; b=TPY5+qpwXptAnLUh8Q
	EDOo86MRSINt0ckXXgtI7UP+/Y79denmZwR6kiQUrUN+y6QvMoit0jQOAiqg/95J
	I83z1sZ9bVyuccU7RPhaZ8qzJUhau+WQ+SwXfdxWuYtlV6IpJ6DDYvtCr+X2sAz3
	UJSF6msBQxTZzfHebcedC/n/g=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCHAqsXXftpv5CgDg--.43926S8;
	Wed, 06 May 2026 23:24:15 +0800 (CST)
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
Subject: [PATCH v2 6/8] PCI: aardvark: Add 100 ms delay after link training
Date: Wed,  6 May 2026 23:23:44 +0800
Message-Id: <20260506152346.166056-7-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506152346.166056-1-18255117159@163.com>
References: <20260506152346.166056-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHAqsXXftpv5CgDg--.43926S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7Jw48Gr13Zr1UKFW8Ww4fGrg_yoW8Jr4Dpa
	y3GF97KF1ktr43ua1UAayfWFy3WanI9a47Jrn7Kw13ZF9xWrWUGr1j9393KFnIyw4vvr13
	G3W3ta4xCa13Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEubyiUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AC4XGn7XSDh8QAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_082458_250152_3863FCEF 
X-CRM114-Status: GOOD (  11.68  )
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

The Aardvark PCIe controller driver waits for the link to come up but
does not implement the mandatory 100 ms delay after link training
completes for speeds greater than 5.0 GT/s (PCIe r6.0 sec 6.6.1).

The driver already maintains a 'link_gen' field that holds the negotiated
link speed. Use it together with pcie_wait_after_link_train() to insert
the required delay immediately after confirming that the link is up.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pci-aardvark.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index e34bea1ff0ac..526351c21c49 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -350,8 +350,10 @@ static int advk_pcie_wait_for_link(struct advk_pcie *pcie)
 
 	/* check if the link is up or not */
 	for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
-		if (advk_pcie_link_up(pcie))
+		if (advk_pcie_link_up(pcie)) {
+			pcie_wait_after_link_train(pcie->link_gen);
 			return 0;
+		}
 
 		usleep_range(LINK_WAIT_USLEEP_MIN, LINK_WAIT_USLEEP_MAX);
 	}
-- 
2.34.1



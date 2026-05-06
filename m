Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B60CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LszCurdEFO+gZG00jUn6BF5va881gN4RYCn+EeYYN5U=; b=ygct+5Hw7ABG/YKY7JVo2Mqoir
	0KAux4HO2n5Q5gFprvJyLNtr72RhWixOaCfArGnTaaC8jo3s+xZOPypHGhkh2LDNX1kIeQIPhHTUQ
	ZLV3nymTrmDJb3QbDGWmsljPMYI+0zajefrTEhogC5qm1fJH49r/C9AUskFvMgeoTgVDyADXZCSPW
	PWELxJ0r2e9xNq1hd6QyZDinM9r/YbA522d83c037ynpUgynRGukNEJxrSe3oOTNLgFMLso8Z3U78
	XakmY30969qzDQcJwqenzhzDlS5MC6pIaGFRERNJPOD6dFW7+qHdpGBzyRD0NrlewXft3urvz7YSp
	INKlLk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7Y-00000001JLu-240a;
	Wed, 06 May 2026 15:25:08 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7T-00000001J9P-1SYB;
	Wed, 06 May 2026 15:25:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ls
	zCurdEFO+gZG00jUn6BF5va881gN4RYCn+EeYYN5U=; b=JFRLZgkFncbn0mZNVg
	bgNHubQd2aPL4LijHJB40HyofKtgnKXK/l/zOe/rxEUlfEd81kJOJUgRm0+pP/OV
	P+jjvmAXcXOFBsV5KwowqixbwwbfdRbSKDDHtyQ2drM4edrLxursidDltRtTZVYg
	1b40+r7YCxWL/6hNT6OdZz2S0=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCHAqsXXftpv5CgDg--.43926S5;
	Wed, 06 May 2026 23:24:12 +0800 (CST)
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
Subject: [PATCH v2 3/8] PCI: cadence: HPA: Add 100 ms delay after link training
Date: Wed,  6 May 2026 23:23:41 +0800
Message-Id: <20260506152346.166056-4-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506152346.166056-1-18255117159@163.com>
References: <20260506152346.166056-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHAqsXXftpv5CgDg--.43926S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF1xur47GryfZF47ZFy3XFb_yoW8XF18pa
	yDGF1xCF1xZr4Y9an5A3W3Xr1aqasxA3srt3yv9w1xZF9xCrWDtF4IgF13Xa45KFZFvr17
	Xw1DtF9rGr45ZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U1SoXUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwx23W2n7XR0yzQAA3f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_082503_803684_7DD911DF 
X-CRM114-Status: UNSURE (   9.73  )
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

The Cadence HPA (High Performance Architecture IP) specific link setup
function cdns_pcie_hpa_host_link_setup() waits for the link to come up
but does not implement the required 100 ms delay after link training
completes for speeds > 5.0 GT/s (PCIe r6.0 sec 6.6.1).

Add a call to pcie_wait_after_link_train() immediately after the link is
confirmed to be up, using the max_link_speed previously stored in struct
cdns_pcie. This ensures compliance with the specification regardless of
whether the HPA or LGA path is used.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/cadence/pcie-cadence-host-hpa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c b/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
index 0f540bed58e8..62e939906785 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
@@ -15,6 +15,7 @@
 
 #include "pcie-cadence.h"
 #include "pcie-cadence-host-common.h"
+#include "../../pci.h"
 
 static u8 bar_aperture_mask[] = {
 	[RP_BAR0] = 0x3F,
@@ -304,6 +305,8 @@ int cdns_pcie_hpa_host_link_setup(struct cdns_pcie_rc *rc)
 	ret = cdns_pcie_host_wait_for_link(pcie, cdns_pcie_hpa_link_up);
 	if (ret)
 		dev_dbg(dev, "PCIe link never came up\n");
+	else
+		pcie_wait_after_link_train(pcie->max_link_speed);
 
 	return ret;
 }
-- 
2.34.1



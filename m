Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9549DC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 02:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KKeY/NRtUPjv7gxdOOKLkL/mtVywZDtNKn8DXvJJT0=; b=gIKpqZs5EaPMI/PGDv1GkCidev
	5WdVp55Xs9saZeTCscvIxvoKKkRe+4g7d3RZjINjSrnbyz48fFwzbKCVDU9WBma6UTYiQHgxefWsk
	Cau8eDDk7KiKruIgy0vHGJ8kIzjt+bdem/2YUV0Z3HxnhopvRcLulicqZ5lvL/LRwcgaYjYrrOcnh
	eU1NcOFrvGQow/Ey46Zt2+5LqQSTgS4np0ASs6KzBCSfi1cpMgG3W2mztFG2/ODR/nvPbr6tVJNmk
	KuOqzlVU/gpwJ8JJkJlEMVGkgvs0OTXrX8oofb2qaQG93OQaDOgtjo18bg9ynKbgMgeLj+f1ujALq
	P9wu8mvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcYh-0000000ATNA-3PJi;
	Thu, 26 Jun 2025 02:41:51 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcUG-0000000ASKj-0X0i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 02:37:18 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250626023711epoutp03d655f02a3c73543c64b826e8b47f9b79~MdzaHI55j1712717127epoutp03j
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 02:37:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250626023711epoutp03d655f02a3c73543c64b826e8b47f9b79~MdzaHI55j1712717127epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750905431;
	bh=3KKeY/NRtUPjv7gxdOOKLkL/mtVywZDtNKn8DXvJJT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T/Suh72rNRMdN/m7/Trdq4p0hqwoQegpnlJVMlU9P3w6ocmuPbi2ts9YCZLcPw1tg
	 6t/biCSwhfmgm1+B4fxeZljwctkaEL7DDDrO03J6fIsrv1dhHawWqAJMkBpQdyFGfA
	 TtHuozUenW56VIXojOSU3u9MY40V0+pxhHY9Oihk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250626023710epcas5p39d882046df964a98f0d8b617fd5ee19b~MdzZVCw8l0375103751epcas5p3P;
	Thu, 26 Jun 2025 02:37:10 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.174]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bSNBD4NG5z2SSKp; Thu, 26 Jun
	2025 02:37:08 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250625165248epcas5p10eefe9e1f1a89806793c86decc63f232~MV1LrOioV0885408854epcas5p1q;
	Wed, 25 Jun 2025 16:52:48 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250625165245epsmtip2600318736a6844f4c5dc7f7cecffc09a~MV1I11UW71750817508epsmtip2G;
	Wed, 25 Jun 2025 16:52:45 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-fsd@tesla.com
Cc: manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com,
	Shradha Todi <shradha.t@samsung.com>, Hrishikesh Dileep
	<hrishikesh.d@samsung.com>
Subject: [PATCH v2 01/10] PCI: exynos: Remove unused MACROs in exynos PCI
 file
Date: Wed, 25 Jun 2025 22:22:20 +0530
Message-ID: <20250625165229.3458-2-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625165229.3458-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250625165248epcas5p10eefe9e1f1a89806793c86decc63f232
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250625165248epcas5p10eefe9e1f1a89806793c86decc63f232
References: <20250625165229.3458-1-shradha.t@samsung.com>
	<CGME20250625165248epcas5p10eefe9e1f1a89806793c86decc63f232@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_193716_314671_EE5C408F 
X-CRM114-Status: GOOD (  11.31  )
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

Some MACROs are defined in the exynos PCI file but are
not used anywhere within the file. Remove such unused
MACROs.

Suggested-by: Hrishikesh Dileep <hrishikesh.d@samsung.com>
Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 1f0e98d07109..f9140d1f1d19 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -31,8 +31,6 @@
 #define IRQ_INTB_ASSERT			BIT(2)
 #define IRQ_INTC_ASSERT			BIT(4)
 #define IRQ_INTD_ASSERT			BIT(6)
-#define PCIE_IRQ_LEVEL			0x004
-#define PCIE_IRQ_SPECIAL		0x008
 #define PCIE_IRQ_EN_PULSE		0x00c
 #define PCIE_IRQ_EN_LEVEL		0x010
 #define PCIE_IRQ_EN_SPECIAL		0x014
-- 
2.49.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD801CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 05:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IA86F4zckPMij9e7yGYro0kXu5bh8Py7lV8n/0sesc=; b=KaxqLmZie/YP0tIHn/eU40xPD7
	xIzbn+p4inRIu/KPIukncifjRvEiibrLMCmh5ImCuqGUGSaTJt6GC0gD65HPmNQMTsskFDZaKRmAM
	MxkvGQEZhE8DWU02u2vopu7708Tn1BpFEW9xx1dfgMT2E/avkxxh9Lb/mHdefxTn0jz74Wk7UMzSS
	YtE1q8mZ9mm/XsTnFp/aarexQi6iORjCkdLn553TDJC/nU4s0l6qNHznlNEgPndbjrq5Efua+GEb/
	m7wMiECiQJnFs4CgWvgUY/XCd3JIhYmCgsFfhVcpmcXynOP3vrG+luRKWwkGxhx8zobx4a86VGRYY
	TwStrd5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhH9-00000009qvd-30P6;
	Tue, 12 Aug 2025 05:10:19 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulh9G-00000009pQp-0Qpx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 05:02:13 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250812050203epoutp02303287cfbb1f24f3e79a1e47cc4649c2~a7GUH8CEL1104311043epoutp02O
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:02:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250812050203epoutp02303287cfbb1f24f3e79a1e47cc4649c2~a7GUH8CEL1104311043epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754974923;
	bh=2IA86F4zckPMij9e7yGYro0kXu5bh8Py7lV8n/0sesc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UNYFGLHSBeDvYC1mRmZqxpKZrLEDeqMMD2zqXQqSTdgS6alssz6eAyb7tJxgh/hkM
	 bd/vYlTl5Wwx93crmmvfrAK4JAjJuhTgeK3NYgQOhRGq+RSiFIuhQWobJ3FuYgXZxF
	 d1qp3Ee0TRl25xSYTCT2hrmxvVwL0G/M5bvchOa8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250812050202epcas5p31f271fb43f33f8ab6f0f022b0231d2eb~a7GTkYNaO3131631316epcas5p3r;
	Tue, 12 Aug 2025 05:02:02 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c1K9j5t1yz6B9mF; Tue, 12 Aug
	2025 05:02:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250811154655epcas5p211bd14152fa48635fc5c1daceb963e71~awQERWW4V0377703777epcas5p2f;
	Mon, 11 Aug 2025 15:46:55 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250811154652epsmtip112e87d107f6556973ea2463d4c2cb28a~awQBic9oH2101521015epsmtip1C;
	Mon, 11 Aug 2025 15:46:52 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com,
	Shradha Todi <shradha.t@samsung.com>, Hrishikesh Dileep
	<hrishikesh.d@samsung.com>
Subject: [PATCH v3 01/12] PCI: exynos: Remove unused MACROs in exynos PCIe
 file
Date: Mon, 11 Aug 2025 21:16:27 +0530
Message-ID: <20250811154638.95732-2-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811154638.95732-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250811154655epcas5p211bd14152fa48635fc5c1daceb963e71
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250811154655epcas5p211bd14152fa48635fc5c1daceb963e71
References: <20250811154638.95732-1-shradha.t@samsung.com>
	<CGME20250811154655epcas5p211bd14152fa48635fc5c1daceb963e71@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_220210_292565_7E298920 
X-CRM114-Status: GOOD (  12.40  )
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

Some MACROs are defined in the exynos PCIe file but are
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



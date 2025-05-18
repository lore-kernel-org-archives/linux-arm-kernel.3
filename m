Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B7FC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 09:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0gwyC5KI+Ug/i3m/cr/xGdP9J34hXTp0M7gsxc71JQ=; b=1oa5jKuGJThr7mHMNRDB4R3Nrf
	UxuPlmAL6+ALMhr0x2VgQ9goY9b2Uo+KBSNPPKOaqXKk4l8zhLm8G6LcaKI0Al6aZ10FVy9UBsC0W
	YhbV+AhDRgCJ9U1JV+fyu06Fvrl6+VDjCm1k6QMO22Q4nf954VDtxlXumeTaA4IJdoTPs0ynbK5dU
	fgO/EPB+zSrVHTUtRsGZI6iq0JJFdaEJRuaOAGldooBvEndxqOqrxj7DPgxMHbfdDr1krr6IyyPJ/
	EoolbzHTVCy8WPwch/vAQ4qPHz6ye3DMts1dP7ezmanRXj1pjSCa4BlK092/Try/mPF5alI0mKjVy
	3cAYM5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx4M-00000008duA-3dEW;
	Mon, 19 May 2025 09:46:02 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwoS-00000008ZMd-3rZc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 09:29:38 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250519092935epoutp01be992d824737ddeab89bf1af3a0cdc63~A46ojdJrj2770027700epoutp01c
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 09:29:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250519092935epoutp01be992d824737ddeab89bf1af3a0cdc63~A46ojdJrj2770027700epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747646975;
	bh=l0gwyC5KI+Ug/i3m/cr/xGdP9J34hXTp0M7gsxc71JQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AcAPtkbVqi7jW/uiBCmnf0zRY4qOnaJ0qOdbeFadctiawjNs8GcW/ukuw9jshS/h/
	 5aIHg2n8CQyaIwyUd8vAzk4oAvz7Qzt9b79ggomhkWLaJcC7A2rso/ZmYIPVenGeIt
	 bIGzzXFFrV5XRGDqATpchhB+Jrp81WSXoRGFqvTU=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250519092934epcas5p341c3cb1babdd45de3c1a3699bae31c20~A46oEMhQl0672806728epcas5p3E;
	Mon, 19 May 2025 09:29:34 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.183]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4b1C7d38GGz6B9mL; Mon, 19 May
	2025 09:29:33 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250518193235epcas5p4f0bcf581b583a3acf493a20191ad2b00~Atf1u8wx31869918699epcas5p45;
	Sun, 18 May 2025 19:32:35 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250518193235epsmtrp196053957f0114c70e0099601128bb08b~Atf1t79n72445124451epsmtrp1c;
	Sun, 18 May 2025 19:32:35 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-67-682a35d3922b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	6F.39.19478.3D53A286; Mon, 19 May 2025 04:32:35 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250518193232epsmtip16453319fe08b323256750a6a7cafd674~Atfy3TlTS1247812478epsmtip1D;
	Sun, 18 May 2025 19:32:32 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, Shradha Todi
	<shradha.t@samsung.com>, Hrishikesh Dileep <hrishikesh.d@samsung.com>
Subject: [PATCH 03/10] PCI: exynos: Reorder MACROs to maintain consistency
Date: Mon, 19 May 2025 01:01:45 +0530
Message-ID: <20250518193152.63476-4-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518193152.63476-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWy7bCSnO5lU60Mg59zJS0ezNvGZvF30jF2
	iyVNGRZr9p5jsph/5Byrxc2zu9ktbvxqY7VY8WUmu8XR1v/MFi9n3WOzaOj5zWqx6fE1VovL
	u+awWZydd5zNYsKqbywWZ78vYLJo+dPCYrH2yF12i7stnawW//fsYLfoPVxrsfPOCWYHMY/f
	vyYxeuycdZfdY8GmUo9NqzrZPO5c28Pm8eTKdCaPzUvqPfq2rGL0OPJ1OovH501yAVxRXDYp
	qTmZZalF+nYJXBl3PixnLPjJW3FrwVr2BsYv3F2MHBwSAiYS7x7XdTFycQgJbGeU2P9oHXMX
	IydQXFLi88V1TBC2sMTKf8/ZIYo+MUr8m9HIDpJgE9CSaPzaBdYgInCCUaLvliVIEbPAfGaJ
	huZvYN3CAl4Se97tBGtgEVCV6Ptxhg3E5hWwkmh/sZ0d4gp5if4OCZAwp4C1xLb1U8FahYBK
	Fj7ZyQhRLihxcuYTFhCbGai8eets5gmMArOQpGYhSS1gZFrFKJpaUJybnptcYKhXnJhbXJqX
	rpecn7uJERyNWkE7GJet/6t3iJGJg/EQowQHs5II76rNGhlCvCmJlVWpRfnxRaU5qcWHGKU5
	WJTEeZVzOlOEBNITS1KzU1MLUotgskwcnFINTBNZ9h9Nbb5wzGNKe8fJe3r+6kkPjbz39lxv
	1jXK/Ffj81xExcM3Vfdw4ALW6XNnxH5/+3Frl8XReV5z1ja2rlgfs7j7QVhSkDK75s1VU8Oc
	TRjW+8Uxyb0S6BU9sMVp37YJr9R28G2SmHRpWU3JnNXv7W2O3lm90D7CqS4vNdchMSCwo7Ut
	9aTGFF5Wrp6QPP05aa+y9DoTnznmvb9x/s66vXOa8kUOKny3dDxUvq84ffUf3uVeXjYOJhzr
	N7mUdSy9XXpg0vZ1G26cUP9ickhj8nm2ZdNffujdGNG5qOdo1ymhbL8P5uWtmR6+DtrM5elm
	7GJT/u/tWumnyWMS8f6YAJPaBM9FgmsMzc/vVGIpzkg01GIuKk4EAOeqv5I1AwAA
X-CMS-MailID: 20250518193235epcas5p4f0bcf581b583a3acf493a20191ad2b00
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250518193235epcas5p4f0bcf581b583a3acf493a20191ad2b00
References: <20250518193152.63476-1-shradha.t@samsung.com>
	<CGME20250518193235epcas5p4f0bcf581b583a3acf493a20191ad2b00@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_022937_271414_B75A74C1 
X-CRM114-Status: GOOD (  18.12  )
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

Exynos PCI file follows MACRO definition order where
register offset is defined in ascending order and each
bit field within the offset is defined right after offset
definition. Some MACROs are out of order and so reorder
those MACROs to maintain consistency.

Suggested-by: Hrishikesh Dileep <hrishikesh.d@samsung.com>
Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 990aaa16b132..286f4987d56f 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -27,11 +27,11 @@
 
 /* PCIe ELBI registers */
 #define EXYNOS_PCIE_IRQ_PULSE			0x000
+#define EXYNOS_PCIE_IRQ_EN_PULSE		0x00c
 #define EXYNOS_IRQ_INTA_ASSERT			BIT(0)
 #define EXYNOS_IRQ_INTB_ASSERT			BIT(2)
 #define EXYNOS_IRQ_INTC_ASSERT			BIT(4)
 #define EXYNOS_IRQ_INTD_ASSERT			BIT(6)
-#define EXYNOS_PCIE_IRQ_EN_PULSE		0x00c
 #define EXYNOS_PCIE_IRQ_EN_LEVEL		0x010
 #define EXYNOS_PCIE_IRQ_EN_SPECIAL		0x014
 #define EXYNOS_PCIE_SW_WAKE			0x018
@@ -42,12 +42,12 @@
 #define EXYNOS_PCIE_NONSTICKY_RESET		0x024
 #define EXYNOS_PCIE_APP_INIT_RESET		0x028
 #define EXYNOS_PCIE_APP_LTSSM_ENABLE		0x02c
+#define EXYNOS_PCIE_ELBI_LTSSM_ENABLE		0x1
 #define EXYNOS_PCIE_ELBI_RDLH_LINKUP		0x074
 #define EXYNOS_PCIE_ELBI_XMLH_LINKUP		BIT(4)
-#define EXYNOS_PCIE_ELBI_LTSSM_ENABLE		0x1
 #define EXYNOS_PCIE_ELBI_SLV_AWMISC		0x11c
 #define EXYNOS_PCIE_ELBI_SLV_ARMISC		0x120
-#define EXYNOS_PCIE_ELBI_SLV_DBI_ENABLE	BIT(21)
+#define EXYNOS_PCIE_ELBI_SLV_DBI_ENABLE		BIT(21)
 
 struct exynos_pcie {
 	struct dw_pcie			pci;
-- 
2.49.0



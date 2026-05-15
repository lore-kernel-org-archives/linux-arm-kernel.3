Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EABACD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 02:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uNqStT8E7cOnItJb8DaxzYvszxZpCiV3YjJwPZLjb1g=; b=X2tJYyQBSA6tdRR1B1dA6PHJrt
	BBDtGQaHikiwVd5JLuk4ZI1SaSYFU2Ivi0q1QQGwKIFTWZMAYn1+FiOQkvND0UnS3PklXn+rtlxmm
	HzDUINUrb36dzQJsp3ic7PlntfrCeo0HbqxTx4OuKI2XD/3ZiUQp26M29DVhjQTJbnDXKK1qvKell
	ge1h0fPDz+7w5MRpisdkp5EmVn1RG53uWLT5pdz+FhADjNTK/YVEil+vz4JY7BLfx3oXynHYsVM5m
	CWZD+eU3p/jXM+H9hLGtXttBemV0HVcBciHB5wvpMImySk0u7iWc7KKgBbODBsj2hN9FIi2TvOVOa
	CfMiwc/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNijg-00000007AzY-3snK;
	Fri, 15 May 2026 02:57:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNijd-00000007Aye-2CtO;
	Fri, 15 May 2026 02:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=uNqStT8E7cOnItJb8DaxzYvszxZpCiV3YjJwPZLjb1g=; b=Y/cD7s3dxuDJo5h1AXSva0yb3S
	zAkUXRKNfVmkRJ/njcwThvQyzdMGj/0thIyg8xQT1UN7t4moBRPD0FaD0u0L5EOgmpZOygETMjYeQ
	IwfUY+F3si1GS6lRJv3ZVgcrnu8NFzBmawn6WCgQlxvQ/iC1+YwVuhZL2gDA5iMuvGQ0WBh6hiTvO
	cSp90M2YAi+ptVrVjELy/CXF/CRLjIWvbvTu3Hl7DKEpNhSNV8r6PrpDNxyY4bEzPlOzku+3lS8wp
	uxnsdfbpISII/3sogHCG8KLhRjX72EYjnCf1rb8CRfsvey8QKlIzmDh70Ji33eRAV87QpUPJov+Aj
	RptoI2qg==;
Received: from mx14.baidu.com ([220.181.3.101] helo=outbound.baidu.com)
	by desiato.infradead.org with smtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNiiA-00000004EgH-44Cp;
	Fri, 15 May 2026 02:57:02 +0000
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] PCI: mediatek: Fix operator precedence in PCIE_FTS_NUM_L0 macro
Date: Thu, 14 May 2026 20:55:52 -0400
Message-ID: <20260515005552.2343-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: bjkjy-exc11.internal.baidu.com (172.31.51.11) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1778806562;
	bh=uNqStT8E7cOnItJb8DaxzYvszxZpCiV3YjJwPZLjb1g=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=WH0CBuMCtVdPfKyf4zAERHJlwsPMg61wjptqVcDsti9PV0LY7Dz46S+xv7UGM4Prh
	 tcIGi2qMxuLds0wpkf1To/bcwg7cpC5C5X3verImRaRJCXAsP/Jh/fbmLIMke2GpC1
	 FEBqrW5BNIeCGM6NtPWvr6AerQKwqHHcoB0BKUvBsE5AIYiRalZioP+V/Yr5BmW3Yg
	 b8DziRlN/9yvotAxFmOe0AsqwOxljJU8/6/yqWksMCZmuYDgPa94R7/KoB9Bnjri6j
	 b5nCws4s1mLvmHjMXjrVoFS2uNJdC9ohJfpWLkj+vxnZdyEeQOOP7XNgO527B6SdYQ
	 DzwfQ7CnD4B7w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_035654_093566_0F3DE942 
X-CRM114-Status: UNSURE (   9.21  )
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

From: Li RongQing <lirongqing@baidu.com>

The original PCIE_FTS_NUM_L0(x) macro was buggy due to improper operator
precedence, where ((x) & 0xff << 8) was evaluated as ((x) & 0xff00).

Instead of just fixing the parentheses, use the standard FIELD_PREP()
macro. This makes the code more robust by automatically handling masks
and shifts, while also adding compile-time type and range checking to
ensure the value fits within PCIE_FTS_NUM_MASK.

Fixes: 637cfacae96f ("PCI: mediatek: Add MediaTek PCIe host controller support")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 drivers/pci/controller/pcie-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 7572252..00f0e29 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -61,7 +61,7 @@
 /* MediaTek specific configuration registers */
 #define PCIE_FTS_NUM		0x70c
 #define PCIE_FTS_NUM_MASK	GENMASK(15, 8)
-#define PCIE_FTS_NUM_L0(x)	((x) & 0xff << 8)
+#define PCIE_FTS_NUM_L0(x)	FIELD_PREP(PCIE_FTS_NUM_MASK, x)
 
 #define PCIE_FC_CREDIT		0x73c
 #define PCIE_FC_CREDIT_MASK	(GENMASK(31, 31) | GENMASK(28, 16))
-- 
2.9.4



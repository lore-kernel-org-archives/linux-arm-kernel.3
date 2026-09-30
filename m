Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C17FCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tm4KhT1i9nkviFOM/DKWhqvTQ9rSQZ5LZ/7ePdMtknI=; b=2mw/xi2k3JoVfvsXabdGFY3kVz
	UV8+6aF2Sf+ljbBy6HS5rTqPQ4bKMcMn+v0/wfgHoalByA44bTHk5dW9Kbz985Gb6t807dksCB3dD
	FLVAd8WmOhTYFjcZ/65/m5LGiTaH5jSAdPvYVxor9IaPFzx8eLEraSkddQc7M/gW38ezvX3xKwVdc
	7fU7oqPAgDlw2E7uwsqYXuXBZPI+d3LnVGVB/naX8usWoz24DsjFeZIYyKfXyiBW3LZx+LM9/T9XM
	7tbKtrbwD/ZpunxMe3LtHnZ6yz7w+Rerz9N+k3wi8xcCneJsgm/qRgvMU41OPMcAjveQhlQPSkSza
	0BhH4wPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBryC-00000005nsJ-39bC;
	Wed, 30 Sep 2026 10:55:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBryB-00000005nsD-0oq8
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 10:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Tm4KhT1i9nkviFOM/DKWhqvTQ9rSQZ5LZ/7ePdMtknI=; b=oCmZVg+0x0ITGr4pFT0t34CKj8
	yDr3OvlkvddRAk0747WXLSpqbYz6H0kOphqSr7I5Bb7r8w9v03YWe7X9hCpAJO1F6bDttn7TWGfOk
	cygeG5bZDZkbjRpzbkeaQM9X+4y93PwpGcNm8U67VtnGowXk3LaDmTmhpuvFzuNjYQ4lDoOg5+NmV
	rt3MAbf4rc5C2HWB2Z7SrtZooP5xVMbGdRBbl/0zNLHfMTqcBwF8o/0iH1YlEoP/Je8kB4Ec8B07c
	zyNeKD94cNWLqYbH245o3AnrWvm1XpJARtWMj083hZkoG/FOdFmpU2rEhpwPmCgVvVmBO9FJI8H9l
	CNe8AGBQ==;
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBry5-00000003gdr-2NyM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:55:26 +0000
Received: by mail-dl2-x10.google.com with SMTP id a92af1059eb24-142dd046b87so3804922c88.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 03:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765718; x=1791370518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tm4KhT1i9nkviFOM/DKWhqvTQ9rSQZ5LZ/7ePdMtknI=;
        b=SGX/YXFrJFuwWfgawvXT+gl5Ap8R1cXvmLhh3ob2oNWOdhowuARUgDhn5vA2et17Kg
         R463a7ZeHA3FD5vffRJXYigjehkddcUjk9crw7bSxQi7Xv4M2hbb76Erd9JTezc1i9KX
         B+DZDDXTjM8s4L2/VdZHfxrkY1aN1lDAwLjfzLFp78lR4e7SPo2dObFH97J3krldEwdd
         088FfDbM33eTsERuxBCg4fjSsuxuYfLMycsI9rdtJL+Razv6TddfKrVxqVGD2kxrG90M
         DXvSgh7McBo2WoA2kHrijQ8rVZSNI0OqxZZfIivkKVdHY4gSh6MCUDjpWWlEGoQdODKL
         Hfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765718; x=1791370518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tm4KhT1i9nkviFOM/DKWhqvTQ9rSQZ5LZ/7ePdMtknI=;
        b=pit5qLe4aQz2wlMoljcCuQt48Z9mk4iTvc//BY7fs/v0oX1y4T25edJvuhoorvi9kv
         PsNyGPcxCTUVAwu8RCR7DDLQLE8MD/Ju+MSZC4/T9+KUn2X/I6R1tP3kpXrqvZOqDQp1
         H4xkO4sOVQqU3fwygau42S6mDtBVDfXZgO8WH83LtIt96XHGOrAPxcXxuWhXpfLQtsHF
         92zgiS3vZrm/3+yZVitcHeOYYXoZZ0JYieAcRFYLQqJ/g19Bu6bDKPdIOamifGWXNRdt
         jdmkKV/6yn/ZFGL6NbJUqfgkd/t3DOzZ8JTkAkHh/XF99PWR3aR82roiloxUNIIl/wFL
         Jhow==
X-Forwarded-Encrypted: i=1; AKwUvByW1xmPqxFh3awcaiPFrfivdj4O0Oz9UmsE7aPwq5R0retiLenn58wASkYjf+wVQQ4SVY6JJ7Yo5qkAA8+2Jjg4@lists.infradead.org
X-Gm-Message-State: AFuF++mKmFR1UmZJfJKML3PYUaAfAGDbrF1P+OndQ1o3Toi6gqMMwrax
	JPqWJTqyqfPcB1VXUL4CDNuqtbtFowFQGBqyOiIf/6Pb2UmggHYz8nxvR5Keh69d
X-Gm-Gg: AYBFou2Mv2sDfDYhJ3QOKyFb7g21pmTTSnPldkHDDara+xMntyJjDkzfnmr20N/Gvgq
	P2rZKIkq39K+yLNFb71N2xRG9O5gOdOowqPiAo/s0DmqG07/H4+Bjiq9UtZUhRgMC3vTe9GwDhJ
	2hoFHrZxMqAhukwGKw2x700o/y8fuNJgjzaiFf1Qc0qAyq+heJJt9UWtDYv5zz1dXt9ybE2GtCL
	AAg1uVX8r1UNyfh2yFuoORGjZXuWJebxaZ8UeT3A2u64l3cK0Mt8pWAuUuOlb5y+sLRxPH/klcJ
	gfy34v1THP52IztQwzXmXxSXCCSK09h1/A6ri9o8/XekvOW7mVeXOmfkttUPq1Dpa39ArXVKW8T
	DvTA1lfBdxwgBsySjO6uP19ycK/iJbHTSwa+4fjI2ZnsfISCnrCxm0ZBWclcHC142jByTRIETA8
	w27VGk6abq0JG1xQqSAI+bmIluKUWSoPkcQhd0n2hxJ3JEn7tN6PjX++BwPmiclNQmLfyXGzuAc
	XaWOvKDj0q3obrs6ISB
X-Received: by 2002:a05:7022:91f:b0:144:eaa7:2765 with SMTP id a92af1059eb24-14d3204e73amr1522897c88.18.1790765717951;
        Wed, 30 Sep 2026 03:55:17 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.97])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d083fea61sm4295477c88.3.2026.09.30.03.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:55:17 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C3=85=E2=80=9Eski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH v2] PCI: mediatek: Fix integer truncation in fls() and clamp size
Date: Wed, 30 Sep 2026 10:54:35 +0000
Message-ID: <20260930105435.3660-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_115524_144894_77214220 
X-CRM114-Status: GOOD (  15.81  )
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

resource_size() returns a resource_size_t, which is 64-bit on 64-bit
architectures or 32-bit systems with LPAE/PAE enabled. Passing this
directly to fls(), which accepts an unsigned int, implicitly
truncates the upper 32 bits.

Furthermore, AHB2PCIE_SIZE() uses a 5-bit mask GENMASK(4, 0). If a
resource size of 4 GiB or larger is passed, fls64() returns 33 or
greater, which overflows the 5-bit mask and wraps around (e.g. 33 & 31
= 1).

Fix this by using fls64() for 64-bit resource sizes and clamping the
result to a maximum of 31 to fit the 5-bit register field.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index a60d1ae076f8..9576fe532b92 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -686,6 +687,8 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	const struct mtk_pcie_soc *soc = port->pcie->soc;
 	u32 val;
 	int err;
+	resource_size_t size;
+	int size_order;
 
 	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
 	if (entry)
@@ -753,8 +756,13 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 		mtk_pcie_enable_msi(port);
 
 	/* Set AHB to PCIe translation windows */
+	size = resource_size(mem);
+	size_order = fls64(size);
+	if (size_order > 31)
+		size_order = 31;
+
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
@@ -775,6 +783,8 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 	struct resource_entry *entry;
 	u32 val, link_mask;
 	int err;
+	resource_size_t size;
+	int size_order;
 
 	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
 	if (entry)
@@ -829,8 +839,13 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 		mtk_pcie_enable_msi(port);
 
 	/* Set AHB to PCIe translation windows */
+	size = resource_size(mem);
+	size_order = fls64(size);
+	if (size_order > 31)
+		size_order = 31;
+
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
-- 
2.55.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BBFCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 12:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jNaKwS3H0FTb6G3uXAp4oWpgGMYYjT9MmVEzrS7Q8MI=; b=Iu9uHyBhSHerZfloWnj4PxKETB
	qt5nS8bVYKspNINgIsu5BCGl2nd9X/Fp5pc7nXRoiV+OOthVrS9HM3ZG49pDom7mCvxnSUP+gcaKS
	fufXNH6+R5lQVTd6Tl7Neij3F5ZKhF2CQstfs6Z0Ng0xb9gmNhTKaEzRe44KdIt0z31lxba7ErZVa
	NenJDKb9Hi+zUwGRBsNNOCFIULMiO6HDbXV8QwHTZa/IymFTuCeDTl3MCZbg5Lek+xYWruGB8DuGa
	H1hmHRq0C2nSuzm9IIR6pD4oK3ysq410JC/i3a3Ysfb9xQRmbfmJv0RYnayeBef/1VwsiEDbHaiX8
	ip0UvotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBt4o-00000005y0Z-2xHM;
	Wed, 30 Sep 2026 12:06:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBt4m-00000005xzx-3uo7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 12:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jNaKwS3H0FTb6G3uXAp4oWpgGMYYjT9MmVEzrS7Q8MI=; b=azZKV6Uw69igTCJb09c/97UaSE
	Zfdwob9zIFAKh94sty8K/YiSdpcpJdm946iBlm5LQgW9zCHShiIP2rBgU6szRD1pPAXN4bRddDkVQ
	5Kwij6q6eJhUh509Q4Gr40iMLGuNkC8WDkM7yCphAJz5RtMRfxu1ltzn81VtU1OgmZXof54duI4s9
	q3a4Nc2G4didhQ8pl6FgxTcKAeWZ30et9G1AebPbKDZyApTXPGsfI4Tt8cf0eMmwotuypL/CCZd+i
	tLZs52LkNBwZdYx4JhUwWIm5+PbG6lA5KZWCmNjkXCkQFyTXSWd0jKmcpYJU1+d8uI/lmr/NSPW/t
	OuWB+drA==;
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBt4k-00000003lCA-0RNR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 12:06:19 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-33bfb26865fso5216265eec.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 05:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790769976; x=1791374776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jNaKwS3H0FTb6G3uXAp4oWpgGMYYjT9MmVEzrS7Q8MI=;
        b=Z0OsZbqsAermAKgznw+low8H2vNjnVjm07e4cNFXgN4rR5y2gjFOh5vhi6k/5e1Mon
         CTzqbr81cq0e1pSF4LWOy6eAtiCB1fmt0fXtLDiEWZxTUlb/q7BIVzIla/P8Q2MJKQGk
         7Q6PomE7UEb+EL0C/FZ1YcejXpIlRjpbzX5LSlr8iEszHG1gRihDJJMGu0lX0DIP5Esi
         w4cfVzK6rZPgg5zU+QvI/GUxagU/HDd1ZtIpHbVxhNfdGziwmyd31VmH48gKccVtjLgz
         dbNOeCRhxyFykFWrF1IT57+3kIp+EZEQahBd+AblsQUxpsV8iyG1MWzn4uxZy9saUiEN
         ontQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769976; x=1791374776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNaKwS3H0FTb6G3uXAp4oWpgGMYYjT9MmVEzrS7Q8MI=;
        b=u9zO44x/BaySLRl9a/eo4O48V0hA3xq7COgB1MbumrFPmzC2fw8JRhRMVkRi7Cag2u
         FYoSfHeI1kRhbrhyQfrWZdoKzTKWotKc9Kmo8RCZsLbu6McSUYSYzQYBN0numDps51xK
         6R7vWH+FWrMz6YOD8v5J4WA0Vx2PcHwLDJQ4mT2fyE2VMoelK+nmCD/MOW3gkhFxPpV6
         UWGBvj4G7ZafiZBk7bu0xoh5fq4zQelVnm9esLzncTP9Or+HHde9t92SR1kMlD0sUU7T
         ksmjwPABGMA22vY4cBnON2VqyGsCaNL7/W9JCRXJZTjOQuYZV9tMvMJ6qKYQCRbG1Qql
         L14w==
X-Forwarded-Encrypted: i=1; AKwUvByHLzrHBhlWQ4LSkGNHY+i5CRVfMN7R7AJcVUOv27YvNww3VNDO9j5ZgqDfX+r2lfyAfDSG1tJDYzR3BR8KvTKJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIBK/rSVzn94BzhpSnXDuB0/RkKrHbXWVyhP+j208aLOwp313EN
	QYSuaYJlF8B2303Se6pgWjcFp5UN5WujqG3JTz1aO2USkNUDs5PG9AbpdonCc1Uy
X-Gm-Gg: AYBFou2lWlUCumOBlL3dh1L2EtgiU0N4VBzcOx3e3MBe3KTS+WLC1j0PzxvrNMUGUs9
	0GBxb2pUHHgvHVyDL66hRRUxSRLNg0GJ2m6MzsXGByRzNF62DCHbLV6Jg4LnauyxGfPoPq+R41y
	5GGz57rkS17f4QrMS7D/nLyAmjSUciTnl7BZtOT7jOpqyFxgCx0XRlAxVNT0wrIFA7eqETNQLzp
	sECRfFLm1tU1hRfmLCppVPWqOi00RIS9kTEVW+YAjm1R/KRhYa/q0R2Axt1JUYtQc8Cjg5MZzG/
	czoNDeO71BzyQvCyB9jqDY4l2DwGcQtSujJWvybWuBrirtpR4SoEJWE2s/UPTLrysJx7JpZ0bZh
	8oHqmfZLsiA4NXBhs9M+yhdYyFewd/RDD8GUN0Rxm7SNAwmdMXunP4RmHO6J9m3hTL8hD4lHAW+
	swYfqgEm4LfSA34qzXW7+2i2MaD+n4Y2fdnb8/iQh5ISvFrvN3o7IKBjmq0zIm3uyoITeq6xzyf
	fD2rag14wjkn+8CbjLy
X-Received: by 2002:a05:693c:20cc:20b0:34c:df85:8e3e with SMTP id 5a478bee46e88-34cdf859b93mr1452972eec.4.1790769975550;
        Wed, 30 Sep 2026 05:06:15 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cef75459csm4692705eec.0.2026.09.30.05.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:06:14 -0700 (PDT)
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
Subject: [PATCH v4] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Wed, 30 Sep 2026 12:05:39 +0000
Message-ID: <20260930120539.4967-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_130618_286146_493F0720 
X-CRM114-Status: GOOD (  17.05  )
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
resource size exceeds 2 GiB (order > 31), the log2 size order
overflows the 5-bit mask. Clamping the value silently truncates the
hardware window while leaving the OS resource intact, causing bus
errors when accessing BARs in the unmapped upper region.

Fix this by using fls64(size - 1) to accurately calculate log2 size
orders without off-by-one errors and returning -EINVAL if the resource
size exceeds the maximum supported 31-bit window order.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 29 ++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index a60d1ae076f8..639884b22ad7 100644
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
@@ -753,8 +756,18 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 		mtk_pcie_enable_msi(port);
 
 	/* Set AHB to PCIe translation windows */
+	size = resource_size(mem);
+	if (!size)
+		return -EINVAL;
+
+	size_order = fls64(size - 1);
+	if (size_order > 31) {
+		dev_err(pcie->dev, "Memory resource size too large: %pa\n", &size);
+		return -EINVAL;
+	}
+
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
@@ -775,6 +788,8 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 	struct resource_entry *entry;
 	u32 val, link_mask;
 	int err;
+	resource_size_t size;
+	int size_order;
 
 	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
 	if (entry)
@@ -829,8 +844,18 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 		mtk_pcie_enable_msi(port);
 
 	/* Set AHB to PCIe translation windows */
+	size = resource_size(mem);
+	if (!size)
+		return -EINVAL;
+
+	size_order = fls64(size - 1);
+	if (size_order > 31) {
+		dev_err(pcie->dev, "Memory resource size too large: %pa\n", &size);
+		return -EINVAL;
+	}
+
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
-- 
2.55.0



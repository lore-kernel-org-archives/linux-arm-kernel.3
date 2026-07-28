Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBADC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fQlE679JObsFJHTkpZQZUZIILuIjOEy10+IeTfWR3d4=; b=0hkKNfETgUnMlHId4Dpfr4iJcs
	0SFOqKHSyk0+kErEs/0YOJwcZCFDNN7SO7rDXaJuNgOidj3yLqse3fzD8CXz79u5EuGkiPXlHP/GS
	lDuZ0GlReHjsQ9nul5lZMZpG/cpQgcj+T5q6nw3jVoy4zHEC0pa0U1P0wKY5uPvtowgrcbgsODkg0
	Nu/1/g500CQpAXWgNvqLwr01XIztyRkSBrCBg9rbIgtqZ82Gcxn3kla/LiSR/RDHIxpL9P3CNJFy9
	hAb3yofvUMXZkti1KuhJbaG3okE69W0xJx9mNLDHwP3JW12IvIbjxQi3aeyT/xG+mY7KbBWg4Ye5N
	XOvHUGLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogXE-00000005Boa-3NDV;
	Tue, 28 Jul 2026 12:03:48 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogXB-00000005Bmc-1I2d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:03:48 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3603787a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 05:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785240224; x=1785845024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQlE679JObsFJHTkpZQZUZIILuIjOEy10+IeTfWR3d4=;
        b=ekwWWpZQ+H8cLyplWF56B+19PNp8Jja4S2KB1DxqC6jOTGI+3qqV7jHayt8uh1lqjZ
         2P6ejgVEupET3uS/NU9ySVrF/ZEIBLj1gevm4ETEGOPGzut874SI7ApM8zSvbRvvjdRH
         fCQUFc1/Lx18Roih4WBrrxRBguCYFoM2pZEw6xlawkjzSjamFBdij/mYrJVtXpq76EJc
         GldW35F7s2Rkxa24rNDHkDiHFsiPO6vkn9QOxwDXgj8FaFUrVKlcq62OgNhet10ltBG7
         UzgeJLXLz+ANe56FHZYqt4lW9UlU7smpHMAzNQ5sdlHMjg7nOnyCiwieAB7yHgiKM7S8
         JBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240224; x=1785845024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQlE679JObsFJHTkpZQZUZIILuIjOEy10+IeTfWR3d4=;
        b=FB9DiVcvQ5aO6HuxHIhS/3+MdHlO+SJgGkqqy+khR94bOlpgpuN2LsbhUXu0/JXVTI
         pI8I2hFrFrvWT/P9+nT8N8p5XRTZEDTQ54UGkAo0EjtwgRleNpwmT7U5Ak8aamDTr4UN
         zyRUDVxWuKyWaKC3No9DFCOdMr+MikaWe4Mh1yFVdRvTxvvh7I++qUaBTfxTMGrLPqUZ
         OedBpMLEj5xw3H8h/2yco+a7kRnGFktxfV4EVjqhvwAI04nSIx4ZekD+cud+kPxgQept
         rn7CKEKI78yFEcf44PwcU7LkdyLy6W/Sxv5Q6468cWwxj7fUFZwBoHQnReYDA6v/iHtm
         p1MQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKgKaZN8DpDkOV/9i2kuB2eXbn+G9dHxZIhNq/K/rEtPWHvC1iiryJdggPleynKwp2fIQKqZD+4WwG/5/v3Ja6@lists.infradead.org
X-Gm-Message-State: AOJu0YyfdYFqG2T1bvJ+Vd6Bs2qHHsJqHaLOUIf1jX7FZiu+ps/A+8Ol
	PM6NkiiQekPhdl1JI4jFB/EAK1sPlD4SzxIFZv+Mu2PaS8751gFtiO8mmI0mR+FyHIA=
X-Gm-Gg: AR+sD13ssbuRLM8xuM+bM5Vs1dNM7LXcuDI+/ZvdmNNfAPVT4hltiEpnf0kHuJxQ1DM
	RoZ4nQTDoWuT2DCepyDto4+HkMGgeVqXSaE3WfbtEqmOxdgUxFXbBy1iIVqZcxaAUaDUeI5AV4r
	pM+vM7VNoZnS0SMumqG3y2U7RyOiBCnl9umjhB7ystdXlXyCqN82iNC2/3h5Q+AyrKx/1w4VHTo
	O40RBxbA7af7hlzhROquMlR0ywxe4r1Fr1GEoYgQOr58gTeg2F91EJyO4gRUBElCFt3/Jrdxuxx
	0olJT2jHz9idKw5JffbM4hj0DdOATvFsajnhbhUBvlUbmPHM1Xsh8D1OwSdV9tnL+a9++wPSaiM
	7oEVyzwAB4/6VUtn7/RV7R9dDt934fbVShPvUXUNh4PgDnOPaSiSGkWiL2M+cBZxQoJ3DFrxisu
	FecUlFhBXuL0FVHGmVzGzhBMBIyg==
X-Received: by 2002:a17:90b:39ac:b0:38d:56aa:6f32 with SMTP id 98e67ed59e1d1-38f6a4c6bbbmr2080804a91.38.1785240224085;
        Tue, 28 Jul 2026 05:03:44 -0700 (PDT)
Received: from localhost.localdomain ([103.179.230.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm42878472eec.10.2026.07.28.05.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:03:43 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: ryder.lee@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH v2] PCI: mediatek-gen3: Fix 64-bit type truncation in mtk_pcie_set_trans_table()
Date: Tue, 28 Jul 2026 12:03:01 +0000
Message-ID: <20260728120301.3188-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_050345_387778_F97979B4 
X-CRM114-Status: GOOD (  14.02  )
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

The variables cpu_addr, pci_addr, and remaining in
mtk_pcie_set_trans_table() are of type resource_size_t, which is 64-bit
on 64-bit architectures.

Using 32-bit helpers fls(), ffs(), and BIT() causes 64-bit integer
truncation when computing window sizes and address alignments above 4GB.

Fix this by switching to fls64(), __ffs64(), and BIT_ULL(). Note that
__ffs64() uses 0-based indexing, so the '- 1' offset is removed. Additionally,
return -ENOMEM when translation tables are exhausted to prevent silent failure.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Replaced non-existent ffs64() with __ffs64().
 - Corrected 0-based indexing logic for __ffs64().
 - Returned -ENOMEM on translation table resource exhaustion.
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index bcbd08c82a5c..67635af0ed2a 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -7,6 +7,8 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -334,10 +336,10 @@ static int mtk_pcie_set_trans_table(struct mtk_gen3_pcie *pcie,
 
 	while (remaining && (*num < PCIE_MAX_TRANS_TABLES)) {
 		/* Table size needs to be a power of 2 */
-		table_size = BIT(fls(remaining) - 1);
+		table_size = BIT_ULL(fls64(remaining) - 1);
 
 		if (cpu_addr > 0) {
-			addr_align = BIT(ffs(cpu_addr) - 1);
+			addr_align = BIT_ULL(__ffs64(cpu_addr));
 			table_size = min(table_size, addr_align);
 		}
 
@@ -349,7 +351,8 @@ static int mtk_pcie_set_trans_table(struct mtk_gen3_pcie *pcie,
 		}
 
 		table = pcie->base + PCIE_TRANS_TABLE_BASE_REG + *num * PCIE_ATR_TLB_SET_OFFSET;
-		writel_relaxed(lower_32_bits(cpu_addr) | PCIE_ATR_SIZE(fls(table_size) - 1), table);
+		writel_relaxed(lower_32_bits(cpu_addr) | 
+				PCIE_ATR_SIZE(fls64(table_size) - 1), table);
 		writel_relaxed(upper_32_bits(cpu_addr), table + PCIE_ATR_SRC_ADDR_MSB_OFFSET);
 		writel_relaxed(lower_32_bits(pci_addr), table + PCIE_ATR_TRSL_ADDR_LSB_OFFSET);
 		writel_relaxed(upper_32_bits(pci_addr), table + PCIE_ATR_TRSL_ADDR_MSB_OFFSET);
@@ -375,9 +378,11 @@ static int mtk_pcie_set_trans_table(struct mtk_gen3_pcie *pcie,
 		(*num)++;
 	}
 
-	if (remaining)
-		dev_warn(pcie->dev, "not enough translate table for addr: %#llx, limited to [%d]\n",
+	if (remaining) {
+		dev_err(pcie->dev, "not enough translate table for addr: %#llx, limited to [%d]\n",
 			 (unsigned long long)cpu_addr, PCIE_MAX_TRANS_TABLES);
+		return -ENOMEM;
+	}
 
 	return 0;
 }
-- 
2.54.0



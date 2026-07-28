Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A35C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fQlE679JObsFJHTkpZQZUZIILuIjOEy10+IeTfWR3d4=; b=kBRFaQeXslkBAQZgr8KT6SEhqD
	X9Q4latJNKd/bRP+yIrEUNGqNRkcdLtFrnLwHUSHfmNNftxf3Ol+ZBONWFjlJNMuc/w41sTNqHpCl
	XBIoVdD900TCnsnNzckYShStnc1bBcMfAa7lH+oUxVi7mRvzGXoL+kjh1CXJKFzXr6SUi8t7kbbI2
	obyPzWg/4XXdWquRof+ygthd/KPbcxSp99LRlwr+fY0wYK8A63vo43rKqErYTkGKdwCTklCAcCwdK
	fVD4+PZk+B7+N4k9RDFf3eLga04SlFFaN7KstT7llxNt8HQiVE3xVbvEQPMd2ijnCrvXRgGf67U38
	o4TzagGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogo0-00000005DzG-3bwy;
	Tue, 28 Jul 2026 12:21:08 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogny-00000005DyN-1noo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:21:07 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cf27856f9cso47557415ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785241265; x=1785846065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQlE679JObsFJHTkpZQZUZIILuIjOEy10+IeTfWR3d4=;
        b=TJFGZZQMvV+WbNr7l278jhiDTyQpOny1mLOaYIzjO90qcyNCwmqygTR/IfWeDVs+ZW
         gj9G/RlD5HwvQ6QoNnY8sjoHQejw9GSX90DyjtYNSfkuaZTg9ZMF4/nR5PYSZaEtFxqX
         51+S/3KBkoj9IMtJxVaEOAKDbjY8Nf9BVbPUQGD24X3cK4NTozY0cBZ2ZNxSCUOPZBeG
         jSAHrpwPx+5/5F2+6xLAeNL5cc1V0hJtkU0NqFWLeVZIqJUuuEIJF0o/6b9BcZ6N9Wak
         JQMRgrucV9Zh4Nxxo+qF+ybp7MBhff4q51C6qxDOeSO4S7uL6YLpfEekEODeZGdGJW+U
         Y6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785241265; x=1785846065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQlE679JObsFJHTkpZQZUZIILuIjOEy10+IeTfWR3d4=;
        b=i/JL2SdX9S9XmAAk+ER7BPLU2nQJD/nPb2EOS7dhHGHkW4BAtIAw63p4B3gWm0W2qq
         h05yI3rEmv0fZgDETdLxy0n2wVPsJ93cYJaW5716hSZhZLq1E5iVJjlBudibqsuXL5UC
         ulcHdGmqfC/LRIJEk8NwWT6XI/ukR5yWzZGDVF7zWYxfpHeuaHybHbf6Dxr+KQx6Ygb/
         l0DmTbg4RFEFxKHrNvlQhP6GV3/IyFKC/FnDML6vN29vLUBUlU3T4ycN05rQJGRoHCO2
         hDps3wqJRC2me0e6vgzO9ZOnjENs7ueU0LMHMECIq/T0ULxiBdDCC2WKBXWCdYFGjRKX
         tI6Q==
X-Forwarded-Encrypted: i=1; AHgh+RryGPH4nmQC/4hKwLWFSsEJfOwziEozm/A0YMtBu9Boef2+u6dnTm2VfNVsFgals5d31VTbZ76DUX56ZK4u3J4p@lists.infradead.org
X-Gm-Message-State: AOJu0YyzOg9K2OIAkcrdQ7R50bYCf/etzRq1K9oCHAJZe8jxe5S19Stf
	GxYsBG6KurVNveALjzduX21iMl/tPdsM/lvVs4iZk+yaGJkqWS54rsFlmvo6H/77gpg=
X-Gm-Gg: AR+sD11r5eBy9aGeQG76uPRvJGTICvgDsSWTVQEQvhYPuq67Hur4TqO5btkmcLw/hJi
	XSURCTgXIBDsT9sw88H1ylRzIuPY7L2T+MRpRzfhuPwn5OaArh9qQb6iLNkg2Ig81GanCwdBBfu
	XSu60IdjfyyUF9F1fnPRkCU2Jq0IbtQZXU2tnFpb4Y2pIO3Slr9SHK5NapiAIeEVnhKnbaORjap
	gEMF7uWaCAIvHs0/+JiIFKp/FBwYiJo0/DdOYZYBAepuZCwVmxoDA/iFCc8ioGJT5fCbrs80Nmo
	qgp3pv2cMFfAetw9oJS83NzwITYSm67xEQJGB7SniqAElJZku7A571ZwH3XdpuJjRVLP3EqPqad
	FrONM7HmZFfhHciYYWRzYWc+AW1OLnEQUwiTZwtyVxTGCp2U2tg1Q4K64p86znK0BNmFy/sLnM3
	IgtkiG6P9q4JdMN91e1QeFSdIOvg==
X-Received: by 2002:a05:6a20:7f8b:b0:3c3:84a5:f2be with SMTP id adf61e73a8af0-3c8aaf8d6a4mr2824475637.11.1785241265469;
        Tue, 28 Jul 2026 05:21:05 -0700 (PDT)
Received: from localhost.localdomain ([103.179.230.124])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2d1d0d1esm40391876c88.0.2026.07.28.05.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:21:04 -0700 (PDT)
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
Date: Tue, 28 Jul 2026 12:20:23 +0000
Message-ID: <20260728122023.3338-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_052106_467239_59EECBB7 
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



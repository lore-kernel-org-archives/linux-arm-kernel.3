Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814E2C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 10:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Pnt0soTO1gFV2PGWJ/CfWR6YVxz0SNsCn9Ue8Tlcz8=; b=RLs3SyWUstGb55BdsYb9tX/S46
	7mFPWaQFjHMDqeFl+YO49KESgGd2VI4irSR+8io77JRK/U9HRQ9Auz4stYwfuVPRRuw6FBvoIQB/K
	RVDwDhRUYL1658ZMAaJfh7k+wRXoChSYVjNMZd/0ZRloI0ZOET19rsquOWS9Rj2EUxiD18P2vt0mn
	lvYmVfCebErYVOoMoV7fjL+iVrKzCcCjfSqj0gLW0dUrqDig0gt1sVTJGw8XDpWYw/7TLnbx7ps5i
	jc7Szd5fOYGhvIt+HbB01ZaqjYA6ixR2YnTDpDUj7x6TdU51C8XRm/Xxn65CXamAfIvXLwmQg9C7O
	YXJmT/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeq3-00000004wA1-2mH6;
	Tue, 28 Jul 2026 10:15:07 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeq0-00000004w8p-3QcN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 10:15:06 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-ca913a601fbso2673184a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785233703; x=1785838503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Pnt0soTO1gFV2PGWJ/CfWR6YVxz0SNsCn9Ue8Tlcz8=;
        b=by7ybpKr3yr/8yS+CAqpHAY687uHr4BJDvm3dr830tu/ZNcsVfkWphY7huqZwxH6f1
         J2bm+6BZkmCcrLKVf0w67AR3GH3E1x9juu8RhJpFqyBqfy+LzSXHJJXlk7Oz0nkHph7v
         +qsNHDXiRdtwH4rjlGbGpBvQAqHaQ88cKtr4pUs9qOX67uTEqLcYeyLEGjwtRMtlP8U4
         r0MWrm8OQR+34KYCFHmodx744IuisAvXsQz4aYIYfSIim93sS+4P5FYUtcJylk3tNPFj
         oEWumKON2Q0Dt9DnTLcZw2GlRAt2ZcE7siR3HEot68DbluwTyb9ghaoy7sA/3GpYHkj9
         xDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785233703; x=1785838503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Pnt0soTO1gFV2PGWJ/CfWR6YVxz0SNsCn9Ue8Tlcz8=;
        b=syYRqj1FiPWO27QD2trKSS5NTfC/CKnMYCqH3uBE7TMLLmS+axvSCcGwoLyMt/yKH4
         3Z98nP5uwuChcNZnGDUOk7ii8i4gqub7/ZFjBjDqNVB2jh11nGyUR3AJidBTJesU9akA
         3Tx1begCj3tn7FavVBHyFfbibfanMavPA/TqxBZrdMapgXtShC9QzOnYFAOxEVDBHxP3
         N7/3IBHkYmaer207h7E0qqCpv2jnUM7DH6NgsTWpQHUW+FWKRg63QuW8MRkWhvwqfBj6
         /j5G5/xvgkRCDX+CqdeMu6dtoxo8Ji1T4imccz4qCRwEPaj5h7dwh3rzetoAu1MOyXmy
         PpcQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8m0k4bvCGKqeNBh7rHbWdJzXLYhe0p7nvhrOfQlT0bCJQA8u2l9E+huDJHg32joz4Ppl3a8Lc81BZcwxqGTUB@lists.infradead.org
X-Gm-Message-State: AOJu0YweWiwOjUD4pT9Sl0FljEo22Qhmdxcu7Sl8dFNzCdqxBeg2kKDq
	lCF8ECAtPRdQkE6+a4pwYwl/Go6VulWFW02HSl9xTMnCdZXsGaejXkAQ
X-Gm-Gg: AR+sD11RoYNvyg/BAHAqyWV230xSMvLPyrgaPB+4KM5P7Ew/rYioIA4IlrXV6RxAqDM
	O2f3kVO9QXEFkG7JMZ7xAfFhHcJVAWPc5bZHMpEAUrwipwmWTXLkv2Q7eTrIB8keQedW+8PwBYA
	zPMSbWLjJh9l/FBTBBxOtyuGyEWDz0UyXUHnYbPKIu3T51u2X9qbsWWfYf+tPvd6Z0/q7goHBDk
	v+6Vh9BksrCqCTltuYYMuYG3M+8On2m8XUoO72TOfLwFh8PzW/hewzYfdBxe18uQfaboiGuVvFm
	mH9FhCJaTpu0XG1eyOpn1JsVuDCOnwTZnhfrozo45321TeEldaioJmBIDVZ9GXX7PZAnTvtWZ17
	lvdsFHVykrw+O3tQj4n/JD6RcykWwFgQUOJP79V9he/6OE7IdvR4aZPy/Ztvyf5YmYlpQ93ozZd
	cEEkQM5T3EEzKSR9gOYltchHR2vKHbncj6PpZK
X-Received: by 2002:a05:6a21:6b17:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3c8aaf293b7mr2497871637.2.1785233703464;
        Tue, 28 Jul 2026 03:15:03 -0700 (PDT)
Received: from localhost.localdomain ([103.149.158.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5c53f3sm38682831eec.30.2026.07.28.03.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:15:03 -0700 (PDT)
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
Subject: [PATCH] PCI: mediatek-gen3: Fix 64-bit type truncation in mtk_pcie_set_trans_table()
Date: Tue, 28 Jul 2026 10:14:13 +0000
Message-ID: <20260728101413.4575-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_031504_865884_05D4C5DD 
X-CRM114-Status: GOOD (  12.17  )
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
truncation when computing window sizes and address alignments above
4GB.

Replace them with fls64(), ffs64(), and BIT_ULL() to ensure correct
64-bit types are used across the address space.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index bcbd08c82a5c..b1dc18f851d2 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -334,10 +334,10 @@ static int mtk_pcie_set_trans_table(struct mtk_gen3_pcie *pcie,
 
 	while (remaining && (*num < PCIE_MAX_TRANS_TABLES)) {
 		/* Table size needs to be a power of 2 */
-		table_size = BIT(fls(remaining) - 1);
+		table_size = BIT_ULL(fls64(remaining) - 1);
 
 		if (cpu_addr > 0) {
-			addr_align = BIT(ffs(cpu_addr) - 1);
+			addr_align = BIT_ULL(ffs64(cpu_addr) - 1);
 			table_size = min(table_size, addr_align);
 		}
 
@@ -349,7 +349,8 @@ static int mtk_pcie_set_trans_table(struct mtk_gen3_pcie *pcie,
 		}
 
 		table = pcie->base + PCIE_TRANS_TABLE_BASE_REG + *num * PCIE_ATR_TLB_SET_OFFSET;
-		writel_relaxed(lower_32_bits(cpu_addr) | PCIE_ATR_SIZE(fls(table_size) - 1), table);
+		writel_relaxed(lower_32_bits(cpu_addr) |
+				PCIE_ATR_SIZE(fls64(table_size) - 1), table);
 		writel_relaxed(upper_32_bits(cpu_addr), table + PCIE_ATR_SRC_ADDR_MSB_OFFSET);
 		writel_relaxed(lower_32_bits(pci_addr), table + PCIE_ATR_TRSL_ADDR_LSB_OFFSET);
 		writel_relaxed(upper_32_bits(pci_addr), table + PCIE_ATR_TRSL_ADDR_MSB_OFFSET);
-- 
2.54.0



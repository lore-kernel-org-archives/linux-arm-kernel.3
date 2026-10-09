Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54297CA9EBB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 22:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u5J7o2GYkUO/dFQUqbI5ARsZScfQnssHo0UuBiZGwkE=; b=bPs5viQ+WZjSWdINj3zmFlSnZO
	Fi2xtjxG/QSt2xOqb7qQm3o+Fo9GvMtR1y+D84lfnQXqbAvWlnHHWs3XgMVJ8pTDAZ0/UMpCO7PCA
	3kOIHB5NId+6duz9ncIUCYA53ZQOCO1zdJdyY1+kpmuz5Vttz7Ic/txa6yHLDeE2tCiUA9oiKIBwA
	A4zDf7RNbNvQTNJfSzVIlAnFQ6NtNzQoRKkGhy1AXF4ncFpy9djhS+5Y8yF0kLbclB7n1ALziziGh
	6zON1C+H5Wyw/MpHRUY3QgpbfzXHqnS87pNTyjjV9WAXpwvDIczQtAdtM0jYLX7wmymLafnpqoqEg
	mgXM3jYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFJYJ-00000007Jit-38Ov;
	Fri, 09 Oct 2026 22:58:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFJYI-00000007Jim-1kwg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 22:58:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C6BC241830;
	Fri,  9 Oct 2026 22:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381541F000FF;
	Fri,  9 Oct 2026 22:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791586737;
	bh=u5J7o2GYkUO/dFQUqbI5ARsZScfQnssHo0UuBiZGwkE=;
	h=From:Date:Subject:To:Cc;
	b=PfkIGjAXO/DTj9eXqxy9aMrYVHkohKxKGu89T4bc6MXRKx4sFpx8nRnQ01m3cjGWX
	 MhxvTrHiF7xUt+G8HuVPM1Uik46ipBhM9absMdzh6PG8fseqcLO1Rnh8mHTD0lnrSH
	 TDLqxdz4AQg7espYlAP0PJqjtnSPjIpjpmzghZKHPW63XZb4gFEi6U8Nc9EuwvIdpA
	 Xu+B9jE634nk8gVLFVil2KFTG92wPRS/WN0Gxp1TRerkKqyGyARJOZ4gfvzC1Optn/
	 XNzJsur77uo/xNzwgWf0KEXGqRnlgbBoE0CqDQilFDuJ6brkwnLIFIa+zmXcSIlmCh
	 PIaEbiXn+2oIQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 10 Oct 2026 00:58:53 +0200
Subject: [PATCH] dmaengine: ste_dma40: Preserve the LCPA I/O address space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-dma40-smatch-fix-v1-1-26ca10043957@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MMQqAMAwAvyKZDaShOvgVcShtqhlapRURxL9bH
 O/g7oEqRaXC1D1Q5NKqe25g+g785vIqqKExMPFoyBCG5CxhTe70G0a90XL0QmOwkQdo2VGk6X8
 5L+/7Abs+G6diAAAA
X-Change-ID: 20261010-dma40-smatch-fix-42fce06d4f25
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

The LCPA area is mapped with devm_ioremap(), but lcpa_base and the
per-channel lcpa pointer lack __iomem annotations. This loses the I/O
address space and makes sparse warn when d40_current_addr() assigns
LCPA register addresses to its __iomem pointers.

Annotate both pointers and the LCPA argument of d40_log_lli_lcpa_write()
to preserve the I/O address space from the mapping to the register
accessors. This also fixes the existing LCPA read and write warnings
without changing the generated code.

Fixes: c80edceff29e ("dmaengine: ste_dma40: Fix cyclic transfer residue")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610090216.pjMRxhRL-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c    | 4 ++--
 drivers/dma/ste_dma40_ll.c | 8 ++++----
 drivers/dma/ste_dma40_ll.h | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index d3cc2c512ccf..74dd4cbdc3c0 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -509,7 +509,7 @@ struct d40_chan {
 	u32				 src_def_cfg;
 	u32				 dst_def_cfg;
 	struct d40_def_lcsp		 log_def;
-	struct d40_log_lli_full		*lcpa;
+	struct d40_log_lli_full __iomem	*lcpa;
 	/* Runtime reconfiguration */
 	dma_addr_t			runtime_addr;
 	enum dma_transfer_direction	runtime_direction;
@@ -617,7 +617,7 @@ struct d40_base {
 	/* Physical half channels */
 	struct d40_phy_res		 *phy_res;
 	struct d40_lcla_pool		  lcla_pool;
-	void				 *lcpa_base;
+	void __iomem			 *lcpa_base;
 	dma_addr_t			  phy_lcpa;
 	resource_size_t			  lcpa_size;
 	struct kmem_cache		 *desc_slab;
diff --git a/drivers/dma/ste_dma40_ll.c b/drivers/dma/ste_dma40_ll.c
index 4c489b126cb2..3be7f5b1abb0 100644
--- a/drivers/dma/ste_dma40_ll.c
+++ b/drivers/dma/ste_dma40_ll.c
@@ -333,10 +333,10 @@ static void d40_log_lli_link(struct d40_log_lli *lli_dst,
 		(dlos << D40_MEM_LCSP1_SLOS_POS);
 }
 
-void d40_log_lli_lcpa_write(struct d40_log_lli_full *lcpa,
-			   struct d40_log_lli *lli_dst,
-			   struct d40_log_lli *lli_src,
-			   int next, unsigned int flags)
+void d40_log_lli_lcpa_write(struct d40_log_lli_full __iomem *lcpa,
+			    struct d40_log_lli *lli_dst,
+			    struct d40_log_lli *lli_src,
+			    int next, unsigned int flags)
 {
 	d40_log_lli_link(lli_dst, lli_src, next, flags);
 
diff --git a/drivers/dma/ste_dma40_ll.h b/drivers/dma/ste_dma40_ll.h
index 55090cb31057..ca9d07649361 100644
--- a/drivers/dma/ste_dma40_ll.h
+++ b/drivers/dma/ste_dma40_ll.h
@@ -455,7 +455,7 @@ int d40_log_sg_to_lli(struct scatterlist *sg,
 		      u32 lcsp13, /* src or dst*/
 		      u32 data_width1, u32 data_width2);
 
-void d40_log_lli_lcpa_write(struct d40_log_lli_full *lcpa,
+void d40_log_lli_lcpa_write(struct d40_log_lli_full __iomem *lcpa,
 			    struct d40_log_lli *lli_dst,
 			    struct d40_log_lli *lli_src,
 			    int next, unsigned int flags);

---
base-commit: 511afae96d89847f753fcab6b3a597f0281be9d5
change-id: 20261010-dma40-smatch-fix-42fce06d4f25

Best regards,
-- 
Linus Walleij <linusw@kernel.org>



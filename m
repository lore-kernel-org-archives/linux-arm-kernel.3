Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69679D1118E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 19:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K2N0tDeGrz7QCmhPIrTtZDVUgTHAHsRgEUCvSiXLL6E=; b=gz7fsDLZeZggAaIFxxgUKeLiWJ
	nagy/znk1hT0gsSwyWo1b/a+U2/mdzLweRoZrk36Ini7W3rRjYpo4R+Wy2boZou78eHsi5w3ET735
	GOn9N2fx+3Y9Vs1d4+5KbzZP2fjNrx7Ntau7p6g2eGxRkd3CDPSNcyOe7eUj949hLfAaXhtypfOYw
	POUaHOsu4OJrcoq4jTPxfs2uBQN8O8x1vNPfjXQxS3sBfQW97vXnF7FQmSJBStHILdqu4oQ7TMqFr
	fX1PphFE3gYr/WymkTGEi+/iV0DTO8k9zsp3arQH/hAS+dT014I6iXSKf9se7t/a0HjqL6rtPS7x7
	C/mb9gqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7gDu-0000000BvIY-3oVb;
	Sun, 03 Nov 2024 19:25:18 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7gC8-0000000Bv3e-08pX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 19:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=K2N0tDeGrz7QCmhPIrTtZDVUgTHAHsRgEUCvSiXLL6E=; b=B1smspZuOYOQR+09
	Dol6frTZVigXzMffVPXGLhvEFqEkZ5g+NPVIVPyYqwcwLpoN5S62+kVO6RC8aN5l5INXps7CW68Ls
	LTuz2wB4f1uDleO/QH7Wne/7u2z7bMdo6LxK8TXLHOYHj0MreDMlwHBIqnTKVaxtmAUBSOU6R9vMr
	DdcoXUFCN4BwV/HwtL8PElHMwya00e9tOY76xEzJGXVVJym015wYWg+FaqfBtzAIpyqaMU3ShVNf7
	kxtsX9xmggmkWgvn048GwBRBdeMEcH0Jj6kL9Refyybnftp0V3T2/OeGqjCAx7lfKiXqvEVwtGZYv
	636O0oUm8RxrOlz3Mg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1t7gBy-00FC9O-0T;
	Sun, 03 Nov 2024 19:23:18 +0000
From: linux@treblig.org
To: andrzejtp2010@gmail.com,
	jacek.anaszewski@gmail.com,
	s.nawrocki@samsung.com,
	mchehab@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: platform: samsung: s5p-jpeg: Remove deadcode
Date: Sun,  3 Nov 2024 19:23:15 +0000
Message-ID: <20241103192315.288743-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_112328_077428_C91B3F71 
X-CRM114-Status: UNSURE (   8.82  )
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

exynos3250_jpeg_operating() has been unused since it was added in 2014's
commit 3246fdaa0ac2 ("[media] s5p-jpeg: Add support for Exynos3250 SoC")

exynos4_jpeg_get_fifo_status(), exynos4_jpeg_get_frame_size(), and
exynos4_jpeg_set_timer_count() have been unused since they were added by
commit 80529ae5c137 ("[media] s5p-jpeg:  JPEG codec")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../samsung/s5p-jpeg/jpeg-hw-exynos3250.c     |  5 -----
 .../samsung/s5p-jpeg/jpeg-hw-exynos3250.h     |  1 -
 .../samsung/s5p-jpeg/jpeg-hw-exynos4.c        | 19 -------------------
 .../samsung/s5p-jpeg/jpeg-hw-exynos4.h        |  4 ----
 4 files changed, 29 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c
index 637a5104d948..6657d294c10a 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c
@@ -427,11 +427,6 @@ void exynos3250_jpeg_clear_int_status(void __iomem *regs,
 	writel(value, regs + EXYNOS3250_JPGINTST);
 }
 
-unsigned int exynos3250_jpeg_operating(void __iomem *regs)
-{
-	return readl(regs + S5P_JPGOPR) & EXYNOS3250_JPGOPR_MASK;
-}
-
 unsigned int exynos3250_jpeg_compressed_size(void __iomem *regs)
 {
 	return readl(regs + EXYNOS3250_JPGCNT) & EXYNOS3250_JPGCNT_MASK;
diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h
index 15af928fad76..709c61ae322c 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h
@@ -45,7 +45,6 @@ void exynos3250_jpeg_rstart(void __iomem *regs);
 unsigned int exynos3250_jpeg_get_int_status(void __iomem *regs);
 void exynos3250_jpeg_clear_int_status(void __iomem *regs,
 						unsigned int value);
-unsigned int exynos3250_jpeg_operating(void __iomem *regs);
 unsigned int exynos3250_jpeg_compressed_size(void __iomem *regs);
 void exynos3250_jpeg_dec_stream_size(void __iomem *regs, unsigned int size);
 void exynos3250_jpeg_dec_scaling_ratio(void __iomem *regs, unsigned int sratio);
diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c
index 0828cfa783fe..479288fc8c77 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c
@@ -185,11 +185,6 @@ unsigned int exynos4_jpeg_get_int_status(void __iomem *base)
 	return readl(base + EXYNOS4_INT_STATUS_REG);
 }
 
-unsigned int exynos4_jpeg_get_fifo_status(void __iomem *base)
-{
-	return readl(base + EXYNOS4_FIFO_STATUS_REG);
-}
-
 void exynos4_jpeg_set_huf_table_enable(void __iomem *base, int value)
 {
 	unsigned int	reg;
@@ -300,22 +295,8 @@ void exynos4_jpeg_set_dec_bitstream_size(void __iomem *base, unsigned int size)
 	writel(size, base + EXYNOS4_BITSTREAM_SIZE_REG);
 }
 
-void exynos4_jpeg_get_frame_size(void __iomem *base,
-			unsigned int *width, unsigned int *height)
-{
-	*width = (readl(base + EXYNOS4_DECODE_XY_SIZE_REG) &
-				EXYNOS4_DECODED_SIZE_MASK);
-	*height = (readl(base + EXYNOS4_DECODE_XY_SIZE_REG) >> 16) &
-				EXYNOS4_DECODED_SIZE_MASK;
-}
-
 unsigned int exynos4_jpeg_get_frame_fmt(void __iomem *base)
 {
 	return readl(base + EXYNOS4_DECODE_IMG_FMT_REG) &
 				EXYNOS4_JPEG_DECODED_IMG_FMT_MASK;
 }
-
-void exynos4_jpeg_set_timer_count(void __iomem *base, unsigned int size)
-{
-	writel(size, base + EXYNOS4_INT_TIMER_COUNT_REG);
-}
diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h
index 3e2887526960..b941cc89e4ba 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h
@@ -35,10 +35,6 @@ void exynos4_jpeg_select_dec_h_tbl(void __iomem *base, char c, char x);
 void exynos4_jpeg_set_encode_hoff_cnt(void __iomem *base, unsigned int fmt);
 void exynos4_jpeg_set_dec_bitstream_size(void __iomem *base, unsigned int size);
 unsigned int exynos4_jpeg_get_stream_size(void __iomem *base);
-void exynos4_jpeg_get_frame_size(void __iomem *base,
-			unsigned int *width, unsigned int *height);
 unsigned int exynos4_jpeg_get_frame_fmt(void __iomem *base);
-unsigned int exynos4_jpeg_get_fifo_status(void __iomem *base);
-void exynos4_jpeg_set_timer_count(void __iomem *base, unsigned int size);
 
 #endif /* JPEG_HW_EXYNOS4_H_ */
-- 
2.47.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1790C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kLzy/P7iaMHDyU2RTvFBICZbCqw+7JdGE4URD73Sj1U=; b=P01MFZroaRqvh9HS6nW36H+RxB
	v8XQZBgzMB/VpAYhE5iSAykmVzIbkkmqWsf5t3MrRp9ZsPseGlSwxaUYETo5pn9QnKORw0Wl8Of9E
	tjORIcq8mqq42rYf7PqLJG8Vx878DsbsBirutcBdR4FHwMoQNWHUHmgKEPabjMyFNvKogyEuvUcU+
	efA+qw08hkyjaOCRyPG7W/eK/JbNKzrIk3g4L8fEeRbs4lQNRAGW/RkQKJEF8KjSXKfIwkSWfZYCd
	TsRYxpq4kFpcnAYyxWww/eNeEtlr6eNj+ZHX7+vO6BVbd/kpC9PdbCl+zUcPxMCxhDVVLHvUQPrdl
	h8oTJqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SvR-000000061jv-05uX;
	Mon, 07 Sep 2026 06:33:53 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SvO-000000061jA-3CaW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:33:51 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2885485a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762829; x=1789367629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLzy/P7iaMHDyU2RTvFBICZbCqw+7JdGE4URD73Sj1U=;
        b=NmcCahc22Q/FUb9qOZo1+s89FlXtkLXEvV2+p8W4o0rR51l/NSwJollJ2mTU0SVl/i
         xAumN0l4UbRAAluUoSgNyHiacmS526fq6xkkPbzeVr+TN+gNPMLVaE9CeCjBqCPmw+NR
         XZUgXnh6vAwih6asHE6irOTZBdcgr0nbCy8PYvq3fHzIXpmzP7PxsknzQzFCDDA6w/TS
         pX8c6ht9q7o7Ts+rsk/dQ81UwoAxze9zBFat4USZbocrtMRAsyE60PzQBwtWRlSBmdyO
         miOSbRmfpXc28CmuPbvxQ4wiWo/8mrVLdvDSXhvE910oIC+S6Cqe0r85cWEDCzsUn8fV
         PVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762829; x=1789367629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLzy/P7iaMHDyU2RTvFBICZbCqw+7JdGE4URD73Sj1U=;
        b=N6zUfe3c1gNZHJ729d9TS431Ur57bPZoJtl6GCWIEMq2jgJki0byQQym39tZBbQmqy
         i8SqYM28e5qHt/dzpRZvlWBXMZfsgpC9eO0LM8S5AGN0owxQbXa5pKo+l3Y78Qv/egEP
         xFy/329KycRl3EMjbHykQx/HPpcTsKLUO3Rz8oRh0HGyG0o2i2ryTeURyMWTjmaISZrT
         DXGiphQbIXoKQ79L80RuOwrAxRFOghhXXs0gBQXv/DQmFwxzIJSW7FDTsrG6zPlxjVsb
         b1FmkZJB4o9taTJZYaeLwn2S1qHUAA9CUbHhC2sTMk3QrxjmbtmciXS4KmW/xMgbmsJI
         MUsA==
X-Forwarded-Encrypted: i=1; AKwUvBx0O8C+aNV1igB9D+A6HKCND1XxY1knLN9Z4SO/N0oNGM3O+IHAIWkcQnqxc22znSNkxH1V89C8ppNTTtGbBC7c@lists.infradead.org
X-Gm-Message-State: AFuF++m9JRbVfQBcwaYlEPsI/gS6ytCm8VVIlQKYA8LSBt9NUFTsJvdh
	wTbKJ6affOBpHlUm2TwPn025R3Wdd4B+2qiONpym6Ir2oPD9XfUc/jP0
X-Gm-Gg: AYBFou3W0/V1eJfW5yB+NgI980jZM3tNTNeStAfxISpXswcGVqX/ZAIN7nVHXGhPJqF
	A6UCtInnxUr9M8pBDqWqyyNZj+f9YaR6zja/VWr98XJLFmACk6XzekcnBAz25xEzpuddKroYmyK
	LmzwtQpw5J7Pdbm/bqj9nFYsasU96ZWnSR8hjWFpSRzGt4DdGlv/RtB3w9XCqjcLAxuKXWqCtrz
	vPV14g98A9KMdrC0QcbQUtz0t39WeiofO5124OkWNGFVnXg6e+mo5oa8ywtk3gx6oCQIqMrkp7E
	xhO8upo0UB6ulBbTsPHFI2vrDUZKvoYL43+3S5gROthGKIC0y1aCPQk81Eb8OuRmu4WQNbKEkS0
	d8E1CmRlAfZhGdFDS7J0J99iqImXS5swGCXkBqGmGHePsBtzQ9dfuT+iEyoUO8wxk5EfxIAMfdu
	CYHzHkwL8sKZ1c/FHXTVgiZ+DQS7ufkxuQoZ/D30lp8188ZhKdErJ95Mdp994kqQKr8ANhskhZ1
	uUfLHv1Mhap1w==
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr33408081a91.0.1788762828715;
        Sun, 06 Sep 2026 23:33:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm17093204c88.8.2026.09.06.23.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:33:48 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dmaengine: fix typos in comments
Date: Mon,  7 Sep 2026 12:03:43 +0530
Message-ID: <20260907063343.22255-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_233350_834054_511216D5 
X-CRM114-Status: GOOD (  15.56  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/dma/bcm-sba-raid.c        | 8 ++++----
 drivers/dma/ppc4xx/xor.h          | 2 +-
 drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
index 0de03611252e..485fcde390dd 100644
--- a/drivers/dma/bcm-sba-raid.c
+++ b/drivers/dma/bcm-sba-raid.c
@@ -734,7 +734,7 @@ sba_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst, dma_addr_t src,
 	struct sba_device *sba = to_sba_device(dchan);
 	struct sba_request *first = NULL, *req;
 
-	/* Create chained requests where each request is upto hw_buf_size */
+	/* Create chained requests where each request is up to hw_buf_size */
 	while (len) {
 		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
 
@@ -877,7 +877,7 @@ sba_prep_dma_xor(struct dma_chan *dchan, dma_addr_t dst, dma_addr_t *src,
 	if (unlikely(src_cnt > sba->max_xor_srcs))
 		return NULL;
 
-	/* Create chained requests where each request is upto hw_buf_size */
+	/* Create chained requests where each request is up to hw_buf_size */
 	while (len) {
 		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
 
@@ -1356,7 +1356,7 @@ sba_prep_dma_pq(struct dma_chan *dchan, dma_addr_t *dst, dma_addr_t *src,
 	if (!(flags & DMA_PREP_PQ_DISABLE_Q))
 		dst_q = &dst[1];
 
-	/* Create chained requests where each request is upto hw_buf_size */
+	/* Create chained requests where each request is up to hw_buf_size */
 	while (len) {
 		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
 
@@ -1626,7 +1626,7 @@ static int sba_probe(struct platform_device *pdev)
 	sba->dev = &pdev->dev;
 	platform_set_drvdata(pdev, sba);
 
-	/* Number of mailbox channels should be atleast 1 */
+	/* Number of mailbox channels should be at least 1 */
 	ret = of_count_phandle_with_args(pdev->dev.of_node,
 					 "mboxes", "#mbox-cells");
 	if (ret <= 0)
diff --git a/drivers/dma/ppc4xx/xor.h b/drivers/dma/ppc4xx/xor.h
index da1230df2817..0931e18cd0d3 100644
--- a/drivers/dma/ppc4xx/xor.h
+++ b/drivers/dma/ppc4xx/xor.h
@@ -12,7 +12,7 @@
 
 #include <linux/types.h>
 
-/* Number of XOR engines available on the contoller */
+/* Number of XOR engines available on the controller */
 #define XOR_ENGINES_NUM		1
 
 /* Number of operands supported in the h/w */
diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4531..bcc188e70441 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -1032,7 +1032,7 @@ static int xilinx_dpdma_chan_wait_no_ostand(struct xilinx_dpdma_chan *chan)
 {
 	int ret;
 
-	/* Wait for a no outstanding transaction interrupt upto 50msec */
+	/* Wait for a no outstanding transaction interrupt up to 50msec */
 	ret = wait_event_interruptible_timeout(chan->wait_to_stop,
 					       !xilinx_dpdma_chan_ostand(chan),
 					       msecs_to_jiffies(50));
-- 
2.48.1



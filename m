Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10D3CA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 19:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vw763NV5BjSaZVhghdUwJpS8A2L5IAuXgkLi18vef04=; b=Tb2m45NMegU5Wv5JoFT6JK6HsG
	kuw0OZDP+mQQcm/pGT9SqB8AjWBDyOyTDxuOFDc0vmNtxti73iTLa1bTGR4zIbqb1Ju/3cZZ1Hkj5
	vUWp/SHB75Q8WUZ80hoqhOu+gVurGzXx/CuvXJ3IEpHrOWen5CTTRyRKZUvvK3rRjMZ44MqhO7DSr
	kClA/dUZyGALY2G6LL1Ct/PjvpjLcNs0qs40gYIIC1+yOrQLVNe/YjMs3yHwdPakDXyx75IZ/dnkg
	hsXid7yKH58WJMr71n2C9sg18E3HA10CNZXXPqteW0t/g32nCyGqlGTq1pKLB1bMP+D6bKo+szPjA
	eViDDP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDoKT-0000000H3V5-2XBg;
	Mon, 05 Oct 2026 19:26:29 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDoKQ-0000000H3Uc-3JZS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 19:26:28 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a7906f463dso1679378a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 12:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791228385; x=1791833185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vw763NV5BjSaZVhghdUwJpS8A2L5IAuXgkLi18vef04=;
        b=NwZnIrrEnfMyNJOxqtpbQ3e/GyD1blksu63p7BCWjJhPsJYuhLln6QwBK8vFCmVZKO
         DpxxuNRz5Nt9DmhtIy0E6SJgsKf9jsa82ZlkKm4Cwzi8zhqR1kW6e3iGOqDX2eM7awXi
         Kha5Plghnl3NPJfwDhjEuujITLfSdLQ6hyZ2VmWcGQrzIAiysAM8Eikt6G7S2lKIFoPL
         bQVRxZhFAIHLXbuUkTUjWrdhQuKqchR443pR8NND5SHXVqKaIHNAOzs8HWuX8pfiZLu1
         im9rqso+p5eIp5cpb4IRmEV0SymeajljxuZRnfy8u0p/7xk/cDtoDilRM40qlHF6zTH9
         sGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791228385; x=1791833185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vw763NV5BjSaZVhghdUwJpS8A2L5IAuXgkLi18vef04=;
        b=EQUg83zg8zWj5FtE9kMlHADK0ScCONSCPKKjUVgy55n+0ZZgSkPEfYqS7ExHTZxe/B
         njKVCLNSfpPJtfv72pdK/MfWugGL200AXip8tLFWbun7VWWvCri3aZYFMBGxH5n328qs
         KQ12ksi02tmEnBQCLeEvTfoYkyCr6s7ot8wJyo4zuPQ7Imi7xyHqEKlNq7eVoeqlSRsL
         l2f198L54HhQJ1GUkbI8i6p7Vlg6wcNR8QrM2kODe61phvhCmhnsoKnJAY1O2vIqYuFR
         L6vQzB8G9q1BkCW7DiF98kUe+TfwV3u3jNJ4mQ2aE3zP9xa3yLCCciuI8WFBUX367Mnx
         DMPA==
X-Forwarded-Encrypted: i=1; AKwUvBwIeHiYwE7KfqdhVS5WvsbY+KP7NCkyf9PaBxPYwF2paQfX6S/zzcY3ZwfoHFu5LFIExRcSRY9Q8uZUMTbHk1qz@lists.infradead.org
X-Gm-Message-State: AFq9FYL36/uRtI/4F+yEm0YcrSfFdbKEu9doDqtkn0cOh0jST3NujtW2
	cxURKjjkLoIUZVSHxLpVpV6kjoMFQjbDa7mJLyIBglz+uXq0f+N+5td2
X-Gm-Gg: AYBFou1vYXtAaE64GHbZh/t2qECBybbBX+cs9exRlcxN93IK8M/rr4+KTOKdEUc0h5y
	nbH+CifkJC5LbL5ZZKB4+0/3sh+fgipOTjGvmzEXYslvF8Br0oAsQ4tBzpJOc/25bx4pItspOI9
	LS32aFpKPdkm7ojvj1P5Pbw8/lWYeHBkKKvPmE/PSw46ZKjcK+IrLjLTp5B3UxvG5Do7IV7Xpqs
	qws04RgeybU793dNwnUPTkd9XZ4pU2QXEIEqSx3tMZfDrCtfn+EF8iWWsOP+t9vrLZ+FDJhyUkf
	lyUBTA25PlvXZu++hDnIjnu1YL1/LJL9pwgdv7Ij1dce0x2Huqui03dxan1SnQ9bEP7IuuZv5+k
	K99EaDnQqlV8a5kKoaNQ6RlWWtfKKTgacH31aR9B2+3xS9IlVtQX2SfbtD1ETsO6e/mqysHO/0T
	hrRw6BBpsQu+NFwYlIwYK+wzpLLpnoeAJI6ETpvgjROj44I+BDNLdZGRiVo4UzxQwBNyetKI5Vc
	2mGC2dBu5vrblGgAWyoaU25abgfPVuw9eWB1s9xCJ+Msfh6l355niPj25YzBGSVF32Mk1IHojQS
	+WJ/L7F6Op+V5efN0kcL3R2Xc9Z//0tnau+QEypC/HPqp61jmpW7nBNnaHA=
X-Received: by 2002:a17:90b:498e:b0:3a7:9ad9:68e1 with SMTP id 98e67ed59e1d1-3a79ad96bd7mr6814909a91.13.1791228385236;
        Mon, 05 Oct 2026 12:26:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853b92679sm850955a91.6.2026.10.05.12.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 12:26:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH v2] dmaengine: xilinx: xdma: use kzalloc_flex()
Date: Mon,  5 Oct 2026 12:26:21 -0700
Message-ID: <20261005192621.99880-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_122626_839033_D3068970 
X-CRM114-Status: GOOD (  13.16  )
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

Change desc_blocks to a flexible array member so the descriptor and
its block array are allocated together, removing one allocation and
its error handling.

Add __counted_by for extra runtime analysis, and set dblk_num right
after allocation which is already done by kzalloc_flex() for GCC >= 15.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/xilinx/xdma.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index 8d4a5d14e8db..16d202722245 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -81,7 +81,6 @@ struct xdma_chan {
  * @vdesc: Virtual DMA descriptor
  * @chan: DMA channel pointer
  * @dir: Transferring direction of the request
- * @desc_blocks: Hardware descriptor blocks
  * @dblk_num: Number of hardware descriptor blocks
  * @desc_num: Number of hardware descriptors
  * @completed_desc_num: Completed hardware descriptors
@@ -91,12 +90,12 @@ struct xdma_chan {
  * @period_size: Size of a period in bytes in cyclic transfers
  * @frames_left: Number of frames left in interleaved DMA transfer
  * @error: tx error flag
+ * @desc_blocks: Hardware descriptor blocks
  */
 struct xdma_desc {
 	struct virt_dma_desc		vdesc;
 	struct xdma_chan		*chan;
 	enum dma_transfer_direction	dir;
-	struct xdma_desc_block		*desc_blocks;
 	u32				dblk_num;
 	u32				desc_num;
 	u32				completed_desc_num;
@@ -106,6 +105,7 @@ struct xdma_desc {
 	u32				period_size;
 	u32				frames_left;
 	bool				error;
+	struct xdma_desc_block		desc_blocks[] __counted_by(dblk_num);
 };
 
 #define XDMA_DEV_STATUS_REG_DMA		BIT(0)
@@ -255,7 +255,6 @@ static void xdma_free_desc(struct virt_dma_desc *vdesc)
 			      sw_desc->desc_blocks[i].virt_addr,
 			      sw_desc->desc_blocks[i].dma_addr);
 	}
-	kfree(sw_desc->desc_blocks);
 	kfree(sw_desc);
 }
 
@@ -276,26 +275,22 @@ xdma_alloc_desc(struct xdma_chan *chan, u32 desc_num, bool cyclic)
 	void *addr;
 	int i, j;
 
-	sw_desc = kzalloc_obj(*sw_desc, GFP_NOWAIT);
+	dblk_num = DIV_ROUND_UP(desc_num, XDMA_DESC_ADJACENT);
+	sw_desc = kzalloc_flex(*sw_desc, desc_blocks, dblk_num, GFP_NOWAIT);
 	if (!sw_desc)
 		return NULL;
 
+	sw_desc->dblk_num = dblk_num;
 	sw_desc->chan = chan;
 	sw_desc->desc_num = desc_num;
 	sw_desc->cyclic = cyclic;
 	sw_desc->error = false;
-	dblk_num = DIV_ROUND_UP(desc_num, XDMA_DESC_ADJACENT);
-	sw_desc->desc_blocks = kzalloc_objs(*sw_desc->desc_blocks, dblk_num,
-					    GFP_NOWAIT);
-	if (!sw_desc->desc_blocks)
-		goto failed;
 
 	if (cyclic)
 		control = XDMA_DESC_CONTROL_CYCLIC;
 	else
 		control = XDMA_DESC_CONTROL(1, 0);
 
-	sw_desc->dblk_num = dblk_num;
 	for (i = 0; i < sw_desc->dblk_num; i++) {
 		addr = dma_pool_alloc(chan->desc_pool, GFP_NOWAIT, &dma_addr);
 		if (!addr)
-- 
2.56.0



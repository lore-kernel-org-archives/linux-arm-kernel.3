Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FAEEA8546
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 22:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ftcpbjh6p3nPyd9FYgD5ANvcMgJCdJh9w2K7lp47ksM=; b=rcHy75MAAsvCgSkhfscbDEgOGA
	QDDs+OESFt4k7VeKnamzlnSB8n9rwf2pH7/O2tiJCErI/5aT5oc2nws+yFSmkCnkX4g239/DYNcKa
	UcYIY3C4YEO2vlBQ1SrFuSnfeEpR4Oy+Ux/+E+TRGycW4JUpRgoKMat4bSb/W7Lqs4c9XOnvkbbu5
	oX8r0AuzLlhuTQTo3yjMCibhO28PMgH+gIKH1W/HyjfGrk0vz17y1cd2P2M0fmS9ROhKpdtdr9tRx
	+VU3ixngyyDIpaSpyVppT4iylZeprqKCKftnkisSHZE2I51rBW/fz6ICfWgnKHQGUkc5N3r5s4/IQ
	3VQbumpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzMHv-00000006OP0-0QNI;
	Sun, 08 Mar 2026 22:07:51 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzMHr-00000006OOe-1obF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 22:07:49 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-798374d0f44so156862987b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 15:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773007666; x=1773612466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ftcpbjh6p3nPyd9FYgD5ANvcMgJCdJh9w2K7lp47ksM=;
        b=VFGalU2PtnP6FSuhfFYrHLHIgjGqzR82NdWELmV8JI2BhOX6LAZPCdvA5FbJ16+yUY
         xrjcm9+ZMVM0mhkjMCSR+XH1WxxdZC3INv0oIQeUuJXYXQBcRyh6sm6ToAADUZUuxW2F
         XDLwhG2N8HHBe6HzzIjv13CDQtH+3b0pDlx8KNl67FEvHkNsYxyvkrHh31l6/OaYWq+I
         Z1W2vttsK1doKfjGf56sSlh5OHBPo9Jq1KmfcTkdF2O3AxPUFlk0L9ODVj7v4sAkoNu/
         h+fVWBkdJBgcB5JmiMaN017WUbMkEvDZjA2pFUmZ7IheGuLn20OGARYfA8Q603NGM5e6
         fWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773007666; x=1773612466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ftcpbjh6p3nPyd9FYgD5ANvcMgJCdJh9w2K7lp47ksM=;
        b=cr/TGbITd6m0IDKaquczu4wGGyTALUcbK7UGPwML2SVulKMEYMQ+A88IlmsH2YQZpg
         t0tQ+EB+gzYinZeWADKS4t3elgZ9/VpsW0EzDmfzEeHblTgRSLr5wIvUMjl8mkG6UfoL
         vP2fiDgDLgILls5TaAV3TO9WybejjyHEae91fk7Ec5TOxy/pAxsUmmu6p2uMeARYemvN
         Q9EdV7IrxHSX/SLn86SQGrGE7p1xQwBErVEA71gRBF8IeOO3wwwDE0ewGtsxT4gPhwFd
         mASFCv5073+sMBxXx495nBvL7JmN8Qe3Q1orbDcZ+0nm1wRyv2mzh0wMEN0m3tD7oYEc
         8Gog==
X-Forwarded-Encrypted: i=1; AJvYcCUJnv2NgMcpT2rhvENDQv0GtVnOtwDTkP1g/zikjGrVivZYttdkSBgqkqKR+pWly78mNMwSXHrSEUuAISy5Pp7y@lists.infradead.org
X-Gm-Message-State: AOJu0YyP8tbHckIhzjIYj1cSijPVXg+Zu7SDoCdUEFT7l2L1RNTNBUgq
	EGMsVcbd3mLKBtd5aOlykXVhq+eCr4fdkZkKgjFOjl6ai2OdBkLtb86W
X-Gm-Gg: ATEYQzwxwvq9fe5QBjbwvFm1Us3p0bCBfyGhxriGpPqztScXRiYHcuMHfgXJbj/GUVH
	q+vyHodDN5KUTKTmLvQYZCug70oeU8Dksx36JhYPq9ZL4gWQ+MYc64Vc5eTla4SFR6xmLoB28F4
	yrI94LCe1G5hhlSNEvWYvl/IQ7ami0afJX4Q7dhANG1zaGIfrwhtzkEIJbjg7+40LjxtlKWz1l4
	GFp42OovKaPIeK5ntW8aI9/j9MFNOcPj3S4koAzvAGKnsUxxszd3D0y3zeRFa6mqE/QugjjSpzq
	Zzwx887M/jB6tJuJXCbJxEK7JZjg7fBwKF4J3TJtJyV37lod+ANkdU4BndNMlXduhwKvWsxJI7d
	c1mql1wg6vlHjKTnDV7mqPkKT9/NET6DX0zz/wrleoL2TGC5i3xbxGMb/y4owx1fMB169w1cdUB
	UAPP7SstGH33haMzxhX2SaiVpq9PjeaWYb43oFvbAKawJj4/E9ExLV7A==
X-Received: by 2002:a05:690c:ed3:b0:796:3f8a:9607 with SMTP id 00721157ae682-798d1f07dbfmr126573077b3.30.1773007665815;
        Sun, 08 Mar 2026 15:07:45 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dee8ac51sm36771577b3.49.2026.03.08.15.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 15:07:45 -0700 (PDT)
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
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] maengine: xilinx: use kzalloc_flex
Date: Sun,  8 Mar 2026 15:07:26 -0700
Message-ID: <20260308220726.45270-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_150747_886322_E1D891B5 
X-CRM114-Status: GOOD (  13.86  )
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

Changing descs to a flexible array member allows one fewer allocation.

Aadded __counted_by for extra runtime analysis.

Changed error path to a simple kfree. descs in all paths are not
allocated. No reason to call xdma_free_desc. A single kfree is enough.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/xilinx/xdma.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index d02a4dac2291..14fbc7200a6d 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -80,7 +80,6 @@ struct xdma_chan {
  * @vdesc: Virtual DMA descriptor
  * @chan: DMA channel pointer
  * @dir: Transferring direction of the request
- * @desc_blocks: Hardware descriptor blocks
  * @dblk_num: Number of hardware descriptor blocks
  * @desc_num: Number of hardware descriptors
  * @completed_desc_num: Completed hardware descriptors
@@ -90,12 +89,12 @@ struct xdma_chan {
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
@@ -105,6 +104,7 @@ struct xdma_desc {
 	u32				period_size;
 	u32				frames_left;
 	bool				error;
+	struct xdma_desc_block		desc_blocks[] __counted_by(dblk_num);
 };
 
 #define XDMA_DEV_STATUS_REG_DMA		BIT(0)
@@ -254,7 +254,6 @@ static void xdma_free_desc(struct virt_dma_desc *vdesc)
 			      sw_desc->desc_blocks[i].virt_addr,
 			      sw_desc->desc_blocks[i].dma_addr);
 	}
-	kfree(sw_desc->desc_blocks);
 	kfree(sw_desc);
 }
 
@@ -275,26 +274,22 @@ xdma_alloc_desc(struct xdma_chan *chan, u32 desc_num, bool cyclic)
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
@@ -314,7 +309,7 @@ xdma_alloc_desc(struct xdma_chan *chan, u32 desc_num, bool cyclic)
 	return sw_desc;
 
 failed:
-	xdma_free_desc(&sw_desc->vdesc);
+	kfree(desc);
 	return NULL;
 }
 
-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BFEC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ESTD8fjQr67xhujYSv9nCY2fZpeH0iTV4/0hUbjiKHU=; b=xkFaTf+fX+UsqDRZgQNV1LhPDH
	5cJhxjRYLmUn319upyt7ALdPvNS5grZzAu4hUtkZTFHuwkFUxisEE47C8tLvNU6MRizGjXxaXpAbl
	B7BKZ1y7afGjEDKS3ZAokizekEg8G5VpGeb+pUwvsy4tf91n5xcd3sXDWQpfwdol+zDj23cHh/9yV
	wlbyfl+bP25imMJaOZGuGn1Vqg+k79GfzH+Uvd6JuL1k7eqm9z8cn4nXnVywDgIdNHHJyA2TcwTns
	h6J98f8Od1T9a03vE+uvUNneBRMOTnxa+NDl6OcyTLb/FzK/byRvRMbV0nLrkK7PpH1+a5RqJDDe2
	S+3fDZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOsB-0000000HLXB-1NEr;
	Fri, 24 Jul 2026 23:00:07 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOs8-0000000HLWq-2GhB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 23:00:05 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-448b89f700fso749607fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 16:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784934003; x=1785538803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ESTD8fjQr67xhujYSv9nCY2fZpeH0iTV4/0hUbjiKHU=;
        b=DXapfLbYhQiNmHpTRDGltdeBCWd6flBfzRVcI1LoXvTiAVV1ZdZPgEeyk3jGBoDF42
         Rxy2/3xGnQMnAlor99X7LUo/GgOTg6TuJq6FxSyM+Dy+9aPQD3OQKkQGA0C7YlRg3SVP
         3FDDb3YeZS8dT5WQZaLwR/e9JkP7cCl+LM+j/0bkRSFdDUHH49jyflLCdSzuuSnkC074
         +t04aV2z9s7wuDcTvA7Qa+l1F8TNvcSo/5ozuDxrMkFhcZPOA8aCCG2g2aLZ+7D2pjmm
         tfLlhQYEQ28pqo7b6JgvzZGRQJz0+Z2imd1cHRnUuur2wFhASRDSIK8Zrx+Sfd2G7Eor
         KvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784934003; x=1785538803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESTD8fjQr67xhujYSv9nCY2fZpeH0iTV4/0hUbjiKHU=;
        b=kjklTieCD1CXo+VXAAx+4xW8OO6Tj9oYbu7fhD6MhysKx2zGSbZ6VqUtINE4L8hAiL
         DILDUHwzSKeih6g3s50fbEDo0nQUma0O21pVrR8ecj/AvPjVlcraUtlhEukL36iC18je
         3z4skRDVR8Vctj/zQXVsGFQVcdpuvD1gMKYqXgIfzJRNyqidiukfrQK7vW+wH8JtXh/O
         oIUAYSVNw+9tVLmv2O2x0hKRhu/MMSTCeiVdAxpfEso9D6CE4Xenv4YZIK3oFAb0IB7I
         us6E3KXbQseH8AsmqKbP5wTot/aZJgsInY13nCCSk7lXgrSqaYWbN2Wc2roQ1GOi9opm
         rULQ==
X-Forwarded-Encrypted: i=1; AHgh+RoiLWBTXk75ZCg8B7cklQH5cTzJT+1lfoxQCMoq+yW013O0tQiFw2BQ9g+aFgjrmu4X4Tj6wAJS95v7aR6xqEet@lists.infradead.org
X-Gm-Message-State: AOJu0YzAn/zu80zQO1/fGaO93ay9uEwqDdTOt8CYuHCFy1BLXReP+TcN
	Xl4TfttmOLhi4l9iy8v173mGCnbn7iBY+7itzyzphMht9d2WcrUA68wh
X-Gm-Gg: AR+sD10DNsCDz3bSb51zagkkzljsfPZq3KmU5tNgHLAYOX/cRUqmT68wqunT4yjZpql
	FeTV/Ve63y9RdPDIg1T4GHSrNVOkv5+h1A267jucHAcHl6QgCkekg/zwIP2S6S/oQkUBlj0a2ve
	ympkg5U+Voqtk8akdj4JCt6H55Mpo0/EW/Xuu+ulh1DTnzJ7wywYSPPE3J/hbIHMh3XzOquv3Zd
	7LpBCDZoRJ4hcw5BIg7+od2lSSkj6yk/2VsEwrZgPFjVOu9JS1LyUmHGYAnF+snZJ3QFEOmBqCg
	jWtYth2e/cAjgsW/HPc0T7zHB9no5EESN4DlEugDSXnmmQpQNBwG2OnjDpw2D64Z1Wa5leBOQfR
	DRK1z3kc/w2Nyz2Wy+T1XxrfACKeZ6gvTRCcZ1CDJR5uHWn9Dn6G2r4K7aFtcQNBqorZXfh5hru
	WOT7HtElj8krIeSbcpPY4W3XPU1XFXtN6cOz4GJWFZ7VFI4LMKMf+G6bTQCb/AdxqQRIdbuHrtR
	iUXCjiIAZCIaD/sR8hIuNazbKe9EUx6+XDTCTzPlSGa2F9SFuxdSLLuYDVGwE2Tfg==
X-Received: by 2002:a05:6871:7817:b0:448:558c:d833 with SMTP id 586e51a60fabf-457f280d0fdmr441239fac.34.1784934003379;
        Fri, 24 Jul 2026 16:00:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-457a07c9427sm5974953fac.9.2026.07.24.16.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 16:00:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Eugen Hristev <ehristev@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: at_hdmac: fix sparse '__iomem' cast warning in memset helpers
Date: Fri, 24 Jul 2026 15:59:58 -0700
Message-ID: <20260724225958.43925-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_160004_612265_C4909551 
X-CRM114-Status: GOOD (  12.77  )
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

Both atc_prep_dma_memset() and atc_prep_dma_memset_sg() declare vaddr
as 'void __iomem *' but assign the return of dma_pool_alloc(), which
returns 'void *' (not iomem memory). This causes sparse to warn about
a cast removing the __iomem address space at the dereference site.

The struct field memset_vaddr is also typed as 'int *', which is
neither the type returned by dma_pool_alloc() nor the type used for
the actual writes.

Fix by declaring vaddr as 'u32 *' in both functions and changing
memset_vaddr in struct at_desc from 'int *' to 'u32 *'. This matches
the actual usage and eliminates the need for the (u32 *) cast.

Fixes: 5d8c5bea0da9 ("dmaengine: at_hdmac: add COMPILE_TEST support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607231110.8MqNRj0Q-lkp@intel.com/
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove extra cast
 drivers/dma/at_hdmac.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index 7b6aa9bbc3c8..f24e64219fb5 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -244,7 +244,7 @@ struct at_desc {
 	/* Memset temporary buffer */
 	bool				memset_buffer;
 	dma_addr_t			memset_paddr;
-	int				*memset_vaddr;
+	u32				*memset_vaddr;
 	struct atdma_sg			sg[] __counted_by(sglen);
 };
 
@@ -1097,7 +1097,7 @@ atc_prep_dma_memset(struct dma_chan *chan, dma_addr_t dest, int value,
 	struct at_dma_chan	*atchan = to_at_dma_chan(chan);
 	struct at_dma		*atdma = to_at_dma(chan->device);
 	struct at_desc		*desc;
-	void __iomem		*vaddr;
+	u32			*vaddr;
 	dma_addr_t		paddr;
 	char			fill_pattern;
 	int			ret;
@@ -1126,10 +1126,10 @@ atc_prep_dma_memset(struct dma_chan *chan, dma_addr_t dest, int value,
 	/* Only the first byte of value is to be used according to dmaengine */
 	fill_pattern = (char)value;
 
-	*(u32*)vaddr = (fill_pattern << 24) |
-		       (fill_pattern << 16) |
-		       (fill_pattern << 8) |
-		       fill_pattern;
+	*vaddr = (fill_pattern << 24) |
+		 (fill_pattern << 16) |
+		 (fill_pattern << 8) |
+		  fill_pattern;
 
 	desc = kzalloc_flex(*desc, sg, 1, GFP_ATOMIC);
 	if (!desc)
@@ -1168,7 +1168,7 @@ atc_prep_dma_memset_sg(struct dma_chan *chan,
 	struct at_dma		*atdma = to_at_dma(chan->device);
 	struct at_desc		*desc;
 	struct scatterlist	*sg;
-	void __iomem		*vaddr;
+	u32			*vaddr;
 	dma_addr_t		paddr;
 	size_t			total_len = 0;
 	int			i;
@@ -1189,7 +1189,7 @@ atc_prep_dma_memset_sg(struct dma_chan *chan,
 			__func__);
 		return NULL;
 	}
-	*(u32*)vaddr = value;
+	*vaddr = value;
 
 	desc = kzalloc_flex(*desc, sg, sg_len, GFP_ATOMIC);
 	if (!desc)
-- 
2.55.0



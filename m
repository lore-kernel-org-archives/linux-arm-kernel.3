Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99A0C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 07:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9fwr70jRROQnhTfVJ4M+ZZqp2+Z1EXWKMCwGS7IUNFQ=; b=feodZnHBBDYH7BRzqvjNGX4UTI
	41wSEXi+48StiinDZ3e+LWSJtfasP2kDGYzvVp40GVEYPStSeBmnBzs33mgcl1PV4AtPgSBfpvu2h
	I5OPPDiL6RV5ozlJl85WWBOSlUjtCD0O4GXVDLhNglZ7RAP//Mh1SxreWrTI27yEud5eKPftBKv4W
	fBGaMDR6GUYc+x/GqYOw8Wbk7I27lwJydnvS3GIklnVbFKJhBS9pDFwZ4jMeTpbKBbGo+TiNehH7G
	ZlXAfv47qGx+2Z6Rpv8ekVg8oeK+4Q2LDDhk9iQNCiOfk+deqa+tCblmk3UsHAtD4T2vGpRBXdiO1
	fQD7S3Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvqe-000000001O6-1yHT;
	Thu, 08 May 2025 07:39:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvoi-0000000017w-1SNo;
	Thu, 08 May 2025 07:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=9fwr70jRROQnhTfVJ4M+ZZqp2+Z1EXWKMCwGS7IUNFQ=; b=QoFXLihGNhv4Pre4Gx7gd9fdph
	0x6QLuSL1b2XMiOwlywQOuvXbjATUv7aMnEal/5m4FHnvmNABTqsIZXLjwCu9Cok9O6FMgDpm0UAF
	zpBhPglKlqwQTNTGXGAKrWZGc180avLQ3TMkzFCqI8csylzc+FEEwaZNowPmp+DVxz/fgK+YBMV/K
	vKj+EMYoahObvMT396unCiP5mUMxHoQm8J2cawrLbc1wlTPCppZgw5qruuFeuKz8uZgmSnoH3v76Y
	/uzvxym2H60lZyN5eRQoicaY9fJPVl+ksxFAqxVpFfAlTDO4KvKe+ofW49W60dqm4xIQtu57GKwcg
	rk8cESqw==;
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCvoP-0000000FzC7-2NQJ;
	Thu, 08 May 2025 07:37:05 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso923816b3a.0;
        Thu, 08 May 2025 00:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746689812; x=1747294612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fwr70jRROQnhTfVJ4M+ZZqp2+Z1EXWKMCwGS7IUNFQ=;
        b=iISenGn+6YBsi1xV72dlQn5ghXCsvhbMV9qMcXtmvWqcbR10AeMTlKyfvSflv2HZLD
         h589X5n1EeE5q7iP2ZbPSoe6SOH+LhWyEPzBsOBc9hfrHP36zJhSsv6E/FNzwiHP7Ap8
         wdy1H3KrJHHVxsbXbcAygr5ld1kBoYOWG4fbtecGA4Al9Y4DtXIkvQJ4J++74wzSQi5w
         yf4m+rEMK5G2y7nWL3hlgQmitMyqDnT3qqQmi+guPUz/XuiKvOXb5Nn611zTNM6sak6t
         CiAPAMaM/FbmBCuutMPDapsWeOQZ/8NhfsLD3IEEzK7LYXhZGP4fnfUzqs6ZZIzk03iR
         stAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746689812; x=1747294612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fwr70jRROQnhTfVJ4M+ZZqp2+Z1EXWKMCwGS7IUNFQ=;
        b=Rj9FUesI/lc9bIakO99YrUYvKKXn1lxE10HU+GuEeL42dXj/ZXx266mLlXJaC0cJdj
         /5JaQqR8ENPFEZ2iR2yzEequ65EKiUGWVdgUPHPfWySapo9boREqTESgMvU26gx5LbLL
         zz7tOtyr3qttq97a6VK2uFMt+zyymPwrCN5CmOjmNeeMlCojCJVD1FeMEBhm9UUluHeG
         d/E2gfK1+1rnY8VA1L85IS7ZI6yW18Anw/ucI6TJ6246m18RMvdoKbyQqqwifM7gywiy
         CCphHpmmLAY89DtcyiPK/VlIG9eUqNQO52fu1ZXrLFlxMRgXp5SsoZgGsM9iS/jNUnrk
         7T/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUARLVSrpbMooi6ylcFklmSBcroUV5TnDTO4xn7ADrAYQMnvNJHTyzMF/NsF5EewsCg0g8nwbZoPEP+MefKWDnP@lists.infradead.org, AJvYcCUEX8/6wG8qtHcAiMtA2ad0pCLun9FlLauhYrBiCK8CvvHg2cGyFtRtaCRYXD4o1kaBvy4euuh8C7hECTWb6q4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxD1A+JCpglg3p+wmYKO3Sl7n7J80rG1IGxhvB8Mn8hQeTBD3CA
	M4AkXknLAC/OXhJVy8MFBgGxxLOGZE48uCs/gfCSeoS9DqJMWge/
X-Gm-Gg: ASbGnct0QRazPnLfN9op7//7N/eYSUkQpJt7gceDJ/jzBxdc43ZWX8+9Wit/Mg8eplO
	y2VZWNNyeVguiYoXNGbUpBaHfmNz49ddrviTINOHheWMjjw6/o7fBVe8YQcKKCpz7ggz7vZ2GGW
	AxCRo4CowRwkMmhYH4BEqGppad0bhap7vacfFLkRZJvEa2tYEJu9NI1lQmmzp/XQbpTFPKiZBer
	NMrMUxln5dRNs365OPnGFsXLy7BFIk5j4VsaX92GHLWPW+kypPDSYvDU1SxD6JIbHE6CRr+nHjb
	9mHoli9Hl5LNTtkF+Yt4RrZe347V+ouYdoCD0vESucpxxsBH/A3yoP5s5Q6+6xGlWJ4viQ==
X-Google-Smtp-Source: AGHT+IHPnNoxLhV7GIw/VlymXwTFp+WFlPFIfHMoS/t+AGVcolUKDOh9qji1dI06No4oykb/YQlDeA==
X-Received: by 2002:a05:6a20:2d2b:b0:1f5:59e5:8ada with SMTP id adf61e73a8af0-2148b81f041mr10087427637.4.1746689812362;
        Thu, 08 May 2025 00:36:52 -0700 (PDT)
Received: from tom-QiTianM540-A739.. ([124.127.236.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405905d16asm12570475b3a.127.2025.05.08.00.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:36:51 -0700 (PDT)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: sean.wang@mediatek.com,
	vkoul@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Qiu-ji Chen <chenqiuji666@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()
Date: Thu,  8 May 2025 15:36:33 +0800
Message-Id: <20250508073634.3719-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_083700_308732_B4C27BE7 
X-CRM114-Status: GOOD (  13.70  )
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

Fix a potential deadlock bug. Observe that in the mtk-cqdma.c
file, functions like mtk_cqdma_issue_pending() and
mtk_cqdma_free_active_desc() properly acquire the pc lock before the vc
lock when handling pc and vc fields. However, mtk_cqdma_tx_status()
violates this order by first acquiring the vc lock before invoking
mtk_cqdma_find_active_desc(), which subsequently takes the pc lock. This
reversed locking sequence (vc → pc) contradicts the established
pc → vc order and creates deadlock risks.

Fix the issue by moving the vc lock acquisition code from
mtk_cqdma_find_active_desc() to mtk_cqdma_tx_status(). Ensure the pc lock
is acquired before the vc lock in the calling function to maintain correct
locking hierarchy. Note that since mtk_cqdma_find_active_desc() is a
static function with only one caller (mtk_cqdma_tx_status()), this
modification safely eliminates the deadlock possibility without affecting
other components.

This possible bug is found by an experimental static analysis tool
developed by our team. This tool analyzes the locking APIs to extract
function pairs that can be concurrently executed, and then analyzes the
instructions in the paired functions to identify possible concurrency bugs
including deadlocks, data races and atomicity violations.

Fixes: b1f01e48df5a ("dmaengine: mediatek: Add MediaTek Command-Queue DMA controller for MT6765 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
---
V2:
Revised the fix approach and updated the description to address the
reduced protection scope of the vc lock in the V1 solution.
---
 drivers/dma/mediatek/mtk-cqdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index d5ddb4e30e71..e35271ac1eed 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -422,13 +422,10 @@ static struct virt_dma_desc *mtk_cqdma_find_active_desc(struct dma_chan *c,
 	struct virt_dma_desc *vd;
 	unsigned long flags;
 
-	spin_lock_irqsave(&cvc->pc->lock, flags);
 	list_for_each_entry(vd, &cvc->pc->queue, node)
 		if (vd->tx.cookie == cookie) {
-			spin_unlock_irqrestore(&cvc->pc->lock, flags);
 			return vd;
 		}
-	spin_unlock_irqrestore(&cvc->pc->lock, flags);
 
 	list_for_each_entry(vd, &cvc->vc.desc_issued, node)
 		if (vd->tx.cookie == cookie)
@@ -452,9 +449,11 @@ static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
 	if (ret == DMA_COMPLETE || !txstate)
 		return ret;
 
+	spin_lock_irqsave(&cvc->pc->lock, flags);
 	spin_lock_irqsave(&cvc->vc.lock, flags);
 	vd = mtk_cqdma_find_active_desc(c, cookie);
 	spin_unlock_irqrestore(&cvc->vc.lock, flags);
+	spin_unlock_irqrestore(&cvc->pc->lock, flags);
 
 	if (vd) {
 		cvd = to_cqdma_vdesc(vd);
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5639CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqupMxcfvgHjpWikt47ijlf0/lbzzSMQYq44Dxz2xkw=; b=u1RPur5L8HTl7qrASR8LDzeWb8
	dL03MQBTbLWSSDvIP113NCeAsGDaoJwVYGUu0/udcRSdLlW0YOl66Sg+YWcGXoBHQIiZbxeTD6EUW
	N5LRhccXnQsjXOWMmZupRsjJHqkyARbbEb9Kc5aDrRKQbN3NQU98mASUJ6ljyVHz/SxBZsKG5NnNZ
	Dgn19bS2ziq+6xIlQ8Y9rCvY7ntlM3B14gjKdZkWntDx2fK/jj+tRE78UXFa4mWEJo8RwWPImlyIt
	hHRRDDfffKFxSsmrh6tHF4LBHd/2o0FOASVN2hKc0V9Ne/GvOKJqV7prjP1JUAMgryk90Syv9pg92
	9uugt37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqpb-00000004zY9-1078;
	Sat, 23 Aug 2025 16:11:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqci-00000004ww3-1Wt5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 15:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F723A58CB9;
	Sat, 23 Aug 2025 15:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CBA9C116B1;
	Sat, 23 Aug 2025 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755964663;
	bh=36rUEQ/nyOji+fp5dS6bVayQxIrp+bVWGLzl//eyA4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P57F5fo0GhLEE06FSqPzmciqCyucHWjCLkal9nX7/kDyGhjbaW5xM/QAmUmmfULJx
	 WufekpRvXthRkhgHHcYgMWgFTLunzBjmJq9/CKP8aSOPcjwy3M7HJgi40AgUERhv8b
	 ilKq9JIR8C0lpHadn+0omYKy/Wn243gANPuQO+lq1gqy0u9EKMYB4vsygF4er96VDT
	 6Ud3x4BzabV+R6EWH1i9ZLpZtOcO9TaFC99KvAec7Wuz/UEuhabxDKkn7VW5y4B8pq
	 XQ68+BKnzjkldGrv+qXbHAIe9hKh606ZVqE7jmnVbgyhSbjSDMiHQaG9splpYN0Icl
	 EdpMd4Ht7OZDg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/14] dmaengine: dma350: Check dma_cookie_status() ret code and txstate
Date: Sat, 23 Aug 2025 23:39:59 +0800
Message-ID: <20250823154009.25992-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823154009.25992-1-jszhang@kernel.org>
References: <20250823154009.25992-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_085744_471906_172B52BB 
X-CRM114-Status: GOOD (  10.47  )
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

If dma_cookie_status() returns DMA_COMPLETE, we can return immediately.

From another side, the txstate is an optional parameter used to get a
struct with auxilary transfer status information. When not provided
the call to device_tx_status() should return the status of the dma
cookie. Return the status of dma cookie when the txstate optional
parameter is not provided.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/dma/arm-dma350.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 96350d15ed85..17af9bb2a18f 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -377,6 +377,8 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
 	u32 residue = 0;
 
 	status = dma_cookie_status(chan, cookie, state);
+	if (status == DMA_COMPLETE || !state)
+		return status;
 
 	spin_lock_irqsave(&dch->vc.lock, flags);
 	if (cookie == dch->cookie) {
-- 
2.50.0



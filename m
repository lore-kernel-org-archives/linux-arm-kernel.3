Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D1EC61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7w+wf9NhBJhq6R/N1nHnJzHmLG2h+bHuesUOXs57sgQ=; b=LnDfBsYxwGdxPZimfECa65xR8V
	9JMvFGrM27310Eng1CYeO3rGL9aCrP3u3SjEhZ03S2+OjlY6iYlC0CzxuLUqLwvNYdi/nGz50DrQf
	/SZM1SxNvWaF92hHkhA5gWAQQm0bdYc2rTSqApTlDe1xHYqNGTzcIvnHA8KjSfSKw6KvfVoky/5NI
	Ucrwgs7LmGe9cZJqI2JcW1Vafzs8u1kx3FIgECi7+JWZwxthGJ892EF5nZAimle9KJA2wcYAzsQGg
	zzZXQGjR/9EozvFbrYYik/B4QMB2fDU6Fe0kANPgvlQ4y7ugSAFVQ7oDqMRNk1HJByN0nSKqZcoyO
	k8QGy8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynM5-00000000TaH-1eqp;
	Tue, 25 Aug 2026 09:22:05 +0000
Received: from mail-m158141.netease.com ([47.251.158.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynLw-00000000TVc-2PP1;
	Tue, 25 Aug 2026 09:21:58 +0000
Received: from xxm-vm.localdomain (unknown [61.154.14.87])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4b3ea0c38;
	Tue, 25 Aug 2026 17:21:51 +0800 (GMT+08:00)
From: Simon Xue <xxm@rock-chips.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Simon Xue <xxm@rock-chips.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] iommu/rockchip: Reject unsupported physical addresses
Date: Tue, 25 Aug 2026 17:21:32 +0800
Message-Id: <20260825092132.154150-3-xxm@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825092132.154150-1-xxm@rock-chips.com>
References: <20260825092132.154150-1-xxm@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa03839decd09d3kunm5f4590cc6e035b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGhgYVh0ZThkfH0kdGElKSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ0xZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=R2elSKmydlOShUEg7zA3bDkULpCd6DBaQT7jS6kVndqubgpLOU1ViqOpTU1jN5AB+UYJlQ/4wtf2iO6vybLges5EK+CsCvVFlUhlvwsIi2NF1qhOAeL0/ULxqH75QCS5Q5XNC5nwH7xF3/XqI+2olm1lFYtUHSeo+2OMMPIgqA4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=7w+wf9NhBJhq6R/N1nHnJzHmLG2h+bHuesUOXs57sgQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_022156_915798_8EA6E2AF 
X-CRM114-Status: UNSURE (   9.87  )
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

A paddr with bits above the range the hardware can address is silently
truncated, pointing the device at the wrong page. Reject it using
paddr_mask before writing any PTE.

Signed-off-by: Simon Xue <xxm@rock-chips.com>
---
 drivers/iommu/rockchip-iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 9a5aabb2b9c8..93dde18ce33d 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -794,6 +794,10 @@ static int rk_iommu_map_iova(struct rk_iommu_domain *rk_domain, u32 *pte_addr,
 
 	assert_spin_locked(&rk_domain->dt_lock);
 
+	/* Reject addresses the hardware cannot support */
+	if ((paddr + size - 1) & ~rk_domain->rk_ops->paddr_mask)
+		return -ERANGE;
+
 	for (pte_count = 0; pte_count < pte_total; pte_count++) {
 		u32 pte = pte_addr[pte_count];
 
-- 
2.34.1



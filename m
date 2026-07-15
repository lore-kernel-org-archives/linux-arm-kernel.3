Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5028CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=SDVJJ1xLr7xWky9ho2VxmausoMg83j1se4IAydWbvyk=; b=uVQBuXknpT/ZmWnwElNcC41ytT
	v4JW1FLwp6fFOcizwwuIKWkRS4x+OLnTy/8BbzblSTDHqO6e/CRXthnNd1DmKYRiQ6EvBvUbgtZKd
	UVsQ6q9WKAFxNMwG5hoErk/BZ6i1h+cjn6INnLhnSF8SPbA7vP6rbUCzl/JiIjosglicouRt4wMFY
	kGnBf67fQQIr0Pu8IpKn7ZFacogqYrWr/sZSfqzbJdA7qNSLg6d2CX6vrG+mzpQigBATijWoopdde
	23ZaTfx41vYeWowgACf6TPl6362ZWNHBkdXjKNoJUYq1Mq7uPNy+h8+70LjuSa0HChsyYjf2D48Ej
	6mbeA0HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyqh-0000000EosY-1TdH;
	Wed, 15 Jul 2026 12:36:27 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyqZ-0000000Eonw-0lUw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:36:22 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260715123610euoutp01b0066d21c6b707d465f2d27651f58143~CdsAv53Q41583215832euoutp01X
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:36:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260715123610euoutp01b0066d21c6b707d465f2d27651f58143~CdsAv53Q41583215832euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784118970;
	bh=SDVJJ1xLr7xWky9ho2VxmausoMg83j1se4IAydWbvyk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=uemelT76i6UY2X5tg7rTHBUs6lCA4V/nH0Rn6HMYiwuJOeOZwt8NkhTlejbY9RmMg
	 rT21VlTUCk5fwPyFFH2vrdP7JTLzH9XOILYjpKRvnWA36DsY0tXNFyUZfhEfm88kGo
	 k+nzcY9ku5kR88E6iC+hzTjm5XsLwxE8rKtl59+Q=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260715123609eucas1p276498c4701060ffbb6789cb096696a31~CdsAMHlXz0124001240eucas1p23;
	Wed, 15 Jul 2026 12:36:09 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260715123609eusmtip2e748e18c41f35c2b9b6c1ce83debc305~Cdr-s-uy20360603606eusmtip2D;
	Wed, 15 Jul 2026 12:36:09 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jakub
	Raczynski <j.raczynski@samsung.com>
Subject: [PATCH net v3 0/2] net/stmmac: Secure against failures of DMA
 memory allocation
Date: Wed, 15 Jul 2026 14:36:00 +0200
Message-Id: <20260715123602.51950-1-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260715123609eucas1p276498c4701060ffbb6789cb096696a31
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260715123609eucas1p276498c4701060ffbb6789cb096696a31
X-EPHeader: CA
X-CMS-RootMailID: 20260715123609eucas1p276498c4701060ffbb6789cb096696a31
References: <CGME20260715123609eucas1p276498c4701060ffbb6789cb096696a31@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_053619_684925_A392EFBA 
X-CRM114-Status: GOOD (  10.04  )
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

This series fixing two issues related to fails of
__alloc_dma_rx_desc_resources(). Original issue from 1st patch is related to
page_pool that has happened in testing env, while second was requested by
Sashiko to have similar change for DMA allocation. 
To have complete fix for all failures of __alloc_dma_rx_desc_resources(),
merge two fixes into series.

---
Changes in v3:
- Added null assignment to page pointers (suggested by sashiko)
- Convert IS_ERR_OR_NULL check to just NULL check

Changes in v2:
- Added reviewed by Maxime to first patch
- Dropped null check as page_pool_destroy() does provide that
- Modified comment to reflect that

Link to v2:
https://lore.kernel.org/all/20260707174115.1264466-1-j.raczynski@samsung.com/

Link to v1:
https://lore.kernel.org/netdev/20260630100953.747868-1-j.raczynski@samsung.com/

Jakub Raczynski (2):
  net/stmmac: Set Rx queue page_pool to NULL when freeing DMA resources
  net/stmmac: Prevent dma queue NULL free on allocation failure

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 ++++++++++++-------
 1 file changed, 21 insertions(+), 11 deletions(-)

-- 
2.34.1



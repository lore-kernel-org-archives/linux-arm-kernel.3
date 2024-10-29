Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E3DD2AB11
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=frNyFmh+BICgTGeSP0eW9ZQlbyYNs7Z/320ADf7xc+k=; b=m3dIzb83EYaI0+aK/RCcjrf108
	BHt+nzb5fCLWNgNYU4GIctK8FrpalVqamY7ZskiRDTNdPqv+twRYDyZoI4BgCDIcTr4g3yiOqeUBY
	OdZumrL661AzymXzo/U/QadxQ+xRMf9WWVfShiND/2BV0wO1QAF8GBUUDrCyzjbcYyRmVNaEvHQRG
	4+6fJkbrN8QpNAp8ZBU69l1yntRhUA2ZX1D7MJK6B5Z03xj66lGYymU/jjUHQ5zS03UVvOKDYPm+g
	TcG+k5NifLMznZ7p/7P3Oj7+g8On1GVXk6FwoBdkA4wDGC0tgP7qxRENqen83HhMP3IG/xYyST0n6
	9/2c3F+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5j1Y-0000000Dxlt-0E6k;
	Tue, 29 Oct 2024 10:00:28 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hjV-0000000DhvC-2wH6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 08:37:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Xd3XS4V1jz4f3jMW
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 16:37:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 4BAF81A0568
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 16:37:30 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP4 (Coremail) with SMTP id gCh0CgDnwobAniBn3SoNAQ--.16672S2;
	Tue, 29 Oct 2024 16:37:30 +0800 (CST)
From: Chen Ridong <chenridong@huaweicloud.com>
To: ludovic.desroches@microchip.com,
	vkoul@kernel.org,
	mripard@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	chenridong@huawei.com,
	wangweiyang2@huawei.com
Subject: [PATCH] dmaengine: at_xdmac: avoid null_prt_deref in at_xdmac_prep_dma_memset
Date: Tue, 29 Oct 2024 08:28:45 +0000
Message-Id: <20241029082845.1185380-1-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgDnwobAniBn3SoNAQ--.16672S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFW7Cr45AFWkWw17KrW7Arb_yoWDGrX_GF
	yxur1xXrn8GF17Cws2kr1fZrWYkFy7Xr1a9w1Fqa43CFZ8ZrnrZr47tr95C345u3y7CFy5
	Cr90qFZ5Wr1UAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUwxhLUUUUU
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_013745_979186_E6BB043C 
X-CRM114-Status: UNSURE (   8.47  )
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

From: Chen Ridong <chenridong@huawei.com>

The at_xdmac_memset_create_desc may return NULL, which will lead to a
null pointer dereference. For example, the len input is error, or the
atchan->free_descs_list is empty and memory is exhausted. Therefore, add
check to avoid this.

Fixes: b206d9a23ac7 ("dmaengine: xdmac: Add memset support")
Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 drivers/dma/at_xdmac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 299396121e6d..e847ad66dc0b 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -1363,6 +1363,8 @@ at_xdmac_prep_dma_memset(struct dma_chan *chan, dma_addr_t dest, int value,
 		return NULL;
 
 	desc = at_xdmac_memset_create_desc(chan, atchan, dest, len, value);
+	if (!desc)
+		return NULL;
 	list_add_tail(&desc->desc_node, &desc->descs_list);
 
 	desc->tx_dma_desc.cookie = -EBUSY;
-- 
2.34.1



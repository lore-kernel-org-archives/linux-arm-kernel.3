Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF34D2AB3F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XJWWAlbK3RGH62xYDNUolseEBDgD9daFHgHjr2LGsKI=; b=Tfb9Hv8Ys4cUGj/vXLFY5yqsLt
	dydr+jjL9T8N+JhFva8wX12h3v+Yc5TKQ+dSHBCDkHlSqGyGC+9jyODW2GA8lEl2rVsbJKHmmW058
	9lYLukBrhKx3r3Rz9VsYAHMzPtBlM7I4q0YpTMchki1k1e/GFXB5iXAxzIYboJ5WoxfC/y9HbTd03
	sj3R9Y721lx+xlGRmcdK/rWSTDypPavJvbgUnGrvXe6rsVccmUKC9vzG73EVlYBEiIJX1pVvuFDZ2
	AZotwI4XkxulH/OJrF7pcueXUw49i+ZshCfbsOYDY1RVEyBLd1YmWuA2VhPJoaM3VuT6+gq5bnz7q
	YLNN5wcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mLT-0000000EaON-1cu0;
	Tue, 29 Oct 2024 13:33:15 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5m5X-0000000EXd8-1yu5;
	Tue, 29 Oct 2024 13:17:10 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Xd9kQ2Q3xz4f3jdY;
	Tue, 29 Oct 2024 21:16:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 05D071A018C;
	Tue, 29 Oct 2024 21:16:32 +0800 (CST)
Received: from huaweicloud.com (unknown [10.84.45.119])
	by APP4 (Coremail) with SMTP id gCh0CgBHIoYs4CBni_QeAQ--.56221S4;
	Tue, 29 Oct 2024 21:16:31 +0800 (CST)
From: Yang Yingliang <yangyingliang@huaweicloud.com>
To: jassisinghbrar@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	yangyingliang@huawei.com,
	bobo.shaobowang@huawei.com
Subject: [PATCH] mailbox: mtk-cmdq: fix wrong use of sizeof in cmdq_get_clocks()
Date: Tue, 29 Oct 2024 21:16:28 +0800
Message-ID: <20241029131628.1610-1-yangyingliang@huaweicloud.com>
X-Mailer: git-send-email 2.46.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgBHIoYs4CBni_QeAQ--.56221S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtw43CrykGF4xJFWxury5XFb_yoWftFc_ZF
	1UAryxWryUAF1fJwnxta13Ja9Fvrn8uFs2kr9a93sxW347Zry5Ar1DWr4Fvw47WrWDKrW3
	Aa1ktr18Jw1xCjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUF1v3UUUUU
X-CM-SenderInfo: 51dqw5xlqjzxhdqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_061647_786598_2329A603 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Yang Yingliang <yangyingliang@huawei.com>

It should be size of the struct clk_bulk_data, not data pointer pass to
devm_kcalloc().

Fixes: aa1609f571ca ("mailbox: mtk-cmdq: Dynamically allocate clk_bulk_data structure")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 4bff73532085..9c43ed9bdd37 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -584,7 +584,7 @@ static int cmdq_get_clocks(struct device *dev, struct cmdq *cmdq)
 	struct clk_bulk_data *clks;
 
 	cmdq->clocks = devm_kcalloc(dev, cmdq->pdata->gce_num,
-				    sizeof(cmdq->clocks), GFP_KERNEL);
+				    sizeof(*cmdq->clocks), GFP_KERNEL);
 	if (!cmdq->clocks)
 		return -ENOMEM;
 
-- 
2.33.0



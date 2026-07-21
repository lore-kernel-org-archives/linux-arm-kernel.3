Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9BDC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fPWY4xU7/6ckHUQAXW7HodXsFBZrzVFY6LJ761BN4mk=; b=0eGXCaI9PzQil2naImCE0HDCOV
	WVdZLgVviYYh6glaZxQKYsHhsKRvQ0SyEIFyU/CVH00QMloVMimzL67a2+N5LKnKr8TC+kofvsiXw
	J3IwAPzhGWPhsKBWssflLO9cW/l65PpUikMF0/AlJhRN0FTefnWj6ROFJgBrp/1IBA1aqC5160T3k
	S+PGrhR7SPWCGkbPxX/F+2Ucj7Sk0WSVOfxgnm0pn/m+nIMr98M+AK+emCkfzmfTLu7JQ26dV8T0y
	LJFQnW3EDOQRJpKh/kHCR6sedGnLeaGE/zMaHKKh3ly8WAob3bO3Tl9pZ72U81j6er0WZrOFnkgLk
	tqoIG1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm42B-00000008Wmg-1gPs;
	Tue, 21 Jul 2026 06:32:55 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm429-00000008WlU-1aAA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:32:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4h46xG62qSzKHMPk
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 14:32:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 7A69C4056B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 14:32:44 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgBXsm6KEl9qRSYCCA--.34790S2;
	Tue, 21 Jul 2026 14:32:44 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org,
	radu@rendec.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kemeng Shi <shikemeng@huaweicloud.com>
Subject: [PATCH v6 0/2] Minor fix and cleanup to irqchip/gic-v3-its
Date: Tue, 21 Jul 2026 14:32:39 +0800
Message-Id: <20260721063241.52549-1-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgBXsm6KEl9qRSYCCA--.34790S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF18AFy3tw17XF1xZFyftFb_yoWDGFX_ua
	y0g393WFW8Wa15CFWIyFsYvrWkGw4q9ryjva4Syr45Jw1UXan3X3WUKry3ZFn3GFW8W3Z3
	GFZ8Ar4fArn29jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4xFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSNtxUUU
	UU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_233253_596387_5B53A416 
X-CRM114-Status: UNSURE (   9.13  )
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

There are some random fixes and cleanups to irqchip/gic-v3-its. More
details can be found in respective patches.
Thanks.

v1->v2:
- Drop unneeded patches and some minor improvement.
v2->v3:
- Fix an extra leak issue in its_vpe_irq_domain_alloc().
- Remove redundant check in its_vpe_db_proxy_unmap_locked()
v3->v4:
- Add missing Fixes tags
- Improve changelog description
v4->v5:
- Collect RVB from Radu
- Drop more unneeded patches
- Use existing error handling to do its_vpe_teardown() in patch 3/4
v5->v6:
- Collect more RVB from Radu
- Drop first two patches which are already merged
- Add comment and do an early when vpe is not initialized in patch 1/2 
- Use single-line comment in patch 2/2

Kemeng Shi (2):
  irqchip/gic-v3-its: Fix leak in its_vpe_irq_domain_alloc()
  irqchip/gic-v3-its: Fix grammar and replace a bit number with its
    symbol

 drivers/irqchip/irq-gic-v3-its.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.36.1



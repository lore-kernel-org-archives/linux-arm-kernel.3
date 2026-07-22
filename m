Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4D7C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 04:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g8GKCTdhzyHicpm2s9IeJEalCatvuSkOlVRtNie8L7Q=; b=UPkXo/woJ0ywgfDms+RWlSumG1
	F4N2e1LK0F4HIYedzfpz3g58NcjyRb8NOrB0P9nPR+E3TptkkObAGov9KMcAVlhO827zdufqkBQ7a
	EDQ2CrYoKtSqhxV1SQOWcjLBQh89v8pX1M77mqUgWvsaLd1bEI8xHSOnkp6sWmpftvUONT4e2Wu2X
	0pbVS5pvkNaKVRyFKx8aBfd3ImXMTmbFCgmQWl3vsk/7UYCU4NYGLk5Fn+AvDl2BBL67Ic6uA8HHV
	xVK+aM9b3a9+KQqV/WeRngu7OsB6M1y3msA047N+gkdkwST5tCzUkGFxBfeKq5K4rPy8pqvTCKYBO
	B8rIngIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmOM5-0000000AreM-2UDM;
	Wed, 22 Jul 2026 04:14:49 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmOM2-0000000Ardy-3BdR;
	Wed, 22 Jul 2026 04:14:48 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAC3JD+0Q2BqaCa7AA--.23602S2;
	Wed, 22 Jul 2026 12:14:44 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Daniel Palmer <daniel@thingy.jp>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] irqchip/mst-intc: reject ranges beyond saved state capacity
Date: Wed, 22 Jul 2026 12:14:43 +0800
Message-ID: <20260722041443.10020-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3JD+0Q2BqaCa7AA--.23602S2
X-Coremail-Antispam: 1UD129KBjvdXoWrury3Jw48Cw48Wry7WryrtFb_yoWDArX_u3
	W5uan7Gr1rKFn5JF97tr17Zry0yF9ruF4qgwnYv3W3JryfW3WrGF1UX3sYya1xuF4Fyr1x
	CryYvrW0kr9FkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbtxhJ
	UUUUU==
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_211447_163685_CEE8F87A 
X-CRM114-Status: UNSURE (   8.40  )
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

The inclusive Device Tree IRQ range determines nr_irqs. Suspend and
resume then use nr_irqs to walk the fixed saved_status array, which has
MST_INTC_MAX_IRQS entries. A descending range underflows the unsigned
subtraction, while a range wider than 64 entries exceeds that array.

Reject both forms before deriving nr_irqs.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/irqchip/irq-mst-intc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index b5335f6fd6d6..1475335d668d 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -263,6 +263,10 @@ static int __init mst_intc_of_init(struct device_node *dn,
 	    of_property_read_u32_index(dn, "mstar,irqs-map-range", 1, &irq_end))
 		return -EINVAL;
 
+	if (irq_end < irq_start ||
+	    irq_end - irq_start >= MST_INTC_MAX_IRQS)
+		return -EINVAL;
+
 	cd = kzalloc_obj(*cd);
 	if (!cd)
 		return -ENOMEM;
-- 
2.43.0



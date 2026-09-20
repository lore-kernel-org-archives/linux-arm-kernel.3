Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7F5C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 03:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8VIR0QNjZ1d8DTLtzR+w6Ot69y35D5C5PM9NP04wTDs=; b=SuLITK+Qv9zafwX0lhYbOZovIs
	fW/Eh+5EaSW7eRrlQvEq5y9i62zuUhOuEoaz1QFyqH1wB8jJv+4ASPfBfjkzq8QXoNlK81M5w4jxT
	wGbfd39f7rMRiLUvGW0HfFz9RcV07hhF32/4zrymlPlBVce20PSAtj6Tssiphn/cN3poixB8MH2wQ
	iB/XLIqNzcHkN4b2TD4vG8p1tx5w5XEsqmFPNRmrPHOwSSqhVfY6mG5iSx9GlBOP7U/ZEXKCkxjpA
	HMrjI429QJ4hWWznTDxI7p4rg7Bvi/KBl74Z0JeHaqLojZB3QmFAF4NGE2Ms66SPxEh58aT5MVEuB
	/4UUb3BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88SB-0000000GpID-0rPz;
	Sun, 20 Sep 2026 03:42:59 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88S7-0000000GpHM-2U0x;
	Sun, 20 Sep 2026 03:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8V
	IR0QNjZ1d8DTLtzR+w6Ot69y35D5C5PM9NP04wTDs=; b=cJBxbZHXYJw+Zw5C01
	9IVJCua+Fea0ehdT3KP0qaeLERw+SGHVV9GIxfkbcqX0PNuFwqg7B3GJlKdRxfC+
	vEi2l9ZKRgDUTO57QVHM49AXG7YN0FpPOI8Le6qi+lCPFpCV80O//eKyC8SOimtE
	NLM+x3HvpS9oegTL8f+SNP5pU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDHCUguVq9qOVkyBg--.158S2;
	Sun, 20 Sep 2026 11:42:40 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: mark-pk.tsai@mediatek.com
Cc: daniel@thingy.jp,
	tglx@kernel.org,
	radu@rendec.net,
	linux-kernel@vger.kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	hppiscas@163.com
Subject: [PATCH v2] irqchip/mst-intc: validate the DT interrupt range
Date: Sun, 20 Sep 2026 11:42:36 +0800
Message-ID: <20260920034236.16229-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHCUguVq9qOVkyBg--.158S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4UXrW7Ar48Ww1xJr1UKFg_yoW8WF1xpF
	W3Gas2kF47GayxJry2y3WUZFy5WwnavFW7G3ykKa4xZr13W3ykuryayFZ0gFnrC3yxG3W8
	CF45Xa4rWw4UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR5PEDUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxRAo8GqvVjB8vQAA3v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_204255_981820_F565B295 
X-CRM114-Status: UNSURE (   9.80  )
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

The driver takes an inclusive interrupt range from the device tree
without checking its endpoints. A reversed range wraps the unsigned
count calculation, and a range larger than MST_INTC_MAX_IRQS exceeds the
controller capacity used by the driver.

Reject these ranges before calculating nr_irqs or creating the domain.
Check the difference after ordering the endpoints so the validation
itself cannot wrap.

The issue was found by our static-analysis tool.

Fixes: ad4c938c92af ("irqchip/irq-mst: Add MStar interrupt controller support")
Reviewed-by: Radu Rendec <radu@rendec.net>
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
https://lore.kernel.org/all/20260722041443.10020-1-pengpeng@iscas.ac.cn/
Describe the missing DT range validation directly, keep the condition on
one line, and add the introducing Fixes tag as Thomas requested.

 drivers/irqchip/irq-mst-intc.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index b5335f6fd6d6..1070de5de8cc 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -263,6 +263,9 @@ static int __init mst_intc_of_init(struct device_node *dn,
 	    of_property_read_u32_index(dn, "mstar,irqs-map-range", 1, &irq_end))
 		return -EINVAL;
 
+	if (irq_end < irq_start || irq_end - irq_start >= MST_INTC_MAX_IRQS)
+		return -EINVAL;
+
 	cd = kzalloc_obj(*cd);
 	if (!cd)
 		return -ENOMEM;

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.50.1 (Apple Git-155)



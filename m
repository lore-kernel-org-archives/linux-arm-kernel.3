Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9FCCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOcCHX0Za+CLcU0bVyHXOgKIc/guArAklcRiiJB8+6U=; b=b4vd2l2c1OtSCFlyFtE4iZbjW5
	p9+AXZ5S6q46bN+I0IIXeumxkjnPoEmRpQ7cBm3KDPtzy3VUbo/qAd46v5fCRijUu54vZr65rUyiu
	qHgDiUN/vE55OLYd/sakVDjLo8IYYbFZHih/DHnJk8TvsOISL6kUUuLfDj7B3FM6guy9Vb9TGMZVS
	twkJeuw0/EqNZpQOccKHSFlBtWmR4ImpkGeECK6TWUcwqmZ211HmU8TCTFbyiGcZdwO35NkUuNEWC
	d8k09vDUsKDDyIWePh8p0AJczaLoZlv+Cw8gzr5CuzI0UoNRRkfCNdugTNnG6s7y/Y7Um3ND/hIwA
	NkxNJvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHihP-0000000372V-0PAl;
	Fri, 16 Oct 2026 14:14:19 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHihN-0000000370m-02nI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=HO
	cCHX0Za+CLcU0bVyHXOgKIc/guArAklcRiiJB8+6U=; b=A2pGCTWR15RJCOzryQ
	+SA3xCDFlELar5xUDfW0bdbprnUQDTy6lPIFsh3ImOCBXqoo7YQqSxlD1CHbC5Pl
	RgVajfJvGf74aqlWXFic9WjvguHi5/cdl/pyv57MDFZbzOmdz1NFrwZ+2Idc6Amw
	fKk57FXRv2RYyePndaRfb5VJQ=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3NysnMdJq1dUUAg--.27711S6;
	Fri, 16 Oct 2026 22:14:04 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 4/6] irqchip/gic-v5-its: validate MADT translate frames
Date: Fri, 16 Oct 2026 22:13:55 +0800
Message-Id: <20261016141357.2793046-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016141357.2793046-1-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3NysnMdJq1dUUAg--.27711S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF18Gw45AFyfCw4rZw1kZrb_yoWDWwb_Cr
	1kWFn7JF4xKr47Jw1xGr45ZrW2vw4v9Fn5uFZ0qa93Gr48Xw13XFnrX395XF4DGF1vyFn3
	Gws8CF1fKr129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sREMKZPUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wym4GrSMSyidgAA3U
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071417_486638_B5C25878 
X-CRM114-Status: UNSURE (   9.20  )
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

The GICv5 ITS translate-frame callback accesses IDs and the base address
without checking that the MADT entry contains the complete fixed-size
record. A truncated firmware entry can therefore cause out-of-bounds
reads.

Reject incomplete translate-frame entries before using their fields.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 28e39b065de0..dad3b95ba150 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1233,6 +1233,9 @@ static int __init gic_acpi_parse_madt_its_translate(union acpi_subtable_headers
 	int err;
 
 	its_frame = (struct acpi_madt_gicv5_translate_frame *)header;
+	if (BAD_MADT_ENTRY(its_frame, end))
+		return -EINVAL;
+
 	if (its_frame->linked_translator_id != current_its_entry->translator_id)
 		return 0;
 
-- 
2.34.1



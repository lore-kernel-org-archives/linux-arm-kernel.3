Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A26C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdO02FM64kPun8rMQFnkblDJZEda4ibthzs+1fvRU2I=; b=W3RiJ8hoyTMUMmkGN4voJKBPGI
	Sv2fN641tJugI9zngC1YDrmJjxrZwQ0bIizkLCmbDl+cLeBb/TyJzTPxdrxZbYaT9edaTJHkzUtM5
	zDMB6awnsvjkz/ih5EcD13KYvG9RGJn9AHtjQJw3euhc7vPMCzaKecky2FukNebKAEMzKYzbBPDdf
	Oy6UOUeWHGhDyFTovzWfTNCOnpCLEGOT2YPBxWwws0JWWWgFwl/2EYPw64BawWKOOldbvj1qXP0S4
	oQ9F+At95B++bAm1d8dJcHKeMGpIjpMIgGsZQVuA2VAYaxCLYsKqvCw7x7tsTpgBNfmG1+aIw0Dw8
	fVyHT8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliB3-000000062LH-0OLx;
	Mon, 20 Jul 2026 07:12:37 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliAu-000000062H2-0geF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:12:31 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h3Wsm21ykzYQtr3
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 15:11:56 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 7AC4540706
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 15:12:21 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgCX829Syl1qcOqKBw--.35642S4;
	Mon, 20 Jul 2026 15:12:21 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org,
	jason@lakedaemon.net,
	lpieralisi@kernel.org,
	radu@rendec.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kemeng Shi <shikemeng@huaweicloud.com>
Subject: [PATCH v5 2/4] irqchip/gic-v3-its: Fix its node leak in gic_acpi_parse_madt_its()
Date: Mon, 20 Jul 2026 15:12:13 +0800
Message-Id: <20260720071215.50705-3-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260720071215.50705-1-shikemeng@huaweicloud.com>
References: <20260720071215.50705-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgCX829Syl1qcOqKBw--.35642S4
X-Coremail-Antispam: 1UD129KBjvdXoWrZw13Zr45CrWfWw1UGrWkCrg_yoWDWwb_CF
	WjqFsxAFWjvr18Gw42yF4rZryvka109F1kuF1FyFy5Kw1xX347JFsrurZ8AF4UGF1vyryS
	yrZYvr1Skr12yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb6xFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUFoGdUUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_001228_392398_96000C22 
X-CRM114-Status: UNSURE (   9.76  )
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

Fix its node leak when its_probe_one() failed in
gic_acpi_parse_madt_its().

Fixes: 9585a495ac936 ("irqchip/gic-v3-its: Split allocation from initialisation of its_node")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-gic-v3-its.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index d721b6101e0a..3e4edcb64065 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5747,9 +5747,13 @@ static int __init gic_acpi_parse_madt_its(union acpi_subtable_headers *header,
 		its->flags |= ITS_FLAGS_FORCE_NON_SHAREABLE;
 
 	err = its_probe_one(its);
-	if (!err)
-		return 0;
+	if (err)
+		goto probe_err;
+
+	return 0;
 
+probe_err:
+	its_node_destroy(its);
 node_err:
 	iort_deregister_domain_token(its_entry->translation_id);
 dom_err:
-- 
2.36.1



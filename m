Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C80CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 04:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vpGlXn1fnMgwRad3WvlY2ajyHnsbKG6D7g5spdvM2eM=; b=o9sMKyoe+Cg/RhSx75ezOL11wV
	PwMU40FtRHP8O5jgz9KBsxZEdSAiqOCU9UTJmYGDxN+N2YYRJjKlHI2tY0QcXnfNDhZatxLgM1GtI
	SswdFZXTuI11CEUIjO+7Gn/86l0lbEpqjniU/sBICnfIzOjmrmoBrlFxKmhHU5hMKqwAR9fNUIOIu
	dEQV3ILTss7KnptPVHwuN4Z+xP/MxGNBUXeeoXGrbqND8wzk0V//ANdQxPMYmAuLJGjzSq57Vz9Up
	7bAef0MIGr3Pca6EvyPGoTrA0hAovqZwjOCg5xOvEE6b1TGDgC8q+jawq0wBeOh4t3Xb3SBanZtNk
	LRjMYACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYy0t-0000000DW3e-20gy;
	Mon, 15 Jun 2026 03:29:27 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYy0o-0000000DW3E-475A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 03:29:24 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gdwZC5F7bzKHMNP
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 11:28:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 4883840596
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 11:29:20 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with SMTP id cCh0CgAnKj+PcS9qOnxeBw--.30354S2;
	Mon, 15 Jun 2026 11:29:20 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: [PATCH 0/6] Some random fixes and cleanups to irqchip/gic-v3-its
Date: Mon, 15 Jun 2026 11:29:04 +0800
Message-Id: <20260615032910.54735-1-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgAnKj+PcS9qOnxeBw--.30354S2
X-Coremail-Antispam: 1UD129KBjvdXoWrArW8KFyfuF1rZr18AF1rtFb_yoWxWFX_Ca
	yYqFZrGFWxXFWkuFy2ya10vrykJa1UuFyUua10kFW7Xw4xZ3WxAF1UGrs5ZF4rWF48t34f
	GFZ5Xw1fG347CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbhvttUUUU
	U==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_202923_229492_4C3C59CF 
X-CRM114-Status: UNSURE (   5.95  )
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

Kemeng Shi (6):
  irqchip/gic-v3-its: Fix LPI range leak and refactor error handler in
    its_lpi_alloc()
  irqchip/gic-v3-its: Fix memleak in its_probe_one()
  irqchip/gic-v3-its: Fix its node leak in gic_acpi_parse_madt_its()
  irqchip/gic-v3-its: Add ITS address info in more error logs
  irqchip/gic-v3-its: fix typo in comments
  irqchip/gic-v3-its: some minor cleanups

 drivers/irqchip/irq-gic-v3-its.c | 68 ++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 29 deletions(-)

-- 
2.36.1



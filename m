Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650E1C44525
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIJbnv+YXO1H8wTJYiwV9zzuWNNmbhXydhaC7Xsb00U=; b=AujP0c0Hi+ch1ki5B78Pe26GOd
	yPPNrGTJfuse39Db0gwJim5Fhp9yCqLwYhKBHqopbBFIwkKkriveoHnm6M0oQvogMTKvVeviEdLaL
	msHiI+qTEMZFxYxF1vdxBmInfbc3HxjODrJ8m56+O4AqzWp++MR1kmXtwrl4hede+a5NHJAdaz/Sz
	fnVA2RXBRCXJPQudJ5ofikJa0bTjR0CBBjceTF/CYNrSYlh+hS89U3fAl/nhle0XT2g7AWwDD4LqJ
	2A9ScbPskAewMWqZH3fQKhvtUyrhCetRD24p9WaheCN0rGvMpZAdJytAsreT/+t14bTTGBCq80KAa
	HdhWiNew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliB3-000000062Lg-1Aku;
	Mon, 20 Jul 2026 07:12:37 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliAu-000000062H4-2kUl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:12:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4h3WsV1qFFzKHMSd
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 15:11:42 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 4E0FC4059A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 15:12:22 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgCX829Syl1qcOqKBw--.35642S6;
	Mon, 20 Jul 2026 15:12:22 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org,
	jason@lakedaemon.net,
	lpieralisi@kernel.org,
	radu@rendec.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kemeng Shi <shikemeng@huaweicloud.com>
Subject: [PATCH v5 4/4] irqchip/gic-v3-its: Fix grammar and replace a bit number with its symbol
Date: Mon, 20 Jul 2026 15:12:15 +0800
Message-Id: <20260720071215.50705-5-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260720071215.50705-1-shikemeng@huaweicloud.com>
References: <20260720071215.50705-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgCX829Syl1qcOqKBw--.35642S6
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy7CryUZFyrZF1xKF45Jrb_yoW8Gr1kpF
	WUG34Ikrs3KFW5uwnxua1I9Fy5tws2yFWUK3y8Ca1fX34UWr95XF1UtFyaqrn7Jr13AFWY
	vFWS9F4UXayUAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
	3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
	x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF
	0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYcTQUUUU
	U
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_001229_329176_81500E7B 
X-CRM114-Status: GOOD (  13.78  )
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

Fix grammatical errors in comments and simplify the comment about reading
GITS_BASER_INDIRECT to check two-level support.

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 5dc91862fc15..8935a6e7a20f 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -163,7 +163,7 @@ struct event_lpi_map {
 
 /*
  * The ITS view of a device - belongs to an ITS, owns an interrupt
- * translation table, and a list of interrupts.  If it some of its
+ * translation table, and a list of interrupts.  If some of its
  * LPIs are injected into a guest (GICv4), the event_map.vm field
  * indicates which one.
  */
@@ -2502,8 +2502,7 @@ static bool its_parse_indirect_baser(struct its_node *its,
 	/* No need to enable Indirection if memory requirement < (psz*2)bytes */
 	if ((esz << ids) > (psz * 2)) {
 		/*
-		 * Find out whether hw supports a single or two-level table by
-		 * table by reading bit at offset '62' after writing '1' to it.
+		 * Find out whether hw supports a single or two-level table
 		 */
 		its_write_baser(its, baser, val | GITS_BASER_INDIRECT);
 		indirect = !!(baser->val & GITS_BASER_INDIRECT);
-- 
2.36.1



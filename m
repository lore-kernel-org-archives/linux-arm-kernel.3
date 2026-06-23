Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624E9CDB476
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 02:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wvPi9o2h27d1qNkqD1UOs9XglIJZza+/IZF2+QLeZE=; b=PcIetgy6jXWXrhpM+X8BW0qE20
	UgFVIh8zV3DhoEfP//nqz3GlLa7p60kDMBEkXpFSbKLu/Q1Gwt6TrsK0mOMRVUgQYZ/8DQfy5yNyX
	0Uh7YTdwVgWMo/3BBLdbTNtdhvqFfNkFQdNxN1SV6k5lhGFM78pkQcHDLd32xHRnTguRcGPjdlgKR
	4nHuC+h5OW4QkLA3SdVaq0/vZECS+Jg8VV5hHpYaNkydG/FmqzuzP1SLCxT2qZLPxMpNO67GuT9l1
	Z32aGeSHz/IPD5PhV4jN6Fcj4D1MaRPYxWVGaFljthXE8d16uYQgU9CoI5IeiJM2YKWa7Jy+3XmsA
	tOqe1PUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqSd-00000005Zk7-1BP1;
	Tue, 23 Jun 2026 02:01:59 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqSR-00000005Zet-4B1W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 02:01:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gkpFS4QJRzYQtwh
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 10:01:00 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id A3A154056F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 10:01:40 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with SMTP id cCh0CgCHiD0A6TlqxaQZCw--.5730S8;
	Tue, 23 Jun 2026 10:01:40 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: [PATCH v3 6/6] irqchip/gic-v3-its: Remove redundant check in its_vpe_db_proxy_unmap_locked()
Date: Tue, 23 Jun 2026 10:01:35 +0800
Message-Id: <20260623020135.3584-7-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260623020135.3584-1-shikemeng@huaweicloud.com>
References: <20260623020135.3584-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgCHiD0A6TlqxaQZCw--.5730S8
X-Coremail-Antispam: 1UD129KBjvdXoWruF4rCryfKw1UJr13Zw1kXwb_yoWfCrg_Cr
	WrWFs7GF4fCw4UCw1xtr4jvF9Fya1kZF9rur4SkFy5Jw1Iq3W7JrW7X3s3ZF4DWFyUJFnx
	AFZY9r4xCr1xAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb6AFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
	IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
	F7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r
	1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbx9NDUUUUU=
	=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_190148_214762_01AB1C3E 
X-CRM114-Status: GOOD (  10.26  )
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

The high level functions already ensure that gic_rdists->has_rvpeid
is false before calling its_vpe_db_proxy_unmap_locked(), so we can
remove the redundant check in its_vpe_db_proxy_unmap_locked()

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 120f6f29e978..b0069fbe1e69 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3801,10 +3801,6 @@ static const struct irq_domain_ops its_domain_ops = {
  */
 static void its_vpe_db_proxy_unmap_locked(struct its_vpe *vpe)
 {
-	/* GICv4.1 doesn't use a proxy, so nothing to do here */
-	if (gic_rdists->has_rvpeid)
-		return;
-
 	/* Already unmapped? */
 	if (vpe->vpe_proxy_event == -1)
 		return;
-- 
2.36.1



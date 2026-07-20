Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010CDC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leaf+/HThce+pGWGXURwHBmkf/bg1uhAzIJBwvO3EsE=; b=XVecm6Njscb2gNUf8zoh4ArsVB
	DjBAknFvn2pOZxqDTjp3UmxqLeo741fKIOlrFxiJxLe1xTvocK45vu0ZvqtfFQcKiIvYSkDnlqjgk
	1kBXRTs0qenbxjh0myvCk56K7pTkIAw6sEn4wf9y9QL9NwEW701JlW/yTIYtsI5Yar6gtO6xLW68m
	dA150y741mvf0pe7KR62MODTnblhyS5HAsB7xnYy2Mt66f0hcQZXzAzZyRgRWDvgToPYzomkQhuE5
	O9m3jvLu8eZ68s2oS9MrW/zlX46T+Z14eMoqy47xhmeIdG+q+1vfLN2G3l6int+Fz+CDRWYGm3w/T
	G56yhUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliAx-000000062JO-3hdx;
	Mon, 20 Jul 2026 07:12:31 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliAu-000000062H1-0g77
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:12:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h3Wsm4wTXzYQtmT
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 15:11:56 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id DFAE74056B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 15:12:21 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgCX829Syl1qcOqKBw--.35642S5;
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
Subject: [PATCH v5 3/4] irqchip/gic-v3-its: Fix leak in its_vpe_irq_domain_alloc()
Date: Mon, 20 Jul 2026 15:12:14 +0800
Message-Id: <20260720071215.50705-4-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260720071215.50705-1-shikemeng@huaweicloud.com>
References: <20260720071215.50705-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgCX829Syl1qcOqKBw--.35642S5
X-Coremail-Antispam: 1UD129KBjvJXoW7uw48Gw1kAFWrWw1xtF4DCFg_yoW8XrW7pF
	WrX3sF9r47AFWUWr4DCw18ua43t397t3yj9ayUC3ZxXr1DAFyvkF17Aa4a9ry0kryxJF13
	ZF1FgF48uF4UCFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
	JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7V
	AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYdb1UUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_001228_381578_8E14B336 
X-CRM114-Status: GOOD (  10.43  )
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

When its_irq_gic_domain_alloc() fails, the following
its_vpe_irq_domain_free() skips calling its_vep_teardown() for the
corresponding irq. Try its_vpe_teardown() in error handling to avoid
the leak issue.

Fixes: 7d75bbb4bc1ad ("irqchip/gic-v3-its: Add VPE irq domain allocation/teardown")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 3e4edcb64065..5dc91862fc15 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4594,9 +4594,11 @@ static int its_vpe_init(struct its_vpe *vpe)
 
 static void its_vpe_teardown(struct its_vpe *vpe)
 {
-	its_vpe_db_proxy_unmap(vpe);
-	its_vpe_id_free(vpe->vpe_id);
-	its_free_pending_table(vpe->vpt_page);
+	if (vpe->vpt_page != NULL) {
+		its_vpe_db_proxy_unmap(vpe);
+		its_vpe_id_free(vpe->vpe_id);
+		its_free_pending_table(vpe->vpt_page);
+	}
 }
 
 static void its_vpe_irq_domain_free(struct irq_domain *domain,
@@ -4674,8 +4676,10 @@ static int its_vpe_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
 		irqd_set_resend_when_in_progress(irq_get_irq_data(virq + i));
 	}
 
-	if (err)
+	if (err) {
+		its_vpe_teardown(vm->vpes[i]);
 		its_vpe_irq_domain_free(domain, virq, i);
+	}
 
 	return err;
 }
-- 
2.36.1



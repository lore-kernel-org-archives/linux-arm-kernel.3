Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E02CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 02:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D58XqfWEo0+kTaSeHVo/fZQD/Y33I+1lazN5SUExVzk=; b=BPHvrGa8PVWiikm80slyS4SYv6
	q0sda3lKIlw1ZdB6xuwGbBXtYRxRClSxxlfePEyc8WcTfi7Jy9BbuqTZogwwMLBv0C2p1GpTFLoS8
	b58Gj1/4ReawkQWlbpAy3qXL0QokH5rrz5EQJPSzwh2fRec5A9MxI7y1p/mX6ABZvlAcvVrfK2689
	1xNcwkRLzbRnRN3JoXSDLbC9uPiqR1pTdF3K5PlbRhgO7Ily9cOiQLfrq1yFyQGSa+XFp0IvYuJJp
	ay/2OHICYeeqeaAVYBgx6kiiAJjQsY0/w4apkq/DpXeEo8evwDpHbYbflQbU1oq1USaQBg6aivI1V
	XFLDFNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqSd-00000005ZkR-1mvh;
	Tue, 23 Jun 2026 02:01:59 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqSR-00000005Zev-3cxB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 02:01:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gkpFQ3Sc6zYQtwG
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 10:00:58 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 848774056E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 10:01:38 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with SMTP id cCh0CgCHiD0A6TlqxaQZCw--.5730S2;
	Tue, 23 Jun 2026 10:01:38 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: [PATCH v3 0/6] Some Minor fixes and cleanups to
Date: Tue, 23 Jun 2026 10:01:29 +0800
Message-Id: <20260623020135.3584-1-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgCHiD0A6TlqxaQZCw--.5730S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF18AFy3tw1rKr1kCw1xKrg_yoWfXFX_Ca
	yFqas3WF4xWFWrCay7tF4rtFWkJr4q9FyUuFW0kayUXw1xX3WfJa17GFsxZFsxXFW8Ka47
	GFZ8Zr4fGr17CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7UUUU
	U==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_190148_095163_E65BB6E3 
X-CRM114-Status: UNSURE (   6.02  )
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

Kemeng Shi (6):
  irqchip/gic-v3-its: Fix memleak in its_probe_one()
  irqchip/gic-v3-its: Fix its node leak in gic_acpi_parse_madt_its()
  irqchip/gic-v3-its: Fix leak in its_vpe_irq_domain_alloc()
  irqchip/gic-v3-its: Add ITS address info in more error logs
  irqchip/gic-v3-its: some minor improvement in comments
  irqchip/gic-v3-its: Remove redundant check in
    its_vpe_db_proxy_unmap_locked()

 drivers/irqchip/irq-gic-v3-its.c | 37 ++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 16 deletions(-)

-- 
2.36.1



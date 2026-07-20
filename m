Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C33CC44521
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1ch/nHGj/mCMtpEsq3qCHTEwiJP8e64urAVw/ddZKiw=; b=fFVZ1tCb4r42UUb5Gia5rdVpxm
	joLuGj7Yq9+BIWTT6qpAIgk848X8KcdnyCTjKmFIdyyBq/98M7oGZ3TOi+0IneXtpYdaxC6eeJFjM
	IXYiPJI3DKudhXoZSOKQJRkM+gzLnKAu6lzRJ2+eG/astkE0MtC4LNU1aE3+jimfl4cqoJpGHsFcZ
	KbajR/3S93xeYDcsEh0LDYbWDaxMf1yNqGBz8kqI3dVTLKMSZmdFNCwNZiroOFZfucVjA7aDffohS
	S+9+CbBUeVVYnE47CyfBWCH1Vh1A9vkFfxqtv4eQMQG3o5m/j/2YLHcxU7B7U6V9WJNWgMbr7/NL5
	xYb+jczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliB3-000000062M4-248P;
	Mon, 20 Jul 2026 07:12:37 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliAu-000000062H3-2RCY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:12:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h3Wsl2rlpzYQtmT
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 15:11:55 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 989A74056B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 15:12:20 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgCX829Syl1qcOqKBw--.35642S2;
	Mon, 20 Jul 2026 15:12:20 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org,
	jason@lakedaemon.net,
	lpieralisi@kernel.org,
	radu@rendec.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kemeng Shi <shikemeng@huaweicloud.com>
Subject: [PATCH v5 0/4] Some Minor fixes and cleanups to irqchip/gic-v3-its
Date: Mon, 20 Jul 2026 15:12:11 +0800
Message-Id: <20260720071215.50705-1-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgCX829Syl1qcOqKBw--.35642S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF18AFy3tw17XF1xCFWUCFg_yoWfuFg_ua
	y0gas3WFW7Wa1rCFWIyFsYvrykJF4q9ryj9a4Fkr4UGw18Xwn3JF17Gr4fZFn3GFW8J34x
	GFs8Zr4fCr17CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUBVbkUUU
	UU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_001229_326046_73CBDFEB 
X-CRM114-Status: UNSURE (   6.30  )
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

Kemeng Shi (4):
  irqchip/gic-v3-its: Fix memleak in its_probe_one()
  irqchip/gic-v3-its: Fix its node leak in gic_acpi_parse_madt_its()
  irqchip/gic-v3-its: Fix leak in its_vpe_irq_domain_alloc()
  irqchip/gic-v3-its: Fix grammar and replace a bit number with its
    symbol

 drivers/irqchip/irq-gic-v3-its.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

-- 
2.36.1



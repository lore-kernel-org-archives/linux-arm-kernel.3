Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54359CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 02:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=trA4x6V0uMPMjZ7lI6PI92RQNwBP6JA/mrR6xsjBToc=; b=S0YmrGMUcGN6pN0cwOWdxEYKWF
	o70SoIFyVPR24pTHpbyIDwzq9PHrkDfK0AHoj2cOX/YV6hJa1vEyWuVPwaLhZNQUFxW9bXEWhrUhN
	54QRBWM/wioMYin1cFFxdctzOLHTNf+Asx9dqHsWht+9/UJ37vJDzx7Zh3QzHR29Y0Vlon+nzaZMM
	36u7pdJhFbYz9vOfvlt08AJ+Ol3VzA3W1uhMnEi1oKeFAnWIOXSTTGdpKzEI7ZYY7g/xwdCtNxJxZ
	zQgzXv81Pysn8nVVCU95RdlsQb4FUPCFKXAJpNZ+cV9wg7R91CXbMbaPNTiKlu9wLAjBf0rd/9azh
	V0Je1V2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZg3r-0000000GVnU-1mfI;
	Wed, 17 Jun 2026 02:31:27 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZg3n-0000000GVn3-382M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 02:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=tr
	A4x6V0uMPMjZ7lI6PI92RQNwBP6JA/mrR6xsjBToc=; b=DmVXGrL0fzjQnsqF0z
	3fjzereFl/IlGd6UiOkcE1n9Y0pc91KVSE8IR/pATEfXrpWnYBM+Eu0yJqtv2hvE
	p1swkbDDe5lBCXggtVvRirrbKMRpOvWqby+wT4eEIHwqze4R3Naz9XKtKkBXQMVh
	Hp0zXJfokXzy5q49zk3tQYdt4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wB3oubhBjJqeMXtDw--.10840S2;
	Wed, 17 Jun 2026 10:31:00 +0800 (CST)
From: xuchenchen <xu18736995897@163.com>
To: linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xuchenchen <xuchenchen@kylinos.cn>
Subject: [PATCH] ARM: smp: Always separate IPI labels from counters
Date: Tue, 16 Jun 2026 19:30:54 -0700
Message-ID: <20260617023054.5879-1-xu18736995897@163.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3oubhBjJqeMXtDw--.10840S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw1UuF4DuF4kCF1xJr4Dtwb_yoWDKwcEgr
	9avw1kKw4Fyws0qa4j93yfXr9Fk34Y9F93ua4DGrW7Aw1UKrs8XayDtF1Sya4kGr4vkrZx
	JrZYgF4S9r1I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbg4S3UUUUU==
X-Originating-IP: [1.193.36.172]
X-CM-SenderInfo: t0xrmlytwzmkqyzxqiywtou0bp/xtbC0wThv2oyBuQgPwAA3s
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_193124_315880_D09824BE 
X-CRM114-Status: GOOD (  10.59  )
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

From: xuchenchen <xuchenchen@kylinos.cn>

The ARM IPI lines in /proc/interrupts print the IPI label separately
from the per-CPU counters. The first counter is printed with "%10u",
which only provides a leading space while the value is less than ten
digits.

Once the counter reaches ten digits, the output can become:

  IPI0:1234129290 ...

Keep a fixed separator after the IPI label so the first counter is
always separated from the label, matching the arm64 output format.

Signed-off-by: xuchenchen <xuchenchen@kylinos.cn>
---
 arch/arm/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index b5fb4697b..721c5f9f9 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -551,7 +551,7 @@ void show_ipi_list(struct seq_file *p, int prec)
 		if (!ipi_desc[i])
 			continue;
 
-		seq_printf(p, "%*s%u:", prec - 1, "IPI", i);
+		seq_printf(p, "%*s%u: ", prec - 1, "IPI", i);
 
 		for_each_online_cpu(cpu)
 			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
-- 
2.47.3



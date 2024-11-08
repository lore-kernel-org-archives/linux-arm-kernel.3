Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBB3D64064
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7FpHp6rlDKoP0Ri9BqBvPwPNV0yczBNLLM78zWCyTw4=; b=Lo2Ng4heaiX+TLcYfHNO/mBPaf
	L2g+YlT8zQIaeg++3ADBvT+K79XIQnZNUT3jTsStHJ+w0yBdetgmbsbXASY2R1URt4QJLOHwmLIsR
	YH/140RdkozzbITyloiAy7Rwf7cBbJhOyBG8pkpbJj2wd002pkBBPSP6BWNQ0mZ07UcmdIxMUlFwA
	K5OlKWtVqUihAE65/6sKcT9bqeYFrH7DOzdRxnCPXIY2tyZnxR8Il/1KSVd9KH7TeHnhRTYqx9GZm
	Jt4vrTcFeOxW9AIdj21r8ynlgAiRsq6m11qcenl6zeinm7pDE+ZaX9iinaVahUOaWDkOcYB9/wYzZ
	stqKz1eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rvz-0000000BEui-0IEK;
	Fri, 08 Nov 2024 16:34:07 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rew-0000000BAdV-2Hz6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 16:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7FpHp
	6rlDKoP0Ri9BqBvPwPNV0yczBNLLM78zWCyTw4=; b=mmYpDAM/paY1N/Wywh8n5
	v5At8vAmd/V7+ztLgwZjxDHvTIFcHyLJDsz5jVmc8E+jXnfBGV56SlVlr/1XX9/i
	7kw9LOU8KQ4N3j0seBETV30j2WghEilCa6ztCIW+NzYwfnFAxriGOFof5Gly8Vwb
	opN5kUcwwSqcTpHBLG5kKc=
Received: from localhost.localdomain (unknown [111.35.191.191])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnb3NIOS5nRMtXAA--.10316S4;
	Sat, 09 Nov 2024 00:16:20 +0800 (CST)
From: David Wang <00107082@163.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tglx@linutronix.de,
	David Wang <00107082@163.com>
Subject: [PATCH 06/13] arm/irq: use seq_put_decimal_ull_width() for decimal values
Date: Sat,  9 Nov 2024 00:16:03 +0800
Message-Id: <20241108161603.9725-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnb3NIOS5nRMtXAA--.10316S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry5Cw1DWrW3Xw17Wr4Durg_yoW3uFbEqr
	9ay3W8W3ySyryqvFyUuw1fJr95Aa4jvF95KasYgFW2yr1Ygw45Za90yFWSqa95Xrn3KrZ3
	J3s5JFs2vr1xKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUU6pB7UUUUU==
X-Originating-IP: [111.35.191.191]
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiMwiRqmcuKsHpagAAsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_081631_149689_13B18EA7 
X-CRM114-Status: UNSURE (   9.75  )
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

Performance improvement for reading /proc/interrupts on arch arm

Signed-off-by: David Wang <00107082@163.com>
---
 arch/arm/kernel/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 3431c0553f45..1b0680477ae1 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -551,10 +551,10 @@ void show_ipi_list(struct seq_file *p, int prec)
 		if (!ipi_desc[i])
 			continue;
 
-		seq_printf(p, "%*s%u: ", prec - 1, "IPI", i);
+		seq_printf(p, "%*s%u:", prec - 1, "IPI", i);
 
 		for_each_online_cpu(cpu)
-			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
+			seq_put_decimal_ull_width(p, " ", irq_desc_kstat_cpu(ipi_desc[i], cpu), 10);
 
 		seq_printf(p, " %s\n", ipi_types[i]);
 	}
-- 
2.39.2



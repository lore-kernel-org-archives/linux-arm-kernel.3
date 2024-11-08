Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656ACD64065
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=92qcheUV0dc6p0i85+WrrzuptWSwQKzn7BIaV0kNAAY=; b=1JncfwArM4o9YyLpVNc+EiBFxe
	dGunjb9orirmmOtBCr39jThB7jAH7K7Moc3jnuvresQWRhf/zjIJWug6IbGKqVrjo8Gxwzi0jWV1K
	h8YGaym5KpM3N+CYDKRtkxRhwkxiH7Zi4Rs2ZL/4sfXaRqeQ1vA/aTr1aSpGuUMTRwKVrSbZ5g7Rd
	N2K/4rNZ3T312i2luIGHTpVZhdLCh0nuKVDpGQhaffZkc4XhGTQH2u6H11f693BAStnL60PK/jjUo
	YBjZndZ3NToQb9SqUEPOHXtdMgfsk4FQq1KoBE5vFDO5QJ5fW0ZnHAVJM/4UazFbTio4Zzmkvpnaf
	dqFXn9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rw0-0000000BEvT-0qKg;
	Fri, 08 Nov 2024 16:34:08 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rgi-0000000BB7j-27Zq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 16:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=92qch
	eUV0dc6p0i85+WrrzuptWSwQKzn7BIaV0kNAAY=; b=EqRT1aW9aa3NPcQoWFPMI
	tyB0lPhEBb2sAM9vhhDyhHdYMt4MZRtmSodgX8vBK28pk1zs/7gpe11Flyn4ONz7
	Oj41hKsCv3ppREWwCzb91AHOem/hvwGDCKQ3jph8P6CrU4kiudwFCH8N3OZbS0DZ
	G2kECrne5hcZ8Q/ow4FNcU=
Received: from localhost.localdomain (unknown [111.35.191.191])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD33+izOS5nkKkeEA--.43507S4;
	Sat, 09 Nov 2024 00:18:03 +0800 (CST)
From: David Wang <00107082@163.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	David Wang <00107082@163.com>
Subject: [PATCH 07/13] arm64/irq: use seq_put_decimal_ull_width() for decimal values
Date: Sat,  9 Nov 2024 00:17:53 +0800
Message-Id: <20241108161753.9760-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD33+izOS5nkKkeEA--.43507S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryfAryftF1rGw4xuryfWFg_yoW3Arb_Kr
	92y3W8WrWFyryIvryDCa4ft34vka4UX3sak3WvgFWqyry3Xw45Aa98AFySgws5XrnxKrZ3
	X3s3tr1qvr1xKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sREmii7UUUUU==
X-Originating-IP: [111.35.191.191]
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hmRqmcuN-cU9QABsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_081820_998495_38183212 
X-CRM114-Status: UNSURE (   8.70  )
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

Performance improvement for reading /proc/interrupts on arch arm64

Signed-off-by: David Wang <00107082@163.com>
---
 arch/arm64/kernel/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 3b3f6b56e733..35734a30ed8d 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -844,7 +844,8 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
 			   prec >= 4 ? " " : "");
 		for_each_online_cpu(cpu)
-			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
+			seq_put_decimal_ull_width(p, " ",
+						  irq_desc_kstat_cpu(ipi_desc[i], cpu), 10);
 		seq_printf(p, "      %s\n", ipi_types[i]);
 	}
 
-- 
2.39.2



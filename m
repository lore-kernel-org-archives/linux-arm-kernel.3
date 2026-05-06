Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04828CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mHoWgooO6LwFDOsKw5fw/hDTuDIt8ZBydSJeevTUgXQ=; b=WufXz4yCYnlfSx1SE68hFJg1Sd
	aO//sp/Wm529su8JFY3akMANRmQisHUnkcQr1XNlGcqRIx/P5OIbW6XXPnz6/KNBDJ1C+bDLLaf9G
	DNjjzdnb06CNZAtqYRqF1gBG/esWNHkwBkkZ+xQ9+bvbQRQDkk1IMibuisSoXnPaPytqeeLduKU7J
	k+wYHIbTjuIm6X/YtE7O278XmAObX/jEThk2x4JK+3eBVOqtySBjjmzwHPb1T+gCMrhsysy/WsWHK
	5qKDpNjft5PO7tgGrOTZmMWv+zxK6tLQiZUYnbauFkzqSiLBQpdKyhA8Jn/37C/uFudErZS4yJOX2
	auJ9NRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYFl-00000000IfI-2q00;
	Wed, 06 May 2026 09:09:14 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYFj-00000000IdQ-2lyz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:09:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=mHoWgooO6LwFDOsKw5fw/hDTuDIt8ZBydSJeevTUgXQ=;
	b=kVpojNc1+OR2hfPzRXO3xd4wlchgzmH6Osv3ivAS5YAElWVZx1wKi2FmZwFQox6wBCSYRZLSk
	ZJF7Ua1YfXUP6NPDEurO5BwtVmr9zH7G5/nJD3+p2683a3YVhdmAAjrAE7/2eag401n7nGwTMSB
	yRtgc/yhhkj8IWAIRlFGO7Y=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4g9Ts53JmDznTbg;
	Wed,  6 May 2026 17:01:45 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 468C540571;
	Wed,  6 May 2026 17:08:52 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 6 May
 2026 17:08:51 +0800
From: Pengjie Zhang <zhangpengjie2@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>
CC: <maz@kernel.org>, <timothy.hayes@arm.com>, <lpieralisi@kernel.org>,
	<mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<zhanjie9@hisilicon.com>, <zhenglifeng1@huawei.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <linhongye@h-partners.com>, <linuxarm@huawei.com>,
	<zhangpengjie2@huawei.com>, <wangzhi12@huawei.com>
Subject: [PATCH v3] arm64: smp: Do not mark secondary CPUs possible under nosmp
Date: Wed, 6 May 2026 17:08:51 +0800
Message-ID: <20260506090851.1858467-1-zhangpengjie2@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemr200004.china.huawei.com (7.202.195.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_020912_203329_BF2C1D4B 
X-CRM114-Status: GOOD (  12.65  )
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

Under nosmp (maxcpus=0), arm64 never brings up secondary CPUs.

smp_prepare_cpus() already treats this as a UP-mandated boot and returns
before marking secondary CPUs present. However, smp_init_cpus() may still
enumerate firmware-described secondary CPUs and mark them possible before
that point.

Avoid marking secondary CPUs possible when nosmp/maxcpus=0 is in effect,
so that cpu_possible_mask reflects the nosmp boot policy for this boot.

Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
---
Changes in v3:
- Tone down the changelog
- Add Catalin's Reviewed-by tag.
Link to v2:https://lore.kernel.org/all/20260423134654.4178271-1-zhangpengjie2@huawei.com/

Changes in v2:
- Drop the arch_disable_smp_support() approach.
- Handle nosmp/maxcpus=0 directly in smp_init_cpus().
- Update the changelog accordingly.
Link to v1:https://lore.kernel.org/all/20260422095831.2926775-1-zhangpengjie2@huawei.com/
---
 arch/arm64/kernel/smp.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..1b63846f646a 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -745,15 +745,21 @@ void __init smp_init_cpus(void)
 	else
 		acpi_parse_and_init_cpus();
 
-	if (cpu_count > nr_cpu_ids)
-		pr_warn("Number of cores (%d) exceeds configured maximum of %u - clipping\n",
-			cpu_count, nr_cpu_ids);
-
 	if (!bootcpu_valid) {
 		pr_err("missing boot CPU MPIDR, not enabling secondaries\n");
 		return;
 	}
 
+	/*
+	 * For the nosmp/maxcpus=0 case, do not mark the secondary CPUs
+	 * possible.
+	 */
+	if (!setup_max_cpus)
+		return;
+
+	if (cpu_count > nr_cpu_ids)
+		pr_warn("Number of cores (%d) exceeds configured maximum of %u - clipping\n",
+			cpu_count, nr_cpu_ids);
 	/*
 	 * We need to set the cpu_logical_map entries before enabling
 	 * the cpus so that cpu processor description entries (DT cpu nodes
-- 
2.33.0



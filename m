Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7723CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hTXv0nvgR3f6dAOnwVqmFC5yuwSOexIzoY7bs030Cw=; b=R8Wt+2jjb5eblfvxhnosfAO4Ds
	DjKPxIfGziY9FtOE4mccwUp+zd85GCL7CUJEz91iyp4C/kDtDN1ztkKpict3sZE4HXMQVepykymP2
	ks5+U/QNZwaBtdWUKmNbjGvzbx2t38H11Vwnc9AWNpYMYFr9O/GfMJ6LpixNLtUKxC/QPz3Fusqow
	Q3xSPKKzQ1wQFkHmKag0u5U1EkT6vEEBgBV5JWAhAZaFYOgqJDhhR8usifU3OKJ7w5ZxnjoNl0xsF
	wIIcvK9JivoXzBHUCzkgmZTKOVbLRwJiztHA9g4n+RbOEjyd66RF68MXL7sTTHgMnwmU1FzDLLysz
	19fAt6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Fn-0000000AhLy-2ryh;
	Fri, 26 Jun 2026 07:45:35 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Ff-0000000AhHt-3H4w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:45:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8hTXv0nvgR3f6dAOnwVqmFC5yuwSOexIzoY7bs030Cw=;
	b=kodSg9mJAW5czQGG0LUdtaVlAzOfyDUrKZB7/A7gvGSEnTSoUsDszyNnv0CG98zeGE/0g0tB1
	PQdql/EA2d5n49ozAWyKDcxAIWfdwrcHgNRajhtYq/FKi77pA+4QiWyjcJqoExKD+YwlQMcuIb4
	hzKE9X77tWdQrJiyyaCxbsE=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gmnXj5cwSzmVCS;
	Fri, 26 Jun 2026 15:36:05 +0800 (CST)
Received: from kwepemo200010.china.huawei.com (unknown [7.202.195.178])
	by mail.maildlp.com (Postfix) with ESMTPS id 7FB644056C;
	Fri, 26 Jun 2026 15:45:12 +0800 (CST)
Received: from huawei.com (10.44.142.85) by kwepemo200010.china.huawei.com
 (7.202.195.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 26 Jun
 2026 15:45:12 +0800
From: Qi Xi <xiqi2@huawei.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Morton
	<akpm@linux-foundation.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Yuanbin Xie <xieyuanbin1@huawei.com>, Nanyong Sun <sunnanyong@huawei.com>, Qi
 Xi <xiqi2@huawei.com>
Subject: [PATCH v3 2/2] ARM: mm: protect show_pte() in do_DataAbort() fallback path
Date: Fri, 26 Jun 2026 15:30:48 +0800
Message-ID: <20260626073048.3595106-3-xiqi2@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260626073048.3595106-1-xiqi2@huawei.com>
References: <20260626073048.3595106-1-xiqi2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.44.142.85]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemo200010.china.huawei.com (7.202.195.178)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_004528_108573_09705F3D 
X-CRM114-Status: GOOD (  11.68  )
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

The do_DataAbort() fallback path handles FSR types not serviced by
do_page_fault() (fsr_info entries with fn=do_bad). This path also
calls show_pte() without holding mmap_read_lock, exposing it to
the same use-after-free issue.

Since do_DataAbort() is an exception entry point that can be reached
from contexts where sleeping is not allowed, use mmap_read_trylock().
If the lock cannot be acquired, the page table dump is skipped.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Suggested-by: Yuanbin Xie <xieyuanbin1@huawei.com>
Signed-off-by: Qi Xi <xiqi2@huawei.com>
---
 arch/arm/mm/fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 1f2a85e1fa..0a8fc40afe 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -638,7 +638,10 @@ do_DataAbort(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	pr_alert("8<--- cut here ---\n");
 	pr_alert("Unhandled fault: %s (0x%03x) at 0x%08lx\n",
 		inf->name, fsr, addr);
-	show_pte(KERN_ALERT, current->mm, addr);
+	if (mmap_read_trylock(current->mm)) {
+		show_pte(KERN_ALERT, current->mm, addr);
+		mmap_read_unlock(current->mm);
+	}
 
 	arm_notify_die("", regs, inf->sig, inf->code, (void __user *)addr,
 		       fsr, 0);
-- 
2.33.0



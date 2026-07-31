Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B541C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=icEicBnXsM+x26h2VKFWEjbrrN+Lj3ZZBvhAxYrzkL0=; b=E58BCf4VsIQDO57unG8KkJSAHY
	C6CCtyhLNGg4qu4zuawlrZzngc2UkffkhZvckn2G9RUcrD8WT89XPYYfHcNIqcbJWtEYmEU779vQl
	bXltnj2dITcS3EPMhca7EIQWVc/in9pS4uhA9LoK5yu3Q4wOrGxTw+DScidbQejOG6BvPDyTkgIS8
	hTrdIN5+bdp7V2sNGNrzeqnRBg7MlkAt9o5J4Go/msUjckRqnYUTx0/l3ZH8lMYbiuiF7twYwfxvM
	VYlPzWh5TgGk+NNfXvsiwn/Xzcm/9HNkb6mMskTezGisrH7oaI35yUXa+lsXkK4gpgmw0JO4kyeiw
	tNgkOboA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmKw-0000000CTWt-3X2S;
	Fri, 31 Jul 2026 12:27:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmKu-0000000CTWB-3MJB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 12:27:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE689204C;
	Fri, 31 Jul 2026 05:27:28 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A6523F86F;
	Fri, 31 Jul 2026 05:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785500853; bh=whmntDUlnCFeByNnMqaBNzeQz1h2hfs8kWdf3IvJDQc=;
	h=From:To:Cc:Subject:Date:From;
	b=IfCNjsea3z9nEN2w2GrRaob3j2s2Y9IV4Lixfxk8XLOauVZg08at6HuZfd0ewb5q+
	 SJ8QpgEJeqAfWqGiZdryLPywjYDDEi2kMcI1yAbZgi9ZxoRH4M1/XmJiTjT5Et3vhk
	 R7e0AoDpbg/LnKWv7O290yM1RA3jiiXJmEW4ty+U=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com
Subject: [PATCH] arm64: smp: Fix IPI teardown for GICv5 flow
Date: Fri, 31 Jul 2026 13:26:46 +0100
Message-Id: <20260731122646.84682-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_052736_975369_94688904 
X-CRM114-Status: GOOD (  10.37  )
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

Sashiko reported that during CPU offlining, __cpu_disable() is
executed by the stopper thread via take_cpu_down() with local
interrupts disabled. __cpu_disable() calls ipi_teardown(), which
invokes ipi_lpi_disable(). For the GICv5 flow, this eventually calls
the sleepable disable_irq().

This can be reproduced easily with CONFIG_DEBUG_ATOMIC_SLEEP=y by
offlining a CPU:

  BUG: sleeping function called from invalid context at kernel/irq/manage.c:702
  in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 20, name: migration/1
  preempt_count: 1, expected: 0
  no locks held by migration/1/20.
  irq event stamp: 186
  hardirqs last  enabled at (185): [<ffff800080b084c8>] _raw_spin_unlock_irq+0x38/0x68
  hardirqs last disabled at (186): [<ffff8000801f8e08>] multi_cpu_stop+0xc8/0x190
  softirqs last  enabled at (80): [<ffff8000800c48b8>] handle_softirqs+0x410/0x468
  softirqs last disabled at (75): [<ffff8000800102f4>] __do_softirq+0x1c/0x28

Fix this by using disable_irq_nosync() instead, which is safe in this
atomic context.

Fixes: ba1004f861d1 ("arm64: smp: Support non-SGIs for IPIs")
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index cdcdd160e5b6..3ab90aa24efb 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1086,7 +1086,7 @@ static void ipi_teardown(int cpu)
 				disable_percpu_irq(ipi_irq_base + i);
 			}
 		} else {
-			disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, i)));
+			disable_irq_nosync(irq_desc_get_irq(get_ipi_desc(cpu, i)));
 		}
 	}
 }
-- 
2.34.1



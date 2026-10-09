Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8A2CA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nmcl3acLOdghIcVWJGQcNUT1dxt+y4UDcmDoxuevzy8=; b=pe5y5hS+6Knt+DFJAlMSqWHxbK
	qpH4UiDk634YLEl1MELj8rM4hZjxUssQVAU4UM5bqj+Lq+7C4JDBDw/dQrykdqtgX1vaB7YbSuH4E
	v7YjdLCYFSTAw/Fm7O4CHuEkmuvCEK2hZ3OvKwLpZRIrhhuYNmS4CJ8Kq8368tJ3pdyCI4VMJpGyE
	ifzywmd+zd+lWAYhWyiLdkqM86q3kFfk+BeuFRTYFAK0QwREvBD8SURUkRs3iOI3Z/jc59aIaK4nx
	7LPOsgy3I0H4KocQ3EHHZFxxABFm6VD7hxXWc9DkK+njHt/CrUhgrISdCYtclsf7KPdLdGi2GfjmH
	w9CUKIgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7W5-00000005ypa-103m;
	Fri, 09 Oct 2026 10:07:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7W4-00000005yox-0cjg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:07:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30F1A60DBD;
	Fri,  9 Oct 2026 10:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92A41F00893;
	Fri,  9 Oct 2026 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540470;
	bh=Nmcl3acLOdghIcVWJGQcNUT1dxt+y4UDcmDoxuevzy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KOQvmO+cNIRV/YyuucnkVz9UG5LzNGDqnaVyRUMTsdkrXSJ8Fmzny2YgV2PDIB6+m
	 0uWHPbFLAEtjvO9ZBI14iLjFnyycNHnPy9IBDCUZtTR9t+DC3r8tpZwUm8NSgOPkNU
	 HPhj/vecc6HUAprhbE394HHGweNe+YxrdyhmvM8CAJjOzHscZZQ5IyCj/OHQX/KLed
	 DAdR8KXvnhgw0ssXcFwYVzh3eYwxbQStAR+GWKNLAUpWJjiqqIpfgDYz7JSrmK8Rb+
	 nYXjdXqaWwKNf7Pa+3ELyzZbOkVw9mXAGMZJ2S2LE2UaPWc5DJf13IUtl3Zzbkt5df
	 LjldAEUGNy8pg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 01/23] cpu/hotplug: Clean up cmpxchg() logic in cpuhp_can_boot_ap()
Date: Fri,  9 Oct 2026 11:07:12 +0100
Message-ID: <20261009100738.31288-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

cpuhp_can_boot_ap() uses atomic_try_cmpxchg() to transition the sync
state of the incoming CPU to SYNC_STATE_KICKED. However, this is
unnecessary if the state is SYNC_STATE_DEAD, since there will not be any
concurrent state modifications, and also if the state is already set to
SYNC_STATE_KICKED.

Restrict the use of cmpxchg() to the case where the existing state is
SYNC_STATE_ALIVE.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 kernel/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..198c929c452a 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -408,22 +408,22 @@ static bool cpuhp_can_boot_ap(unsigned int cpu)
 	switch (sync) {
 	case SYNC_STATE_DEAD:
 		/* CPU is properly dead */
+		atomic_set(st, SYNC_STATE_KICKED);
 		break;
 	case SYNC_STATE_KICKED:
 		/* CPU did not come up in previous attempt */
 		break;
 	case SYNC_STATE_ALIVE:
 		/* CPU is stuck cpuhp_ap_sync_alive(). */
+		if (!atomic_try_cmpxchg_relaxed(st, &sync, SYNC_STATE_KICKED))
+			goto again;
 		break;
 	default:
 		/* CPU failed to report online or dead and is in limbo state. */
 		return false;
 	}
 
-	/* Prepare for booting */
-	if (!atomic_try_cmpxchg(st, &sync, SYNC_STATE_KICKED))
-		goto again;
-
+	/* Continue with booting */
 	return true;
 }
 
-- 
2.56.0.385.gd3acb90ef8-goog



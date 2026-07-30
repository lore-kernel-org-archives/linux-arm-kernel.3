Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5DEC55165
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 00:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VaTnS7hpKSnUBmqbq1FB7m+uUqcITQ9K46RYljTmrSY=; b=utXgDgoRMlXMUdsMyH2XNfiFon
	Mg31sVlMByJBq6Y+x1v6P0HQFuIGJiF5mZOXqzemNiXlvW/jZsRFVR1uhwC84G572Q4y58n1GtpCh
	xUURv805LB0mhwf3qAZFnVL+2twA6ue9N1xG4nJve6Y+NVlVItooaYYzeknlgI3QArslUaiv6Ez7V
	YQtvyHHHF/4sAG4xfa4oL8cFR95pBYoSEFc0bpXxjWD1DE+N4+QTTsMTZIG+DF5vNdR9S1D8gvmkI
	KXQGFey2T0dw4yNuRM45TeCzlkBkhsWqciUkwipmCHyISSwRkqTG7YumDNhZhjLZprdeF/d1BggxY
	7v88MRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpafQ-0000000BWni-0ULH;
	Fri, 31 Jul 2026 00:00:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpafP-0000000BWnY-0NJL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 23:59:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25ABE600C8;
	Thu, 30 Jul 2026 23:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00541F000E9;
	Thu, 30 Jul 2026 23:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785455997;
	bh=VaTnS7hpKSnUBmqbq1FB7m+uUqcITQ9K46RYljTmrSY=;
	h=Date:From:To:Cc:Subject:Reply-To;
	b=GR8G/zlhI7SxGQsYTJDPxdA5ln6BwFc8VhdE7eb1c0uIIKON9nmkoCeMYz46AI5cI
	 5hIfLO0CV+nILSEDG5mBOlWDDmn9XYFVPKLaNlHYq0gU1j7+X8ffOW6mFAv1JLpH07
	 ae5q38MYuHGuB1qgHF7DryVOZ+qVDHHgTzMlTP1vqlRr189XkOyNq2bT3UyjMf3FRb
	 D1/e0ZYFO90mzNZFof44bzebbTr6LD6STCAYOZHuS0+2YIiefTf+bVH0CMRMoIpy1Z
	 lmgs6PnuhSx9vIXlQneilfgWlkxFH5Qx5+O0B4tRVPa7JnoNl1aeFQAziYSfLov+Ax
	 9psxR6CWVMR2A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 97864CE0F69; Thu, 30 Jul 2026 16:59:57 -0700 (PDT)
Date: Thu, 30 Jul 2026 16:59:57 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] arm64: Mark set_preempt_need_resched() access to
 .need_resched
Message-ID: <d345dc9f-c61e-4db5-a342-11b0ff3fb846@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The .need_resched field can be accessed from both task level and
from interrrupt handlers, so apply WRITE_ONCE() to the update in
set_preempt_need_resched().  This also brings arm64 in line with s390
(which uses atomic operations) and x86 (which uses inline assembly).
Other architectures avoid this issue via the empty definition in
include/asm-generic/preempt.h.

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: <linux-arm-kernel@lists.infradead.org>

---
 preempt.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 932ea4b6204289..610853da140a78 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -28,7 +28,7 @@ static inline void preempt_count_set(u64 pc)
 
 static inline void set_preempt_need_resched(void)
 {
-	current_thread_info()->preempt.need_resched = 0;
+	WRITE_ONCE(current_thread_info()->preempt.need_resched, 0);
 }
 
 static inline void clear_preempt_need_resched(void)


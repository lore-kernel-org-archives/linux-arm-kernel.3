Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FFBC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NgBjIEID6QEhIkoB2QsEvwX/Fvm/Oh4imRgw1L0n/cg=; b=wbGLBFGmBIsRVu
	tQkrELJYjZdLk/RTianhGsCp17gpO42m104yaH4MMySrjAF6wTrQIcbSXqu1NYsGhhOCVh+RFAs7x
	cH5sCQ9CmqXQUWsacXDmt3i9ZM2UY8XJhWwJmZpz/E9IKP3UghnYNw+UPFDgFBKKFy0IQc5E0/Osx
	FeP0LUHMTpxeCEhap8ayOLcygYEJ9vs8wxDbGzGDP6ETmSyAqc7C5MT8bldEwKTnIogCiOq2SexQk
	RMKDvZFMIbBbRtDQtda7TTIEpTonDNn1WbxoMHEpyunyOiqQ/J8o6mgieWTm/BuRQ3vtPxlYXFc3L
	yPFYWXcOSR8ihMN+qD1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xhj-00000009Ti6-3goz;
	Tue, 08 Sep 2026 15:25:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xhi-00000009ThH-185i
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NgBjIEID6QEhIkoB2QsEvwX/Fvm/Oh4imRgw1L0n/cg=; b=kF9oO0BZnCETL8PSYEM/mESXCw
	4RnoPxUaS6uH77fy/tGC2uqV7SUgD0RPP/1Av9N5seyEp3Xvn9HNvMG9H2PzdRQRYjYTcvkFLP509
	bcLjPMhIhCi1Np7OgNb9KhzWNN+4IzCCayksr9foo2w7/Ii6sLAMDl6++5tSjIGaJouykJ5NpkSEj
	huETaVwZ+ATchBBZTOITw6Ign/CAk3gnY/KK6WCNbsKQhHieg87i3caJRp969GMWTxow/QnVU1V8V
	qAiKdU5NeCe1VMX/LROJy7mozeFZR+mlOPJGG7+wKSSyHjm7r4SOTsz77BvrhcwY7jL2OhmDJGoAu
	tpxS+9+g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xhf-000000001A7-1REM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:25:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A0C21476;
	Tue,  8 Sep 2026 08:25:37 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 869803F7B4;
	Tue,  8 Sep 2026 08:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788881141; bh=i6uO/jj8wEknXLiLBTGSQRd6LqWzqYzc+btd1yT327U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s+0xBE/6CRaGH0qpLTGcz6Vf8rpCs4VOxSXeFNq9gzerzdF5QOfT5EHILj/bqa+LO
	 jX5opEJxvqxboS4aEVogeIE2L7X8A1nsZHXL8bzIOHgZm+/bnHXQkffAC+xCVX21F8
	 w8UL9E5VNUc0T8SztiFnqvaUCFLNwx5ssrSGlfoU=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 21/21] arm64: percpu: Remove _pcp_protect*() wrappers
Date: Tue,  8 Sep 2026 16:17:41 +0100
Message-Id: <20260908151741.394589-22-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260908151741.394589-1-mark.rutland@arm.com>
References: <20260908151741.394589-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_162543_583986_A46D183E 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Now that all this_cpu_*() operations are preemptible, there are no users
of _pcp_protect() or _pcp_protect_return().

Remove them both, along with the associated comment regarding
preemption.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/percpu.h | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 5cd98e20e825d..6ec6e212932d3 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -368,33 +368,6 @@ PERCPU_CMPXCHG_OP(x,  , 64)
 #undef PERCPU_XCHG_OP
 #undef PERCPU_CMPXCHG_OP
 
-/*
- * It would be nice to avoid the conditional call into the scheduler when
- * re-enabling preemption for preemptible kernels, but doing that in a way
- * which builds inside a module would mean messing directly with the preempt
- * count. If you do this, peterz and tglx will hunt you down.
- *
- * Not to mention it'll break the actual preemption model for missing a
- * preemption point when TIF_NEED_RESCHED gets set while preemption is
- * disabled.
- */
-
-#define _pcp_protect(op, pcp, ...)					\
-({									\
-	preempt_disable_notrace();					\
-	op(raw_cpu_ptr(&(pcp)), __VA_ARGS__);				\
-	preempt_enable_notrace();					\
-})
-
-#define _pcp_protect_return(op, pcp, args...)				\
-({									\
-	typeof(pcp) __retval;						\
-	preempt_disable_notrace();					\
-	__retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);	\
-	preempt_enable_notrace();					\
-	__retval;							\
-})
-
 #define _pcp_wrap(op, pcp, ...)						\
 ({									\
 	op(&(pcp), __VA_ARGS__);					\
-- 
2.30.2



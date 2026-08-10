Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144BEC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eiem7LBuQlQ7cxSVIkkWqhfHRGZ0GHrsJpkwoKlf1L8=; b=YHdUduzDmHBdqJPp5wx0v3A9sO
	IMxiJXerQp/rU4zwqUlg3ea+3MsYIDy8FXs4FJSfXjdJVHJJ5pLzU5oXo5ASIdgBED5gidYard+KJ
	51gLn9ZB8g155jGFOjPj8utDFg+lHqPRORQBJ01jdpMacu091cxQsJSATxiYZXKjDHZPmWxdcGeLn
	M7wo2ynPq2dnmkNHjofie4QjHsE9tcxqdHoWMubB63Vq/OjYUPdXGxXQMHghTeNXY03kkKZqZgnZ5
	dK+GHaEflJtNGz33dug40tXAQ1gOp06oTyyi7w6HVwjYnx82cAojYOdtmMVFyn+lT8UdbpMQnrZCa
	inlITs0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOPY-0000000Bea3-0qPo;
	Mon, 10 Aug 2026 11:43:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOPW-0000000BeZg-052z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 11:43:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A336040C51;
	Mon, 10 Aug 2026 11:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D07D1F000E9;
	Mon, 10 Aug 2026 11:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786362197;
	bh=Eiem7LBuQlQ7cxSVIkkWqhfHRGZ0GHrsJpkwoKlf1L8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eZp6majYjI/aUrK+Nqma3GbUetgI4bpxlVWLt9Fkm/FJVvy56+I5h18+CZrVGPhdB
	 DESfIM9Kx2ff4dMsCqa0N3l1++lnqGMKlZ7pW0ySFR34nJ3dUnPdSlnIpXuUJvFsYw
	 vzMXXr9rRAsxpA+Sn1cNCRSPlfLWraJvbMx2D7Xy2glAOEzn7EZnM5SWjTpRE++D10
	 F3DhKQCUCGpfdVioGcaJt9/kM20iI4xdKMG3kJK9uacn8k9+31oOzBX+oDv4QawevO
	 8XPLWPyiAg7OX4L9JGs8F2QMONOClF6dpE0LvsSOLSayWJ58NmanShQKCccH2F3CoL
	 6b3ORM9MW8GEg==
Date: Mon, 10 Aug 2026 12:43:11 +0100
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH RFC] arm64: entry: PSTATE_I_SET is leaking on pseudo NMI
 mode
Message-ID: <anm5T9FazACqOWXF@willie-the-truck>
References: <20260807-arm64_fix-v1-1-d069ccf9d71b@debian.org>
 <anXkO8YpoadRzm07@J2N7QTR9R3>
 <anXqMsJ14r3BAbMG@gmail.com>
 <anYHjvJ1_4dDjuzw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anYHjvJ1_4dDjuzw@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, rmikey@meta.com, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Aug 07, 2026 at 09:29:12AM -0700, Breno Leitao wrote:
> On Fri, Aug 07, 2026 at 07:58:21AM -0700, Breno Leitao wrote:
> > Meanwhile, I will try to ftrace the writes to PMR and regs->pmr to get
> > a better grasp of the states machine we are in (probably on Monday).
> 
> It seems LLM found a very easy to reproduce this:
> 
> 	bash-5.1# dmesg
> 
> 	bash-5.1#  cd /sys/kernel/tracing
> 	echo 'r:pmr vfs_read bad=+0($retval):u64' >> kprobe_events
> 	echo 1 > events/kprobes/pmr/enable

Nice, that triggers straightforwardly in QEMU for me. The diff below
(which implements my suggestion from [1]) seems to fix the issue, but
it would be good to hear feedback from one of the Arm folks.

Will

[1] https://lore.kernel.org/all/anXgWRmcjwPKG7N5@willie-the-truck/

--->8

diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
index 795b35128467..691ee5f86dbe 100644
--- a/arch/arm64/include/asm/daifflags.h
+++ b/arch/arm64/include/asm/daifflags.h
@@ -132,7 +132,7 @@ static __always_inline void local_daif_inherit(struct pt_regs *regs)
                trace_hardirqs_on();

        if (system_uses_irq_prio_masking())
-               gic_write_pmr(regs->pmr);
+               gic_write_pmr(regs->pmr & ~GIC_PRIO_PSR_I_SET);

        /*
         * We can't use local_daif_restore(regs->pstate) here as



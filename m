Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CF5E9A77A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0T7G25gttHyi4JJfvy4qefMEhkx3iGnVMQ/JRn0LNs8=; b=OZuq26HfVFIjnXANWc+WWb0i+o
	qVEFGCQlNDn7ObhDyi1tUeSdAAIG4EuLEMnvKXiMYqQu7c4nwaNFsDj5MGDT9/wQdg7rhfzs1TWIv
	tTvkgCwulH/21KGet5nT/Zv7sd4YxbOfrD9X83WLHUXY2cXNwsYxZkJ1ZdivlgbrNm3KAfg9nCjna
	XWTd3pTQSX9KcxTvI78gl5OnVAhF37ZxtwwBbSNTBxGRtt7KzdbZbX+uhCP4VF/mQnMUpUhn8rHo8
	lbfR6yBrqTV5cJetbL+ffFY0dzRoqWOHJUWvOQT9S7xZY8Ugw3eJjt61ZhZMj6BkJmE0S39xei0k2
	mnSX+N1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50jd-00000001MsH-1Stl;
	Tue, 24 Mar 2026 12:19:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50jb-00000001MrI-1WfV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:19:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FDD2414FD;
	Tue, 24 Mar 2026 12:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31093C19424;
	Tue, 24 Mar 2026 12:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774354786;
	bh=UPwEhZktdDhfBTsb4YwZNe31JCGeYvYHoQFX536I8HM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SomJb9LW/zHZ2RPPe2bRDZQScvPH1LKo3AlvubCT6bJsl/jI09qjbeYzs0pVoMyA2
	 ixpEq26N/8zKXvJD4JhoCJK1OZvunXtQl0Ow2v46aKOfJ8NSS4l5F1KwGypKyJTr0U
	 MYIxsiJ4e09HIZWClSmmKhCJvtGYEQDE7omGkQJh7TcDcFPLa2H0HP0uOL8o6HKxcg
	 iT+nG8vepz8Ko6M5/3fHH6/p5QYavcA5HqtVlElhkdTJQdh6TVw5XURHeZy9c5730U
	 7fNGKqeE3tJ0xutTqR9SYIx4Lkeh5t3opZRnO+kNIYd+s7sMiGv0ZaGmo4E5IPvnFN
	 KJG81m34OrAeg==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
In-Reply-To: <87fr5six4d.ffs@tglx>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com> <87eclek0mb.ffs@tglx>
 <ab1prenkP-tFgUzK@J2N7QTR9R3.cambridge.arm.com> <87341ujwl4.ffs@tglx>
 <ab2EZAXvL6bYcuKt@J2N7QTR9R3.cambridge.arm.com> <87fr5six4d.ffs@tglx>
Date: Tue, 24 Mar 2026 13:19:42 +0100
Message-ID: <87se9ph129.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_051947_445691_1FE1985E 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Mar 22 2026 at 00:25, Thomas Gleixner wrote:
> On Fri, Mar 20 2026 at 17:31, Mark Rutland wrote:
> Looking at those details made me also look at this magic
> arch_irqentry_exit_need_resched() inline function. 
>
> 	/*
> 	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
> 	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> 	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
> 	 * DAIF we must have handled an NMI, so skip preemption.
> 	 */
> 	if (system_uses_irq_prio_masking() && read_sysreg(daif))
> 		return false;
>
> Why is this using irqentry_enter/exit() in the first place? 

Ah. The entry point does

          if (regs_irqs_disabled(regs))
          	do_nmi();
          else
                do_irq();

So you end up in do_irq() and eventually in the preemption path and need
that check to prevent scheduling. So that should be fine and obviously
won't hit the code path I outlined.

Thanks,

        tglx






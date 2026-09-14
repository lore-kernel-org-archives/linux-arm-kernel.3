Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAECC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/lIyD0eJYyLLShpR2PrbSShwpZ11/bDU2WwZJxxg5g=; b=PXShU/kPncqkt+ur2ayKEJi9Gc
	t/qmdYAUSDdQDgqSpDDGOyhnJS0MfLgqM5FZGbTd1IzrmnNcNtPQm0vob7B2KpvX4e3h6eAGbSs9u
	Kpg9AibkgouZ7Wzf2ANwpWPn5gqJFvTvoGIcKoyc/yVTmM/F4ZzvTisNkGYeBRWUtB5jV4hdmU2PC
	x3fSmxvrILbF1qHhOgZsTL8sCxRkInsX1IGmtzwnUCuG9rPwzrQd/AVS368av3WExYc7YeoeliCsP
	DzBEbODAEUSNXkkVozsfw2g+3B+mTp3UzF2A+60lusQUeB8BzTSHJsj9b6Oadtsso89k3LKZpHTlE
	jqCa9RWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x659J-00000003N8N-0czz;
	Mon, 14 Sep 2026 11:47:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x659H-00000003N7t-2S7N
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 11:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k/lIyD0eJYyLLShpR2PrbSShwpZ11/bDU2WwZJxxg5g=; b=VPvi9CQ0iLIJ9++Sna1MZm6Jj5
	mdNWw198BGb2L/0ZKSclGf80KxDVQWuY4P69MnnkW0pGH+SFLDJ0NGHWuPqUtEMFandO5bIUUn/dK
	i4Noaj7daYRThxSqv61cKnbONHGxizpp4ToSlsfr4cSDWZtU8VNiHf0bXpZgD8PB5XZbyc20l2Eei
	GOaQq2y2hrffh+4prEjBkW9rYX2IMmK1GiVLnqoIN4yspmEZlQaOrC/gzu7+m/3YnBBJpHIpnSXML
	fkJUVqkZObRRxM8cLes6AzDMtHRv5uzAJb3L/o3OrbZjA3gF0vFqDri9pBDwuf5h32CtlZaaBSa5Q
	a79iP6mQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x659F-00000005YjP-1fsB;
	Mon, 14 Sep 2026 11:46:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 59D9830066A; Mon, 14 Sep 2026 13:46:56 +0200 (CEST)
Date: Mon, 14 Sep 2026 13:46:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com
Subject: Re: [PATCH 04/15] x86: implement thread identity handoff
Message-ID: <20260914114656.GC3500130@noisy.programming.kicks-ass.net>
References: <20260911154148.644489-1-axboe@kernel.dk>
 <20260911154148.644489-5-axboe@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911154148.644489-5-axboe@kernel.dk>
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

On Fri, Sep 11, 2026 at 09:40:54AM -0600, Jens Axboe wrote:

> +/* state bound to the task that neither side may have */
> +static bool thread_handoff_task_ok(struct task_struct *tsk)
> +{
> +	/* I/O permissions, the bitmap hangs off the task */
> +	if (test_tsk_thread_flag(tsk, TIF_IO_BITMAP) || tsk->thread.iopl_emul)
> +		return false;
> +#ifdef CONFIG_X86_USER_SHADOW_STACK
> +	/* the shadow stack is per-thread and would have to move along */
> +	if (tsk->thread.features & ARCH_SHSTK_SHSTK)
> +		return false;
> +#endif

Distributions are having this enabled, this means nobody will pass this
check.

> +	/* only the default sized FPU state gets copied over, no AMX */
> +	if (x86_task_fpu(tsk)->fpstate->is_valloc)
> +		return false;
> +	return true;
> +}


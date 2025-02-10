Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72439C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxapaJhXMHi1dkamuCkDcE4Mfsv6fMSJ0gziQn4ozoY=; b=VjklhVLBds9gZFNdtgfBkQqvYf
	1g0MujNaELyFDIerk07MEpzAjDJqHAl34p7iwSm7oRm8VbBkFmKu3rqUesW5vczKlwn/TpXLtL8iF
	eRoQxI4kd1Shsv9sDsSTG8kNybwKGqCv+U9az4WVXnm3sI8F9aIAKTfNLW570iKPrM7wsnEGbh6zR
	a/vEZOZeaggSBigJszLAg2mV82NJ1duN02Usyg7b2RUnnCgyl3VJGh8ONL2J8tADxPBmIb0BcWj1i
	mlEu8Vzr/bCHff4hzHP1//PxHiUK1F5qKnm3PED0S9PkKTz7h+39VT9WxWS1/pAznOY6efw+1Ztar
	E2cTX9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSjL-0000000HMzg-0d95;
	Mon, 10 Feb 2025 12:17:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thSXV-0000000HLFR-0yK0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 12:05:26 +0000
Date: Mon, 10 Feb 2025 13:05:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739189123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DxapaJhXMHi1dkamuCkDcE4Mfsv6fMSJ0gziQn4ozoY=;
	b=yEagp+lj2TIOwbHUOA0f1F+2J7YuakUp9/683voOGACDtw5iab8Hxq30Z3lr8Ey5xJ+KVN
	YfY94NlB7UIsJPauWBo0YCLLg85EfKgKDa0GPgsLErZ/vZpN32kqRyAVo8CUPHOkttEXSG
	bEspGEXqx06jsskW4WRmLwZY/X2xr/eVB29h9ubx6cIh7qr0tyjcfXkgfClZhIyoQaBSKo
	vRnBee3pfKmXG9GsEJdnQKIfrWWveU0CZSLGYtCusOgDA4xG27xLV31BAf0i+ophSGGUns
	B2Yqp1CZ5IP7umiaDeol1opT88F3keAsUddHJfpddRuh7raExBrOhVI8JtPmgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739189123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DxapaJhXMHi1dkamuCkDcE4Mfsv6fMSJ0gziQn4ozoY=;
	b=FcGSnRX7Qd+JKTQZTRBam/OwH+Xede4wWJLiVQmU4YICNlc4o/NxAPgGbqcjkWOnjJpTS9
	bH9aLXxMNl3sC0AA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/9] arm64: Rely on generic printing of preemption
 model.
Message-ID: <20250210120522.VvikzMr_@linutronix.de>
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-5-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203141632.440554-5-bigeasy@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_040525_415708_8338C70D 
X-CRM114-Status: UNSURE (   6.46  )
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

On 2025-02-03 15:16:27 [+0100], To linux-kernel@vger.kernel.org wrote:
> __die() invokes later show_regs() -> show_regs_print_info() which prints
> the current preemption model.
> Remove it from the initial line.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Is it okay, to route this via the sched tree?

Sebastian


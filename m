Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100F1CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 13:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZhH5AHrfy26M2dOTX3cXLGBKgESbaWXilRYPg8VS4w=; b=INXYFMX6d+VQ99uSVtjVKUh9E4
	MXgI3p8YQk6PQGhDnDa33qRWFdj5lXswfotMVhZvvwF6P1QRMerjhL+RumIcP65ahgIlg45uBLc9b
	b+Le1wbIrQ/ZrARV2si/5nQZ46ENN216slnI2Uhg2Zom8wtrUTfxRIFFqGbB/+RjHG1BibFUlozxS
	yoUZiHnp638bUYvpLil9nkks7en8/sBEeCI1UhzLUvqsCgS0eAs7k+24hna1I9X5xs18CzJt/gcJl
	nOcCuhR1WFKIUiMLsZ/EJbTffU+805xjHiMUGlsu+4/DH5wrTH+ZSBX4kJaOrOqs5/zD4Im+uawQE
	eRhoJ7bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHiff-000000038aP-1bAN;
	Sat, 08 Nov 2025 13:07:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHifa-000000038a2-21Or
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 13:07:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B0CED60052;
	Sat,  8 Nov 2025 13:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E95EC4CEF7;
	Sat,  8 Nov 2025 13:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762607271;
	bh=i7HXPTYeK+e+Jl5vz+u8MqxdLo1lCA/B25zaKUgWUkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7D+tM5kRH+NjazgLU1QcpEGK3MSiun+xEIGRss4cHMEJkPH+dAAG9aWL0+Ni/kzp
	 tdgB8qNQ/5v8GCWh/yvzGxkmtXcLRIZPeEurA0js5LUFoZR/s/5Ql1kIfFWoAFIXVa
	 7xLE/8CefNRlBnOVhFRWSP5mkIpzN3q4JwW7x6qPwc216NOTGhKbv1gs9U492MMFl+
	 UCXxdzRBNa+58S/xIxPrtUkKQK8lKxoE467ijgeeYg/uJItdpy0C+EzqiY7umw00zf
	 L7lketTeGJhxeWsBRGZjEYkqlMumv2nPYEWkrMiQTtzV98m6hmshhuMkN38ko+wC/O
	 jEl8eGclEP93w==
Date: Sat, 8 Nov 2025 13:07:45 +0000
From: Will Deacon <will@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	rostedt@goodmis.org, Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 15/16] srcu: Optimize SRCU-fast-updown for arm64
Message-ID: <aQ9AoauJKLYeYvrn@willie-the-truck>
References: <bb177afd-eea8-4a2a-9600-e36ada26a500@paulmck-laptop>
 <20251105203216.2701005-15-paulmck@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105203216.2701005-15-paulmck@kernel.org>
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

Hi Paul,

On Wed, Nov 05, 2025 at 12:32:15PM -0800, Paul E. McKenney wrote:
> Some arm64 platforms have slow per-CPU atomic operations, for example,
> the Neoverse V2.  This commit therefore moves SRCU-fast from per-CPU
> atomic operations to interrupt-disabled non-read-modify-write-atomic
> atomic_read()/atomic_set() operations.  This works because
> SRCU-fast-updown is not invoked from read-side primitives, which
> means that if srcu_read_unlock_fast() NMI handlers.  This means that
> srcu_read_lock_fast_updown() and srcu_read_unlock_fast_updown() can
> exclude themselves and each other
> 
> This reduces the overhead of calls to srcu_read_lock_fast_updown() and
> srcu_read_unlock_fast_updown() from about 100ns to about 12ns on an ARM
> Neoverse V2.  Although this is not excellent compared to about 2ns on x86,
> it sure beats 100ns.
> 
> This command was used to measure the overhead:
> 
> tools/testing/selftests/rcutorture/bin/kvm.sh --torture refscale --allcpus --duration 5 --configs NOPREEMPT --kconfig "CONFIG_NR_CPUS=64 CONFIG_TASKS_TRACE_RCU=y" --bootargs "refscale.loops=100000 refscale.guest_os_delay=5 refscale.nreaders=64 refscale.holdoff=30 torture.disable_onoff_at_boot refscale.scale_type=srcu-fast-updown refscale.verbose_batched=8 torture.verbose_sleep_frequency=8 torture.verbose_sleep_duration=8 refscale.nruns=100" --trust-make
> 
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: <linux-arm-kernel@lists.infradead.org>
> Cc: <bpf@vger.kernel.org>
> ---
>  include/linux/srcutree.h | 51 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 48 insertions(+), 3 deletions(-)

I've queued the per-cpu tweak from Catalin in the arm64 fixes tree [1]
for 6.18, so please can you drop this SRCU commit from your tree?

Cheers,

Will

[1] https://git.kernel.org/arm64/c/535fdfc5a228


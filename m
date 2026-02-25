Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27257FD45F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 22:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IR0GC/jchphP9j9Xo53UEXdnn2YKN/sSiihx46NdjDk=; b=U3PRnKTtiiB+6rQ/A6i2lM/KnL
	Dz3YJAJt9llDtilKQN5j6ccRpeaBlxJlRrIMY16yeir7JoGVRpiYp7DmwwqXAlzsmjQqgUzmd0TWm
	CfcOnmxB4lt/GcA8TW1odK0INy8BYDnaLKCpVtd5wTTehfhsbEHVHqPsakJ99+tHPdKNyYVLxVW5h
	FCd0gP3AnrxER2zoyBS0VqceLbCsTbE0zdEYr1DrZ9amar3vIt05tRu2+rLkahTai6Yo6P1MFX/5U
	jw0tNQX324YE9PaeAixTiazzdaBboMtdjfPR8iIUxDATOd6T+vGF/09AQvwm7yLHd7+kgbIAtEr0b
	TF4vfEog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNBL-00000004yfD-3YVH;
	Wed, 25 Feb 2026 22:16:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNBL-00000004yf6-0YRG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 22:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3138E60054;
	Wed, 25 Feb 2026 22:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D32C116D0;
	Wed, 25 Feb 2026 22:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772057793;
	bh=tEgYXcuadwgc0jGOrrazjHEeJPSuoYBMFjqz54qNa/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTDbjccJ47OQeIWWdMJl7YmAu/C1rTnsih7/vny6eesQcQVAy3AkFkRKSG0xQW3YX
	 lcCWps83dlR5fzCPH+dWrbLhDM8QI1SgMsrZPSKbrV1vFPJi1DOkrFYmqeNbAMwwVZ
	 6OxUwiKgG7UEav1S4RZW3qArTuFFDD26pS+/8W/iZAvaeT4oEq6m4cshiDjaU4XIGA
	 YtcQ9I8xEh5AleeUoHOKjrGSqyt9uedgK/7BZmXCqGYvPo+NKbV+cxsToyhHyIE6RK
	 tO8g/Hf7TgWQQTkTrCWOiH9lXOuEs4VgY9rcHnjd03sad6nou02AxhZM3+hJy2MAsH
	 AH1PMiB+2856w==
Date: Wed, 25 Feb 2026 22:16:27 +0000
From: Will Deacon <will@kernel.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: Marc Zyngier <maz@kernel.org>, catalin.marinas@arm.com,
	zhanjie9@hisilicon.com, zhenglifeng1@huawei.com,
	viresh.kumar@linaro.org, rafael@kernel.org, beata.michalska@arm.com,
	pierre.gondois@arm.com, ionela.voinescu@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, bbasu@nvidia.com
Subject: Re: [PATCH v2] arm64: topology: Fix false warning in
 counters_read_on_cpu() for same-CPU reads
Message-ID: <aZ90u4HrDh1N7ylK@willie-the-truck>
References: <20260224092714.1242141-1-sumitg@nvidia.com>
 <86ecma9gb5.wl-maz@kernel.org>
 <bdd6a7bc-0b7d-405d-99a7-a11eebaf627a@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdd6a7bc-0b7d-405d-99a7-a11eebaf627a@nvidia.com>
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

On Wed, Feb 25, 2026 at 05:08:03PM +0530, Sumit Gupta wrote:
> On 24/02/26 23:25, Marc Zyngier wrote:
> > But I'm more concerned by the overall pattern of doing these things in
> > random contexts. Going back to the original patch (997c021abc6e) that
> > states:
> > 
> > "However, this deferred update mechanism is unnecessary and introduces extra
> >   overhead for non-PCC register spaces (e.g. System Memory or FFH), where
> >   accessing the regs won't sleep and can be safely performed from the tick
> >   context."
> > 
> > Clearly, the AMU registers cannot be arbitrarily accessed without
> > blocking when accessed from one CPU to another, so either this
> > function is never called in a cross-cpu context (and the warning
> > should be removed), or the premises of this change are wrong.
> > 
> > Which one is it?
> 
> The function is also called in cross-CPU contexts, but only from
> process context (get_rate, sysfs show) with IRQs enabled and
> calling smp_call_function_single() is safe. In the tick path,
> cppc_scale_freq_tick() uses per_cpu(cppc_freq_inv, smp_processor_id()).
> So we always read the current CPU's counters and no cross-CPU access.
> 
> The premise of 997c021abc6e applies to same-CPU accesses only:
> Reading the local CPU's AMU regs does not sleep and is safe from
> tick context.
> The irqs_disabled() WARN is still needed to guard against unsafe
> cross-CPU calls. This also returns '-EPERM' unlike the WARN inside
> smp_call_function_single(). So we fail instead of risking deadlock.

Hmm, so why isn't this structured such as:

	if (irqs_disabled()) {
		/* XXX: Explain the tick case */
		if (WARN_ON_ONCE(cpu != smp_processor_id()))
			return -EPERM;
		func(val);
	} else {
		smp_call_function_single(cpu, func, val, 1);
	}

	return 0;

That way, the irqs-enabled case remains the same and doesn't need to
mess with preemption.

Will


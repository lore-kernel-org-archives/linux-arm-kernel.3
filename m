Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC88FD45FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 22:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKDSOT9JpycLmw0zuRvcMcs/9VtIoMUQSearWmhox9k=; b=PaYOjSvDhn+qb794KpmWIFo4Z7
	5ON7uLH6LeESPNZjP1oBN9pDNQOvcNXhAgawgVw+bBqrONJc5HgjI1VispkTMV0o0I3ai18C3/Y0i
	gNGoPTKsfOItC3tMxNAG6wGIDv5TkzA+SfoGl/42D1wbTSDTIVrI3CacTfFq40+4hH13veYCGcGLl
	p3wRfUqNS5jtPLRqYK0UzkgGUsouTLu+elmEOWSgek/BTKVzykzEAq83R8UG/DpnXhRD+OW8yr3Ft
	ZFsOdLE56BkvWBptU9Dbf9OSy9QSuv3mqk68RVbTzyue1pAZFnQop5GYfzlb0LPvTpe7JtuxIOQAh
	TL6WPvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNUP-000000050yS-2deC;
	Wed, 25 Feb 2026 22:36:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNUM-000000050yD-1N6Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 22:36:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A98860054;
	Wed, 25 Feb 2026 22:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D41C19425;
	Wed, 25 Feb 2026 22:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772058973;
	bh=4dMpk9jZRV2L4OpJP1psz2eDKkvTItd6ZbPD/pD6LcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qlKTOAOTMAWpDlNCoz3OQq5C7N2ckgTlhUJ7x39fjDvjEA3GXmu3ZlYZ/KwwK78k/
	 r0D9hwsUzoZ8X6c4q8szO467fCxbRGeC8sHI2EWO1x72TVOqWP5NXxoop59JSF5kcX
	 fx1RhGbUwshfnUNroAMHi8CfvkDOr58ppCt13v86qgZbT36MYmJ+0HZH8oczEEwmIE
	 S8DwDuQ/9fGXXyiCsh1DjaltRaBnbR1XY6+H8Pc/ZIllj8i5n1j3ssMNEN6797cknU
	 w4PR9Ry0jAsOEEzq+Oo1944YjKQwBtq24XHL54CE6u3Fh1TRYDCq2woDuaQDVZvZdg
	 lxb/0Kv/lp9XA==
Date: Wed, 25 Feb 2026 22:36:07 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Hyesoo Yu <hyesoo.yu@samsung.com>,
	Quentin Perret <qperret@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: Force the use of CNTVCT_EL0 in __delay()
Message-ID: <aZ95V8XIYYysd13m@willie-the-truck>
References: <20260213141619.1791283-1-maz@kernel.org>
 <aZw3EGs4rbQvbAzV@e134344.arm.com>
 <86ldgja5v3.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ldgja5v3.wl-maz@kernel.org>
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

On Mon, Feb 23, 2026 at 02:31:44PM +0000, Marc Zyngier wrote:
> Crucially, arch_counter_get_cntvct_stable() does disable preemption,
> and we should preserve it. Something like this:
> 
> diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
> index d02341303899e..25fb593f95b0c 100644
> --- a/arch/arm64/lib/delay.c
> +++ b/arch/arm64/lib/delay.c
> @@ -32,7 +32,16 @@ static inline unsigned long xloops_to_cycles(unsigned long xloops)
>   * Note that userspace cannot change the offset behind our back either,
>   * as the vcpu mutex is held as long as KVM_RUN is in progress.
>   */
> -#define __delay_cycles()	__arch_counter_get_cntvct_stable()
> +static cycles_t __delay_cycles(void)
> +{
> +	cycles_t val;
> +
> +	preempt_disable();
> +	val = __arch_counter_get_cntvct_stable();
> +	preenpt_enable();
> +
> +	return val;
> +}

(nit: arch_counter_get_cntvct_stable() uses the _notrace() variants of
 the preempt disable/enable helpers)

>  void __delay(unsigned long cycles)
>  {
> 
> The question is whether there is a material benefit in replicating the
> arch_timer_read_counter() indirection for the virtual counter in order
> to not pay the price of preempt_disable() when we're on a non-broken
> system (hopefully the vast majority of implementations).

That sounds nice, especially as we can assume (for now) that CPUs
implementing WFIT don't need the cntvct workarounds. However, I can't
really figure out how to implement it after reminding myself of all the
fun we had trying to use a static key for these workarounds in the past.

If a CPU being onlined has a timer erratum, we wouldn't be able to
migrate any tasks in the middle of a preempt-enabled delay loop onto
it. :/

Will


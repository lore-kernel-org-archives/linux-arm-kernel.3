Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A9CC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZUzmgr4awk2OfqDwSA49N0EKn2TsPmuSjz/m/RegPQ=; b=lRrAyeZJTEZIG3HQoBuOQiUlB8
	p4mNFt/WhUzhj4V/4uj/dtw81SLh8Ldla2Hh52Q2524hVnjtI7hghVEEhcvEGXFfQsCcgSTv/b6ls
	3eC8OXHhtQ1Dm8myTODyqCKnGbw2wHht1KO+OReiRSh6+dK3FBgzPh4rGCyA8FLN4t+8fl9WT6407
	g5lBsdn3yBoS8A/4fdRZzCYYjZrn93a/7EEriAsPBKSAuhI1g1fpPZlpZ6a3PeaSYBQwJ7Gge2WY+
	QePu2ZJx6VJz4viDnaVsx5IgjVGQcyG2feHd728EBGlM5Eqo153a+y8NS6bx0m/Qx2Rd92wb9TrvD
	Ab2j4EwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAHl-00000001fip-3XI0;
	Mon, 30 Jun 2025 08:54:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWABU-00000001efx-0sLT;
	Mon, 30 Jun 2025 08:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aZUzmgr4awk2OfqDwSA49N0EKn2TsPmuSjz/m/RegPQ=; b=m/eEcyjRCcdugCM6rkkWkm7M93
	Bx47kBqlwjxKiY7ZRPwO0ae0JRCqZ2RK2a6CUwp2PvRw8KUWJ2PWp/YoQTr5waa3fXT/RMri5NDDa
	WbuxrVpQweEsW7NKXmVaHYTshttKTjSsQmcrimXo8BP6bGphzBkQJ6RlTyp4ALS2BY8pzN9Duk99i
	U6WIR68onUX5amQX6gworqxx2EEJSrBb2DiGAmOb2YHaY1Uhw9+LC1eNsWQGbLCakAk+0niEUUiPB
	COFY3kJzQuzlQRLI8PUhBKbYXo3RcMp/KG72P8IpTZnK4352WcANip9rX+88H1vvLIRn7ZiPQttZk
	KH/EtBdA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWABO-00000003Ktl-0L60;
	Mon, 30 Jun 2025 08:48:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EAADD300125; Mon, 30 Jun 2025 10:48:08 +0200 (CEST)
Date: Mon, 30 Jun 2025 10:48:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	James Morse <james.morse@arm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Rahul Bukte <rahul.bukte@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>,
	Shinya Takumi <shinya.takumi@sony.com>
Subject: Re: [RFC PATCH] kernel/cpu: in freeze_secondary_cpus() ensure
 primary cpu is of domain type
Message-ID: <20250630084808.GH1613376@noisy.programming.kicks-ass.net>
References: <20250630082103.829352-1-shashank.mahadasyam@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630082103.829352-1-shashank.mahadasyam@sony.com>
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

On Mon, Jun 30, 2025 at 05:20:59PM +0900, Shashank Balaji wrote:
> On an x86 machine, when cpu 0 is isolated with "isolcpus=", on initiating
> suspend to memory, a warning is triggered, followed by a kernel crash. This is
> on a defconfig + CONFIG_ENERGY_MODEL kernel:

> This happens because in order to offline the last secondary cpu, i.e. cpu 1,
> build_sched_domains() ends up being passed an empty cpumask, since the only remaining
> cpu (cpu 0) is isolated. It warns and fails, after which perf domains are
> are attempted to be built, which crashes the kernel. The same problem occurs
> during cpu hotplug, but that was fixed by
> commit 38685e2a0476127d ("cpu/hotplug: Don't offline the last non-isolated CPU").
> 
> Fix this by ensuring that the primary cpu, the last standing cpu, is of domain
> type, so that build_sched_domains() is not passed an empty cpumask.
> 

> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
>  kernel/cpu.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index a59e009e0be4..d9167b0559a5 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1902,12 +1902,28 @@ int freeze_secondary_cpus(int primary)
>  
>  	cpu_maps_update_begin();
>  	if (primary == -1) {
> -		primary = cpumask_first(cpu_online_mask);
> -		if (!housekeeping_cpu(primary, HK_TYPE_TIMER))
> -			primary = housekeeping_any_cpu(HK_TYPE_TIMER);
> +		primary = cpumask_first_and_and(cpu_online_mask,
> +								housekeeping_cpumask(HK_TYPE_TIMER),
> +								housekeeping_cpumask(HK_TYPE_DOMAIN));

That's terrible indenting, please align after the opening bracket like:

		primary = cpumask_first_and_and(cpu_online_mask,
						housekeeping_cpumask(HK_TYPE_TIMER),
						housekeeping_cpumask(HK_TYPE_DOMAIN));

Also, IIRC HK_TYPE_HRTIMER is deprecated and should be something like
HK_TYPE_NOISE or somesuch. Frederic?

> +		if (primary >= nr_cpu_ids) {
> +			error = -ENODEV;
> +			pr_err("No suitable primary CPU found. Ensure at least one non-isolated, non-nohz_full CPU is online\n");
> +			goto abort;
> +		}
>  	} else {
> -		if (!cpu_online(primary))
> -			primary = cpumask_first(cpu_online_mask);
> +		if (!cpu_online(primary)) {
> +			primary = cpumask_first_and(cpu_online_mask,
> +								housekeeping_cpumask(HK_TYPE_DOMAIN));

Indenting again.

> +			if (primary >= nr_cpu_ids) {
> +				error = -ENODEV;
> +				pr_err("No suitable primary CPU found. Ensure at least one non-isolated CPU is online\n");
> +				goto abort;
> +			}
> +		} else if (!housekeeping_cpu(primary, HK_TYPE_DOMAIN)) {
> +			error = -ENODEV;
> +			pr_err("Primary CPU %d should not be isolated\n", primary);
> +			goto abort;
> +		}
>  	}
>  
>  	/*
> @@ -1943,6 +1959,7 @@ int freeze_secondary_cpus(int primary)
>  	else
>  		pr_err("Non-boot CPUs are not disabled\n");
>  
> +abort:
>  	/*
>  	 * Make sure the CPUs won't be enabled by someone else. We need to do
>  	 * this even in case of failure as all freeze_secondary_cpus() users are


Also; doesn't the above boil down to something like:

	if (primary == -1) {
		primary = cpumask_first_and_and(cpu_online_mask,
						housekeeping_cpumask(HK_TYPE_TIMER),
						housekeeping_cpumask(HK_TYPE_DOMAIN));
	} if (!cpu_online(primary)) {
		primary = cpumask_first_and(cpu_online_mask,
					    housekeeping_cpumask(HK_TYPE_DOMAIN));
	} 

	if (primary >= nr_cpu_ids || !housekeeping_cpu(primary, HK_TYPE_DOMAIN)) {
		error = -ENODEV;
		pr_err("Primary CPU %d should not be isolated\n", primary);
		goto abort;
	}

Yes, this has less error string variation, but the code is simpler.


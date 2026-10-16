Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3989CCCF2C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 21:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yyDzOBMSD5wdNS8DHMru0KPEHgSFgzy5ujz0evy5Po=; b=FqayZPNdD/MVo5hNJzQA0ubFeE
	h3f3233UQxbEhghwkOFObkLIkO7ZhfaHvzTU6orEateTMz3TCgavCQeLnJVhi8EUvdVbZxhv9FNHx
	qIwOeaiTCO+tJ2TGHHlz4utKiwwYhefeQvA6ftsq6vCPjGMINXPi1fYlPVdpI83LlT7+Kv2Nm9/CX
	wkw9cD0rvlvaksqxLUxYowsFsKVhpv8WLlNo7LKA+aYVAQ4hXLsyfZySRmUDjMteCnj4n7Aj/LZrf
	GTOcZThpMQPS98b1NYqDMFhEBZwSS0xJPyBX1j+eVu1fEi6YFjLUR6Co9d/ukciOgoIaRSF1b4S2h
	XIzdpFgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpra-0000000487r-1SgC;
	Fri, 16 Oct 2026 21:53:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHprZ-0000000487l-1n1l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 21:53:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4B7E4081C;
	Fri, 16 Oct 2026 21:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46F71F000C4;
	Fri, 16 Oct 2026 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792187595;
	bh=9yyDzOBMSD5wdNS8DHMru0KPEHgSFgzy5ujz0evy5Po=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nwC2iZd/0l8zgQPbx+jIENTjighTql5B+zHMFX8fQQL7ECVJB5x2XpABtoroCpFBV
	 T0W9Ak7Ckxbhhrijm4qxD33o2YRQc6YoKHTbs054u3QVyuHajMOmVMIMKmCyiCibhe
	 dIfw+Le9BrWYeJHuNNlVRzYgE5RD849yyAt7PaVvHRUKviJV1bDaNxuEJfYHqgJW0e
	 TIEgtj4EEijI+bE5P3YJ+2KKNdZIf0Qn1WS3FJ30g0+bjGKALs1zTXwjUVrXwygjy1
	 5ULkTOGMB5ALB5SHXP6dAW7nOyZzQPPD3z5Gw6FKoDIkyE3h2TqXaoOB5E9AyECJFX
	 Fjh8V1XDXTmKw==
From: Thomas Gleixner <tglx@kernel.org>
To: salil.mehta@opnsrc.net, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, James Morse <james.morse@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland
 <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Yicong Yang
 <yangyicong@hisilicon.com>, Jonathan Corbet <corbet@lwn.net>, Gavin Shan
 <gshan@redhat.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, Salil
 Mehta <salil.mehta@opnsrc.net>
Subject: Re: [RFC PATCH 1/2] cpu/hotplug: Skip disabled CPUs in
 cpuhp_smt_enable
In-Reply-To: <4ca071f1678acd1d3b8ecc0266938f59b45f629a.1790692295.git.salil.mehta@opnsrc.net>
References: <cover.1790692295.git.salil.mehta@opnsrc.net>
 <4ca071f1678acd1d3b8ecc0266938f59b45f629a.1790692295.git.salil.mehta@opnsrc.net>
Date: Fri, 16 Oct 2026 23:53:12 +0200
Message-ID: <874ielcnxz.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, Sep 29 2026 at 19:41, salil.mehta@opnsrc.net wrote:
> From: Salil Mehta <salil.mehta@opnsrc.net>
>
> The CPU enabled mask describes whether a present CPU may currently be
> brought online. cpuhp_smt_enable() is an online operation, but currently
> walks all present CPUs and only filters CPUs that are already online or
> belong to offline NUMA nodes.
>
> This can make it attempt _cpu_up() for a present CPU which firmware has
> not enabled and which has not yet been registered as a CPU device.
>
> Use the enabled mask for the policy decision it was introduced to
> represent. This keeps present-but-disabled CPUs out of the SMT bring-up
> path while still allowing registered offline SMT threads to be brought
> back online.
>
> Present and enabled are separate generic CPU states, so callers which
> intend to bring CPUs online should not assume that every present CPU is
> enabled.

The 'enabled mask' was introduced two years ago to deal with the ARM64
oddity of present, but disabled CPUs, which nobody else needs. So yes,
it's generic in some sense, but that's not the argument to be made here.

The argument is that present CPUs might not be set in the enabled mask
and therefore cannot be brought online.

> Signed-off-by: Salil Mehta <salil.mehta@opnsrc.net>
> ---
>  kernel/cpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index b3c8553d7bd6..988b7a1e8298 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -2706,8 +2706,9 @@ int cpuhp_smt_enable(void)
>  	cpu_maps_update_begin();
>  	cpu_smt_control = CPU_SMT_ENABLED;
>  	for_each_present_cpu(cpu) {
> -		/* Skip online CPUs and CPUs on offline nodes */
> -		if (cpu_online(cpu) || !node_online(cpu_to_node(cpu)))
> +		/* Skip online/disabled CPUs and CPUs on offline nodes */
> +		if (cpu_online(cpu) || !cpu_enabled(cpu) ||
> +		    !node_online(cpu_to_node(cpu)))

Seriously?

What's wrong with the obvious one-liner:

-  	for_each_present_cpu(cpu) {
+  	for_each_enabled_cpu(cpu) {

That would be too self explaining, right?

But that change is only a small subset of the overall story because now
the hotplug core looks at enabled mask in one place while all the other
places still utilize present mask.

With your second patch, that will then try to bring up present, but
disabled CPUs in bringup_nonboot_cpus(), which might be a silent fail or
not. The other instances which use present mask are probably silently
skipped due to the hotplug state.

Just because you did not observe a warning due to that does not mean
it's correct.

Thanks,

        tglx




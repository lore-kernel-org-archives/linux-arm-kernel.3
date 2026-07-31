Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53C6C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mui2xF2dMnnZlOxVw1sqBdljvZlHXe1/8LY8aJH8dmE=; b=NSPz6IR45gdS4nu/w7QF9VGEaA
	YD6UnLgaW7hi0SzeJi1IbyX/rXihIBA75Ux7q9E/ioDnudpSl/1qr/6nOYGLsCBFpDyIqmv0wZTvt
	0itqdgTd6cK4iDgoUNpsyJRH5u3+80OGs4Q87lZ1dgFxqSZxqV26E4DpSmqK1lEwFxnRo4gQKrq1G
	DkPUCp4P3YCZ60oWxDcluATr66hukYmO5zJHNpW1ZpwP8RFZcMOCbv7KGqcQuNyAVjAEpUP56Uagu
	OIs3XJzxU27OVUe4bfz9abnugTnosXjHcnNhAE3nzoTkiUw1s1nN4JaKua3tLKnSwns8wz5lZj+v7
	sQVbX2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqRP-0000000DBKB-1zmm;
	Fri, 31 Jul 2026 16:50:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqRO-0000000DBJp-1id0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:50:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA5E06004E;
	Fri, 31 Jul 2026 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549B51F00AC4;
	Fri, 31 Jul 2026 16:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785516631;
	bh=mui2xF2dMnnZlOxVw1sqBdljvZlHXe1/8LY8aJH8dmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ktjZOL+33rXXoNXWdQqK2fF+kEpvn/4+xFqH3E0+OSfLdgMRayoVE8HPAiD/0Karr
	 yxtT9894SpC0LShGmt6g9XJXdKJQPfCV0cuHdDBygmrBcRE0DgcJM0dCd/5M7sol8k
	 5tVBuhXOhBWHpqVTtQ5LbRcaD/orXFdLQQJyDoQ3EcyyyJeCEvzon3AIhWhQQKTTNj
	 Xc3QE15C1ZsD3SS/RKpaBggJFUk5LmkjgcTah1CxRfwHBYH/wfYCG1b/b8tfZ3lMD0
	 XNGOGsNL7PIchyyR/56hNkPJud9nAEFwZSqlB4B60u40U02tvfPAOrzoZIfr6hlwjO
	 R6PEda4JvZLjw==
Date: Fri, 31 Jul 2026 17:50:22 +0100
From: Will Deacon <will@kernel.org>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 04/11] arm64: errata: Require Apple IMPDEF PMUv3 traps
 on all CPUs
Message-ID: <amzSTp3cUCMuwJKf@google.com>
References: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
 <20260710-hybrid-v8-4-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-hybrid-v8-4-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
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

On Fri, Jul 10, 2026 at 08:14:58PM +0900, Akihiko Odaki wrote:
> KVM relies on ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS as a system-wide
> precondition for PMUv3 emulation on affected Apple CPUs. A local CPU
> erratum is too weak for that: once the workaround is enabled, a late CPU
> that misses it may still be onlined.
> 
> Make the workaround an all-early-CPU capability instead. The matcher is
> still local because it depends on MIDR_EL1, but the capability is only
> advertised if all early CPUs match, and late CPUs that miss it are
> rejected once the capability is enabled.
> 
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>  arch/arm64/kernel/cpu_errata.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 476a37c82108..14ce49d693c4 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -964,7 +964,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  	{
>  		.desc = "Apple IMPDEF PMUv3 Traps",
>  		.capability = ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS,
> -		.type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
> +		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,

I always get tangled in knots with this code, but does this correctly
handle the case where the boot/early CPUs don't have the impdef PMU
feature but late-onlined CPUs do? I'm not sure we configure the traps
correctly in that case but this is all gloriously undocumented.

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA68F43858
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6COPqGXbaqKONW8X95/t0Pgb5xKez/81zzvYJ4sL8A=; b=M+uTtbqn2BTR1w11oN3QThIZae
	NJ34ntOyQPGVsQZXKwAfgZv9lvvgB0eXUoTpimwuD7RlYTTdlxe7t8il3bp66oOHqrElaCOp0Cefn
	0O8cQeSraFcoXuH6pAyRI/jRGsHuNQRfBvDq65MMeZ/sVJCRayrkuQpI8kbCuTlVUOTtoFw+6LFFX
	66t2yoiNiVkumouBVj0ntwIgJ8TCnQHCPVa3RecJRLerxunZ4cnu9oKTNdvdY0BDCua+MG8QVtnLF
	zs1QUQ3YWZK87VST7huDuTM+YbPzmPDru0LFS5pMxra7EJv4w/cs/r1fxAL/nELoxvonXuC1mvv2K
	+XhbfCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3iC-00000001RJG-34iG;
	Wed, 15 Apr 2026 17:07:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3iB-00000001RJ9-00I3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 17:07:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DD14600AD;
	Wed, 15 Apr 2026 17:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E10C19424;
	Wed, 15 Apr 2026 17:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776272853;
	bh=cwyf8hZxxUGu9QdYRmfp09nFYPrHgswGFAE/Az+ruTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SOkhDavTIKavJA+7PKwXlO3FgEyhKoO9T1p7eLABatD1jYcNDmDYoyH5DMCahRL97
	 sbUuBLM7HwRlBdRZAmTOHpYrwsNDbKofwvxcYnOkCFJijWRLBqU3WBIhKBJUyvNDsi
	 w2T5pEz4dVeturZDaW1gp/taOURPUDge01ssf1bSWOX191O85D8y7TjOZtfNJZYqdQ
	 aZi961Q0QOkOYPWdYZcsbFihRwNORRa9baBXqal03p01X22fxCjXAQvrNmwgXgFxU7
	 KQk6MB3OwU4Mr/b3ZQgjD3pswLyoASN5TDxAk3Kj5TGY0fM9NeMVDe8tmwHyT60yBh
	 mfHZ1Q6/2CUUQ==
Date: Wed, 15 Apr 2026 18:07:29 +0100
From: Will Deacon <will@kernel.org>
To: Brian Ruley <brian.ruley@gehealthcare.com>
Cc: Russell King <linux@armlinux.org.uk>, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: fix race condition on PG_dcache_clean in
 __sync_icache_dcache()
Message-ID: <ad_F0YXDx2g_Zb7R@willie-the-truck>
References: <20260414113919.782-1-brian.ruley@gehealthcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414113919.782-1-brian.ruley@gehealthcare.com>
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

On Tue, Apr 14, 2026 at 02:39:18PM +0300, Brian Ruley wrote:
> This bug was already discovered and fixed for arm64 in
> commit 588a513d3425 ("arm64: Fix race condition on PG_dcache_clean in
> __sync_icache_dcache()").
> 
> Verified with added instrumentation to track dcache flushes in a ring
> buffer, as shown by the (distilled) output:
> 
>   kernel: SIGILL at b6b80ac0 cpu 1 pid 32663 linux_pte=8eff659f
>           hw_pte=8eff6e7e young=1 exec=1
>   kernel: dcache flush START   cpu0 pfn=8eff6 ts=48629557020154
>   kernel: dcache flush SKIPPED cpu1 pfn=8eff6 ts=48629557020154
>   kernel: dcache flush FINISH  cpu0 pfn=8eff6 ts=48629557036154
>   audisp-syslog: comm="journalctl" exe="/usr/bin/journalctl" sig=4 [...]
> 
> Discussions in the mailing list mentioned that arch/arm is also affected
> but the fix was never applied to it [1][2]. Apply the change now, since
> the race condition can cause sporadic SIGILL's and SEGV's especially
> while under high memory pressure.
> 
> Link: https://lore.kernel.org/all/adzMOdySgMIePcue@willie-the-truck [1]
> Link: https://lore.kernel.org/all/20210514095001.13236-1-catalin.marinas@arm.com [2]
> Signed-off-by: Brian Ruley <brian.ruley@gehealthcare.com>
> ---
>  arch/arm/mm/flush.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/flush.c b/arch/arm/mm/flush.c
> index 19470d938b23..4d7ef5cc36b6 100644
> --- a/arch/arm/mm/flush.c
> +++ b/arch/arm/mm/flush.c
> @@ -304,8 +304,10 @@ void __sync_icache_dcache(pte_t pteval)
>  	else
>  		mapping = NULL;
>  
> -	if (!test_and_set_bit(PG_dcache_clean, &folio->flags.f))
> +	if (!test_bit(PG_dcache_clean, &folio->flags.f)) {
>  		__flush_dcache_folio(mapping, folio);
> +		set_bit(PG_dcache_clean, &folio->flags.f);
> +	}
>  
>  	if (pte_exec(pteval))
>  		__flush_icache_all();

Thanks, Brian:

Reviewed-by: Will Deacon <will@kernel.org>

Will


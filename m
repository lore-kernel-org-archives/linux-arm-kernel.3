Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07119CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxX3hQocOTBV8FguER13SKKoJ+OvS3C5Ts1Mp8RLFzw=; b=SeOgiMSTllj+seuw+xpOZiNaUe
	2LnABq+LMldRznHcv9MZdqNYqmfFdTrVPsGiASa1dz7tbpbEXAh3ivVgAR57DkoT6yBXZBCx17+GR
	Q9bbOLCKQRwk3KOJJSK528CyEqRbZEXiSXFle3qTn6p/HbAgoXYC7cnivx6J/U5thVwaWrOj7yifl
	alVRtWMLqv+OG36kT1X5StzCrvathbxOCwTOMfgz6ybfXemMeN7eAKdeG4HNLKE/JmTswjXVfwLJC
	f5yACZqcChnmMGLFABMTVF4hfd90JyHRQFxd0gJcBdEe5UpsCQPprpsPP4HkDBZ7ocpDmTXSBwFsV
	f7TquaVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJKn-0000000C8RB-0Mo4;
	Tue, 04 Nov 2025 15:52:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJKj-0000000C8Qa-3i0z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:52:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D7E3434BC;
	Tue,  4 Nov 2025 15:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11ABC4CEF8;
	Tue,  4 Nov 2025 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762271553;
	bh=FptEc2MZwx9dNjeyW235y8KQvDpvs5UTFR4T5099nDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eP7/zdJvv5oA4eUAgZBZfROBTPXF0AGhszclDFsQ9K36ZL7UguMIlkB9mIDX1jLXD
	 pj0fC9D4Y4vCJ3b2jRzRGeE7sRRDzImAiiGHtnq150lheDex1fxcm/jUOXEgMT5Ipr
	 6DpZ+VVmfMmRKUpR94XtptTkkrl+UtU94P3S1B4H+m070ssZFKhzk7gD618oXALPOQ
	 MvCD/IRI8Gu/24TW93pwKCWwEq5Z4JW0mE4y1i7p/7kWO5Ue9Pqz8D67HHacjhdRKd
	 JBG6rsQnEKRflR067gAcTc6rzTM1xWFgSfnRfdM0HDD8iGKTqPvmFBYjJwrY9QvuEQ
	 ceQme3cb4Tc1w==
Date: Tue, 4 Nov 2025 15:52:27 +0000
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Pierre Gondois <Pierre.Gondois@arm.com>,
	Sami Mujawar <Sami.Mujawar@arm.com>
Subject: Re: [PATCH v4 resend 3/7] arm64/fpsimd: Don't warn when EFI
 execution context is preemptible
Message-ID: <aQohO07DpxlriQfJ@willie-the-truck>
References: <20251015205634.3820870-9-ardb+git@google.com>
 <20251015205634.3820870-12-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015205634.3820870-12-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_075233_944150_2E29609A 
X-CRM114-Status: GOOD (  18.66  )
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

On Wed, Oct 15, 2025 at 10:56:38PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Kernel mode FP/SIMD no longer requires preemption to be disabled, so
> only warn on uses of FP/SIMD from preemptible context if the fallback
> path is taken for cases where kernel mode NEON would not be allowed
> otherwise.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/kernel/fpsimd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index e3f8f51748bc..3d848c89604e 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1934,11 +1934,11 @@ void __efi_fpsimd_begin(void)
>  	if (!system_supports_fpsimd())
>  		return;
>  
> -	WARN_ON(preemptible());
> -
>  	if (may_use_simd()) {
>  		kernel_neon_begin();
>  	} else {
> +		WARN_ON(preemptible());
> +

Given that may_use_simd() returns false on systems without support for
fpsimd, I wonder whether moving this WARN_ON() actually helps with
anything. That is, you probably shouldn't be calling __efi_fpsimd_begin()
from preemptible code regardless, no?

Will


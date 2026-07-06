Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9265C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/cEfdTrJX4Mf9cEJk/e0bkaILx8pnZR7bB5XN7kzuc=; b=TwJQWIqjx3TSbdvV0R08Cb6k06
	nykiHJ0ZLvEMFeFywSRW5SaUJe+AAQ9+cGwOF9Xl0SrfHmFHRSC6S3OsCM1qvzm+3dQ6bF50ekSsm
	T/IPCB4PlpwHkJ7LV/79LnjiMFR7M/4C2THP+tbSvPcs4i0cb2SgJextaAB51v3Pl7KJv8FotP60+
	T/aAiFaX7EpAGIgLQ1v0gLz2UpyAV8Dz09kjwWe/3JnAQd5xIyCYd+IQecfVa6EmTYq0WiQJrUH+l
	iP4WeUs+tXiNUC2HrJjBMyuENYTihNMjqKB1c6RgiZ72b6bQPy/biXGeiz9UEiMtn88Fk4+ax1x1y
	DgdlBeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnJX-0000000DEDc-2WyF;
	Mon, 06 Jul 2026 17:41:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnJV-0000000DECo-3bP8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:41:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 585DB429F5;
	Mon,  6 Jul 2026 17:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E77D1F000E9;
	Mon,  6 Jul 2026 17:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783359661;
	bh=r/cEfdTrJX4Mf9cEJk/e0bkaILx8pnZR7bB5XN7kzuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Do1Iqi9Tj5uD8+kkbkxEKdyzXHqw4nrZQkoq37XGzdvFHeaQyUWf8ib9xJpx7QXni
	 v8t+9IiCIG+BANMBAT84JNSz06KP5kG4iUJEA4D48/5Z/YhuTN1IamXHKpmTlLvh6s
	 Rgq1agqvciTzbhmeY1IkkQI0ySbW6kchsWqK0MXRtEaB5I2MzuQgHwSgNXvi2BE/OV
	 KqudW7MbCdbmvkwY6YCBeSzxM+eJu9V7Fz0l/TR0/Tgq2UGwQa7+BNrWyxKMSAwU/J
	 J6nCGMV6oXm4sakDNiNOFaVTOahFnD5BBgKR0D2iTwznLwoja4AKskaaX5kIaR2FmQ
	 3Zsp8ims2y00A==
Date: Mon, 6 Jul 2026 18:40:50 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, tsbogend@alpha.franken.de, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, peterz@infradead.org, kees@kernel.org,
	nathan@kernel.org, linusw@kernel.org, ojeda@kernel.org,
	david.kaplan@amd.com, lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, thuth@redhat.com, menglong8.dong@gmail.com,
	oupton@kernel.org, yeoreum.yun@arm.com, miko.lenczewski@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org,
	yangyicong@hisilicon.com, tabba@google.com, osandov@fb.com,
	arnd@arndb.de, anshuman.khandual@arm.com, david@kernel.org,
	akpm@linux-foundation.org, ljs@kernel.org, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	kprateek.nayak@amd.com, chenl311@chinatelecom.cn,
	sshegde@linux.ibm.com, thorsten.blum@linux.dev,
	chang.seok.bae@intel.com, tim.c.chen@linux.intel.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 09/12] arm64: cpufeature: Ensure atomic updates to
 system_cpucaps bitmap
Message-ID: <akvooksAvkmG971U@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-10-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624092537.2916971-10-ruanjinjie@huawei.com>
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

On Wed, Jun 24, 2026 at 05:25:34PM +0800, Jinjie Ruan wrote:
> Parallel CPU bringup allows multiple secondary CPUs to concurrently
> execute update_cpu_capabilities() during early boot.
> 
> The current non-atomic __set_bit() and __clear_bit() helpers perform
> unserialized updates on the shared global bitmap, risking data races
> and feature flag erasure.
> 
> Upgrade these operations to set_bit() and clear_bit() to ensure all
> concurrent modifications are properly serialized via arm64 atomics.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/cpufeature.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index be75e60d56ca..a1a13f3e01ed 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -3548,7 +3548,7 @@ static void update_cpu_capabilities(u16 scope_mask)
>  
>  		if (!caps->matches(caps, cpucap_default_scope(caps))) {
>  			if (match_all)
> -				__clear_bit(caps->capability, system_cpucaps);
> +				clear_bit(caps->capability, system_cpucaps);
>  			continue;
>  		}
>  
> @@ -3559,7 +3559,7 @@ static void update_cpu_capabilities(u16 scope_mask)
>  		if (!match_all && caps->desc && !caps->cpus)
>  			pr_info("detected: %s\n", caps->desc);
>  
> -		__set_bit(caps->capability, system_cpucaps);
> +		set_bit(caps->capability, system_cpucaps);
>  
>  		if (boot_cpu && (caps->type & SCOPE_BOOT_CPU))
>  			set_bit(caps->capability, boot_cpucaps);

I don't think this is sufficient. Even if we use atomic updates for the
low-level bits, the logic here which tries to avoid re-probing features
that have already been detected isn't going to work correctly if it's
running concurrently with itself.

I think the best bet is probably to move update_cpu_capabilities() out
of check_local_cpu_capabilities() and call it after cpuhp_ap_sync_alive()
when the system capabilities are not yet finalised. WDYT? That means
we'd have something akin to setup_boot_cpu_features() for the secondary
CPUs.

Will


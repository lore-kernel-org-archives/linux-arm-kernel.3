Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408D6CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s546jgp0iqWT6Pve1W0rypcIK3HLw5/RmLkOzUMqj04=; b=sAH+sao3oioJJWQymIB7J9p9RY
	fxApX+me3hk2+yT/Y5+F1ztuDp563S2x9OqSuwNcyWhC0QeyLpic17+vC/52LibQPBhi384VF51vP
	Udh0mXE1SFXNCh9z6fuvBB9P+DqU/20M2C4iH8gLdSGCl6xcGc0aw0aGDjUAoxmGDlWCSHdr5mXLk
	Z/prCIKmphQu2k9Ve3dfQL7IBYNOCaxbswC7gP+kdNYyYs3Jg7c/HWe0lyhPhs2WkOZjL6n+7o+Ce
	I9MGZmOqh0WerRGbVZkVa/DEyYIHEptedzIz6sr2TRbbIoGYPdvqN3u/UxURn8x4dcdpttxqeiAQf
	IjdbRO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFjS-00000007KLM-38Xh;
	Wed, 10 Jun 2026 10:00:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFjO-00000007KKn-0U9x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:00:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56D9625E3;
	Wed, 10 Jun 2026 03:00:12 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28C9E3FDE2;
	Wed, 10 Jun 2026 03:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781085617; bh=U2i/BzqvOeDZaVsXMtMz/mBhJTdVMdg3yMk1ZEcMUKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=awfoF/IUr5HdAybfH+nRjakt4TUakG4zQraI/8G05d6OVdbsA1VRTQG6tMuk1mmbW
	 rpMLhnpNYDG1vDF1h7K/9B60q6xKXfeaUZOMRBUfOWByxCBwQWkddeqNnm7LB73Vnq
	 igCUjDizuohrFWBWhFUgkpf14BaCN7n59D8OENOU=
Date: Wed, 10 Jun 2026 11:00:03 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>,
	Alok Mooley <amooley@nvidia.com>, Rich Wiley <rwiley@nvidia.com>
Subject: Re: [PATCH v1] arm64: errata: Mitigate TLBI errata on NVIDIA Olympus
 CPU
Message-ID: <aik1owW9Rz8B7rEz@J2N7QTR9R3>
References: <20260609234044.3945938-1-sdonthineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609234044.3945938-1-sdonthineni@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_030018_232330_9086A764 
X-CRM114-Status: GOOD (  23.32  )
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

On Tue, Jun 09, 2026 at 06:40:44PM -0500, Shanker Donthineni wrote:
> NVIDIA Olympus cores are affected by the TLBI completion issue tracked as
> CVE-2025-10263. The existing ARM64_ERRATUM_4118414 handling already uses
> ARM64_WORKAROUND_REPEAT_TLBI to issue an additional broadcast TLBI;DSB
> sequence and ensure affected memory write effects are globally observed.
> 
> Add MIDR_NVIDIA_OLYMPUS to the repeat-TLBI match list so the same
> mitigation is enabled on affected Olympus systems. Also document the
> NVIDIA Olympus erratum in the arm64 silicon errata table and list it in
> the Kconfig help text.
> 
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
> Note: This patch depends on the following series as a prerequisite:
> https://lore.kernel.org/all/20260609101203.1512409-1-mark.rutland@arm.com/

FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

I'll keep note of this when backporting the other patches; as a
prerequisite we'll also need to pick commit

  e185c8a0d842 ("arm64: cputype: Add NVIDIA Olympus definitions")

I have one minor comment below, but that's more for Catalin/Will, and
doesn't require a respin.

>  Documentation/arch/arm64/silicon-errata.rst | 2 ++
>  arch/arm64/Kconfig                          | 3 ++-
>  arch/arm64/kernel/cpu_errata.c              | 1 +
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index a01e916ede17..ad09bbb10da8 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -298,6 +298,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| NVIDIA         | Olympus core    | T410-OLY-1029   | ARM64_ERRATUM_4118414       |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 48233b54c482..c65cef81be86 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1155,7 +1155,7 @@ config ARM64_ERRATUM_4193714
>  	  If unsure, say Y.
>  
>  config ARM64_ERRATUM_4118414
> -	bool "Cortex-*/Neoverse-*/C1-*: Completion of affected memory accesses might not be guaranteed by completion of a TLBI"
> +	bool "Cortex-*/Neoverse-*/C1-*/Olympus: Completion of affected memory accesses might not be guaranteed by completion of a TLBI"

As this is getting increasingly long, maybe it's worth reducing this to
"Various" in the title, i.e.

	bool "Cortex-*/Neoverse: Completion of affected memory accesses might not be guaranteed by completion of a TLBI"

... but as above, no need to respin for that.

Mark.

>  	default y
>  	select ARM64_WORKAROUND_REPEAT_TLBI
>  	help
> @@ -1182,6 +1182,7 @@ config ARM64_ERRATUM_4118414
>  	  * ARM Neoverse-V2 erratum 4193787
>  	  * ARM Neoverse-V3 erratum 4193784
>  	  * ARM Neoverse-V3AE erratum 4193784
> +	  * NVIDIA Olympus erratum T410-OLY-1029
>  
>  	  On affected cores, some memory accesses might not be completed by
>  	  broadcast TLB invalidation.
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index fe6fe5de495b..d597896b0f7f 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -364,6 +364,7 @@ static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
>  			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
>  			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
>  			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3AE),
> +			MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
>  			{}
>  		})),
>  	},
> -- 
> 2.43.0
> 


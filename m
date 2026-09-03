Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9A1C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9DsEkBgu2jnZnRY8QQEWHZs0nZcCr7feDWc1ShWrQM=; b=ETDLS0EWBNcbXkQYCZ7QCRNNo5
	E3UmlJxK4rZZuxgehYhZfLcTh6CXaR5RTQwh1UoPzFNNxFWfAl2qSkP48H0Z962h5MZwk3pfFJy/3
	b2a+/N/vEXItbEaYcllmu51QHhPUt+Xww1x/tebGiugC+D6mHzk6YGnWPuZ5aVBEoY7toCA+74+YE
	wVtG50xxzTC+jxnCnHooftoylHS1sna0hgJTSv6XCnevqRkCOtQoPrC+aEWYzjGbUAOrNzCfraA2B
	ykVfO2NW7sGST7LU2NPvofwLN4IhbrCPbcReVsXA4cYDhjyWo1USPWxG9Oq52F9Ik0NDsaRX2ZiUy
	TsVIK/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23WL-0000000GuP1-1ZQD;
	Thu, 03 Sep 2026 09:14:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23WI-0000000GuOM-0snn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:14:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B52E51596;
	Thu,  3 Sep 2026 02:14:00 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDF103FA32;
	Thu,  3 Sep 2026 02:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788426844; bh=6jwLKj7jhYtsSX186PaK9yCDtesokapjON4y/Vc8cE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pWr0i6pJSQywxTkp4y67uTu1Uz+4OfYZRorRJvi0pLgHJR8J81nwbJUoeDUDJ01lN
	 gs+poUT8IJdSKiSw4my0FdJrFI4SIer8s1wLwlKM/GNiLPLLlPwuL4naZC7BLSWzF/
	 6XZSpSTvGCygqlsuwPJ7YWAPSD/ktcswEvNtsNaE=
Date: Thu, 3 Sep 2026 14:44:01 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	=?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH RFC v9 09/25] arm64: Enable kpkeys
Message-ID: <apk6WcSQyvPK_E6L@a079125.arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-9-743ad31b2c8f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-kpkeys-v9-9-743ad31b2c8f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_021406_322662_35268ADD 
X-CRM114-Status: GOOD (  20.58  )
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

Kevin,

On Tue, Aug 18, 2026 at 03:08:51PM +0100, Kevin Brodsky wrote:
> This is the final step to enable kpkeys on arm64. We enable
> POE at EL1 by setting TCR2_EL1.POE, and initialise POR_EL1 to the
> default value, enabling access to the default pkey/POIndex (0).
> An ISB is added so that POE restrictions are enforced immediately.
> 
> Having done this, we can now select ARCH_HAS_KPKEYS if ARM64_POE is
> enabled.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/Kconfig             | 1 +
>  arch/arm64/kernel/cpufeature.c | 5 ++++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b3afe0688919..0afa085c66be 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2202,6 +2202,7 @@ config ARM64_POE
>  	def_bool y
>  	select ARCH_USES_HIGH_VMA_FLAGS
>  	select ARCH_HAS_PKEYS
> +	select ARCH_HAS_KPKEYS
>  	help
>  	  The Permission Overlay Extension is used to implement Memory
>  	  Protection Keys. Memory Protection Keys provides a mechanism for
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9a22df0c5120..4f2f54007ed6 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -76,6 +76,7 @@
>  #include <linux/kasan.h>
>  #include <linux/percpu.h>
>  #include <linux/sched/isolation.h>
> +#include <linux/kpkeys.h>
>  
>  #include <asm/arm_pmuv3.h>
>  #include <asm/cpu.h>
> @@ -2463,8 +2464,10 @@ static void cpu_enable_mops(const struct arm64_cpu_capabilities *__unused)
>  #ifdef CONFIG_ARM64_POE
>  static void cpu_enable_poe(const struct arm64_cpu_capabilities *__unused)
>  {
> -	sysreg_clear_set(REG_TCR2_EL1, 0, TCR2_EL1_E0POE);
> +	write_sysreg_s(POR_EL1_INIT, SYS_POR_EL1);

May be we could move this to __cpu_setup. Please see comments on Patch 8.

--
Linu Cherian


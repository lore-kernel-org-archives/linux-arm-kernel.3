Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D44C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAupuGMWxI3BIublkrMGY5qPHKlqE3R3CwjlxU34SdQ=; b=JnKAcDLbin+ZVEuBgMnjcq1HXo
	ZuB0f7mYBZeIQ9xVRAtxebyPFY6OohB4i1i69Faf4uaOk6us3EVC8ygivBMlFL/ohpD847O7x++wj
	zRLFbPBOGDTOTaq7DJ4POUvQBimsU9yWaKoUqcbrMPQX4QDLkauQFjvzY7DzNb+wOsxQO89fIV/p1
	UObQPIf+uEMpRh1xpy/Ql/T2orMnA7ruyj4oZi4HOQ8EDehdj1+CXFtCXct1wob5cwyFP0i4v+FMn
	xAnRpKzWAaDoHNBQJsv+bar9QuF/ut0qwOsqwZCwBAp7nTP3x4IuTFYmBEofEZOMF7Cz6kqDhgi89
	C4ZzKueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jP-00000006fiY-23JY;
	Tue, 24 Jun 2025 19:54:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6KQ-00000006Fod-2a43
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Jun 2025 16:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IAupuGMWxI3BIublkrMGY5qPHKlqE3R3CwjlxU34SdQ=; b=gw7hY3XQ8oKpELe2A6tq43ldUg
	7k2sstq08ibtrL7tyT2qU+uHQF03m7L5a4ZoT7WZvDGYlymhAURns5eaf8tB52hAnDtqtThLEcBfI
	k1kV1jTUwIAYGxXthuiTJA6QDRmK8Te0PwYebSWBERO3Q9Vmpdi1wDP6P+ITJewd0LyAeXPwJt6Sq
	gx6zu3wnwRV18kQm4ZClyNIWxXSC24X9yL2d6K9hvkiYYnWQpM4lITZ8gkwqXCa1rZnQFaPmhse19
	w/0pF3TKMprDBYI09ygqtIBrq0S+9DN9jh48WH0KNJQd/zfojppspdHDcp5rNWBHbFdy6p0K/bH/x
	FR+6Rwrw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6KO-00000005UhP-0XVb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 16:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E108A4FBB4;
	Tue, 24 Jun 2025 16:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7092CC4CEE3;
	Tue, 24 Jun 2025 16:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750781812;
	bh=8gl1rLZNofAk2fof2YGBHaM5ebdXQZzyZfIQBIqfrGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qW+iT8/rsJkuyydGDGHb8KNzu5Fem+I5+k86517u6RHxYUMT3QX+o7hLK8Qaf+v5P
	 Ucpo6f9iuC5p59VlLBER+lJwCjJ+0excGOnQEkIhR4PdLsSdZSLdxvtsIR8ERIGYJk
	 PdyGDvUBZLGO5mE2WaXTxs/YYp+Tz7zl2Mc5LjeM=
Date: Tue, 24 Jun 2025 17:16:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
	linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, Will Deacon <will@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Yicong Yang <yangyicong@huawei.com>, linuxarm@huawei.com,
	Yushan Wang <wangyushan12@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, H Peter Anvin <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 2/8] generic: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Message-ID: <2025062439-submitter-affection-324b@gregkh>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
 <20250624154805.66985-3-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624154805.66985-3-Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_171656_369815_127F61B3 
X-CRM114-Status: GOOD (  21.27  )
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

On Tue, Jun 24, 2025 at 04:47:58PM +0100, Jonathan Cameron wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION provides the mechanism for
> invalidate certain memory regions in a cache-incoherent manner.
> Currently is used by NVIDMM adn CXL memory. This is mainly done
> by the system component and is implementation define per spec.
> Provides a method for the platforms register their own invalidate
> method and implement ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION.
> 
> Architectures can opt in for this support via
> CONFIG_GENERIC_CPU_CACHE_INVALIDATE_MEMREGION.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/base/Kconfig             |  3 +++
>  drivers/base/Makefile            |  1 +
>  drivers/base/cache.c             | 46 ++++++++++++++++++++++++++++++++
>  include/asm-generic/cacheflush.h | 12 +++++++++
>  4 files changed, 62 insertions(+)
> 
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index 064eb52ff7e2..cc6df87a0a96 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -181,6 +181,9 @@ config SYS_HYPERVISOR
>  	bool
>  	default n
>  
> +config GENERIC_CPU_CACHE_INVALIDATE_MEMREGION
> +	bool
> +
>  config GENERIC_CPU_DEVICES
>  	bool
>  	default n
> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> index 8074a10183dc..0fbfa4300b98 100644
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_DEV_COREDUMP) += devcoredump.o
>  obj-$(CONFIG_GENERIC_MSI_IRQ) += platform-msi.o
>  obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
>  obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
> +obj-$(CONFIG_GENERIC_CPU_CACHE_INVALIDATE_MEMREGION) += cache.o
>  obj-$(CONFIG_ACPI) += physical_location.o
>  
>  obj-y			+= test/
> diff --git a/drivers/base/cache.c b/drivers/base/cache.c
> new file mode 100644
> index 000000000000..8d351657bbef
> --- /dev/null
> +++ b/drivers/base/cache.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Generic support for CPU Cache Invalidate Memregion
> + */
> +
> +#include <linux/spinlock.h>
> +#include <linux/export.h>
> +#include <asm/cacheflush.h>
> +
> +
> +static const struct system_cache_flush_method *scfm_data;
> +DEFINE_SPINLOCK(scfm_lock);

Shouldn't this lock be static?  I don't see it being used outside of
this file, and it's not exported.

thanks,

greg k-h


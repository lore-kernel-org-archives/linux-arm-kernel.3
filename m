Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B4EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbSifWasdA8Lr1V7BJ5flJdfB31gk5DG3a5h3H59748=; b=eYcML1ztpICLdZ2rxl3uMb/3YW
	zwOWC+az8HqRRmsoHt59/KXHD1wkO+6IRsiA2pUyi2bchJaiU9UgCxWxOu0rGImXNV5CN4LkPyNy7
	zDfb7/XyiN5B9PKBmDoZrIUaoR0rzqnIN2oHmzQKOhLkNUmggYGkjxAajFeJVixRvLNNcujOoB2O6
	8YwNVZVQhiw76TG809EyVVqiqgTuKA5K2lHp8IEOW4F/eYklWfbhLCN7PE32eMmzpsrUnSwHtHO7n
	OC7J/WGgupRqaYQbYcmGoFbl08GFJ6X7sRnJL5Ojpoob+SJ+dySWV6mi72RtVmbjbY3/jJRIgG0sw
	EAUwYXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWpi-00000009r8s-3A8p;
	Wed, 25 Jun 2025 20:35:02 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTGr-00000009MQ5-40OU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 16:46:51 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bS74s1KL9z67M9n;
	Thu, 26 Jun 2025 00:46:37 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D74631402EC;
	Thu, 26 Jun 2025 00:46:40 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 25 Jun
 2025 18:46:39 +0200
Date: Wed, 25 Jun 2025 17:46:37 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <gregkh@linuxfoundation.org>, Will Deacon
	<will@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Davidlohr Bueso
	<dave@stgolabs.net>, <linuxarm@huawei.com>
CC: Yicong Yang <yangyicong@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, H Peter Anvin
	<hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>
Subject: Re: [PATCH v2 2/8] generic: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Message-ID: <20250625174637.0000732b@huawei.com>
In-Reply-To: <20250624154805.66985-3-Jonathan.Cameron@huawei.com>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
	<20250624154805.66985-3-Jonathan.Cameron@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_094650_163146_109085A1 
X-CRM114-Status: GOOD (  16.41  )
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

On Tue, 24 Jun 2025 16:47:58 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

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

I got carried away dropping some unused headers. This needs

linux/memregion.h


> +#include <linux/export.h>
> +#include <asm/cacheflush.h>
> +

So that the following have 'previous' prototypes.

> +int cpu_cache_invalidate_memregion(int res_desc, phys_addr_t start, size_t len)
> +{
> +	guard(spinlock_irqsave)(&scfm_lock);
> +	if (!scfm_data)
> +		return -EOPNOTSUPP;
> +
> +	return scfm_data->invalidate_memregion(res_desc, start, len);
> +}
> +EXPORT_SYMBOL_NS_GPL(cpu_cache_invalidate_memregion, "DEVMEM");
> +
> +bool cpu_cache_has_invalidate_memregion(void)
> +{
> +	guard(spinlock_irqsave)(&scfm_lock);
> +	return !!scfm_data;
> +}
> +EXPORT_SYMBOL_NS_GPL(cpu_cache_has_invalidate_memregion, "DEVMEM");


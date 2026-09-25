Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC36C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 09:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mrsEnPkBHnwgGCwINq/bty1nW4Tp/FYtSArG96rxV8=; b=aFLzb02UFgYuYtVnIjai4gAS8r
	9GBxQNuO2l23rMfgmoU4X8AqPXHk/z4RSEi8sHn+mOUOGAMbrcIhXkQYlREbNPY1mlrrz08QX3wXn
	swj8qOsXLZ86K+8+j5o7nkCNxEwZlRnp6TCHVWKjOxPLP/K+/K51Uv9wiCPPs37fUUgqvRTRi597V
	ljL6PB/qR0qZBZzyGK/O+kXhqIPfOInDDfq9d6VlbKKh1ZdLbDwPxYmauumZSHMkg3v7SIXxJzx+H
	CghWur12JG9n+EAuveKSCLYnN3UHquHjb5D2ddt2mPiMu0fgWeBDD8VSYlB0+v9/Z93Qol9XLNES0
	+rkAWujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2bM-0000000D3Rn-1uvM;
	Fri, 25 Sep 2026 09:52:20 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2bJ-0000000D3RL-3Gjj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 09:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790329938; x=1821865938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c3Wlh2Q2VXVEe5gte86lqh134KXeDG/AwBNnURu4sHo=;
  b=Wvm7ib1nGzLBcpuXGfsmErQdsNkhBbWPXIgcGmLvx+qPH9iJZKZB2GPJ
   p+C0HorHJF4+cdCLvYLsQjxqZSn1gHu94OLF7tsI/5cHAchro8NPPDGGH
   9zcHdwnKoxORYMUE3bImBm0325G0VVQ54KU6cNVJo9kB0GNmmPT9tXLrn
   CNUzfSgU/Jylf3TtJ+Bxm81N3zxszuOzQGWKo0lKUm5bkvZJK17STfalv
   H5qd0LE57sZJ5BQkMi0otgOtmtbRqgEktszCIxEAkioU3XVCfSiQSRWru
   KUOxJjDGb+9hVWNzmRIi7CsLJLwdtuD9KPHqa0ADVZS1ABH4+YZfIfMAy
   g==;
X-CSE-ConnectionGUID: FkCxEdpWQD+OUMY2qk/S5Q==
X-CSE-MsgGUID: QjxI8iEKSLGM0AbGlia7QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101640040"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="101640040"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:52:17 -0700
X-CSE-ConnectionGUID: B730t5QVQ4CoaRahwCerbQ==
X-CSE-MsgGUID: SuxLZS75QH6YE12CTCZKrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273783342"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.27])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:52:12 -0700
Date: Fri, 25 Sep 2026 12:52:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RFC 04/11] clocksource/drivers/arm_arch_timer_mmio:
 Dispose IRQ mappings on probe failure
Message-ID: <arZESXn4xUJoVRss@ashevche-desk.local>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-4-2c62125d0085@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-acpi-static-table-irq-probe-defer-v1-4-2c62125d0085@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_025217_858990_7F4A1AA4 
X-CRM114-Status: GOOD (  16.20  )
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

On Fri, Sep 25, 2026 at 09:48:03AM +0200, Lorenzo Pieralisi wrote:
> On probe failure the driver does not dispose the IRQ mappings that
> were carried out before the probe function hit an error condition.
> 
> Add code to dispose the IRQ mappings on driver probe failure.

> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> ---

Same here about Cc list...

...

> +static void arch_timer_mmio_unmap_irq(int *irq)
> +{
> +	if (irq && *irq) {

Would be better to read and maintain with the negative check.

> +		irq_dispose_mapping(*irq);
> +		*irq = 0;
> +	}
> +}

...

> +static void arch_timer_mmio_unmap_irqs(struct arch_timer_mem *gt_block)
> +{
> +	int i;

Why signed?

> +	for (i = 0; i < ARCH_TIMER_MEM_MAX_FRAMES; i++) {

	for (unsigned int i = 0; i < ARCH_TIMER_MEM_MAX_FRAMES; i++) {

> +		struct arch_timer_mem_frame *frame = &gt_block->frame[i];
> +
> +		if (!frame->valid)
> +			continue;
> +
> +		arch_timer_mmio_unmap_frame_irqs(frame);
> +	}
> +}

-- 
With Best Regards,
Andy Shevchenko




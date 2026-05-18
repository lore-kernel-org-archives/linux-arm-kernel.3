Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99816CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArlsmiOfKzo8EBsGIjgNNVOfRslHK0KLGN7eb26nmVw=; b=chNn/l4I7CnkfA9GvUSkj/LuTa
	wLE0rmvis1+LpNmjwLZS/UjLXdG3PvkjwcBRKf70rLc3IcRyd0fnMcV8xOyi2s5i2HxJtjNHfGp0B
	RG+Fb+aX/OtT5hwrfwejzUBq7nR/L1Sbr0iycZ7DGXxdVipDHkeOkXKFZC6rHU0z7iDYxVo6h9yB+
	2DjMTovMk7/poeLZfUMiV2CXP7+gN+kLoJKRUBzIrRp5i+isPiIix0pw90bF0qHnr7AqCdw6zcap2
	yEgXzJpHhU3i1jhhUMM6e+oP6PL2LGC7Wam3hlevYD7CgTgU1SsVF9oieMk1RLIT0YQoTfwoqyGq+
	pDJtTphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx9t-0000000FeCX-2Q0M;
	Mon, 18 May 2026 12:33:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx9s-0000000FeBn-0LbD
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 12:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ArlsmiOfKzo8EBsGIjgNNVOfRslHK0KLGN7eb26nmVw=; b=bYLpvamt21dwnJjdqFPuYrMcrS
	0+fy+/acm38o0xVZSAjGGGQW1w460JrWOgxIyZ0vKoGbiZvCrXLzLrBNoXaOYcZWVNTqjTDAGTJSd
	qZGUAW/6cJfaZ03bH+1BDXNcb1O9V96vt+mMJmEyc5RUG3ylPIQgn+c/YlPdRNSvGzxliGioS3vMr
	nYGehCIVfk6OogiInylcW5n+NDGRPEwwkVFL9XaqDwbvc/15E1/U2Ya5vwZ2UOfV+gnd6Tzko1i/b
	3kj+yfKyighkRjmtIgDLnzOqn07US5RHmPrsg7ZEDa9R8sUGOJvuv2RRs6P1jerGzw0zJG8NHRJa+
	d5iuTeJA==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx9n-00000004lUu-2RTR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:33:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 722CD2328;
	Mon, 18 May 2026 05:33:07 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D4233F632;
	Mon, 18 May 2026 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779107592; bh=xNPh5x7PUYf2b0+n2U0rK7b6u2aqB0hPpKpAY97oSLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fxV9110zFT4QtYbjAKKw/u/WXWljCB9/fD8p/t3vV8MJurFeKElZJnwr8OE0wNL9+
	 rDbuhQfWsZYCRrkah6haXxGqI3cAZqgGi/gNxVc1uvrGhuSHoemIjYnfi7XIreIcNJ
	 3TgPNVpVqKZFF3Z9ekUgfa/XYHcrCcirN+9yuRxU=
Date: Mon, 18 May 2026 13:33:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Will Deacon <will@kernel.org>, Sami Mujawar <sami.mujawar@arm.com>,
	Gavin Shan <gshan@redhat.com>, Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] virt: arm-cca-guest: use raw variant of
 smp_processor_id() in arm_cca_report_new()
Message-ID: <agsHBb9f3HkmJaIx@arm.com>
References: <20260518033157.1865498-1-enju.kohei@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518033157.1865498-1-enju.kohei@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_133315_923495_9732E4DC 
X-CRM114-Status: GOOD (  23.07  )
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

On Mon, May 18, 2026 at 12:31:31PM +0900, Kohei Enju wrote:
> With CONFIG_DEBUG_PREEMPT=y, smp_processor_id() becomes an alias of
> debug_smp_processor_id(). This debug function complains when certain
> conditions that ensure CPU ID stability are not met, specifically when
> it's called from a preemptible context.
> 
> In arm_cca_report_new(), which runs in a preemptible context,
> smp_processor_id() triggers a splat [0] due to this.
> 
> However, the CPU ID obtained here is used as the target CPU for
> smp_call_function_single() to designate a specific CPU for subsequent
> operations, not to assert that the current thread will continue to
> execute on the same CPU. Therefore, snapshotting the CPU ID itself is
> correct, and thus there's no actual harm except for the splat.
> 
> Use raw_smp_processor_id() instead, to directly retrieve the current CPU
> ID without the debug checks, avoiding the unnecessary warning message
> while preserving the correct functional behavior.
> 
> [0]
>  BUG: using smp_processor_id() in preemptible [00000000] code: cca-workload-at/134
>  caller is debug_smp_processor_id+0x20/0x2c
>  CPU: 0 UID: 0 PID: 134 Comm: cca-workload-at Not tainted 7.0.0-rc1-gc74a64d12073 #1 PREEMPT
>  Hardware name: linux,dummy-virt (DT)
>  Call trace:
>   [...]
>   check_preemption_disabled+0xf8/0x100
>   debug_smp_processor_id+0x20/0x2c
>   arm_cca_report_new+0x54/0x230
>   tsm_report_read+0x184/0x260
>   tsm_report_outblob_read+0x18/0x38
>   configfs_bin_read_iter+0xf4/0x1dc
>   vfs_read+0x230/0x31c
>   [...]
> 
> Fixes: 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for realms")
> Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> ---
>  drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> index 0c9ea24a200c..2d450caee3e4 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> @@ -108,7 +108,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
>  	 * allocate outblob based on the returned value from the 'init'
>  	 * call and that cannot be done in an atomic context.
>  	 */
> -	cpu = smp_processor_id();
> +	cpu = raw_smp_processor_id();

That's just hiding the warning which might be genuine, irrespective of
what the comment says. Sashiko has some good points:

https://sashiko.dev/#/patchset/20260518033157.1865498-1-enju.kohei@fujitsu.com

Basically what guarantees that the cpu won't go offline? Can we use
migrate_disable() and ignore the smp_call_function_single() altogether?
It looks like a hack anyway.

We should also look at the other unrelated findings in this function
from Sashiko.

-- 
Catalin


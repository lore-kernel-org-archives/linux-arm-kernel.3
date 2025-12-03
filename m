Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53356D15DAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 18:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaoP9dRPf/K59JGM54gphOgPc7bc30hVcOI/huniudU=; b=A2WUcdtzVQ5CWcMHW9cUwkQ9B+
	8p6svpcV6ylCOyHivuxS5ziEdAArp9DJ8DZ7HLBTtaiaYxsN0piBY3T18UL3yEErI2Eq3eXYfllGh
	kIxR1jzw6S2sZ9A2D25R8qZPbpnNvFpApNAT0fTXCavSeIuRqNEn2fZqEo8XpWVy6X8k2iQpRSKQ5
	3PSRDTrxXtlWLREeHkEbNE4+m/ABmAldTzam++V0iXHARYfiVOogdIH7cOkQsRM+xM9ZdYVhfTET0
	V+c98XcHcBWXllwjVS51xy3MjGYVaPZvvd47P3kyni4u0WPkyAby1QLnet9Ox1gC9AeexEtSuRBQq
	X7mT/xQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrBK-00000006u41-0Kbi;
	Wed, 03 Dec 2025 18:02:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrBH-00000006u3U-0TIS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 18:02:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CE51405F6;
	Wed,  3 Dec 2025 18:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AB9C4CEF5;
	Wed,  3 Dec 2025 18:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764784942;
	bh=BvmAws+7BickkUuwVGpea4WpLtEaqudqsT7t/9G2GKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X33v0Y84I9KFSPcADczllxUu4p24D++/UKtRy3tw1X+Vx9RahyQURKnSsjiLCiBrW
	 TlxBwFyIUslsicwyP38oyWnCkMy4f4cpV0Q6Kj69iYiSQEvdJBWhzK2Es3iy+QApnl
	 6LM4V+CrWt+IzxPdb42BXtrZ8JzWZ9pAYtNTHEkQlYiEOuRBUz6XFaDtkIswZnh9Pb
	 NlImH1OLh+FRvQnVsfFuOUTtdzB8+keuaw74PspvXyi/vh8th/ai/3ft+xmTj54EiH
	 6fsHpzJDnZVdb46j/DsB74nK9fhyHQv6fThtZ4R+f4G+cTjqSO861exIzUvqag2gxl
	 wGG+RwEqDzxCw==
Date: Wed, 3 Dec 2025 10:02:21 -0800
From: Kees Cook <kees@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] lkdtm/bugs: Add cases for BUG and PANIC occurring in
 hardirq context
Message-ID: <202512030959.87E62F908@keescook>
References: <20251112175316.2841017-4-ardb+git@google.com>
 <20251112175316.2841017-5-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112175316.2841017-5-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_100223_212284_B7CFBAB1 
X-CRM114-Status: GOOD (  21.44  )
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

On Wed, Nov 12, 2025 at 06:53:18PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Add lkdtm cases to trigger a BUG() or panic() from hardirq context. This
> is useful for testing pstore behavior being invoked from such contexts.

Sorry I lost this! Thanks for the offline ping. :)

> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/misc/lkdtm/bugs.c | 53 ++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
> index 376047beea3d..fa05d77acb55 100644
> --- a/drivers/misc/lkdtm/bugs.c
> +++ b/drivers/misc/lkdtm/bugs.c
> @@ -8,6 +8,7 @@
>  #include "lkdtm.h"
>  #include <linux/cpu.h>
>  #include <linux/list.h>
> +#include <linux/hrtimer.h>
>  #include <linux/sched.h>
>  #include <linux/sched/signal.h>
>  #include <linux/sched/task_stack.h>
> @@ -100,11 +101,61 @@ static void lkdtm_PANIC_STOP_IRQOFF(void)
>  	stop_machine(panic_stop_irqoff_fn, &v, cpu_online_mask);
>  }
>  
> +static bool wait_for_panic;
> +
> +static enum hrtimer_restart panic_in_hardirq(struct hrtimer *timer)
> +{
> +	panic("from hard IRQ context");
> +
> +	wait_for_panic = false;
> +	return HRTIMER_NORESTART;
> +}
> +
> +static void lkdtm_PANIC_IN_HARDIRQ(void)
> +{
> +	struct hrtimer timer;
> +
> +	wait_for_panic = true;
> +	hrtimer_setup_on_stack(&timer, panic_in_hardirq,
> +			       CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
> +	hrtimer_start(&timer, us_to_ktime(100), HRTIMER_MODE_REL_HARD);
> +
> +	while (wait_for_panic)
> +		;
> +
> +	hrtimer_cancel(&timer);
> +}
> +
>  static void lkdtm_BUG(void)
>  {
>  	BUG();
>  }
>  
> +static bool wait_for_bug;
> +
> +static enum hrtimer_restart bug_in_hardirq(struct hrtimer *timer)
> +{
> +	BUG();
> +
> +	wait_for_bug = false;
> +	return HRTIMER_NORESTART;
> +}
> +
> +static void lkdtm_BUG_IN_HARDIRQ(void)
> +{
> +	struct hrtimer timer;
> +
> +	wait_for_bug = true;
> +	hrtimer_setup_on_stack(&timer, bug_in_hardirq,
> +			       CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
> +	hrtimer_start(&timer, us_to_ktime(100), HRTIMER_MODE_REL_HARD);
> +
> +	while (wait_for_bug)
> +		;
> +
> +	hrtimer_cancel(&timer);
> +}
> +
>  static int warn_counter;
>  
>  static void lkdtm_WARNING(void)
> @@ -696,7 +747,9 @@ static noinline void lkdtm_CORRUPT_PAC(void)
>  static struct crashtype crashtypes[] = {
>  	CRASHTYPE(PANIC),
>  	CRASHTYPE(PANIC_STOP_IRQOFF),
> +	CRASHTYPE(PANIC_IN_HARDIRQ),
>  	CRASHTYPE(BUG),
> +	CRASHTYPE(BUG_IN_HARDIRQ),
>  	CRASHTYPE(WARNING),
>  	CRASHTYPE(WARNING_MESSAGE),
>  	CRASHTYPE(EXCEPTION),

This all looks good to me. I always ask that new tests also get added to
the lkdtm selftest runner list in tools/testing/selftests/lkdtm/tests.txt

IIUC, bug in hardirq will result in a panic, so both these tests will
take out the entire system, so they should be skipped for the selftest.
Perhaps:


diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index cff124c1eddd..67cd53715d93 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -1,6 +1,8 @@
 #PANIC
 #PANIC_STOP_IRQOFF Crashes entire system
+#PANIC_IN_HARDIRQ Crashes entire system
 BUG kernel BUG at
+#BUG_IN_HARDIRQ Crashes entire system
 WARNING WARNING:
 WARNING_MESSAGE message trigger
 EXCEPTION




-- 
Kees Cook


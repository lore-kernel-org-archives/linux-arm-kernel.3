Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5B9109022E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHsc+KBcZzurt4njgAhwr9+lvOlY8QQwEmBg6GcdhME=; b=013GgSRKbuvs6XorMH03s/QZXh
	6k2p3onRxgCZwjgVrmogAvEvgc7Ja7izWK5ku22hmj7ykNrBAeCieH3CH31p/fO6zmandyXWwCn2f
	kU9vk2+H3juKYXmnoLCJcEm9qfes/TuMHwD6y1ngeBEQRPQpQFogZ/VrO3R+tUVDTMS3fv2Tg0ulh
	bDMlowFe296LMCZx11SSftUCB7vL1oiHlkXVolW2gUAH+xonyGpz6U7EwDXb9lNNIWWTEE/+aJ0mU
	HJxBrWfETUW5OGRa0Ivo63sTo9mGwPKFkos804omWuYoSqzJvBfzf0HfAyYrc3ajPkI02aDv1LT85
	szLBWLUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E65-0000000AkOX-2zce;
	Thu, 19 Mar 2026 14:11:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E63-0000000AkO3-3PNq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:11:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 188B9418E4;
	Thu, 19 Mar 2026 14:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A97C19424;
	Thu, 19 Mar 2026 14:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773929495;
	bh=zMrJUy/hP5SmU717SITFjsj9J8MxF1hEn+wiN6agSEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OP14Xpa9HduHeRMzydVXWw9vyItMhaQiYW4Y9QcbkgPUNUe/rl13yu4mWVwk2CZsp
	 hugx+oKUkpm1yr0gLtC4BndZ8JC4EbCh0WN0pg4fRSlJ2sxgueST0AfTvyhMUE6F7p
	 RJ/E0uJsSO86X69a9mDt2BrdAQPPeBQAeoZyeaCGgsqZfTehzn7V1meSe4xKTCOfIt
	 o+KBmi8KKV3T60g7ewI+itr89unD3e8fy2kOVl1s/amM8frRoXHxQ75xvoSPAF58DU
	 fJIyAKqIlnov1xO1XxnnnQ28e1VC0H9P5/+uknHycN2YgntOfXbS1Cv6v1clQxj1iK
	 adJVMzXVwj7Gg==
Date: Thu, 19 Mar 2026 14:11:29 +0000
From: Will Deacon <will@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
	lpieralisi@kernel.org, sudeep.holla@kernel.org
Subject: Re: [PATCH] arm64: suspend: Remove forcing error from suspend
 finisher
Message-ID: <abwEETSDOPRpgtum@willie-the-truck>
References: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_071135_896940_51E4226E 
X-CRM114-Status: GOOD (  32.17  )
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

[+Mark, Lorenzo and Sudeep]

On Mon, Mar 16, 2026 at 02:18:18PM +0530, Maulik Shah wrote:
> Successful cpu_suspend() may not always want to return to cpu_resume() to
> save the work and latency involved.
> 
> consider a scenario,
> 
> when single physical CPU (pCPU) is used on different virtual machines (VMs)
> as virtual CPUs (vCPUs). VM-x's vCPU can request a powerdown state after
> saving the context by invoking __cpu_suspend_enter() whereas VM-y's vCPU is
> requesting a shallower than powerdown state. The hypervisor aggregates to a
> non powerdown state for pCPU. A wakeup event for VM-x's vCPU may want to
> resume the execution at the same place instead of jumping to cpu_resume()
> as the HW never reached till powerdown state which would have lost the
> context.
> 
> While the vCPU of VM-x had latency impact of saving the context in suspend
> entry path but having the return to same place saves the latency to restore
> the context in resume path.
> 
> consider another scenario,
> 
> Newer CPUs include a feature called “powerdown abandon”. The feature is
> based on the observation that events like GIC wakeups have a high
> likelihood of happening while the CPU is in the middle of its powerdown
> sequence (at wfi). Older CPUs will powerdown and immediately power back
> up when this happens. The newer CPUs will “give up” mid way through if
> no context has been lost yet. This is possible as the powerdown operation
> is lengthy and a large part of it does not lose context [1].
> 
> As the wakeup arrived after SW powerdown is done but before HW is fully
> powered down. From SW view this is still a successful entry to suspend
> and since the HW did not loose the context there is no reason to return at
> entry address cpu_resume() to restore the context.
> 
> Remove forcing the failure at kernel if the execution does not resume at
> cpu_resume() as kernel has no reason to treat such returns as failures
> when the firmware has already filled in return as success.
> 
> [1] https://trustedfirmware-a.readthedocs.io/en/v2.14.0/design/firmware-design.html#cpu-specific-operations-framework
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/kernel/suspend.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
> index eaaff94329cddb8d1fb8d1523395453f3501c9a5..b54e578f0f8b03c1dba38157c6012bb064adaa12 100644
> --- a/arch/arm64/kernel/suspend.c
> +++ b/arch/arm64/kernel/suspend.c
> @@ -144,15 +144,14 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
>  		ret = fn(arg);
>  
>  		/*
> -		 * Never gets here, unless the suspend finisher fails.
> -		 * Successful cpu_suspend() should return from cpu_resume(),
> -		 * returning through this code path is considered an error
> -		 * If the return value is set to 0 force ret = -EOPNOTSUPP
> -		 * to make sure a proper error condition is propagated
> +		 * Successful HW power down should return at cpu_resume()
> +		 * however successful SW power down may still want to
> +		 * return here to save the work and latency involved in
> +		 * restoring the context when the HW never lost it.
> +		 *
> +		 * If the return value is set to 0 do not force failure
> +		 * from here.
>  		 */
> -		if (!ret)
> -			ret = -EOPNOTSUPP;
> -

This doesn't look right to me.

afaict, the only suspend finisher we get here on arm64 is for PSCI. The
PSCI spec returns SUCCESS if a shallower state is entered than the one
requested, in which case we should return an error back to cpuidle rather
than pretend to have entered a deeper state than we actually did.

I wonder if we could remove the 'fn' paramater from cpu_suspend()
altogether for arm64 and hardwire PSCI directly, given that it's the
only one we seem to support?

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32416C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5t9cgIT5f9rP+bBZj+k2OohF1bEsiI+o9JoKpM8YBmY=; b=WrOKt54TRXoMoq7Co4y1N1Bnp+
	OUb3bsUXqRytZM5Lb6qThXbl7jnvjo5RxJ4wu5rH1WljvAjtATOoV+4I/0AS1rLnN+Pwe3WpAhnlH
	iAIqYTWN+vgW8+d2tUHqh/JlHTnB6x2MinImGPIqs1o7Ongo5a5tKJr6teNRhG2Bry33mVNMsSFBA
	bBlvfCmhD5VYAWTYOx2sMDcKBY3PNpdAzofS1j2Hi93s1I3dja5dm4EP1tCR0uNuuKuaip4D5DftD
	E3uypj3hPhYQid3MvPsTB+pUj6Y5xVLpevMZM/kqnEX9NuKB9aQsjwvTMM1y4tGdHDB/1qDN35n4o
	7TYsGB5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SOq-0000000Dc23-0vWY;
	Fri, 18 Sep 2026 06:48:44 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SOo-0000000Dc1H-1zy4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 06:48:43 +0000
Received: by linux.microsoft.com (Postfix, from userid 1134)
	id A9B9420B7166; Thu, 17 Sep 2026 23:47:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A9B9420B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1789714074;
	bh=5t9cgIT5f9rP+bBZj+k2OohF1bEsiI+o9JoKpM8YBmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTE5wuViE5zsPSQWG4RRydfhk85bXsmJErXz0umjjbR5/VO1bnR8U+it7k8TayikU
	 vZ/mNjtzJcRBnQwSoKeqBCWc8kh4W4DOCi9QnypUMZa3yMiqqmNfuZDSUlGHxwqwOj
	 cmVOZzZADm26KnVYNsRaIbzx2A9Z1XyPKUSPj4Ro=
Date: Thu, 17 Sep 2026 23:47:54 -0700
From: Shradha Gupta <shradhagupta@linux.microsoft.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Michael Kelley <mikelley@microsoft.com>,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, namjain@linux.microsoft.com
Subject: Re: [PATCH v2] arm64: hyperv: run VMBus kexec handler via syscore
 shutdown
Message-ID: <aqzempJPsZ41cOsk@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260907092544.230338-1-shradhagupta@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907092544.230338-1-shradhagupta@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_234842_561508_05B18959 
X-CRM114-Status: GOOD (  24.08  )
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

On Mon, Sep 07, 2026 at 02:25:42AM -0700, Shradha Gupta wrote:

Gentle reminder.

> On ARM64, machine_shutdown() does not provide a platform hook between
> device_shutdown() and smp_shutdown_nonboot_cpus(), unlike x86's
> machine_ops.shutdown. This prevents the Hyper-V VMBus kexec handler
> from running at the correct point during kexec shutdown, causing
> kexec reboot to fail on ARM64 Hyper-V guests.
> 
> Use syscore_ops.shutdown instead: syscore_shutdown() runs in the same
> window (after device_shutdown(), before CPUs are taken offline) where
> VMBus UNLOAD and cpuhp_remove_state() must execute.
> 
> Provide ARM64-specific overrides of hv_setup_kexec_handler() and
> hv_remove_kexec_handler() that register/unregister a syscore_ops
> shutdown callback, replacing the __weak no-op stubs in hv_common.c.
> On x86, the existing machine_ops.shutdown mechanism is unchanged.
> 
> Fixes: 9d7cf2c96758 ("Drivers: hv: Add arch independent default functions for some Hyper-V handlers")
> Link: https://lore.kernel.org/all/20260814093133.3191250-1-shradhagupta@linux.microsoft.com/
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Shradha Gupta <shradhagupta@linux.microsoft.com>
> Reviewed-by: Naman Jain <namjain@linux.microsoft.com>
> ---
>  Changes in V2
>  * Use syscore_ops.shutdown instead of a bare function pointer hook in
>    machine_shutdown(), per Catalin's suggestion.
> ---
>  arch/arm64/hyperv/mshyperv.c | 40 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
> index 4fdc26ade1d7..e608e546a395 100644
> --- a/arch/arm64/hyperv/mshyperv.c
> +++ b/arch/arm64/hyperv/mshyperv.c
> @@ -15,10 +15,50 @@
>  #include <linux/errno.h>
>  #include <linux/version.h>
>  #include <linux/cpuhotplug.h>
> +#include <linux/kexec.h>
> +#include <linux/syscore_ops.h>
>  #include <asm/mshyperv.h>
>  
>  static bool hyperv_initialized;
>  
> +/*
> + * Kexec handler registered by VMBus.
> + *
> + * On ARM64, machine_shutdown() does not provide a platform hook between
> + * device_shutdown() and smp_shutdown_nonboot_cpus(), unlike the
> + * machine_ops.shutdown mechanism used on x86.  Use a syscore_ops shutdown
> + * callback instead: syscore_shutdown() runs after device_shutdown() and
> + * before CPUs are taken offline, which is the same window VMBus needs to
> + * run its UNLOAD message and cpuhp_remove_state() during kexec.
> + */
> +static void (*hv_kexec_handler_fn)(void);
> +
> +static void hv_kexec_syscore_shutdown(void *data)
> +{
> +	if (kexec_in_progress && hv_kexec_handler_fn)
> +		hv_kexec_handler_fn();
> +}
> +
> +static const struct syscore_ops hv_kexec_syscore_ops = {
> +	.shutdown	= hv_kexec_syscore_shutdown,
> +};
> +
> +static struct syscore hv_kexec_syscore = {
> +	.ops		= &hv_kexec_syscore_ops,
> +};
> +
> +void hv_setup_kexec_handler(void (*handler)(void))
> +{
> +	hv_kexec_handler_fn = handler;
> +	register_syscore(&hv_kexec_syscore);
> +}
> +
> +void hv_remove_kexec_handler(void)
> +{
> +	unregister_syscore(&hv_kexec_syscore);
> +	hv_kexec_handler_fn = NULL;
> +}
> +
>  int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
>  {
>  	hv_get_vpreg_128(HV_REGISTER_HYPERVISOR_VERSION,
> -- 
> 2.43.0


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2416C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 10:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvEPGOfbgk6GAAitdg40W0kx1ikkHQeD6VX4NT0U9cQ=; b=TKM+lZwQtt6Nv8rhKIMtJGNbv/
	KGPy5vkM1QLVIZOVJ7hEakaahTkt6bhBisnrUEPukueKFMtNXRTGSXJxl1zvPF3okGpa3UevVKLsb
	zzsoqHhi6TSEuLchjQAYvyEdK/GOjNYoKlMJhcOXzuS6DfZrrCSv6EFjSGloQ973/KSl2zK9/8DRq
	QNx2RhrOrWgZlLR224L6YFu3FELyXNonz8izKxMBUSCzCi8JXCiWHp1L6XPenZKfuTv5x2VOl0wEY
	Mtk2e5qzu+X8c1SRS+jw7foxF5YsmzUIQVNGoqFj8e/82H3L2mAIeDWTr9JAZjNKJFw6KJuqwDZ2t
	deethukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3aT-0000000D8dW-31Hn;
	Fri, 25 Sep 2026 10:55:29 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3aP-0000000D8aD-3V7b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 10:55:27 +0000
Received: by linux.microsoft.com (Postfix, from userid 1127)
	id DE03E20B7167; Fri, 25 Sep 2026 03:54:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DE03E20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1790333674;
	bh=TvEPGOfbgk6GAAitdg40W0kx1ikkHQeD6VX4NT0U9cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBY94IAUfCDpClpxzxKhpb9QROdJLRr+DhKGenzz7MpzJd3UNj7yHGq0yh0QHAeC4
	 E6koLuWaEpulGcS0dREtqRbv1hfMmh2IYVGiOCYQQ6Mys2zmwWB3yPg4LkTsZejpqi
	 nK1SJU30/cFmjJKSVsaqLq92BY7Cuw/Jf/8920II=
Date: Fri, 25 Sep 2026 03:54:34 -0700
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: Shradha Gupta <shradhagupta@linux.microsoft.com>
Cc: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Michael Kelley <mikelley@microsoft.com>,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, namjain@linux.microsoft.com
Subject: Re: [PATCH v2] arm64: hyperv: run VMBus kexec handler via syscore
 shutdown
Message-ID: <arZS6km9V29CnYw9@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260907092544.230338-1-shradhagupta@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907092544.230338-1-shradhagupta@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_035525_922241_CEAB9394 
X-CRM114-Status: GOOD (  25.65  )
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
>

LGTM. This patch is important for Hyper-V kexec support.
As discussed in the RFC, the approach used here is also in agreement
with the ARM maintainer.

Reviewed-by: Saurabh Sengar <ssengar@linux.microsoft.com>


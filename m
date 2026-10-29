Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43643606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 22:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UiyQpipV;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BDH0irSJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=POwY9K3wYZjvJPalx+6QkgsqJfGo8QCv3p3v7iSCx8U=; b=UiyQpipVEY9y1OQRdDObUvRowG
	G3BmU9asO1OfoFGTmVnaPCsgUHk7RhexE6nGxpsagxubwpp9UZcxWNYaeNC+68YFObVb1Dz/URiOb
	8je2yGGC19EipRHqqR4bIr845kCqovq/e0x0m48WvJvUUrM0iQ+kE9WjZz14J4Vd3sWmgI3naGk8g
	MWMDYhzSEvoqGuYrg49q2xGdkGnDbLkM5GnrEMo2e1ihxv0O4GMYSiEL7vv2a+9RCMkbNxOrJykFu
	oI8VRDYZ/egc1lg/6NBi1eUytXT9wnWd2ly7R2THiVmqharmeULKKIXE9/00YkUIw9q0h4Qn3HRM1
	iO/uhbYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZ0x-0000000AVSe-3P03;
	Thu, 29 Oct 2026 22:54:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZ0u-0000000AVRz-1eKl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 22:54:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 352FB169E;
	Thu, 29 Oct 2026 15:54:23 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E2043F673;
	Thu, 29 Oct 2026 15:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793314466; bh=+W+VoreRqIYQsjm9ZjQdyC40IddCPxH6b0QBB2g7Y3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDH0irSJKsIvF3lVyzTr15otTHYjyscFtzzcK2NHYxOvYzxveHXWqaGMjHHgVZHsG
	 vINIrvUOSDsQkpU5VyXbVZL4KrLZwF7+8VuyhowwNaKNjHX4P5VdHXfIxAUioo+gm9
	 Ho9ljIJqirq4qnv/E8nsInssKH/ncXUu8miviacQ=
Date: Thu, 29 Oct 2026 22:54:21 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	mhklinux@outlook.com, will@kernel.org, mark.rutland@arm.com,
	lpieralisi@kernel.org, sudeep.holla@kernel.org, arnd@arndb.de,
	thuth@redhat.com, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v5 2/6] firmware: smccc: Detect hypervisor via RSI host
 call in CCA Realms
Message-ID: <auPOnb_9Jfzh-oQE@arm.com>
References: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
 <20261002215725.2015959-3-kameroncarr@linux.microsoft.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002215725.2015959-3-kameroncarr@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_155428_739268_792C734B 
X-CRM114-Status: GOOD (  26.38  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

+ Suzuki

On Fri, Oct 02, 2026 at 02:57:21PM -0700, Kameron Carr wrote:
> Modify arm_smccc_hypervisor_has_uuid() to check is_realm_world() and
> use rsi_host_call() to query the hypervisor vendor UUID when inside a
> Realm. The realm path is factored into a helper,
> arm_smccc_realm_get_hypervisor_uuid(), that owns a file-static
> rsi_host_call buffer (uuid_hc) serialized by a spinlock.
> 
> The RSI-specific includes, file-static state and helper are guarded with
> CONFIG_ARM64 because <linux/arm-rsi-cmds.h> does not build on 32-bit
> ARM.
> 
> For non-Realm environments, the existing arm_smccc_1_1_invoke() path
> is unchanged.
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
> ---
>  drivers/firmware/smccc/smccc.c | 41 +++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index afc2e4d..7e77170 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -14,6 +14,12 @@
>  
>  #include <asm/archrandom.h>
>  
> +#ifdef CONFIG_ARM64
> +#include <linux/arm-rsi-cmds.h>
> +#include <linux/cleanup.h>
> +#include <linux/spinlock.h>
> +#endif
> +
>  static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
>  static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
>  
> @@ -69,12 +75,45 @@ s32 arm_smccc_get_soc_id_revision(void)
>  }
>  EXPORT_SYMBOL_GPL(arm_smccc_get_soc_id_revision);
>  
> +#ifdef CONFIG_ARM64
> +static struct rsi_host_call uuid_hc;
> +static DEFINE_SPINLOCK(uuid_hc_lock);
> +
> +/*
> + * Helper function to get the hypervisor UUID via an RsiHostCall.
> + */
> +static void arm_smccc_realm_get_hypervisor_uuid(struct arm_smccc_res *res)
> +{
> +	guard(spinlock_irqsave)(&uuid_hc_lock);
> +
> +	memset(&uuid_hc, 0, sizeof(uuid_hc));
> +	uuid_hc.gprs[0] = ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID;
> +
> +	if (rsi_host_call(__pa_symbol(&uuid_hc)) != RSI_SUCCESS) {
> +		res->a0 = SMCCC_RET_NOT_SUPPORTED;
> +		return;
> +	}
> +
> +	res->a0 = uuid_hc.gprs[0];
> +	res->a1 = uuid_hc.gprs[1];
> +	res->a2 = uuid_hc.gprs[2];
> +	res->a3 = uuid_hc.gprs[3];
> +}
> +#endif
> +
>  bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
>  {
>  	struct arm_smccc_res res = {};
>  	uuid_t uuid;
>  
> -	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
> +#ifdef CONFIG_ARM64
> +	if (is_realm_world())
> +		arm_smccc_realm_get_hypervisor_uuid(&res);
> +	else
> +#endif
> +		arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID,
> +				     &res);

Is this meant to be generic? I'm not sure the trick to pass
ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID in gprs[0] and forward it to the
host is a documented ABI. I think it even confuses other realm guests
that don't expect this (e.g. kvm_init_hyp_services()).

I thought realms should stick to the RSI interface and not try to guess
the host hypervisor. But if you do need this, a better fit would be in
hyperv_detect_via_smccc() (if realms don't boot with ACPI).

I'll leave it to Sudeep or Suzuki to comment further.

-- 
Catalin


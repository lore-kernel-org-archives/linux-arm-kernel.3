Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FE7C19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 23:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+HFT7bov+RaxIItYhtEfkOy6FPJyEYGXdPDsHKSe8c=; b=cKp0X2RXD/QM+u9eoLaVeqgYrn
	jEnL1kZRhXk34qkttKpjALh8KBLgZumk36SZa+Qvl4AeAsGjKlpzUOODNT3YZWoVVWo0qIzjgRueF
	/2Qm7iUlg8karHYgxHnan8jWJoEItUiQBF4O7fpsz15YhArWZ2Aq7mXVvn2OjcKGvNHCckX3ksvVq
	DmsUl78zei6eYGk4YcHcqsq44cw/4r1uSvX5kVUgYkRlskblgxV6c6TkNi7+wDB2svAs4nA2T1dCh
	h6dsfDeEDoDqiwmKkdfXT7Um0Nub3IcsBV34ez4ebpWnXr+wqXZAtRfuijQc1BBSQhtv63GW3DvHZ
	L5OSimxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR1C-00000005imv-2Sje;
	Wed, 26 Feb 2025 23:40:46 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQzg-00000005iek-11c3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 23:39:13 +0000
Received: from skinsburskii. (unknown [20.236.10.120])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2DF42210EAC0;
	Wed, 26 Feb 2025 15:39:09 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2DF42210EAC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740613150;
	bh=Q+HFT7bov+RaxIItYhtEfkOy6FPJyEYGXdPDsHKSe8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJJRcjPE/QIMIWzQnEoRiW6U1WnIINrXiVvJWQ6SHe0J6Saw4V1bdRSbUnD4lmaE3
	 d6c7uPQ45dx0pqG+9B6BE9SrlLpyhUGtOqtctbhnWQWH2n1fnDbKqauHNqamkMGQNK
	 aWNXEuKaqfgxLl6RqOOpp/XMUGVS6vSKorL8G/Xo=
Date: Wed, 26 Feb 2025 15:39:07 -0800
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
	arnd@arndb.de, jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com, mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com, apais@linux.microsoft.com,
	Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
	gregkh@linuxfoundation.org, vkuznets@redhat.com,
	prapal@linux.microsoft.com, muislam@microsoft.com,
	anrayabh@linux.microsoft.com, rafael@kernel.org, lenb@kernel.org,
	corbet@lwn.net
Subject: Re: [PATCH v5 07/10] Drivers: hv: Introduce per-cpu event ring tail
Message-ID: <Z7-mG7X-cyZAKa7V@skinsburskii.>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-8-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1740611284-27506-8-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_153912_331576_0E55EAC7 
X-CRM114-Status: GOOD (  20.15  )
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

On Wed, Feb 26, 2025 at 03:08:01PM -0800, Nuno Das Neves wrote:
> Add a pointer hv_synic_eventring_tail to track the tail pointer for the
> SynIC event ring buffer for each SINT.
> 
> This will be used by the mshv driver, but must be tracked independently
> since the driver module could be removed and re-inserted.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> Reviewed-by: Wei Liu <wei.liu@kernel.org>
> ---
>  drivers/hv/hv_common.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> index 252fd66ad4db..2763cb6d3678 100644
> --- a/drivers/hv/hv_common.c
> +++ b/drivers/hv/hv_common.c
> @@ -460,6 +478,7 @@ void __init ms_hyperv_late_init(void)
>  int hv_common_cpu_init(unsigned int cpu)
>  {
>  	void **inputarg, **outputarg;
> +	u8 **synic_eventring_tail;
>  	u64 msr_vp_index;
>  	gfp_t flags;
>  	const int pgcount = hv_output_page_exists() ? 2 : 1;
> @@ -472,8 +491,8 @@ int hv_common_cpu_init(unsigned int cpu)
>  	inputarg = (void **)this_cpu_ptr(hyperv_pcpu_input_arg);
>  
>  	/*
> -	 * hyperv_pcpu_input_arg and hyperv_pcpu_output_arg memory is already
> -	 * allocated if this CPU was previously online and then taken offline
> +	 * The per-cpu memory is already allocated if this CPU was previously
> +	 * online and then taken offline
>  	 */
>  	if (!*inputarg) {
>  		mem = kmalloc(pgcount * HV_HYP_PAGE_SIZE, flags);
> @@ -485,6 +504,17 @@ int hv_common_cpu_init(unsigned int cpu)
>  			*outputarg = (char *)mem + HV_HYP_PAGE_SIZE;
>  		}
>  
> +		if (hv_root_partition()) {
> +			synic_eventring_tail = (u8 **)this_cpu_ptr(hv_synic_eventring_tail);
> +			*synic_eventring_tail = kcalloc(HV_SYNIC_SINT_COUNT,
> +							sizeof(u8), flags);
> +

Redundant empty line ^^^
> +			if (unlikely(!*synic_eventring_tail)) {
> +				kfree(mem);
> +				return -ENOMEM;
> +			}
> +		}
> +
>  		if (!ms_hyperv.paravisor_present &&
>  		    (hv_isolation_type_snp() || hv_isolation_type_tdx())) {
>  			ret = set_memory_decrypted((unsigned long)mem, pgcount);

Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>

> -- 
> 2.34.1
> 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75974C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 05:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cvrA/jSJRuBK0OsorOMxFgUQoJApVJ8Yjx0E2P1rLo=; b=T42lhZVvNYnTezNlQx+R/agH0l
	W2ULKjJnPEzpff1IZo4vszxvVlIWy3izwk7QX7tywg0wEOe91Z6n3WepOPZkEfqumgA+L0/Mai/HX
	oLnFKT/GKgvkKAnzw84tJMuFV6L0iauVYFhvt4SWaXASrn5CED6gRJ/TfTP3TOqU8MyZY3/vUIJHx
	v1HQPqYr8UUzikZ1AvjIvj/597bGkPldGbsguR8FQaEcnhCslejtbBedo2dIQT5bDpQHGICYV7oYf
	j6NdmeiPQw2XnrFA4Ud0+2QMGmN6x1/aolnyzJoVoOAt90gV9MdgjipUDo1IKkqHMhHRBITJAHyLN
	WTd+OLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti5cE-00000006HfY-2iKL;
	Wed, 12 Feb 2025 05:48:54 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti5ao-00000006HTK-33g0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 05:47:28 +0000
Received: from [192.168.35.166] (c-73-59-8-18.hsd1.wa.comcast.net [73.59.8.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id 79DD82107AB7;
	Tue, 11 Feb 2025 21:47:24 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 79DD82107AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739339245;
	bh=2cvrA/jSJRuBK0OsorOMxFgUQoJApVJ8Yjx0E2P1rLo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=iDrcQD4OZx3ePmwlps16DC5hZu4V/C9DuCTp+LaKEl3ZiloWrQfyzNMez2hcdI1uh
	 XoGNtNuo/7DezrquDlx4sVkCzw3MiKGoeavdOOsF58V7ipziEgE5uGKn0KEVwZT/wq
	 1mG0nWC0EPeb5nGqsafzZiwgfjhKdlAW889o53ac=
Message-ID: <20ba4b7c-bebb-4b1f-8c6c-4cd52a5083b5@linux.microsoft.com>
Date: Tue, 11 Feb 2025 21:47:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 iommu@lists.linux.dev, eahariha@linux.microsoft.com, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 arnd@arndb.de, jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mukeshrathor@microsoft.com
Subject: Re: [PATCH] hyperv: Add CONFIG_MSHV_ROOT to gate hv_root_partition
 checks
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1739312515-18848-1-git-send-email-nunodasneves@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <1739312515-18848-1-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_214726_826214_8E5CB054 
X-CRM114-Status: GOOD (  18.36  )
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

On 2/11/2025 2:21 PM, Nuno Das Neves wrote:
> Introduce CONFIG_MSHV_ROOT as a tristate to enable root partition
> booting and future mshv driver functionality.
> 
> Change hv_root_partition into a function which always returns false
> if CONFIG_MSHV_ROOT=n.
> 
> Introduce hv_current_partition_type to store the type of partition
> (guest, root, or other kinds in future), and hv_identify_partition_type()
> to it up early in Hyper-V initialization.

...to *set* it up early?

> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
> Depends on
> https://lore.kernel.org/linux-hyperv/1738955002-20821-3-git-send-email-nunodasneves@linux.microsoft.com/
> 
>  arch/arm64/hyperv/mshyperv.c       |  2 ++
>  arch/x86/hyperv/hv_init.c          | 10 ++++----
>  arch/x86/kernel/cpu/mshyperv.c     | 24 ++----------------
>  drivers/clocksource/hyperv_timer.c |  4 +--
>  drivers/hv/Kconfig                 | 12 +++++++++
>  drivers/hv/Makefile                |  3 ++-
>  drivers/hv/hv.c                    | 10 ++++----
>  drivers/hv/hv_common.c             | 32 +++++++++++++++++++-----
>  drivers/hv/vmbus_drv.c             |  2 +-
>  drivers/iommu/hyperv-iommu.c       |  4 +--
>  include/asm-generic/mshyperv.h     | 39 +++++++++++++++++++++++++-----
>  11 files changed, 92 insertions(+), 50 deletions(-)
> 

<snip>

> +
> +void hv_identify_partition_type(void)
> +{
> +	/*
> +	 * Check partition creation and cpu management privileges
> +	 *
> +	 * Hyper-V should never specify running as root and as a Confidential
> +	 * VM. But to protect against a compromised/malicious Hyper-V trying
> +	 * to exploit root behavior to expose Confidential VM memory, ignore
> +	 * the root partition setting if also a Confidential VM.
> +	 */
> +	if ((ms_hyperv.priv_high & HV_CREATE_PARTITIONS) &&
> +	    (ms_hyperv.priv_high & HV_CPU_MANAGEMENT) &&
> +	    !(ms_hyperv.priv_high & HV_ISOLATION)) {
> +		hv_current_partition_type = HV_PARTITION_TYPE_ROOT;
> +		pr_info("Hyper-V: running as root partition\n");
> +	} else {
> +		hv_current_partition_type = HV_PARTITION_TYPE_GUEST;
> +	}
> +}

This should assume GUEST as default and modify to ROOT if all the checks pass.

<snip>

> +static inline int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
> +{
> +	return hv_result(U64_MAX);
> +}

Is there value in perhaps #defining hv_result_<whatever this is> as U64_MAX and returning that for documentation?
For e.g. assuming this is something like EOPNOTSUPP

#define HV_RESULT_NOT_SUPP U64_MAX

static inline int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
{ return hv_result(HV_RESULT_NOT_SUPP); }

<snip>

Thanks,
Easwar (he/him)


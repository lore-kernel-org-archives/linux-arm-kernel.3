Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C233C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PwRYSAUHqQeSDxhm2bQfQtxnfTWxm0thIO57fvgsKQ=; b=ufTgcpcsjveAjdpU2Zb6hWcitb
	2ZBJvmT1cesZImYC7KuPYzziTi3EXk86gRPQMKgSxW9ag3L87fENGGQGDGj5WsefqEenEdlm5ciCp
	fvtW5bqGpiDgr6beqHwJsq4yY3Gmn0BSsnHKBFujnAUx+K5PITHofWNGjFktEBD+6dOx9DzbcLIol
	MAAyu87SPBRajzCsxoEzzdV3XADUmC8qK7sxJ3bD+1tSJ+9A8UAgZBjEz0TGa2Oa41MOBtxXj1cl7
	MHuQDAwGLXr0zmtc6d/LANxxG4r/sIKumcZ9bAJIg7jXllV4QGyZp7yj5o5OKVMGODSJpj9Fb1LT4
	J5xe1aDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjlm-00000008cLO-3vre;
	Thu, 27 Feb 2025 19:42:06 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tniMA-00000008HwR-1YtE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:11:35 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 90A85203CDDF;
	Thu, 27 Feb 2025 10:11:33 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 90A85203CDDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740679893;
	bh=5PwRYSAUHqQeSDxhm2bQfQtxnfTWxm0thIO57fvgsKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dCMYHJlhcHp7HpaaqM/xo3xcDHeX+BR6NspNgtru54jt68z0NiVe72r6cpxO4KSWl
	 HTpZ6+C8GLgGZxhotNFOeWh4czASJ4l/bfmkWwPf5a+FRxr10C/BdLa7xLlbOZyFPR
	 5i5UA+3HH4wSKGSpk+HAUPHY5Z6rNrW0Av7r9c4Q=
Message-ID: <ba243e7a-927c-4e33-901f-f62a5b1f24eb@linux.microsoft.com>
Date: Thu, 27 Feb 2025 10:11:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] Drivers/hv: Export some functions for use by
 root partition module
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
 will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-7-git-send-email-nunodasneves@linux.microsoft.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <1740611284-27506-7-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_101134_499922_B25BBE73 
X-CRM114-Status: GOOD (  12.70  )
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



On 2/26/2025 3:08 PM, Nuno Das Neves wrote:
> get_hypervisor_version, hv_call_deposit_pages, hv_call_create_vp,
> hv_call_deposit_pages, and hv_call_create_vp are all needed in module
> with CONFIG_MSHV_ROOT=m.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>   arch/arm64/hyperv/mshyperv.c   | 1 +
>   arch/x86/kernel/cpu/mshyperv.c | 1 +
>   drivers/hv/hv_common.c         | 1 +
>   drivers/hv/hv_proc.c           | 3 ++-
>   4 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
> index 2265ea5ce5ad..4e27cc29c79e 100644
> --- a/arch/arm64/hyperv/mshyperv.c
> +++ b/arch/arm64/hyperv/mshyperv.c
> @@ -26,6 +26,7 @@ int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(hv_get_hypervisor_version);
>   
>   static int __init hyperv_init(void)
>   {
> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
> index 2c29dfd6de19..0116d0e96ef9 100644
> --- a/arch/x86/kernel/cpu/mshyperv.c
> +++ b/arch/x86/kernel/cpu/mshyperv.c
> @@ -420,6 +420,7 @@ int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(hv_get_hypervisor_version);
>   
>   static void __init ms_hyperv_init_platform(void)
>   {
> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> index ce20818688fe..252fd66ad4db 100644
> --- a/drivers/hv/hv_common.c
> +++ b/drivers/hv/hv_common.c
> @@ -717,6 +717,7 @@ int hv_result_to_errno(u64 status)
>   	}
>   	return -EIO;
>   }
> +EXPORT_SYMBOL_GPL(hv_result_to_errno);
>   
>   void hv_identify_partition_type(void)
>   {
> diff --git a/drivers/hv/hv_proc.c b/drivers/hv/hv_proc.c
> index 8fc30f509fa7..20c8cee81e2b 100644
> --- a/drivers/hv/hv_proc.c
> +++ b/drivers/hv/hv_proc.c
> @@ -108,6 +108,7 @@ int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
>   	kfree(counts);
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(hv_call_deposit_pages);
>   
>   int hv_call_add_logical_proc(int node, u32 lp_index, u32 apic_id)
>   {
> @@ -194,4 +195,4 @@ int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags)
>   
>   	return ret;
>   }
> -
> +EXPORT_SYMBOL_GPL(hv_call_create_vp);

Reviewed-by: Roman Kisel <romank@linux.microsoft.com>

-- 
Thank you,
Roman



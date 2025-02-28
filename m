Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FE6C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 00:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TedvLHMPHE8XHCBytj3ubvZb/vERcp/qqIqNRTK3pBY=; b=Oj7EX/BT2lM9586p6BaQo8NsTn
	Ex7tcw3L5MoRP6VlfuFg5rcEOeWBzKp0rdRYcv4cVa8pt45YB0JCRCPyCH0KsLF/go3FIuVwPB22X
	brdr68WTT8uPJTC54OaFIsh+ogeQ4Bplnf+4ETsYxD4fCIWzx54zbL7hneZFj3ExwN6tTURhzf0z8
	x92uZdSUljCDqskWhO8rvj7tjFQVKnGcM4bqZPCChNU0nyRPBJCKNKp1a5//OEo3tdlj2kb1XLx2s
	ueO5h2IBqHXi9by0sYeZNZFm0/jLvsvrvgrbSZRiWWC+8TtInL8CeHuQY1AGWd4EYEBRA/Qj90jp7
	57INn2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnodF-00000009KIk-1pJA;
	Fri, 28 Feb 2025 00:53:37 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnobg-00000009KAF-3CAp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 00:52:02 +0000
Received: from [192.168.35.166] (c-24-22-154-137.hsd1.wa.comcast.net [24.22.154.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6B86E210EAC2;
	Thu, 27 Feb 2025 16:51:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6B86E210EAC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740703919;
	bh=TedvLHMPHE8XHCBytj3ubvZb/vERcp/qqIqNRTK3pBY=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=jzqkDSozW6Jc8P6g7f0kthOLKs0gswB3Y5Tx5xcZDSXOfrJhVx8CoEaBJdNmbG3dY
	 5xAXJvEkgzR3GR/RlflR8KKFl4JTy1ZGMIDJ8r9FVmGz/hgGHF4p57cEn8+SCSlTlN
	 8x0I4yt8Rbulty4/1wm7Uf8Xgi9mB3P+Hc7Vx8ZI=
Message-ID: <dca8eb13-e994-482f-a818-5eaa638bd605@linux.microsoft.com>
Date: Thu, 27 Feb 2025 16:51:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org,
 eahariha@linux.microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, mhklinux@outlook.com, decui@microsoft.com,
 catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 arnd@arndb.de, jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
Subject: Re: [PATCH v5 06/10] Drivers/hv: Export some functions for use by
 root partition module
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-7-git-send-email-nunodasneves@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <1740611284-27506-7-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_165200_895711_9B348294 
X-CRM114-Status: GOOD (  13.55  )
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

Nit: It's generally good practice to use parentheses when mentioning functions, i.e.
hv_get_hypervisor_version(), hv_call_deposit_pages() etc

Otherwise, looks good to me.

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  arch/arm64/hyperv/mshyperv.c   | 1 +
>  arch/x86/kernel/cpu/mshyperv.c | 1 +
>  drivers/hv/hv_common.c         | 1 +
>  drivers/hv/hv_proc.c           | 3 ++-
>  4 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
> index 2265ea5ce5ad..4e27cc29c79e 100644
> --- a/arch/arm64/hyperv/mshyperv.c
> +++ b/arch/arm64/hyperv/mshyperv.c
> @@ -26,6 +26,7 @@ int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(hv_get_hypervisor_version);
>  
>  static int __init hyperv_init(void)
>  {
> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
> index 2c29dfd6de19..0116d0e96ef9 100644
> --- a/arch/x86/kernel/cpu/mshyperv.c
> +++ b/arch/x86/kernel/cpu/mshyperv.c
> @@ -420,6 +420,7 @@ int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(hv_get_hypervisor_version);
>  
>  static void __init ms_hyperv_init_platform(void)
>  {
> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> index ce20818688fe..252fd66ad4db 100644
> --- a/drivers/hv/hv_common.c
> +++ b/drivers/hv/hv_common.c
> @@ -717,6 +717,7 @@ int hv_result_to_errno(u64 status)
>  	}
>  	return -EIO;
>  }
> +EXPORT_SYMBOL_GPL(hv_result_to_errno);
>  
>  void hv_identify_partition_type(void)
>  {
> diff --git a/drivers/hv/hv_proc.c b/drivers/hv/hv_proc.c
> index 8fc30f509fa7..20c8cee81e2b 100644
> --- a/drivers/hv/hv_proc.c
> +++ b/drivers/hv/hv_proc.c
> @@ -108,6 +108,7 @@ int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
>  	kfree(counts);
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(hv_call_deposit_pages);
>  
>  int hv_call_add_logical_proc(int node, u32 lp_index, u32 apic_id)
>  {
> @@ -194,4 +195,4 @@ int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags)
>  
>  	return ret;
>  }
> -
> +EXPORT_SYMBOL_GPL(hv_call_create_vp);



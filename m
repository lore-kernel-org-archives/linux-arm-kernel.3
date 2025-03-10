Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FA3C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 00:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SltWqaFRj4CLRbIY/HFro5O2QUhIyWxU8QmjDrH37mg=; b=HKrkFQR4/LvVS5UbIbJNIq/fBd
	W6/a8OszJPtgIbhvidhWZdf+7VKenPL52fhYDGFKE6GlMtacsQSEkgw2B8hVB4qpVm8PdtSIX9HL1
	RAkqYUNmhFNmaPk5pU1mpXwlBfPY0peyHAg/oCU1wwAHm+Tmw41QVM+8bsamju4ZrHr/eLaUz3XUw
	d0aafVv0zs+VI5BiLRE/UvHPSjLKV5q5EkL8N9jv5vLGUtX6plv6RUvdwcblV58quyIuUrhPijMjo
	iDoQ1PvzQCnFcrwJ8h420+NwSl67yODg3pH3BcMD2ln9/N/DKoGxCRvmWO1sAj4FFqhsxpj+kZaNs
	9c9NOtbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trR4d-00000001Khc-3fkW;
	Mon, 10 Mar 2025 00:32:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trR2x-00000001KbE-1X4F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 00:31:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EC742A45D97;
	Mon, 10 Mar 2025 00:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF5BC4CEE3;
	Mon, 10 Mar 2025 00:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741566665;
	bh=127U7j9Ed6A/U+MTwMIn2yifTZmeLRlUzJiRx4bf5Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eneyuQA7ykopq6S8UEKfLVTAcoh47yfGIyP+jGj+MeeDBzaNFNhxvkIPnaRvDW4GR
	 3ElSa1Rcld7O5AzJkk8twIU5lFCgWiBf5vNLPutmhvohsLYdekOvuQxlcATOOmNSOL
	 oy+78DKZe/m1Q8ZxkYJJvGoPrVwC1BrNfuxgULZNHz65IH/M/37K/rifMBJJpuVcom
	 N+TobUAr9cPgkoULGmReb1NG5sZjys6iojuvRBPAwPXGsncjJKQ2ONRM5aUK0ykDOe
	 yCd+V0vOGqXO+XPoZw9/6/ZJu0a+v7uQNA+ckeDwo4Su72E7JnlkAVup+KFU6O2u9D
	 /UkG5nAGdv14g==
Date: Mon, 10 Mar 2025 00:31:04 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
	catalin.marinas@arm.com, conor+dt@kernel.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com,
	krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
	lenb@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com,
	maz@kernel.org, mingo@redhat.com, oliver.upton@linux.dev,
	rafael@kernel.org, robh@kernel.org, ssengar@linux.microsoft.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de,
	wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com,
	devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	x86@kernel.org, apais@microsoft.com, benhill@microsoft.com,
	bperkins@microsoft.com, sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next v5 06/11] arm64, x86: hyperv: Report the VTL
 the system boots in
Message-ID: <Z84yyAqkqJ2ZyAd-@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-7-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307220304.247725-7-romank@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_173107_608363_3B720435 
X-CRM114-Status: GOOD (  18.06  )
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

On Fri, Mar 07, 2025 at 02:02:58PM -0800, Roman Kisel wrote:
> The hyperv guest code might run in various Virtual Trust Levels.
> 
> Report the level when the kernel boots in the non-default (0)
> one.
> 
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> ---
>  arch/arm64/hyperv/mshyperv.c | 2 ++
>  arch/x86/hyperv/hv_vtl.c     | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
> index a7db03f5413d..3bc16dbee758 100644
> --- a/arch/arm64/hyperv/mshyperv.c
> +++ b/arch/arm64/hyperv/mshyperv.c
> @@ -108,6 +108,8 @@ static int __init hyperv_init(void)
>  	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
>  		hv_get_partition_id();
>  	ms_hyperv.vtl = get_vtl();
> +	if (ms_hyperv.vtl > 0) /* non default VTL */

"non-default".

> +		pr_info("Linux runs in Hyper-V Virtual Trust Level %d\n", ms_hyperv.vtl);
>  
>  	ms_hyperv_late_init();
>  
> diff --git a/arch/x86/hyperv/hv_vtl.c b/arch/x86/hyperv/hv_vtl.c
> index 4e1b1e3b5658..c21bee7e8ff3 100644
> --- a/arch/x86/hyperv/hv_vtl.c
> +++ b/arch/x86/hyperv/hv_vtl.c
> @@ -24,7 +24,7 @@ static bool __init hv_vtl_msi_ext_dest_id(void)
>  
>  void __init hv_vtl_init_platform(void)
>  {
> -	pr_info("Linux runs in Hyper-V Virtual Trust Level\n");
> +	pr_info("Linux runs in Hyper-V Virtual Trust Level %d\n", ms_hyperv.vtl);

Where isn't there a check for ms_hyperv.vtl > 0 here?

Please be consistent across different architectures.

>  
>  	x86_platform.realmode_reserve = x86_init_noop;
>  	x86_platform.realmode_init = x86_init_noop;
> -- 
> 2.43.0
> 
> 


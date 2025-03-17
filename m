Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F681C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 11:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVsaatfJlC8cdki2A8ulnlCzTsVHshj/mrJPTStGR7M=; b=c9aYkpOP8l+7gqUkakDypq9Gty
	jiEx65HmW648fzPf8IXFYYMRVFnnnMgJBBhW7R4zD7Thssvn1cIjAGRu45ERZpiDfSNxQP4Vy5oXX
	GfW0SmkB4czg22GGkS1vDXdi0rc8pkalDRPa1rjQMg3ZHPuBiBimVYmxJhLy/0bbKYSh0o+9t1nt5
	TwZ6jMdco9WNlbzkWOvmxGhb1w5nSoYBHQAsC40cQ0AWmeMGJIUVbWQHInbP6nGV6U6X9ytXj4BGJ
	9TQnhbimHZHezL18op2uGhM2JBefQHhKnyoDxQwFu/PjPDJnCy/CAE24o9svKHuJ2geMU6aVZ+s8D
	fdgEB9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8pH-00000002R56-1Jvj;
	Mon, 17 Mar 2025 11:40:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8nJ-00000002QiW-0QLH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 11:38:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DB3413D5;
	Mon, 17 Mar 2025 04:38:16 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BECB3F694;
	Mon, 17 Mar 2025 04:38:00 -0700 (PDT)
Date: Mon, 17 Mar 2025 11:37:57 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
	catalin.marinas@arm.com, conor+dt@kernel.org,
	dan.carpenter@linaro.org, dave.hansen@linux.intel.com,
	decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
	joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com,
	kys@microsoft.com, lenb@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, maz@kernel.org, mingo@redhat.com,
	oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org,
	ssengar@linux.microsoft.com, sudeep.holla@arm.com,
	suzuki.poulose@arm.com, tglx@linutronix.de, wei.liu@kernel.org,
	will@kernel.org, yuzenghui@huawei.com, devicetree@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, x86@kernel.org, apais@microsoft.com,
	benhill@microsoft.com, bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next v6 02/11] arm64: hyperv: Use SMCCC to detect
 hypervisor presence
Message-ID: <Z9gJlQgV3hm1kxY0@J2N7QTR9R3.cambridge.arm.com>
References: <20250315001931.631210-1-romank@linux.microsoft.com>
 <20250315001931.631210-3-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315001931.631210-3-romank@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_043809_255466_1834E864 
X-CRM114-Status: GOOD (  26.19  )
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

On Fri, Mar 14, 2025 at 05:19:22PM -0700, Roman Kisel wrote:
> The arm64 Hyper-V startup path relies on ACPI to detect
> running under a Hyper-V compatible hypervisor. That
> doesn't work on non-ACPI systems.
> 
> Hoist the ACPI detection logic into a separate function. Then
> use the vendor-specific hypervisor service call (implemented
> recently in Hyper-V) via SMCCC in the non-ACPI case.
> 
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> ---
>  arch/arm64/hyperv/mshyperv.c | 43 +++++++++++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
> index 2265ea5ce5ad..c5b03d3af7c5 100644
> --- a/arch/arm64/hyperv/mshyperv.c
> +++ b/arch/arm64/hyperv/mshyperv.c
> @@ -27,6 +27,41 @@ int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
>  	return 0;
>  }
>  
> +static bool __init hyperv_detect_via_acpi(void)
> +{
> +	if (acpi_disabled)
> +		return false;
> +#if IS_ENABLED(CONFIG_ACPI)
> +	/*
> +	 * Hypervisor ID is only available in ACPI v6+, and the
> +	 * structure layout was extended in v6 to accommodate that
> +	 * new field.
> +	 *
> +	 * At the very minimum, this check makes sure not to read
> +	 * past the FADT structure.
> +	 *
> +	 * It is also needed to catch running in some unknown
> +	 * non-Hyper-V environment that has ACPI 5.x or less.
> +	 * In such a case, it can't be Hyper-V.
> +	 */
> +	if (acpi_gbl_FADT.header.revision < 6)
> +		return false;
> +	return strncmp((char *)&acpi_gbl_FADT.hypervisor_id, "MsHyperV", 8) == 0;
> +#else
> +	return false;
> +#endif
> +}
> +

The 'acpi_disabled' variable doesn't exist for !CONFIG_ACPI, so its use
prior to the ifdeffery looks misplaced.

Usual codestyle is to avoid ifdeffery if possible, using IS_ENABLED().
Otherwise, use a stub, e.g.

| #ifdef CONFIG_ACPI
| static bool __init hyperv_detect_via_acpi(void)
| {
| 	if (acpi_disabled)
| 		return false;
| 	
| 	if (acpi_gbl_FADT.header.revision < 6)
| 		return false;
| 	
| 	return strncmp((char *)&acpi_gbl_FADT.hypervisor_id, "MsHyperV", 8) == 0;
| }
| #else
| static inline bool hyperv_detect_via_acpi(void) { return false; }
| #endif

Mark.

> +static bool __init hyperv_detect_via_smccc(void)
> +{
> +	uuid_t hyperv_uuid = UUID_INIT(
> +		0x4d32ba58, 0x4764, 0xcd24,
> +		0x75, 0x6c, 0xef, 0x8e,
> +		0x24, 0x70, 0x59, 0x16);
> +
> +	return arm_smccc_hyp_present(&hyperv_uuid);
> +}
> +
>  static int __init hyperv_init(void)
>  {
>  	struct hv_get_vp_registers_output	result;
> @@ -35,13 +70,11 @@ static int __init hyperv_init(void)
>  
>  	/*
>  	 * Allow for a kernel built with CONFIG_HYPERV to be running in
> -	 * a non-Hyper-V environment, including on DT instead of ACPI.
> +	 * a non-Hyper-V environment.
> +	 *
>  	 * In such cases, do nothing and return success.
>  	 */
> -	if (acpi_disabled)
> -		return 0;
> -
> -	if (strncmp((char *)&acpi_gbl_FADT.hypervisor_id, "MsHyperV", 8))
> +	if (!hyperv_detect_via_acpi() && !hyperv_detect_via_smccc())
>  		return 0;
>  
>  	/* Setup the guest ID */
> -- 
> 2.43.0
> 


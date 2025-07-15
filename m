Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55E8C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 15:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PxjOPRtWVDq/kIBKW1PKXhG7ZPQlEAOtcZY2+jXvAo=; b=AT2ZpVua+7rIr4A3LUGmccZk+U
	gJHY7kTQslg+mmXwlNXNUcOMRYDissBoBX28qG6Z4DFRFbMH+HzmWwu1LqwbCKmMvjCNqb+7ByZqd
	YRs1Zp4iMph8X0ej/ZOei+A7HGekOGDa93T8WhAqKl2RnbnGZvmNT/3yq9tU7PkPmRfUsmWeEd3cH
	DSwY6S+K8Z8lwD7M8Ja12kEy3fczYiakRtfp+a45f43OvgI3sVZDFoMsnvGtyaEYQVOQv7AmBd5SP
	280WKFBhH0KpwMRDs1GI4A2uh45jPff9gyP48DrG0Yo3lCqsgQR7csPj/lzBv37Q3DwC1m0cos03j
	F7TMaBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhWv-00000005aPr-4Bh7;
	Tue, 15 Jul 2025 15:25:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubg90-00000005HYb-3FEd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B0585C6430;
	Tue, 15 Jul 2025 13:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E40BC4CEF4;
	Tue, 15 Jul 2025 13:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752587789;
	bh=lxGBZXNmhK90ryWWn0M7PYKuPCR44PJj8beihaNQ+Ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i3NGqv8dP/JBoVgVbxCCriGVEnXIwsXQfxcVZH2gydseuhgM9yWEXUVeD3GCL3mkw
	 TtY4K48KM5pXNdqg905NST600zSShNNGVZO7c0gTifOhgkNTbQZzr5auV7gqM5vibo
	 pYDGkhc5+HyRCBcXnhdN10vOoQMH9jMglQBISlSzYrYaZU5WR12tMtDIYUZ9X/d3cS
	 Mzohib4qA6a3F2hukyo8bJ8aKvK3F0JyuRca3v2pJbkK8U2iPbCx2A8txLIVyjRYfX
	 IsTjmXL47ylLpM8pmseKsqNdXXiQCaCSWYq6mqaZ+8eMh2jt4nXA89Zw70cEYa5zW1
	 Gwp2cu3KywxRA==
Date: Tue, 15 Jul 2025 14:56:24 +0100
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	sami.mujawar@arm.com, aneesh.kumar@kernel.org, steven.price@arm.com,
	linux-kernel@vger.kernel.org, sudeep.holla@arm.com
Subject: Re: [PATCH 3/3] arm64: acpi: Enable ACPI CCEL support
Message-ID: <aHZeCKNyDeZEsuCt@willie-the-truck>
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
 <20250613111153.1548928-4-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613111153.1548928-4-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_065630_852053_8CDE2E30 
X-CRM114-Status: GOOD (  14.94  )
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

On Fri, Jun 13, 2025 at 12:11:53PM +0100, Suzuki K Poulose wrote:
> ACPI CCEL memory area is reported as Non-Volatile storage area. Map it as
> PAGE_KERNEL.

It would be helpful to have a citation for that. I've tried digging it
out of the ACPI spec, but that pointed me to the Intel TDX site and I
got lost in whitepapers :/

> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  arch/arm64/kernel/acpi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index b9a66fc146c9..f52439d411a0 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -356,6 +356,11 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
>  			prot = PAGE_KERNEL_RO;
>  			break;
>  
> +		case EFI_ACPI_MEMORY_NVS:
> +			/* Non-volatile storage, required for CCEL */
> +			prot = PAGE_KERNEL;

By "storage" you just mean memory, right?

Will


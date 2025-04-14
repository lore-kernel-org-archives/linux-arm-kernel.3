Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C142EC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 13:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlG+wXXn95cudNexY4tQr8ILV3DH554o/1Y1jJdIS58=; b=aostFv6kxUoqgYG4uLC56GmA8n
	JkvpCaxCfr8CqgfGFv5Gc6qQn3/EXi2kd9CWYE3ldB8WZMxljSR1gRnvKdoLFeL7C59g8V+MHaXvZ
	GwMf3ldD4zI6YeHF3Z1GZV8dEqiH/uuUG6TsC56K003ZPdEj50j4IOG5e+l283E4c3dNF2Eyot2L0
	HjrD4QLLsC7/T27zwSJWlUWs9JSljUea3oNEvCY1AUzs2zRmHsFAwb3rHLE41WZT93OGNrs6BJTfA
	pmCPSG7ezN+zPAPRhNZ5VN1w7H8auYfwRpuTphBRc1O5beKe25BKPBGcyn1UmdP34ZRDDj3t/TfJ1
	yZRREvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KGi-00000002FKB-1FmL;
	Mon, 14 Apr 2025 13:54:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KCB-00000002ET8-2dxO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 13:49:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BBF85C560E;
	Mon, 14 Apr 2025 13:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73B4C4CEE2;
	Mon, 14 Apr 2025 13:49:52 +0000 (UTC)
Date: Mon, 14 Apr 2025 14:49:50 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ross Stutterheim <ross.stutterheim@garmin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ross.sweng@gmail.com, Mike Rapoport <rppt@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] arm[64]/memremap: fix arch_memremap_can_ram_remap()
Message-ID: <Z_0SfqQHsKs3S1cn@arm.com>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414133219.107455-1-ross.stutterheim@garmin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_064955_709860_559D4AB5 
X-CRM114-Status: GOOD (  20.70  )
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

Please cc the maintainers and the original contributor of the commit you
are fixing, otherwise the patch may not be noticed.

On Mon, Apr 14, 2025 at 08:32:19AM -0500, Ross Stutterheim wrote:
> commit 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure
> presence of linear map") added the definition of
> arch_memremap_can_ram_remap() for arm[64] specific filtering of what pages
> can be used from the linear mapping. memblock_is_map_memory() was called
> with the pfn of the address given to arch_memremap_can_ram_remap();
> however, memblock_is_map_memory() expects to be given an address, not a
> pfn.
> 
> This results in calls to memremap() returning a newly mapped area when
> it should return an address in the existing linear mapping.
> 
> Fix this by removing the address to pfn translation and pass the
> address directly.
> 
> Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map")
> Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>
> ---
>  arch/arm/mm/ioremap.c   | 4 +---
>  arch/arm64/mm/ioremap.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
> index 748698e91a4b..27e64f782cb3 100644
> --- a/arch/arm/mm/ioremap.c
> +++ b/arch/arm/mm/ioremap.c
> @@ -515,7 +515,5 @@ void __init early_ioremap_init(void)
>  bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
>  				 unsigned long flags)
>  {
> -	unsigned long pfn = PHYS_PFN(offset);
> -
> -	return memblock_is_map_memory(pfn);
> +	return memblock_is_map_memory(offset);
>  }

This indeed needs fixing.

> diff --git a/arch/arm64/mm/ioremap.c b/arch/arm64/mm/ioremap.c
> index 10e246f11271..48c38c986b95 100644
> --- a/arch/arm64/mm/ioremap.c
> +++ b/arch/arm64/mm/ioremap.c
> @@ -51,7 +51,5 @@ void __init early_ioremap_init(void)
>  bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
>  				 unsigned long flags)
>  {
> -	unsigned long pfn = PHYS_PFN(offset);
> -
> -	return pfn_is_map_memory(pfn);
> +	return pfn_is_map_memory(offset);

This is already correct.

-- 
Catalin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF40DC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 02:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gm1IYV1nJ0jwPipfaqojaJIo57O27pxsSZEm6UjiBK8=; b=zmiX7Xk+0TCfvnKH6BN6rbHQ3O
	OwA9+GsyOo4ATzOupVx4eA1CK9ssDa+1mqqNXmZ64LWUUe1j8wRohnW6mhm6vGRhDafe9nppG8lVD
	FbMkZcI9XKmYbYrSrAhKZQWfn0dnpT71dUcdhoXdpvUbeEhHcV+6efkmgFfJ3XSc4wROQNARCOPZ+
	uOpVswHb1k+OUz8WGfHVkRpyvq066b0PEl2LhKxpWJtBB3ESUXDPHMW4eEjqYb5eUhJaCpzZLHHPQ
	/g+fdyAu8bXFOQfQPtvEMhGaIcYAQpfctrJdO3iSBuC/bT1GedwRM5Jg/D0paTXHzDCkeclocqMdd
	ZNjww8KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf82g-00000008tDY-0AqK;
	Fri, 25 Jul 2025 02:20:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf7yp-00000008sq3-04se
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 02:16:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 548881A00;
	Thu, 24 Jul 2025 19:16:07 -0700 (PDT)
Received: from [10.164.146.15] (unknown [10.164.146.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A3693F5A1;
	Thu, 24 Jul 2025 19:16:11 -0700 (PDT)
Message-ID: <90864bf5-2edb-4901-9566-c89431c6d717@arm.com>
Date: Fri, 25 Jul 2025 07:46:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: allow NR_CPUS=1 for non-SMP and adjust default
 accordingly
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250724165639.13926-1-suchitkarunakaran@gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250724165639.13926-1-suchitkarunakaran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_191615_100260_97DC9E38 
X-CRM114-Status: GOOD (  14.57  )
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

On 24/07/25 10:26 PM, Suchit Karunakaran wrote:
> The arm64 Kconfig for NR_CPUS previously required a minimum of 2 CPUs.
> This patch changes the minimum allowed CPUs to 1, enabling single-core
> non-SMP configurations.
> 
> Additionally, the default value for NR_CPUS is now conditional:
> - Defaults to 1 if SMP is not selected (non-SMP systems)
> - Defaults to 512 if SMP is enabled

Just curious - what actually prompted this change ?

> 
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>  arch/arm64/Kconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 393d71124f5d..9b2970f7c5ec 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1528,9 +1528,10 @@ config SCHED_SMT
>  	  places. If unsure say N here.
>  
>  config NR_CPUS
> -	int "Maximum number of CPUs (2-4096)"
> -	range 2 4096
> -	default "512"
> +	int "Maximum number of CPUs (1-4096)"
> +	range 1 4096
> +	default "1" if !SMP
> +	default "512" if SMP
>  
>  config HOTPLUG_CPU
>  	bool "Support for hot-pluggable CPUs"




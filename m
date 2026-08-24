Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9FEC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 12:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCcgY3lLh6ue860a/zVapP8m6zMDu6P19pQqsgn1ByA=; b=m2u1WtUZnWN+4Pfd8Uh/iAN03c
	nye5WSMEjIbRpPEMiaRzH7SqOI2V32uQcdDUjVGoyZSdSDKpQ7ve2XDjB9lE/u7wsERzUzzN0X+aM
	bMxDn5aqpTA4w/rwbL6yCL0aA5lMSylKHpnh4wU7xCVf/vP7Xv8P2ugEIkyUYLW2KvLCSW5gJ2hwx
	K8JjWDG5zKYinY3033Bdc6SIGX3YugVb3eb3XCqjHRLHBih7aikOJygeKdo4o5FT3QKU7tv8LsbA6
	MO9cOFH2D+BVSjmHmRfnINwct29xM2j+m+G4bTWHhutgKw3BucJOG/hRylAIP+nDLrSNuqaRomPJE
	3UEGMLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTjW-0000000GbKD-0oVu;
	Mon, 24 Aug 2026 12:24:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTjT-0000000GbJm-1nZM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 12:24:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1AF21570;
	Mon, 24 Aug 2026 05:24:48 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCF303F85F;
	Mon, 24 Aug 2026 05:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787574292; bh=y57nrII56IaKQCTkiVNkBmQs5pkbLltNP8lUNCbyO6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jym1L6H92LJ/ZEJ0f6m2PDeg5wOYnfGAe7lasGu2UlAEFzUhhpJ4ysD5Ged73UoCs
	 AYvCSuS7g1mUxW7/HmqK0QL62fCiICEFeVuQaaQKPDeKC/BMFOrAdDQPY7Ibc7CUpg
	 CNfIOWekQZ3G0R36KR+1NQ62WmegcqwE3HAhed30=
Date: Mon, 24 Aug 2026 13:24:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2] arm64: Defer the GMID_EL1 read to
 {init,update}_cpu_features()
Message-ID: <aow4D2g2nZNwN285@arm.com>
References: <20260824071004.504894-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824071004.504894-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_052455_528355_8E47A8EE 
X-CRM114-Status: GOOD (  17.80  )
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

On Mon, Aug 24, 2026 at 08:10:04AM +0100, Fuad Tabba wrote:
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index d50e2a9b066b3..c8967f185e3dd 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -502,12 +502,14 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
>  	info->reg_id_aa64smfr0 = read_cpuid(ID_AA64SMFR0_EL1);
>  	info->reg_id_aa64fpfr0 = read_cpuid(ID_AA64FPFR0_EL1);
>  
> -	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
> -		info->reg_gmid = read_cpuid(GMID_EL1);
> -
>  	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
>  		__cpuinfo_store_cpu_32bit(&info->aarch32);
>  
> +	/*
> +	 * info->reg_gmid deferred to {init,update}_cpu_features because
> +	 * reading it traps to EL2 when MTE is disabled.
> +	 */

The only nit I have is that cpu_data[0] now won't have the GMID_EL1 set.
It doesn't matter as we don't expose it via c_show() or sysfs, rather
for consistency. We have this inconsistency already with mpamidr.

I guess we just need to call init_cpu_features() on the per-CPU data
before the assignment to boot_cpu_data. Something like (untested):

diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index d50e2a9b066b..d22f3514ab8b 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -538,7 +538,7 @@ void __init cpuinfo_store_boot_cpu(void)
 {
 	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
 	__cpuinfo_store_cpu(info);
+	init_cpu_features(info);

 	boot_cpu_data = *info;
-	init_cpu_features(&boot_cpu_data);
 }

Either way:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91175FA1FD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=au1/Y/FxOOe/1Nq4zSa0lPaX6+N/GD25n5fEukrhYdw=; b=fU1MEI1pQ6RaAB7/f/DbbRcIuB
	8NcvU2cUPHXvHRiqut5p8NDYXGVWwzaY63xDBqV8Y+YdhH1kAdUjXxUDq/9vtpnOUg62EbP10fnAj
	W8LAZ4Hf4+fAqRmZt+M1JWEYYqui+sUIhmj9Oj88fHOf3UX5VbR4Tula6ihxk1Xo9lyUyXHy4eUQw
	1RiT+jAhewKjdxg+wDu2zq6EHrESFOUREt0BIDy6n9q6Efn/qK08TMAsu0jF7nH5Sie36+guGm+Wi
	NC2LrdXJEH3/0Ro1FXWE3bjGqHoijm9NiYMVSft6njKFB8WBxo2r9NdSojBIpwE/jxUJOKfeLuMTB
	W8PvhABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbBO-0000000AYNp-3QY3;
	Wed, 22 Apr 2026 17:16:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbBM-0000000AYNU-1mEY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:16:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EACA31F37;
	Wed, 22 Apr 2026 10:16:02 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CB8E3F641;
	Wed, 22 Apr 2026 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776878168; bh=LVmvJGYdkwynjW2RgSaR1jTwKn3MAEF8tFIFGVj7kBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUj0B2iM/oQRJ+TaA66CaUWXCrSplp8LiRNBnfwE+NG5idlz4LhH5m2UpkdxkRj6W
	 JpinZJOCVnSPpckKW2B0SpY4ry2bJfcvfQO2gG/b9eCpLGaP5UCI9wYorgYLRxbSQJ
	 EIFpRRaG+cNce+22qoUVYf/4ziOe39qbn+M/eRtQ=
Date: Wed, 22 Apr 2026 18:16:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Pengjie Zhang <zhangpengjie2@huawei.com>
Cc: will@kernel.org, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, mrigendra.chaubey@gmail.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	zhanjie9@hisilicon.com, zhenglifeng1@huawei.com,
	lihuisong@huawei.com, yubowen8@huawei.com, linhongye@h-partners.com,
	linuxarm@huawei.com, wangzhi12@huawei.com
Subject: Re: [PATCH] arm64: smp: Limit nr_cpu_ids under nosmp
Message-ID: <aekCUnZAE8bSfNfO@arm.com>
References: <20260422095831.2926775-1-zhangpengjie2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422095831.2926775-1-zhangpengjie2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_101612_508872_6A5AE41C 
X-CRM114-Status: GOOD (  25.60  )
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

On Wed, Apr 22, 2026 at 05:58:31PM +0800, Pengjie Zhang wrote:
> Under nosmp (maxcpus=0), arm64 never brings up secondary CPUs.
> 
> However, arm64 still enumerates firmware-described CPUs during SMP
> initialization, so secondary CPUs can remain visible to
> for_each_possible_cpu() users even though they never reach the
> bringup path in this configuration.
> 
> This is not just a cosmetic mask mismatch: code iterating over
> possible CPUs may observe secondary CPU per-CPU state that is never
> fully initialized under nosmp.
> 
> Limit nr_cpu_ids to 1 in arch_disable_smp_support() so that
> secondary CPUs are not set up on arm64 when nosmp/maxcpus=0 is in
> effect.
> 
> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
> ---
>  arch/arm64/kernel/smp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 1aa324104afb..cc34c68871e9 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -435,6 +435,15 @@ static void __init hyp_mode_check(void)
>  	}
>  }
>  
> +void __init arch_disable_smp_support(void)
> +{
> +	/*
> +	 * Under nosmp/maxcpus=0, only the boot CPU can ever be brought up.
> +	 * Limit nr_cpu_ids so that secondary CPUs are never set up.
> +	 */
> +	set_nr_cpu_ids(1);
> +}

I don't think that's the right fix. We don't have anything like the x86
ioapic to disable in this function, so no need to implement it. If
nr_cpu_ids must be 1 with nosmp/maxcpus=0, I'd rather do this in the
generic code. It need some alignment with other architectures if we are
to do this early. IOW, is nosmp equivalent to nr_cpus=1?

In the meantime, for arm64, we can do something like below and let the
generic code set nr_cpu_ids() via start_kernel() -> setup_nr_cpu_ids().

-------------8<-------------------
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..7364481cc03a 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -754,6 +754,13 @@ void __init smp_init_cpus(void)
 		return;
 	}

+	/*
+	 * For the nosmp/maxcpus=0 case, do not mark the secondary CPUs
+	 * possible.
+	 */
+	if (!setup_max_cpus)
+		return;
+
 	/*
 	 * We need to set the cpu_logical_map entries before enabling
 	 * the cpus so that cpu processor description entries (DT cpu nodes



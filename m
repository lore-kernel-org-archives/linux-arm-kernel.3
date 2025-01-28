Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FFFC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahdge0QUwliWZ+qdKtKtNEd4cOqBBXG11y1XcJiFXpA=; b=uIld+Wt8qH+83PbP1eAzEk5LDZ
	jBhIM50lCnt3cfz7BrCPbXuBI6O1XJ2Xch/ygU4pItqxPcYasJHKpjoTN1bMKyvaGFdriTrBz+HJG
	EKMNYG4QhekVbW5hfcOW6+eDTiXtjgLiGhxTtgOL/e208gNuO77QSulDQ992DIhqQWGP3cA4Svd1s
	esVVVGlsXjBJCQ0Ok8IoyID9odGaBV1AhPKKF3OlOONKy/RzYjwF/KE+8ysN4Slr49RjP6lRJt+Gp
	n7/NgGRu8wxCVv1Z0ms6XtlRouqP3oyXI6vypv/ht19pZxA7YjU4cTBoISM+IKBV07Lg5TqDZl/Hv
	Bjnck3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjCj-00000004hAp-1ypz;
	Tue, 28 Jan 2025 10:52:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjBO-00000004gww-0cTw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 10:51:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1037EA40C82;
	Tue, 28 Jan 2025 10:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89DCC4CED3;
	Tue, 28 Jan 2025 10:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738061460;
	bh=CbE7VaYsCScvQSvzHBNrm7SCEjIu6kV93dcFx8P3ahY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FdHDlTnwB4+fm1W39i9KCCxvRU+q7Alfr1jUUmDAREgEW87zYjBlIQmawYHyjGKJT
	 +uqlwxWPptQMD9O69KOvqFGvtPNjXGC7cy3iic0MHhxR8UCGA1+p4T9Qd08RFkM87M
	 eSYx3uX+gs2vR1HtjjrOjZW9SOXGF+GbHltx2grWkaRbl7Nm6X3ydKYPHAQxk3Exg2
	 HHzcwjxaPPkm3ae5/0XYlbXV0EPHfvDbHEHdgeevPVqDxyhYdaP98/jUJGnWzhlpjN
	 71l9Pkbgs/es38EsoWRu2HVjmnIYwQC/f1SFyMp3FTFWPIlHIXa6SQUEnC0lnGoqV+
	 Ic+eNeUG9cbhA==
Date: Tue, 28 Jan 2025 11:50:55 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Zheng Zengkai <zhengzengkai@huawei.com>, stable@vger.kernel.org
Subject: Re: [PATCH] ACPI: GTDT: Relax sanity checking on Platform Timers
 array count
Message-ID: <Z5i2j9gFB2iyN9g4@lpieralisi>
References: <20250128001749.3132656-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128001749.3132656-1-oliver.upton@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_025102_315509_EB51E0AA 
X-CRM114-Status: GOOD (  26.79  )
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

On Tue, Jan 28, 2025 at 12:17:49AM +0000, Oliver Upton wrote:
> Perhaps unsurprisingly there are some platforms where the GTDT isn't

https://lore.kernel.org/lkml/Zw6b3V5Mk2tIGmy5@lpieralisi

An accident waiting to happen :)

> quite right and the Platforms Timer array overflows the length of the
> overall table.
> 
> While the recently-added sanity checking isn't wrong, it makes it
> impossible to boot the kernel on offending platforms. Try to hobble
> along and limit the Platform Timer count to the bounds of the table.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Zheng Zengkai <zhengzengkai@huawei.com>
> Cc: stable@vger.kernel.org
> Fixes: 263e22d6bd1f ("ACPI: GTDT: Tighten the check for the array of platform timer structures")
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  drivers/acpi/arm64/gtdt.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
> index 3561553eff8b..70f8290b659d 100644
> --- a/drivers/acpi/arm64/gtdt.c
> +++ b/drivers/acpi/arm64/gtdt.c
> @@ -163,7 +163,7 @@ int __init acpi_gtdt_init(struct acpi_table_header *table,
>  {
>  	void *platform_timer;
>  	struct acpi_table_gtdt *gtdt;
> -	int cnt = 0;
> +	u32 cnt = 0;
>  
>  	gtdt = container_of(table, struct acpi_table_gtdt, header);
>  	acpi_gtdt_desc.gtdt = gtdt;
> @@ -188,13 +188,17 @@ int __init acpi_gtdt_init(struct acpi_table_header *table,
>  		cnt++;
>  
>  	if (cnt != gtdt->platform_timer_count) {
> +		cnt = min(cnt, gtdt->platform_timer_count);

Thank you for reporting this.

There is something I need to understand.

What's wrong cnt (because platform_timer_valid() fails for some
reason on some entries whereas before the commit we
are fixing was applied we *were* parsing those entries) or
gtdt->platform_timer_count ?

I *guess* the issue is the following:

gtdt->platform_timer_count reports the number of GT blocks in the
GTDT not including Arm generic watchdogs, whereas cnt counts both
structure types (and that's what gtdt->platform_timer_count should
report too if it was correct).

I am asking just to understand if platform_timer_valid() forced skipping
some entries that we were parsing before the commit we are fixing
was applied I doubt it but it is worth checking.

> +		pr_err(FW_BUG "limiting Platform Timer count to %d\n", cnt);
> +	}`
> +
> +	if (!cnt) {
>  		acpi_gtdt_desc.platform_timer = NULL;
> -		pr_err(FW_BUG "invalid timer data.\n");
> -		return -EINVAL;
> +		return 0;
>  	}
>  
>  	if (platform_timer_count)
> -		*platform_timer_count = gtdt->platform_timer_count;
> +		*platform_timer_count = cnt;

I think this should be fine as things stand (but see above).

It is used in:

gtdt_sbsa_gwdt_init() - just to check if there are platform timers entries

arch_timer_mem_acpi_init() - to create a temporary array to init arch mem timer
			     entries (the array is oversized because it
			     includes watchdog entries in the count)

In both cases taking the

min(cnt, gtdt->platform_timer_count);

should work AFAICS (hard to grok though, we - as in ACPI maintainers -
need to clean this up).

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

>  
>  	return 0;
>  }
> 
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> -- 
> 2.48.1.262.g85cc9f2d1e-goog
> 


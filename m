Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F188CCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uu1wFpZeCjopmr+GSMhw53hpUYCOBNjI1GweFoT+yM=; b=TxLFz+KEMkmm0yN5s8rhYKmkco
	feonju707X9WbV56KcWCyoYr0sMICNipNpRBxwcmP59RncbsVF1S/Ymdgc3OyrLHbXy+6tTcsQik1
	ugpQChEAUPCig4UhZYQ4FvfHT2uoGHBorOfcN52bKIOI6Hi1KbrkoDX6YoWL6lyXAKkqH8afWJj3U
	e7wsSc9+JToJiNz6AGOPCUv+8MJy5DBAtJzx6d3K/B9bRhL8S/Pj2nb+zq4+stisISNo18Y+ZYtfw
	oJMuA86kGi3nsVmBMQ/VQ+opOM8kCbfqUz+n6c5iRgPD9Dz5j79+2ojTXMc504XEjD1Lruas65aGK
	I9Gy/CUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDzz-0000000FAJK-0KXZ;
	Wed, 27 Aug 2025 11:07:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urCaC-0000000Es4V-36t1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 09:36:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77F3D15A1;
	Wed, 27 Aug 2025 02:36:35 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 466153F738;
	Wed, 27 Aug 2025 02:36:42 -0700 (PDT)
Date: Wed, 27 Aug 2025 10:36:16 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: will@kernel.org, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drivers: perf: use us_to_ktime() where appropriate
Message-ID: <aK7RkB5p6L17Ffuw@J2N7QTR9R3>
References: <20250813083257.504573-1-zhao.xichao@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813083257.504573-1-zhao.xichao@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_023644_834049_F636D57D 
X-CRM114-Status: GOOD (  15.80  )
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

[adding Robin and LAKML]

On Wed, Aug 13, 2025 at 04:32:57PM +0800, Xichao Zhao wrote:
> The arm_ccn_pmu_poll_period_us are more suitable for using
> the us_to_ktime(). This can make the code more concise and
> enhance readability.
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>

Superficially this looks fine to me, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Will, I assume that (if no-one complains) you'll pick this up when
queueing PMU patches.

Mark.

> ---
>  drivers/perf/arm-ccn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm-ccn.c b/drivers/perf/arm-ccn.c
> index 1a0d0e1a2263..8af3563fdf60 100644
> --- a/drivers/perf/arm-ccn.c
> +++ b/drivers/perf/arm-ccn.c
> @@ -565,7 +565,7 @@ module_param_named(pmu_poll_period_us, arm_ccn_pmu_poll_period_us, uint,
>  
>  static ktime_t arm_ccn_pmu_timer_period(void)
>  {
> -	return ns_to_ktime((u64)arm_ccn_pmu_poll_period_us * 1000);
> +	return us_to_ktime((u64)arm_ccn_pmu_poll_period_us);
>  }
>  
>  
> -- 
> 2.34.1
> 


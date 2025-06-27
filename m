Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521FEC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPvS6wYBfzfQP1OZhWj/wHH3TwVfjBkagDqpJhgf2p4=; b=3BEy0U26pus8IGevQrx7d6d/m8
	nKmvoBdvQdbl3NValy1qE16ZnnoIXUDNJtm0x+GzTNSO68+0rbatsONpLmuzAcBqYLeWhP0YfnDGL
	XkO32hGIoSpDSkUEWEUQMNoc1JWQo8ixDSoGTzK6kwWYGlpivmdMyEx62VCGYcgJSWyYLHwB6m1qh
	xRTsJgNAoNlxsZHmx8N0bXTYwCi7CJqorywEJWv1DD+tCrmOakD/JtZQliV79/xbyHQ4TnS3XLEMh
	siqY/RHvHgj6+ChhQKlTsmR6Dl9Jcr4feMQKgqa/zlhqkph3ReHJ/39qeZf3nXuYkKN0obO9iR+BI
	vu37OCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBzR-0000000FHTM-1XYg;
	Fri, 27 Jun 2025 16:31:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVB7G-0000000F7nw-1fbc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:35:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C9A275C6B64;
	Fri, 27 Jun 2025 15:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BF2C4CEE3;
	Fri, 27 Jun 2025 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751038549;
	bh=6r6yNgBl2Q/udgdOnayZLCbOJinCM3FG3OjI2mrbdUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huZiV64wsF9OuZFdgkb6C9iNHxlVTBfhGlaoVocJRS5x9pdGZ7U3zWbeEJgg7kWoQ
	 wlqJKDd4JIsFKgeMS1YITuaArEMEe6abBGWwApKWXOXAQwK4wgWPf5Z5jLal2HcdbA
	 Z5vyf0zQiPi3RJtDly4If0uU/h8H6PyXYPK8BBUJoZYmQLfZA+8sKQ2TLVKROI6F0e
	 kAIsGWzD3lFfX352/fFBitV7BAN0+lpOE3cje7Yi9Zhd8A6SRfFydiam/phlfGAcfw
	 dhwJvR6b5vWFoUII7p1YvAq7tR6L8fCvYOiC4tNxuUYuJ59SEh/lR36+S8G4wADKhN
	 uJON16TNpxLOw==
Date: Fri, 27 Jun 2025 16:35:43 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, akpm@linux-foundation.org,
	dianders@chromium.org, sumit.garg@linaro.org, kernelfans@gmail.com,
	lecopzer.chen@mediatek.com, tglx@linutronix.de, song@kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathan.cameron@huawei.com,
	zhanjie9@hisilicon.com, prime.zeng@hisilicon.com,
	yangyicong@hisilicon.com, linuxarm@huawei.com
Subject: Re: [RESEND PATCH v2 2/2] arm64/watchdog_hld: Add a cpufreq notifier
 for update watchdog thresh
Message-ID: <aF66T0dgV8IpvlF_@willie-the-truck>
References: <20250619114805.16968-1-yangyicong@huawei.com>
 <20250619114805.16968-3-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619114805.16968-3-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_083550_488733_5F3D6C99 
X-CRM114-Status: GOOD (  15.88  )
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

On Thu, Jun 19, 2025 at 07:48:05PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> arm64 depends on the cpufreq driver to gain the maximum cpu frequency
> to convert the watchdog_thresh to perf event period. cpufreq drivers
> like cppc_cpufreq will be initialized lately after the initializing of
> the hard lockup detector so just use a safe cpufreq which will be
> inaccurency. Use a cpufreq notifier to adjust the event's period to
> a more accurate one.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  arch/arm64/kernel/watchdog_hld.c | 58 ++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/kernel/watchdog_hld.c b/arch/arm64/kernel/watchdog_hld.c
> index dcd25322127c..e55548cb26df 100644
> --- a/arch/arm64/kernel/watchdog_hld.c
> +++ b/arch/arm64/kernel/watchdog_hld.c
> @@ -34,3 +34,61 @@ bool __init arch_perf_nmi_is_available(void)
>  	 */
>  	return arm_pmu_irq_is_nmi();
>  }
> +
> +static int watchdog_perf_update_period(void *data)
> +{
> +	int cpu = raw_smp_processor_id();

Why raw?

Will


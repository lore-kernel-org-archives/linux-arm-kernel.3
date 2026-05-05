Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F93ECD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=F5hOpaU3JfhbOlF5IAmWy/xLn4EDl4wT+1atWKZBpuU=; b=0PHFxuT2bRyOv6
	TUaRq4G2h1ALBcJgJM1Th7zSsQ/kiURBi0Oo/DbJ77HPcQUYWqQAlJKmiftAHhwe+Us2yjGrgUzih
	n4gPwdqXT8oZbk4lU+/i6D6MaYw/8/7hsZskgZltgsaa+mn1sRy3mrJhRouzLHmb2kmxDvqTd8/SK
	kXuKap7x3qciQ0u/zL84XBnoYO2erzFdVMaaXC8TydOLdwvKyKmQBkXDLCkIXk7L5Wr8Ug3ZXkq31
	FedSl2J+9n3w8PjaUvSfcNf388irtQFgeSYSy3hPuUtT9gogseNoSJZpF04BVtZTk7NZzsLeq1Myt
	XBaYAQwkj8piVLF9ZiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBU8-0000000FZvQ-3DSD;
	Tue, 05 May 2026 08:50:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBU7-0000000FZvD-2TAP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 08:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E39460125;
	Tue,  5 May 2026 08:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A40C2BCB9;
	Tue,  5 May 2026 08:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777971030;
	bh=TSABjFUKhaSPriZfG4wryerz/Bt+NOXbdIcM8wPv6lQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BM6xynsQg5t4v96vNM57GMBYQb2A6y0jIBSCJ1tNnpZjwFujDCsmkMWtA5LeCurye
	 rSDsVZV524Bqe5cKvZf0/fWuFD4iw3O5IwiDCeezs9veuOkoYd5oQNj+DJM4co9XaQ
	 HC7ayxUWUyEpqVw6CjN7+SoUyybK9uRruBBAX77sZdK+3p58u5JhHEcGpHYZPWLZq+
	 v5oIrBujP0veRImQOI2qYUwlq1m9UnLvXXoRxWll3WrQhoFX6DgwlzK6nFaAFc/ATO
	 SBnBgqWZ85ho0kwHcU2HOMEfTTJw87fUPLeUGXMOzW1Na9UqExbYACZHoxKILym5lk
	 SXWmfmMEyuFEA==
Date: Tue, 5 May 2026 09:50:26 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Vastargazing <vebohr@gmail.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 4/5] perf: arm: pmu: fix reference leak on failed device
 registration
Message-ID: <20260505-bold-kind-herring-2c7eef@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <243cb3737b41fae32a09117c17809a210395e69f.1777889235.git.vebohr@gmail.com>
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

On Mon, May 04, 2026 at 01:08:46PM +0300, Vastargazing wrote:
> When platform_device_register() fails in arm_acpi_register_pmu_device(),
> the embedded struct device has already been initialized by
> device_initialize() inside platform_device_register(). The error path
> unregisters the GSI interrupt but returns without dropping the device
> reference:
> 
>   arm_acpi_register_pmu_device()
>     -> platform_device_register(pdev)
>        -> device_initialize(&pdev->dev)   /* kref = 1 */
>        -> platform_device_add(pdev)       /* fails */
>     <- acpi_unregister_gsi() called, but kref still 1
> 
> Per platform_device_register() kernel-doc:
> 
>   NOTE: _Never_ directly free @pdev after calling this function, even if
>   it returned an error! Always use platform_device_put() to give up the
>   reference initialised in this function instead.
> 
> Fix this by calling platform_device_put() in the error branch before
> unregistering the GSI.
> 
> Fixes: d24a0c7099b3 ("arm_pmu: acpi: spe: Add initial MADT/SPE probing")
> Cc: stable@vger.kernel.org
> Assisted-by: GitHub Copilot (Claude Sonnet 4.5)
> Signed-off-by: Vastargazing <vebohr@gmail.com>
> ---
>  drivers/perf/arm_pmu_acpi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm_pmu_acpi.c b/drivers/perf/arm_pmu_acpi.c
> index e80f76d95e68..c2defbc32ad9 100644
> --- a/drivers/perf/arm_pmu_acpi.c
> +++ b/drivers/perf/arm_pmu_acpi.c
> @@ -119,8 +119,10 @@ arm_acpi_register_pmu_device(struct platform_device *pdev, u8 len,
>  
>  	pdev->resource[0].start = irq;
>  	ret = platform_device_register(pdev);
> -	if (ret)
> +	if (ret) {
> +		platform_device_put(pdev);

Both spe_dev and trbe_dev using this are statically allocated, what am I
missing here ? What will platform_device_put() do ?

-- 
Regards,
Sudeep


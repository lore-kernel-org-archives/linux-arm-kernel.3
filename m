Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA4FCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 16:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ay9m4UIK0bO7+yoxWw2ESJVPn4NQC5lXFuPjmQTPWWw=; b=3WG/GD/3hCjv29Ayy4m87P2H4z
	lTwdJR+sWUyiuTjrbOIFSo88SS4DppAVkQX01pCrpaR5p1G7n/QJPTT/hI7Wltzl1GQuCVN//nBsb
	gRpAeU9ov9pJc3tr7q6GnSUlD0TILJB3jMqMIvM45ZdobIAnSobculirC2XGbuqTE4EK1pn77QLFU
	isNovED1vGDTUiuQNbbsocp9pi0RdKi0plq1BzUpvARS/vMLR1eIL07zvqbUN4fJAXt7L+nl+AAvR
	W0Hf9Vjb1W5c6IIJgCJAf4DE8ZbuFIoq2gaI6FkSL742OhG89CGNZ8CYWlEjKS5FH17We3UY0m5I5
	qLKUr+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZ2O-0000000Bxtj-3zPH;
	Mon, 24 Nov 2025 16:03:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZ2M-0000000Bxt3-1EKT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:03:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8651438AE;
	Mon, 24 Nov 2025 16:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14142C4CEF1;
	Mon, 24 Nov 2025 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764000213;
	bh=yUh5KaTdq5W1Roh6URVREXeDwSR9uly626hKfFll1uU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/i0SHw7qNZPsvERbIZO3I2hWSSgKtZ+pFRxppX11/yLM5vbztxnJG8noE2gV2s9V
	 3DCLsi8M7tsnfWEeNRT9zGj31sW0BVBgoZL6CajuW/3Dxpr4Ufd/IEyuS/xizqfxgU
	 INBxcMyKRU4XMUYemmBB0a3pDeFxKj5wSda4onBreH2DmioRBfIKVqHskYdqg02yiP
	 iIDM4vbfqYYy13j6+ZcD7dTdzj3wCpyQP7yDUe5UH+ArjEcvAcF1EWZJHRs24/3a47
	 LNG1pHdy3fNa6ryr8ugKORuoi02iWpXbgydKNW1v4N/ApL4y1vDdvLw2Yv5zlUTBHs
	 ocGZ2nJLTN8zw==
Date: Mon, 24 Nov 2025 16:03:29 +0000
From: Will Deacon <will@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Besar Wicaksono <bwicaksono@nvidia.com>
Subject: Re: [PATCH] perf/arm_cspmu: fix device leaks on module unload
Message-ID: <aSSB0foqqbOl3fC3@willie-the-truck>
References: <20251121115213.8481-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121115213.8481-1-johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_080334_356607_A0C633F6 
X-CRM114-Status: GOOD (  16.10  )
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

On Fri, Nov 21, 2025 at 12:52:13PM +0100, Johan Hovold wrote:
> Make sure to drop the references taken when looking up the backend
> devices during vendor module unload.
> 
> Fixes: bfc653aa89cb ("perf: arm_cspmu: Separate Arm and vendor module")
> Cc: stable@vger.kernel.org	# 6.7
> Cc: Besar Wicaksono <bwicaksono@nvidia.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/perf/arm_cspmu/arm_cspmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index efa9b229e701..e0d4293f06f9 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -1365,8 +1365,10 @@ void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match)
>  
>  	/* Unbind the driver from all matching backend devices. */
>  	while ((dev = driver_find_device(&arm_cspmu_driver.driver, NULL,
> -			match, arm_cspmu_match_device)))
> +			match, arm_cspmu_match_device))) {
>  		device_release_driver(dev);
> +		put_device(dev);
> +	}

There's already a fix queued for this; please take a look:

https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=for-next/perf&id=970e1e41805f0bd49dc234330a9390f4708d097d

Wil


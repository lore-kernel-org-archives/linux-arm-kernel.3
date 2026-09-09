Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFC1C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLxmqBTOOLQyLarlBoqwcG2uI8L08x5DTmF4p53odwA=; b=u7ZGHMLQsqpzF93TsPkryhFHZE
	/GRGJsU3HYkM6PbDFJxrVJdVqJSWKxKirZzs81UyjjUR0XDaZlwfjdXu+bOCrA5ohrWp3XOLApyUY
	Jd9Q2NmNaYks+84ovS7awF3AQgcqzJW9duhshDR0nEVf8kdlKMvjvvF7oVcBSnojil5B+3lCMMWFq
	qrt3NQNldTG4WJYElhDGy58isNSwQWZMTx/bwdu4KGVgUARZVEg06+TORUymwcBAmR8qeGxHs15Ap
	ujAWv/Ra1+hdsRfLHY+UjCQaA9WvzZILJXQJGN7rAKyfrmbOWJ/ab75P+C0zwW3BsQ32NLsRXyt7K
	rg7qo3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EbR-0000000BHzM-1rPt;
	Wed, 09 Sep 2026 09:28:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EbM-0000000BHvM-20wm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:28:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDA9B1576;
	Wed,  9 Sep 2026 02:28:15 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18A063F528;
	Wed,  9 Sep 2026 02:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788946099; bh=prBHfafX4xJGVIFwqDLDyAlGiDruB1/Xr0x5BUzkQg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BbUNzyz2Ny1yvMPXzKTpg43CCE/Pk8wT85L8tLMbT7JYrVy/3nRWdGl/qVVMPR7+G
	 P6DLLN1GlWSkGHyWBoXkfOgrP7nMDLqw/I9IcxjRRbPkNMc4ogxQT/myyFBE3meNJb
	 Joz6hHTPn4tiS2Gf/Fj48Be5n3p3Knee9CqvwY9g=
Date: Wed, 9 Sep 2026 10:28:17 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] coresight: Fix clock refcount imbalance on platform
 probe failure
Message-ID: <20260909092817.GC200420@e132581.arm.com>
References: <20260907-fix-clk-issue-v1-1-efe81fa2b697@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-fix-clk-issue-v1-1-efe81fa2b697@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_022820_701641_3033AD43 
X-CRM114-Status: GOOD (  17.01  )
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

Hi Jie,

Thanks for fixing! It is shame that my single patch caused issues both
in driver's probe and remove - I have to admit that I don't understand
runtime PM's state machine.

TBC, this patch only fixes probe. The driver's remove is fixed in:
https://lore.kernel.org/linux-arm-kernel/20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com/

The series above and this patch should be picked up together so can
have complete fix.

> The probe wrapper then unconditionally calls pm_runtime_put()
> regardless of whether the inner probe succeeded, so on failure this
> also fires runtime_suspend() and disables the same clocks a first
> time.

pm_runtime_put() can be used for success case, but for the failure
case, we should disable the runtime PM but not release reference:
https://docs.kernel.org/power/runtime_pm.html#runtime-pm-initialization-device-probing-and-removal

> @@ -632,11 +632,14 @@ static int catu_platform_probe(struct platform_device *pdev)
>  	pm_runtime_enable(&pdev->dev);
>  
>  	ret = __catu_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_put_noidle(&pdev->dev);
>  		pm_runtime_disable(&pdev->dev);

Nitpick: please reverse the sequence between pm_runtime_put_noidle()
and pm_runtime_disable(). As we need to first disable runtime PM for
the device, then release usage reference.

Since the driver core will reset device's active state, AI told me that
calling pm_runtime_set_suspended() is redundant. It is still good to
explicitly call it for bookkeeping. This can be aligned with the change
in driver remove.

Thus, please update the flow:

        pm_runtime_disable(&pdev->dev);
        pm_runtime_set_suspended(dev);
        pm_runtime_put_noidle(&pdev->dev);

With the update:

Reviewed-by: Leo Yan <leo.yan@arm.com>


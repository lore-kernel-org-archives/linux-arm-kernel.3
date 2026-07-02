Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9629BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ne/DWlYUKmz4GWAHTNOgn2bnnnsyk1HTtyQAJeqMQwE=; b=pJGHECOkL+oqEMpBe84ccZj7DO
	yKuqlF6/jn4JVvpF4hzhxXi1JEGbd/SsMCGMz7dNEvbfP2Pwca7byiUn2fR05dgqVB3ywiDyKLit2
	Scfpdgxivi6QHdHdrWyW/Dv1igKn/zEtD7aQsOSGpWsUNLkG4z6G9QPVauH6Jd7MbhCtLXZ3NmQfN
	B5nRbDiXHDPDl6EAt7xeJIn5qKZhOo2olFsWMsw1A/BRtIegIUvgRdVDud8/I6FsQpdP6OLnXaEyO
	W1VF6VI9mRgEOv13EbFJfp7qX4py//P6DUl/QUdI31ZNR/iM0EqUiwQeh9zaBZr2yYdfhKfceClmh
	1rRIomIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCmW-00000003rwT-1YLZ;
	Thu, 02 Jul 2026 08:28:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCmS-00000003ruf-0IhT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:28:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83E001476;
	Thu,  2 Jul 2026 01:28:14 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EAF03F905;
	Thu,  2 Jul 2026 01:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782980898; bh=4uwRXUUaqg2LeGraF1sC1rIcMEkH9EPqVnUDYuI36uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOEiNkJLrf6wAP5HQ7kzLtcNLcAMFPURoGojkjfq+OPYfgatn8K+BcxT/IiIyLQuQ
	 YApz4P5J6fx4nJcVgLYygC2tRIjfEhARRy9xNfLn6q3CQlV5S2i4ZMwPUP6Hip1juK
	 GT6xSNPLnC2lv+N1Bg36xHSq+DF6TiHXDXWc0zZ8=
Date: Thu, 2 Jul 2026 09:28:16 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/2] coresight: Fix clock refcount imbalance on platform
 remove
Message-ID: <20260702082816.GH1812158@e132581.arm.com>
References: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
 <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
 <20260701162321.GG1812158@e132581.arm.com>
 <5218878b-c91f-4d14-ba12-68edf7b3f4a7@oss.qualcomm.com>
 <4e41e58e-5fbf-4564-bf9e-cec42570f3d5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e41e58e-5fbf-4564-bf9e-cec42570f3d5@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_012820_148756_3F96F492 
X-CRM114-Status: GOOD (  11.00  )
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

On Thu, Jul 02, 2026 at 09:56:05AM +0800, Jie Gan wrote:

>  static void funnel_platform_remove(struct platform_device *pdev)
>  {
>         struct funnel_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
> 
>         if (WARN_ON(!drvdata))
>                 return;
> 
> -       funnel_remove(&pdev->dev);
> +       /*
> +        * Resume the device so its clocks are enabled again, balancing the
> +        * clk_disable_unprepare() that devm runs when the driver detaches.
> +        * Then mark it suspended and drop the usage count taken here.
> +        */
>         pm_runtime_get_sync(&pdev->dev);
> +       funnel_remove(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
> +       pm_runtime_set_suspended(&pdev->dev);
> +       pm_runtime_put_noidle(&pdev->dev);

LGTM. Thanks for writing up the comment. Please proceed.


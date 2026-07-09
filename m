Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDDAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93nC4IF8Sgxwn6Thj/jXjk0Ti+ahJ56nFvrdNOV2EWs=; b=Ylx3cGJuZqz2NZS/oLGTibKNQC
	U99dQnIlWaCPHUDMpZ6maiaWfo7NPTJWBfqI60N/47UB/RIvrJGy45ZszR8zjyL2sfUZP5QJaZYN/
	wT8aPLEUZK8dcf0aVQ0dh49/NKCeE9aZ8le5n5Zdc4NkbDhRfJq+FzLPFa5tVDjvQs74CSLhvITjA
	Pbt4CBnsqher5lQXAuHBYYifb7h+BEEpfiLk78LSSjG8r+qrr/I/3ciySEVvEvNCU+pL9i59NCVgG
	FHr6o28YBZP0h39qcLeHoeqtq5H68wazV98tnqOVdLA03nZ86oRDfgmUVb8q211204+iHDx0ZMq9x
	asH1aBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqbr-00000002uK0-1vqu;
	Thu, 09 Jul 2026 15:24:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqbp-00000002uJO-2RAm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:24:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A9D31570;
	Thu,  9 Jul 2026 08:24:08 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F5913F85F;
	Thu,  9 Jul 2026 08:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783610652; bh=y2EdGgcYCeMQTN2d2raGGRWucRhx04n1Fo4cVzsHSF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cuOmo+75H2bWgqc00DyGlUC0Q4vx8whBp7edV8eGumP4e8wlaaacX0lei3xQpXyxk
	 OQMPsOnBVo9LitGJA3pruJq/iiUQmjVJozSyys0h5Q8q4M6FYs5WtExcPLIivot8o1
	 UnULazED53+nJ3WxaiIrUkRStPz9r9CDfTTt4MME=
Date: Thu, 9 Jul 2026 16:24:10 +0100
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
Subject: Re: [PATCH v2 1/2] coresight: Fix clock refcount imbalance on
 platform remove
Message-ID: <20260709152410.GE1024232@e132581.arm.com>
References: <20260702-fix-clock-refcount-unbalance-v2-0-2383fbb9952e@oss.qualcomm.com>
 <20260702-fix-clock-refcount-unbalance-v2-1-2383fbb9952e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-fix-clock-refcount-unbalance-v2-1-2383fbb9952e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_082417_666534_5975BF97 
X-CRM114-Status: GOOD (  12.93  )
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

On Thu, Jul 02, 2026 at 04:54:19PM +0800, Jie Gan wrote:

[...]

>  static void etm4_remove_platform_dev(struct platform_device *pdev)
>  {
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
>  
>  	if (drvdata)
>  		etm4_remove_dev(drvdata);

I understood this is not an issue caused by this patch, could you refine
a bit as blow so can be consistent:

        if (WARN_ON(!drvdata))
            return;

> +	/*
> +	 * Resume the device so its clocks are enabled again, balancing the
> +	 * clk_disable_unprepare() that devm runs when the driver detaches.
> +	 * Then mark it suspended and drop the usage count taken here.
> +	 */
> +	pm_runtime_get_sync(&pdev->dev);

        etm4_remove_dev(drvdata);

>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
>  }

With above change:

Reviewed-by: Leo Yan <leo.yan@arm.com>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ACCCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 12:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpJb2WoV5ZJNHbnSXf7g0seafQ75IoQEZtdOuyConFA=; b=YpTITus3BBt8E1afAdhgCbdWii
	fsMNqqMWIEZm6VkykzHGuJ1mgu3B6XJCR11ivGiAiNnltT1O011x9s8SCDJqdZgnyS+/OjjcPDSxi
	pO5irvlKwocUqFwh5EEE6/jG5f7J08NbAtf34haN2UhjCCMs2/tmX0x5Sgxv8kn8W8LwBqNAZ76Q+
	GGOGrNVN7Zi5+Fs2pic4hjqxNyotMrKhn0RJR94hx0Z0uqsRF8wl8EHgKEVF9F18eifkLo+E2Se9K
	fNi5xXZVn6J8fd0G6eJNl5jyZ1ZVujz3oMICViA5oYL//XHc5ripsUKmRHG9nl0mV/PHEkhHIl3Sb
	MXbjdqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8aZ-00000004BhY-0cON;
	Mon, 15 Sep 2025 12:45:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8aW-00000004Bgl-1LCz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 12:45:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AFBF1BF7;
	Mon, 15 Sep 2025 05:45:35 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DACA33F66E;
	Mon, 15 Sep 2025 05:45:42 -0700 (PDT)
Date: Mon, 15 Sep 2025 13:45:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 02/31] coresight: etm4x: Always set tracer's device
 mode on target CPU
Message-ID: <20250915124540.GI12516@e132581.arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-2-ea49e91124ec@arm.com>
 <88a6c0fe-ee7d-4ee6-a27c-8ec23bfed444@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88a6c0fe-ee7d-4ee6-a27c-8ec23bfed444@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_054544_404653_6913AF28 
X-CRM114-Status: GOOD (  16.09  )
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

On Mon, Sep 15, 2025 at 11:47:43AM +0100, Suzuki Kuruppassery Poulose wrote:

[...]

> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index 020f070bf17dc0557dfb3ae4f282b0a0c1778bd8..02ad41da7356547a67c53ff0a9146aec844f89da 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -592,10 +592,23 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >   static void etm4_enable_hw_smp_call(void *info)
> 
> While at this, please could you rename this function to make it explicit
> that this is only for sysfs mode ?
> 
> e.g., etm4_enable_hw_sysfs_smp_call()

If no objection, I will update pair functions to

  etm4_enable_sysfs_smp_call() / etm4_disable_sysfs_smp_call()

[...]

> > @@ -811,6 +824,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
> >   	int ret = 0;
> >   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> > +	if (!coresight_take_mode(csdev, CS_MODE_PERF))
> > +		return -EBUSY;
> > +
> 
> Should be done after the CPU check below ? Otherwise you are undoing the
> fix on sysfs side.

ETMv3 driver has done in the suggested way for checking CPU first.
ETMv4 driver should align with it. I will update in next version.

Thanks,
Leo


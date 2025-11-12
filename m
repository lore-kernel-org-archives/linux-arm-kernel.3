Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6443CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfVRTU/QmZUK/Ga9P2OLnEBd84EptduB4L5x00ns4wc=; b=d1KNjzGPp8OpzLIka07da8y4K+
	ffdM8OdM4Rf7MM30ArbXf5yvLGSG47qUZS0AP47A9p0Fot8ASOfdyrx8SyLO6OKRFJLJ+HOinHpdn
	6zQBp1/QriZzdL4ec91R/aRn5ibB9O6nKEZFRFLhgOYHiANVODQu/+ShM6/OQA9ueuh1Dj239ggBQ
	3WIR6x65cY2JH7J/WX5PA8r7UwwSkzHbd3mMrU9a9T1CHCjr041D/BtYQwzm9nLxrbvt8gIAvSICm
	SA7JF/JF5UGo5nuJdFVN7sNFSxUchsL+aMGVzKuvFttXiwWmDSYwPGbDt2lTjK70rLmmfUq8zYjy8
	IGVAKT/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFHI-00000009IS2-01il;
	Wed, 12 Nov 2025 18:09:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFHF-00000009IRe-3kW8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:09:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A2771515;
	Wed, 12 Nov 2025 10:08:56 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD3053F63F;
	Wed, 12 Nov 2025 10:09:03 -0800 (PST)
Date: Wed, 12 Nov 2025 18:09:01 +0000
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
Subject: Re: [PATCH v4 03/15] coresight: Register CPU PM notifier in core
 layer
Message-ID: <20251112180901.GB3243746@e132581.arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-3-3d4bba674709@arm.com>
 <003c77cd-aee4-4ffe-8e62-304241759edc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <003c77cd-aee4-4ffe-8e62-304241759edc@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_100905_977876_761B3FF2 
X-CRM114-Status: GOOD (  12.03  )
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

On Tue, Nov 11, 2025 at 12:13:38PM +0000, Suzuki Kuruppassery Poulose wrote:

[...]

> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c

> > +static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
> > +				   void *v)
> > +{
> > +	unsigned int cpu = smp_processor_id();
> > +	struct coresight_device *source = per_cpu(csdev_source, cpu);
> > +
> > +	if (!coresight_pm_is_needed(source))
> > +		return NOTIFY_OK;
> > +
> > +	switch (cmd) {
> > +	case CPU_PM_ENTER:
> > +		if (coresight_pm_save(source))
> 
> Unless we do the "set_per_cpu_source" *ON the CPU*, what guarantees that
> this will vanish while we do the PM save ? e.g., UNLOAD coresight_etm4x
> driver

Good catch!  I will use SMP call to set per CPU source in next version.

Thanks,
Leo


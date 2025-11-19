Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE82CF34D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyea9MzJ5lkfjX6xalD1L+8Qeu4HSvBFtywoa4hR6tA=; b=MHN7u0lhGq2Y+hWngnwplCrXJ4
	IhZEBLnauWGS+Qg+aRh0lRheOC/Hhpt6s6qMQKGWpoXIiVRJ/prO8GLUeyei07YpHL47bA0EOZtM1
	PdTraBd1ESlNZdna0Z7QEzurLqXJ2qyaS38t6gBZSSrYs+1DwH2occK2w87n48mUrsYAyhh6K7+FO
	JrNVB093klSBS7O3ua9I/I28jjyjcqIQ4szsEvVkG+80qTf0Oz6RFJh2H2BhrHVhXmYrx02HQzws+
	zUtjzZVbB2T5nkkBYBG2S+9QZ7+xZpcgDMOK0UERDMmOzgaY1LreMICvf+PS07y+3rerm4/RnVXhA
	wTz32vfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkEz-00000003V0i-3H4L;
	Wed, 19 Nov 2025 15:37:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkEx-00000003V0G-00eG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:37:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 998DAFEC;
	Wed, 19 Nov 2025 07:36:50 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB54A3F66E;
	Wed, 19 Nov 2025 07:36:57 -0800 (PST)
Date: Wed, 19 Nov 2025 15:36:56 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: Re: [PATCH v4 15/15] coresight: Move CPU hotplug callbacks to core
 layer
Message-ID: <20251119153656.GF8204@e132581.arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-15-3d4bba674709@arm.com>
 <f01585fc-919d-4059-81e2-7131dd54553a@linaro.org>
 <20251119144813.GE8204@e132581.arm.com>
 <3ab75fd3-b739-4348-9a89-e67224e23488@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ab75fd3-b739-4348-9a89-e67224e23488@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_073703_174464_0922D097 
X-CRM114-Status: GOOD (  26.38  )
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

On Wed, Nov 19, 2025 at 03:19:55PM +0000, James Clark wrote:

[...]

> > > > +static int coresight_dying_cpu(unsigned int cpu)
> > > > +{
> > > > +	struct coresight_device *source = per_cpu(csdev_source, cpu);
> > > > +	struct coresight_path *path;
> > > > +
> > > > +	if (!source || !source->path)
> > > > +		return 0;
> > > > +
> > > > +	/*
> > > > +	 * The perf event layer will disable PMU events in the CPU hotplug.
> > > > +	 * CoreSight driver should never handle the CS_MODE_PERF case.
> > > > +	 */
> > > > +	if (coresight_get_mode(source) != CS_MODE_SYSFS)
> > > > +		return 0;
> > > > +
> > > > +	/*
> > > > +	 * Save 'source->path' here, as it will be cleared in
> > > > +	 * coresight_disable_source().
> > > > +	 */
> > > > +	path = source->path;
> > > > +
> > > > +	coresight_disable_source(source, NULL);
> > > > +	coresight_disable_path(path);
> > > > +	return 0;
> > > 
> > > If the user is expected to re-enable and this new state is visible, don't
> > > you need to use the regular coresight_disable_sysfs() function? It calls
> > > coresight_disable_source_sysfs() which updates a refcount.
> > 
> > Good point!  We only need to maintain refcnt for system tracers (e.g.,
> > STM).  The per-CPU tracer is only binary states (on or off), we can
> > simply use "mode" to track state and no need refcnt.
> > 
> > I will use a separate patch to refactor refcnt.
> 
> If you remove the refcount then wouldn't it break scripts that make multiple
> enable calls? I thought the same logic for the system sources applies to CPU
> sources.

I am not removing the refcount. Since we have csdev->mode to track the
device state, I just keep refcount == 0 for the CPU source instead of
refcount == 1.  This is transparnt for user space (no any change).

Before my change:

  echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
  echo 1 > /sys/bus/coresight/devices/etm2/enable_source
  refcount = 1
  echo 1 > /sys/bus/coresight/devices/etm2/enable_source
  refcount = 1
  echo 1 > /sys/bus/coresight/devices/etm2/enable_source
  refcount = 1

  echo 0 > /sys/bus/coresight/devices/etm2/enable_source
  refcount = 0

After my change:

  echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
  echo 1 > /sys/bus/coresight/devices/etm2/enable_source
  refcount = 0
  echo 1 > /sys/bus/coresight/devices/etm2/enable_source
  refcount = 0
  echo 1 > /sys/bus/coresight/devices/etm2/enable_source
  refcount = 0

  echo 0 > /sys/bus/coresight/devices/etm2/enable_source
  refcount = 0

As a result, the CPU PM flow doesn't need to bother refcount when to
disable the path.

Thanks,
Leo

> TBH I don't really know what problem the refcount and multiple balanced
> enable/disable calls solves. But even if we decide it's not needed, it's too
> late to change now.


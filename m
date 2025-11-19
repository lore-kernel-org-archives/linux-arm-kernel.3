Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D23BCF34C0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daQfMHBupqm6nfhQbSE4No/m+M7B9i+Qcvalcm4tN0Y=; b=gb+nyKrh2xjWpHsGEv15wW2LbR
	LcBGXiRmVajsMJ1SL5jj+UrbTYqYZl0GjdwHkZCuazRe4MqmjvzzUkNNkhvEZFK2SKqRJMbywBD9C
	2cLqSK6cHN8gg8HQJ4io4fyjmTaDJMVN6iQtP2BUB0I0VPkefdpx37TriKOkgrjJWDzGpOavyCooZ
	d/UNhKSVk0HhgL13PnL3G++ikheoDyRzH9ZjFQ9eLcSMTK54eQCmJQhrRd75vNOH8n0722TATqnT6
	tqHFEhj1MfG/uHDUO8dFH40xlFvIazLiyFvRWlvdzb7Nj2h6E0wNcZSgtaf+eK3LPQctILleqPXvX
	d45FD1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjTn-00000003PUX-1qGi;
	Wed, 19 Nov 2025 14:48:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjTl-00000003PTs-1DW0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:48:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EA74FEC;
	Wed, 19 Nov 2025 06:48:08 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85E363F740;
	Wed, 19 Nov 2025 06:48:15 -0800 (PST)
Date: Wed, 19 Nov 2025 14:48:13 +0000
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
Message-ID: <20251119144813.GE8204@e132581.arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-15-3d4bba674709@arm.com>
 <f01585fc-919d-4059-81e2-7131dd54553a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f01585fc-919d-4059-81e2-7131dd54553a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_064817_370266_F7D2DAF4 
X-CRM114-Status: GOOD (  20.80  )
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

On Mon, Nov 10, 2025 at 12:20:06PM +0000, James Clark wrote:

[...]

> > +static int coresight_dying_cpu(unsigned int cpu)
> > +{
> > +	struct coresight_device *source = per_cpu(csdev_source, cpu);
> > +	struct coresight_path *path;
> > +
> > +	if (!source || !source->path)
> > +		return 0;
> > +
> > +	/*
> > +	 * The perf event layer will disable PMU events in the CPU hotplug.
> > +	 * CoreSight driver should never handle the CS_MODE_PERF case.
> > +	 */
> > +	if (coresight_get_mode(source) != CS_MODE_SYSFS)
> > +		return 0;
> > +
> > +	/*
> > +	 * Save 'source->path' here, as it will be cleared in
> > +	 * coresight_disable_source().
> > +	 */
> > +	path = source->path;
> > +
> > +	coresight_disable_source(source, NULL);
> > +	coresight_disable_path(path);
> > +	return 0;
> 
> If the user is expected to re-enable and this new state is visible, don't
> you need to use the regular coresight_disable_sysfs() function? It calls
> coresight_disable_source_sysfs() which updates a refcount.

Good point!  We only need to maintain refcnt for system tracers (e.g.,
STM).  The per-CPU tracer is only binary states (on or off), we can
simply use "mode" to track state and no need refcnt.

I will use a separate patch to refactor refcnt.

> Maybe you didn't do it because it has a mutex in it? It would be easier to
> change that to a spinlock or take the mutex in a wrapper function and share
> the core disabling code with the hotplug path.

We have used cpus_read_lock() to avoid race between sysfs knobs and CPU
hotplug callbacks, we should not acquire mutex or spinlock in this
case.  For this reason, I would keep to call low level functions.

Thanks,
Leo


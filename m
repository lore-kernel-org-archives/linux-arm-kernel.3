Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D49F53D8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 19:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpGH5SYf0qI0LSbeqZBVARIEZlcHZvU8Tk3yd7dRSis=; b=371Lo4hUGz7h0gOYx4331fijJw
	zEN8XG768JNlenQlkz/mfiC69uTLf/lCsZfo9JLUMjn8MxDViWVSsUy/MV5WTY1zED4QNvnotwQX3
	Br02jYuk7/AX3c9VPMngUVfNe0HVO6e7jdwLfQME+tn1g0qhUQ0FOG1D9wvkW/m5qYdpILZ3GpUYe
	I07ha2KhWqhUItGNQYFXzsSDKDq75ihPcC9dGGJLj+rBqLLO91y2dmomzSE+iiZq7/2DZx/nq/KlI
	sdZIyyZ3EWuwYy9mwZRFSXJT+nQai4l98RUY1kdSXLY3Vx8IrmKUzVvJ2HgSNRFMuNxR2jntLzw1O
	dvtpucJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DeG-00000004lJq-3HP4;
	Mon, 16 Mar 2026 19:30:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DeE-00000004lJS-0j7g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 19:30:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63DE1497;
	Mon, 16 Mar 2026 12:30:33 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 262333F73B;
	Mon, 16 Mar 2026 12:30:39 -0700 (PDT)
Date: Mon, 16 Mar 2026 19:30:37 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 02/19] coresight: Set per-CPU source pointer
Message-ID: <20260316193037.GH8048@e132581.arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
 <20260305-arm_coresight_path_power_management_improvement-v6-2-eff765d211a9@arm.com>
 <4dd1e996-5098-4b03-af0f-98294fdca908@arm.com>
 <20260316143828.GE8048@e132581.arm.com>
 <4e36cf20-f3c0-4c3d-9bf4-da8228efaa15@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e36cf20-f3c0-4c3d-9bf4-da8228efaa15@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_123042_345702_A82A257F 
X-CRM114-Status: GOOD (  19.72  )
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

On Mon, Mar 16, 2026 at 05:49:47PM +0000, Suzuki K Poulose wrote:
> On 16/03/2026 14:38, Leo Yan wrote:
> > On Fri, Mar 13, 2026 at 11:18:20AM +0000, Suzuki K Poulose wrote:
> > 
> > [...]
> > 
> > > >    static struct coresight_device *coresight_get_source(struct coresight_path *path)
> > > >    {
> > > >    	struct coresight_device *csdev;
> > > > @@ -1401,6 +1452,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
> > > >    	mutex_unlock(&coresight_mutex);
> > > > +	coresight_set_percpu_source(csdev);
> > > > +
> > > >    	if (cti_assoc_ops && cti_assoc_ops->add)
> > > >    		cti_assoc_ops->add(csdev);
> > > > @@ -1427,6 +1480,7 @@ void coresight_unregister(struct coresight_device *csdev)
> > > >    	if (cti_assoc_ops && cti_assoc_ops->remove)
> > > >    		cti_assoc_ops->remove(csdev);
> > > > +	coresight_clear_percpu_source(csdev);
> > > 
> > > Should these be done with the mutex lock held ?
> > 
> > If so, we will create a locking chain:
> > 
> >    coresight_mutex -> cpus_read_lock()
> > 
> > Afterwards in patch 18, it uses cpus_read_lock() to protect sysfs knobs,
> > a reversed locking chain will be established:
> > 
> >    cpus_read_lock() -> coresight_mutex
> > 
> > LOCKDEP will complain for possible deadlock.  This is why this patch
> > avoids to acquire mutex when set / clear per CPU sources.
> 
> The question is, what prevents two different CPUs trying to modify the
> "per_cpu_source" data structure when the CPU is not online.

I am struggling to establish a flow for this scenario.

Each CPU has a unique per-CPU source, and the pointer is only modified
during device probe or remove.  Both paths are protected by the device
lock (I confirmed that __device_attach() and
__device_release_driver() are protected by device_lock(dev)).
Therefore concurrent updates to the same source pointer should not
occur.

One possible corner case is the ETMv4 delayed probe (etm4_probe_cpu()).
Since the probe is deferred and coresight_register() is invoked when
a CPU is hotplugged, it could race with ETMv4 module unloading, i.e.
between etm4_probe_cpu() and etm4_remove_dev().

I discussed with James for another option before: we always access
per-cpu source pointer _locally_.  For example, we could set the pointer
in etm4_init_arch_data() and clear it in clear_etmdrvdata().  These
paths are protected by the CPU lock and in SMP call, thus
coresight_set_percpu_source() does not need acquire any lock.

The downside is that we set the per-cpu source pointer in ETM driver but
cannot use coresight_register/coresight_unregister as common place to
manage the pointer.

Thanks,
Leo


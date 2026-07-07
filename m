Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B181BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqyAm6LcqUElnt+w52aIf7XiEf2+d52cZEjlO/os4xg=; b=N81KpQ9ZipRboQXm0eRYyS1vjR
	FIilz4dJwO4Y76QgeiSjo0Il8kdcpVzlxbF+MWvbrW5YacOBn3jWV+UXbEIpDBeB/DdhIg/nqpPlb
	MHc+nXS7BfHOWDKdl27CJhSY5yw0sUIrgw2nLJ3mddwPn8N8NQJN4zcJmLDEFYulmgjLmHsaHnMVS
	p1s1YBTZDlXLdWaFiOrtNxJ1IppDQfQvP9Y7sUNXqLj3SBRpi7PQOhM/HynUgDH/qTr83LWc5w9BW
	S6+HOri/P7s82oIbclajptA/+bf5hblKYs9cFsHVr8BnOSNTYxZ9tZ/n8ap6U1OiuYWw7sdTI2CXV
	lD35beVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1eW-0000000EYpS-0Af9;
	Tue, 07 Jul 2026 08:59:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1eT-0000000EYp6-0xRz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:59:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A10DF2B;
	Tue,  7 Jul 2026 01:59:31 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA5DB3F85F;
	Tue,  7 Jul 2026 01:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783414775; bh=3EqXF0JTepihl6xMPQQIPgM9Y5UEtBi3ZRdqeX88Z+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AM3qkB2wJ+u4QAkKDCSISN1bMGDuIfferB8l6VRH2+jfF6tY25GBhZ75xGVU3I6h5
	 Wld7oLqy89Z/iGla21XMa8wTRVVS+JEQ2LeoYVtVkiQp6J1EFs74yo4fannMtwdKe2
	 OwGmi+c3bLV5RKmqYrPP9Uq9VhDZJjlkVDCnlE80=
Date: Tue, 7 Jul 2026 09:59:32 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v8 08/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <aky_9FCsv1XbyUvW@e129823.arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <20260629090007.1718746-9-yeoreum.yun@arm.com>
 <20260706172159.GA1024232@e132581.arm.com>
 <akvxCqDgkElhCuH5@e129823.arm.com>
 <20260707082510.GD1024232@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707082510.GD1024232@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_015937_357045_63E61A6F 
X-CRM114-Status: GOOD (  27.90  )
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

On Tue, Jul 07, 2026 at 09:25:10AM +0100, Leo Yan wrote:
> On Mon, Jul 06, 2026 at 07:16:42PM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
> > > I try best to not paste any non-sense AI reviews, record one from
> > > Sashiko [1]:
> > > 
> > >  | If a user writes to a sysfs attribute like pe_sel_store(), it acquires
> > >  | drvdata->spinlock without disabling interrupts. If an IPI is then handled
> > >  | on the same CPU, etm4_enable_sysfs_smp_call() will call
> > >  | cscfg_csdev_enable_active_config() which attempts to acquire the exact
> > >  | same spinlock, hanging the CPU."
> > > 
> > > The flow for acquiring drvdata->spinlock in SMP call is:
> > > 
> > >   etm4_enable_sysfs_smp_call()
> > >     `> cscfg_csdev_enable_active_config()
> > >          `> cscfg_csdev_enable_config()
> > >               `> cscfg_prog_config()
> > >                    `> cscfg_set_on_enable()
> > >                         `> raw_spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
> > > 
> > > We might expect the complaint from LOCKDEP with this patch.
> > 
> > Hmm. I miss the this point and there is two solution:
> > 
> >   1. Remove "feat_csdev->drv_spinlock"
> > 
> >     Before this patch, the "feat_csdev->drv_spinlock" is for
> >     synchronizing with the "drvdata->config". However,
> >     After this patch, the the configfs only show the "active" config
> >     and the active config can be used only after taking the "mode".
> > 
> >     Furthermore, the sysfs only uses the "config" not "active config",
> >     there is no race between the sysfs and the configfs.
> > 
> >     When I check the, "feat_csdev->drv_spinlock" is for the
> >     active/deactive the configfs config, so I seems safe to remove.
> 
> My interpretation is:
> 
> After this series, we updates active_config on local CPU within atomic
> context, it is nature to be protected. So we don't need to use
> feat_csdev->drv_spinlock when updating active_config.
> 
> If so, it is fine for me to remove feat_csdev->drv_spinlock.

Yes. but if I add a little bit more comment. the "active_config"
is accessed after "mode changed (perf of sysfs)" it accesses atomically
and the "active_config" is refered from the configfs not "config"
after this patch. So we can remove the "feat_csdev->drv_spinlock".

> 
> >   2. sysfs with _irqsave?
> > 
> >     However, this make a latency for the sysfs.
> > 
> > I think the (1) seems good.
> > 
> > Any comments? @Suzuki and @Leo?
> 
> Yeah, it is good to wait a bit for Suzuki if any ideas.

Okay. If he doesn't have any particular comment, I'll send with next
version.

Thanks!

-- 
Sincerely,
Yeoreum Yun


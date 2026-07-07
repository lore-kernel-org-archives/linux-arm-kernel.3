Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8BFC44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8FefcA8h7Zyv8aMG34ldXOa0VD/UGWxIDa1MLM6Xlg=; b=PVyDRGI6faFZ59j3eLz9KLBvOf
	wBhA1JU2eXhsP7QbZOYn5PWGG3SONqlfn3e9Es6keZAIjBRpzALJTB6mFgmGSySsBlmalX/zNcru/
	6gy4yL4SOXsM0VBWn+stkw5cfmaxAGDsMrXdl8JhhSMVGvbXtgcd6hnN/Ad9Q9hUgtYA4qdCqoNnY
	Ja9ZmgmAX3ri9BGKc46ZjfiGtt4YEFslq4oCfvPRtq8mywbNTleCTUzCKzLZOPRAjL17AuK/daKgu
	LKsFKCZaOMxn8yWf4aHqIYnXDSxw1k0TsxJrM107aBx3WrrN09U5FasToroTI48EvGZq7BKAI06h4
	2ypScfvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh17E-0000000ET2x-3JO1;
	Tue, 07 Jul 2026 08:25:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh17C-0000000ET1z-06LI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:25:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 572771BCA;
	Tue,  7 Jul 2026 01:25:08 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CAEB3F85F;
	Tue,  7 Jul 2026 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783412712; bh=jTlDX4SJ8ICjOTtRkPF6dVggVhq5GVFKrlcBmkhYrSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qRhJHQeJFTMPutQU9UP102WwIdjd8bs6xrqbqyS51byqrh8GhrN0VUPIh5/l49eSz
	 YtMR2EKg1Sz4YjRrXf0Th4/p7GI35GfHVx//uL4l42681FCqNceeoto7EsGpTIvOZZ
	 JydQf8KR3jouazYOzmI1DC/UPKJiMZEyhVflnjds=
Date: Tue, 7 Jul 2026 09:25:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v8 08/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <20260707082510.GD1024232@e132581.arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <20260629090007.1718746-9-yeoreum.yun@arm.com>
 <20260706172159.GA1024232@e132581.arm.com>
 <akvxCqDgkElhCuH5@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akvxCqDgkElhCuH5@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_012514_110079_4D3F548B 
X-CRM114-Status: GOOD (  21.00  )
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

On Mon, Jul 06, 2026 at 07:16:42PM +0100, Yeoreum Yun wrote:

[...]

> > I try best to not paste any non-sense AI reviews, record one from
> > Sashiko [1]:
> > 
> >  | If a user writes to a sysfs attribute like pe_sel_store(), it acquires
> >  | drvdata->spinlock without disabling interrupts. If an IPI is then handled
> >  | on the same CPU, etm4_enable_sysfs_smp_call() will call
> >  | cscfg_csdev_enable_active_config() which attempts to acquire the exact
> >  | same spinlock, hanging the CPU."
> > 
> > The flow for acquiring drvdata->spinlock in SMP call is:
> > 
> >   etm4_enable_sysfs_smp_call()
> >     `> cscfg_csdev_enable_active_config()
> >          `> cscfg_csdev_enable_config()
> >               `> cscfg_prog_config()
> >                    `> cscfg_set_on_enable()
> >                         `> raw_spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
> > 
> > We might expect the complaint from LOCKDEP with this patch.
> 
> Hmm. I miss the this point and there is two solution:
> 
>   1. Remove "feat_csdev->drv_spinlock"
> 
>     Before this patch, the "feat_csdev->drv_spinlock" is for
>     synchronizing with the "drvdata->config". However,
>     After this patch, the the configfs only show the "active" config
>     and the active config can be used only after taking the "mode".
> 
>     Furthermore, the sysfs only uses the "config" not "active config",
>     there is no race between the sysfs and the configfs.
> 
>     When I check the, "feat_csdev->drv_spinlock" is for the
>     active/deactive the configfs config, so I seems safe to remove.

My interpretation is:

After this series, we updates active_config on local CPU within atomic
context, it is nature to be protected. So we don't need to use
feat_csdev->drv_spinlock when updating active_config.

If so, it is fine for me to remove feat_csdev->drv_spinlock.

>   2. sysfs with _irqsave?
> 
>     However, this make a latency for the sysfs.
> 
> I think the (1) seems good.
> 
> Any comments? @Suzuki and @Leo?

Yeah, it is good to wait a bit for Suzuki if any ideas.

Thanks,
Leo


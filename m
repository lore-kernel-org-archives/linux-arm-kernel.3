Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7538AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 13:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvE0ayg26qHXBI3m2ksDOLJ5eptF51yr0jVxN0egFe0=; b=RnNNRKo769Nq+xtuKhAZA6jeOV
	BZdiLGFAulDmrVe8qktkfwtRiIRYoXs6d0YgL8DsBstdNIeLV39ij/OHAztIyDSehgHJJ+6wRWVyt
	7hmWYkW4tbnL83yLdV1x5tKMLsH6Okq4Ihn9srcd4xFhbXTLJQdbRVSN0eQScKsHqG106GsqUmSEJ
	5OeJH9R+TdGGZmMQVDFcEfUzRbvmpYt8YlmbdsVQIVxc+sCKaSfQPlnhaTW8bWKDTLGXMB6deewAm
	GOKK/xb6BtC9YDtajZ85s7tWdqfmynw44J8jHbEuh8NtH1hf6VLQ+CENCbRhIlue7FtIroR0ZjjbE
	UEEUhWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbc3-00000003QoW-12qo;
	Tue, 01 Apr 2025 13:25:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbaF-00000003QbN-40NT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 13:23:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B20CA1424;
	Tue,  1 Apr 2025 06:23:16 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD73D3F694;
	Tue,  1 Apr 2025 06:23:12 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:23:08 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Yabin Cui <yabinc@google.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH] coresight: catu: Introduce refcount and spinlock for
 enabling/disabling
Message-ID: <20250401132308.GB115840@e132581.arm.com>
References: <20250328223837.2314277-1-yabinc@google.com>
 <ea366793-4c27-44af-9b6b-8964c4151416@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea366793-4c27-44af-9b6b-8964c4151416@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_062316_081096_03846D8D 
X-CRM114-Status: GOOD (  29.23  )
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

Hi all,

On Mon, Mar 31, 2025 at 03:24:46PM +0100, James Clark wrote:
> On 28/03/2025 10:38 pm, Yabin Cui wrote:

[...]

> > diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> > index 275cc0d9f505..834a7ffbbdbc 100644
> > --- a/drivers/hwtracing/coresight/coresight-catu.c
> > +++ b/drivers/hwtracing/coresight/coresight-catu.c
> > @@ -458,12 +458,19 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
> >   static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
> >   		       void *data)
> >   {
> > -	int rc;
> > +	int rc = 0;
> > +	unsigned long flags;
> >   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
> > -	CS_UNLOCK(catu_drvdata->base);
> > -	rc = catu_enable_hw(catu_drvdata, mode, data);
> > -	CS_LOCK(catu_drvdata->base);
> > +	spin_lock_irqsave(&catu_drvdata->spinlock, flags);

> Hi Yabin,
> 
> This needs to be a raw_spinlock since [1]. Also you might as well use the
> new guard() thing to save someone find-and-replacing it later.
> 
> But I'm wondering if this is accurate. The ETR's refcount is dependent on
> the pid of the owner of the trace session:
> 
>   /* Do not proceed if this device is associated with another session */
>   if (drvdata->pid != -1 && drvdata->pid != pid) {
> 	rc = -EBUSY;
> 	goto unlock_out;
>   }
> 
>   /*
>    * No HW configuration is needed if the sink is already in
>    * use for this session.
>    */
>   if (drvdata->pid == pid) {
> 	csdev->refcnt++;
> 	goto unlock_out;
>   }
> 
> If the helpers get enabled first, could this mean that CATU gets associated
> with a different session than the ETR? Maybe not, but it would be easier to
> understand if the core code handled the refcounting and locking for linked
> devices.

Yes, CATU can be enabled in a different session or even is disturbed
by another mode (E.g., CATU is enabled in a perf session, then it
might be wrongly enabled for Sysfs mode).

But anyway, I think this patch is needed to protect the low level's
operations with a raw spin lock.

Thanks,
Leo

> [1]:
> https://lore.kernel.org/all/20250306121110.1647948-3-yeoreum.yun@arm.com/
> 
> Thanks
> James
> 
> > +	if (csdev->refcnt == 0) {
> > +		CS_UNLOCK(catu_drvdata->base);
> > +		rc = catu_enable_hw(catu_drvdata, mode, data);
> > +		CS_LOCK(catu_drvdata->base);
> > +	}
> > +	if (!rc)
> > +		csdev->refcnt++;
> > +	spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
> >   	return rc;
> >   }
> > @@ -486,12 +493,17 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
> >   static int catu_disable(struct coresight_device *csdev, void *__unused)
> >   {
> > -	int rc;
> > +	int rc = 0;
> > +	unsigned long flags;
> >   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
> > -	CS_UNLOCK(catu_drvdata->base);
> > -	rc = catu_disable_hw(catu_drvdata);
> > -	CS_LOCK(catu_drvdata->base);
> > +	spin_lock_irqsave(&catu_drvdata->spinlock, flags);
> > +	if (--csdev->refcnt == 0) {
> > +		CS_UNLOCK(catu_drvdata->base);
> > +		rc = catu_disable_hw(catu_drvdata);
> > +		CS_LOCK(catu_drvdata->base);
> > +	}
> > +	spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
> >   	return rc;
> >   }
> > @@ -550,6 +562,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
> >   	dev->platform_data = pdata;
> >   	drvdata->base = base;
> > +	spin_lock_init(&drvdata->spinlock);
> >   	catu_desc.access = CSDEV_ACCESS_IOMEM(base);
> >   	catu_desc.pdata = pdata;
> >   	catu_desc.dev = dev;
> > diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> > index 141feac1c14b..663282ec6381 100644
> > --- a/drivers/hwtracing/coresight/coresight-catu.h
> > +++ b/drivers/hwtracing/coresight/coresight-catu.h
> > @@ -65,6 +65,7 @@ struct catu_drvdata {
> >   	void __iomem *base;
> >   	struct coresight_device *csdev;
> >   	int irq;
> > +	spinlock_t spinlock;
> >   };
> >   #define CATU_REG32(name, offset)					\
> 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DBDC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 13:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+53JZL1E+oZIZ7NO5SZiRrBTAjs8/1VFvBN/OXohjk=; b=42YHyd0B0dO2Jvm/sosoD8IFKr
	VWALoC3+FdTLwvQMnHKNbQXOKN2TC9uJpX8jUn/6Au34TRi5MWSiP6OJrkFtmQzTkq70ABnS0YsTm
	O/kww7D9Dr76CWeNoTq2QB2ZUs/E9wHyw35Mkmpx2p0kUBUZ6otVoZ47aXqsrxd4GOAhqM/BIhNfm
	dEc1PQOn9r66f/s89yu/yp4E1zXFMm1iq2wyVkg9zPggkDP6bqW4d3lOVTHtO2po5bgfssW2P2CFH
	jjGuVlQayWAxYMP3MKNUEmZj9CrQBl3llpYSx/iEsFpmPPCqpgjqENlYCzoyp4E3PRqtFVygygmYr
	0kJDzqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxks-00000006Bit-0WW1;
	Wed, 02 Apr 2025 13:03:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxj5-00000006B4N-3YZJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 13:01:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16EF7106F;
	Wed,  2 Apr 2025 06:01:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5F983F694;
	Wed,  2 Apr 2025 06:01:50 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:01:45 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
Message-ID: <20250402130145.GI115840@e132581.arm.com>
References: <20250402011832.2970072-1-yabinc@google.com>
 <20250402011832.2970072-2-yabinc@google.com>
 <CALJ9ZPNBGBd9OTBgedoQStXh3d2oGDGi6fUF7PXbU5qTEBRHew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALJ9ZPNBGBd9OTBgedoQStXh3d2oGDGi6fUF7PXbU5qTEBRHew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_060151_928781_6D844F3F 
X-CRM114-Status: GOOD (  13.75  )
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

Hi Yabin,

On Tue, Apr 01, 2025 at 06:21:59PM -0700, Yabin Cui wrote:

[...]

> > @@ -486,12 +491,17 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
> >
> >  static int catu_disable(struct coresight_device *csdev, void *__unused)
> >  {
> > -       int rc;
> > +       int rc = 0;
> >         struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
> > +       guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> >
> > -       CS_UNLOCK(catu_drvdata->base);
> > -       rc = catu_disable_hw(catu_drvdata);
> > -       CS_LOCK(catu_drvdata->base);
> > +       if (--csdev->refcnt == 0) {
> > +               CS_UNLOCK(catu_drvdata->base);
> > +               rc = catu_disable_hw(catu_drvdata);
> > +               CS_LOCK(catu_drvdata->base);
> > +       } else {
> > +               rc = -EBUSY;

This is not an error if the decremented reference counter is not zero.
It should return 0.  Otherwise, the change looks good to me.

Thanks,
Leo


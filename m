Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7569CE7E0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 11:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzFUfhei/LtnV5Ocuqp0f4Rh5fFOoaJIBdq92ooXdBc=; b=R9mJEX8k421vTkcQIAhfa0WZzf
	fKA35ZdADThmMnt/WvjRDC05G3RPif6H36CseW98mG6j6z0mx4yjEEy0fnrKtRxsLc2ZnOOJ+bocV
	srqH5uUXbDUm7sMTPk1Z5iOCb/KQjscPoMmm2Fe4HrDk1suBzlmAGo55blT+WQ8hUwRnvI2R/Cm3m
	UfJB+B3oejtXbm/u3xKAMLHxf6N05wyUlp/WWngXlM127MekHWlGzhe0pQUobrka08C/Zdf3ctPAT
	wVRBpHIuNJfP5N8aWSV9bXIavHghgCJVsEchNKL8g3y+J2ScK9elQifs4XwPdskqUT7YCMxFYGfNu
	+4veogtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPRM-0000000FIVL-1oVn;
	Mon, 09 Feb 2026 11:28:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPRK-0000000FIUp-1v5p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 11:28:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1913339;
	Mon,  9 Feb 2026 03:28:15 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC92E3F740;
	Mon,  9 Feb 2026 03:28:21 -0800 (PST)
Date: Mon, 9 Feb 2026 11:28:19 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH v3 8/8] coresight: Unify error handling in
 coresight_register()
Message-ID: <20260209112819.GL3529712@e132581.arm.com>
References: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
 <20260202-arm_coresight_refactor_dev_register-v3-8-03292470c48c@arm.com>
 <e451547b-15a7-4296-a5da-379640c141c7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e451547b-15a7-4296-a5da-379640c141c7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_032826_550666_E26B7B77 
X-CRM114-Status: GOOD (  25.18  )
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

On Tue, Feb 03, 2026 at 11:15:55AM +0000, James Clark wrote:

[...]

> > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> > index 955af43010446803030973c72f07315492b2fcf3..65cf975493c86de42515845147d90497aa20c595 100644
> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > @@ -1326,7 +1326,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
> >   {
> >   	int ret;
> >   	struct coresight_device *csdev;
> > -	bool registered = false;
> >   	csdev = kzalloc(sizeof(*csdev), GFP_KERNEL);
> >   	if (!csdev) {
> > @@ -1380,7 +1379,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
> >   		 * All resources are free'd explicitly via
> >   		 * coresight_device_release(), triggered from put_device().
> >   		 */
> > -		goto out_unlock;
> > +		mutex_unlock(&coresight_mutex);
> > +		goto err_out;
> 
> I'm not sure if replacing the "registered" system with extra calls to unlock
> is necessarily better. I think the whole point of out_unlock was to have a
> single call to unlock so it couldn't be forgotten or didn't need to be
> duplicated.

The motivation for this patch is to use out_unlock as a central point
for releasing resources via coresight_unregister().

The tricky case is a device_register() failure.  Since the device is not
successfully registered, there is no need to call coresight_unregister()
to release bus resources.  However, the mutex and platform data still
need to be released.  The code here unlocks and jumps to err_out to
release the platform data.

> Probably a better way to clean this up would be to pull out a function for
> all the stuff that needs to be locked and use guard(). Then do the stuff
> that doesn't need to be locked after that function. Either way it doesn't
> look wrong.

If so, although locking is not a concern, the device_register() failures
still need to release platform data particularly.  That means we still
need extra flag (or returned error) to indicate if it is a
device_register() failure.

I understand we don't want multiple places for mutex release.  It is
not bad to keep the "registered" flag and drop this patch.

Thanks,
Leo


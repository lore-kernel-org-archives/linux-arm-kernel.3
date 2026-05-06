Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3CFCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9FuCdO7aIMJEVIcWanVW94iMvXcDLqljJiei2BDwek=; b=4XbzSORK6Vf9cEwZzGTdK+grA0
	MMYlTGv4wcr3czZ+2vEtITYlmVmhuQisDtYmN/qRaKf7wKxPogvF6ZbeK27qMjLkLk0IH51TBTF86
	1GPgj+SWoB5bhOJhUbdXhjrPCPJiNQ6S//65GWB5zUMnjKfbhylBAIriQICGL8G3x4z5i6a82Kzvd
	iepNk9UTeTIDXND5rCE/Bsck2FSrYglRpPKYvwSpFmVOMMYFD/TOk62ztgPt6lXw0u3PqJLDuvW5a
	Lfn9fHQa0WSZmJ5enYEetD+4eg05r86kuItQgKLzqKJhJ8mkXjxnBgKO1QWr+t68jpUTfP/M0w7u4
	zEpD7yWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZL4-00000000T67-21Bg;
	Wed, 06 May 2026 10:18:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZL3-00000000T5d-1FEr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 10:18:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DB913319;
	Wed,  6 May 2026 03:18:38 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20D533F836;
	Wed,  6 May 2026 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778062723; bh=QgSl24i2a3vecWgnD3FTFmRLvLM7+ddvbva5hDFdMX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AkuzRWMbpH28zIU/AJOwgmNs04JbgbYjj33svjLg1dTjpWgvKncHKVkdG9hImnisH
	 TGwqC6eyG2HKM7iYq8HxvAl+qvxQi/f8nOqXqJuwyLieHr5SniCxXsGFovlVN40cUW
	 SUYJlfTdK5+beTTfzAkW6ekIe0vTKYj1GT6Pf83s=
Date: Wed, 6 May 2026 11:18:41 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 25/27] coresight: sysfs: Increment refcount only for
 system tracers
Message-ID: <20260506101841.GF3778514@e132581.arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
 <20260501-arm_coresight_path_power_management_improvement-v11-25-fc7fb9d5af1c@arm.com>
 <c7e4349a-3c47-4908-b677-15a5360ce7a9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7e4349a-3c47-4908-b677-15a5360ce7a9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_031845_376891_5CCA35A2 
X-CRM114-Status: GOOD (  20.60  )
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

On Wed, May 06, 2026 at 10:57:20AM +0100, Suzuki K Poulose wrote:
> On 01/05/2026 17:48, Leo Yan wrote:
> > Except for system tracers (e.g. STM), other sources treat multiple
> > enables as equivalent to a single enable. The device mode already
> > tracks the binary state, so it is redundant to operate refcount.
> > 
> > Refactor to maintain the refcount only for system sources. This
> > simplifies future CPU PM handling without refcount logic.
> > 
> > Tested-by: James Clark <james.clark@linaro.org>
> > Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > Reviewed-by: James Clark <james.clark@linaro.org>
> > Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-sysfs.c | 41 ++++++++++++++++++---------
> >   1 file changed, 27 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> > index 0aebafcb8d0e8e699652244af5202e7c4dc4e9b1..42cf07b8d15a420e963650000dc32bbb38f0aa62 100644
> > --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> > @@ -39,6 +39,28 @@ ssize_t coresight_simple_show32(struct device *_dev,
> >   }
> >   EXPORT_SYMBOL_GPL(coresight_simple_show32);
> > +static void coresight_source_get_refcnt(struct coresight_device *csdev)
> > +{
> > +	/*
> > +	 * There could be multiple applications driving the software
> > +	 * source. So keep the refcount for each such user when the
> > +	 * source is already enabled.
> > +	 *
> > +	 * No need to increment the reference counter for other source
> > +	 * types, as multiple enables are the same as a single enable.
> > +	 */
> > +	if (csdev->subtype.source_subtype ==
> > +			CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
> 
> Minor nit: You must check the csdev->type == DEV_TYPE_SOURCE before
> check the subtype.

I will add a helper coresight_is_software_source().

Thanks,
Leo


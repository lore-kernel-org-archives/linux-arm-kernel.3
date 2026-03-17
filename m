Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EC2FD8740
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOpz0zTT1woy4ceuVGt6fUOrMCeHnARknEAOOc/0gIM=; b=1m6u0ktC+WSerptQeF39uFcJAe
	ror/NJTmwMW/5oJR+px51foYRHtsht9Sp2vxeyFnO+h3YC/aCxiQQvIXmf2oOb4t0bxH9nbLrIcDf
	bzvn1c3ihwJ/LYCC1G7SbSeDJ67g6W2F39S5BZOx0WN1U2xyKGggfGeGjkLbFQM1CC9XrijPfH7tQ
	gde8CJUw6tSCdb8C+t1OX+EVyHUtTo4VxfHt6EbXuNSKkeQyH6ySlJRaghX2tElMEZ93U32rynLB9
	gA12jaAdd3APyZk3dYwGmbZjx8IMCDOm1CychmR3lNQncFppUVHHU14MdlqeifKPUbK8X1v5Y51Hj
	FINnRxng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SV1-000000067PT-1H86;
	Tue, 17 Mar 2026 11:22:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SUx-000000067OX-3mfC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:22:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF6061477;
	Tue, 17 Mar 2026 04:21:57 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92C413F778;
	Tue, 17 Mar 2026 04:22:03 -0700 (PDT)
Date: Tue, 17 Mar 2026 11:22:01 +0000
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
Subject: Re: [PATCH v6 05/19] coresight: Add callback to determine if PM is
 needed
Message-ID: <20260317112201.GK8048@e132581.arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
 <20260305-arm_coresight_path_power_management_improvement-v6-5-eff765d211a9@arm.com>
 <050d326f-ca74-4a8e-9ccd-78a653344c81@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <050d326f-ca74-4a8e-9ccd-78a653344c81@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_042207_975093_14A066AE 
X-CRM114-Status: GOOD (  20.66  )
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

On Fri, Mar 13, 2026 at 11:26:59AM +0000, Suzuki K Poulose wrote:
> On 05/03/2026 10:17, Leo Yan wrote:
> > Add a callback in the source device that returns a boolean indicating
> > whether power management operations are required. The save and restore
> > flow is skipped if the callback returns false.
> > 
> > The ETMv4 driver implements its own version's callback.
> > 
> > Reviewed-by: James Clark <james.clark@linaro.org>
> > Tested-by: James Clark <james.clark@linaro.org>
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-core.c       |  9 ++++++++-
> >   drivers/hwtracing/coresight/coresight-etm4x-core.c | 16 ++++++++++++++++
> >   include/linux/coresight.h                          |  1 +
> >   3 files changed, 25 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> > index 5f7930ef537e2877649c404858d9fe6f593af037..6956429ca507d850c8b8c62c65de4b6fe1a1740c 100644
> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > @@ -1681,7 +1681,14 @@ static bool coresight_pm_is_needed(struct coresight_device *csdev)
> >   	    !coresight_ops(csdev)->pm_restore_enable)
> >   		return false;
> > -	return true;
> > +	/*
> > +	 * PM callbacks are provided but pm_is_neended() is absent, it means
> > +	 * no extra check is needed.
> > +	 */
> > +	if (!coresight_ops(csdev)->pm_is_needed)
> > +		return true;
> 
> Do we really need this call back ? The ETM can skip registering the PM ops
> when it is not needed (make them NULL) ? And the oresight_get_mode() is any
> way available for all devices and use that simply in the core function ?

Good point!  I will drop pm_is_needed() callback in new version.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E5AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 11:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+SzWsFhG6JIHj/uxmBFS+AMeLLqGEeD5rM/AxB9tzg=; b=suhk4FukO3Kj+z/AYFPakJDhg4
	VCQ2Y/e8QHE/v7HuIheHqpiVhBGUirYc7MU6EDhLkImmZDgjDTcBDGCg4gsxSDBwI/7Eqtlx+rIub
	amBWPOm2kPs+O8vvzTKD6GTmxO76SdCg39v+YvlfqkpDWWwNsLL4C2Kb/EfN8TYtERoPd1bgTBuKL
	gpOPR3EorP00e+9HMeMaD85nV4k+945dVX6zyd5xX8juPVeCrhsNqMU7RMf2a1BPdbx/0Ae5zjWPL
	fdun3Ic6GhlDIEeVtSRxdi8h4QG2Vvp81meRJebX49wZzzcyvjmgOoHTYMEu4Aid1LXAzjzSJCgA0
	Obouk/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvg7-000000088ju-35K8;
	Wed, 02 Jul 2025 11:31:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuvR-00000007zDE-2zj9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 10:42:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E726522D9;
	Wed,  2 Jul 2025 03:42:33 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70E6C3F58B;
	Wed,  2 Jul 2025 03:42:48 -0700 (PDT)
Date: Wed, 2 Jul 2025 11:42:46 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/28] coresight: etm3x: Always set tracer's device
 mode on target CPU
Message-ID: <20250702104246.GW794930@e132581.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-3-23ebb864fcc1@arm.com>
 <aGUHbWR0vreo29kl@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGUHbWR0vreo29kl@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_034249_815797_4ED92603 
X-CRM114-Status: GOOD (  12.87  )
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

On Wed, Jul 02, 2025 at 11:18:21AM +0100, Yeoreum Yun wrote:
> Hi Leo,
> 
> [...]
> > @@ -464,17 +477,29 @@ static int etm_enable_perf(struct coresight_device *csdev,
> >  			   struct perf_event *event,
> >  			   struct coresight_path *path)
> >  {
> > +	int ret = 0;
> >  	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> >
> > -	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
> > -		return -EINVAL;
> > +	if (!coresight_take_mode(csdev, CS_MODE_PERF))
> > +		return -EBUSY;
> > +
> > +	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id())) {
> > +		ret = -EINVAL;
> > +		goto out;
> > +	}
> 
> Small question: why drvdata->cpu != smp_processor_id() check after
> changing mode? Would it better to check before change of it?

You are right. I will update in next version.

Thanks for pointing out this!

Leo


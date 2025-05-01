Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052DAC3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QDoAIhWIyziJHFxGvSCSDrbZyo0D0Ti8jDnh2XwmWw=; b=zkFfCgsgAP6RPWX91GmhiNe4/a
	4jUu7dQJKuDcax0svm2F70N/jOjr2lMloBksfNodvKq0vh2GfTjJmbhN24Thb24kpnlC2m3+6mlex
	+3ZBdOQimqRGTl7LKFDTQWa8M6i48pGA0ryPQRD5sNqPxBVjT+m5xn1ZmCPNEB/shhnkzPyCcjgK3
	6PKdtjlgoRqjKqlKzdeZT1ATToW9X9GuyFckx5Aq0UfJ3cbDBa8AUEhwba4+zXZvUIomVEZvQPfnm
	7yPcc+pbrCACSgSzoJdA8twwyVP5jgzQB9ewk701ypb0DPQRHIuoS2LOklmQuw/SlgopkZOG7w/Yu
	nVyVMk6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASo9-0000000FTol-383r;
	Thu, 01 May 2025 12:14:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASMV-0000000FJOm-2TUm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:46:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DEBF106F;
	Thu,  1 May 2025 04:45:47 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C24043F5A1;
	Thu,  1 May 2025 04:45:54 -0700 (PDT)
Date: Thu, 1 May 2025 12:45:46 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: etm4x: Remove redundant claim register setting
Message-ID: <20250501114546.GL551819@e132581.arm.com>
References: <20250501104216.2375126-1-leo.yan@arm.com>
 <16bf2a1e-2a98-41b3-b780-c0215db5a6dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16bf2a1e-2a98-41b3-b780-c0215db5a6dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_044555_667614_235F2687 
X-CRM114-Status: GOOD (  19.29  )
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

On Thu, May 01, 2025 at 11:54:58AM +0100, James Clark wrote:
> 
> On 01/05/2025 11:42 am, Leo Yan wrote:
> > The claim register is set twice in the restore flow; remove the
> > duplicate operation.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index 5c20ed4cf4ed..228317991ec2 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -1958,8 +1958,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
> >   	if (drvdata->numvmidc > 4)
> >   		etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR1);
> > -	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
> > -
> >   	if (!drvdata->skip_power_up)
> >   		etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> 
> Semi-related to this patch but probably not worth fixing: There's
> technically a race condition with an external debugger here. It would be
> better to use coresight_claim_device_unlocked() and report the error that's
> returned instead of manually writing to the whole claim register without
> checking it before and after like the claim function does.

I thought again and conclude the current patch would be fine (at least
not bad ;)

The reason is the ETM driver has acquired the OS lock during idle
states, this prevents the race condition with external debuggers.

And if a CPU detects pending interrupts and abort a low power flow,
the CoreSight self claim tag is still set.  In this case,
coresight_claim_device_unlocked() will report unnecessary warnings.

Thanks,
Leo


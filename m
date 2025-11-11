Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6DFCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9YvZZuDnl3B6Y8fgQuGpNesZPKDSdPkgon5HUAvRto=; b=RqFTvUKuo7JUZ7cLQEcThPsPla
	WYJdlkPVw9WwC5v28JupFbkzjKmdPWGrKxcfbr7tS+Gw7+gzndZVsXchyCdc9nZ9+mKYLFQfzZ5ph
	Znq/9Jyj2dwNxGJsp9B1XGFWnWBojg73CmnguxxYTUMGYRpe6zGZrYCPQ3HrJ+9IeUynuukg/jVt2
	nW5tccEGrrv3Tb3kVW2mj6tHYBjJ3blsZ8xUxUzaBbpeUMmuXKNexLOdTBByamuCPcmC+0AYr0G5w
	1KnuY7flcOGKy0vQxCfF/sYFIyBTDtLK5YbSjAEp3E2e+CQM3wLO+BqllCoGL2WThGQHNpNlRmfqA
	xf4snJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkd1-00000006q3L-39rS;
	Tue, 11 Nov 2025 09:25:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkcy-00000006q2g-00aE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 09:25:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ED722F;
	Tue, 11 Nov 2025 01:25:19 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76EC03F66E;
	Tue, 11 Nov 2025 01:25:26 -0800 (PST)
Date: Tue, 11 Nov 2025 09:25:24 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 11/11] coresight: etm4x: Reuse normal enable and
 disable logic in CPU idle
Message-ID: <20251111092524.GC281971@e132581.arm.com>
References: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
 <20251103-arm_coresight_power_management_fix-v5-11-f803c19aa153@arm.com>
 <f52a601f-7275-478c-a759-1a87f0550c42@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f52a601f-7275-478c-a759-1a87f0550c42@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_012528_082548_2F200777 
X-CRM114-Status: GOOD (  12.83  )
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

On Mon, Nov 10, 2025 at 11:44:20AM +0000, Suzuki Kuruppassery Poulose wrote:

[...]

> > +	etm4_cs_lock(drvdata, csa);
> 
> > +	etm4_disable_hw(drvdata);
> > +	etm4_cs_unlock(drvdata, csa);
> This looks a bit hacky. Here are the options :
> 
> 1. Leave it as above, but clearly explain in a comment why we do this.
> 2. The other option is to restructure etm4_disable_hw into
>  etm4_cs_unlock()
>  __etm4_disable_hw()
>  etm4_cs_lock()

I will try the option 2.

> And use __etm4_disable_hw() from here.
> 
> >   	/* wait for TRCSTATR.IDLE to go up */
> >   	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1)) {
> >   		dev_err(etm_dev,
> > @@ -1972,14 +1889,6 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
> >   		goto out;
> 
> This goto can be removed too.

Indeed, will remove it.

Thanks,
Leo


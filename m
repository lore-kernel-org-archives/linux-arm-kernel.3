Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F051CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYpzqSZGHxpfXsSp418zJGiUJe93BtLMmqDp8Lw9Tu4=; b=k1F45m2C7WSSlL5FRUdptx+sU0
	x/RNAaf4HSv7o24jnKfGDcoN4NAgOTyzXbef9SBAKXM6Q7Dmpq+mwv5xOPFYLN1sJFVHMiDkAUduU
	+tPPuppsOkF/ygmLaGYwEaHfFKLjhFEJ92rHevElDi7Uqcm6QP4w1gldR3xyd+dzUFHAQAKaPY9VE
	e5u9BgedfyCAJvBa6CyFDgBwYUq9JX6EcMVYGYmsDA52/pOBNnUeWl48/WjvqaIO4IsHaaRn5uULi
	RdXZ/PfqIXYzQUGNRCUGudZSUpme8dErbKmF5iUrzvQntEpGKCkbs2ymgccVzxhBdTcU/oHMhGUG4
	148Wn67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzgG-0000000Aato-2Rfv;
	Mon, 01 Jun 2026 10:15:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzgD-0000000AatG-1ckk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 10:15:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85D8A1E8D;
	Mon,  1 Jun 2026 03:15:27 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08E033F905;
	Mon,  1 Jun 2026 03:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780308932; bh=fX0ONQk0U/Ob9Dja3BN0MNUNMDOTy0beVX1kCqYBiFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phAAoWjmco9sCEpORh7EBp1xvBX19ZW/YmrR5xFdaSdjpTgzdSzDcVz1rekYdboK7
	 xvSZHUrNjnQw8kZCzxyWEDT5krwf8ZjkyODN2NvBZwEkSAcYuwpt0jUCu9Ikk6v30k
	 Ygu+sxE1Vl+C4yJQ4P00R7+6muh71Mvg9btJFlCI=
Date: Mon, 1 Jun 2026 11:15:28 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, mike.leach@arm.com,
	james.clark@linaro.org, alexander.shishkin@linux.intel.com,
	leo.yan@arm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v7 02/13] coresight: etm4x: fix underflow for nrseqstate
Message-ID: <ah1bwOSCMrwfrRwD@e129823.arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-3-yeoreum.yun@arm.com>
 <3155a54e-f0df-49d7-9cf7-6f1c0f826f31@arm.com>
 <ah1aCFTgshh9klDM@e129823.arm.com>
 <0974242f-6102-49ec-b87b-763931eb9aef@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0974242f-6102-49ec-b87b-763931eb9aef@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_031533_508364_059CE2A9 
X-CRM114-Status: GOOD (  24.25  )
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

> On 01/06/2026 11:08, Yeoreum Yun wrote:
> > > On 19/05/2026 16:48, Yeoreum Yun wrote:
> > > > TCRSEQEVR<n> is implemented only when TCRIDR5.NUMSEQSTATE is 0b100,
> > > > in which case n ranges from 0 to 2; otherwise, TCRIDR5.NUMSEQSTATE is 0b000.
> > > > 
> > > > Therefore, drvdata->nrseqstate should be checked before entering the loop.
> > > 
> > > for (i = 0; i < drvdata->nrseqstate - 1; i++)
> > > 
> > > Wouldn't that check cover the case ? (provided i is signed int ?)
> > > 
> > > Suzuki
> > 
> > Unfortunately, the drvdata->nrseqstate is u8 but i is signed int.
> > I think in this case it would iterate 255 times (0xff).
> 
> Then why not fix it to signed ? Anyways, please see my other comment. We
> shouldn't be relying on nrseqstate for the number of seq_ctrl registers.

Yeap. I confirmed that. I think it's enough with the nr_seq_ctrl.

Thanks!

> 
> > 
> > > 
> > > > 
> > > > Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
> > > > Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
> > > > Reviewed-by: Leo Yan <leo.yan@arm.com>
> > > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > > ---
> > > >    .../hwtracing/coresight/coresight-etm4x-core.c | 18 ++++++++++--------
> > > >    .../coresight/coresight-etm4x-sysfs.c          |  2 ++
> > > >    2 files changed, 12 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > index 1e3b0344dc00..94b9385e964a 100644
> > > > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > @@ -542,9 +542,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> > > >    	etm4x_relaxed_write32(csa, config->vissctlr, TRCVISSCTLR);
> > > >    	if (drvdata->nr_pe_cmp)
> > > >    		etm4x_relaxed_write32(csa, config->vipcssctlr, TRCVIPCSSCTLR);
> > > > -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> > > > -		etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
> > > > +
> > > >    	if (drvdata->nrseqstate) {
> > > > +		for (i = 0; i < drvdata->nrseqstate - 1; i++)
> > > > +			etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
> > > > +
> > > >    		etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
> > > >    		etm4x_relaxed_write32(csa, config->seq_state, TRCSEQSTR);
> > > >    	}
> > > > @@ -1896,10 +1898,10 @@ static int etm4_cpu_save(struct coresight_device *csdev)
> > > >    	if (drvdata->nr_pe_cmp)
> > > >    		state->trcvipcssctlr = etm4x_read32(csa, TRCVIPCSSCTLR);
> > > > -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> > > > -		state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
> > > > -
> > > >    	if (drvdata->nrseqstate) {
> > > > +		for (i = 0; i < drvdata->nrseqstate - 1; i++)
> > > > +			state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
> > > > +
> > > >    		state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
> > > >    		state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
> > > >    	}
> > > > @@ -2009,10 +2011,10 @@ static void etm4_cpu_restore(struct coresight_device *csdev)
> > > >    	if (drvdata->nr_pe_cmp)
> > > >    		etm4x_relaxed_write32(csa, state->trcvipcssctlr, TRCVIPCSSCTLR);
> > > > -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> > > > -		etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
> > > > -
> > > >    	if (drvdata->nrseqstate) {
> > > > +		for (i = 0; i < drvdata->nrseqstate - 1; i++)
> > > > +			etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
> > > > +
> > > >    		etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
> > > >    		etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
> > > >    	}
> > > > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > > > index e9eeea6240d5..0e1ad175aa1e 100644
> > > > --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > > > +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > > > @@ -1395,6 +1395,8 @@ static ssize_t seq_idx_store(struct device *dev,
> > > >    	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > > >    	struct etmv4_config *config = &drvdata->config;
> > > > +	if (!drvdata->nrseqstate)
> > > > +		return -ENOTSUPP;
> > > >    	if (kstrtoul(buf, 16, &val))
> > > >    		return -EINVAL;
> > > >    	if (val >= drvdata->nrseqstate - 1)
> > > 
> > 
> 

-- 
Sincerely,
Yeoreum Yun


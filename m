Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDBFC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGVrjkQl4FjaZGqWLe7La/v/iRxnu3RdqaTZY9lHj/M=; b=wvXysubEV5lwJ6CxqrKU22MxYI
	Opyx60DvYdCYe7QoQR1fNjWpe+VCDUELHi2qWfGloRB4m1fE4jes8SHdG2D1vKLOIR9bjLRTWgW1S
	z8EOq72n3j77rwlbt5+F+6sxJ14GJxP0Ee3Y2oETkpBz/j4SAfAraKa6nFLPFqYQL1UMJ1Fe/bvsa
	19M38XHmMNOYNuYXiN35y8Rca7KzUI2XH/Nrl2TTT+Bi0ADFmU343P91n3q6gyCTSHtY7m0SJ/z07
	kbU6Z80PETYNxOE/hTcKSHnCUoOoRI0d+ABkEuJBX+qfNYZgxufDT2NzYr4e2U/dYV5kaDyS8Pw4L
	FmGzqKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7c4T-0000000F91k-27K4;
	Fri, 18 Sep 2026 17:08:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7c4R-0000000F91H-0D6B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 17:08:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC3C31476;
	Fri, 18 Sep 2026 10:08:12 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15E903F7B4;
	Fri, 18 Sep 2026 10:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789751296; bh=PY6JJUepgxCEPlcrfnMmYVpbq3oRM0GsIQdyMQ4tARA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aN4/oV3ljICWliH14xVpOIhBTcs+SMZFCDdbcHCzgm6ENRDTCMb4Jo51Olhger7Rl
	 dZdeFIq5TTL1ChBaAyhsuSJqvrK+brtiGQ0N3YGuCLmpntsdysHRXKx/9kQUwNJEYX
	 jcy3B8E2+G/GHL4Vq8IB57bFwQKZn7Q//a0XQmqA=
Date: Fri, 18 Sep 2026 18:08:11 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mike Leach <mike.leach@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, nd@arm.com
Subject: Re: [PATCH v11 1/9] coresight: etm4x: prohibit modifying ss_status
 and cntr_val while session is enabled
Message-ID: <aq1v-yo7gsQHasZP@e129823.arm.com>
References: <20260915-separate_etm_cfg_v2-v11-0-d2b258d51747@arm.com>
 <20260915-separate_etm_cfg_v2-v11-1-d2b258d51747@arm.com>
 <89b18b1e-65ca-4e97-b827-90d360b9e881@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89b18b1e-65ca-4e97-b827-90d360b9e881@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_100819_130773_57A3F1C0 
X-CRM114-Status: GOOD (  23.96  )
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

Hi Mike,

> Hi,
> 
> Preventing a write to the counter value register is correct, but protecting
> the ss_status is redundant.
> 
> On 9/15/26 12:34, Yeoreum Yun wrote:
> > ss_status and cntr_val are overwritten with the values read from the
> > corresponding registers by etm4_disable_hw() when the session is disabled.
> > 
> > This means that any changes to these values made while the session is
> > enabled would be lost when the session is disabled.
> > 
> > Therefore, prohibit modifying ss_status and cntr_val while the session is
> > enabled.
> > 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > index cc6cdd3ae29d5..8d73248b840a6 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > @@ -1613,6 +1613,8 @@ static ssize_t cntr_val_store(struct device *dev,
> >   		return -EINVAL;
> >   	if (val > ETM_CNTR_MAX_VAL)
> >   		return -EINVAL;
> > +	if (coresight_get_mode(drvdata->csdev))
> > +		return -EBUSY;
> >   	raw_spin_lock(&drvdata->spinlock);
> >   	idx = config->cntr_idx;
> > @@ -1797,6 +1799,8 @@ static ssize_t sshot_ctrl_store(struct device *dev,
> >   	if (kstrtoul(buf, 16, &val))
> >   		return -EINVAL;
> > +	if (coresight_get_mode(drvdata->csdev))
> > +		return -EBUSY;
> 
> This is protecting a write clearing the STATUS bit in TRCSSCSR - but this is
> cleared automatically when next time the hardware is enabled in
> etm4_enable_hw(). So the write to ss_status in this function is redundant as
> is this protection.
> 
> The actual write to the targeted control register will persist.

Acked, I'll remove this protection in here.

Thanks!

[...]

-- 
Sincerely,
Yeoreum Yun


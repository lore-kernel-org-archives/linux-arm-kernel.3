Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD216CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9VgjEIlRLM6USavGeU2lyo+I6OFJLC9cak2KDsjzm4=; b=aVzpHStoBQuXazkiKJayjSe/AC
	CcvdMei47cWE0mb1a3UmXjsFMKH9hD8L5Whhunyz5S8KN0esUvOD9oucm0p+XfURYZnCw+tl9xDJW
	V051rz4nE2LEzLI6y5YJ3eEyWOgruwwQms1LjK6t3PGr51logITfPZDxLTw709zz+SrWB1XTqT2o7
	14uCKggUCTjMio+WEf1HnrZm+/OeAjq4L37MQU9M4JKm9WQa+yHFPPudfWIxxVPWXZTO0DS4cstyv
	eesgGtKEoMlG9LBDarwRQBy/leavKJ7dPtIBpJnrh47SBiYWv0IZ3EGvfnCUPy0L8vQHa//WYG4gI
	GzaCF+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6TX-0000000G1Qt-1WD3;
	Tue, 21 Oct 2025 07:08:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6TU-0000000G1Pe-1XJT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 07:08:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC0431063;
	Tue, 21 Oct 2025 00:07:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68E2E3F66E;
	Tue, 21 Oct 2025 00:08:02 -0700 (PDT)
Date: Tue, 21 Oct 2025 08:08:00 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] coresight: ETR: Fix ETR buffer use-after-free issue
Message-ID: <20251021070800.GK281971@e132581.arm.com>
References: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
 <20251020143718.GH281971@e132581.arm.com>
 <6e6c3034-221c-4e79-8971-7bfbe26f91a6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e6c3034-221c-4e79-8971-7bfbe26f91a6@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_000804_446129_4A5EEDBC 
X-CRM114-Status: GOOD (  15.25  )
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

On Tue, Oct 21, 2025 at 09:56:43AM +0800, Jie Gan wrote:

[...]

> > diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> > index b07fcdb3fe1a..d0fac958c614 100644
> > --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> > +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> > @@ -1241,6 +1241,8 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
> >   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> >   	struct etr_buf *sysfs_buf = NULL, *new_buf = NULL, *free_buf = NULL;
> > +	WARN_ON(coresight_get_mode(csdev) != CS_MODE_SYSFS);
> 
> I think we should check the WARN_ON result and exit if there is an error?

When run at here, it should be in Sysfs mode. Here the check is for
debugging purpose in case any mismatch.

[...]

> > +static void tmc_release_mode(struct coresight_device *csdev, enum cs_mode mode)
> > +{
> > +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> > +
> > +	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
> > +
> > +	if (WARN_ON(coresight_get_mode(csdev) != mode))
> > +		return;
> 
> the mode here could be set to any CS_MODE, so I think it's possible to
> encounter the secenario below:
> 
> coresight_get_mode(csdev) == CS_MODE_DISABLED, mode == CS_MODE_DISABLED,
> 
> With the condition, the csdev->refcnt will go to negative number?

The parameter "mode" might cause complexity, will drop it.  The
correctness will be ensured by the callers.

Thanks for review!

Leo


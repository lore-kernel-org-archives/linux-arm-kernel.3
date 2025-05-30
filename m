Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5600C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEtjdQWVmUUIDWfuXFiJWebkpsnnmSwPHKfsZD+NnoQ=; b=Li4F1cbOvKhYd6Vga4xU+fGGko
	COWktUVuRgJyO8EMIt3UGP0j9Cb+rhP6WLs/PM3jTLNjC7/QVxy8/R+isH3YRYAzb2D5mB4JTkLA8
	5Soz08DJu/IbeCDTqdzcivUfmLK0Ji2I6pqxj2sD+1PjGuQ0otKQEv+frmsu6ZC5z5YjHDOrAr80u
	7zhRyIKHzEV6BiARfj9vdpSxqDKIgR7o+kC1LTfXyDptmBQGmUXOyfLxm4Ip10uH14sjrRjuBLZBd
	O/ZFAGSmIdVMsorx6YHMeiLS0qR073bOouRtItOMkc1JgarkOjfbAzb/+jLT5R3znkM3iMPXafBKT
	30cR6ong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKw3C-000000007cq-0BJj;
	Fri, 30 May 2025 09:29:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvyM-000000006mE-3ilE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:24:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 050CE16F2;
	Fri, 30 May 2025 02:24:02 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B0A93F5A1;
	Fri, 30 May 2025 02:24:17 -0700 (PDT)
Date: Fri, 30 May 2025 10:24:13 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight-tpdm: add trace_id sysfs node
Message-ID: <20250530092413.GA666854@e132581.arm.com>
References: <20250530-showtraceid-v1-1-2761352cf7b4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-showtraceid-v1-1-2761352cf7b4@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_022419_054511_D9538AD8 
X-CRM114-Status: GOOD (  30.90  )
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

On Fri, May 30, 2025 at 03:29:14PM +0800, Yuanfang Zhang wrote:
> The trace ID of TPMD is the trace ID of the TPDA or TNOC
> which it is connected to, this change adds trace_id sysfs
> node to expose this trace id to userspace.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  drivers/hwtracing/coresight/coresight-tpdm.c | 16 ++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 7214e65097ec9ac69f6c7c9278bcd28d25945c9e..8a5d115157924f39b09f8e3005827d7d64aa376c 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -497,6 +497,9 @@ static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
>  
>  	__tpdm_enable(drvdata);
>  	drvdata->enable = true;
> +
> +	if (path)
> +		drvdata->traceid = path->trace_id;

In Sysfs mode, the core layer calls coresight_path_assign_trace_id().
Eventually, the source driver's trace_id() callback is invoked to
retrieve the trace ID.

I don't see TPDM driver provides trace_id() callback, so here
"path->trace_id" is an invalid value?

Please refer to STM driver (see stm_trace_id()) for this part.

>  	spin_unlock(&drvdata->spinlock);
>  
>  	dev_dbg(drvdata->dev, "TPDM tracing enabled\n");
> @@ -554,6 +557,7 @@ static void tpdm_disable(struct coresight_device *csdev,
>  	__tpdm_disable(drvdata);
>  	coresight_set_mode(csdev, CS_MODE_DISABLED);
>  	drvdata->enable = false;
> +	drvdata->traceid = 0;

Seems to me, a source device can reserve a trace ID until the module
is unloaded.  So it is not necessary to clean up trace ID when
disabling it.

BTW, my understanding is that you are trying to allocate a trace ID in
the TPDM driver and propagate the ID to the TNOC driver.  It would be
helpful if you could send the patches in one go, we can review it in
global picture.

Leo.

>  	spin_unlock(&drvdata->spinlock);
>  
>  	dev_dbg(drvdata->dev, "TPDM tracing disabled\n");
> @@ -655,9 +659,21 @@ static ssize_t integration_test_store(struct device *dev,
>  }
>  static DEVICE_ATTR_WO(integration_test);
>  
> +static ssize_t traceid_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	unsigned long val;
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	val = drvdata->traceid;
> +	return sprintf(buf, "%#lx\n", val);
> +}
> +static DEVICE_ATTR_RO(traceid);
> +
>  static struct attribute *tpdm_attrs[] = {
>  	&dev_attr_reset_dataset.attr,
>  	&dev_attr_integration_test.attr,
> +	&dev_attr_traceid.attr,
>  	NULL,
>  };
>  
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index b117543897344b689f666f6890cabb59c8ee4869..e12a64f265daa86f1b82fa3640e271e8386f99af 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -300,6 +300,7 @@ struct cmb_dataset {
>   * @cmb         Specifics associated to TPDM CMB.
>   * @dsb_msr_num Number of MSR supported by DSB TPDM
>   * @cmb_msr_num Number of MSR supported by CMB TPDM
> + * @traceid:    Value of the current ID for this component.
>   */
>  
>  struct tpdm_drvdata {
> @@ -313,6 +314,7 @@ struct tpdm_drvdata {
>  	struct cmb_dataset	*cmb;
>  	u32			dsb_msr_num;
>  	u32			cmb_msr_num;
> +	u8			traceid;
>  };
>  
>  /* Enumerate members of various datasets */
> 
> ---
> base-commit: 94305e83eccb3120c921cd3a015cd74731140bac
> change-id: 20250523-showtraceid-2df91c89be8f
> 
> Best regards,
> -- 
> Yuanfang Zhang <quic_yuanfang@quicinc.com>
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org


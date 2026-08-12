Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59672C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65zVvl9g7ejbJxIb6EcLV8Edgiv87CjX+iEqwz1O46I=; b=BT5I7OTTYC72BELC7fMg+gVGqd
	xOGMV2Fc7ZgCYcWZsZ2CIbbkSwd/JNBkpITmrIKgf7RB9A+qejQW6RVo5hVErnd7B/zy0y4N+3PkW
	VITcMmErujrPF2iXfMwbI/TRz/um/XjRWB1vIwPryw6E7t1e++iaB3yIX71pOuMPfZsiF1fW6FaMl
	TaeeBC80mpvHDmSr3K0hWG0ozOcn2hFLYJ3PjiHlUVjr76BOAYjrQGZV1EM2F4Jkr9dEqsUZUSGD5
	QqofxRYK3Gt18EuEPR1njaUsrQ0tKKHWpAqQNtni3JDGJhPoklItSslnfjkv/X+A6NaapvGawXvwp
	h+AEyY4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuC5G-0000000GcEn-0Q36;
	Wed, 12 Aug 2026 16:45:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuC5C-0000000GcEO-2yfc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:45:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF77F1682;
	Wed, 12 Aug 2026 09:45:30 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BA1D3F632;
	Wed, 12 Aug 2026 09:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786553134; bh=kZfrWbpyWg25XOFCqRRGcIF1rCmQ4eG3ydpCkOGHodI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOux6qhYWyqRR6AQNI3mpag4wcBPehmp/ImE64d+pwI7lYma08H/zuwvUthOA3I0x
	 oiWrr2gANwwy90HJuPcvWdNY45AO+U02tO2oekuqeMCW+xElgqsOpMBqhXxVPA6qC9
	 jeth4bANAMhv7i/gk2ktctLrD9lxzTQqp4iLWlOk=
Date: Wed, 12 Aug 2026 17:45:32 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 1/8] coresight: tmc-etr: Don't stop Perf cleanup for
 active sysfs reads
Message-ID: <20260812164532.GA313579@e132581.arm.com>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
 <20260728-james-cs-multiple-per-threads-v3-1-6aee7579f1dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-james-cs-multiple-per-threads-v3-1-6aee7579f1dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_094538_848878_6CE1DA18 
X-CRM114-Status: GOOD (  28.88  )
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

On Tue, Jul 28, 2026 at 04:00:13PM +0100, James Clark wrote:
> The linked fixes commit deliberately allows reads of an old sysfs buffer
> while in Perf mode because they are separate software buffers. However
> it didn't modify tmc_disable_etr_sink() to match this relaxation. The
> result is that when a Perf event ends while the sysfs buffer is being
> read, clean up will be skipped.
> 
> Fix it by ignoring the sysfs_reading flag unless the active session is
> a sysfs one.

I am not clear why this is relevant to per-thread mode, maybe it would
be clear for me after reading other patches.

For this patch self, I think the issue comes from the sink buffer's life
time - SYSFS mode's buffer has longer life time than a sysfs session,
it is designed to allow reading sysfs trace data after the sysfs
session, or even during a perf session. So the code gets complex for
handling these cases.

I really think we should have a correct life time (or state machine)
for sysfs buffer, something like:

  Operations                        |  ETR sysfs buffer state machine
  ----------------------------------+-----------------------------------------
                                    |  INVALID: Init state, buffer unallocated
  echo 1 > .../tmc_etr0/enable_sink |  READY: user can read zeroed data
  echo 1 > .../etm0/enable_source   |  BUSY: user cannot read as hardware is
                                    |        writing data to buffer
  echo 0 > .../etm0/enable_source   |  READY: trace is stopped, user can read
                                    |         trace data
  echo 0 > .../tmc_etr0/enable_sink |  INVALID: buffer has been released

With the state machine's help, we might even don't need to bother what
the sink device's mode is.

> When sysfs and Perf share the same memory in ETR_MODE_RESRV mode, a new
> Perf session needs to overwrite an old inactive sysfs session by zeroing
> len. This avoids sysfs from reading stale data because it has a separate
> set of offsets in its etr_buf struct, even if that's backed by the same
> memory as the Perf one.

This can be naturally resolved if we have a state machine above?

[...]

> +static bool tmc_perf_sysfs_shared(struct tmc_drvdata *drvdata,
> +				  struct etr_buf *perf_buf)
> +{
> +	/* In ETR_MODE_RESRV mode, sysfs and Perf share the same memory. */
> +	return perf_buf &&
> +	       drvdata->sysfs_buf &&
> +	       drvdata->sysfs_buf->mode == ETR_MODE_RESRV &&
> +	       perf_buf->mode == ETR_MODE_RESRV;
> +}
> +
>  static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
>  				    struct coresight_path *path)
>  {
> @@ -1772,6 +1782,18 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
>  		goto unlock_out;
>  	}
>  
> +	/*
> +	 * Don't use if it's shared and being read by sysfs. Sysfs may only
> +	 * start reading (the cleared zero length buffer) after the first
> +	 * tmc_enable_etr_sink_perf(), which changes the result of this check,
> +	 * so it should only be done once.
> +	 */
> +	if ((drvdata->sysfs_reading &&
> +	     tmc_perf_sysfs_shared(drvdata, etr_perf->etr_buf))) {
> +		rc = -EBUSY;
> +		goto unlock_out;
> +	}

This is quite tricky. If someone reads the sysfs entry in the middle of
a perf session, and the traced task is migrated to a different CPU or
wakes up, the sink device may need to be re-enabled, however the sink
enabling could fail due to the concurrent sysfs read here.

Thanks,
Leo


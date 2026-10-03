Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8B1CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 06:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDze3XFWBkrWczROR23RBjZLU3DzM0I0NBPJImuRM2g=; b=H5irNWmLiXfogUIE1Uue8Bx03b
	HKul8aSacCOc0Qyuz72fXt4tb4lTtpO8gqA/6DZ8ah7+ix08ggmtqeFKJNHcpMcSO8QLo3Lxfc2xa
	RcXa3InQCGloeeg3u4NNLA3cT+ks7aoD8qiYSWkhotGTHXAhIm4A5W3HtPmi+Fr/Nian+AFJ95A8B
	9YLKXVW1IF3d6e4ixy+h+m+vvvofGAWS00JzBE5iImqAfFqS0MSBbRdDgN97YDq54gJI+dvDLFWry
	MamMxXBy9PoonKw9hDIYL90iD0r+PgP1CaNovZkVG54GuR0pQNXogoeFQoNhWFFI0Qbg+sEkb2vA9
	9NQF0w2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCsua-0000000D4wV-48vp;
	Sat, 03 Oct 2026 06:07:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCsuY-0000000D4w9-3k5T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 06:07:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC6E72F;
	Fri,  2 Oct 2026 23:07:48 -0700 (PDT)
Received: from [10.57.8.170] (unknown [10.57.8.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 083CD3F763;
	Fri,  2 Oct 2026 23:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791007672; bh=wa4AOlE/1uBwYq+kAPl6VeapNdrQNjEjASltYH2rCe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cKtNs0Ad+gPzljAYfBw3MY8W50cx+46/M1zvmGn4FNCRcFRoJGGsIjbi97XNkrpL/
	 TdIj29XCbK5Zi3bYlIgkm1XVxAAo3J8Q0Dm0qeJNVx7+hxO8kiGff/M7uJGgtrbQav
	 EQCkJy/sz4j8VaS7pTcdFjNm0Hb0tk0iIHenhGBI=
Message-ID: <beae08c7-798b-4314-8335-5303af23d513@arm.com>
Date: Sat, 3 Oct 2026 07:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v13 01/14] coresight: etm4x: read-back TRCSEQSTR at
 disabling and prohibit modifying seq_state while enabling.
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
References: <20261003-separate_etm_cfg_v2-v13-0-5d8a29aead95@arm.com>
 <20261003-separate_etm_cfg_v2-v13-1-5d8a29aead95@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261003-separate_etm_cfg_v2-v13-1-5d8a29aead95@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_230755_019264_2BB02494 
X-CRM114-Status: GOOD (  18.95  )
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

Hi Levi


Please run checkpatch on your submissions.

The subject is too long, I have changed that to :

coresight: etm4x: Prohibit TRCSEQSTR modifications while tracing enabled

On 03/10/2026 03:52, Yeoreum Yun wrote:
> TRCSEQSTR can be changed by the ETM while a session is active. Its value
> therefore needs to be preserved when a sysfs session is disabled so that
> users can read the current sequence state after the session ends.
> 
> This means that any changes made to TRCSEQSTR while the sysfs-session is active

Please stick to 75 spaces. I have fixed this up.

Cheers
Suzuki

> would be lost when the session is disabled.

> 
> Copy the TRCSEQSTR value when disabling a sysfs session, and prohibit
> modifying seq_state while the session is active.
> 
> Suggested-by: Mike Leach <mike.leach@arm.com>
> Reviewed-by: Mike Leach <mike.leach@arm.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c  | 4 ++++
>   drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 2 ++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2247ad55d444..9ca03a5913a3 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1073,6 +1073,10 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>   			etm4x_relaxed_read32(csa, TRCCNTVRn(i));
>   	}
>   
> +	/* read back the sequence state */
> +	if (drvdata->nrseqstate)
> +		config->seq_state = etm4x_relaxed_read32(csa, TRCSEQSTR);
> +
>   	coresight_disclaim_device_unlocked(csdev);
>   	etm4_cs_lock(drvdata, csa);
>   
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index cc6cdd3ae29d..4945d577ceab 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -1435,6 +1435,8 @@ static ssize_t seq_state_store(struct device *dev,
>   
>   	if (kstrtoul(buf, 16, &val))
>   		return -EINVAL;
> +	if (IS_ERR_OR_NULL(drvdata->csdev) || coresight_get_mode(drvdata->csdev))
> +		return -EBUSY;
>   	if (val >= drvdata->nrseqstate)
>   		return -EINVAL;
>   
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3B9C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 12:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nXT58VHalIdvKTI4hECTuKccLjpU6kV+MXUBSaB5Ok=; b=aThOnh3RpUJCk+c/oaK+Nh12ZK
	HUbDzpPwWSuwN799iPAfzE8Hd0Fx4pMk3W5fjdCEM7t/aEvQNhRL4JcLQ0xVdk+yuk+zEm9Imig03
	5/NAgbRfAzDReYo5hNoJjHY+K/oCswbKDwFpPFP1ONfG9sqxW6QYwHcF/ApNrME1yxPzcpiUOetCG
	SzlgsnBQIYNLnqjSdX4+9+sojoRA/TcaZKJwEYzXTiuwunZgZjnBjh/leONZfyRLk6fMP+oiTXpb9
	kWL+UdrPdaC9dQB81Y5KDc42hoxQ5g7q9d1BGqsRw8iBVrk4xKSMyV2u8HMtrNQOfAnpshib5njs0
	L+xsEy1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA68h-0000000Clm6-34d4;
	Wed, 30 Apr 2025 12:02:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA64S-0000000Cl3b-0YVO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 11:57:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6281106F;
	Wed, 30 Apr 2025 04:57:37 -0700 (PDT)
Received: from [10.1.33.69] (Suzukis-MBP.cambridge.arm.com [10.1.33.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E63E53F673;
	Wed, 30 Apr 2025 04:57:42 -0700 (PDT)
Message-ID: <8c1af968-0e96-42d5-a5a6-c5581eda9f3d@arm.com>
Date: Wed, 30 Apr 2025 12:57:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Arm CoreSight: Support AUX pause and resume
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250401180708.385396-1-leo.yan@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250401180708.385396-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_045748_220835_A285B028 
X-CRM114-Status: GOOD (  18.84  )
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

On 01/04/2025 19:07, Leo Yan wrote:
> This series is to enable AUX pause and resume on Arm CoreSight.
> 
> The first patch extracts the trace unit controlling operations to two
> functions.  These two functions will be used by AUX pause and resume.
> 
> Patches 02 and 03 change the ETMv4 driver to prepare callback functions
> for AUX pause and resume.
> 
> Patch 04 changes the ETM perf layer to support AUX pause and resume in a
> perf session.  The patch 05 re-enables sinks after buffer update, based
> on it, the patch 06 updates buffer on AUX pause occasion, which can
> mitigate the trace data lose issue.
> 
> Patch 07 documents the AUX pause usages with Arm CoreSight.
> 
> This patch set has been verified on the Hikey960 board.
> 
> It is suggested to disable CPUIdle (add `nohlt` option in Linux command
> line) when verifying this series.  ETM and funnel drivers are found
> issues during CPU suspend and resume which will be addressed separately.
> 

The series looks good to me, except for the comment on the Patch 1.

I would like to get an Ack from James as he has looked at in the past.

Suzuki


> Changes from v3:
> - Re-enabled sink in buffer update callbacks (Suzuki).
> 
> Changes from v2:
> - Rebased on CoreSight next branch.
> - Dropped the uAPI 'update_buf_on_pause' and updated document
>    respectively (Suzuki).
> - Renamed ETM callbacks to .pause_perf() and .resume_perf() (Suzuki).
> - Minor improvement for error handling in the AUX resume flow.
> 
> Changes from v1:
> - Added validation function pointers in pause and resume APIs (Mike).
> 
> 
> Leo Yan (7):
>    coresight: etm4x: Extract the trace unit controlling
>    coresight: Introduce pause and resume APIs for source
>    coresight: etm4x: Hook pause and resume callbacks
>    coresight: perf: Support AUX trace pause and resume
>    coresight: tmc: Re-enable sink after buffer update
>    coresight: perf: Update buffer on AUX pause
>    Documentation: coresight: Document AUX pause and resume
> 
>   Documentation/trace/coresight/coresight-perf.rst   |  31 +++++++++
>   drivers/hwtracing/coresight/coresight-core.c       |  22 +++++++
>   drivers/hwtracing/coresight/coresight-etm-perf.c   |  84 +++++++++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 143 +++++++++++++++++++++++++++++------------
>   drivers/hwtracing/coresight/coresight-etm4x.h      |   2 +
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-etf.c    |   9 +++
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    |  10 +++
>   include/linux/coresight.h                          |   4 ++
>   9 files changed, 265 insertions(+), 42 deletions(-)
> 



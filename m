Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F46C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAyEtmG7a/9WlD0JutQ26lvR4oRY4UAnc7wFZ6HKGxc=; b=FCeTBVeaqhaCn6ShpfSYA+Ch7/
	Y33F1K9QDCv/2pZaT0xWXLUAIP6pKdmEo1DnNuP1r9iXvqpUROqJ14t73cIPEahYncoOm3dqVYFJi
	rkJlbmK8EYY1glGOa11e9HNL6X5Nw6GPh1vq90Wa8seU7jNIuVkXgnhVpo9qSQUEkXgGr2/nQPq/J
	l5RpCIRfQhf1EXzq2SxzzEt2R3uvROscbf8DCEqgT8UqEW0X6Whr//NVk7TjcFdUFgmEbj0cWd7s/
	T/lw3tMu6XpqEyGC37d0vI8JUJLT3+a8hLXBq9bda5JzuG4aPk+JxbSEblrJKlEBXTl7TML5lAOpm
	gJEkxOpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nFv-0000000Bjgd-0Jjb;
	Thu, 24 Sep 2026 17:29:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nFs-0000000Bjfl-1iox
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 269BB1E4D;
	Thu, 24 Sep 2026 10:29:01 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D01FA3F86F;
	Thu, 24 Sep 2026 10:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790270944; bh=mRX+6RgjudFX3w/AvoHXAb2SkbXZDaFnBAiX06s9qoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yf+pusJzIbF7VE7VAJ4KcI6fhVLDD638gbaF+c3YcVoa8EnIPdamHr+U7REFb2BEx
	 zxMydX3eCxlPiD9sBosG7SRp956xbjPcLY7yOXuRLzqYrB6mpkiHFhwE0FkzP1lP1s
	 l4zyk1fkCmYQq8N9Yd+oglKpjprTKikQCZYqR7gs=
Date: Thu, 24 Sep 2026 18:28:59 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v11 0/9] fix several inconsistencies with sysfs
 configuration in etmX
Message-ID: <arVd2zXOAY1pa5gZ@e129823.arm.com>
References: <20260915-separate_etm_cfg_v2-v11-0-d2b258d51747@arm.com>
 <20260924152543.GL200420@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924152543.GL200420@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_102908_546323_F5E72CD7 
X-CRM114-Status: GOOD (  18.64  )
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

On Thu, Sep 24, 2026 at 04:25:43PM +0100, Leo Yan wrote:
> On Tue, Sep 15, 2026 at 12:34:35PM +0100, Yeoreum Yun wrote:
> 
> > To resolve these inconsistencies, the configuration should be separated into:
> > 
> >   - active_config, which is applied configuration for the current session
> >   - config, which stores the settings configured via sysfs.
> > 
> > and apply configuration from configfs after taking a mode.
> 
> I did the following tests on this series:
> 
>  1) Perf test on Orion6 board:
> 
>   # ./perf test coresight
>   142: CoreSight synthesized callchain                                                                           : Ok
>   143: CoreSight concurrent threads                                                                              : Ok
>   144: CoreSight context switch thread attribution                                                               : Ok
>   145: CoreSight deterministic workload decode                                                                   : Ok
>   146: CoreSight raw dump stress                                                                                 : Ok
>   147: Check Arm CoreSight trace data recording and synthesized samples                                          : FAILED!
>   148: Check Arm CoreSight disassembly script completes without errors                                           : Ok
> 
> Test 147 has a known issue with per-thread mode. The failure was already
> observed before this series.
> 
>  2) Strobe mode test:
> 
>   # echo 5000 > /sys/kernel/config/cs-syscfg/features/strobing/params/window/value
> 
>   # echo 0 > /sys/kernel/config/cs-syscfg/features/strobing/params/period/value
>   # perf record -e cs_etm/autofdo,timestamp=0/u -m,128M  -- perf test -w brstack 3000000
>   [ perf record: Woken up 1 times to write data ]
>   [ perf record: Captured and wrote 36.301 MB perf.data ]
> 
>   # echo 1 > /sys/kernel/config/cs-syscfg/features/strobing/params/period/value
>   # perf record -e cs_etm/autofdo,timestamp=0/u -m,128M  -- perf test -w brstack 3000000
>   [ perf record: Woken up 1 times to write data ]
>   [ perf record: Captured and wrote 18.361 MB perf.data ]
> 
>   # echo 2 > /sys/kernel/config/cs-syscfg/features/strobing/params/period/value
>   # perf record -e cs_etm/autofdo,timestamp=0/u -m,128M  -- perf test -w brstack 3000000
>   [ perf record: Woken up 1 times to write data ]
>   [ perf record: Captured and wrote 12.246 MB perf.data ]
> 
>   # echo 3 > /sys/kernel/config/cs-syscfg/features/strobing/params/period/value
>   # perf record -e cs_etm/autofdo,timestamp=0/u -m,128M  -- perf test -w brstack 3000000
>   [ perf record: Woken up 1 times to write data ]
>   [ perf record: Captured and wrote 9.197 MB perf.data ]
> 
> The captured trace sizes maintain the expected proportional relationship
> with the period values.
> 
>  3) I verified the series on Juno-r2 baord with insmod and rmmod, and
>     CPU PM, and did not see any regression.
> 
> Maybe it'd be good to send a new version addressing Mike's comments.
> Based on the test results, you can add my test tags:
> 
> Tested-by: Leo Yan <leo.yan@arm.com>

Thanks! ;)

-- 
Sincerely,
Yeoreum Yun


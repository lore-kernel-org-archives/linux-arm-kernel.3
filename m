Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBADC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 16:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqUWVeEKCN0r5QDBKF9HRmARriXfJz9IZQEygptLzIg=; b=qDWEqEVej+WwRp2ZgyNqihfBuE
	B4tzN6wi/trw0vKMKPvHk9413C3ZlC+v2Qek1VX8bHbd+6/CJD5doFcTPQaajCt6g0oV8Q6FraGk7
	HtBKUe3nJ+LrRH1N7alQlbagvXBoFEBgtr5fnglgBlhCW9g/7KktgD2YIN5eYHA0m+W6ThNfmbEYk
	0kt4wYUbX5qv6zIFKlOE+xmhjiigKXbkasFMjSUS4mNMJc95Nu5dMN6QG4NNNQiB2DfWCl3TMyUlU
	0DzUH57lmFFispt/FjltNcpdw5dasrdRCc/gY8gb6riYpBvMPVHj5+kDvNfehImaOgT8eXenVHbcl
	ikssAwxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDeq-0000000G3I7-1w4k;
	Thu, 05 Jun 2025 16:41:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDcd-0000000G33Q-13wp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 16:39:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A744D113E;
	Thu,  5 Jun 2025 09:38:58 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5BAF3F673;
	Thu,  5 Jun 2025 09:39:15 -0700 (PDT)
Date: Thu, 5 Jun 2025 17:39:11 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 00/11] CoreSight: Refactor CPU PM and hotplug
Message-ID: <20250605163911.GF8020@e132581.arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
 <29c83380-6df4-4c92-a2ab-6af994afea04@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29c83380-6df4-4c92-a2ab-6af994afea04@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_093919_338895_4D379736 
X-CRM114-Status: GOOD (  14.24  )
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

On Thu, Jun 05, 2025 at 02:50:41PM +0100, James Clark wrote:

[...]

> Hi Leo,
> 
> I ran this stress test on Juno by enabling and disabling concurrently with
> no sleeps:
> 
>   # echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
>   # while true; do \
>         echo 0 > /sys/devices/system/cpu/cpu2/online; \
>         echo 1 > /sys/devices/system/cpu/cpu2/online; \
>         done &
> 
>   # while true; do \
>         echo 1 > /sys/bus/coresight/devices/etm2/enable_source; \
>         echo 0 > /sys/bus/coresight/devices/etm2/enable_source; \
>         done &
> 
> I get lots of these:
> 
>   coresight tmc_etr0: timeout while waiting for TMC to be Ready
>   coresight tmc_etr0: Failed to enable : TMC not ready
> 
> And then even after disabling the source and sink the Perf tests don't pass
> anymore:
> 
>   # perf test -F -vvv "arm coresight trace"
>   --- start ---
>   Recording trace (only user mode) with path: CPU0 => tmc_etf0
>   Looking at perf.data file for dumping branch samples:
>   CoreSight path testing (CPU0 -> tmc_etf0): FAIL
> 
> I suppose it's possible this isn't entirely related to your changes, and I
> know we've seen some of those timeout issues before. But it's probably worth
> investigating.

Thanks a lot for testing!  I will look into the issue.

Leo


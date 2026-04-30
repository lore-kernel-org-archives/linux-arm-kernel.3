Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F673CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 16:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nT9VYwAZs4ltJMRYFKxWt+mW9C34b5if1UyYfP9fQ2k=; b=1tl9oxwrroRodyy4jDjfGYAN5R
	IAnyvT96M1bB0j4Uu1joViMVlzoPeSrbvcdOk3oRcb7PiRxt8EfMZtXZhys9xWKcA2p7+4+cY4nHP
	EMX6QpttDePPrW3z1MrqHH3VXnw6R1qjv8UdDFbY0k6l634xIWhsAgi5UmF59T5pV9JkZosvgZz5A
	wq1Kqh+OprufRuqoFdl/x2Sb5ZDyU0iYC5RvtHWG9HMpuQdGCqD3xCcKoJuFG/hGgtUkw/bWOeiFz
	bcoraF0+0FeKn9xyfdAo1K42ALk8BmH9ne0Ryd9J3kNNav8r7olVIUwE4A9gY+Eds68hpGkXz3yOv
	4i4JquTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUej-00000005llZ-0quI;
	Thu, 30 Apr 2026 16:54:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUeg-00000005lkx-1xNt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 16:54:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51C3F359B;
	Thu, 30 Apr 2026 09:54:15 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EA6D3F62B;
	Thu, 30 Apr 2026 09:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777568060; bh=0aE0e+1TBdahKKaq6tlLRD0Vy8TxtU1tIj610UdY+qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJmz3Z+nrMApGsUU4ly8Mx9Doad2qelaDVd0yRedu6aLq4CRvli4offMkfO6v6Twj
	 22VN4JFBi0pBI0Sn1bUMiQSQL1YTBIYL7EBJtvSUfDKGlonOZAGWH6LdAGOGx/jnq8
	 F3371MTuoxQiKYdnMQb0PahR5vN0FBuFp0N2cKnI=
Date: Thu, 30 Apr 2026 17:54:18 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] coresight: ete: Always save state on power down
Message-ID: <20260430165418.GF16537@e132581.arm.com>
References: <20260428-james-cs-ete-pm_save_enable-v1-0-c7a90ca6f43b@linaro.org>
 <20260428-james-cs-ete-pm_save_enable-v1-1-c7a90ca6f43b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-james-cs-ete-pm_save_enable-v1-1-c7a90ca6f43b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_095426_552595_273460A0 
X-CRM114-Status: GOOD (  16.79  )
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

On Tue, Apr 28, 2026 at 01:18:11PM +0100, James Clark wrote:
> ETE registers are always system registers so it's highly unlikely there
> will be an implementation that preserves them on CPU power down. Also
> the ETE DT binding never documented
> "arm,coresight-loses-context-with-cpu" so nobody would have legitimately
> been able to use that binding to fix it.
> 
> Fix it by hard coding the setting for ETE and add a warning if the user
> tried to use the module parameter. Don't add a warning if
> loses-context-with-cpu is present in the DT as it's not a documented
> binding anyway. etm4_init_pm_save() needs to happen after drvdata is
> initialised so etm4x_is_ete() can be called.
> 
> This fixes the following error when using Coresight with ACPI on the FVP
> which supports CPU PM:
> 
>   coresight ete0: External agent took claim tag
>   WARNING: drivers/hwtracing/coresight/coresight-core.c:248 at coresight_disclaim_device_unlocked+0xe0/0xe8, CPU#0: perf/117
> 
> Fixes: 35e1c9163e02 ("coresight: ete: Add support for ETE tracing")
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

